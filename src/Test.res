let element: React.element = <h1> {React.string("Hello World")} </h1>;
let wrapChildren = (children: React.element) => {
  <div>
    <h1> {React.string("Overview")} </h1>
    children
  </div>
};

@react.component
let make = () => {
    <>
      <div>element {React.string("test")}</div>
      {wrapChildren(React.string("OverviewInside"))}
    </>
}
