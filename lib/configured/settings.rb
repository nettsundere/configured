module Configured
  class Settings
    # Initialize using required configuration data (YAML::load result, for example).
    def initialize(configuration_data)
      @configuration_data = configuration_data
    end  
    
    # Get settings for the required environment.
    def for_the(environment)
      begin
        settings = @configuration_data[environment] || raise
        
        settings_hash = {}
        settings.each_key { |key| settings_hash[key.intern] = settings[key]}
        settings_hash
      rescue
        raise "Can't find \"#{environment}\" section in config."
      end  
    end
  end
end
