#require pathname class
require "pathname"

#set root directory of application
APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))

#require all of the files in app directory
Dir[APP_ROOT.join('app', '*.rb')].each { |file| load file }

#require bundle setup
require 'bundler/setup'
require 'rubygems'

#require gems
require 'rack'
require 'rspec'
require 'pry'
