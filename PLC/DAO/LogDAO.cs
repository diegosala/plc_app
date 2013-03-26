using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MySql.Data.MySqlClient;

namespace PLC.DAO
{
    abstract class LogDAO
    {
        protected MySqlConnection conexion;

        protected LogDAO(MySqlConnection conexion)
        {
            this.conexion = conexion;
        }
    }
}
