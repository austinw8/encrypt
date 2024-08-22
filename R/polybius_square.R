polybius_square <- function(text) {
  square <- matrix(c("a","b","c","d","e","f","g","h","i/j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"), nrow = 5, byrow = TRUE)
  encode <- function(char) {
    pos <- which(square == char | square == "i/j" & char %in% c("i","j"), arr.ind = TRUE)
    paste(pos[1], pos[2], sep="")
  }
  paste(sapply(strsplit(tolower(text), NULL)[[1]], encode), collapse = " ")
}

#decoder

polybius_square_decode <- function(numbers) {
  square <- matrix(c("a", "b", "c", "d", "e",
                     "f", "g", "h", "i/j", "k",
                     "l", "m", "n", "o", "p",
                     "q", "r", "s", "t", "u",
                     "v", "w", "x", "y", "z"),
                   nrow = 5, byrow = TRUE)
  decode <- function(pair) {
    row <- as.numeric(substr(pair, 1, 1))
    col <- as.numeric(substr(pair, 2, 2))
    char <- square[row, col]
    if (char == "i/j") {
      return("i/j")
    } else {
      return(char)
    }
  }
  numbers <- gsub(" ", "", numbers)
  if (!grepl("^\\d*$", numbers)) {
    stop("Input must only contain numbers.")
  }
  if (nchar(numbers) %% 2 == 0) {
    num_pairs <- strsplit(numbers, NULL)[[1]]
    num_pairs <- paste(num_pairs[seq(1, length(num_pairs) - 1, by = 2)], num_pairs[seq(2, length(num_pairs), by = 2)], sep = "")
  } else {
    if (nchar(numbers) %% 2 != 0) {
      stop("For continuous input, the number of digits must be even.")
    }
    num_pairs <- strsplit(numbers, NULL)[[1]]
    num_pairs <- paste(num_pairs[seq(1, length(num_pairs) - 1, by = 2)], num_pairs[seq(2, length(num_pairs), by = 2)], sep = "")
  }
  decoded_chars <- sapply(num_pairs, decode)
  decoded_text <- gsub("i/j", "i", paste(decoded_chars, collapse = ""))
  return(decoded_text)
}
