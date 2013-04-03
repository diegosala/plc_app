using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MySql.Data.MySqlClient;
using PLC.Domain;

namespace PLC.DAO
{
    class EtapaDAO : LogDAO
    {
        public EtapaDAO(MySqlConnection conexion) : base(conexion) { }

        public List<Etapa> getAllForBloque(int idBloque)
        {
            List<Etapa> etapas = new List<Etapa>();
            MySqlCommand query = new MySqlCommand("SELECT * FROM plc_cfg_etapa", conexion);
            MySqlDataReader reader = query.ExecuteReader();

            try
            {
                while (reader.Read())
                {
                    Etapa etapa = new Etapa();
                    etapa.Id = (int)reader[0];
                    etapa.nombre = (String)reader[1];
                    etapa.idBloque = idBloque;                    

                    etapas.Add(etapa);
                }
            }
            finally
            {
                reader.Close();
            }

            foreach(Etapa etapa in etapas)
                setItemsForEtapa(etapa);

            return etapas;
        }

        public void setItemsForEtapa(Etapa etapa)
        {
            MySqlCommand query = new MySqlCommand("SELECT * FROM v_cfg_finxetapaxbloque WHERE id_etapa = " + etapa.Id + " AND id_bloque = " + etapa.idBloque, conexion);
            MySqlDataReader reader = query.ExecuteReader();

            try
            {
                while (reader.Read())
                {
                    etapa.itemAnioFin = new LogOPCItem((int)reader[2], etapa.idBloque, (string)reader[3]);
                    etapa.itemMesFin = new LogOPCItem((int)reader[4], etapa.idBloque, (string)reader[5]);
                    etapa.itemDiaFin = new LogOPCItem((int)reader[6], etapa.idBloque, (string)reader[7]);
                    etapa.itemHoraFin = new LogOPCItem((int)reader[8], etapa.idBloque, (string)reader[9]);
                    etapa.itemMinFin = new LogOPCItem((int)reader[10], etapa.idBloque, (string)reader[11]);
                    etapa.itemSegFin = new LogOPCItem((int)reader[12], etapa.idBloque, (string)reader[13]);
                }
            }
            finally
            {
                reader.Close();
            }            
        }
    }
}
