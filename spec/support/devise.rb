require_relative './controller_macros.rb'

RSpec.configure do |config|

  # <snip> some more non-devise stuff

  config.include Devise::TestHelpers, type: :controller
  config.include Warden::Test::Helpers
  config.include ControllerMacros, type: :controller
end