using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;

namespace PLC
{
    static class Program
    {
        private static Conexion conexion;

        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);

            FormLogin login = new FormLogin();
            login.login += new FormLogin.LoginHandler(loginHandler);
            login.StartPosition = FormStartPosition.CenterScreen;
            Application.Run(login);
            if (conexion != null)
            {
                runApplication();
            }
            System.Environment.Exit(0);
        }

        private static void runApplication()
        {
            FormMain form1 = null;
            try
            {                
                form1 = new FormMain(conexion);
                form1.StartPosition = FormStartPosition.CenterScreen;
                Application.Run(form1);
            }
            catch (Exception exception)
            {
                if (form1 != null)
                    form1.Dispose();
                runApplication();
            }
        }


        private static void loginHandler(Conexion conexion)
        {
            Program.conexion = conexion;
        }
    }
}
