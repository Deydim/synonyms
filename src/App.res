%%raw(` import './App.css';
      `)

module QueryInput = {
  @react.component
  let make = (~setWord, ~inputValue, ~setInputValue) => {
    let onSubmit = evt => {
      ReactEvent.Form.preventDefault(evt)
      setWord(_previousState => inputValue)
    }

    let onChange = evt => setInputValue(_previousState => ReactEvent.Form.target(evt)["value"])

    <>
      {React.string("Welcome to my synonyms' generator in the fanciest 1995 background color :)")}
      <form onSubmit>
        <input type_="text" value={inputValue} onChange />
        <button type_="submit"> {React.string("Lookup")} </button>
      </form>
    </>
  }
}

@react.component
let make = () => {
  let (word, setWord) = React.useState(() => "")
  let (inputValue, setInputValue) = React.useState(() => word)
  <> <QueryInput setWord inputValue setInputValue /> <Fetch word setWord setInputValue /> </>
}
