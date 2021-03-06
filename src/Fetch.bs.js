

import * as React from "react";
import * as Caml_array from "bs-platform/lib/es6/caml_array.js";
import * as Content$MyRescriptApp from "./Content.bs.js";
import * as Network$MyRescriptApp from "./Network.bs.js";

function Fetch(Props) {
  var word = Props.word;
  var setWord = Props.setWord;
  var setInputValue = Props.setInputValue;
  var state = Network$MyRescriptApp.useFetch(word);
  if (typeof state === "number") {
    if (state === /* NotCalled */0) {
      return React.createElement(React.Fragment, undefined, "Please enter a word. For rich results try something obscene, e.g. the F word :)");
    } else {
      return React.createElement(React.Fragment, undefined, "Loading...");
    }
  }
  switch (state.TAG | 0) {
    case /* Error */0 :
        return React.createElement(React.Fragment, undefined, (console.log(state._0), "An error occurred!"));
    case /* BadRequest */1 :
        return React.createElement(React.Fragment, undefined, state._0);
    case /* Loaded */2 :
        var synonyms = state._0;
        var match = Caml_array.get(synonyms, 0).translations;
        if (match.length !== 0) {
          return React.createElement(Content$MyRescriptApp.make, {
                      content: Caml_array.get(synonyms, 0),
                      setWord: setWord,
                      setInputValue: setInputValue
                    });
        } else {
          return React.createElement(React.Fragment, undefined, "No data for this word");
        }
    
  }
}

var make = Fetch;

export {
  make ,
  
}
/* react Not a pure module */
