require 'sinatra'
require 'geocoder'

get '/' do
	@location = "Track IP Address."
  erb :index, :layout => :main_layout
end

post '/tracker' do
	@location = location(params[:ip_address])
	erb :tracker, :layout => :main_layout
end

def location(ip_address)
	if location = Geocoder.search(ip_address)
		return location
	else
		return "IP Address not found"
	end
end
