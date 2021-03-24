@react.component
  let make = (~words: array<string>, ~content: string, ~depth: int) => {
    words
      ->Belt.Array.map(word => 
          switch (depth < 3) {
          | true => 
            <tr>
            <td className = "contentWords" data = {word} key={word ++ depth->Belt.Int.toString}> 
              {React.string(depth->Belt.Int.toString ++ word ++ " " ++ content )}
            // {React.createElement(make, makeProps(~depth=depth + 1, ~words = words, ~content = content, ()))}
            </td>
            </tr>
          | false => React.null}        
      )
      ->React.array
  } 