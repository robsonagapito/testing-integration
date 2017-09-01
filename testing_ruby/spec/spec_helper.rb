require File.dirname(__FILE__) + '/../generic/helpers.rb'
require File.dirname(__FILE__) + '/../generic/color_name.rb'
require File.dirname(__FILE__) + '/definitions/User.rb'
require File.dirname(__FILE__) + '/support/RestSupport.rb'
Dir[File.dirname(__FILE__) + '/../generic/*.rb'].each { |f| require f } 


RSpec.configure do |config|
  include Helpers

  config.before(:each) do
  end

  config.after(:each) do
  end
end