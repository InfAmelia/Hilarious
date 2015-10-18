class Parse


URL_PARSE_KEY = '//a[@class="title may-blank "]/@href'
COMMENT_PARSE_KEY = '//div[@class="usertext-body may-blank-within md-container "]//div[@class="md"]'
TITLE_PARSE_KEY = '//a[@class="title may-blank "]'
URL_TO_PARSE = "https://www.reddit.com/r/gifs/comments/3okq6n/in_a_rare_encounter_divers_come_facetoface_with/"
URL_TO_CRAWL = "https://www.reddit.com/r/gifs/"
OFFLINE_PARSE_URL = "./molamola.html"
OFFLINE_CRAWL_URL = "./gifshead.html"


# # # # # # # # # # # # # # # #
def initialize
  @links = []
  @titles = []
  @comments = []

  puts Time.now.strftime(CLOCK_FORMAT) << "Parser standing by."
end

attr_accessor :links, :titles, :comments

# Crawls through URL_TO_CRAWL in order to find threads for parse_for_comments
# URL_PARSE_KEY dictates the current method of searching for links.
# # # # # # # # # # # # # # # #
def parse_for_links(online: true, verbose: false)
  puts Time.now.strftime(CLOCK_FORMAT) << "Parser: I am now parsing for links."

  if online
    sub = Nokogiri::HTML(open(URL_TO_CRAWL))
    sub.xpath(URL_PARSE_KEY).each do |node|
      @links << node.text
      if verbose
        if node.text.size > 35
          puts Time.now.strftime(CLOCK_FORMAT) << "Parser: Found one! ... it's a big one!"
        else
          puts Time.now.strftime(CLOCK_FORMAT) << "Parser: Found one! #{node.text}"
        end
      end
    end
  else
    sub = Nokogiri::HTML(open(OFFLINE_CRAWL_URL))
    sub.xpath(URL_PARSE_KEY).each do |node|
      @links << node.text
      if verbose
        if node.text.size > 35
          puts Time.now.strftime(CLOCK_FORMAT) << "Parser: Found one! ... it's a big one!"
        else
          puts Time.now.strftime(CLOCK_FORMAT) << "Parser: Found one! #{node.text}"
        end
      end
    end
  end
end


# Crawls through URL_TO_CRAWL in order to find titles to later manipulate
# for hilarious ends.
# COMMENT_PARSE_KEY dictates the current method of searching for links.
# # # # # # # # # # # # # # # #
def parse_for_titles(online: true, verbose: false)
  puts Time.now.strftime(CLOCK_FORMAT) << "Parser: I am now parsing for titles."

  if online
    titles = Nokogiri::HTML(open(URL_TO_CRAWL))
    titles.xpath(TITLE_PARSE_KEY).each do |node|
      if verbose
        puts Time.now.strftime(CLOCK_FORMAT) << "Parser: Found one!"
      end
      @titles << node.text
    end
  else
    titles = Nokogiri::HTML(open(OFFLINE_CRAWL_URL))
    titles.xpath(TITLE_PARSE_KEY).each do |node|
      if verbose
        puts Time.now.strftime(CLOCK_FORMAT) << "Parser: Found one!"
      end
      @titles << node.text
    end
  end
end

# Parses through URL_TO_PARSE in order to find comments to later manipulate
# for hilarious ends.
# # # # # # # # # # # # # # # #
def parse_for_comments(url, online: true)
  puts Time.now.strftime(CLOCK_FORMAT) << "Parser: I am now parsing for comments."

                                                          # TODO CONT.
  if online                                               # 1. Gather Usernames.
    thread = Nokogiri::HTML(open(url))                    # 2. Build Comment per Username.
    thread.xpath(COMMENT_PARSE_KEY).each do |node|        # 3. Gather text-bodies.
      @comments << Comment.new.text=(node.text)                           # 4. Add text-bodies to Comments.
    end
  else
    thread = Nokogiri::HTML(open(url))
    thread.xpath(COMMENT_PARSE_KEY).each do |node|
      @comments << Comment.new.text=(node.text)
    end
  end
end

# Checks @links for any content at all.
# If empty, save some time and don't try and print anything.
# # # # # # # # # # # # # # # #
def empty_links?
  if @links.empty?
    puts "Something is wrong with crawling for links."
  end
end





### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~@ Print Methods Below.


# Prints all links gathered by parse_for_links
# # # # # # # # # # # # # # # #
def print_all_links
  @links.each do |link|
    puts link
  end
end


# Prints all links gathered by parse_for_comments
# # # # # # # # # # # # # # # #
def print_all_comments
  @comments.each do |comment|
    puts comment
  end
end

# Prints all links gathered by parse_for_comments
# # # # # # # # # # # # # # # #
def print_all_titles
  @titles.each do |title|
    puts title
  end
end


end

class Comment

  def initialize
    @user = user
    @text = text
  end

  attr_accessor :user, :text


end
