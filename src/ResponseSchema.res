
type backTranslation = {
  normalizedText: string,
  displayText: string,
  numExamples: int,
  frequencyCount: int
}

type translation = {
  normalizedTarget: string,
  displayTarget: string,
  posTag: string,
  confidence: float,
  prefixWord: string,
  backTranslations: array<backTranslation>
}

type sourceWordDescription = {
  normalizedSource: string,
  displaySource: string,
  translations: array<translation>
}

type result = array<sourceWordDescription>

