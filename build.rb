class Build

  # # Re-Builds for submission.
  # # # # # # # # # # # # # # # #
  def initialize
    puts Time.now.strftime(CLOCK_FORMAT) << "Builder standing by."
  end



  def build_post(title, comments, content: nil)

  end

  def status
    puts Time.now.strftime(CLOCK_FORMAT) << "Builder: Twiddling thumbs."
  end



end
