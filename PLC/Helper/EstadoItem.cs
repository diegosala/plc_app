using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using OPC.Data;

namespace PLC
{
    class EstadoItem
    {
        private OPCItemState estadoItem;
        
        public EstadoItem(OPCItemState estadoItem)
        {
            this.estadoItem = estadoItem;
        }

        public String getTextoEstadoItem()
        {
            if (getCalidadItem() == 192)
                return estadoItem.DataValue.ToString();
            return null;
        }

        public int getCalidadItem()
        {
            return estadoItem.Quality;
        }
    }
}
