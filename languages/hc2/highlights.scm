(comment) @comment
(string) @string
(escape_sequence) @string.escape
(character) @string
(number) @number

["as" "asm" "break" "case" "const" "continue" "default" "defer" "else"
 "fallthrough" "for" "if" "import" "return" "sizeof" "struct" "switch"
 "union" "unsafe"] @keyword

["true" "false"] @boolean
"null" @constant

; the patterns below are mutually exclusive by regex, so match order never matters

((identifier) @type
 (#match? @type "^(U0|U8|U16|U32|U64|I8|I16|I32|I64|Bool)$"))

((identifier) @constant
 (#match? @constant "^[A-Z][A-Z0-9_]*_[A-Z0-9_]*$"))

((identifier) @type
 (#match? @type "^[A-Z].*[a-z]"))

(call name: (identifier) @function
 (#match? @function "^[a-z_]"))

(method_call name: (identifier) @function
 (#match? @function "^[a-z_]"))

(member name: (identifier) @property
 (#match? @property "^[a-z_]"))

["..." "==" "!=" "<=" ">=" "++" "--" "<<" ">>" "&&" "||"
 "=" "<" ">" "+" "-" "*" "/" "%" "&" "|" "^" "~" "!" "?"] @operator

["(" ")" "{" "}" "[" "]"] @punctuation.bracket
[";" "," ":" "."] @punctuation.delimiter
