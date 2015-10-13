
class Find

  # # Breaks Comments, Titles into words. Finds words that match "bad_words"
  # # # # # # # # # # # # # # # #
  def initialize
    @words = []
    @good_words = []
    @bad_words = []
    puts Time.now.strftime(CLOCK_FORMAT) << "Finder standing by."
  end

  def break_up_into_words(text)
    @words = text.split(" ")
  end

  # Given a string, break into words.
  # # # # # # # # # # # # # # # #
  def read_strings(strings)
    puts Time.now.strftime(CLOCK_FORMAT) << "Finder: Reading Strings!"
    strings.each do |string|
      break_up_into_words(string)
    end
  end

  # Given a Good / Bad words Dictionary, search for bad words and replace
  # them with good. Really loud method if verbose: true
  # # # # # # # # # # # # # # # #
  def substitute_words(verbose: false)
      # Build Good Words
      # # #
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
            puts "Comparing #{word} to #{bad_word}"
          end

          unless word.gsub!(bad_word, @good_words[index]) == nil
            puts Time.now.strftime(CLOCK_FORMAT) + "Finder: Substituting \"#{bad_word}\", for \"#{@good_words[index]}\""
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
