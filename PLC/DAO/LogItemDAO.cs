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

        public LogItemDAO(MySqlConnection conexion)
        {
            this.conexion = conexion;
        }

        public Boolean saveLoggedItem(int idLog, LogOPCItem item, String valor)
        {
            MySqlCommand cmd = new MySqlCommand("INSERT INTO log_row(id_header, id_variable, valor) VALUES (@idHeader, @idVariable, @Valor)", conexion);
            cmd.Parameters.AddWithValue("@idHeader", idLog);
            cmd.Parameters.AddWithValue("@idVariable", item.Id);
            cmd.Parameters.AddWithValue("@Valor", valor);
            return cmd.ExecuteNonQuery() == 1;
        }

        public LogOPCItem getLogItemControl(int idItem)
        {
            LogOPCItem item = new LogOPCItem();
            MySqlCommand query = new MySqlCommand("SELECT * FROM config_ctrl WHERE id = " + idItem.ToString(), conexion);
            MySqlDataReader reader = query.ExecuteReader();

            try
            {
                while (reader.Read())
                {
                    item = new LogOPCItem(int.Parse(reader[0].ToString()));
                    item.nombre = reader[1].ToString();
                }

                return item;
            }
            finally
            {
                reader.Close();
            }
        }
    }
}
