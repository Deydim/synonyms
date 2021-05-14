%%raw(` import './App.css';
      `)

module QueryInput = {
  @react.component
  let make = (~word, ~setWord) => {
    let (inputValue, setInputValue) = React.useState(() => word)
    let onSubmit = _evt => {
      ReactEvent.Form.preventDefault(_evt)
      setWord(_previousState => inputValue)
    }

    let onChange = _evt => setInputValue(_previousState => ReactEvent.Form.target(_evt)["value"])

    <div className="query-input">
      <form onSubmit>
        <input type_="text" value={inputValue} onChange />
        <button type_="submit"> {React.string("Lookup")} </button>
        <p />
        {React.string("Source Lang")}
        <input type_="button" value="En" />
        <input type_="button" value="En" />
        <p />
        {React.string("Target Lang")}
        <input type_="button" value="En" />
        <input type_="button" value="En" />
      </form>
    </div>
  }
}

@react.component
let make = () => {
  let (word, setWord) = React.useState(() => "")
  <div className="App"> <QueryInput word setWord /> <p /> <Fetch word /> <p /> 
  // <Words /> 
  </div>
}
