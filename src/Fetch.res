@react.component
let make = (~word) => {
  let state = Network.useFetch(~word)
  switch state {
  | NotCalled => <div> {React.string("Please enter a word. For rich results try something obscene, e.g. the F word :)")} </div>
  | Loading => <div> {React.string("Loading...")} </div>
  | Error (err)=> <div> {
    Js.log(err)
    React.string("An error occurred!")} </div>
  | BadRequest(error) => <div> {React.string(error)} </div>
  | Loaded(synonyms) =>
    switch synonyms[0].translations->Js.Array2.length {
    | 0 => <div> {React.string("No data for this word")} </div>
    | _ => <Content content={synonyms[0]} />
    }
  }
}
