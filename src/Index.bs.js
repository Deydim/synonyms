

import * as React from "react";
import * as Caml_option from "bs-platform/lib/es6/caml_option.js";
import * as App$MyRescriptApp from "./App.bs.js";
import * as ReactDomExperimental$MyRescriptApp from "./bindings/ReactDomExperimental.bs.js";

import './Index.css';
;

var root = ReactDomExperimental$MyRescriptApp.createRootWithId("root");

if (root !== undefined) {
  Caml_option.valFromOption(root).render(React.createElement(React.StrictMode, {
            children: React.createElement(App$MyRescriptApp.make, {})
          }));
} else {
  console.log("Could not find root element.");
}

export {
  
}
/*  Not a pure module */
