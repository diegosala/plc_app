using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using MySql.Data;
using MySql.Data.MySqlClient;
using System.Collections;
using PLC.Domain;
using PLC.DAO;

namespace PLC
{
    class ConfigDAO
    {
        public enum IdItemsControl { OL = 1, RE = 2, MP = 3 };

        public LogOPCItem getItemConfiguracion(IdItemsControl idItemControl, MySqlConnection conexion)
        {
            return new LogItemDAO(conexion).getLogItemControl((int)idItemControl);
        }

        public Dictionary<Int32, LogOPCGroup> getGrupos(MySqlConnection conexion)
        {
            Dictionary<Int32, LogOPCGroup> grupos = new Dictionary<Int32, LogOPCGroup>();            

            MySqlCommand query = new MySqlCommand("SELECT * FROM v_config_items", conexion);
            MySqlDataReader reader = query.ExecuteReader();

            try
            {
                while (reader.Read())
                {
                    LogOPCGroup grupo;
                    int idGrupo = int.Parse(reader[0].ToString());

                    if (!grupos.ContainsKey(idGrupo))
                    {
                        grupo = new LogOPCGroup();
                        grupo.Id = idGrupo;
                        grupo.nombre = reader[1].ToString();
                        grupo.items = new HashSet<LogOPCItem>();
                        grupos.Add(idGrupo, grupo);
                    }
                    else
                    {
                        grupos.TryGetValue(idGrupo, out grupo);
                    }

                    LogOPCItem item = new LogOPCItem(int.Parse(reader[2].ToString()));                    
                    item.nombre = reader[3].ToString();

                    grupo.items.Add(item);
                }
            }
            finally
            {
                reader.Close();
            }

            return grupos;
        }
    }
}
