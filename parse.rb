

class Parse


URL_PARSE_KEY = '//a[@class="title may-blank "]/@href'
COMMENT_PARSE_KEY = '//div[@class="usertext-body may-blank-within md-container "]/div[@class="md"]'
TITLE_PARSE_KEY = '//a[@class="title may-blank "]'
URL_TO_PARSE = "https://www.reddit.com/r/gifs/comments/3o956q/everest_the_kitten_way/"
URL_TO_CRAWL = "https://www.reddit.com/r/gifs/"
OFFLINE_PARSE_URL = "./kittens.html"
OFFLINE_CRAWL_URL = "./gifshead.html"



def initialize
  @links = []
  @titles = []
  @comments = []

  puts @@clock.now.strftime(CLOCK_FORMAT ) + "Parser standing by."
end


# Crawls through URL_TO_CRAWL in order to find threads for parse_for_comments
# URL_PARSE_KEY dictates the current method of searching for links.
# # # # # # # # # # # # # # # #
def parse_for_links(online: true)
  puts @@clock.now.strftime(CLOCK_FORMAT) + "Parser: I am now parsing for links."

  if online
    sub = Nokogiri::HTML(open(URL_TO_CRAWL))
    sub.xpath(URL_PARSE_KEY).each do |node|
      puts @@clock.now.strftime(CLOCK_FORMAT) + "Parser: Found one! #{node.text}"
      @links << node.text
    end
  else
    sub = Nokogiri::HTML(open(OFFLINE_PARSE_URL))
    sub.xpath(URL_PARSE_KEY).each do |node|
      puts @@clock.now.strftime(CLOCK_FORMAT) + "Parser: Found one! #{node.text}"
      @links << node.text
    end
  end
end


# Crawls through URL_TO_CRAWL in order to find titles to later manipulate
# for hilarious ends. TODO Write Manip.
# COMMENT_PARSE_KEY dictates the current method of searching for links.
# # # # # # # # # # # # # # # #
def parse_for_titles(online: true)
  puts @@clock.now.strftime(CLOCK_FORMAT) + "Parser: I am now parsing for titles."

  if online
    titles = Nokogiri::HTML(open(URL_TO_CRAWL))
    titles.xpath(COMMENT_PARSE_KEY).each do |node|
      puts @@clock.now.strftime(CLOCK_FORMAT) + "Parser: Found one!"
      @titles << node.text
    end
  else
    titles = Nokogiri::HTML(open(OFFLINE_CRAWL_URL))
    titles.xpath(COMMENT_PARSE_KEY).each do |node|
      puts @@clock.now.strftime(CLOCK_FORMAT) + "Parser: Found one!"
      @titles << node.text
    end
  end
end

# Parses through URL_TO_PARSE in order to find comments to later manipulate
# for hilarious ends. TODO Write Manip.
# # # # # # # # # # # # # # # #
def parse_for_comments(url, online: true)
  if online
    thread = Nokogiri::HTML(open(url))
    thread.xpath(COMMENT_PARSE_KEY).each do |node|
      @comments << node.text
    end
  else
    thread = Nokogiri::HTML(open(url))
    thread.xpath(COMMENT_PARSE_KEY).each do |node|
      @comments << node.text
    end
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


### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Getters / Setters below.

def get_links
  @links
end

def get_titles
  @titles
end

### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Print Methods Below.


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


end
