using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace PLC.Domain
{
    class LogOPCGrupo : BussinesObject
    {
        public virtual String nombre {get; set; }
        public virtual HashSet<LogOPCItem> items { get; set; }        
    }
}
