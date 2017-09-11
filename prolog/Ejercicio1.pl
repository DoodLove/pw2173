herbivoro(vaca).
herbivoro(oveja).
carnivoro(leon).
hortaliza(tomate).
hortaliza(zanahoria).
fruta(manzana).
pescado(besugo).
carne(salchicha).
fideos(spaghetti).

cls :- write('\e[2J').
%come(X, Y) :- carnivoro(X); herbivoro(Y); pescado(Y).
come(X, Y) :- (herbivoro(X), (hortaliza(Y); fruta(Y))); (carnivoro(X), herbivoro(Y); pescado(Y); carnivoro(Y))).
come(X, Y) :- carnivoro(X), (herbivoro(Y); pescado(Y); carne(Y)).
%Creamos las reglas