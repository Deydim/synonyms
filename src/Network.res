type request
type response

@new external makeXMLHttpRequest: unit => request = "XMLHttpRequest"
@send external addEventListener: (request, string, unit => unit) => unit = "addEventListener"
@get external response: request => response = "response"
@send external open_: (request, string, string) => unit = "open"
@send external send: request => unit = "send"
@send external abort: request => unit = "abort"
@scope("JSON") @val external parseResponse: response => ResponseSchema.result = "parse"
@scope("JSON") @val external stringifyResponse: response => string = "stringify"

type state =
  | NotCalled
  | Loading
  | Error(unit)
  | BadRequest(string)
  | Loaded(ResponseSchema.result)

let useFetch = (~word) => {
  let (state, setState) = React.useState(() => NotCalled)
  React.useEffect1(() => {
    switch word {
    | "" => {
        setState(_previousState => NotCalled)
        None
      }
    | _ => {
        setState(_previousState => Loading)
        let request = makeXMLHttpRequest()
        request->addEventListener("load", () => {
          switch Js.String.charAt(1, request->response->stringifyResponse) {
          | "[" => setState(_previousState => Loaded(request->response->parseResponse))
          | _ => setState(_previousState => BadRequest(request->response->stringifyResponse))
          }
        })
        request->addEventListener("error", err => {
          setState(_previousState => Error(err))
        })
        request->open_("GET", `https://synonyms-api.herokuapp.com/?word=${word}&from=en&to=es`)
        request->send

        Some(() => {request->abort})
      }
    }
  }, [word])
  state
}
