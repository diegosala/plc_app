using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace PLC.Domain
{
    class LogOPCItem : BussinesObject
    {
        public virtual String nombre { get; set; }

        public LogOPCItem() { }

        public LogOPCItem(Int32 id)
        {
            this.Id = id;
        }
    }
}
