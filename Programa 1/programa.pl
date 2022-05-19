robot(rd).
robot(cpo).
robot(bb8).

knowledge(cpo,tradutor).
knowledge(rd,mensageiro).
knowledge(bb8,navegador).

diplomaticMission(X,Y):-
robot(X),
robot(Y),
knowledge(X,tradutor),
knowledge(Y,mensageiro).

spaceMission(X,Y):-
robot(X),
robot(Y),
(knowledge(X,navegador),knowledge(Y,mensageiro));
(knowledge(X,navegador),knowledge(Y,tradutor)).

exploreMission(X,Y):-
robot(X),
robot(Y),
(knowledge(X,tradutor),knowledge(Y,mensageiro));
(knowledge(X,tradutor),knowledge(Y,navegador)).

allMissionSettings(X,Y):-
diplomaticMission(X,Y);
spaceMission(X,Y);
exploreMission(X,Y).