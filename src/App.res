%%raw(`import './App.css';`)

module Button = {
  @react.component
  let make = () => {
    <button>{React.string("QUERY")}</button>
  }
}
module QueryInput = {
  @react.component
  let make = () => {
    <input type_="text" />
  }
}

@react.component
let make = () => {
  <div className="App">
    <QueryInput />
    <Button />
    <Content />
  </div>
}
