require 'open-uri'
require 'nokogiri'
require './visit.rb'
require './history.rb'
require './parse.rb'
require './find.rb'
require './build.rb'

LOUD = false
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
          parser.parse_for_comments("./molamola.html")

          # Build Unique Visit information
          historian.add_links(parser.links)
          historian.add_titles_to_current_visits(parser.titles)
          historian.add_comment(parser.comments)

          # Find words to swap
          finder.read_array_of_strings(historian.check_out_titles, verbose: LOUD)
          finder.read_array_of_array_of_strings(historian.check_out_comments)
          finder.substitute_words(verbose: LOUD)
          # Build new submissions (Title + Comments (w/ Users))
          # Submit them.
          builder.status

          end_time = Time.now
          runtime = end_time - start_time
          puts Time.now.strftime(CLOCK_FORMAT) << "Total Runtime: #{runtime} seconds."

    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~@"
