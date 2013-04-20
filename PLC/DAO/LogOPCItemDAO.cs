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
            MySqlCommand query = new MySqlCommand("SELECT ib.*, itp.id_tipo_dato FROM plc_item_bloque ib JOIN plc_item_tipo_proceso itp ON ib.id_item_tipo_proceso = itp.id WHERE id_grupo_opc = " + grupo.Id, conexion);
            MySqlDataReader reader = query.ExecuteReader();

            try
            {
                while (reader.Read())
                {
                    LogOPCItem item = new LogOPCItem();
                    item.Id = (int)reader[0];
                    item.bloque = (int)((sbyte)reader[1]);
                    item.nombre = (String)reader[3];
                    item.tipo = (int)reader[5];

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
            MySqlCommand queryCabecera = new MySqlCommand("SELECT * FROM plc_cfg_cabeceraxbloque WHERE id_bloque = " + idBloque, conexion);
            MySqlDataReader readerCabecera = queryCabecera.ExecuteReader();

            try
            {
                while (readerCabecera.Read())
                {
                    LogOPCItem item = new LogOPCItem();
                    item.Id = (int)readerCabecera[0];
                    item.bloque = (int)(readerCabecera[1]);
                    item.nombre = (String)readerCabecera[3];                    

                    items.Add(item);
                }
            }
            finally
            {
                readerCabecera.Close();
            }

            MySqlCommand queryEtapas = new MySqlCommand("SELECT * FROM plc_cfg_cabeceraxbloque WHERE id_bloque = " + idBloque, conexion);
            MySqlDataReader readerEtapas = queryEtapas.ExecuteReader();


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
                    item.bloque = (int)((sbyte)reader[1]);
                    item.nombre = (String)reader[3];

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

        internal List<int> getIdItemsByBloque(int idBloque)
        {
            List<int> ids = new List<int>();

            MySqlCommand query = new MySqlCommand("select id_item_anio, id_item_mes, id_item_dia, id_item_hora, id_item_minuto, id_item_segundo from v_cfg_finxetapaxbloque where id_bloque = " + idBloque, conexion);
            MySqlDataReader reader = query.ExecuteReader();

            try
            {
                while (reader.Read())
                {
                    for (int col = 0; col < 6; col++)
                        ids.Add((int)reader[col]);
                }
            } finally {
                reader.Close();
            }

            return ids;
        }
    }
}
