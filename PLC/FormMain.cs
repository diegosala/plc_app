using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Collections;

using MySql.Data;
using MySql.Data.MySqlClient;

using OPC.Common;
using OPC.Data.Interface;
using OPC.Data;

using PLC.Config;
using PLC.Domain;

using System.Timers;
using PLC.DAO;
using log4net;

namespace PLC
{
    public partial class FormMain : Form
    {
        private OpcServer servidorOPC;
        
        private OpcGroup[] OpcGroups;
        private OPCItemResult[][] OPCItemResults;

        private OpcGroup OpcGroupControl;
        private OPCItemResult[] OPCItemResultsControl;

        private Conexion conexion;

        private ControlConfig configuracion;        

        private System.Timers.Timer timer;

        private const int OFFSET_ITEMS_INICIO = 500;
        private const int OFFSET_ITEMS_ETAPA = 1000;
        private const int OFFSET_ITEMS_VELOCIDAD = 2000;
        private const int OFFSET_ITEMS_CONTROL = 5000;
        private const int OFFSET_ITEMS_RETENCION = 6500;
        private const int OFFSET_ITEMS_ESTADO = 8000;

        protected static readonly ILog log = LogManager.GetLogger("log");

        public FormMain(Conexion conexion)
        {
            InitializeComponent();
            this.conexion = conexion;
        }

        private void btnConectar_Click(object sender, EventArgs e)
        {
            log4net.Config.XmlConfigurator.Configure();
            ConfigDAO configReader = new ConfigDAO(conexion.getConexion());            
            try
            {
                SERVERSTATUS estadoServidor;
                servidorOPC = new OpcServer();
                servidorOPC.Connect(txtServidor.Text);
                servidorOPC.GetStatus(out estadoServidor);

                if (estadoServidor.eServerState == OPCSERVERSTATE.OPC_STATUS_RUNNING)
                {
                    btnConectar.Enabled = false;
                    lblEstado.Text = "Conectando a servidor OPC...";


                }
                else
                {
                    throw new Exception("Error");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "No se pudo conectar al servidor OPC", MessageBoxButtons.OK, MessageBoxIcon.Error);
                btnConectar.Enabled = true;                
                lblEstado.Text = "Inactivo";
                return;
            }
            
            try
            {
                lblEstado.Text = "Cargando configuración...";
                configuracion = new ControlConfig();                
                configuracion.setItemMemoryPointer(configReader.getItemConfiguracion(ConfigDAO.IdItemsControl.MP, conexion.getConexion()));
                configuracion.setItemOnLine(configReader.getItemConfiguracion(ConfigDAO.IdItemsControl.OL, conexion.getConexion()));
                configuracion.setItemReadEnable(configReader.getItemConfiguracion(ConfigDAO.IdItemsControl.RE, conexion.getConexion()));
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "No se pudo cargar la configuración", MessageBoxButtons.OK, MessageBoxIcon.Error);
                btnConectar.Enabled = true;
                lblEstado.Text = "Inactivo";
                return;
            }

            try
            {

                cargarItemsControl();
                cargarItemsProceso();

                timer = new System.Timers.Timer();
                timer.Interval = 1000;
                timer.Enabled = true;
                timer.Elapsed += new ElapsedEventHandler(procesar);

            }
            catch (Exception ex)
            {
                log.Error("Error: " + ex.Message + "\nStack: " + ex.StackTrace);
            }
            lblEstado.Text = "Conectado a servidor OPC";
        }

        #region Carga Inicial
        private void cargarItemsControl()
        {
            this.OpcGroupControl = servidorOPC.AddGroup(new ConfigDAO(conexion.getConexion()).getGrupoConfiguracion().nombre, true, 900);
            OPCItemDef[] itemsOPCControl = new OPCItemDef[3];

            //Agregar MP
            LogOPCItem itemControlMP = configuracion.itemMemoryPointer;
            itemsOPCControl[(int)ConfigDAO.IdItemsControl.MP - 1] = new OPCItemDef(itemControlMP.nombre, true, (int)ConfigDAO.IdItemsControl.MP + OFFSET_ITEMS_CONTROL, System.Runtime.InteropServices.VarEnum.VT_EMPTY);

            //Agregar OL
            LogOPCItem itemControlOL = configuracion.itemOnline;
            itemsOPCControl[(int)ConfigDAO.IdItemsControl.OL - 1] = new OPCItemDef(itemControlOL.nombre, true, (int)ConfigDAO.IdItemsControl.OL + OFFSET_ITEMS_CONTROL, System.Runtime.InteropServices.VarEnum.VT_EMPTY);

            //Agregar RE
            LogOPCItem itemControlRE = configuracion.itemReadEnable;
            itemsOPCControl[(int)ConfigDAO.IdItemsControl.RE - 1] = new OPCItemDef(itemControlRE.nombre, true, (int)ConfigDAO.IdItemsControl.RE + OFFSET_ITEMS_CONTROL, System.Runtime.InteropServices.VarEnum.VT_EMPTY);

            this.OpcGroupControl.AddItems(itemsOPCControl, out OPCItemResultsControl);
        }

        private void cargarItemsProceso()
        {
            List<LogOPCItem> itemsCabecera;
            List<LogOPCItem> itemsInicio;
            List<LogOPCItem> itemsEtapas;
            List<LogOPCItem> itemsVelocidad;
            List<LogOPCItem> itemsRetencion;
            List<LogOPCItem> itemsEstado;

            List<LogOPCGrupo> bloques = new LogOPCGrupoDAO(conexion.getConexion()).getAll();
            this.OpcGroups = new OpcGroup[bloques.Count];

            int nroGrupo = 0;
            OPCItemResults = new OPCItemResult[bloques.Count][];

            foreach (LogOPCGrupo bloque in bloques)
            {                            
                // Agrego el grupo
                this.OpcGroups[nroGrupo] = servidorOPC.AddGroup(bloque.nombre, true, 900);
                this.OpcGroups[nroGrupo].SetEnable(true);
                this.OpcGroups[nroGrupo].Active = true;

                // Cargo items para la cabecera
                itemsCabecera = new ConfigDAO(conexion.getConexion()).getItemsCabeceraForBloque(bloque.Id);

                // Cargo items para el inicio
                Inicio inicio = new ConfigDAO(conexion.getConexion()).getInicioForBloque(bloque.Id);
                
                itemsInicio = new List<LogOPCItem>();
                itemsInicio.Add(inicio.itemAnioInicio);
                itemsInicio.Add(inicio.itemMesInicio);
                itemsInicio.Add(inicio.itemDiaInicio);
                itemsInicio.Add(inicio.itemHoraInicio);
                itemsInicio.Add(inicio.itemMinInicio);
                itemsInicio.Add(inicio.itemSegInicio);

                // Cargo items para las etapas
                List<Etapa> etapas = new ConfigDAO(conexion.getConexion()).getAllEtapasForBloque(bloque.Id);

                itemsEtapas = new List<LogOPCItem>();
                foreach (Etapa etapa in etapas)
                {
                    itemsEtapas.Add(etapa.itemAnioFin);
                    itemsEtapas.Add(etapa.itemMesFin);
                    itemsEtapas.Add(etapa.itemDiaFin);
                    itemsEtapas.Add(etapa.itemHoraFin);
                    itemsEtapas.Add(etapa.itemMinFin);
                    itemsEtapas.Add(etapa.itemSegFin);
                }

                // Cargo items para las velocidades
                List<Velocidad> velocidades = new ConfigDAO(conexion.getConexion()).getAllVelocidadesForBloque(bloque.Id);

                itemsVelocidad = new List<LogOPCItem>();
                foreach (Velocidad velocidad in velocidades)
                {
                    itemsVelocidad.Add(velocidad.item);
                }

                // Cargo items para las retenciones
                List<Retencion> retenciones = new ConfigDAO(conexion.getConexion()).getAllRetencionesForBloque(bloque.Id);
               
                itemsRetencion = new List<LogOPCItem>();
                foreach (Retencion retencion in retenciones)
                {
                    itemsRetencion.Add(retencion.item);
                }

                // Cargo items para los estados
                Estado estado = new ConfigDAO(conexion.getConexion()).getEstadoForBloque(bloque.Id);

                itemsEstado = new List<LogOPCItem>();
                itemsEstado.Add(estado.item);

                // Genero arreglo de items OPC y agrego los items de cabecera y etapas
                OPCItemDef[] itemsOPC = new OPCItemDef[itemsCabecera.Count + itemsInicio.Count + itemsEtapas.Count +  itemsVelocidad.Count + itemsEstado.Count];

                int nroItem = 0;
                foreach (LogOPCItem item in itemsCabecera)
                    itemsOPC[nroItem++] = new OPCItemDef(item.nombre, true, item.Id, System.Runtime.InteropServices.VarEnum.VT_EMPTY);

                foreach (LogOPCItem item in itemsInicio)
                    itemsOPC[nroItem++] = new OPCItemDef(item.nombre, true, item.Id + OFFSET_ITEMS_INICIO, System.Runtime.InteropServices.VarEnum.VT_EMPTY);

                foreach (LogOPCItem item in itemsEtapas)
                    itemsOPC[nroItem++] = new OPCItemDef(item.nombre, true, item.Id + OFFSET_ITEMS_ETAPA, System.Runtime.InteropServices.VarEnum.VT_EMPTY);

                foreach (LogOPCItem item in itemsVelocidad)
                    itemsOPC[nroItem++] = new OPCItemDef(item.nombre, true, item.Id + OFFSET_ITEMS_VELOCIDAD, System.Runtime.InteropServices.VarEnum.VT_EMPTY);

                foreach (LogOPCItem item in itemsRetencion)
                    itemsOPC[nroItem++] = new OPCItemDef(item.nombre, true, item.Id + OFFSET_ITEMS_RETENCION, System.Runtime.InteropServices.VarEnum.VT_EMPTY);

                foreach (LogOPCItem item in itemsEstado)
                    itemsOPC[nroItem++] = new OPCItemDef(item.nombre, true, item.Id + OFFSET_ITEMS_ESTADO, System.Runtime.InteropServices.VarEnum.VT_EMPTY);
                
                // Agrego los items OPC al grupo OPC
                if ((itemsCabecera.Count > 0) || (itemsInicio.Count > 0) || (itemsEtapas.Count > 0) || (itemsVelocidad.Count > 0) || (itemsRetencion.Count > 0) || (itemsEstado.Count > 0))
                    this.OpcGroups[nroGrupo].AddItems(itemsOPC, out OPCItemResults[nroGrupo]);

                nroGrupo++;
            }
        }       
        #endregion  
        
        #region Algoritmo principal
        private void procesar(object source, ElapsedEventArgs e)
        {
            timer.Enabled = false;
            leerValoresControl();

            // Setear variable ON-LINE cada segundo
            setOnline();

            // Si RE = 0
            if (configuracion.getItemReadEnable().valor == "False")
            {
                timer.Enabled = true;
                return;
            }

            // Si RE = 1
            if (configuracion.getItemReadEnable().valor == "True")                        
            {
                // Consultar MP, si es diferente de 0
                int mp = int.Parse(configuracion.getItemMemoryPointer().valor);                                
                if (mp > 0 && mp <= 5)
                {
                    Proceso proceso = leerBloque(mp);
                    if (new ProcesoDAO(conexion.getConexion()).save(proceso))
                        decrementarMP();
                }
            }

            timer.Enabled = true;
        }

        private void setOnline()
        {
            int[] arrHSrvControl = new int[1];            
            arrHSrvControl[0] = OPCItemResultsControl[0].HandleServer;

            object[] valor = new object[1];
            valor[0] = true;

            int[] arrayEstadoControl;
            OpcGroupControl.SyncWrite(arrHSrvControl, valor, out arrayEstadoControl);            
        }

        private void decrementarMP()
        {
            int[] arrHSrvControl = new int[1];
            arrHSrvControl[0] = OPCItemResultsControl[2].HandleServer;

            object[] valor = new object[1];
            valor[0] = int.Parse(configuracion.getItemMemoryPointer().valor) - 1;

            int[] arrayEstadoControl;
            OpcGroupControl.SyncWrite(arrHSrvControl, valor, out arrayEstadoControl);
        }
        

        private Proceso leerBloque(int idBloque)
        {
            int nBloque = idBloque;
            idBloque--;

            // El proceso
            Proceso p = new Proceso();
            
            // Cargo el grupo a leer
            OpcGroup grupoBloque = this.OpcGroups[idBloque];            

            int[] arrHSrv = new int[OPCItemResults[idBloque].Length];

            // Traigo todos los handles del servidor para los items en cuestion
            OPCItemState[] arrayEstado = new OPCItemState[OPCItemResults[idBloque].Length];
            for (int i = 0; i < OPCItemResults[idBloque].Length; i++)
            {
                arrHSrv[i] = OPCItemResults[idBloque][i].HandleServer;                
            }

            OpcGroups[idBloque].SyncRead(OPCDATASOURCE.OPC_DS_DEVICE, arrHSrv, out arrayEstado);
            Dictionary<int, String> valoresItems = new Dictionary<int, String>();
            
            // Guardo los valores de todos los items leidos para el bloque
            for (int i = 0; i < arrayEstado.Length; i++)            
                valoresItems[arrayEstado[i].HandleClient] = arrayEstado[i].DataValue == null ? "BAD" : arrayEstado[i].DataValue.ToString();

            // Cargo los valores en el proceso            
            List<LogOPCItem> cabecera = new ConfigDAO(conexion.getConexion()).getItemsCabeceraForBloque(nBloque);
            Inicio inicio = new ConfigDAO(conexion.getConexion()).getInicioForBloque(nBloque);
            List<Etapa> etapas = new ConfigDAO(conexion.getConexion()).getAllEtapasForBloque(nBloque);
            List<Velocidad> velocidades = new ConfigDAO(conexion.getConexion()).getAllVelocidadesForBloque(nBloque);
            List<Retencion> retenciones = new ConfigDAO(conexion.getConexion()).getAllRetencionesForBloque(nBloque);
            Estado estado = new ConfigDAO(conexion.getConexion()).getEstadoForBloque(nBloque);

            // Cargo cabecera
            for (int i = 1; i <= 3; i++)
            {
                String v = valoresItems[i];
                switch (i)
                {
                    case 1:
                        p.producto = v;
                        break;
                    case 2:
                        p.lote = v;
                        break;
                    case 3:
                        p.operario = v;
                        break; 
                }

            }

            inicio.itemAnioInicio.valor = valoresItems[inicio.itemAnioInicio.Id + OFFSET_ITEMS_INICIO];
            inicio.itemMesInicio.valor = valoresItems[inicio.itemMesInicio.Id + OFFSET_ITEMS_INICIO];
            inicio.itemDiaInicio.valor = valoresItems[inicio.itemDiaInicio.Id + OFFSET_ITEMS_INICIO];
            inicio.itemHoraInicio.valor = valoresItems[inicio.itemHoraInicio.Id + OFFSET_ITEMS_INICIO];
            inicio.itemMinInicio.valor = valoresItems[inicio.itemMinInicio.Id + OFFSET_ITEMS_INICIO];
            inicio.itemSegInicio.valor = valoresItems[inicio.itemSegInicio.Id + OFFSET_ITEMS_INICIO];

            // Cargo etapas
            foreach (Etapa etapa in etapas)
            {
                etapa.itemAnioFin.valor = valoresItems[etapa.itemAnioFin.Id + OFFSET_ITEMS_ETAPA];
                etapa.itemMesFin.valor = valoresItems[etapa.itemMesFin.Id + OFFSET_ITEMS_ETAPA];
                etapa.itemDiaFin.valor = valoresItems[etapa.itemDiaFin.Id + OFFSET_ITEMS_ETAPA];
                etapa.itemHoraFin.valor = valoresItems[etapa.itemHoraFin.Id + OFFSET_ITEMS_ETAPA];
                etapa.itemMinFin.valor = valoresItems[etapa.itemMinFin.Id + OFFSET_ITEMS_ETAPA];
                etapa.itemSegFin.valor = valoresItems[etapa.itemSegFin.Id + OFFSET_ITEMS_ETAPA];
            }

            // Cargo velocidades
            foreach (Velocidad velocidad in velocidades)
            {
                velocidad.item.valor = valoresItems[velocidad.item.Id + OFFSET_ITEMS_VELOCIDAD];
            }

            // Cargo retenciones
            foreach (Retencion retencion in retenciones)
            {
                retencion.item.valor = valoresItems[retencion.item.Id + OFFSET_ITEMS_RETENCION];
            }

            estado.item.valor = valoresItems[estado.item.Id + OFFSET_ITEMS_ESTADO];
            
            p.etapas = etapas;
            p.inicio = inicio;
            p.velocidades = velocidades;
            p.retenciones = retenciones;
            p.estado = estado;

            return p;
        }

        private void leerValoresControl()
        {
            int[] arrHSrvControl = new int[3];
            for (int i = 0; i < 3; i++)
            {
                arrHSrvControl[i] = OPCItemResultsControl[i].HandleServer;
            }

            OPCItemState[] arrayEstadoControl;
            OpcGroupControl.SyncRead(OPCDATASOURCE.OPC_DS_DEVICE, arrHSrvControl, out arrayEstadoControl);

            int estadoControlCont = 0;
            for (int i = 0; i < 3; i++)
            {
                object dataValue = arrayEstadoControl[estadoControlCont].DataValue;
                String dataValueString = dataValue == null ? "BAD" : dataValue.ToString();
                switch (arrayEstadoControl[estadoControlCont].HandleClient)
                {
                    case (int)ConfigDAO.IdItemsControl.MP + OFFSET_ITEMS_CONTROL:
                        updateMemoryPos(dataValueString);
                        configuracion.getItemMemoryPointer().valor = dataValueString;
                        break;
                    case (int)ConfigDAO.IdItemsControl.OL + OFFSET_ITEMS_CONTROL:
                        updateOnline(dataValueString);
                        configuracion.getItemOnLine().valor = dataValueString;
                        break;
                    case (int)ConfigDAO.IdItemsControl.RE + OFFSET_ITEMS_CONTROL:
                        updateReadEnable(dataValueString);
                        configuracion.getItemReadEnable().valor = dataValueString;
                        break;
                }
                estadoControlCont++;
            }
        } 
        #endregion

        #region GUI
        private void updateMemoryPos(String texto)
        {
            if (InvokeRequired)
            {
                Invoke(new Action<string>(updateMemoryPos), new Object[] { texto });

            }
            else
            {
                txtMemoryPos.Text = texto;
            }
        }

        private void updateReadEnable(String texto)
        {
            if (InvokeRequired)
            {
                Invoke(new Action<string>(updateReadEnable), new Object[] { texto });

            }
            else
            {
                txtReadEnable.Text = texto;
            }
        }

        private void updateOnline(String texto)
        {
            if (InvokeRequired)
            {
                Invoke(new Action<string>(updateOnline), new Object[] { texto });

            }
            else
            {
                txtOnLine.Text = texto;
            }
        } 
        #endregion

    }
}
