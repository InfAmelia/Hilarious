class Parse

           URL_PARSE_KEY = '//a[@class="title may-blank "]/@href'
         TITLE_PARSE_KEY = '//a[@class="title may-blank "]'
      GIFSHEAD_PARSE_KEY = '//a[@class="comments may-blank"]/@href'

            URL_TO_CRAWL = "https://www.reddit.com/r/gifs/"

       OFFLINE_PARSE_URL = "./plane.html"
       OFFLINE_CRAWL_URL = "./newgifshead.html"

#
# # # # # # # # # # # # # # # # # # #
  def initialize
     @links = []
    @titles = []
   @comments = []
      @users = []
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

  # Prints all links gathered by parse_for_links
  # # # # # # # # # # # # # # # #
  def print_all_links
    @links.each do |link|
      puts link
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
