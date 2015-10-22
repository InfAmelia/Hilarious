class Find

  # # Breaks Comments, Titles into words. Finds words that match "bad_words"
  # # # # # # # # # # # # # # # #
  def initialize
    @words = []
    @good_words = []
    @bad_words = []
    puts Time.now.strftime(CLOCK_FORMAT) << "Finder standing by."
  end

  def break_up_string_into_words(string)

    words_temp = string.split(" ")
    @words.concat words_temp
  end

  def break_up_comments_into_string_array(comments)
      comment_text = []

      comments.each do |comment|
        comment_text << comment
      end

      read_array_of_strings(comment_text)
  end


  # def read_strings(strings)
  #   puts Time.now.strftime(CLOCK_FORMAT) << "Finder: Reading Comment!"
  #     strings.each do |string|
  #       break_up_string_into_words(string)
  #     end
  # end


  # Given a string, break into words.
  # SUPER LOUD.
  # # # # # # # # # # # # # # # #
  def read_array_of_strings(strings_ary, verbose: false)
    if verbose
      puts Time.now.strftime(CLOCK_FORMAT) << "Finder: Reading Titles!"
    end

    strings_ary.each do |string|
      break_up_string_into_words(string)
    end
  end

   def read_array_of_array_of_strings(strings_ary_ary)
     puts Time.now.strftime(CLOCK_FORMAT) << "Finder: Reading Site!"

       strings_ary_ary.each do |strings_ary|
         read_array_of_strings(strings_ary)
       end

    end

    def read_array_of_array_of_comments(comments_ary_ary)

      puts Time.now.strftime(CLOCK_FORMAT) << "Finder: Reading Comments!"
         comments_ary_ary.each do |comments_ary|
           break_up_comments_into_string_array(comments_ary)
         end

     end

  # Given a Good / Bad words Dictionary, search for bad words and replace
  # them with good. Really loud method if verbose: true
  # # # # # # # # # # # # # # # #
  def substitute_words_in_titles(titles_array, verbose: false)
      # Build Good Words
      # # #
      puts Time.now.strftime(CLOCK_FORMAT) << "Finder: I am now substituting titles."
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
          if (verbose)
            puts "\t     | Checking if #{title} contains #{bad_word}"
          end

           unless title.gsub!(/\b#{bad_word}/, @good_words[index]) == nil
            if verbose
              puts Time.now.strftime(CLOCK_FORMAT) << "Finder: Substituting \"#{bad_word}\", for \"#{@good_words[index]}\""
            end
          end
        end
      end

  end

  def substitute_words_in_comments(comments_array)

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

      end
    end

  end

  # Checks for a match in *already edited @words* array.
  # # # # # # # # # # # # # # # #
  def check_strings
    if @words.include? "holly"
      puts Time.now.strftime(CLOCK_FORMAT) << "Finder: Found one! #{node.text}"
    end
  end


  # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~@ Print Methods Below.
  # # # # # # # # # # # # # # # #
  def print_words
    puts @words
  end


  # Print each word\n
  # # # # # # # # # # # # # # # #
  def print_words
    @words.each do |word|
      puts word
    end
  end

end
