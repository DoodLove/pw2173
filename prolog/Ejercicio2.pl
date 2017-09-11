objeto(lentes).
objeto(plumon).
persona(maria).
persona(aurora).
animal(leia).
animal(leonardo).
usaDesodorante(leia).
usaDesodorante(leonardo).
corre(leonardo).
plantas(algas).
hippie(pedro).


echaHumo(X)  :- usaDesodorante(X), usa(X).
echaHumo(X)  :- usaDesodorante(X).
usa(X)       :- persona(X).
usaMedias(X) :- plantas(X), X == algas.
tocaSax(X)   :- feliz(X).
tocaSax(X)   :- (objeto(X); animal(X); persona(X)), usaDesodorante(X).
noTocaSax(X) :- usaMedias(X).
feliz(X)     :- corre(X).
feliz(X)     :- tocaSax(X), hippie(X).



% Elabore un programa en prolog que defina lo siguiente:
% 1) Las algas usan medias rojas.
%2) Todo objeto o animal o persona que usa  desodorante sabe tocar el saxo.
%3) Todo lo que eche humo usa desodorante.
% 4) Nada ni nadie que usa medias rojas puede tocar el saxo.
% 5) Todas las personas  puede usar un objeto
% 6) Si una persona usa desodorante no hara la tarea
% 7) Si usa desodorante y puede usar un objeto echa humo
% 8)Cualquier animal que corre es feliz
% 9) Los hippies son felices y pueden tocar el saxo
% 10) libre 