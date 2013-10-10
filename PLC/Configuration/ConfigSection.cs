using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using PLC.Configuration;

namespace PLC.Configuration
{
    class ConfigSection : ConfigurationSection
    {
        #region Public Methods

        ///<summary>
        ///Get this configuration set from the application's default config file
        ///</summary>
        public static ConfigSection Open()
        {
            System.Reflection.Assembly assy = System.Reflection.Assembly.GetEntryAssembly();
            return Open(assy.Location);
        }

        ///<summary>
        /// Get this configuration set from a specific config file
        ///</summary>
        public static ConfigSection Open(string path)
        {
            if ((object)instance == null)
            {
                if (path.EndsWith(".config", StringComparison.InvariantCultureIgnoreCase))
                    spath = path.Remove(path.Length - 7);
                else
                    spath = path;
                System.Configuration.Configuration config = ConfigurationManager.OpenExeConfiguration(spath);
                if (config.Sections["ConfigSection"] == null)
                {
                    instance = new ConfigSection();
                    config.Sections.Add("ConfigSection", instance);
                    config.Save(ConfigurationSaveMode.Modified);
                }
                else
                    instance = (ConfigSection)config.Sections["ConfigSection"];
            }
            return instance;
        }

        ///<summary>
        ///Save the current property values to the config file
        ///</summary>
        public void Save()
        {
            System.Configuration.Configuration config = ConfigurationManager.OpenExeConfiguration(spath);
            ConfigSection section = (ConfigSection)config.Sections["ConfigSection"];

            section.ConfigDB = this.ConfigDB;            

            config.Save(ConfigurationSaveMode.Full); //Try with "Modified" to see the difference
            ConfigurationManager.RefreshSection("appSettings");
        }

        #endregion Public Methods

        #region Properties

        public static ConfigSection Default
        {
            get { return defaultInstance; }
        }

        [ConfigurationProperty("ConfigDB")]
        public ConfigDB ConfigDB
        {
            get { return (ConfigDB)this["ConfigDB"]; }
            set { this["ConfigDB"] = value; }
        }
      
        #endregion Properties

        #region Fields
        private static string spath;
        private static ConfigSection instance = null;
        private static readonly ConfigSection defaultInstance = new ConfigSection();
        #endregion Fields
    }
}
