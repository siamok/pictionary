ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?

require 'spec_helper'
require 'rspec/rails'
require 'devise'
require 'simplecov'
require 'factory_bot_rails'
require_relative 'support/factory_bot'
require_relative 'support/database_cleaner'
SimpleCov.start

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
  config.include Devise::Test::IntegrationHelpers, :type => :request
  config.include Devise::Test::ControllerHelpers, :type => :controller
  config.include Warden::Test::Helpers

  config.include Devise::TestHelpers, :type => :controller
end
