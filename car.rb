require 'rubygems'
require 'sinatra'
require 'data_mapper'

DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/development.db")

#70s disco legends Rose Royce have fallen on hard times
#and have asked you to create a RESTFUL API in Sinatra
#that allows cars to be booked into their carwash for them

#The API should be able to

# - Create an appointment
# - Update the day of an appointment (Monday, Tuesday etc you don’t have to worry about time slots)
# - Delete an appointment
# - List all appointments
# - View a specific appointment

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
