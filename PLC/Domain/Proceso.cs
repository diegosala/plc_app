using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace PLC.Domain
{
    class Proceso : BussinesObject
    {
        public String producto, lote, operario;
        public List<Etapa> etapas;
        public List<Velocidad> velocidades;
    }
}
