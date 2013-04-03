using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using PLC.Domain;
using MySql.Data.MySqlClient;

namespace PLC.DAO
{
    class LogRowDAO : LogDAO
    {
        public LogRowDAO(MySqlConnection conexion) : base(conexion) { }

        public void guradarProceso(int idProceso, List<LogOPCItem> items)
        {
            foreach(LogOPCItem item in items) {
                MySqlCommand cmd = new MySqlCommand("INSERT INTO plc_proceso_log (id_proceso, id_item, d_valor) VALUES (@idProceso, @idItem, @valor)", conexion);            
                            
                cmd.Parameters.AddWithValue("@idProceso", idProceso);
                cmd.Parameters.AddWithValue("@idItem", item.Id);

                if (item.tipo == 1)
                {
                    int largo = (int)item.valor.ToCharArray()[0];
                    item.valor = item.valor.Substring(1, largo);
                }
                cmd.Parameters.AddWithValue("@valor", item.valor);

                cmd.ExecuteNonQuery();
            }
        }
    }
}
