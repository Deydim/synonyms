

import * as React from "react";

function ZFocusCustomTextInput(Props) {
  var textInput = React.useRef(null);
  var onClick = function (param) {
    var dom = textInput.current;
    if (!(dom == null)) {
      dom.focus();
      return ;
    }
    
  };
  return React.createElement("div", undefined, React.createElement("input", {
                  ref: textInput,
                  type: "text"
                }), React.createElement("input", {
                  type: "button",
                  value: "Focus the text input",
                  onClick: onClick
                }));
}

var make = ZFocusCustomTextInput;

export {
  make ,
  
}
/* react Not a pure module */
