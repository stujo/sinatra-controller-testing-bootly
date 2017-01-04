ENV['RACK_ENV'] ||= 'test'

require File.expand_path('../../app', __FILE__)

require 'shoulda-matchers'
require 'rack/test'
require 'capybara'
require 'capybara/rspec'
require 'faker'

def session
  last_request.env['rack.session']
end

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.include Capybara::DSL
end

def app
  Sinatra::Application
end

Capybara.app = app

I18n.enforce_available_locales = false
