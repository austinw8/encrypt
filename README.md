
# Encrypt 🔐

<!-- badges: start -->
<!-- badges: end -->

The goal of encrypt is to provide a fun collection of easy-to-use
functions for encrypting and decrypting messages using classic ciphers.
This package is perfect for friends and enthusiasts looking to add
cryptic fun to their messages.

Secret codes can be used to send fun messages between friends. Encrypt
makes it easy to create, write, and send an encoded message using
constrained language.

*\*NOTE: This is not end-to-end encryption and should not be considered
secure. It’s just a fun way to send messages to others.*

## Installation

You can install the development version of encrypt from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("austinw8/encrypt")
#> Using GitHub PAT from the git credential store.
#> Downloading GitHub repo austinw8/encrypt@HEAD
#> ── R CMD build ─────────────────────────────────────────────────────────────────
#>       ✔  checking for file 'C:\Users\austi\AppData\Local\Temp\RtmpgTxPdO\remotes68706efa3fb8\austinw8-encrypt-505479f/DESCRIPTION' (354ms)
#>       ─  preparing 'encrypt':
#>    checking DESCRIPTION meta-information ...     checking DESCRIPTION meta-information ...   ✔  checking DESCRIPTION meta-information
#>       ─  checking for LF line-endings in source and make files and shell scripts (421ms)
#>       ─  checking for empty or unneeded directories
#>       ─  building 'encrypt_0.0.0.9000.tar.gz'
#>      
#> 
#> Installing package into 'C:/Users/austi/AppData/Local/Temp/RtmpM1u9eb/temp_libpath19c439f43a6f'
#> (as 'lib' is unspecified)
```

``` r
# install.packages("devtools")
devtools::install_github("austinw8/encrypt")
```

## Ciphers

### Caesar Cipher

The **Caesar Cipher** involves shifting the letters of the alphabet by a
fixed number of places. For example, with a shift of three, the letter
‘A’ becomes ‘D’, ‘B’ becomes ‘E’, and so on.

This is a basic example of how to use `caesar_cipher()`:

``` r
library(encrypt)

caesar_cipher("attack at dawn", 3)
#> [1] "dwwdfn dw gdzq"
caesar_cipher("12345", 5)
#> [1] "67890"
caesar_cipher("abcde", -2)
#> [1] "yzabc"
```

### Atbash Cipher

**Atbash Cipher** is a substitution cipher with just one specific key
where all the letters are reversed. That is, A to Z and Z to A. It was
originally used to encode the Hebrew alphabets but it can be modified to
encode any alphabet. 

Because the alphabet is simply mirrorwd, `atbash_cipher(`) can both
encrypt and decrypt. Here’s an example:

``` r
library(encrypt)

atbash_cipher("Hebrew alphabet")
#> [1] "svyivd zokszyvg"
atbash_cipher("svyivd zokszyvg")
#> [1] "hebrew alphabet"
```

### Vigenère Cipher

**Vigenere Cipher** is a substitution method of encrypting alphabetic
text. It uses a series of interwoven Caesar ciphers based on the letters
of a keyword. Invented by the French cryptologist Blaise de Vigenère in
the 16th century, it’s based on a shift cipher to which the keyword is
added that changes the shift at each step.

Using `vigenere_cipher()` is as simple as entering the phrase you want
encoded followed by the keyword:

``` r
library(encrypt)

vigenere_cipher("Short cuts make long delays", "ring")
#> [1] "jpbxk khzj unqv tbtx lrrrgf"
vigenere_cipher("make it happen", "math")
#> [1] "yadl ut ahbpxu"
```

### Morse Code

**Morse code** is a popular binary method of communicating. Each Morse
symbol represents either a letter or number and is represented by a
unique sequence of dots and dashes.

``` r
library(encrypt)

morse_code("Holy biscuits batman")
#> [1] ".... --- .-.. -.-- / -... .. ... -.-. ..- .. - ... / -... .- - -- .- -."
morse_code("12345")
#> [1] ".---- ..--- ...-- ....- ....."
```

### Polybius Square

A **Polybius Square**, or **Polybius Cipher**, is a substitution cipher
that allows someone to convert letters into numbers, or vise versa. Each
character of the plain message is replaced by a couple of coordinates
defining its position in the grid.

*\*Note: In order to fit the 26 letters of the alphabet into the 25
cells created by the table, the letters ‘i’ and ‘j’ are usually combined
into a single cell. Originally there was no such problem, since
the Greek alphabet only has 24 letters.* 

Here’s an example of how to use `polybius_square()`:

``` r
library(encrypt)

polybius_square("Hello friends")
#> [1] "23 15 31 31 34   21 42 24 15 33 14 43"
polybius_square("3511331311251543")
#> [1] "pancakes"
polybius_square("24 45 33 24 34 42")
#> [1] "iunior"
```

------------------------------------------------------------------------

Have ideas of additional ciphers/codes to include in `encrypt`? Send me
a message at austinw.mangelson@gmail.com.
