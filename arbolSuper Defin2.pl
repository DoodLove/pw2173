/**********************************************************/
/*                                                        */
/*  Departamento de Ciencia de la Computación e           */
/*               Inteligencia Artificial                  */
/*  Universidad de Alicante                               */
/*                                                        */
/*                LOGICA DE PRIMER ORDEN                  */
/*                       Prolog                           */
/*                                                        */
/*  M. Jesús Castel                      Faraón Lloréns   */
/*                                                        */
/*       S.O.       :  MS-DOS (Windows)                   */
/*       Interprete :  SWI-Prolog                         */
/*       Fichero    :  EJ09.PL                            */
/*                                                        */
/**********************************************************/

/* ÁRBOL GENEALÓGICO                                      */


/*----             PROGRAMA PRINCIPAL                 ----*/

/*------ Hechos ------*/

/* padres(H,P,M,A) <- H tiene como padre a P y como madre a M, y nació el año A */
padres('Don Jose',p1,m1,1933).
padres('Doña Maria',p2,m2,1934).
padres('Jose','Don Jose','Doña Maria',1955).
padres('Maria','Don Jose','Doña Maria',1968).
padres('Antonia',p3,m3,1959).
padres('Maria Jose','Don Jose','Doña Maria',1961).
padres('Luis',p4,m4,1961).
padres('Jose Antonio','Jose','Antonia',1979).
padres('Pepe','Jose','Antonia',1983).
padres('Rosa',p5,m5,1985).
padres('Jose Luis','Luis','Maria Jose',1991).
padres('Maria Luisa','Luis','Maria Jose',1996).
padres('Pepito','Pepe','Rosa',2015).

/* casados(H,M) <- El hombre H está casado con la mujer M */
casados('Don Jose','Doña Maria').
casados('Jose','Antonia').
casados('Luis','Maria Jose').
casados('Pepe','Rosa').

/* hombre(P) <- la persona P es del género masculino */
hombre('Don Jose').
hombre('Jose').
hombre('Luis').
hombre('Jose Antonio').
hombre('Pepe').
hombre('Jose Luis').
hombre('Pepito').

/* mujer(P) <- la persona P es del género femenino */
mujer('Doña Maria').
mujer('Antonia').
mujer('Maria').
mujer('Maria Jose').
mujer('Rosa').
mujer('Maria Luisa').


/*------ Reglas ------*/

/* edad(P,E) <- la persona P tiene E años */
edad(P,E) :–  padres(P,_,_,A),E is 2017–A.

/* mayor(P1,P2) <- la persona P1 es mayor que P2 */

/* niño(P1) <- P1 es un niño (menos de 14 años) */
niño(P) :– edad(P,E1), 14<E1.
/* joven(P1) <- P1 es una persona joven (entre 14 y 25 años) */

/* adulto(P1) <- P1 es un adulto (entre 25 y 50 años) */
adulto :– edad(P,E1), 25<E1, E1<50
/* viejo(P1) <- P1 es una persona vieja (más de 50 años) */
viejo(P) :– edad(P,E1), 50<E1.
/* hermanos(H1,H2) <- H1 es hermano/a de H2 */
hermanos(H1,H2) :– padres(H1,P1,_,_), padres(H2,_,M2,_), casados(P1,M2), H1\=H2.
/* tio(T,S) <- T es el tio de S, considere tios politicos */
%V1 TIO CARNAL PADRE/MADRE
tio(T,S) :– hombre(T), padres(S,P,M,_), (hermanos(T,P); hermanos(T,M)).
%V1 TIO POLITICO PADRE
tio(T,S) :– hombre(T), padres(S,P,M,_), (hermanos(T1,P); hermanos(T1,M)), casados(T,T1).
/* tia(T,S) <- T es la tia de S, considere tios politicos */

/* primos(P1,P2) <- P1 es primo/a de P2 */
primos(P1,P2) :– padres(P1,Pa1,Ma1,_), padres(P2,Pa2,Ma2,_), (hermanos(Pa1,Pa2); hermanos(Ma1,Ma2); hermanos(Pa1,Ma2); hermanos(Ma1,Pa2);)
/* abuelo(A,N) <- A es el abuelo de N */

/* abuela(A,N) <- A es la abuela de N */

/* antepasado(A,P) <- A es antepasado de P */

