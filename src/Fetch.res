@react.component
let make = (~word, ~setWord, ~setInputValue) => {
  let state = Network.useFetch(~word)
  switch state {
  | NotCalled => <>
      {React.string(
        "Please enter a word. For rich results try something obscene, e.g. the F word :)",
      )}
    </>
  | Loading => <> {React.string("Loading...")} </>
  | Error(err) => <>
      {
        Js.log(err)
        React.string("An error occurred!")
      }
    </>
  | BadRequest(error) => <> {React.string(error)} </>
  | Loaded(synonyms) =>
    switch synonyms[0].translations {
    | [] => <> {React.string("No data for this word")} </>
    | _ => <Content content={synonyms[0]} setWord setInputValue />
    }
  }
}
