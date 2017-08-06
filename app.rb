require 'sinatra'
require 'config_env'
require 'httparty'
ConfigEnv.init("#{__dir__}/config/env.rb")

set :port, 3000

get '/' do
  resp = HTTParty.get("http://api.openweathermap.org/data/2.5/weather?q=Valencia,ES&APPID=#{ENV['OW_KEY']}")
  data= JSON.parse(resp.body) 
  @temp = (data['main']['temp'] - 273.15).round(2)
  erb :index
end