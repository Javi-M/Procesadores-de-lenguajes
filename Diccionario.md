Las definiciones están basadas en los apuntes, internet y en el libro _Compiladores_, de Sergio Gálvez Rojas y Miguel Ángel Morata Mata.
Las definiciones responden al uso que se hace de los términos en la asignatura. 

En caso de que un término tenga más de una definición, aparecerá varias veces:
|         |                    |
|---------|--------------------|
| Palabra | 1. Una definicion  |  
| Palabra | 2. Otra definicion |

> El término _glosario_ es más adecuado que el de _diccionario_
  
# Glosario
| Término              | Definición  |
|----------------------|-------------|
| Árbol sintáctico     | <!--TODO--> |
| Analizador sintáctico| 1. Fase de análisis que se encarga de chequear la secuencia de _tokens_ que representa al texto de entrada |
| $CABECERA(\alpha)$   | Conjunto de símbolos terminales que pueden aparecer a la izquierda (primer símbolo) en alguna forma sentencial derivada de $\alpha$. |
| Compilador		   | Es aquel traductor que tiene como entrada una sentencia en lenguaje formal y como salida tiene un fichero ejecutable (traducción alto nivel -> código máquina). |
| Derivación derecha   | <!--TODO--> |
| Derivación izquierda | <!--TODO--> |
| Forma sentencial     | Se llama forma sentencial de una gramática a una derivación de la misma (es decir a cualquier estado intermedio en la formación de las cadenas del lenguaje. Puede contener símbolos terminales y no terminales). |
| Intérprete           | Es aquel traductor que tiene como entrada una sentencia en lenguaje formal y tiene por salida directamente una ejecución. El programa de entrada se reconoce y ejecuta a la vez. |
| Lenguaje pseudointerpretado | Lenguajes que son _pseudocompilados_ y que generan _pseudoejecutables_, gracias a un motor de ejecución. Ejemplo: Java y su máquina virtual. |
| Lexema               | 1. Secuencia de caracteres que coincide con un patrón (una ER para nosotros). |
| Lexema               | 2. Secuencia de caracteres que es instancia de un _token_ |
| $LL(1)$              | Left to right, Left most, 1 symbol. |
| Reducción            | Operación (durante el análisis sintáctico) de sustituir una subcadena de nodos por un símbolo no terminal (metanotación) común a toda la subcadena. | 
| $SIGUIENTE(A)$       | Conjunto de símbolos terminales que pueden aparecer inmediatamente a la derecha del símbolo A en cualquier forma sentencial que sea posible generar a partir de la gramática. _Nota: A es un símbolo no terminal._ |
| Símbolo director     | <!--TODO--> |
| Sintaxis             | Conjunto de reglas que definen las secuencias correctas de los elementos de un lenguaje de programación. |
| Tabla de símbolos    | <!--TODO--> |
| Token                | Es una entidad primaria; la mínima unidad léxica con "significado". |
| Traductor 		   | Programa que traduce o convierte desde un texto o programa escrito en un lenguaje fuente hasta un texto o programa equivalente escrito en un lenguaje destino produciendo, si cabe, mensajes de error. |
| Parse                | Secuencia ordenada de las reglas aplicadas para construir un árbol sintáctico de una cadena. _Será una secuencia de números que harán referencia a las reglas de una gramática_. |
| Preprocesador 	   | Traductor que modifica el programa fuente **antes** de la compilación. Los preprocesadores usan macroinstrucciones y directivas de compilación. |





