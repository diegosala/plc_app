using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using PLC.Domain;
using MySql.Data.MySqlClient;

namespace PLC.DAO
{
    class LogOPCGrupoDAO : LogDAO
    {
        public LogOPCGrupoDAO(MySqlConnection conexion) : base(conexion) { }

        public List<LogOPCGrupo> getAll()
        {
            List<LogOPCGrupo> grupos = new List<LogOPCGrupo>();
            MySqlCommand query = new MySqlCommand("SELECT * FROM plc_cfg_bloque", conexion);
            MySqlDataReader reader = query.ExecuteReader();

            try
            {
                while (reader.Read())
                {
                    LogOPCGrupo grupo = new LogOPCGrupo();
                    grupo.Id = (int)reader[0];
                    grupo.nombre = (String)reader[2];

                    grupos.Add(grupo);
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
