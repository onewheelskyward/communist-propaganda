require 'sinatra/base'
require 'data_mapper'
require 'dm-sqlite-adapter'
# require 'dm-postgres-adapter'

DataMapper::Logger.new($stdout, :debug)
DataMapper::Property::String.length(4000)
# DataMapper.setup(:default, "sqlite://#{File.expand_path(File.dirname(__FILE__))}/sample.sqlite")
DataMapper.setup(:default, "postgres://localhost/communist-propaganda")

class App < Sinatra::Base
  helpers Sinatra::Helpers

  app_folders = %w(models helpers controllers routes)
  # Require our ruby fileses
  app_folders.each do |folder|
    Dir.glob("#{folder}/*.rb").each { |file| require_relative file }
  end

  config = YAML.load_file(File.dirname(__FILE__) + '/config.yml')

  if ENV['RACK_ENV'] == 'test'
    DataMapper::Logger.new($stdout, :debug)
    DataMapper.setup(:default, "postgres://#{config[:db_user]}:#{config[:db_password]}@#{config[:db_host]}/#{config[:test_db]}")
    DataMapper.auto_migrate!
  else
    DataMapper::Logger.new($stdout, :debug)
    DataMapper.setup(:default, "postgres://#{config[:db_user]}:#{config[:db_password]}@#{config[:db_host]}/#{config[:db]}")
    DataMapper.auto_upgrade!
  end

  DataMapper.finalize

  require_relative 'scripts/db_seed.rb'
  seed_database
  configure :development do
    require 'sinatra/reloader'
    register Sinatra::Reloader
    app_folders.each do |folder|
      Dir.glob("#{folder}/*.rb").each { |file| also_reload file }
    end
  end
end
