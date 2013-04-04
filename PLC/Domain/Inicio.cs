using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace PLC.Domain
{
    class Inicio : BussinesObject
    {
        public int idBloque;        
        public LogOPCItem itemAnioInicio, itemMesInicio, itemDiaInicio, itemHoraInicio, itemMinInicio, itemSegInicio;

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
            listaItems.Add(itemAnioInicio);
            listaItems.Add(itemMesInicio);
            listaItems.Add(itemDiaInicio);
            listaItems.Add(itemHoraInicio);
            listaItems.Add(itemMinInicio);
            listaItems.Add(itemSegInicio);
        }

        public DateTime generarFechaInicio()
        {
            int anio, mes, dia, hora, minuto, segundo;
            try
            {
                anio = int.Parse(itemAnioInicio.valor);
                mes = int.Parse(itemMesInicio.valor);
                dia = int.Parse(itemDiaInicio.valor);
                hora = int.Parse(itemHoraInicio.valor);
                minuto = int.Parse(itemMinInicio.valor);
                segundo = int.Parse(itemSegInicio.valor);
            } catch (Exception e) {
                return new DateTime();
            }

            return new DateTime(anio, mes, dia, hora, minuto, segundo);
        }
    }
}
