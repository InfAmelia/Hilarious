class Visit


  # # # # # # # # # # # # # # # #
  def initialize(link)
    @link = link
    @title = "Default"
    @comments = []
  end



  # # # # # # # # # # # # # # # #
  def add_comment(comment)
    @comments.push(comment)
  end

  # # # # # # # # # # # # # # # #
  def get_link
    @link
  end

  # # # # # # # # # # # # # # # #
  def get_title
    @title
  end

  # # # # # # # # # # # # # # # #
  def add_title(title)
    @title = title
  end

  # # # # # # # # # # # # # # # #
  def add_comments(comments)
    @comments = comments
  end

  # # # # # # # # # # # # # # # #
  def print(index)
    puts "#{index}: #{@link} is now printing!"
    @comments.each_with_index do |comment, index|
      puts "#{index}: #{comment}"
    end
  end

end


  class Comment

    def initialize(user, text)
      @user = user
      @text = text
    end

  end
