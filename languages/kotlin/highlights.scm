; CREDITS @egek92 (ege.kuzubasioglu@pm.me)
; Variables
(identifier) @variable

; Methods
(method_declaration
  name: (identifier) @function.method)

(method_invocation
  name: (identifier) @function.method.call)

(super) @function.builtin

; Parameters
(formal_parameter
  name: (identifier) @variable.parameter)

(catch_formal_parameter
  name: (identifier) @variable.parameter)

(spread_parameter
  (variable_declarator
    name: (identifier) @variable.parameter)) ; int... foo

; Lambda parameter
(inferred_parameters
  (identifier) @variable.parameter) ; (x,y) -> ...

(lambda_expression
  parameters: (identifier) @variable.parameter) ; x -> ...

; Operators
[
  "+"
  ":"
  "++"
  "-"
  "--"
  "&"
  "&&"
  "|"
  "||"
  "!"
  "!!"
  "!="
  "=="
  "==="
  "!=="
  "*"
  "/"
  "%"
  "<"
  "<="
  ">"
  ">="
  "="
  "-="
  "+="
  "*="
  "/="
  "%="
  "->"
  "&="
  "|="
  "~"
  ">>"
  ">>>"
  "<<"
  "::"
  "@"
  "$"
  "..<"
  ".."
  "::"
  "?:"
  "?."
  "?"
  "_"
] @operator

; Types
(interface_declaration
  name: (identifier) @type)

(annotation_type_declaration
  name: (identifier) @type)

(class_declaration
  name: (identifier) @type)

(record_declaration
  name: (identifier) @type)

(enum_declaration
  name: (identifier) @type)

(constructor_declaration
  name: (identifier) @type)

(type_identifier) @type

((type_identifier) @type.builtin
  (#eq? @type.builtin "var"))

((method_invocation
  object: (identifier) @type)
  (#lua-match? @type "^[A-Z]"))

((method_reference
  .
  (identifier) @type)
  (#lua-match? @type "^[A-Z]"))

((field_access
  object: (identifier) @type)
  (#lua-match? @type "^[A-Z]"))

(scoped_identifier
  (identifier) @type
  (#lua-match? @type "^[A-Z]"))

; Fields
(field_declaration
  declarator:
    (variable_declarator
      name: (identifier) @variable.member))

(field_access
  field: (identifier) @variable.member)

[
  (boolean_type)
  (integral_type)
  (floating_point_type)
  (void_type)
] @type.builtin

; Variables
((identifier) @constant
  (#lua-match? @constant "^[A-Z_][A-Z%d_]+$"))

(this) @variable.builtin

; Annotations
(annotation
  "@" @attribute
  name: (identifier) @attribute)

(marker_annotation
  "@" @attribute
  name: (identifier) @attribute)

; Literals
(string_literal) @string

(escape_sequence) @string.escape

(character_literal) @character

[
  (hex_integer_literal)
  (decimal_integer_literal)
  (octal_integer_literal)
  (binary_integer_literal)
] @number

[
  (decimal_floating_point_literal)
  (hex_floating_point_literal)
] @number.float

[
  (true)
  (false)
] @boolean

(null_literal) @constant.builtin

; Keywords
[
  "as"
  "as?"
  "break"
  "class"
  "fun"
  "in"
  "!in"
  "interface"
  "is"
  "!is"
  "null"
  "object"
  "super"
  "this"
  "true"
  "typealias"
  "typeof"
  "val"
  "var"
  "by"
  "constructor"
  "delegate"
  "dynamic"
  "field"
  "file"
  "get"
  "init"
  "param"
  "property"
  "receiver"
  "set"
  "setparam"
  "value"
  "where"
] @keyword

[
  "abstract"
  "actual"
  "annotation"
  "companion"
  "const"
  "crossinline"
  "data"
  "enum"
  "expect"
  "external"
  "final"
  "infix"
  "inline"
  "inner"
  "internal"
  "lateinit"
  "noinline"
  "open"
  "operator"
  "out"
  "override"
  "private"
  "protected"
  "public"
  "reified"
  "sealed"
  "suspend"
  "tailrec"
  "vararg"
] @type.qualifier

[
  "return"
] @keyword.return

; Conditionals
[
  "if"
  "else"
  "when"
] @keyword.conditional

(ternary_expression
  [
    "?"
    ":"
  ] @keyword.conditional.ternary)

; Loops
[
  "for"
  "while"
  "do"
  "continue"
  "break"
] @keyword.repeat

; Includes
[
  "package"
  "import"
] @keyword.import

; Punctuation
[
  ";"
  "."
  "..."
  ","
] @punctuation.delimiter

[
  "{"
  "}"
] @punctuation.bracket

[
  "["
  "]"
] @punctuation.bracket

[
  "("
  ")"
] @punctuation.bracket

(type_arguments
  [
    "<"
    ">"
  ] @punctuation.bracket)

(type_parameters
  [
    "<"
    ">"
  ] @punctuation.bracket)

(string_interpolation
  [
    "\\{"
    "}"
  ] @punctuation.special)

; Exceptions
[
  "throw"
  "finally"
  "try"
  "catch"
] @keyword.exception

; Labels
(labeled_statement
  (identifier) @label)

; Comments
[
  (line_comment)
  (block_comment)
] @comment @spell

((block_comment) @comment.documentation
  (#lua-match? @comment.documentation "^/[*][*][^*].*[*]/$"))

((line_comment) @comment.documentation
  (#lua-match? @comment.documentation "^///[^/]"))

((line_comment) @comment.documentation
  (#lua-match? @comment.documentation "^///$"))
