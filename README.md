#Hilarious Web Crawler

##CONTENTS
* runner.rb   :  "Main Execution, constructs every other class."
* parse.rb    :  "Receives page for parsing, responsible for isolating elements
                  of a page."
* visit.rb    :  "Contains the elements of a unique visit, text, link, and comments."
* history.rb  :  "Maintains and builds the unique visits. Checks out visits for
                  further use."
* find.rb     :  "Splits strings and substitutes values as dictated by bad_words
                  and good_words."
* bad_words   :  "Contains words to be swapped."
* good_words  :  "Contains words to be swapped from."
* build.rb    :  "Builds visits into new page to be viewed, after swapping."




##Things left to do:

* Figure out API for page submission.
* Handle server errors from source
* Figure out how to add comments / controlling submissions.
* Write recursive visiting to re-build each post.
* Fix whatever I just broke.
* Remove local testing from repo, why were they there in the first place??


##Fun Facts:

###About 500 lines of code.

###Current Fave Quote:
####"Checking if Cant drive anything! his hand is being bears contains SHIT"

###Runtime: [Dictionary 10] => 0.12s
###Runtime: [Verbose + ^  ] => 2.79s
###Runtime: [Online + ^   ] => TODO
