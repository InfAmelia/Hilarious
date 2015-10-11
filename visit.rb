class Visit

  # This will eventually be a model.
  # # # # # # #
  @title = ""
  @link = ""
  comments = Array.new

  def initialize(link, title, comments)
    @link = link
    @title = title
    @comments = comments
  end



  def print
    puts @link
    puts @title
    @comments.each do |comment|
      puts comment
    end
  end


end
