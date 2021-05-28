

import * as Curry from "bs-platform/lib/es6/curry.js";
import * as React from "react";

var $$Document = {};

function ZCounter(Props) {
  var match = React.useState(function () {
        return 1;
      });
  var setCount = match[1];
  var count = match[0];
  var msg = "You clicked" + String(count) + "times";
  React.useEffect(function () {
        document.title = "You clicked " + count + " times!";
        console.log("test".length);
        
      });
  var onClick = function (_evt) {
    return Curry._1(setCount, (function (prev) {
                  return prev + 1 | 0;
                }));
  };
  return React.createElement("div", undefined, React.createElement("p", undefined, msg), React.createElement("button", {
                  onClick: onClick
                }, "Click me"));
}

var make = ZCounter;

export {
  $$Document ,
  make ,
  
}
/* react Not a pure module */
