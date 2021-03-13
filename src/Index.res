open ReactDomExperimental

%%raw(`import './Index.css';`)

switch createRootWithId("root") {
| Some(root) => root->render(
    <React.StrictMode>
      <App />
      <App2 />
      
    </React.StrictMode>
  )
| None => ()
}
