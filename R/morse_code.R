#' Morse Code
#'
#' Encode messages using Morse code.
#'
#' @param text A character string to be converted to Morse code. The string can include letters, numbers, and spaces.
#'
#' @return A character string representing the input text converted into Morse code. Each letter or number is encoded as a sequence of dots (.) and dashes (-). Words are separated by slashes (/).
#' @export
#'
#' @examples
#' morse_code("Holy biscuits batman")
#' morse_code("12345")

morse_code <- function(text) {
  if (grepl("[^a-zA-Z0-9 ]", text)) {
    stop("Input contains invalid characters. Only alphanumeric characters and spaces are allowed.")
  }
  morse_code <- list(
    "a" = ".-", "b" = "-...", "c" = "-.-.", "d" = "-..", "e" = ".", "f" = "..-.",
    "g" = "--.", "h" = "....", "i" = "..", "j" = ".---", "k" = "-.-", "l" = ".-..",
    "m" = "--", "n" = "-.", "o" = "---", "p" = ".--.", "q" = "--.-", "r" = ".-.",
    "s" = "...", "t" = "-", "u" = "..-", "v" = "...-", "w" = ".--", "x" = "-..-",
    "y" = "-.--", "z" = "--..", "1" = ".----", "2" = "..---", "3" = "...--",
    "4" = "....-", "5" = ".....", "6" = "-....", "7" = "--...", "8" = "---..",
    "9" = "----.", "0" = "-----", " " = "/"
  )

  morse <- sapply(strsplit(tolower(text), NULL)[[1]], function(x) morse_code[[x]], USE.NAMES = FALSE)
  return(paste(morse, collapse = " "))
}
