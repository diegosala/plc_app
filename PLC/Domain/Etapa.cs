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
    }
}
