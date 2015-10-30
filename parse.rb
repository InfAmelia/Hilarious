class Parse


     URL_PARSE_KEY = '//a[@class="title may-blank "]/@href'
 COMMENT_PARSE_KEY = '//div[@class="usertext-body may-blank-within md-container "]//div[@class="md"]'
   TITLE_PARSE_KEY = '//a[@class="title may-blank "]'
GIFSHEAD_PARSE_KEY = '//a[@class="comments may-blank"]/@href'

URL_TO_PARSE = "https://www.reddit.com/r/gifs/comments/3okq6n/in_a_rare_encounter_divers_come_facetoface_with/"
URL_TO_CRAWL = "https://www.reddit.com/r/gifs/"

OFFLINE_PARSE_URL = "./plane.html"
OFFLINE_CRAWL_URL = "./newgifshead.html"

SUB_JUNK_COMMENT_NUM = 10
 STICKIED_TITLES_NUM = 2


#
# # # # # # # # # # # # # # # # # # #
def initialize
     @links = []
    @titles = []
  @comments = []

  puts Time.now.strftime(CLOCK_FORMAT) << "Parser: I'm squinting really hard."
end

attr_accessor :links, :titles, :comments

# Crawls through URL_TO_CRAWL in order to find threads for parse_for_comments
# URL_PARSE_KEY dictates the current method of searching for links.
# # # # # # # # # # # # # # # #
def parse_for_links(online: false, verbose: false)
  puts Time.now.strftime(CLOCK_FORMAT) << "Parser: I am now parsing for links."

  if online
    sub = Nokogiri::HTML(open(URL_TO_CRAWL))
    sub.xpath(GIFSHEAD_PARSE_KEY).each do |node|
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
    sub.xpath(GIFSHEAD_PARSE_KEY).each do |node|
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
def parse_for_comments(url, online: false)
  #if url != "/r/gifs/comments/3dasau/rgifs_rules_please_read_before_submitting_or/"
    puts Time.now.strftime(CLOCK_FORMAT) << "Parser: I am now parsing for comments."
    if online
      thread = Nokogiri::HTML(open(url))
      thread.xpath(COMMENT_PARSE_KEY).each_with_index do |node, index|
           @comments << Comment.new.text=(node.text)
      end
    else
      thread = Nokogiri::HTML(open(url))
      thread.xpath(COMMENT_PARSE_KEY).each_with_index do |node, index|
          @comments << Comment.new.text=(node.text)
      end
    end
  #end
end

#
# # # # # # # # # # # # # # # # # # #
def parse_for_comments_from_visits(visits, online: false, verbose: false)
  if online
    visits.each do |visit|
      unless visit == nil
        parse_for_comments(visit.link, online: online)
      end
    end
  else
    visits.each_with_index do |visit, index|
      unless visit == nil
        if index == 3
          parse_for_comments(OFFLINE_CRAWL_URL)
        end
      end
    end
  end
end

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

end # End Parse Class

class Comment

  def initialize
    @user = user
    @text = text
  end


  attr_accessor :user, :text

end
