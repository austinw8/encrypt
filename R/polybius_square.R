#' Polybius Square
#'
#' A cipher where each letter is represented by its coordinates in a 5x5 grid.
#'
#' @param input A character string to be encrypted or decrypted.
#'
#' @return A character string. (i/j is used interchangeably).
#' @export
#'
#' @examples
#' polybius_square("Hello friends")
#' polybius_square("3511331311251543")
#' polybius_square("24 45 33 24 34 42")

polybius_square <- function(input) {
  square <- matrix(c("a", "b", "c", "d", "e",
                     "f", "g", "h", "i/j", "k",
                     "l", "m", "n", "o", "p",
                     "q", "r", "s", "t", "u",
                     "v", "w", "x", "y", "z"),
                   nrow = 5, byrow = TRUE)

  encode <- function(char) {
    if (char %in% c(" ", ".", ",", "!", "?", "'", "-", ":", ";")) {
      return(char)
    }
    pos <- which(square == char | (square == "i/j" & char %in% c("i", "j")), arr.ind = TRUE)
    paste(pos[1], pos[2], sep = "")
  }

  decode <- function(pair) {
    if (pair %in% c(" ", ".", ",", "!", "?", "'", "-", ":", ";")) {
      return(pair)
    }
    row <- as.numeric(substr(pair, 1, 1))
    col <- as.numeric(substr(pair, 2, 2))
    char <- square[row, col]
    if (char == "i/j") {
      return("i")
    } else {
      return(char)
    }
  }

  if (grepl("^[a-zA-Z[:space:][:punct:]]+$", input)) {
    encoded <- paste(sapply(strsplit(tolower(input), NULL)[[1]], encode), collapse = " ")
    return(encoded)

  } else if (grepl("^[0-9[:space:][:punct:]]+$", input)) {
    numbers <- gsub(" ", "", input)

    if (nchar(gsub("[[:punct:]]", "", numbers)) %% 2 != 0) {
      stop("For decoding, the number of digits must be even.")
    }

    num_pairs <- strsplit(numbers, NULL)[[1]]
    num_pairs <- paste(num_pairs[seq(1, length(num_pairs) - 1, by = 2)],
                       num_pairs[seq(2, length(num_pairs), by = 2)], sep = "")

    decoded_chars <- sapply(num_pairs, decode)
    decoded_text <- paste(decoded_chars, collapse = "")
    return(decoded_text)

  } else {
    stop("Input must contain only alphabetic characters, spaces, punctuation, or numeric pairs.")
  }
}
