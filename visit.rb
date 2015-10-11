class Visit

  # This will eventually be a model.
  # # # # # # #
  @title = ""
  @link = ""
  comments = Array.new



  # def initialize(link, title, comments)
  #   @link = link
  #   @title = title
  #   @comments = comments
  # end

  def initialize(link)

    @link = link
    @title = "Default"
    @comments = []

  end

  def print(index)
    puts "#{index}: #{@link} is now printing!"
  end


  def get_link
    return @link
  end

  def add_title(title)
    @title = title
  end

  def add_comments(comments)
    @comments = comments
  end

end
