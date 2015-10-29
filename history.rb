#require 'open-uri'
class History


      URL_PARSE_KEY = '//a[@class="title may-blank "]/@href'
  COMMENT_PARSE_KEY = '//div[@class="usertext-body may-blank-within md-container "]/div[@class="md"]/p'
    TITLE_PARSE_KEY = '//a[@class="title may-blank "]'

  URL_TO_PARSE = "https://www.reddit.com/r/gifs/comments/3okq6n/in_a_rare_encounter_divers_come_facetoface_with/"
  URL_TO_CRAWL = "https://www.reddit.com/r/gifs/"

  OFFLINE_PARSE_URL = "./plane.html"
  OFFLINE_CRAWL_URL = "./newgifshead.html"

  STICKY_COMMENTS = 8


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
    @visits.push(visit)
  end



  #
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



  #
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

  #
  # # # # # # # # # # # # # # # # # # #
  def add_array_of_array_of_comments(c, online: false)

    puts Time.now.strftime(CLOCK_FORMAT) << "Historian: I am now adding comments."

    if online
      @visits.each_with_index do |visit, index|
        if (visit.link == "/r/gifs/comments/3dasau/rgifs_rules_please_read_before_submitting_or/")
          comments = Nokogiri::HTML(open("https://www.reddit.com" << visit.link))
          comments.xpath(COMMENT_PARSE_KEY).each do |comment|
          visit.add_comment(comment.text)
          end
        else
          comments = Nokogiri::HTML(open(visit.link))
          comments.xpath(COMMENT_PARSE_KEY).each do |comment|
          visit.add_comment(comment.text)
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
          visit.shift_comments(STICKY_COMMENTS)
        end
      end
    end
  end


  def shift_visits(n)
      if n > 1
        plural = "s"
      end
      puts Time.now.strftime(CLOCK_FORMAT) << "Historian: Cleaning up the mess: #{n} visit#{plural} removed."
      @visits.shift(n)
  end
  #
  # # # # # # # # # # # # # # # # # # #
  def check_out_titles
    titles = []
      @visits.each do |visit|
        titles << visit.title
      end
    return titles
  end

  #
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

  #
  # # # # # # # # # # # # # # # # # # #
  def print_all(verbose: false)
    if verbose
      @visits.each_with_index do |visit, index|
        puts "\t\t   | #{index}: #{visit.inspect}"
        puts
      end
    end
  end
end
