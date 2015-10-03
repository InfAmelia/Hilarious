require 'rubygems'
require 'nokogiri'
require 'open-uri'

url = URI.parse('http://www.google.com')
open(url) do |http|
    response = http.read
    puts "response: #{response.inspect}"
end

