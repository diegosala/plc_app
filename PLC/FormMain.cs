using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

using MySql.Data;
using MySql.Data.MySqlClient;

using OPC.Common;
using OPC.Data.Interface;
using OPC.Data;
using System.Collections;

using PLC.Config;
using PLC.Domain;

namespace PLC
{
    public partial class FormMain : Form
    {
        private OpcServer servidor;
        private OPCItemResult[] itemResults;
        private OpcGroup gruposOPC;

        private Conexion conexion;

        private LogConfig configuracion;
        private ConfigReader configReader;

        public FormMain(Conexion conexion)
        {
            InitializeComponent();
            this.conexion = conexion;
        }

        private void btnEmpezar_Click(object sender, EventArgs e)
        {
            /*
            EstadoItem estado = new EstadoItem(leerValor());
            txtUltimaLectura.Text = DateTime.Now.ToString("MMMM dd, yyyy H:mm:ss");
 
            if (estado.getCalidadItem() != 192)
            {
                txtValor.Text = "MAL";
                return;
            }
            
            txtValor.Text = estado.getTextoEstadoItem();
            */
            MySqlConnection conn = new MySqlConnection("server=localhost;user=root;database=plc;port=3306;password=;");

            conn.Open();

            MySqlCommand cmd = new MySqlCommand("INSERT INTO log_table (data) VALUES (@VariableData)", conn);
            cmd.Parameters.AddWithValue("@VariableData", txtValor.Text);
            cmd.ExecuteNonQuery();


            conn.Close();
        }

        private void btnConectar_Click(object sender, EventArgs e)
        {            
            try
            {
                servidor = new OpcServer();
                servidor.Connect(txtServidor.Text);

                btnConectar.Enabled = false;                
                btnEmpezar.Enabled = false;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "No se pudo conectar al servidor OPC");
                btnConectar.Enabled = true;                
                btnEmpezar.Enabled = false;
                return;
            }

            try
            {
                configReader = new ConfigReader();
                configuracion.setGrupos(configReader.getGrupos(conexion.getConexion()));
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "No se pudo cargar la configuración");
                btnConectar.Enabled = true;
                btnEmpezar.Enabled = false;
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
                    itemsOPC[nroItem++] = new OPCItemDef(item.nombre, true, 1234, System.Runtime.InteropServices.VarEnum.VT_EMPTY);                    
                }

                gruposOPC.AddItems(itemsOPC, out itemResults);
            }
        }

        private HashSet<OPCItemState[]> leerValor()
        {
            HashSet<OPCItemState[]> estados = new HashSet<OPCItemState[]>();

            int[] arrHSrv = new int[itemResults.Length];

            for (int i = 0; i < itemResults.Length; i++)
            {
                arrHSrv[i] = itemResults[i].HandleServer;
                OPCItemState[] estado;

                gruposOPC.SyncRead(OPCDATASOURCE.OPC_DS_DEVICE, arrHSrv, out estado);
                estados.Add(estado);
            }

            return estados;
        }

    }
}
