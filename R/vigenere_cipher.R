vigenere_cipher <- function(text, keyword) {
  if(grepl("[^a-zA-Z[:space:][:punct:]]", text)) {
    stop("Error: The input must contain only alphabetical characters.")
  }
  text <- tolower(text)
  keyword <- tolower(keyword)
  alphabet <- letters
  text_chars <- strsplit(text, NULL)[[1]]
  ciphered_text <- character(length(text_chars))
  keyword_index <- 1
  for (i in seq_along(text_chars)) {
    text_char <- text_chars[i]
    if (text_char %in% alphabet) {
      text_pos <- match(text_char, alphabet)
      keyword_pos <- match(substr(keyword, keyword_index, keyword_index), alphabet)
      ciphered_pos <- (text_pos + keyword_pos - 2) %% 26 + 1
      ciphered_text[i] <- alphabet[ciphered_pos]
      keyword_index <- keyword_index %% nchar(keyword) + 1
    } else {
      ciphered_text[i] <- text_char
    }
  }
  return(paste(ciphered_text, collapse = ""))
}
