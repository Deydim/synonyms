@react.component
let make = (~content: string) => {
  <div className = "content">{React.string(content)}</div>
}