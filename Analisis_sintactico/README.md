Este directorio contiene ejercicios en lo relativo al análisis sintáctico. Cada subdirectorio será un ejercicio.

# Ejercicios de análisis sintáctico

## LL1-sent-WHILE
(JFlex y Java) Análisis sintáctico de una lista de sentencias de un lenguaje imperativo similar a C definido mediante la siguiente gramática (9 reglas):
0. axioma -> listaSent EOF
1. listaSent -> sent listaSent
2. listaSent ->
3. sent -> WHILE AP cond CP sent
4. sent -> DO sent WHILE AP cond CP PYC
5. sent -> IDENT IGUAL var PYC
6. cond -> ALL listaSent CLL
7. var ->  var MENOR var
8. var -> IDENT
9. var -> NUMERO
