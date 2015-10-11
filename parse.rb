require 'open-uri'
require 'nokogiri'
require './visit.rb'
require './history.rb'

URL_PARSE_KEY = '//a[@class="title may-blank "]/@href'
COMMENT_PARSE_KEY = '//div[@class="usertext-body may-blank-within md-container "]/div[@class="md"]'
TITLE_PARSE_KEY = '//a[@class="title may-blank "]'
URL_TO_PARSE = "https://www.reddit.com/r/gifs/comments/3o956q/everest_the_kitten_way/"
URL_TO_CRAWL = "https://www.reddit.com/r/gifs/"

@links = Array.new
@titles = Array.new
@comments = Array.new
@commentses = Array.new




# Crawls through URL_TO_CRAWL in order to find threads for parse_for_comments
# URL_PARSE_KEY dictates the current method of searching for links.
# # # # # # # # # # # # # # # #
def parse_for_links
  sub = Nokogiri::HTML(open(URL_TO_CRAWL))
  sub.xpath(URL_PARSE_KEY).each do |node|
    @links.push(node.text)
  end
end


# Crawls through URL_TO_CRAWL in order to find titles to later manipulate
# for hilarious ends. TODO Write Manip.
# COMMENT_PARSE_KEY dictates the current method of searching for links.
# # # # # # # # # # # # # # # #
def parse_for_titles
  titles = Nokogiri::HTML(open(URL_TO_CRAWL))
  titles.xpath(COMMENT_PARSE_KEY).each do |node|
    @titles.push(node.text)
  end
end

# Parses through URL_TO_PARSE in order to find comments to later manipulate
# for hilarious ends. TODO Write Manip.
# # # # # # # # # # # # # # # #
def parse_for_comments(url)
  thread = Nokogiri::HTML(open(url))
  thread.xpath(COMMENT_PARSE_KEY).each do |node|
    @comments.push(node.text)
  end
end

# Checks @links any contents at all.
# If empty, save some time and don't try and print anything.
# # # # # # # # # # # # # # # #
def empty_links?
  if @links.empty?
    puts "Something is wrong with crawling for links."
  end
end


# Prints all links gathered by parse_for_links
#
# # # # # # # # # # # # # # # #
def print_all_links
  @links.each do |link|
    puts link
  end
end


# Prints all links gathered by parse_for_comments
#
# # # # # # # # # # # # # # # #
def print_all_comments
  @comments.each do |comment|
    puts comment
  end
end

# Prints all links gathered by parse_for_comments
#
# # # # # # # # # # # # # # # #
def print_all_titles
  @titles.each do |title|
    puts title
  end
end


parse_for_links
parse_for_titles
parse_for_comments(URL_TO_PARSE)

h = History.new
h.add_links(@links)
h.add_titles_to_current_visit(@titles)
h.parse_for_commentses

h.print_all
