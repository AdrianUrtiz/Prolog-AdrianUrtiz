enfermedad(gripe).
enfermedad(rubeola).
enfermedad(malaria).
enfermedad(hepatitis).
enfermedad(tuberculosis).
enfermedad(anemia).
sintomade(tos, gripe).
sintomade(cansancio, gripe).
sintomade(fiebre, gripe).
sintomade(dolordecabeza, gripe).
sintomade(nauseas, hepatitis).
sintomade(diarrea, hepatitis).
sintomade(ictericia, hepatitis).
sintomade(cansancio, anemia).
sintomade(apatia, anemia).
sintomade(nauseas, anemia).
sintomade(tos, tuberculosis).
sintomade(cansancio, tuberculosis).
sintomade(fiebre, tuberculosis).
sintomade(escalofrios, tuberculosis).
sintomade(escalofrios, malaria).
sintomade(fiebre, malaria).
sintomade(diarrea, malaria).
sintomade(ictericia, malaria).
sintomade(fiebre, rubeola).
sintomade(jaqueca, rubeola).
sintomade(secrecion, rubeola).
buscar([], E, 0).
buscar(X, E, 1) :- sintomade(X, E).
buscar([X|Xs], E , P) :- enfermedad(E) , buscar(X , E , S1) , buscar(Xs , E , S2) , P is S1 + S2.
cantSint(E , C) :- findall(X , sintomade(X , E) , L) , length(L , C) , C is R.
diagnostico([X|Xs] , E , K) :- buscar([X|Xs] , E , P) , cantSint(E , T) , K is P * 100 / T.
medicinade(contrex, gripe).
medicinade(jarabe, gripe).
medicinade(pastillas, tuberculosis).
medicinade(vacuna, malaria).
medicinade(vacuna, rubeola).
medicinade(vitaminas, anemia).
medicinade(pastillas, hepatitis).

recetade(X, E) :- sintomade(S, Z), medicinade(M,Z).

5