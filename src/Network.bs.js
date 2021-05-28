

import * as Curry from "bs-platform/lib/es6/curry.js";
import * as React from "react";

function useFetch(word) {
  var match = React.useState(function () {
        return /* NotCalled */0;
      });
  var setState = match[1];
  React.useEffect((function () {
          if (word === "") {
            Curry._1(setState, (function (_previousState) {
                    return /* NotCalled */0;
                  }));
            return ;
          }
          Curry._1(setState, (function (_previousState) {
                  return /* Loading */1;
                }));
          var request = new XMLHttpRequest();
          request.addEventListener("load", (function (param) {
                  var match = JSON.stringify(request.response).charAt(1);
                  if (match === "[") {
                    return Curry._1(setState, (function (_previousState) {
                                  return {
                                          TAG: /* Loaded */2,
                                          _0: JSON.parse(request.response)
                                        };
                                }));
                  } else {
                    return Curry._1(setState, (function (_previousState) {
                                  return {
                                          TAG: /* BadRequest */1,
                                          _0: JSON.stringify(request.response)
                                        };
                                }));
                  }
                }));
          request.addEventListener("error", (function (err) {
                  return Curry._1(setState, (function (_previousState) {
                                return {
                                        TAG: /* Error */0,
                                        _0: err
                                      };
                              }));
                }));
          request.open("GET", "https://limitless-temple-03902.herokuapp.com/?word=" + word + "&from=en&to=es");
          request.send();
          return (function (param) {
                    request.abort();
                    
                  });
        }), [word]);
  return match[0];
}

export {
  useFetch ,
  
}
/* react Not a pure module */
