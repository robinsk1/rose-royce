require 'rubygems'
require 'sinatra'
require 'data_mapper'

DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/development.db")

class Car
  include DataMapper::Resource
  property :id, Serial
  property :name, String, required: true
  property :day, String, required: false
end
DataMapper.finalize

class CarWash < Sinatra::Base
  get '/' do
    # get the latest 20 cars
    @cars = Car.all(:order => [ :id.desc ], :limit => 20)
    erb :index
  end
end
