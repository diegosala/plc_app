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
    class ConfigDAO : LogDAO
    {
        public enum IdItemsControl { OL = 1, RE = 2, MP = 3 };

        public ConfigDAO(MySqlConnection conexion) : base(conexion) { }        

        public LogOPCItem getItemConfiguracion(IdItemsControl idItemControl, MySqlConnection conexion)
        {
            LogOPCItem item = null;
            MySqlCommand query = new MySqlCommand("SELECT * FROM plc_item_control WHERE id = " + (int)idItemControl, conexion);
            MySqlDataReader reader = query.ExecuteReader();

            try
            {
                while (reader.Read())
                {
                    item = new LogOPCItem();
                    item.Id = (int)reader[0];
                    item.nombre = (String)reader[2];
                }

                return item;
            }
            finally
            {
                reader.Close();
            }
        }

        public LogOPCGrupo getGrupoConfiguracion()
        {
            LogOPCGrupo grupo = null;
            MySqlCommand query = new MySqlCommand("SELECT d_grupo_opc FROM plc_item_control LIMIT 0,1", conexion);
            MySqlDataReader reader = query.ExecuteReader();

            try
            {
                while (reader.Read())
                {
                    grupo = new LogOPCGrupo();
                    grupo.nombre = (String)reader[0];
                }
            }
            finally
            {
                reader.Close();
            }

            return grupo;
        }

        public List<LogOPCItem> getItemsConfiguracion()
        {
            List<LogOPCItem> items = new List<LogOPCItem>();
            MySqlCommand query = new MySqlCommand("SELECT * FROM plc_item_control", conexion);
            MySqlDataReader reader = query.ExecuteReader();

            try
            {
                while (reader.Read())
                {
                    LogOPCItem item = new LogOPCItem();
                    item.Id = (int)reader[0];
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
    }
}
