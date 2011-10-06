require 'yaml'

module Configured
  class << self

    @@config_initters = {}

    # Load configuration data stored in YAML.
    # Filename can be passed as parameter.
    def in_yaml(filename = "config/database.yml")
      begin        
        @@config_initters[filename] ||= 
        begin
          data = YAML::load(File.open filename)
          Settings.new(data)
        end
      rescue
        raise Errno::ENOENT, "Can't find \"#{filename}\" configuration file."
      end
    end
  end
end
