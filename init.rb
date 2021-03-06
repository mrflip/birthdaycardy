::ROOT_DIR = File.expand_path(File.dirname(__FILE__)) unless defined? ::ROOT_DIR
# require "rubygems"

# begin
#   require "vendor/dependencies/lib/dependencies"
# rescue LoadError
#   require "dependencies"
# end
require "monk/glue"
require 'sinatra'
require 'haml'
# require "json"
# extlib
# monk-glue
# json

class Main < Monk::Glue
  set :app_file, __FILE__
  use Rack::Session::Cookie,
    :key          => 'rack.session',
    :domain       => settings(:domain),
    :path         => '/',
    :expire_after => 2592000,
    :secret       => settings(:session_secret)
end

# random initializer
srand

# Load all application files.
Dir[Monk::Glue.root_path("app/**/*.rb")].each do |file|
  require file
end

# # Connect to database.
# sqlite3_path = settings(:sqlite3)[:database]
# DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/#{sqlite3_path}")

Main.run! if Main.run?
