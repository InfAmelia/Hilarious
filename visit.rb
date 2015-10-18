class Visit


  # # # # # # # # # # # # # # # #
  def initialize(link)
    @link = link
    @title = ""
    @comments = []
  end

  attr_accessor :link, :title, :comments

  # # # # # # # # # # # # # # # #
  def add_comment(comment)
    @comments.push(comment)
  end


  # # # # # # # # # # # # # # # #
  def print(index)
    puts "#{index}: #{@link} is now printing!"
    @comments.each_with_index do |comment, index|
      puts "#{index}: #{comment}"
    end
  end

end
