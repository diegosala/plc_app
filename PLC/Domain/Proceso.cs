using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace PLC.Domain
{
    class Proceso : BussinesObject
    {
        public String producto, lote, operario;
        public Inicio inicio;
        public List<Etapa> etapas;
        public List<Velocidad> velocidades;

        public String getProducto()
        {
            return getItemString(producto);
        }

        public String getLote()
        {
            return getItemString(lote);
        }

        public String getOperario()
        {
            return getItemString(operario);
        }

        private String getItemString(String cadena) {
            int largo = (int)cadena.ToCharArray()[0];

            try
            {
                cadena.Substring(1, largo);
            }
            catch (ArgumentOutOfRangeException e)
            {
                return null;
            }
            return cadena.Substring(1, largo);          
        }
    }
}
