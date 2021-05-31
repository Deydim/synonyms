%%raw(` import './App.css';
      `)

module QueryInput = {
  @react.component
  let make = ( ~setWord, ~inputValue, ~setInputValue) => {
    // let (inputValue, setInputValue) = React.useState(() => word)
    let onSubmit = _evt => {
      ReactEvent.Form.preventDefault(_evt)
      setWord(_previousState => inputValue)
    }

    let onChange = _evt => setInputValue(_previousState => ReactEvent.Form.target(_evt)["value"])

    <div className="query-input">
      <h5>
        {React.string("Just a synonyms' generator at best (a semantic cloud at its worst).")}
        <br />
        {React.string("Do you fancy my 1995 background color? :)")}
      </h5>
      <form onSubmit>
        <input type_="text" value={inputValue} onChange />
        <button type_="submit"> {React.string("Lookup")} </button>
      </form>
    </div>
  }
}

@react.component
let make = () => {

  let (word, setWord) = React.useState(() => "")
  let (inputValue, setInputValue) = React.useState(() => word)
  <div className="App"> <QueryInput setWord inputValue setInputValue /> <p /> <Fetch word setWord setInputValue /> <p /> 
  </div>
}
