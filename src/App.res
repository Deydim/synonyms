%%raw(`import './App.css';`)
%%raw(`import testJson from './testJson.json';
      `)

@val external testJson: ResponseSchema.lookupResult = "testJson"

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
    <QueryInput content setContent /> <p /> <table> <Content content depth /> </table>
  </div>
}
