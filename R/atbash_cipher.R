#' Atbash Cipher
#'
#' A type of substitution cipher where the alphabet is reversed.
#'
#' @param text A character string to be encrypted or decrypted.
#'
#' @return A character string.
#' @export
#'
#' @examples
#' atbash_cipher("Hebrew alphabet")
#' atbash_cipher("svyivd zokszyvg")

atbash_cipher <- function(text) {
  if(grepl("[^a-zA-Z[:space:][:punct:]]", text)) {
    stop("Error: The input must contain only alphabetical characters.")
  }
  alphabet <- letters
  reversed_alphabet <- rev(alphabet)
  cipher <- setNames(reversed_alphabet, alphabet)
  transformed_text <- sapply(strsplit(tolower(text), NULL)[[1]], function(x) {
    ifelse(x %in% alphabet, cipher[x], x)
  }, USE.NAMES = FALSE)
  return(paste(transformed_text, collapse = ""))
}
