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
            ConfigReader configReader = new ConfigReader();            
            try
            {
                servidor = new OpcServer();
                servidor.Connect(txtServidor.Text);

                btnConectar.Enabled = false;                                
                lblEstado.Text = "Conectando a servidor OPC...";
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

            timer = new System.Timers.Timer();            
            timer.Interval = 1000;
            timer.Enabled = true;
            timer.Elapsed += new ElapsedEventHandler(leerValores);
                
            lblEstado.Text = "Conectado a servidor OPC";
        }

        private void leerValores(object source, ElapsedEventArgs e)
        {
            timer.Enabled = false;
            HashSet<OPCItemState[]> estados = new HashSet<OPCItemState[]>();

            LogHeaderDAO daoHeader = new LogHeaderDAO(conexion);
            LogItemDAO daoItem = new LogItemDAO(conexion);
            int idHeader, estadoCont = 0;

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
