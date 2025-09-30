- [Caracteres especiales](#caracteres-especiales)
- [Estructura de un archivo `.flex` / `.lex`](#estructura-de-un-archivo-flex--lex)
  - [*User Code*](#user-code)
  - [*Options and Declarations*](#options-and-declarations)
  - [*Lexical Rules*](#lexical-rules)
- [El Lexer generado](#el-lexer-generado)


# Caracteres especiales
> Para usarlos literalmente, sin su significado especial, hay que poner `\`. Para reconocer el lexema \ usaríamos `\\`.
* `*` `+` `?` `|` `[` `]` `(` `)` `"` `\` `.` `{` `}` `^` `$` `/` `<`  `>`
* En corchetes: `-` `\` `^`	

| Caracter | Fuera de corchetes                         | En corchetes [ ]    |
|----------|--------------------------------------------|---------------------|
| `.`      | Cualquier caracter excepto el fin de linea |                     |
| `$`      | Fin de línea 								|                     |
| 


# Estructura de un archivo `.flex` / `.lex`
```flex
/* USER CODE */

%%
/* OPTIONS AND DECLARATIONS */

%%
/* LEXICAL RULES */

```

## *User Code*
Se copia _verbatim_ al principio del lexer generado (`Yylex.java` por defecto).


## *Options and Declarations*
Esta parte contiene:
- Opciones
- Código a incluir en la clase scanner
- Estados léxicos
- Declaraciones macro

Opciones sobre la clase generada:
- `%{ ... %}` <br> El código contenido se copia en la clase generada.
- `%init{ ... %init}` <br> El código se copia en el constructor.

Opciones sobre el método _scanner_ (`yylex()`):
- `%integer`, `%int` <br> Hace que el método `yylex()` sea de tipo `int`. Por 
    defecto este método es de tipo `Yytoken`: 
    `public Yytoken yylex() throws java.io.IOException`

Opciones para _scanners standalone_ (**útiles para debuggear!**):
- `%debug` <br> En la clase `Yylex`, crea un `main` que espera un archivo como
    entrada. Imprime en detalle información de los lexemas reconocidos y tokens.
- `%standalone`

Opciones sobre los _characters sets_:
- `%7bit` <br> La clase generada usa un input set de códigos 0-127
    (ASCII básico)
- `%full`, `%8bit` <br> La clase generada usa un input set de códigos 0-255 
    (ASCII extendido).
- `%unicode`, `%16bit` 
> Utilizar `unicode` evitará la excepción `ArrayIndexOutofBoundsException`.

Activar contador de caracteres, líneas y columnas: `%char`, `%line`, `%column`,
accesibles mediante `yychar`, `yyline`, `yycolumn` (empezando por 0). 

- `%state "STATE_IDENTIFIER` <br> Define estado/s inclusivos.
- `%xstate ...` <br> Define estado/s exclusivos.

- Definir un macro: `macroidentifier = regularexpression` <br> Las ER no deben
    contener los operadores `^`, `/` o `$`.

## *Lexical Rules*
Cuando un lexema hace _match_ con una ER se ejecuta la acción.
```jflex
expr { /* Java code */ }
```

Clases predefinidas: 
- `[:jletter:]`
- `[:jletterdigit:]`
- `[:letter:]`
- `[:digit:]`
- `[:uppercase:]`
- `[:lowercase:]`
- `\d` `\D`
- `\s` `\S`
- `\w` `\W`
- `.`

Meta-caracteres (caracteres especiales): `\| ( ) { } [ ] < > \ . * + ? ^ $ / . " ~ !`

# El Lexer generado
Por defecto es `Yylex.java`. Tras que JFlex interprete el archivo `*.lex` o `*.flex`, genera una clase que 
por defecto se llama `Yylex.java`. Esta es la clase del *scanner*. 

Los objetos de esta clase tienen los siguentes métodos:
* `int yylex()`: *Scanning method*. Devuelve un entero, correspondiente al token del lexema 
    reconocido.
* `String yytext()`: Devuelve el lexema que se acaba de reconocer (*match*).
* `int yylength()`: 
* `char yycharat(int pos)`

