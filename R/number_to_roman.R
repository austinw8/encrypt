number_to_roman <- function(num) {
  if (num < 1 || num > 3999) {
    stop("Number out of range (1-3999)")
  }

  roman_numerals <- setNames(
    c("M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"),
    c(1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1)
  )

  result <- ""

  for (value in names(roman_numerals)) {
    value <- as.numeric(value)
    while (num >= value) {
      result <- paste0(result, roman_numerals[as.character(value)])
      num <- num - value
    }
  }

  return(result)
}

#-----------------------------------------------------

roman_to_number <- function(roman) {
  roman <- toupper(roman)  # Convert input to uppercase
  roman_numerals <- setNames(
    c(1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1),
    c("M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I")
  )

  total <- 0
  i <- 1
  length_roman <- nchar(roman)

  while (i <= length_roman) {
    # Check for two-character substrings first (e.g., "IX", "XL")
    if (i < length_roman && substr(roman, i, i + 1) %in% names(roman_numerals)) {
      total <- total + roman_numerals[substr(roman, i, i + 1)]
      i <- i + 2
    } else {
      # Check for single-character substrings (e.g., "X", "V")
      total <- total + roman_numerals[substr(roman, i, i)]
      i <- i + 1
    }
  }

  # Return formatted string
  return(total)
}
