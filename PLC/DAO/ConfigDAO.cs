﻿using System;
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
            MySqlCommand query = new MySqlCommand("SELECT * FROM plc_cfg_item_control WHERE id = " + (int)idItemControl, conexion);
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
            MySqlCommand query = new MySqlCommand("SELECT d_grupo_opc FROM plc_cfg_item_control LIMIT 0,1", conexion);
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
            MySqlCommand query = new MySqlCommand("SELECT * FROM plc_cfg_item_control", conexion);
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

        public List<LogOPCItem> getItemsCabeceraForBloque(int idBloque)
        {
            List<LogOPCItem> items = new List<LogOPCItem>();

            MySqlCommand query = new MySqlCommand("SELECT * FROM plc_cfg_cabeceraxbloque WHERE id_bloque = " + idBloque + " ORDER BY id_cabecera", conexion);
            MySqlDataReader reader = query.ExecuteReader();

            try
            {
                while (reader.Read())
                {
                    LogOPCItem item = new LogOPCItem();
                    item.Id = (int)reader[0];
                    item.nombre = (string)reader[3];
                    item.bloque = idBloque;

                    items.Add(item);
                }
            }
            finally
            {
                reader.Close();
            }

            return items;
        }

        public List<Etapa> getAllEtapasForBloque(int idBloque)
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

            foreach (Etapa etapa in etapas)
                setItemsForEtapa(etapa);

            return etapas;
        }

        private void setItemsForEtapa(Etapa etapa)
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

        public List<Velocidad> getAllVelocidadesForBloque(int idBloque)
        {
            List<Velocidad> velocidades = new List<Velocidad>();
            MySqlCommand query = new MySqlCommand("SELECT * FROM plc_cfg_velocidad", conexion);
            MySqlDataReader reader = query.ExecuteReader();

            try
            {
                while (reader.Read())
                {
                    Velocidad velocidad = new Velocidad();
                    velocidad.Id = (int)reader[0];
                    velocidad.nombre = (String)reader[1];
                    velocidad.idBloque = idBloque;

                    velocidades.Add(velocidad);
                }
            }
            finally
            {
                reader.Close();
            }

            foreach (Velocidad velocidad in velocidades)
                setItemsForVelocidad(velocidad);

            return velocidades;
        }

        private void setItemsForVelocidad(Velocidad velocidad)
        {
            MySqlCommand query = new MySqlCommand("SELECT * FROM plc_cfg_velocidadxbloque WHERE id_velocidad = " + velocidad.Id + " AND id_bloque = " + velocidad.idBloque, conexion);
            MySqlDataReader reader = query.ExecuteReader();

            try
            {
                while (reader.Read())
                {
                    velocidad.item = new LogOPCItem((int)reader[0], velocidad.idBloque, (string)reader[3]);                    
                }
            }
            finally
            {
                reader.Close();
            }
        }
    }
}
