# Ejemplos de expresiones regulares **en JFlex**.

| Expresión                               | Lexema reconocido    |
|-----------------------------------------|----------------------|
| `[a-zA-Z]`                              | Letra                |
| `[aeiouAEIOU]`                          | Vocal                |
| `[b-df-hj-np-tv-zB-DF-HJ-NP-TV-Z]`      | Consonante           |
| `[a-zA-Z]+`                             | Palabra              |
| `[0-9]+`                                | Número entero        |
| `[^0-9]`                                | Cualquier caracter que no sea un número |
| `<<EOF>>`                               | _End Of File_        |
| `[02468]\|[1-9][0-9]*[02468]`		      | Número par (natural) |
| `(.\|\n\|\r)*`                          | Cadena ASCII (del 1 al 127) |
 

# Caracteres especiales
* `*` `+` `?` `|` `[` `]` `(` `)` `"` `\` `.` `{` `}` `^` `$` `/` `<`  `>`
* En corchetes: `-` `\` `^`	

| Caracter | Fuera de corchetes                         | En corchetes [ ]    |
|----------|--------------------------------------------|---------------------|
| `.`      | Cualquier caracter excepto el fin de linea |                     |
| `$`      | Fin de línea 								|                     |
| 
 

