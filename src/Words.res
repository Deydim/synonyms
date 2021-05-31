// let a = %%raw(`console.log(getElementById("myCanvas"))`)
%%raw(` import wordCloud from './JSLib/wordcloud2.js';`)
type document

@val external wordCloud: (Dom.element, {"list": array<(string, int)>, "click": (('a, 'b)) => 'c}) => unit = "wordCloud"
@send external getElementById: (document, string) => Dom.element = "getElementById"
@val external document: document = "document"

@react.component
let make = (~options) => {
  React.useEffect0(() => {
    wordCloud(
      document->getElementById("html-canvas"),
      options,  
    )
    None
  })
  
  <div> 
    <div>{React.string("...or you might as well click on a word.")}</div>
    <div id="html-canvas" className="canvas" /> 
  </div>
}
