ENV["RAILS_ENV"] ||= 'test'

require File.dirname(__FILE__) + '/../lib/association_callbacks'

# Support
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

# Mocks
ActiveSupport::Dependencies.autoload_paths << "#{File.dirname(__FILE__)}/mocks"

RSpec.configure do |config|
  config.before(:each) do
    Comment.delete_all
    Post.delete_all
  end
end