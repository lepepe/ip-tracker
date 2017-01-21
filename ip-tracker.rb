require 'sinatra'
require 'geocoder'

get '/' do
	@location = "Track IP Adress."
  erb :index
end

post '/' do
	@location = location(params[:ip_address])
	erb :index
end

def location(ip_address)
	if location = Geocoder.address(ip_address)
		return "#{location}"
	else
		return "IP Address not found"
	end
end
