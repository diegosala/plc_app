using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MySql.Data.MySqlClient;
using PLC.Domain;

namespace PLC.DAO
{
    class LogOPCItemDAO : LogDAO
    {
        public LogOPCItemDAO(MySqlConnection conexion) : base(conexion) { }

        public List<LogOPCItem> getItemsByGrupo(LogOPCGrupo grupo)
        {
            List<LogOPCItem> items = new List<LogOPCItem>();
            MySqlCommand query = new MySqlCommand("SELECT * FROM plc_item_bloque WHERE id_grupo_opc = " + grupo.Id, conexion);
            MySqlDataReader reader = query.ExecuteReader();

            try
            {
                while (reader.Read())
                {
                    LogOPCItem item = new LogOPCItem();
                    item.Id = (int)reader[0];
                    item.bloque = (int)reader[1];
                    item.nombre = (String)reader[2];

                    items.Add(item);
                }
            }
            finally
            {
                reader.Close();
            }

            return items;
        }

        public List<LogOPCItem> getItemsByBloque(int idBloque)
        {
            List<LogOPCItem> items = new List<LogOPCItem>();
            MySqlCommand query = new MySqlCommand("SELECT * FROM plc_item_bloque WHERE n_bloque = " + idBloque.ToString(), conexion);
            MySqlDataReader reader = query.ExecuteReader();

            try
            {
                while (reader.Read())
                {
                    LogOPCItem item = new LogOPCItem();
                    item.Id = (int)reader[0];
                    item.bloque = (int)reader[1];
                    item.nombre = (String)reader[2];

                    items.Add(item);
                }
            }
            finally
            {
                reader.Close();
            }

            return items;
        }

        public List<LogOPCItem> getAll()
        {
            List<LogOPCItem> items = new List<LogOPCItem>();
            MySqlCommand query = new MySqlCommand("SELECT * FROM plc_item_bloque", conexion);
            MySqlDataReader reader = query.ExecuteReader();

            try
            {
                while (reader.Read())
                {
                    LogOPCItem item = new LogOPCItem();
                    item.Id = (int)reader[0];
                    item.bloque = (int)reader[1];
                    item.nombre = (String)reader[2];

                    items.Add(item);
                }
            }
            finally
            {
                reader.Close();
            }

            return items;            
        }


        internal LogOPCItem getLogItemControl(int p)
        {
            LogOPCItem item = null;
            MySqlCommand query = new MySqlCommand("SELECT * FROM plc_item_configuracion WHERE id = " + p, conexion);
            MySqlDataReader reader = query.ExecuteReader();

            try
            {
                while (reader.Read())
                {
                    item = new LogOPCItem();
                    item.Id = (int)reader[0];
                    item.nombre = (String)reader[1];
                }
            }
            finally
            {
                reader.Close();
            }

            return item;
        }
    }
}
