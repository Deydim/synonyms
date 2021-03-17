%%raw(`import './App.css';`)

@bs.module("./logo.svg") external logo: string = "default"

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
  </div>
}
