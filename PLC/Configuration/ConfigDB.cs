using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;

namespace PLC.Configuration
{
    public sealed class ConfigDB : ConfigurationElement
    {
        public ConfigDB()
        {
            // Cargar valores por default
            this.host = "localhost";
            this.port = "3360";
            this.db = "plc";
            this.user = "plc_user";
            this.pass = "password";

        }
        [System.Configuration.ConfigurationProperty("host", IsRequired = true, DefaultValue = "localhost")]
        public string host
        {
            get { return this["host"] as string; }
            set { this["host"] = value; }
        }

        [System.Configuration.ConfigurationProperty("port", IsRequired = true, DefaultValue="3306")]
        public string port
        {
            get { return this["port"] as string; }
            set { this["port"] = value; }
        }

        [System.Configuration.ConfigurationProperty("db", IsRequired = true, DefaultValue="plc")]
        public string db
        {
            get { return this["db"] as string; }
            set { this["db"] = value; }
        }

        [System.Configuration.ConfigurationProperty("user", IsRequired = true, DefaultValue="plc_user")]
        public string user
        {
            get { return this["user"] as string; }
            set { this["user"] = value; }
        }

        [System.Configuration.ConfigurationProperty("pass", IsRequired = true, DefaultValue="password")]
        public string pass
        {
            get { return this["pass"] as string; }
            set { this["pass"] = value; }
        }
    }
}
