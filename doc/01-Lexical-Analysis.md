# Lexical Analysis
Reads source text and produces tokens. The analyzer tracks the source coordinates for each token: file name, line number and character index of the line. In lcc, it is divided into two parts: `input.c` to read the input to a buffer and `lex.c` to examine the characters to recognize tokens.

## Reference
- Fraser, C. W., & Hanson, D. R. (1995). A retargetable C compiler: design and implementation. Addison-Wesley Longman Publishing Co., Inc..
