#Hilarious Web Crawler

NOTE: THIS IS NO LONGER IN DEVELOPMENT BUT LEFT HERE FOR LOL PURPOSES.

##CONTENTS
* runner.rb   :  "Main Execution, constructs every other class."
* parse.rb    :  "Receives page for parsing, responsible for finding links + titles => visits."
* visit.rb    :  "Contains the elements of a unique visit, text, users, link, and comments."
* history.rb  :  "Maintains and builds the unique visits. Checks out visits for
                  further use. Chops off stickied posts. Uses visits to find comments."
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

|Fun Facts: |      
|-----------|-------------|
|About 580 lines of code. |
|-------------------------|
|Current Fave Quotes:|
|"Checking if Cant drive anything! his hand is being bears contains SHIT"|
|"I drive for the train this morning and make it and when the doors closed american took my wife."|
|"Well jump, that's it then, I'm calling it. Time to drink and smoke till Reddit gets its vietnam war memorials together." - WubShrimp|
|-------------------------|
|Runtime: [Dictionary w/ 10 words] => 0.12s|
|Runtime: [Verbose + ^  ] => 2.79s|
|Runtime: [Online + ^   ] => 310.35s ... 385.77s|
