
  @react.component
  let make = (~translatedWords: array<string>, ~depth: int) => {
    // let lineOffset = 100 / translatedWords->Array.length + 1
    
          let y2: string = 
            translatedWords
              ->Array.length  
              -> \"*"(100 * (translatedWords->Array.length-depth + 1) / Belt.Float.toInt(Js.Math.pow_float (~base= Belt.Int.toFloat(translatedWords->Array.length), ~exp=Belt.Int.toFloat(depth))))  
              ->Belt.Int.toString  ++ "%"

          Js.log(y2);

          <>   
          <line key="1" stroke="green" strokeWidth="3" x1="10%" x2="85%" y1="5%" y2="5%" />
          <line key="2" stroke="green" strokeWidth="3" x1="85%" x2="85%" y1="5%" y2 />
          </>
        
  }