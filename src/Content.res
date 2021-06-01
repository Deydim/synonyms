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
let make = (~content: ResponseSchema.sourceWordDescription, ~setWord, ~setInputValue) => {
  let result =
    content.translations
    ->reduce((acc, trans) => concat(acc, synonymRecordFactory(trans)), []) // flatten all arrays to one
    ->filter(el => el.synonym != content.displaySource) // removes source word from data array
    ->combineRepetitions
    ->map(item => {
      ...item,
      confidence: item.confidence < 700 ? 700 + item.confidence * 10 : item.confidence,
    }) //set minimum font size
    ->map(item => {
      ...item,
      confidence: item.confidence > 4000 ? 4000 + item.confidence / 10 : item.confidence,
    }) //set minimum font size
    ->map(item => {...item, confidence: item.confidence > 7000 ? 4000 : item.confidence}) //set maximum font size

  switch result->length {
  | 0 => <> {React.string("No synonyms found for this word.")} </>
  | _ =>
    <Words
      options={{
        "list": result->map(item => (item.synonym, item.confidence / 50)),
        "click": ((element, _)) => {
          setInputValue(_prev => element)
          setWord(_prev => element)
        },
      }}
    />
  }
}
