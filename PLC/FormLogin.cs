using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Threading;
using PLC.Helper;
using PLC.Configuration;

namespace PLC
{
    public partial class FormLogin : Form
    {
        private readonly Conexion conexion;

        public delegate void LoginHandler(Conexion conexion);

        public event LoginHandler login;

        public FormLogin()
        {
            InitializeComponent();
            txtPassword.KeyUp += new KeyEventHandler(txtPassword_KeyUp);

            ConfigDB cfgDB = ConfigurationHelper.GetConfigDatabase();
        }

        private void txtPassword_KeyUp(object sender, System.Windows.Forms.KeyEventArgs e)
        {
            // Determine whether the key entered is the F1 key. Display help if it is. 
            if (e.KeyCode == Keys.Enter)
            {
                // Display a pop-up help topic to assist the user.
                this.btnConectar_Click(sender, e);
            }
        }

        private void btnConectar_Click(object sender, EventArgs e)
        {
            if (GetUserBacgroundWorker.IsBusy)
                return;
            GetUserBacgroundWorker.RunWorkerAsync();
            prgBar.Visible = true;
            BackgroundWorker Worker = new BackgroundWorker();
            Worker.DoWork += new DoWorkEventHandler(this.UpdateProgressBar);
            Worker.RunWorkerAsync("Validando...");
        }

        private void UpdateProgressBar(object sender, DoWorkEventArgs e)
        {
            var text = e.Argument as string;

            while (GetUserBacgroundWorker.IsBusy)
            {
                progressBarUpdater(text);
                Thread.Sleep(100);
            }
        }

        private void getConexion(object sender, DoWorkEventArgs e)
        {
            Conexion cnx = new Conexion(txtHost.Text, txtPuerto.Text, txtDB.Text, txtUsuario.Text, txtPassword.Text);
            if (cnx.getConexion() == null)
                 e.Result = "No se ha podido conectar con la base de datos";
            else
                e.Result = cnx;
        }

        private void progressBarUpdater(string text)
        {
            if (prgBar.InvokeRequired)
            {
                prgBar.Invoke(new Action<string>(progressBarUpdater), new Object[] { text });
            }
            else
            {
                prgBar.Invalidate();
                prgBar.Refresh();
                prgBar.Update();
                prgBar.Value = 0;
                var gr = prgBar.CreateGraphics();
                gr.DrawString(text, SystemFonts.DefaultFont, Brushes.Blue, new PointF(prgBar.Width / 2 - (gr.MeasureString(text, SystemFonts.DefaultFont).Width / 2.0F),
                    prgBar.Height / 2 - (gr.MeasureString(text, SystemFonts.DefaultFont).Height / 2.0F)));

            }
        }

        private void WorkDone(object sender, RunWorkerCompletedEventArgs e)
        {
            if (e.Result != null && e.Result is string)
            {
                prgBar.Visible = false;
                MessageBox.Show(this, e.Result as string, "Error al iniciar la aplicación", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            if (e.Result != null && e.Result is Conexion)
            {
                login(e.Result as Conexion);
                Close();
            }
        }
    }
}
