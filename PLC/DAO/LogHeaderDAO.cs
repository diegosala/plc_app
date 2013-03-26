using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MySql.Data.MySqlClient;

namespace PLC.DAO
{
    class LogHeaderDAO : LogDAO
    {
        public LogHeaderDAO(MySqlConnection conexion) : base(conexion) { }

        public int saveLogHeader()
        {
            int idHeader = -1;

            MySqlCommand cmd = new MySqlCommand("INSERT INTO plc_proceso(id_tipo_proceso) VALUES (1)", conexion);            
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
