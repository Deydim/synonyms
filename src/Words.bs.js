

import * as React from "react";

import wordCloud from './JSLib/wordcloud2.js';
;

function Words(Props) {
  var options = Props.options;
  React.useEffect((function () {
          wordCloud(document.getElementById("html-canvas"), options);
          
        }), []);
  return React.createElement("div", undefined, React.createElement("div", undefined, "...or you might as well click on a word."), React.createElement("div", {
                  className: "canvas",
                  id: "html-canvas"
                }));
}

var make = Words;

export {
  make ,
  
}
/*  Not a pure module */
