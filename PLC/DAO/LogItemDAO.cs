using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MySql.Data.MySqlClient;
using PLC.Domain;

namespace PLC.DAO
{
    class LogItemDAO
    {
        private MySqlConnection conexion;

        public LogItemDAO(Conexion conexion)
        {
            this.conexion = conexion.getConexion();
        }

        public Boolean saveLoggedItem(int idLog, LogOPCItem item, String valor)
        {
            MySqlCommand cmd = new MySqlCommand("INSERT INTO log_row(id_header, id_variable, valor) VALUES (@idHeader, @idVariable, @Valor)", conexion);
            cmd.Parameters.AddWithValue("@idHeader", idLog);
            cmd.Parameters.AddWithValue("@idVariable", item.Id);
            cmd.Parameters.AddWithValue("@Valor", valor);
            return cmd.ExecuteNonQuery() == 1;
        }
    }
}
