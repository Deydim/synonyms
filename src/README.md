A ReScript React experimental project.

A simple interface with a controlled text input and a confirm button. The results are displayed in a word cloud for which I am using a 3rd party library called wordcloud2.js (https://github.com/timdream/wordcloud2.js) which, in turn, is itself based on the more popular Wordle, written in Java.

My idea was to experiment with ReScript and their static type system, functional concepts such as pipelining and easy JS interop which turned out as fun experience. Repo includes the transpiled .bs.js files so one can see how clean and readable the output is. Most of the noise that can be observed is from a <code> Curry </code> library and from the 'no null/undefined' defense. 


