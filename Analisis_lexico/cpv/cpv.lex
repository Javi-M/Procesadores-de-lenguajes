

%%

/* Indicacion de que no se usa la clase Yytoken */
%int

Letra 		 = [a-zA-Z]
Vocal 		 = [aeiouAEIOU]
Consonante = [bcdfghjjklmnpqrstvwxyzBCDFGHJKLMNPRSTVWXYZ]

/* La diferencia de conjuntos {Letra}--{Vocal} da problemas. Mejor evitarlo.*/
Palabra 	 = {Letra}+

%%

/* Al menos 2 Vocales seguidas y termina en Vocal */
{Palabra}? ({Vocal} | {Vocal}{Vocal}{Palabra}?) {Vocal}      {cpv.a++;}

/* No tiene 2 Vocales seguidas y termina en Vocal */
({Vocal}? {Consonante}+)* {Vocal}                            {cpv.b++;}

/* Al menos dos vocales seguidas y termina en Consonante */
{Palabra}? {Vocal}{Vocal}  {Palabra}? {Consonante}           {cpv.c++;}

/* No tiene dos vocales seguidas y termina en Consonante */
({Vocal}? {Consonante}+)+                                    {cpv.d++;}

/*Ignorar*/
[^] 				                                            {}
