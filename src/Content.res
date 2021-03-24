module type ContentType = {
  let make: {"content": string, "depth": int} => React.element
  let makeProps: (
    ~content: string,
    ~depth: int,
    ~key: string=?,
    unit,
  ) => {"content": string, "depth": int}
}


module rec Content: ContentType = {
  @react.component
  let make = (~content: string, ~depth: int) => {
    ["first", "second", "third", "forth", "fifth"]
    ->Belt.Array.map(word =>
      switch depth < 2 { 
      | true =>
        <tr key={word ++ "1"}>
          <td key={word ++ "2"}> <span className="bordered"> {React.string(word)} </span> </td>
          <span> {React.string(`▼`)} </span>
          <Content content depth={depth + 1} key={word ++ Belt.Int.toString(depth)} />
          // {React.createElement(make, makeProps(~depth=depth + 1, ~content=word, ()))}
        </tr>

      | false =>
        //React.null
        <tr>
          <td className="last"> <span className="bordered"> {React.string(word)} </span> </td>
        </tr>
      }
    )
    ->React.array
  }
}

let make = Content.make
let makeProps = Content.makeProps