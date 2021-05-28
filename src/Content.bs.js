

import * as React from "react";
import * as Caml_obj from "bs-platform/lib/es6/caml_obj.js";
import * as Words$MyRescriptApp from "./Words.bs.js";

function trace(el, text) {
  console.log(text, el);
  return el;
}

var emptyTrans_backTranslations = [];

var emptyTrans = {
  confidence: 0,
  backTranslations: emptyTrans_backTranslations
};

function synonymRecordFactory(trans) {
  return trans.backTranslations.map(function (backTrans) {
              return {
                      synonym: backTrans.displayText,
                      confidence: trans.confidence * backTrans.frequencyCount | 0
                    };
            });
}

function combineRepetitions(arr) {
  return arr.reduce((function (acc, item) {
                var combinedConfidence = arr.filter(function (item2) {
                        return item2.synonym === item.synonym;
                      }).reduce((function (acc, item) {
                        return {
                                synonym: item.synonym,
                                confidence: acc.confidence + item.confidence | 0
                              };
                      }), {
                      synonym: item.synonym,
                      confidence: 0
                    });
                return acc.concat(acc.some(function (item) {
                                return Caml_obj.caml_equal(item, combinedConfidence);
                              }) ? [] : [combinedConfidence]);
              }), []);
}

function Content(Props) {
  var content = Props.content;
  var result = combineRepetitions(content.translations.reduce((function (acc, trans) {
                      return acc.concat(synonymRecordFactory(trans));
                    }), []).filter(function (el) {
                  return el.synonym !== content.displaySource;
                })).map(function (item) {
            return {
                    synonym: item.synonym,
                    confidence: item.confidence < 700 ? 700 + Math.imul(item.confidence, 10) | 0 : item.confidence
                  };
          }).map(function (item) {
          return {
                  synonym: item.synonym,
                  confidence: item.confidence > 4000 ? 4000 + (item.confidence / 10 | 0) | 0 : item.confidence
                };
        }).map(function (item) {
        return {
                synonym: item.synonym,
                confidence: item.confidence > 7000 ? 4000 : item.confidence
              };
      });
  var match = result.length;
  if (match !== 0) {
    return React.createElement(Words$MyRescriptApp.make, {
                options: {
                  list: result.map(function (item) {
                        return [
                                item.synonym,
                                item.confidence / 50 | 0
                              ];
                      })
                }
              });
  } else {
    return React.createElement("div", undefined, "No synonyms found for this word.");
  }
}

var make = Content;

export {
  trace ,
  emptyTrans ,
  synonymRecordFactory ,
  combineRepetitions ,
  make ,
  
}
/* react Not a pure module */
