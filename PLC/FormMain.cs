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

        public FormMain(Conexion conexion)
        {
            InitializeComponent();
            this.conexion = conexion;
        }

        private void btnConectar_Click(object sender, EventArgs e)
        {
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

            cargarItemsConfiguracion();
            cargarGruposItems();

            timer = new System.Timers.Timer();            
            timer.Interval = 1000;
            timer.Enabled = true;
            timer.Elapsed += new ElapsedEventHandler(procesar);
                
            lblEstado.Text = "Conectado a servidor OPC";
        }

        #region Carga Inicial
        private void cargarItemsConfiguracion()
        {
            this.OpcGroupControl = servidorOPC.AddGroup(new ConfigDAO(conexion.getConexion()).getGrupoConfiguracion().nombre, true, 900);
            OPCItemDef[] itemsOPCControl = new OPCItemDef[3];

            //Agregar MP
            LogOPCItem itemControlMP = configuracion.itemMemoryPointer;
            itemsOPCControl[(int)ConfigDAO.IdItemsControl.MP - 1] = new OPCItemDef(itemControlMP.nombre, true, (int)ConfigDAO.IdItemsControl.MP + 1000, System.Runtime.InteropServices.VarEnum.VT_EMPTY);

            //Agregar OL
            LogOPCItem itemControlOL = configuracion.itemOnline;
            itemsOPCControl[(int)ConfigDAO.IdItemsControl.OL - 1] = new OPCItemDef(itemControlOL.nombre, true, (int)ConfigDAO.IdItemsControl.OL + 1000, System.Runtime.InteropServices.VarEnum.VT_EMPTY);

            //Agregar RE
            LogOPCItem itemControlRE = configuracion.itemReadEnable;
            itemsOPCControl[(int)ConfigDAO.IdItemsControl.RE - 1] = new OPCItemDef(itemControlRE.nombre, true, (int)ConfigDAO.IdItemsControl.RE + 1000, System.Runtime.InteropServices.VarEnum.VT_EMPTY);

            this.OpcGroupControl.AddItems(itemsOPCControl, out OPCItemResultsControl);
        }

        private void cargarGruposItems()
        {
            List<LogOPCGrupo> grupos = new LogOPCGrupoDAO(conexion.getConexion()).getAll();
            this.OpcGroups = new OpcGroup[grupos.Count];

            int nroGrupo = 0;
            OPCItemResults = new OPCItemResult[grupos.Count][];
            foreach (LogOPCGrupo grupo in grupos)
            {
                this.OpcGroups[nroGrupo] = servidorOPC.AddGroup(grupo.nombre, true, 900);
                this.OpcGroups[nroGrupo].SetEnable(true);
                this.OpcGroups[nroGrupo].Active = true;

                List<LogOPCItem> items = new LogOPCItemDAO(conexion.getConexion()).getItemsByGrupo(grupo);
                OPCItemDef[] itemsOPC = new OPCItemDef[items.Count];

                int nroItem = 0;
                foreach (LogOPCItem item in items)
                {
                    itemsOPC[nroItem++] = new OPCItemDef(item.nombre, true, item.Id, System.Runtime.InteropServices.VarEnum.VT_EMPTY);
                }
                
                if (items.Count > 0)
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
                    List<LogOPCItem> itemsProceso = leerBloque(mp);
                    guardarProceso(itemsProceso);
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

        private void guardarProceso(List<LogOPCItem> items)
        {
            int idProceso = new LogHeaderDAO(conexion.getConexion()).saveLogHeader();
            new LogRowDAO(conexion.getConexion()).guradarProceso(idProceso, items);
        }

        private List<LogOPCItem> leerBloque(int idBloque)
        {
            int nBloque = idBloque;
            idBloque--;
            OpcGroup grupoBloque = this.OpcGroups[idBloque];
            List<LogOPCItem> itemsBloque = new LogOPCItemDAO(conexion.getConexion()).getItemsByBloque(nBloque);

            int[] arrHSrv = new int[OPCItemResults[idBloque].Length];

            OPCItemState[] arrayEstado = new OPCItemState[OPCItemResults[idBloque].Length];
            for (int i = 0; i < OPCItemResults[idBloque].Length; i++)
            {
                arrHSrv[i] = OPCItemResults[idBloque][i].HandleServer;                
            }

            OpcGroups[idBloque].SyncRead(OPCDATASOURCE.OPC_DS_DEVICE, arrHSrv, out arrayEstado);

            foreach (LogOPCItem item in itemsBloque)
            {
                for (int i = 0; i < arrayEstado.Length; i++)
                {
                    if (arrayEstado[i].HandleClient == item.Id)
                        item.valor = arrayEstado[i].DataValue == null ? "BAD" : arrayEstado[i].DataValue.ToString();
                }
            }

            return itemsBloque;
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
                    case (int)ConfigDAO.IdItemsControl.MP + 1000:
                        updateMemoryPos(dataValueString);
                        configuracion.getItemMemoryPointer().valor = dataValueString;
                        break;
                    case (int)ConfigDAO.IdItemsControl.OL + 1000:
                        updateOnline(dataValueString);
                        configuracion.getItemOnLine().valor = dataValueString;
                        break;
                    case (int)ConfigDAO.IdItemsControl.RE + 1000:
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
