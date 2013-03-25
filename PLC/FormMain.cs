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
        private OpcServer servidor;
        private OPCItemResult[] itemResults;
        private OPCItemResult[] itemsControlResults;
        private OpcGroup gruposOPC;

        private Conexion conexion;

        private LogConfig configuracion;

        private System.Timers.Timer timer;

        public FormMain(Conexion conexion)
        {
            InitializeComponent();
            this.conexion = conexion;
        }

        private void btnConectar_Click(object sender, EventArgs e)
        {            
            ConfigDAO configReader = new ConfigDAO();            
            try
            {
                SERVERSTATUS estadoServidor;
                servidor = new OpcServer();
                servidor.Connect(txtServidor.Text);
                servidor.GetStatus(out estadoServidor);

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
                configuracion = new LogConfig();
                configuracion.setGrupos(configReader.getGrupos(conexion.getConexion()));         
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

            foreach (LogOPCGroup grupo in configuracion.getGrupos().Values) {
                gruposOPC = servidor.AddGroup(grupo.nombre, true, 900);
                OPCItemDef[] itemsOPC = new OPCItemDef[grupo.items.Count];
                
                int nroItem = 0;

                gruposOPC.SetEnable(true);
                gruposOPC.Active = true;
                
                foreach (LogOPCItem item in grupo.items)
                {
                    itemsOPC[nroItem++] = new OPCItemDef(item.nombre, true, item.Id, System.Runtime.InteropServices.VarEnum.VT_EMPTY);                    
                }

                gruposOPC.AddItems(itemsOPC, out itemResults);
            }

            OPCItemDef[] itemsControl = new OPCItemDef[3];

            //Agregar MP
            LogOPCItem itemControlMP = configuracion.itemMemoryPointer;            
            itemsControl[(int)ConfigDAO.IdItemsControl.MP - 1] = new OPCItemDef(itemControlMP.nombre, true, (int)ConfigDAO.IdItemsControl.MP + 1000, System.Runtime.InteropServices.VarEnum.VT_EMPTY);

            //Agregar OL
            LogOPCItem itemControlOL = configuracion.itemOnline;            
            itemsControl[(int)ConfigDAO.IdItemsControl.OL - 1] = new OPCItemDef(itemControlOL.nombre, true, (int)ConfigDAO.IdItemsControl.OL + 1000, System.Runtime.InteropServices.VarEnum.VT_EMPTY);

            //Agregar RE
            LogOPCItem itemControlRE = configuracion.itemReadEnable;            
            itemsControl[(int)ConfigDAO.IdItemsControl.RE - 1] = new OPCItemDef(itemControlRE.nombre, true, (int)ConfigDAO.IdItemsControl.RE + 1000, System.Runtime.InteropServices.VarEnum.VT_EMPTY);

            gruposOPC.AddItems(itemsControl, out itemsControlResults);

            timer = new System.Timers.Timer();            
            timer.Interval = 1000;
            timer.Enabled = true;
            timer.Elapsed += new ElapsedEventHandler(leerValores);
                
            lblEstado.Text = "Conectado a servidor OPC";
        }

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

        private void leerValores(object source, ElapsedEventArgs e)
        {
            timer.Enabled = false;
            HashSet<OPCItemState[]> estados = new HashSet<OPCItemState[]>();
            HashSet<OPCItemState[]> estadosControl = new HashSet<OPCItemState[]>();

            LogHeaderDAO daoHeader = new LogHeaderDAO(conexion.getConexion());
            LogItemDAO daoItem = new LogItemDAO(conexion.getConexion());
            int idHeader, estadoCont = 0, estadoControlCont = 0;

            int[] arrHSrvControl = new int[3];
            for (int i = 0; i < 3; i++)
            {
                arrHSrvControl[i] = itemsControlResults[i].HandleServer;                
            }
            
            OPCItemState[] arrayEstadoControl;
            gruposOPC.SyncRead(OPCDATASOURCE.OPC_DS_DEVICE, arrHSrvControl, out arrayEstadoControl);
            estadosControl.Add(arrayEstadoControl);

            for (estadoControlCont = 0; estadoControlCont < arrayEstadoControl.Length; estadoControlCont++)
            {
                switch (arrayEstadoControl[estadoControlCont].HandleClient)
                {
                    case (int)ConfigDAO.IdItemsControl.MP + 1000: updateMemoryPos(arrayEstadoControl[estadoControlCont].DataValue == null ? "BAD" : arrayEstadoControl[estadoControlCont].DataValue.ToString()); break;
                    case (int)ConfigDAO.IdItemsControl.OL + 1000: updateOnline(arrayEstadoControl[estadoControlCont].DataValue == null ? "BAD" : arrayEstadoControl[estadoControlCont].DataValue.ToString()); break;
                    case (int)ConfigDAO.IdItemsControl.RE + 1000: updateReadEnable(arrayEstadoControl[estadoControlCont].DataValue == null ? "BAD" : arrayEstadoControl[estadoControlCont].DataValue.ToString()); break;
                }
            }




            int[] arrHSrv = new int[itemResults.Length];

            for (int i = 0; i < itemResults.Length; i++)
            {
                arrHSrv[i] = itemResults[i].HandleServer;
                OPCItemState[] arrayEstado;

                gruposOPC.SyncRead(OPCDATASOURCE.OPC_DS_DEVICE, arrHSrv, out arrayEstado);
                estados.Add(arrayEstado);
            }

            if (estados.Count == 0)
            {
                timer.Enabled = true;
                return;
            }

            idHeader = daoHeader.saveLogHeader("Diego", "1234");

            if (idHeader == -1)
            {
                timer.Enabled = true;
                return;
            }
            
            foreach (OPCItemState[] estado in estados)
            {
                if (estado[estadoCont].Error == 0)
                {
                    daoItem.saveLoggedItem(idHeader, new LogOPCItem(estado[estadoCont].HandleClient), estado[estadoCont].DataValue == null ? "" : estado[estadoCont].DataValue.ToString());
                    estadoCont++;
                }
            }

            timer.Enabled = true;
        }

    }
}
