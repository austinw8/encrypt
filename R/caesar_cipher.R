#' Caesar Cipher
#'
#' Shift each letter in a string by a certain number of places in the alphabet.
#'
#' @param text A character string that you want to encrypt or decrypt.
#' @param shift An integer specifying the number of positions to shift each letter in the alphabet.
#'
#' @return A character string where each letter in the input text has been shifted by the specified number of positions.
#' @export
#'
#' @examples
#' caesar_cipher("attack at dawn", 3)
#' caesar_cipher("12345", 5)
#' caesar_cipher("abcde", -2)

caesar_cipher <- function(text, shift) {
  if (!is.numeric(shift) || shift != as.integer(shift)) {
    stop("Error: The shift value must be a whole number (integer).")
  }

  if (grepl("[^a-zA-Z0-9[:space:][:punct:]]", text)) {
    stop("Error: The input must contain only alphanumeric characters, spaces, and punctuation.")
  }

  alphabet <- letters
  digits <- 0:9

  shift_alphabet <- shift %% 26
  if (shift_alphabet < 0) {
    shift_alphabet <- 26 + shift_alphabet
  }

  shift_digits <- shift %% 10
  if (shift_digits < 0) {
    shift_digits <- 10 + shift_digits
  }

  shifted_alphabet <- c(alphabet[(shift_alphabet + 1):26], alphabet[1:shift_alphabet])
  shifted_digits <- c(digits[(shift_digits + 1):10], digits[1:shift_digits])

  cipher <- setNames(c(shifted_alphabet, as.character(shifted_digits)), c(alphabet, as.character(digits)))

  transformed_text <- sapply(strsplit(tolower(text), NULL)[[1]], function(x) {
    ifelse(x %in% c(alphabet, as.character(digits)), cipher[x], x)
  }, USE.NAMES = FALSE)

  return(paste(transformed_text, collapse = ""))
}
