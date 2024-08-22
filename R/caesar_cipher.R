caesar_cipher <- function(text, shift) {
  if(grepl("[^a-zA-Z[:space:][:punct:]]", text)) {
    stop("Error: The input must contain only alphabetical characters.")
  }
  alphabet <- letters
  shifted_alphabet <- c(alphabet[(shift + 1):26], alphabet[1:shift])
  cipher <- setNames(shifted_alphabet, alphabet)
  transformed_text <- sapply(strsplit(tolower(text), NULL)[[1]], function(x) {
    ifelse(x %in% alphabet, cipher[x], x)
  }, USE.NAMES = FALSE)
  return(paste(transformed_text, collapse = ""))
}
