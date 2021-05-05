type backTranslation = {
  displayText: string,
  frequencyCount: int,
}

type translation = {
  confidence: float,
  backTranslations: array<backTranslation>,
}

type sourceWordDescription = {
  displaySource: string,
  translations: array<translation>,
}

type result = array<sourceWordDescription>
