

import * as React from "react";
import * as Caml_int32 from "bs-platform/lib/es6/caml_int32.js";

function ZSVGLines(Props) {
  var translatedWords = Props.translatedWords;
  var depth = Props.depth;
  var y2 = String(Math.imul(translatedWords.length, Caml_int32.div(Math.imul(100, (translatedWords.length - depth | 0) + 1 | 0), Math.pow(translatedWords.length, depth) | 0))) + "%";
  console.log(y2);
  return React.createElement(React.Fragment, undefined, React.createElement("line", {
                  key: "1",
                  stroke: "green",
                  strokeWidth: "3",
                  x1: "10%",
                  x2: "85%",
                  y1: "5%",
                  y2: "5%"
                }), React.createElement("line", {
                  key: "2",
                  stroke: "green",
                  strokeWidth: "3",
                  x1: "85%",
                  x2: "85%",
                  y1: "5%",
                  y2: y2
                }));
}

var make = ZSVGLines;

export {
  make ,
  
}
/* react Not a pure module */
