class Find

  # # Breaks Comments, Titles into words. Finds words that match "bad_words"
  # # # # # # # # # # # # # # # #
  def initialize
         @words = []
    @good_words = []
     @bad_words = []
    puts Time.now.strftime(CLOCK_FORMAT) << "Finder: Reading Where's Waldo."
  end

  #
  # # # # # # # # # # # # # # # # # # #
  def break_up_string_into_words(string)
    words_temp = string.split(" ")
    @words.concat words_temp
  end

  #
  # # # # # # # # # # # # # # # # # # #
  def substitute_titles(titles_array, verbose: false)
    puts Time.now.strftime(CLOCK_FORMAT) << "Finder: I am now subtituting titles."
    substitute_words_in_titles(titles_array, verbose: verbose)
  end


  # Given a Good / Bad words Dictionary, search for bad words and replace
  # them with good. Really loud method if verbose: true
  # # # # # # # # # # # # # # # #
  def substitute_words_in_titles(titles_array, verbose: false)
      # Build Good Words
      # # #
      File.open("./good_words.txt") do |f|
          f.each_line do |line|
              @good_words << line.chomp
          end
      end

      # Build Bad Words
      # # #
      File.open("./bad_words.txt") do |f|
        f.each_line do |line|
          @bad_words << line.chomp
        end
      end
      # Checks given words for matches in bad_words
      # # #

      titles_array.each do |title|
        @bad_words.each_with_index do |bad_word, index|
          if verbose
            sleep(0.0167) # Ensures smooth movement - 60 fps - processing time
            puts "|            | " << "Checking if #{title} contains #{bad_word}"
          end

           unless title.gsub!(/\b#{bad_word}/, @good_words[index]) == nil
            if verbose
              puts "|            | " << "Finder: Substituting \"#{bad_word}\", for \"#{@good_words[index]}\""
            end
          end
        end
      end

  end

  #
  # # # # # # # # # # # # # # # # # # #
  def substitute_words_in_comments(comments_array, verbose: false)
    puts Time.now.strftime(CLOCK_FORMAT) << "Finder: I am now substituting comments."
    File.open("./good_words.txt") do |f|
        f.each_line do |line|
            @good_words << line.chomp
        end
    end

    File.open("./bad_words.txt") do |f|
      f.each_line do |line|
        @bad_words << line.chomp
      end
    end

    comments_array.each do |comments|
      # each post ^
      comments.each do |comment|
        # each comment in post ^
        @bad_words.each_with_index do |bad_word, index|
          unless comment.gsub!(/\b#{bad_word}/, @good_words[index]) == nil
            if verbose
              sleep(0.0167) # Ensures smooth movement => 60 fps - processing time
              puts "|            | " << "Finder: Substituting \"#{bad_word}\", for \"#{@good_words[index]}\""
            end
          end
        end
      end
    end
  end
end
