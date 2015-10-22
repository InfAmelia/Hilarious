require 'open-uri'
require 'nokogiri'
require './visit.rb'
require './history.rb'
require './parse.rb'
require './find.rb'
require './build.rb'

LOUD = false
CLOCK_FORMAT = "|%T.%L| "
ONLINE = false

          start_time = Time.now
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~@"

          # Execution Order #
          parser = Parse.new
          historian = History.new
          finder = Find.new
          builder = Build.new

          # Isolate Key Elements
          parser.parse_for_links(online: ONLINE, verbose: LOUD)
          parser.parse_for_titles(online: ONLINE, verbose: LOUD)
          #parser.parse_for_comments("./molamola.html", online: ONLINE)

          # Build Unique Visit information
          historian.add_links(parser.links, verbose: LOUD)
          historian.add_titles_to_current_visits(parser.titles, verbose: LOUD)
          historian.add_array_of_array_of_comments(parser.parse_for_comments_from_visits(historian.visits, online: ONLINE), online: ONLINE)

          #historian.add_array_of_array_of_comments(parser.parse_for_comments_from_visits(historian.visits, online: ONLINE, verbose: LOUD), online: ONLINE)

          # Find words to swap
          puts Time.now.strftime(CLOCK_FORMAT) << "Finder: Reading Titles!" #lazy
          finder.substitute_words_in_titles(historian.check_out_titles, verbose: true)
          finder.substitute_words_in_comments([])
          # Build new submissions (Title + Comments (w/ Users))
          # Submit them.
          builder.status

          historian.print_all(verbose: true)



          end_time = Time.now
          runtime = end_time - start_time
          puts Time.now.strftime(CLOCK_FORMAT) << "Total Runtime: #{runtime} seconds."

    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~@"
