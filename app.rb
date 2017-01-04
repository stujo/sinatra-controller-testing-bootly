require 'pathname'

ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exist?(ENV['BUNDLE_GEMFILE'])

require 'sinatra'


APP_ROOT = Pathname.new(File.expand_path('..', __FILE__))

#puts "APP_ROOT = [#{APP_ROOT}]"

#require 'byebug'; byebug

set :root, APP_ROOT

Dir[APP_ROOT.join('models', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('controllers', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('helpers', '*.rb')].each { |file| require file }
