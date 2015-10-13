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


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~@

Things left to do:

1. Figure out how to isolate commenter names, and comment text (should roll over from last build)
2. Figure out API for page submission.
3. Figure out how to add comments / control necessary bot-users.
4. Figure out how to make this server-ready.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~@
