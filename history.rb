#require 'open-uri'
class History


      URL_PARSE_KEY = '//a[@class="title may-blank "]/@href'
  COMMENT_PARSE_KEY = '//div[@class="usertext-body may-blank-within md-container "]/div[@class="md"]/p'
    TITLE_PARSE_KEY = '//a[@class="title may-blank "]'
     USER_PARSE_KEY = "//a[contains(@class,'author may-blank id-')]"

  OFFLINE_PARSE_URL = "./plane.html"
  OFFLINE_CRAWL_URL = "./newgifshead.html"

  STICKY_COMMENTS = 7

  #
  # # # # # # # # # # # # # # # # # # #
  def initialize()
    puts Time.now.strftime(CLOCK_FORMAT) << "Historian: Checking dewey decimal system."
    @visits = []
    commentses = []
  end

  attr_accessor :visits

  #
  # # # # # # # # # # # # # # # # # # #
  def add_visit(visit, verbose: false)
    if verbose
      puts Time.now.strftime(CLOCK_FORMAT) << "Historian: I have added this visit: #{visit}"
    end
    @visits << (visit)
  end

  # Creates visits given links.
  # # # # # # # # # # # # # # # # # # #
  def add_links(links, verbose: false)
    puts Time.now.strftime(CLOCK_FORMAT) << "Historian: I am now adding links."
    links.each do |link|
      if verbose
        if link.size > 35
          puts Time.now.strftime(CLOCK_FORMAT) << "Historian: I have added this link: ... it's a big one!"
        else
          puts Time.now.strftime(CLOCK_FORMAT) << "Historian: I have added this link: #{link}"
        end
      end

      add_visit(Visit.new(URI.escape(link)), verbose: verbose)
    end
  end

  # Adds titles to corresponding visits.
  # # # # # # # # # # # # # # # # # # #
  def add_titles_to_current_visits(titles, verbose: false)
    puts Time.now.strftime(CLOCK_FORMAT) << "Historian: I am now adding titles."

    titles.each_with_index do |title, index|
      if verbose
        puts Time.now.strftime(CLOCK_FORMAT) << "Historian: I have added a title."
      end
        @visits[index].title=(title) unless @visits[index] == nil
      end
  end

  # Parses through each visit looking for comments (matching regex), and users (diff regex)
  # and adds them to their corresponding visit.
  # # # # # # # # # # # # # # # # # # #
  def add_comments_to_current_visits(online: false)

    puts Time.now.strftime(CLOCK_FORMAT) << "Historian: I am now adding comments."

    if online
      @visits.each_with_index do |visit, index|
        if (visit.link == "/r/gifs/comments/3dasau/rgifs_rules_please_read_before_submitting_or/")
          comments = Nokogiri::HTML(open("https://www.reddit.com" << visit.link))
          comments.xpath(COMMENT_PARSE_KEY).each do |comment|
          visit.add_comment(comment.text)
          end
        else
          begin
            comments = Nokogiri::HTML(open(visit.link))
          rescue OpenURI::HTTPError => error
              puts error
          end

          comments.xpath(COMMENT_PARSE_KEY).each do |comment|
            visit.add_comment(comment.text)
          end
          comments.xpath(USER_PARSE_KEY).each do |user|
            visit.add_user(user.text)
          end
        end
          visit.shift_comments(STICKY_COMMENTS)
      end
    else
      @visits.each_with_index do |visit, index|
        if index == 2
          comments = Nokogiri::HTML(open("./plane.html"))

          comments.xpath(COMMENT_PARSE_KEY).each do |comment|
            visit.add_comment(comment.text)
          end
          comments.xpath(USER_PARSE_KEY).each do |user|
            visit.add_user(user.text)
          end
          visit.shift_comments(STICKY_COMMENTS)
        end
      end
    end
  end

  # Adds users to visits.
  # # # # # # # # # # # # # # # # # # #
  def add_users_to_current_visits(users)
    @visits.each do |visit|
      visit.users = users
    end
  end

  # Shifts from front of array n spaces.
  # # # # # # # # # # # # # # # # # # #
  def shift_visits(n)
    if n > 1
      plural = "s"
    end
    puts Time.now.strftime(CLOCK_FORMAT) << "Historian: Cleaning up the mess: #{n} visit#{plural} removed."
    @visits.shift(n)
  end

  # Provides link to titles for manipulation.
  # # # # # # # # # # # # # # # # # # #
  def check_out_titles
    titles = []
      @visits.each do |visit|
        titles << visit.title
      end
    return titles
  end

  # Provides link to comments for manipulation.
  # # # # # # # # # # # # # # # # # # #
  def check_out_comment_library
    comments = []
      @visits.each do |visit|
        comments << visit.comments
      end
    return comments
  end

  #
  # # # # # # # # # # # # # # # # # # #
  def print_at(index)
    @visits.each do |visit|
      visit.comments.each_with_index do |comment, index|
        puts "\t | #{index}: #{comment}"
        puts
      end
    end
  end

  # Print each visit #, comments, and their user
  # # # # # # # # # # # # # # # # # # #
  def print_all(verbose: false)
    if verbose
      @visits.each_with_index do |visit, index|
        puts "\t     | #{index}: #{visit} ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "\t     |   > Title: \"#{visit.title}\""
        puts "\t     |   > Link: #{visit.link}"
          visit.comments.each_with_index do |comment, index|
            puts "\t     |   >> \"#{comment}\" - #{visit.users[index]}"
          end
      end
    end
  end

  # Print just titles for each visit.
  # # # # # # # # # # # # # # # # # # #
  def print_most(verbose: false)
    if verbose
        puts "|            |"
      @visits.each_with_index do |visit, index|
        puts "|            | #{index}: #{visit}:  \"#{visit.title}\""
        puts "|            |"
      end
    end
  end
end
