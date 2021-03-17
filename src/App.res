%%raw(`import './App.css';`)

module QueryInput = {
  @react.component
  let make = (~content, ~setContent) => {
  let (word, setWord) = React.useState(_ => content)

  // let onClick = _evt => setContent (_ => word)
  let onSubmit = _evt => {
    ReactEvent.Form.preventDefault(_evt)
    setContent (_ => word)
  }

  let onChange = _evt => setWord(_ => ReactEvent.Form.target(_evt)["value"])

  <div className="query-input">
    <form onSubmit>
    <input type_="text" value = {word} onChange /> 
    <button type_="submit"> {React.string("QUERY")} </button>
    </form>
  </div>
  }
}

@react.component
let make = () => {
  let (content, setContent) = React.useState(_ => "")
  <div className="App"> <QueryInput content setContent/> <p /> <Content content /> </div>
}
