class History

  # # # # # # # # # # # # # # # # # # #
  def initialize()
    puts Time.now.strftime(CLOCK_FORMAT) << "Historian standing by."
    @visits = []
    @commentses = []
  end

  # # # # # # # # # # # # # # # # # # #
  def add_visit(visit, verbose: false)
    if verbose
      puts Time.now.strftime(CLOCK_FORMAT) << "Historian: I have added this visit: #{visit}"
    end
    @visits.push(visit)
  end



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

        add_visit(Visit.new(link))
    end
  end

  # # # # # # # # # # # # # # # # # # #
  def add_titles_to_current_visits(titles, verbose: false)
    puts Time.now.strftime(CLOCK_FORMAT) << "Historian: I am now adding titles."

    titles.each_with_index do |title, index|
      if verbose
        puts Time.now.strftime(CLOCK_FORMAT) << "Historian: I have added a title."
      end
      @visits[index].title=(title)
    end
  end


  def add_comment(comments)
    puts Time.now.strftime(CLOCK_FORMAT) << "Historian: I am now adding a comment."

    @visits[0].comments=(comments)
  end

  # THESE NEED WORK
  # # # # # # # # # # # # # # # # # # #
  def add_commentses_to_current_visits(commentses)
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
    titles = []
      @visits.each do |visit|
        titles << visit.title
      end
    return titles
  end

  def check_out_comments
    comments = []
      @visits.each do |visit|
        comments << visit.comments
      end
    comments
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
