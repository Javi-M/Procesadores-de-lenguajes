# Reglas

0. axioma      $\rarr$ listaSent EOF
1. listaSent    $\rarr$ sent listaSent
2. listaSent    $\rarr$ 
3. sent           $\rarr$ WHILE AP cond CP sent
4. sent           $\rarr$ DO sent WHILE AP cond CP PYC
5. sent           $\rarr$ IDENT IGUAL var PYC
6. sent           $\rarr$ ALL listaSent CLL
7. cond          $\rarr$ var MENOR var
8. var             $\rarr$ IDENT
9. var             $\rarr$ NUMERO



# Símbolos directores

> Importante, obviamtente, saber el funcionamiento de CABECERA($\alpha$), SIGUIENTE(A) y TABLA[A, a] = $\alpha$

0. **SD(axioma $\rarr$ listaSent EOF)** = CAB(listaSent EOF $\cdot$ SIG(axioma)) = {EOF} $\cup$ CAB(listaSent) =
    = {EOF} $\cup$ CAB(sent) 
    = **{EOF, WHILE, DO, IDENT, ALL}**.
1. **SD(listaSent $\rarr$ sent listaSent)** = CAB(sent)
   = **{WHILE, DO, IDENT}**.
2. **SD(listaSent $\rarr$ $\varepsilon$) =** CAB(SIG(listaSent))
   = **{EOF, $}**.
3. **SD(sent $\rarr$ WHILE AP cond CP sent)** = CAB(WHILE AP cond CP sent $\cdot$ SIG(sent))
   = **{WHILE}**.
4. **SD(sent $\rarr$ DO sent WHILE AP cond CP PYC)** = CAB(DO sent WHILE AP cond CP PYC $\cdot$ SIG(sent))
   = **{DO}**.
5. **SD(sent $\rarr$ IDENT IGUAL var PYC)** = CAB(IDENT IGUAL var PYC $\cdot$ SIG(sent))
   = **{IDENT}**.
6. **SD(sent $\rarr$ ALL listaSent CLL)**
   = **{ALL}**
7. **SD(cond $\rarr$ var MENOR var)**
   = **{IDENT, NUMERO}**

