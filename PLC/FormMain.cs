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

namespace PLC
{
    public partial class FormMain : Form
    {
        private OpcServer servidor;
        private OpcGroup grupo;
        private OPCItemDef[] item;  
        private OPCItemResult[] itemResult;

        private Conexion conexion;

        public FormMain(Conexion conexion)
        {
            InitializeComponent();
            this.conexion = conexion;
        }

        private void btnEmpezar_Click(object sender, EventArgs e)
        {
            EstadoItem estado = new EstadoItem(leerValor());
            txtUltimaLectura.Text = DateTime.Now.ToString("MMMM dd, yyyy H:mm:ss");
 
            if (estado.getCalidadItem() != 192)
            {
                txtValor.Text = "MAL";
                return;
            }
            
            txtValor.Text = estado.getTextoEstadoItem();
            
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
                btnAgregarGrupo.Enabled = true;
                btnAgregarItem.Enabled = false;
                btnEmpezar.Enabled = false;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "No se pudo conectar al servidor OPC");
                btnConectar.Enabled = true;
                btnAgregarGrupo.Enabled = false;
                btnAgregarItem.Enabled = false;
                btnEmpezar.Enabled = false;
            }
        }

        private void btnAgregarGrupo_Click(object sender, EventArgs e)
        {
            try
            {
                grupo = servidor.AddGroup(txtGrupo.Text, false, 900);
                grupo.SetEnable(true);
                grupo.Active = true;
                item = new OPCItemDef[1];

                btnConectar.Enabled = false;
                btnAgregarGrupo.Enabled = false;
                btnAgregarItem.Enabled = true;
                btnEmpezar.Enabled = false;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "No se pudo agregar el grupo");
                btnConectar.Enabled = false;
                btnAgregarGrupo.Enabled = true;
                btnAgregarItem.Enabled = false;
                btnEmpezar.Enabled = false;
            }
        }

        private void btnAgregarItem_Click(object sender, EventArgs e)
        {
            try
            {
                item[0] = new OPCItemDef(txtItem.Text, true, 1234, System.Runtime.InteropServices.VarEnum.VT_EMPTY);
                grupo.AddItems(item, out itemResult);

                if (itemResult[0].Error != 0)
                    throw new Exception("Error " + itemResult[0].Error + " al agregar el item");

                btnConectar.Enabled = false;
                btnAgregarGrupo.Enabled = false;
                btnAgregarItem.Enabled = false;
                btnEmpezar.Enabled = true;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "No se pudo agregar el item");
                btnConectar.Enabled = false;
                btnAgregarGrupo.Enabled = false;
                btnAgregarItem.Enabled = true;
                btnEmpezar.Enabled = false;
            }
        }

        private OPCItemState leerValor()
        {
            int[] arrHSrv = new int[1];
            arrHSrv[0] = itemResult[0].HandleServer;
            OPCItemState[] estado;

            grupo.SyncRead(OPCDATASOURCE.OPC_DS_DEVICE, arrHSrv, out estado);

            return estado[0];
        }

    }
}
