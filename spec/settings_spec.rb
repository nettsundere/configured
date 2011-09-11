require 'spec_helper'

module Configured
  describe Settings do

    before :each do
      @test_env_1 = {"setting" => "value", "setting2" => "value2"}
      @test_env_v = {"setting3" => "value3", "setting4" => "value4"}
      
      @configuration_fake = {"test" => @test_env_1, "test2" => @test_env_2}
    end
    
    describe "#for_the" do
      it "should return settings from config file as hash, in this format:
          :setting_name => setting_value for existing environment" do
        ret = Settings.new(@configuration_fake).for_the("test")
        ret.should == {:setting => "value", :setting2 => "value2"}     
      end
      
      it "should raise expception if there is no such environment in config" do
        lambda {Settings.new(@configuration_fake).for_the("bad-entry")}.should raise_error
      end    
    end
  end
end
