// Counter.re
module Document = {
  // open Dom
   type t
   @bs.val external document: t  = "document";
   @bs.set external setTitle: t => string => unit = "title"
  
  //let document: document = %raw(`document`)
  //let setTitle: document => string => unit = %raw( j`d=> string => {d["title"] = string}`)
}

@react.component
let make = () => {
  
  let (count, setCount) = React.useState(_ => 1)

  let msg = "You clicked" ++ Belt.Int.toString(count) ++  "times"
   
  React.useEffect(() => {
    open Document
     //let setDocTitle = document|>setTitle
    document->setTitle(j`You clicked $count times!`)
    //let setDocTitle = setTitle (document)
    //setDocTitle(j`You clicked $count times!`)
    // setTitle(document, j`You clicked $count times!`)
    //document["title"] = j`You clicked $count times!`
    Js.log(Js.String2.length("test"))
    None
  })

  let onClick = (_evt) => {
    setCount(prev => prev + 1)
  };

  

  <div>
    <p>{React.string(msg)}</p>
    <button onClick> {React.string("Click me")} </button>
  </div>
}