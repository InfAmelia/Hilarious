require 'open-uri'
require 'nokogiri'

# Parse Token: <div class="usertext-body may-blank-within md-container "><div class="md">

COMMENT_PARSE_KEY = '//div[@class="usertext-body may-blank-within md-container "]/div[@class="md"]'
URL_TO_PARSE = "https://www.reddit.com/r/gifs/comments/3o956q/everest_the_kitten_way/"
URL_TO_ITERATE = "http://www.reddit.com/r/gifs/"

doc = Nokogiri::HTML(open(URL_TO_PARSE))
doc.xpath(COMMENT_PARSE_KEY).each do |node|
  puts node.text
  puts
end
