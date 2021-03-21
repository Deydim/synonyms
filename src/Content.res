@react.component
let rec make = (~content: string, ~depth: int) => {
  let translatedWords = ["first", "second", "third", "forth", "fifth"]
  let firstContent = React.string(content)

  // <td> <span className="bordered"> {firstContent} </span> </td>
  // <span> {React.string(`▼`)} </span>
  {
    <>
      {translatedWords
      ->Belt.Array.map(word =>
        switch depth < 2 {
        | true => 
            
                <tr>
                  <td> <span className="bordered"> {React.string(word)} </span> </td>
                  <span> {React.string(`▼`)} </span>
                  {React.createElement(make, makeProps(~depth=depth + 1, ~content=word, ()))}
                </tr>
              
          
        | false =>
          //React.null
          <tr>
            <td className="last">  <span className="bordered"> {React.string(word)} </span> </td> 
          </tr>
        }
      )
      ->React.array}
    </>
  }
}
