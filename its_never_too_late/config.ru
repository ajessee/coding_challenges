# Require config/environment.rb
require ::File.expand_path('../config/environment',  __FILE__)

#use Rack::Reloader middleware to see real-time changes
use Rack::Reloader

#use my middleware
use RickyRackMiddleware

#run my application
run RickyApp.new
