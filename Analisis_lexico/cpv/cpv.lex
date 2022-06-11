

%%

%int

letra 		= [a-zA-Z]
vocal 		= [aeiouAEIOU]
consonante 	= [b-df-hj-np-tv-zB-DF-HJ-NP-TV-Z]
/*La diferencia de conjuntos {letra}--{vocal} da problemas. Mejor evitarlo.*/
palabra 	= [a-zA-Z]*

%%

/* Tiene al menos dos vocales seguidas y termina en consonante */
{palabra}{vocal}{vocal}{palabra}{consonante}+   	{cpv.c++;}

/* Al menos 2 vocales seguidas y termina en vocal */
{palabra}{vocal}{vocal}{palabra}     			{cpv.a++;}

/* No tiene dos vocales seguidas y termina en consonante */
{palabra}{consonante}							{cpv.d++;}

/* No tiene 2 vocales seguidas y termina en vocal */
{palabra}{vocal}								{cpv.b++;}


[^] 				{/*Ignorar*/}