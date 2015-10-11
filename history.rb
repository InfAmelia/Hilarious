require 'open-uri'
require 'nokogiri'
require './visit.rb'
require './parse.rb'

class History


  def initialize()
    puts "Creating new history of visits"
    @visits = []
  end

  def add_visit(visit)
    @visits.push(visit)
    puts "Added: #{visit}"
  end

  def print_at(index)
    @visits[index].print(index)
  end

  def print_all
    @visits.each_with_index do |visit, index|
      visit.print(index)
    end
  end

  def add_links(links)
    links.each do |link|
      add_visit(Visit.new(link))
    end
  end

  def add_titles_to_current_visit(titles)
    titles.each_with_index do |title, index|
      @visits[index].add_title(title)
    end
  end

  def add_commentses_to_current_visit(commentses)
    commentses.each_with_index do |comments, index|
      @commentses[index].add_comments(comments)
    end
  end

  def parse_for_commentses()

    @visits.each_with_index do |visit, index|
      unless index == 0
        comments = Nokogiri::HTML(open(visit.get_link))
        comments.xpath(URL_PARSE_KEY).each do |comment|
        visit[index].comments.push(comment)
          end
      end
    end
  end

end
