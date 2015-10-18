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
  def substitute_words(verbose: false)
      # Build Good Words
      # # #
      puts Time.now.strftime(CLOCK_FORMAT) << "Finder: I am now substituting words."
      File.open("./good_words") do |f|
          f.each_line do |line|
              @good_words << line.chomp
          end
      end

      # Build Bad Words
      # # #
      File.open("./bad_words") do |f|
        f.each_line do |line|
          @bad_words << line.chomp
        end
      end

      # Checks given words for matches in bad_words
      # # #
      @words.each do |word|
        @bad_words.each_with_index do |bad_word, index|
          if (verbose)
            puts "\t     | Comparing #{word} to #{bad_word}"
          end

          unless word.gsub!(bad_word, @good_words[index]) == nil
            if verbose
              puts Time.now.strftime(CLOCK_FORMAT) << "Finder: Substituting \"#{bad_word}\", for \"#{@good_words[index]}\""
            end
          end
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
