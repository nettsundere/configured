# We require every .rb files in /configured
lib_files_pattern = "#{File.dirname __FILE__}/configured/*.rb"
Dir[lib_files_pattern].each {|lib| require lib }
