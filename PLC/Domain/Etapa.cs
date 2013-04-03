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
    }
}
