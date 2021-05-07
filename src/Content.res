let trace = (el, text) => {
  Js.log2(text, el)
  el
}

type synonymRecord = {
  synonym: string,
  confidence: int,
}

let emptyTrans: ResponseSchema.translation = {
  confidence: 0.,
  backTranslations: [],
}

open Js.Array2

let synonymRecordFactory = (trans: ResponseSchema.translation) => {
  trans.backTranslations->map(backTrans => {
    {
      synonym: backTrans.displayText,
      confidence: (trans.confidence *. backTrans.frequencyCount->Belt.Int.toFloat)
        ->Belt.Float.toInt,
    }
  })
}

let combineRepetitions = (arr: array<synonymRecord>): array<synonymRecord> =>
  arr->reduce((acc, item) => {
    let combinedConfidence =
      filter(arr, item2 => item2.synonym == item.synonym)->reduce(
        (acc, item) => {...item, confidence: acc.confidence + item.confidence},
        {...item, confidence: 0},
      )
    acc->concat(acc->some(item => item == combinedConfidence) ? [] : [combinedConfidence])
  }, [])

@react.component
let make = (~content: ResponseSchema.sourceWordDescription) => {
  let result =
    content.translations
    ->reduce((acc, trans) => concat(acc, synonymRecordFactory(trans)), []) // flatten all arrays to one
    ->filter(el => el.synonym != content.displaySource) // removes source word from data array
    ->combineRepetitions

  switch result->length {
  | 0 => <div> {React.string("No synonyms found for this word.")} </div>
  | _ => <>
      {result
      ->map(item =>
        <div key={item.synonym}>
          <span> {React.string(item.synonym)} </span>
          <span> {React.string(item.confidence->Belt.Int.toString)} </span>
        </div>
      )
      ->React.array}
    </>
  }
}
