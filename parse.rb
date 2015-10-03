require 'open-uri'
require 'nokogiri'

doc = Nokogiri::HTML(open("http://www.reddit.com/r/gifs/.xml"))
doc.xpath('//item/title').each do |node|
  puts node.text  
end
