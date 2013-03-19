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
        private Dictionary<Int32, LogOPCGroup> grupos;

        public Dictionary<Int32, LogOPCGroup> getGrupos()
        {
            return grupos;
        }

        public void setGrupos(Dictionary<Int32, LogOPCGroup> grupos)
        {
            this.grupos = grupos;
        }

        public HashSet<LogOPCItem> getItems(int idGrupo)
        {
            LogOPCGroup grupo;
            grupos.TryGetValue(idGrupo, out grupo);
            return grupo.items;
        }
    }
}
