

import * as Curry from "bs-platform/lib/es6/curry.js";
import * as React from "react";
import * as Fetch$MyRescriptApp from "./Fetch.bs.js";

import './App.css';
;

function App$QueryInput(Props) {
  var word = Props.word;
  var setWord = Props.setWord;
  var match = React.useState(function () {
        return word;
      });
  var setInputValue = match[1];
  var inputValue = match[0];
  var onSubmit = function (_evt) {
    _evt.preventDefault();
    return Curry._1(setWord, (function (_previousState) {
                  return inputValue;
                }));
  };
  var onChange = function (_evt) {
    return Curry._1(setInputValue, (function (_previousState) {
                  return _evt.target.value;
                }));
  };
  return React.createElement("div", {
              className: "query-input"
            }, React.createElement("form", {
                  onSubmit: onSubmit
                }, React.createElement("input", {
                      type: "text",
                      value: inputValue,
                      onChange: onChange
                    }), React.createElement("button", {
                      type: "submit"
                    }, "Lookup")));
}

var QueryInput = {
  make: App$QueryInput
};

function App(Props) {
  var match = React.useState(function () {
        return "";
      });
  var word = match[0];
  return React.createElement("div", {
              className: "App"
            }, React.createElement(App$QueryInput, {
                  word: word,
                  setWord: match[1]
                }), React.createElement("p", undefined), React.createElement(Fetch$MyRescriptApp.make, {
                  word: word
                }), React.createElement("p", undefined));
}

var make = App;

export {
  QueryInput ,
  make ,
  
}
/*  Not a pure module */
