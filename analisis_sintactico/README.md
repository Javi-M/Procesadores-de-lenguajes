Este directorio contiene ejercicios en lo relativo al análisis sintáctico. Cada subdirectorio será un ejercicio.

# Ejercicios de análisis sintáctico

## LL1-sent-WHILE
(JFlex y Java) Análisis sintáctico de una lista de sentencias de un lenguaje imperativo similar a C definido mediante la siguiente gramática:
0. axioma        $\rarr$ listaSent EOF
1. listaSent     $\rarr$ sent listaSent
2. listaSent     $\rarr$ 
3. sent          $\rarr$ WHILE AP cond CP sent
4. sent          $\rarr$ DO sent WHILE AP cond CP PYC
5. sent          $\rarr$ IDENT IGUAL var PYC
6. sent          $\rarr$ ALL listaSent CLL
7. cond          $\rarr$ var MENOR var
8. var           $\rarr$ IDENT
9. var           $\rarr$ NUMERO

> En minúscula: símbolos no terminales. 
> En mayúsculas: símbolos terminales
