@bs.send external focus: Dom.element => unit = "focus"

@react.component
let make = () => {
  let textInput = React.useRef(Js.Nullable.null)

  let focusInput = () =>
    switch textInput.current->Js.Nullable.toOption {
    | Some(dom) => dom->focus
    | None => ()
    }

  let onClick = _ => focusInput()

  <div>
    <input type_="text" ref={ReactDOM.Ref.domRef(textInput)} />
    <input type_="button" value="Focus the text input" onClick />
  </div>
}