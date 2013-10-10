using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections;
using PLC.Domain;

namespace PLC.Config
{    
    class ControlConfig
    {        
        private IDictionary<Int32, LogOPCGrupo> grupos;

        public LogOPCItem itemOnline;
        public LogOPCItem itemReadEnable;
        public LogOPCItem itemMemoryPointer;

        public IDictionary<Int32, LogOPCGrupo> getGrupos()
        {
            return grupos;
        }

        public void setGrupos(IDictionary<Int32, LogOPCGrupo> grupos)
        {
            this.grupos = grupos;
        }

        public HashSet<LogOPCItem> getItems(int idGrupo)
        {
            LogOPCGrupo grupo;
            grupos.TryGetValue(idGrupo, out grupo);
            return grupo.items;
        }

        public void setItemOnLine(LogOPCItem item)
        {
            itemOnline = item;
        }

        public void setItemReadEnable(LogOPCItem item)
        {
            itemReadEnable = item;
        }

        public void setItemMemoryPointer(LogOPCItem item)
        {
            itemMemoryPointer = item;
        }

        public LogOPCItem getItemOnLine()
        {
            return itemOnline;
        }

        public LogOPCItem getItemReadEnable()
        {
            return itemReadEnable;
        }

        public LogOPCItem getItemMemoryPointer()
        {
            return itemMemoryPointer;
        }
    }
}
