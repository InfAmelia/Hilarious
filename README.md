#Hilarious Web Crawler

##CONTENTS
* runner.rb   :  "Main Execution, constructs every other class."
* parse.rb    :  "Receives page for parsing, responsible for isolating elements
                  of a page."
* visit.rb    :  "Contains the elements of a unique visit, text, link, and comments."
* history.rb  :  "Maintains and builds the unique visits. Checks out visits for
                  further use. Chops off stickied posts."
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

##Fun Facts:

###About 500 lines of code.

###Current Fave Quotes:
####"Checking if Cant drive anything! his hand is being bears contains SHIT"
####"I drive for the train this morning and make it and when the doors closed american took my wife."

###Runtime: [Dictionary w/ 10 words] => 0.12s
###Runtime: [Verbose + ^  ] => 2.79s
###Runtime: [Online + ^   ] => 310.35s ... 385.77s
