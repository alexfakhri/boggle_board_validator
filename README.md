Boggle Board Validator
====

A simple program to determine if a guess is valid on a Boggle board. The program takes two arguments, a 2D array and a string. The string is then verified against the board to see if it's a valid guess.

Technologies Used:
----
Built using:
* Ruby
* RSpec
* Command Line
* Github

How to use:
----

Clone the repository:
```shell
$ git clone https://github.com/alexfakhri/boggle_board_validator.git
```

Change into the directory:
```shell
$ cd boggle_board_validator
```

Install gems:
```shell
$ bundle
```

To run tests:
```shell
$ rspec
```

To validate a guess:
```shell
$ irb
$ require './lib/boggle_validator'
$ BoggleValidator.new([["I", "L", "A", "W"], ["B", "N", "G", "E"], ["I", "U", "A", "O"], ["A", "S", "R", "L"]], 'BINGO').valid_guess?
```
Replace the board and the string to test different combinations.


Task
----
Write a function that determines whether a string is a valid guess on a
Boggle board, as per the rules of Boggle. A Boggle board is a 2D array of individual characters (example below).

[ ["I","L","A","W"], ["B","N","G","E"], ["I","U","A","O"], ["A","S","R","L"] ]

Valid guesses are strings which can be formed by connecting adjacent cells (horizontally, vertically, or diagonally) without re-using any previously used cells.

For example, in the above board, "BINGO", "LINGO", and "ILNBIA" would all be valid guesses, while "BUNGIE", "BINS", and "SINUS" would not.

Your function should take two arguments (a 2D array and a string) and return true or false depending on whether the string is found in the array as per Boggle rules.
Test cases will provide various array and string sizes. The array will always be a square 2D array of single capitalized characters, and the string will always be a single capitalized word.

You do not have to check whether the string is a real word or not, only if it's a valid guess.
