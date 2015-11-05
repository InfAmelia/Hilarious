class Visit

  attr_accessor :link, :title, :comments, :users

  #
  # # # # # # # # # # # # # # # # # # #
  def initialize(link)
    @link = link
    @title = "  "
    @comments = []
    @users = []
  end

  #
  # # # # # # # # # # # # # # # # # # #
  def add_comment(comment)
    @comments << comment
  end

  #
  # # # # # # # # # # # # # # # # # # #
  def add_user(user)
    @users << user
  end

  #
  # # # # # # # # # # # # # # # # # # #
  def print(index)
    puts "#{index}: #{@link} is now printing!"
    @comments.each_with_index do |comment, index|
      puts "#{index}: #{comment}"
    end
  end

  #
  # # # # # # # # # # # # # # # # # # #
  def shift_comments(n)
    @comments.shift(n)
  end
end
