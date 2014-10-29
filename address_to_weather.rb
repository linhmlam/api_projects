require 'open-uri'
require 'json'

# If you experience an error relating to SSL,
#   uncomment the following two lines:

# require 'openssl'
# OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

# My API KEY: https://api.forecast.io/forecast/5ba14b15020f54a46d53a51646259dfe/37.8267,-122.423
puts "Let's get the weather forecast for your address."

puts "What is the address you would like to know the weather for?"
the_address = gets.chomp

url_safe_address = URI.encode(the_address)

# # Your code goes below.
url = "http://maps.googleapis.com/maps/api/geocode/json?address="+url_safe_address.to_s
raw_data = open(url).read
raw_data.class
raw_data.length

parsed_data = JSON.parse(raw_data)
parsed_data.class
parsed_data.keys

the_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]
the_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

url = "https://api.forecast.io/forecast/5ba14b15020f54a46d53a51646259dfe/" + the_latitude.to_s + "," +the_longitude.to_s
raw_data = open(url).read
raw_data.class
raw_data.length

parsed_data = JSON.parse(raw_data)
parsed_data.class
parsed_data.keys

the_temperature = parsed_data["currently"]["temperature"]
the_hour_outlook = parsed_data["minutely"]["summary"]
the_day_outlook = parsed_data["hourly"]["summary"]

# Ultimately, we want the following line to work when uncommented:

puts "The current temperature at #{the_address} is #{the_temperature} degrees."
puts "The outlook for the next hour is: #{the_hour_outlook}"
puts "The outlook for the next day is: #{the_day_outlook}"
