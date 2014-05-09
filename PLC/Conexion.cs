using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections.ObjectModel;

using MySql.Data;
using MySql.Data.MySqlClient;
using System.Collections;

namespace PLC
{
    public class Conexion
    {
        private String host;
        private String usuario;
        private String password;
        private String db;
        private String puerto;

        public int reintentos = 0;
        
        private MySqlConnection conexion;

        public Conexion(String host, String puerto, String db, String usuario, String password) {
            this.host = host;
            this.usuario = usuario;
            this.password = password;
            this.db = db;
            this.puerto = puerto;            
        }

        public MySqlConnection getConexion()
        {
            if (conexion != null)
                return conexion;
            conexion = new MySqlConnection("server="+ host +";user="+ usuario +";database="+ db +";port="+ puerto +";password="+ password +";");
            try
            {
                conexion.Open();
            }
            catch
            {
                conexion = null;
            }

            return conexion;
        }

        public int ejecutarNonQuery(String query, Hashtable parametros)
        {
            //"INSERT INTO log_table (data) VALUES (@VariableData)"
            MySqlCommand cmd = new MySqlCommand(query, conexion);
            //cmd.Parameters.AddWithValue("@VariableData", txtValor.Text);
            foreach (String clave in parametros.Keys)
            {
                cmd.Parameters.AddWithValue(clave, parametros[clave]);
            }
            
            return cmd.ExecuteNonQuery();            
        }
    }
}
