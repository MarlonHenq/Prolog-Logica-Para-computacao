%%%% nivel 1
progenitor(leia, jaina).
progenitor(leia, jacen).
progenitor(leia, anakin).
progenitor(han, jaina).
progenitor(han, jacen).
progenitor(han, anakin).

progenitor(mara, ben).
progenitor(luke, ben).

%%%% nivel 2

progenitor(darth, leia).
progenitor(padme, leia).

progenitor(darth, luke).
progenitor(padme, luke).

%%%% nivel 3

progenitor(shmi, darth).
progenitor(cliegg, darth).

progenitor(ruweee, padme).
progenitor(jobal, padme).

%%%%%%% Generos

gender(jaina, female).
gender(jacen, male).
gender(anakin, male).

gender(ben, male).

%%%%

gender(leia, female).
gender(han, male).

gender(luke, male).
gender(mara, female).

%%%%

gender(darth, male).
gender(padme, female).

%%%%

gender(shmi, female).
gender(cliegg, male).

gender(ruweee, male).
gender(jobal, female).


%%%%%%% REGRAS ----
antepassado(X, Y) :- progenitor(X, Y).
antepassado(X, Z) :- 
    progenitor(X,Y),
    antepassado(Y, Z).

mae(X, Y) :- progenitor(X, Y), gender(X, female).
pai(X, Y) :- progenitor(X, Y), gender(X, male).
paiIG(X, Y) :- progenitor(X, Y). %Independente do gênero

avoM(X, Z) :- progenitor(X, Y), progenitor(Y, Z), gender(X, male). %Avô
avoF(X, Z) :- progenitor(X, Y), progenitor(Y, Z), gender(X, female). %Avó

irma(X, Y) :- progenitor(Z, X), progenitor(Z, Y), gender(X, female).
irmao(X, Y) :- progenitor(Z, X), progenitor(Z, Y), gender(X, male).
irmaoIG(X, Y) :- progenitor(Z, X), progenitor(Z, Y). %Independente do gênero

filho(Y, X) :- progenitor(X, Y), gender(Y, male).
filha(Y, X) :- progenitor(X, Y), gender(Y, female).

tio(X, Y) :- progenitor(Z, Y), irmaoIG(Z, X), gender(X, male).
tia(X, Y) :- progenitor(Z, Y), irmaoIG(Z, X), gender(X, female).

primo(X, Y) :- tio(Z, Y), paiIG(Z, X), gender(X, male).
prima(X, Y) :- tio(Z, Y), paiIG(Z, X), gender(X, female).

%%PS: Seria nescessário uma verificação em Irma, Irmao e irmaoIG para que eles mesmo não se aparecessem como seus irmãos o que acarrenta em problemas com o tio e tia e depois primo e prima.
%%Tentei descobrir uma forma de verificar strings iguais mas não consegui. (os operadores =:= só funcionam para comparação de números).