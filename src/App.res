%%raw(` import './App.css';
        import testJson from './testJson.json';
      `)

@val external testJson: ResponseSchema.result = "testJson"

Js.log(testJson[0].translations)
open Belt

let test = switch testJson[0] {
  | Some(trans) => trans
}

switch test.translations[0] {
  | Some(trans) => Js.log("success")
  | None => Js.log("fail")
}


let maybeArr = (optArr ) => 
  switch optArr {
      | Some (trans) => trans
      // | None (trans) => trans
    }



// let getProp = (record, accessor) => accessor(record)

//  let extractNonEmptyArray = (arr, accessor) => Array.get(arr, 0)->maybeArr->getProp(accessor)


// Js.log(testJson->Array.get(0)->maybeArr->getProp(obj => obj["translations"])->extractNonEmptyArray("backTranslations"))


// Js.log(testJson->Array.get(0)->maybeArr->getProp(obj => obj.translations)->Array.get(0)->maybeArr->getProp(obj=>obj.backTranslations) )

// Js.log(testJson->extractNonEmptyArray(record => record.translations)->extractNonEmptyArray(record => record.backTranslations))


module QueryInput = {
  @react.component
  let make = (~content, ~setContent) => {
    let (word, setWord) = React.useState(_ => content)
    let onSubmit = _evt => {
      ReactEvent.Form.preventDefault(_evt)
      setContent(_ => word)
    }

    let onChange = _evt => setWord(_ => ReactEvent.Form.target(_evt)["value"])

    <div className="query-input">
      <form onSubmit>
        <input type_="text" value={word} onChange />
        <button type_="submit"> {React.string("Lookup")} </button>
      </form>
    </div>
  }
}

@react.component
let make = () => {
  let depth = 0
  let (content, setContent) = React.useState(_ => "myWord")
  <div className="App">
    <QueryInput content setContent /> <p /> <table> <Content content depth key=Belt.Int.toString(depth)/> </table>
  </div>
}
