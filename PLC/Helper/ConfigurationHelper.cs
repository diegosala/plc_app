using System;
using System.Configuration;
using System.Windows.Forms;
using PLC.Configuration;
using PLC.Properties;
namespace PLC.Helper
{
    class ConfigurationHelper
    {
        const string nombreSeccionDataBase = "connectionStrings";
        // Define the Rsa provider name.
        const string provider = "RsaProtectedConfigurationProvider";

        private static ConfigSection ConfigSection(String section)
        {
            System.Configuration.Configuration config = ConfigurationManager.OpenExeConfiguration(ConfigurationUserLevel.None);
            ConfigurationManager.RefreshSection(section);
            ConfigSection instance = null;
            if (config.Sections[section] == null)
            {
                instance = new ConfigSection();
                config.Sections.Add(section, instance);
                config.Save(ConfigurationSaveMode.Modified);
            }
            else
                instance = (ConfigSection)config.Sections[section];
            return instance;
        }      
        
        public static void ProtectConfiguration()
        {
            // Get the application configuration file.
            System.Configuration.Configuration config = ConfigurationManager.OpenExeConfiguration(ConfigurationUserLevel.None);

            // Get the section to protect.
            ConfigurationSection protectSection = config.AppSettings;

            if (protectSection != null)
            {
                if (!protectSection.SectionInformation.IsProtected)
                {
                    if (!protectSection.ElementInformation.IsLocked)
                    {
                        // Protect the section.
                        protectSection.SectionInformation.ProtectSection(provider);

                        protectSection.SectionInformation.ForceSave = true;
                        config.Save(ConfigurationSaveMode.Full);

                    }
                }
            }
        }

        public static void UnProtectConfiguration()
        {
            // Get the application configuration file.
            System.Configuration.Configuration config = ConfigurationManager.OpenExeConfiguration(ConfigurationUserLevel.None);

            // Get the section to unprotect.
            ConfigurationSection protectSection = config.AppSettings;

            if (protectSection != null)
            {
                if (protectSection.SectionInformation.IsProtected)
                {
                    if (!protectSection.ElementInformation.IsLocked)
                    {
                        // Unprotect the section.
                        protectSection.SectionInformation.UnprotectSection();

                        protectSection.SectionInformation.ForceSave = true;
                        config.Save(ConfigurationSaveMode.Full);
                    }
                }
            }
        }

        static public ConfigDB GetConfigDatabase()
        {            
            return ConfigSection("ConfigSection").ConfigDB;
        }
    }
}
