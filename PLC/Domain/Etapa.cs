using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace PLC.Domain
{
    class Etapa : BussinesObject
    {        
        public int idBloque;
        public String nombre;
        public LogOPCItem itemAnioFin, itemMesFin, itemDiaFin, itemHoraFin, itemMinFin, itemSegFin;
        
        private List<LogOPCItem> listaItems;        

        public LogOPCItem getItemById(int idItem)
        {
            generarListaItems();
            
            foreach (LogOPCItem item in listaItems)
            {
                if (item.Id == idItem)
                    return item;
            }
            
            return null;
        }

        private void generarListaItems()
        {
            listaItems = new List<LogOPCItem>();
            listaItems.Add(itemAnioFin);
            listaItems.Add(itemMesFin);
            listaItems.Add(itemDiaFin);
            listaItems.Add(itemHoraFin);
            listaItems.Add(itemMinFin);
            listaItems.Add(itemSegFin);
        }

        public Boolean isValid()
        {
            return itemAnioFin.valor != "1970";
        }

        public DateTime generarFechaFin()
        {
            int anio, mes, dia, hora, minuto, segundo;

            try
            {
                anio = int.Parse(itemAnioFin.valor);
                mes = int.Parse(itemMesFin.valor);
                dia = int.Parse(itemDiaFin.valor);
                hora = int.Parse(itemHoraFin.valor);
                minuto = int.Parse(itemMinFin.valor);
                segundo = int.Parse(itemSegFin.valor);
            }
            catch (Exception e)
            {
                return new DateTime();
            }

            return new DateTime(anio, mes, dia, hora, minuto, segundo);
        }
    }
}
