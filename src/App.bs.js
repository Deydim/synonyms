

import * as Curry from "bs-platform/lib/es6/curry.js";
import * as React from "react";
import * as Fetch$MyRescriptApp from "./Fetch.bs.js";

import './App.css';
;

function App$QueryInput(Props) {
  var setWord = Props.setWord;
  var inputValue = Props.inputValue;
  var setInputValue = Props.setInputValue;
  var onSubmit = function (evt) {
    evt.preventDefault();
    return Curry._1(setWord, (function (_previousState) {
                  return inputValue;
                }));
  };
  var onChange = function (evt) {
    return Curry._1(setInputValue, (function (_previousState) {
                  return evt.target.value;
                }));
  };
  return React.createElement(React.Fragment, undefined, "Welcome to my synonyms' generator in the fanciest 1995 background color :)", React.createElement("form", {
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
  var setWord = match[1];
  var word = match[0];
  var match$1 = React.useState(function () {
        return word;
      });
  var setInputValue = match$1[1];
  return React.createElement(React.Fragment, undefined, React.createElement(App$QueryInput, {
                  setWord: setWord,
                  inputValue: match$1[0],
                  setInputValue: setInputValue
                }), React.createElement(Fetch$MyRescriptApp.make, {
                  word: word,
                  setWord: setWord,
                  setInputValue: setInputValue
                }));
}

var make = App;

export {
  QueryInput ,
  make ,
  
}
/*  Not a pure module */
