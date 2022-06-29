# Ejemplos de expresiones regulares **en JFlex**.

| Expresión                               | Reconoce...          |
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
> Para usarlos literalmente, sin su significado especial, hay que poner `\`. Para reconocer el lexema \ usaríamos `\\`.
* `*` `+` `?` `|` `[` `]` `(` `)` `"` `\` `.` `{` `}` `^` `$` `/` `<`  `>`
* En corchetes: `-` `\` `^`	

| Caracter | Fuera de corchetes                         | En corchetes [ ]    |
|----------|--------------------------------------------|---------------------|
| `.`      | Cualquier caracter excepto el fin de linea |                     |
| `$`      | Fin de línea 								|                     |
| 
 

