%%raw(` import './App.css';
      `)

module QueryInput = {
  @react.component
  let make = ( ~setWord, ~inputValue, ~setInputValue) => {
    let onSubmit = _evt => {
      ReactEvent.Form.preventDefault(_evt)
      setWord(_previousState => inputValue)
    }

    let onChange = _evt => setInputValue(_previousState => ReactEvent.Form.target(_evt)["value"])

    <div className="query-input">
      <br/>
      <div>{React.string("Welcome to my synonyms' generator in the fanciest 1995 background color :)")}</div>
      <br/>
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
