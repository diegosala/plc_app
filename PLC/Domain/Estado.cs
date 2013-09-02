using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace PLC.Domain
{
    class Estado : BussinesObject
    {
        public int idBloque;
        public String nombre;
        public LogOPCItem item;
    }
}
