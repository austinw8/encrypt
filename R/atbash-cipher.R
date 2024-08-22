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
