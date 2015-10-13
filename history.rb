# require 'open-uri'
# require 'nokogiri'
# require './visit.rb'
# require './parse.rb'

class History

  # # # # # # # # # # # # # # # # # # #
  def initialize()
    puts Time.now.strftime(CLOCK_FORMAT) << "Historian standing by."
    @visits = []
    @commentses = []
  end

  # # # # # # # # # # # # # # # # # # #
  def add_visit(visit)
    puts Time.now.strftime(CLOCK_FORMAT) << "Historian: I have added this visit: #{visit}"
    @visits.push(visit)
  end



  # # # # # # # # # # # # # # # # # # #
  def add_links(links)
    links.each do |link|
      puts Time.now.strftime(CLOCK_FORMAT) << "Historian: I have added this link: #{link}"
      add_visit(Visit.new(link))
    end
  end

  # # # # # # # # # # # # # # # # # # #
  def add_titles_to_current_visit(titles)
    titles.each_with_index do |title, index|
      puts Time.now.strftime(CLOCK_FORMAT) << "Historian: I have added a title."
      @visits[index].add_title(title)
    end
  end


  # # # # # # # # # # # # # # # # # # #
  def add_commentses_to_current_visit(commentses)
    commentses.each_with_index do |comments, index|
      puts Time.now.strftime(CLOCK_FORMAT) << "Historian: I have added comments to #{visit[index]}"
      @commentses[index].add_comments(comments)
    end
  end

  #
  # # # # # # # # # # # # # # # # # # #
  def parse_for_commentses()
    @visits.each_with_index do |visit, index|
      if (visit.get_link == "/r/gifs/comments/3dasau/rgifs_rules_please_read_before_submitting_or/")
        comments = Nokogiri::HTML(open("https://www.reddit.com" << visit.get_link))
        comments.xpath(URL_PARSE_KEY).each do |comment|
        visit[index].add_comment(comment)
          end
      else
        comments = Nokogiri::HTML(open(visit.get_link))
        comments.xpath(URL_PARSE_KEY).each do |comment|
        visit[index].add_comment(comment)
          end
      end
    end
  end

  # # # # # # # # # # # # # # # #
  def check_out_titles
    text = []
    @visits.each do |visit|
      text << visit.get_title
    end
    text
  end

  # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~@ Print Methods Below.

  # # # # # # # # # # # # # # # # # # #
  def print_at(index)
    @visits[index].print(index)
  end

  # # # # # # # # # # # # # # # # # # #
  def print_all
    @visits.each_with_index do |visit, index|
      visit.print(index)
    end
  end

end
