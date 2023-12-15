% Punto de entrada del programa
eliza:-	
    writeln('Hola, mi nombre es Eliza, soy un chatbot sobre la sifilis y clash royale. Por favor, ingresa tu consulta en minusculas y sin punto al final:'),
    readln(Input),
    eliza(Input),!.

% Si el usuario dice 'adios', el programa se despide y termina
eliza(Input):- Input == ['adios'],
    writeln('Adios. Espero haber podido ayudarte.'), !.

% Si la entrada del usuario coincide con una plantilla, genera una respuesta
eliza(Input) :-
    template(Stim, Resp, IndStim),
    match(Stim, Input),
    replace0(IndStim, Input, 0, Resp, R),
    writeln(R),
    readln(Input1),
    eliza(Input1), !.

% Plantillas de respuesta para Clash Royale
template([cual, es, la, calidad, de, las, s(_)], [flagCalidad], [6]).
template([cual, es, la, calidad, del, s(_)], [flagCalidad], [5]).
template([que, calidad, es, el, s(_)], [flagCalidad], [4]).
template([cual, es, el, costo, de, el, s(_)], [flagCosto], [6]).
template([cual, es, el, costo, de, la, s(_)], [flagCosto], [6]).
template([cual, es, la, vida, de, s(_)], [flagVida], [5]).
template([cuanta, vida, tiene, s(_)], [flagVida], [3]).
template([cual, es, el, dano, de, s(_)], [flagDano], [5]).
template([cuanto, dano, hace, s(_)], [flagDano], [3]).

% Plantilla para tres características de una carta
template([dime, el, C1, C2, y, C3, de, s(_)], [flagCaracteristicas], [2, 3, 5, 7]).


% Plantillas de respuesta
template([que, es, la, sifilis], ['La sifilis es una enfermedad de transmision sexual causada por la bacteria Treponema pallidum. Es una enfermedad que se contagia principalmente a traves del contacto sexual y que puede afectar a hombres y mujeres de todas las edades.'], []).
template([como, se, contagia, la, sifilis], ['La sifilis se contagia principalmente a traves del contacto sexual. Sin embargo, tambien puede transmitirse de la madre al bebe durante el embarazo o el parto. La sifilis no se puede transmitir a traves de objetos, asientos de inodoros, piscinas, jacuzzis, bañeras, vajilla o cubiertos.'], []).
template([cual, es, el, tratamiento, para, la, sifilis], ['El tratamiento para la sifilis generalmente implica antibioticos, como la penicilina. La penicilina se puede administrar como una inyeccion unica o una serie de inyecciones durante 10 a 14 dias.'], []).
template([como, se, previene, la, sifilis], ['La sifilis se puede prevenir practicando sexo seguro, es decir, usando condones. Sin embargo, el uso de condones no previene completamente la infeccion, ya que la sifilis puede infectar areas que no estan cubiertas por un condon.'], []).
template([que, pasa, si, no, se, trata, la, sifilis], ['Si no se trata, la sifilis puede causar graves problemas de salud, como ceguera, paralisis, demencia, problemas de corazon y muerte.'], []).


% Plantillas de respuesta
template([yo, tengo, s(_), s(_), y, s(_)], [flagSifilis], [2, 3, 5]).
template([tengo, s(_)], [flagSin], [1]).
template([me, siento, con, s(_)], [flagSin], [3]).
template([estoy, experimentando, s(_)], [flagSin], [2]).
template(_, ['Lo siento, no entiendo tu pregunta. Por favor, intenta de nuevo.'], []).

% sintomas: flagSin
sintomas(llagas_en_la_boca, sifilis).
sintomas(llagas_en_los_genitales, sifilis).
sintomas(llagas_en_el_recto, sifilis).
sintomas(erupciones_en_el_cuerpo, sifilis).
sintomas(manchas_oscuras_en_la_piel, sifilis).
sintomas(fiebre, sifilis).
sintomas(cansancio, sifilis).
sintomas(dolor_de_garganta, sifilis).
sintomas(dolor_de_cabeza, sifilis).
sintomas(perdida_de_peso, sifilis).
sintomas(dolor_muscular, sifilis).

% Calidades de Clash Royale
calidad(arqueras, comun).
calidad(gigante, raro).
calidad(principe, epico).
calidad(princesa, legendario).
calidad(bombardero, comun).
calidad(mosquetera, raro).
calidad(minipekka, raro).
calidad(mago, raro).
calidad(globo, epico).
calidad(golem, epico).
calidad(chispitas, legendario).
calidad(mago_electrico, legendario).

% Costo de elixir de las cartas
costo(arqueras, 3).
costo(gigante, 5).
costo(principe, 5).
costo(princesa, 3).
costo(bombardero, 3).
costo(mosquetera, 4).
costo(minipekka, 4).
costo(mago, 5).
costo(globo, 5).
costo(golem, 8).
costo(chispitas, 6).
costo(mago_electrico, 4).

% Vida de las cartas
vida(arqueras, 254).
vida(gigante, 3344).
vida(principe, 1463).
vida(princesa, 216).
vida(bombardero, 167).
vida(mosquetera, 598).
vida(minipekka, 1056).
vida(mago, 598).
vida(globo, 1396).
vida(golem, 4256).
vida(chispitas, 1200).
vida(mago_electrico, 590).

% Daño de las cartas
dano(arqueras, 86).
dano(gigante, 211).
dano(principe, 325).
dano(princesa, 140).
dano(bombardero, 133).
dano(mosquetera, 160).
dano(minipekka, 598).
dano(mago, 228).
dano(globo, 798).
dano(golem, 259).
dano(chispitas, 1300).
dano(mago_electrico, 96).


elizaSin(X, R):- sintomas(X, Y), atom_concat('Si tienes ', X, R1),atom_concat(R1, ' podrias tener ' , R2), atom_concat(R2, Y, R3), atom_concat(R3, '. Por favor, consulta con un medico.', R),!.
elizaSin(_, R):- R = 'Lo siento, no tengo conocimiento al respecto. Por favor, consulta con un medico.'.

% Función para manejar tres síntomas de la sífilis
elizaSifilis(X, Y, Z, R):-
    sintomas(X, sifilis),
    sintomas(Y, sifilis),
    sintomas(Z, sifilis),
    R = 'Tienes tres sintomas de la sifilis, es muy probable que la padescas. Consulta a un medico.', !.
elizaSifilis(_, _, _, R):- R = 'No todos los síntomas que mencionaste son de la sifilis. Consulta con un medico para un diagnostico preciso.'.

% Función para generar respuesta basada en la calidad
elizaCalidad(X, R):- calidad(X, Y), atom_concat('La calidad de ', X, R1), atom_concat(R1, ' es ' , R2), atom_concat(R2, Y, R3), atom_concat(R3, '.', R),!.
elizaCalidad(_, R):- R = 'Lo siento, no tengo informacion sobre esa carta.'.

% Función para generar respuesta basada en el costo de elixir
elizaCosto(X, R):- costo(X, Y), atom_concat('El costo de ', X, R1), atom_concat(R1, ' es ' , R2), atom_concat(R2, Y, R3), atom_concat(R3, ' elixir.', R),!.
elizaCosto(_, R):- R = 'Lo siento, no tengo informacion sobre esa carta.'.

% Función para manejar las preguntas sobre la vida
elizaVida(X, R):- vida(X, Y), atom_concat('La vida de ', X, R1), atom_concat(R1, ' es ' , R2), atom_concat(R2, Y, R3), atom_concat(R3, '.', R),!.
elizaVida(_, R):- R = 'Lo siento, no tengo informacion sobre esa carta.'.

elizaDano(X, R):- dano(X, Y), atom_concat('El dano de ', X, R1), atom_concat(R1, ' es ' , R2), atom_concat(R2, Y, R3), atom_concat(R3, '.', R),!.
elizaDano(_, R):- R = 'Lo siento, no tengo informacion sobre esa carta.'.

% Definición de las características de las cartas
caracteristica(X, calidad, Y) :- calidad(X, Y).
caracteristica(X, vida, Y) :- vida(X, Y).
caracteristica(X, dano, Y) :- dano(X, Y).

% Función para manejar tres características de una carta
elizaCaracteristicas(C1, C2, C3, X, R):-
    caracteristica(X, C1, V1),
    caracteristica(X, C2, V2),
    caracteristica(X, C3, V3),
    atom_concat('La ', C1, R1), atom_concat(R1, ' de ', R2), atom_concat(R2, X, R3), atom_concat(R3, ' es ', R4), atom_concat(R4, V1, R5), atom_concat(R5, ', ', R6),
    atom_concat(R6, 'la ', R7), atom_concat(R7, C2, R8), atom_concat(R8, ' es ', R9), atom_concat(R9, V2, R10), atom_concat(R10, ', y ', R11),
    atom_concat(R11, 'la ', R12), atom_concat(R12, C3, R13), atom_concat(R13, ' es ', R14), atom_concat(R14, V3, R15), atom_concat(R15, '.', R), !.
elizaCaracteristicas(_, _, _, _, R):- R = 'No tengo toda la informacion que necesitas.'.

match([],[]).
match([], _):- true.

match([S|Stim],[I|Input]) :-
	atom(S), % si I es un s(X) devuelve falso
	S == I,
	match(Stim, Input),!.

match([S|Stim],[_|Input]) :-
% I es un s(X), lo ignoro y continúo con el resto de la lista
	\+atom(S),
	match(Stim, Input),!.

replace0([], _, _, Resp, R):- append(Resp, [], R),!.

% FlagSin
replace0([I|_], Input, _, Resp, R):-
    nth0(I, Input, Atom),
    nth0(0, Resp, X),
    (X == flagSin -> elizaSin(Atom, R); X == flagCalidad -> elizaCalidad(Atom, R); X == flagCosto -> elizaCosto(Atom, R); X == flagVida -> elizaVida(Atom, R); X == flagDano -> elizaDano(Atom, R)).

% FlagSifilis
replace0([I, J, K|_], Input, _, Resp, R):-
    nth0(I, Input, Atom1),
    nth0(J, Input, Atom2),
    nth0(K, Input, Atom3),
    nth0(0, Resp, X),
    (X == flagSifilis -> elizaSifilis(Atom1, Atom2, Atom3, R)).

% FlagCaracteristicas
replace0([I, J, K, L|_], Input, _, Resp, R):-
    nth0(I, Input, Atom1),
    nth0(J, Input, Atom2),
    nth0(K, Input, Atom3),
    nth0(L, Input, Atom4),
    nth0(0, Resp, X),
    (X == flagCaracteristicas -> elizaCaracteristicas(Atom1, Atom2, Atom3, Atom4, R)).
		 
replace0([I|Index], Input, N, Resp, R):-
	length(Index, M), M =:= 0,
	nth0(I, Input, Atom),
	select(N, Resp, Atom, R1), append(R1, [], R),!.

replace0([I|Index], Input, N, Resp, R):-
	nth0(I, Input, Atom),
	length(Index, M), M > 0,
	select(N, Resp, Atom, R1),
	N1 is N + 1,
	replace0(Index, Input, N1, R1, R),!.
