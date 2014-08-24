ENV['RAILS_ENV'] ||= 'test'

require File.expand_path("#{__dir__}/../lib/association_callbacks")
require 'byebug'

# Support
Dir["#{__dir__}/support/**/*.rb"].each { |f| require f }

# Mocks
ActiveSupport::Dependencies.autoload_paths << "#{__dir__}/mocks"

RSpec.configure do |config|
  config.raise_errors_for_deprecations!

  config.before(:each) do
    Comment.delete_all
    Post.delete_all
  end
end
