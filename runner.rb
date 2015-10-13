require 'open-uri'
require 'nokogiri'
require './visit.rb'
require './history.rb'
require './parse.rb'
require './find.rb'
require './build.rb'

#require './kittens.html'
#require './gifshead.html'

CLOCK_FORMAT = "|%T.%L| "

          start_time = Time.now
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~@"
          # Execution Order #
          parser = Parse.new
          historian = History.new
          finder = Find.new
          builder = Build.new

          # Isolate Key Elements
          parser.parse_for_links(online: false)
          parser.parse_for_titles(online: false)

          # Build Unique Visit information
          historian.add_links(parser.get_links)
          historian.add_titles_to_current_visit(parser.get_titles)

          # Find words to swap
          finder.read_strings(historian.check_out_titles)
          finder.substitute_words(verbose: false)

          # Build new submissions (Title + Comments (w/ Users))
          # Submit them.

          end_time = Time.now
          puts "\n\t     | Total Runtime: #{end_time - start_time} milliseconds."
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~@"
