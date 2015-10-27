require 'restclient'

class Build

  POST_URL = "http://www.reddit.com/api/submit"
  DEFAULT_SUB = "testingHilarious"

  # # Re-Builds for submission.
  # # # # # # # # # # # # # # # #
  def initialize
    puts Time.now.strftime(CLOCK_FORMAT) << "Builder: It's hammer time."
    @posts = []
  end


  #
  # # # # # # # # # # # # # # # # # # #
  def build_posts(visits, online: false)
    if online
      visits.each do |visit|
        sleep(2) # This is how we be nice to Sites.
        #title text sr        kind uh
        #title body subreddit self userhash

        # title - visit.title
        # text - visit.text
        # sr - "testingHilarious"
        # kind - "self"
        # uh - "f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0"

        RestClient.post( POST_URL,
        { :title => visit.title,
          :text => " ",
          :sr => DEFAULT_SUB,
          :uh => "f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0" })

      end
    else
      puts Time.now.strftime(CLOCK_FORMAT) << "Builder: We're offline, captain!"
    end
  end

  def build_custom_posts(visits, sub, userhash, online: false)
    if online
      visits.each do |visit|
        sleep(2) # This is how we be nice to Sites.
        #title text sr        kind uh
        #title body subreddit self userhash

        # title - visit.title
        # text - visit.text
        # sr - "testingHilarious"
        # kind - "self"
        # uh - "f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0"

        RestClient.post( POST_URL,
        { :title => visit.title,
          :text => " ",
          :sr => sub,
          :uh => userhash })

      end
    else
      puts Time.now.strftime(CLOCK_FORMAT) << "Builder: We're offline, captain!"
    end
  end

end
