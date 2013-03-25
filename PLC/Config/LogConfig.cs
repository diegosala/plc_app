using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections;
using PLC.Domain;

namespace PLC.Config
{    
    class LogConfig
    {
        private HashSet<LogOPCItem> items;
        private IDictionary<Int32, LogOPCGroup> grupos;

        private LogOPCItem itemOnline;
        private LogOPCItem itemReadEnable;
        private LogOPCItem itemMemoryPointer;

        public IDictionary<Int32, LogOPCGroup> getGrupos()
        {
            return grupos;
        }

        public void setGrupos(IDictionary<Int32, LogOPCGroup> grupos)
        {
            this.grupos = grupos;
        }

        public HashSet<LogOPCItem> getItems(int idGrupo)
        {
            LogOPCGroup grupo;
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
    }
}
