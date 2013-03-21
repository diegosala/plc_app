using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MySql.Data.MySqlClient;

namespace PLC.DAO
{
    class LogHeaderDAO
    {
        private MySqlConnection conexion;

        public LogHeaderDAO(Conexion conexion)
        {
            this.conexion = conexion.getConexion();
        }

        public int saveLogHeader(String nombre, String lote)
        {
            int idHeader = -1;

            MySqlCommand cmd = new MySqlCommand("INSERT INTO log_header(nombre, lote) VALUES (@Nombre, @Lote)", conexion);
            cmd.Parameters.AddWithValue("@Nombre", nombre);
            cmd.Parameters.AddWithValue("@Lote", lote);
            if (cmd.ExecuteNonQuery() != 1)
                return idHeader;

            MySqlCommand sql = new MySqlCommand("SELECT last_insert_id()", conexion);
            
            MySqlDataReader reader = sql.ExecuteReader();
            try
            {
                while (reader.Read())
                {
                    try
                    {
                        idHeader = int.Parse(reader[0].ToString());
                    }
                    catch
                    {
                        return -1;
                    }

                }
            }
            finally
            {
                reader.Close();
            }
            return idHeader;


        }
    }
}
