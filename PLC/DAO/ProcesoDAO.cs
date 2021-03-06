﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MySql.Data.MySqlClient;
using PLC.Domain;

namespace PLC.DAO
{
    class ProcesoDAO : LogDAO
    {
        public ProcesoDAO(MySqlConnection conexion) : base(conexion) { }
        private const String formatoFecha = "yyyy-MM-dd HH:mm:ss";

        public Boolean save(Proceso proceso)
        {
            int idHeader = -1;

            MySqlCommand cmd = new MySqlCommand("INSERT INTO plc_log_proceso(d_producto, d_lote, d_operario, f_inicio) " +
                                                "VALUES (@Producto, @Lote, @Operario, @Inicio)", conexion);
            
            cmd.Parameters.AddWithValue("@Producto", proceso.getProducto());
            cmd.Parameters.AddWithValue("@Lote", proceso.getLote());
            cmd.Parameters.AddWithValue("@Operario", proceso.getOperario());
            cmd.Parameters.AddWithValue("@Inicio", proceso.inicio.generarFechaInicio().ToString(formatoFecha));

            if (cmd.ExecuteNonQuery() != 1)
                return false;

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
                        return false;
                    }

                }
            }
            finally
            {
                reader.Close();
            }

            foreach (Etapa etapa in proceso.etapas)
            {
                if (!etapa.isValid())
                    continue;

                MySqlCommand cmdEtapa = new MySqlCommand("INSERT INTO plc_log_proceso_etapa(id_proceso, id_etapa, f_fin) " +
                                                "VALUES (@Proceso, @Etapa, @Fin)", conexion);

                cmdEtapa.Parameters.AddWithValue("@Proceso", idHeader);
                cmdEtapa.Parameters.AddWithValue("@Etapa", etapa.Id);
                cmdEtapa.Parameters.AddWithValue("@Fin", etapa.generarFechaFin().ToString(formatoFecha));

                if (cmdEtapa.ExecuteNonQuery() != 1)
                    return false;
            }

            foreach (Velocidad velocidad in proceso.velocidades) 
            {
                MySqlCommand cmdVelocidad = new MySqlCommand("INSERT INTO plc_log_proceso_velocidad(id_proceso, id_velocidad, n_velocidad) " +
                                                "VALUES (@Proceso, @Velocidad, @Valor)", conexion);

                cmdVelocidad.Parameters.AddWithValue("@Proceso", idHeader);
                cmdVelocidad.Parameters.AddWithValue("@Velocidad", velocidad.Id);
                cmdVelocidad.Parameters.AddWithValue("@Valor", velocidad.item.valor);

                if (cmdVelocidad.ExecuteNonQuery() != 1)
                    return false;
            }

            foreach (Retencion retencion in proceso.retenciones)
            {
                MySqlCommand cmdVelocidad = new MySqlCommand("INSERT INTO plc_log_proceso_retencion(id_proceso, id_retencion, v_retencion) " +
                                                "VALUES (@Proceso, @Retencion, @Valor)", conexion);

                cmdVelocidad.Parameters.AddWithValue("@Proceso", idHeader);
                cmdVelocidad.Parameters.AddWithValue("@Retencion", retencion.Id);
                cmdVelocidad.Parameters.AddWithValue("@Valor", retencion.item.valor);

                if (cmdVelocidad.ExecuteNonQuery() != 1)
                    return false;
            }

            MySqlCommand cmdEstado = new MySqlCommand("INSERT INTO plc_log_proceso_estado(id_proceso, id_estado) " +
                                                "VALUES (@Proceso, @Valor)", conexion);

            cmdEstado.Parameters.AddWithValue("@Proceso", idHeader);
            cmdEstado.Parameters.AddWithValue("@Valor", Int16.Parse(proceso.estado.item.valor));

            if (cmdEstado.ExecuteNonQuery() != 1)
                return false;

            return true;
        }
    }
}
