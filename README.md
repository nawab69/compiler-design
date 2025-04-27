# Compiler Construction Examples

This repository contains various examples of lexical analyzers (using Lex/Flex) and parsers (using Yacc/Bison) for compiler construction.

## Table of Contents

- [Compiler Construction Examples](#compiler-construction-examples)
  - [Table of Contents](#table-of-contents)
  - [Prerequisites](#prerequisites)
  - [General Compilation Instructions](#general-compilation-instructions)
  - [Folder Structure](#folder-structure)
    - [integer - Recognizing Integers and Floating Point Numbers](#integer---recognizing-integers-and-floating-point-numbers)
    - [teletalk - Identifying Teletalk Phone Numbers](#teletalk---identifying-teletalk-phone-numbers)
    - [identifier - Counting Characters, Words, Spaces, and Lines](#identifier---counting-characters-words-spaces-and-lines)
      - [identifier.l - Identify and Count Identifiers](#identifierl---identify-and-count-identifiers)
      - [identifier2.l - Count Characters, Words, Spaces, and Lines](#identifier2l---count-characters-words-spaces-and-lines)
    - [exponential - Identifying Exponential Numbers](#exponential---identifying-exponential-numbers)
    - [complex - Identifying Complex Numbers](#complex---identifying-complex-numbers)
    - [sentence - Recognizing Sentence Types](#sentence---recognizing-sentence-types)
    - [calculator - Evaluating Arithmetic Expressions](#calculator---evaluating-arithmetic-expressions)
    - [variable - Recognizing Valid Variables](#variable---recognizing-valid-variables)
    - [expression - Recognizing Arithmetic Expressions](#expression---recognizing-arithmetic-expressions)
    - [anbn - Recognizing Strings in a^n b^n Grammar](#anbn---recognizing-strings-in-an-bn-grammar)
    - [anbplusmcm - Recognizing Strings in a^n b^(n+m) c^m Grammar](#anbplusmcm---recognizing-strings-in-an-bnm-cm-grammar)
    - [comment\_counter - Counting and Removing C Program Comments](#comment_counter---counting-and-removing-c-program-comments)
    - [verb - Identifying "To Be" Verbs](#verb---identifying-to-be-verbs)
    - [hello-world - Simple Hello World Example](#hello-world---simple-hello-world-example)
    - [lexical-analyser - Various Lexical Pattern Recognition](#lexical-analyser---various-lexical-pattern-recognition)
      - [pattern1.l - Basic Pattern Recognition](#pattern1l---basic-pattern-recognition)
      - [pattern2.l - Additional Pattern Recognition](#pattern2l---additional-pattern-recognition)
      - [pattern3.l - More Complex Pattern Recognition](#pattern3l---more-complex-pattern-recognition)
  - [Additional Notes](#additional-notes)

## Prerequisites

To compile and run these examples, you need:

- Flex (Fast Lexical Analyzer Generator)
- Bison (GNU Parser Generator)
- GCC (GNU Compiler Collection)

On macOS, you can install these tools using Homebrew:

```bash
brew install flex bison gcc
```

## General Compilation Instructions

For programs using only Lex/Flex:

```bash
flex filename.l
gcc -o program_name lex.yy.c -ll
```

For programs using both Lex/Flex and Yacc/Bison:

```bash
yacc -d filename.y
flex filename.l
gcc -o program_name lex.yy.c y.tab.c -ll
```

## Folder Structure

### integer - Recognizing Integers and Floating Point Numbers

This program recognizes both integers and floating-point numbers.

**Files:**

- `integer.l` - Lexical analyzer for recognizing integers and floating-point numbers

**Compile:**

```bash
cd integer
flex integer.l
gcc -o integer lex.yy.c -ll
```

**Run:**

```bash
./integer
```

**Test Cases:**

```
123
456.789
42.0
7
```

**Expected Output:**

```
Integer Number: 123
Floating Point Number: 456.789
Floating Point Number: 42.0
Integer Number: 7
```

### teletalk - Identifying Teletalk Phone Numbers

This program identifies Teletalk phone numbers (starts with 015, followed by 8 more digits).

**Files:**

- `teletalk.l` - Lexical analyzer for identifying Teletalk numbers

**Compile:**

```bash
cd teletalk
flex teletalk.l
gcc -o teletalk lex.yy.c -ll
```

**Run:**

```bash
./teletalk
```

**Test Cases:**

```
01512345678
01612345678
015123456
01512345678910
```

**Expected Output:**

```
Valid Teletalk number: 01512345678
Not a valid Teletalk number: 01612345678
Not a valid Teletalk number: 015123456
Not a valid Teletalk number: 01512345678910
```

### identifier - Counting Characters, Words, Spaces, and Lines

This folder contains programs that recognize identifiers and count various elements in text.

#### identifier.l - Identify and Count Identifiers

**Compile:**

```bash
cd identifier
flex identifier.l
gcc -o identifier lex.yy.c -ll
```

**Run:**

```bash
./identifier
```

**Test Cases:**

```
variable1 2ndVar x y z count_total if for while 123abc
```

**Expected Output:**

```
Identifier: variable1
Invalid identifier (starts with digit): 2ndVar
Identifier: x
Identifier: y
Identifier: z
Identifier: count_total
Identifier: if
Identifier: for
Identifier: while
Invalid identifier (starts with digit): 123abc
Total number of identifiers: 8
```

#### identifier2.l - Count Characters, Words, Spaces, and Lines

**Compile:**

```bash
cd identifier
flex identifier2.l
gcc -o counter lex.yy.c -ll
```

**Run:**

```bash
./counter
```

**Test Cases:**

```
This is a test.
It has multiple lines.
Let's count words, spaces, and characters!
```

**Expected Output:**

```
Statistics:
Number of characters: 81
Number of words: 15
Number of spaces: 14
Number of lines: 2
```

### exponential - Identifying Exponential Numbers

This program identifies exponential numbers in scientific notation.

**Files:**

- `exponential.l` - Lexical analyzer for identifying exponential numbers

**Compile:**

```bash
cd exponential
flex exponential.l
gcc -o exponential lex.yy.c -ll
```

**Run:**

```bash
./exponential
```

**Test Cases:**

```
123 45.67 2.5e10 3.14E-5 7e8 -1.2e+3 9E4 0.5
```

**Expected Output:**

```
Regular integer: 123
Regular float: 45.67
Exponential number (decimal form): 2.5e10
Exponential number (decimal form): 3.14E-5
Exponential number (integer form): 7e8
Exponential number (decimal form): -1.2e+3
Exponential number (integer form): 9E4
Regular float: 0.5
Total exponential numbers found: 5
```

### complex - Identifying Complex Numbers

This program identifies complex numbers in various forms.

**Files:**

- `complex.l` - Lexical analyzer for identifying complex numbers

**Compile:**

```bash
cd complex
flex complex.l
gcc -o complex lex.yy.c -ll
```

**Run:**

```bash
./complex
```

**Test Cases:**

```
3+4i 2.5-1.7i 42 3.14 5i 2.5i 1+2.5i 3.1+4i
```

**Expected Output:**

```
Complex number (integer): 3+4i
Complex number (decimal): 2.5-1.7i
Regular integer: 42
Regular float: 3.14
Pure imaginary number (integer): 5i
Pure imaginary number (decimal): 2.5i
Complex number (mixed): 1+2.5i
Complex number (mixed): 3.1+4i
Total complex numbers found: 6
```

### sentence - Recognizing Sentence Types

This program identifies whether a sentence is simple, compound, or complex.

**Files:**

- `sentence.l` - Lexical analyzer for identifying sentence types

**Compile:**

```bash
cd sentence
flex sentence.l
gcc -o sentence lex.yy.c -ll
```

**Run:**

```bash
./sentence
```

**Test Cases:**

```
The cat sleeps on the mat.
```

```
The cat sleeps on the mat, and the dog barks at the mailman.
```

```
Although it was raining, she went for a walk.
```

**Expected Output:**
For simple sentence:

```
Simple sentence: Contains a single independent clause.
```

For compound sentence:

```
Compound sentence: Multiple independent clauses joined by coordinating conjunction(s).
Found 1 coordinating conjunction(s).
```

For complex sentence:

```
Complex sentence: Contains at least one dependent clause.
Found 1 subordinating conjunction(s).
```

### calculator - Evaluating Arithmetic Expressions

This program acts as a calculator, evaluating arithmetic expressions with operators +, -, \*, and /.

**Files:**

- `calc.l` - Lexical analyzer for tokenizing input expressions
- `calc.y` - Parser for evaluating arithmetic expressions

**Compile:**

```bash
cd calculator
yacc -d calc.y
flex calc.l
gcc -o calculator lex.yy.c y.tab.c -ll
```

**Run:**

```bash
./calculator
```

**Test Cases:**

```
5+3
10-2
4*5
20/4
(3+4)*2
-5+7
```

**Expected Output:**

```
Result: 8
Result: 8
Result: 20
Result: 5
Result: 14
Result: 2
```

### variable - Recognizing Valid Variables

This program recognizes valid variable names (starting with a letter, followed by letters or digits).

**Files:**

- `variable.l` - Lexical analyzer for recognizing variable names
- `variable.y` - Parser for validating variable names

**Compile:**

```bash
cd variable
yacc -d variable.y
flex variable.l
gcc -o variable lex.yy.c y.tab.c -ll
```

**Run:**

```bash
./variable
```

**Test Cases:**

```
validVar x y123 name_1 2invalid _underscore
```

**Expected Output:**

```
Valid variable
Valid variable
Valid variable
Valid variable
Invalid variable - must start with a letter
Invalid variable - must start with a letter
```

### expression - Recognizing Arithmetic Expressions

This program recognizes valid arithmetic expressions using the operators +, -, \*, and /.

**Files:**

- `expr.l` - Lexical analyzer for tokenizing input expressions
- `expr.y` - Parser for recognizing arithmetic expressions

**Compile:**

```bash
cd expression
yacc -d expr.y
flex expr.l
gcc -o expr lex.yy.c y.tab.c -ll
```

**Run:**

```bash
./expr
```

**Test Cases:**

```
5+3
10-2
4*5
20/4
(3+4)*2
-5+7
a+b*c
(x+y)/(z-2)
```

**Expected Output:**

```
Valid arithmetic expression
Valid arithmetic expression
Valid arithmetic expression
Valid arithmetic expression
Valid arithmetic expression
Valid arithmetic expression
Valid arithmetic expression
Valid arithmetic expression
Parsing completed successfully
```

### anbn - Recognizing Strings in a^n b^n Grammar

This program recognizes strings that follow the a^n b^n grammar where n > 0 (equal number of a's followed by b's).

**Files:**

- `anbn.l` - Lexical analyzer for tokenizing input strings
- `anbn.y` - Parser for recognizing strings in the a^n b^n grammar

**Compile:**

```bash
cd anbn
yacc -d anbn.y
flex anbn.l
gcc -o anbn lex.yy.c y.tab.c -ll
```

**Run:**

```bash
./anbn
```

**Test Cases:**

```
aaab
abbb
ab
a
aabb
```

**Expected Output:**

```
Error: syntax error
Invalid string: Does not match a^n b^n grammar
Error: syntax error
Invalid string: Does not match a^n b^n grammar
Valid string: Matches a^n b^n grammar (n > 0)
Error: syntax error
Invalid string: Does not match a^n b^n grammar
Valid string: Matches a^n b^n grammar (n > 0)
```

### anbplusmcm - Recognizing Strings in a^n b^(n+m) c^m Grammar

This program recognizes strings that follow the a^n b^(n+m) c^m grammar where n,m >= 0 (strings where all 'a's are followed by all 'b's, followed by all 'c's, with specific quantity relationships).

**Files:**

- `anbplusmcm.l` - Lexical analyzer for tokenizing input strings
- `anbplusmcm.y` - Parser for recognizing strings in the a^n b^(n+m) c^m grammar

**Compile:**

```bash
cd anbplusmcm
yacc -d anbplusmcm.y
flex anbplusmcm.l
gcc -o anbplusmcm lex.yy.c y.tab.c -ll
```

**Run:**

```bash
./anbplusmcm
```

**Test Cases:**

```

ab
bc
abc
aabbc
abbcc
aaabbbccc
cba
abba
abbccc
```

**Expected Output:**

```
Valid string: Matches a^n b^(n+m) c^m grammar (n,m >= 0)
Valid string: Matches a^n b^(n+m) c^m grammar (n,m >= 0)
Valid string: Matches a^n b^(n+m) c^m grammar (n,m >= 0)
Valid string: Matches a^n b^(n+m) c^m grammar (n,m >= 0)
Valid string: Matches a^n b^(n+m) c^m grammar (n,m >= 0)
Valid string: Matches a^n b^(n+m) c^m grammar (n,m >= 0)
Error: syntax error
Invalid string: Does not match a^n b^(n+m) c^m grammar
Error: syntax error
Invalid string: Does not match a^n b^(n+m) c^m grammar
Valid string: Matches a^n b^(n+m) c^m grammar (n,m >= 0)
```

### comment_counter - Counting and Removing C Program Comments

This program counts the number of comment lines in a C program and produces a clean version of the program with all comments removed.

**Files:**

- `comment_counter.l` - Lexical analyzer for counting and removing C program comments
- `test.c` - A sample C program with comments for testing

**Compile:**

```bash
cd comment_counter
flex comment_counter.l
gcc -o comment_counter lex.yy.c -ll
```

**Run:**

```bash
./comment_counter input_file.c output_file.c
```

**Test Cases:**
Using the provided `test.c` file which contains:

- Single-line comments (using //)
- Multi-line comments (using /\* \*/)
- Inline comments
- Nested comments

**Expected Output:**

- Terminal output showing the total number of comment lines found
- A new file (specified as the second argument) containing the program without any comments

**Example:**

```
$ ./comment_counter test.c output.c
Total comment lines: 12
Program without comments copied to output.c
```

### verb - Identifying "To Be" Verbs

This program identifies different forms of the "to be" verb (am, is, are, was, were, be, being, been).

**Files:**

- `verb.l` - Lexical analyzer for identifying "to be" verbs

**Compile:**

```bash
cd verb
flex verb.l
gcc -o verb lex.yy.c -ll
```

**Run:**

```bash
./verb
```

**Test Cases:**

```
I am happy. She is smart. They are friends. He was tired. We were busy. I will be there. She is being careful. They have been working.
```

**Expected Output:**

```
'to be' verb found: am
'to be' verb found: is
'to be' verb found: are
'to be' verb found: was
'to be' verb found: were
'to be' verb found: be
'to be' verb found: being
'to be' verb found: been
Total 'to be' verbs found: 8
```

### hello-world - Simple Hello World Example

A simple Hello World example using Lex/Flex.

**Files:**

- `hello.l` - Simple example of a Lex program

**Compile:**

```bash
cd hello-world
flex hello.l
gcc -o hello lex.yy.c -ll
```

**Run:**

```bash
./hello
```

### lexical-analyser - Various Lexical Pattern Recognition

This folder contains various pattern recognition examples using Lex/Flex.

#### pattern1.l - Basic Pattern Recognition

**Compile:**

```bash
cd lexical-analyser
flex pattern1.l
gcc -o pattern1 lex.yy.c -ll
```

**Run:**

```bash
./pattern1
```

#### pattern2.l - Additional Pattern Recognition

**Compile:**

```bash
cd lexical-analyser
flex pattern2.l
gcc -o pattern2 lex.yy.c -ll
```

**Run:**

```bash
./pattern2
```

#### pattern3.l - More Complex Pattern Recognition

**Compile:**

```bash
cd lexical-analyser
flex pattern3.l
gcc -o pattern3 lex.yy.c -ll
```

**Run:**

```bash
./pattern3
```

## Additional Notes

- Use Ctrl+D to exit most programs when you're done with input
- For file input, you can redirect a file to the program with `./program < input_file.txt`
- For redirecting output to a file, use `./program > output_file.txt`
