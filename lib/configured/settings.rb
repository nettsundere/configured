module Configured  
  class Settings
    # Initialize using required configuration data (YAML::load result, for example).
    def initialize(configuration_data)
      @configuration_data = configuration_data
    end  
    
    # Get settings for the required environment.
    def for_the(environment)
      begin
        settings = @configuration_data[environment.to_s] || raise
        
        settings_hash = {}
        settings.each_key { |key| settings_hash[key.intern] = settings[key]}
        settings_hash
      rescue
        raise NoEnvironmentError, "Can't find \"#{environment}\" section in config."
      end  
    end
    
    # Error for situation when we can't find the required environment section 
    # in configuration file.
    class NoEnvironmentError < StandardError
    end
  end
end
