

import * as React from "react";

var element = React.createElement("h1", undefined, "Hello World");

function wrapChildren(children) {
  return React.createElement("div", undefined, React.createElement("h1", undefined, "Overview"), children);
}

function ZWrapChildren(Props) {
  return React.createElement(React.Fragment, undefined, React.createElement("div", undefined, element, "test"), wrapChildren("OverviewInside"));
}

var make = ZWrapChildren;

export {
  element ,
  wrapChildren ,
  make ,
  
}
/* element Not a pure module */
