type synonymRecord = {
  synonym: string,
  confidence: int,
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
  arr
  ->reduce((acc, item) => {
      arr
      ->filter(item2 => item2.synonym == item.synonym)  //remove synonym repetitions
      ->reduce(                                         //add up confidence of repetitions
        (acc, item) => {...item, confidence: acc.confidence + item.confidence},
        {...item, confidence: 0},
      )
      ->combined => acc->concat (acc->some(item => item == combined) ? [] : [combined]) //avoid repetitions in the new array while iterating the old one
  }, [])

@react.component
let make = (~content: ResponseSchema.sourceWordDescription, ~setWord, ~setInputValue) => {
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
    ->arr => switch arr {
      | [] => <> {React.string("No synonyms found for this word.")} </>
      | nonEmpty =>
        <Words
          options={{
            "list": nonEmpty->map(item => (item.synonym, item.confidence / 50)),
            "click": ((element, _confidence), _coords, _evt) => {
              setInputValue(_prev => element)
              setWord(_prev => element)
            },
          }}
        />
      }
}
