Working demo here: https://deydim.github.io/synonyms/

A ReScript React experimental project.

A simple interface with a controlled text input and a confirm button. The results are displayed in a word cloud for which I am using a 3rd party library called wordcloud2.js (https://github.com/timdream/wordcloud2.js) which, in turn, is itself based on the more popular Wordle, written in Java.

My idea was to experiment with ReScript and their static type system, functional concepts such as pipelining and pattern matching, and the easy JS interop. Repo includes the transpiled .bs.js files so one can see how clean and readable the output is (there is some noise coming from the Curry library and pattern matching but it is still pretty much readable once you've figured it out).

The program basically request a word and receives a traslation of it from English to Spanish along with its available backtranslations as well as a confidence value and number of appearances in the bilingual text base. 

What I do is make a couple of data transformations until I have a data structure - 'record' containing elements with a backtranslation to the queried word and derived confidence value (as needed by the word cloud tool, so as to render a meaningful visual presentation).

Backend is a simple app hosted on Heroku which connects to Microsoft Cognitive Services and returns JSON with all translations found for the searched word. I have included its source in the 'src/backend' folder for reference.
