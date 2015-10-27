require 'open-uri'
require 'nokogiri'
require './visit.rb'
require './history.rb'
require './parse.rb'
require './find.rb'
require './build.rb'

LOUD = true
CLOCK_FORMAT = "|%T.%L| "
ONLINE = false


    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~@"

          start_time = Time.now
             parser = Parse.new
        historian = History.new
              finder = Find.new
            builder = Build.new

          # Parse Key Elements.
           parser.parse_for_links(online: ONLINE, verbose: LOUD)
          parser.parse_for_titles(online: ONLINE, verbose: LOUD)

          # Add Unique Visit information to history.
          historian.add_links(parser.links, verbose: LOUD)
          historian.add_titles_to_current_visits(parser.titles, verbose: LOUD)
          historian.add_array_of_array_of_comments(parser.parse_for_comments_from_visits(historian.visits, online: ONLINE), online: ONLINE)

          # Find words to swap from history.
          finder.substitute_titles(historian.check_out_titles, verbose: LOUD)
          finder.substitute_words_in_comments(historian.check_out_comment_library, verbose: LOUD)

          # Build a post request with visit information.
          builder.build_posts(historian.visits, online: false)

          # Print from storage.
          historian.print_all(verbose: LOUD)

          # Clean up, report performance.
          end_time = Time.now
          runtime = end_time - start_time
          puts "|            |"
          puts Time.now.strftime(CLOCK_FORMAT) << "Total Runtime: #{runtime} seconds."

    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~@"
