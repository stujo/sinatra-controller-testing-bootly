ENV['RACK_ENV'] ||= 'test'

puts 'HELPER'

require File.expand_path('../../app', __FILE__)

require 'rack/test'
require 'rspec-html-matchers'


RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.include RSpecHtmlMatchers
end

def app
  Sinatra::Application
end
