require 'sinatra'
require 'config_env'
require_relative 'models/weather.rb'
require 'httparty'
require 'uri'
require 'redis'
ConfigEnv.init("#{__dir__}/config/env.rb")

REDIS = Redis.new(url: ENV['REDIS_URL'])
set :port, 3000

get '/' do
  @cities = [
    "Valencia,ES",
    "Ojos Negros,ES",
    "Almussafes,ES",
    "Madrid,ES"
  ]

  @city = params[:city] || "Valencia,ES"
  weather = Weather.new(@city)
  @temp = weather.temp
  @icons = weather.icons
  erb :index
end