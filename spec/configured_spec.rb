require 'spec_helper'

describe Configured do
  describe "Configuration loading" do

    before :each do
      YAML::stub!(:load)
    end
    
    it "should load default rails database config file once when it isn't specified in many calls" do  
      File.should_receive(:open).once.with("config/database.yml")
      2.times { Configured.in_yaml }
    end
    
    it "should load specified config file once when it is specified in many calls" do
      some_config = "test"
 
      File.should_receive(:open).once.with(some_config)
      2.times { Configured.in_yaml some_config }
    end

    it "should raise an exception if there is no such configuration file." do
      lambda { Configured.in_yaml "bad_file" }.should raise_error
    end
  end
end
