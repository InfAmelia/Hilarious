require 'open-uri'
require 'nokogiri'
require './visit.rb'
require './history.rb'
require './parse.rb'
require './find.rb'
require './build.rb'

LOUD = true
CLOCK_FORMAT = "|%T.%L| "
ONLINE = true

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
          parser.parse_for_comments("./molamola.html", online: ONLINE)

          # Build Unique Visit information
          historian.add_links(parser.links, verbose: LOUD)
          historian.add_titles_to_current_visits(parser.titles, verbose: LOUD)
          historian.add_array_of_array_of_comments(parser.parse_for_comments_from_visits(historian.visits, online: ONLINE), online: ONLINE)

          parser.parse_for_comments_from_visits(historian.visits, online: ONLINE, verbose: LOUD)
          # Find words to swap
          finder.read_array_of_strings(historian.check_out_titles, verbose: LOUD)
          puts Time.now.strftime(CLOCK_FORMAT) << "Finder: Reading Titles!" #lazy
          finder.read_array_of_array_of_comments(historian.check_out_comment_library)
          finder.substitute_words(verbose: LOUD)
          # Build new submissions (Title + Comments (w/ Users))
          # Submit them.
          builder.status

          if LOUD
            historian.print_all
          end

          end_time = Time.now
          runtime = end_time - start_time
          puts Time.now.strftime(CLOCK_FORMAT) << "Total Runtime: #{runtime} seconds."

    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~@"
