Hilarious Web Crawler

PLEASE NOTE THAT:

 * COMMENTS AND USERS
 * TITLES AND LINKS

MUST PAIR IMPLICITLY.

* runner.rb   :  "Main Execution, constructs every other class."
* parse.rb    :  "Receives page for parsing, responsible for isolating elements
                  of a page."
* visit.rb    :  "Contains the elements of a unique visit, text, link, etc."
* history.rb  :  "Maintains and builds the unique visits. Checks out visits for
                  further use."
* find.rb     :  "Splits strings and substitutes values as dictated by bad_words
                  and good_words."
* bad_words   :  "Contains words to be swapped."
* good_words  :  "Contains words to be swapped from."
* build.rb    :  "Builds visits into new page to be viewed, after swapping."



(For local Testing)
* gifshead.html
* kittens.html

Runtime: [Dictionary 100] => 1.7s
Runtime: [Dictionary 1000] => 16.1s

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~@

Things left to do:

. Figure out API for page submission.
. Figure out how to add comments / controlling submissions.
. Figure out how to make this server-ready.
. Write recursive visiting to re-build each post.
. Fix whatever I just broke.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~@
