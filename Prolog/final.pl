eliza:-	writeln('Hola, soy eliza y soy un chatbot de enfermedades. Tengo conocimientos en Chikungunya, Conjuntivitis y Colon irritable. En que puedo ayudarte...'),
	readln(Input),
	eliza(Input),!.
	
	eliza(Input):- Input == ['bye'],
	writeln('Adios, espero haberte ayudado. Si necesitas algo mas, aqui estoy.'), !.
	eliza(Input):- Input == ['bye', '.'],
	writeln('Adios, espero haberte ayudado. Si necesitas algo mas, aqui estoy.'), !.
	eliza(Input):- Input == ['Adios', '.'],
	writeln('Adios, espero haberte ayudado. Si necesitas algo mas, aqui estoy.'), !.
    eliza(Input):- Input == ['adios', '.'],
	writeln('Adios, espero haberte ayudado. Si necesitas algo mas, aqui estoy.'), !.
    eliza(Input):- Input == ['Adios'],
	writeln('Adios, espero haberte ayudado. Si necesitas algo mas, aqui estoy.'), !.
    eliza(Input):- Input == ['adios'],
	writeln('Adios, espero haberte ayudado. Si necesitas algo mas, aqui estoy.'), !.

	eliza(Input) :-
	template(Stim, Resp, IndStim),
	match(Stim, Input),
	% si he llegado aquí es que he
	% hallado el template correcto:
	replace0(IndStim, Input, 0, Resp, R),
	writeln(R),
	readln(Input1),
	eliza(Input1), !.

	
template([hola, soy, s(_) , '.'], ['Hola', 0, 'en que puedo ayudarte'], [2]).
template(['Hola', soy, s(_)], ['Hola', 0, 'en que puedo ayudarte'], [2]).
template([hola, soy, s(_)], ['Hola', 0, 'en que puedo ayudarte'], [2]).
template(['Hola', 'mi', 'nombre', 'es', s(_),'.'], ['Hola', 0, 'en que puedo ayudarte'], [4]).
template(['Hola', 'mi', 'nombre', 'es', s(_)], ['Hola', 0, 'en que puedo ayudarte'], [4]).
template([hola, mi, nombre, es, s(_),'.'], ['Hola', 0, 'en que puedo ayudarte'], [4]).
template([hola, mi, nombre, es, s(_)], ['Hola', 0, 'en que puedo ayudarte'], [4]).
template(['Hola', chatbot, mi, nombre, es, s(_) , '.'], ['Hola', 0, 'en que puedo ayudarte'], [5]).
template(['Hola', chatbot, mi, nombre, es, s(_)], ['Hola', 0, 'en que puedo ayudarte'], [5]).
template([hola, chatbot, mi, nombre, es, s(_) , '.'], ['Hola', 0, 'en que puedo ayudarte'], [5]).
template([hola, chatbot, mi, nombre, es, s(_)], ['Hola', 0, 'en que puedo ayudarte'], [5]).


% sintomas
template([me, siento, con, s(_), _], [flagSin], [3]).
template([tambien, tengo, s(_), _], [flagSin], [2]).
template([siento, s(_), _], [flagSin], [1]).
template([me, siento, con, mucha, s(_), _], [flagSin], [4]).
template([tengo, s(_), _], [flagSin], [1]).
template(['Me', siento, con, s(_), _], [flagSin], [3]).
template(['Siento', s(_), _], [flagSin], [1]).
template(['Me', siento, con,mucho, s(_), _], [flagSin], [4]).
template(['Tengo', s(_), _], [flagSin], [1]).


% derivaciones
template([creo, que, tambien, tengo, s(_), _], [flagDer], [4]).
template([creo, que, tengo, s(_), tambien, _], [flagDer], [3]).
template(['Creo', que, tambien, tengo, s(_), _], [flagDer], [4]).
template(['Creo', que, tengo, s(_),tambien, _], [flagDer], [3]).


% listado de tratamiento
template([puedes, decirme, que, tratamiento, puedo, tomar, para, s(_), _], [flagTra], [7]).
template([me, puedes, proporcionar, el, medicamento, para, s(_), _], [flagTra], [6]).
template([puedes, decirme, que, me, puedo, tomar, para, s(_), _], [flagTra], [6]).



% listado de derivaciones
template([puedes, decirme, mas, derivaciones, que, hay, de, s(_), _], [flagLisDer], [7]).
template([puedes, decirme, las, derivaciones, que, hay, de, s(_), _], [flagLisDer], [7]).
template([puedes, decirme, las, derivaciones, sobre, s(_), _], [flagLisDer], [5]).

% listado de causas
template([que, causas, puedo, contraer, si, tengo, s(_), _], [flagCau], [6]).
template([que, causas, puedo, contraer, con, s(_), _], [flagCau], [5]).
template([que, causas, provoca, el, s(_), _], [flagCau], [4]).
template([que, causas, provoca, la, s(_), _], [flagCau], [4]).
template([hay, alguna, causa, que, provoque, el, s(_), _], [flagCau], [6]).
template([hay, alguna, causa, que, provoque, la, s(_), _], [flagCau], [6]).
template([cuales, son, las, causas, que, provoca, el, s(_), _], [flagCau], [7]).
template([cuales, son, las, causas, que, provoca, la, s(_), _], [flagCau], [7]).


% pregunta sobre doctor
template([si, tengo, s(_), con, que, doctor, o, especialista, debo, de, ir, _], [flagDoc], [2]).
template([si, tengo, s(_), con, que, doctor, debo, de, ir, _], [flagDoc], [2]).
template([que, doctor, ve, s(_), _], [flagDoc], [3]).


% pregunta sobre regiones y paises
template([si, viaje, por, s(_), puedo, tener, alguna, enfermedad, que, manejas, _], [flagReg], [3]).
template([si, viaje, por , s(_), que, enfermedad, puedo, tener,_], [flagReg], [3]).
template([si, estuve, en, algunos, paises, de, s(_), que, enfermedad, puedo, tener_], [flagReg], [6]).
template(['Si', viaje, a , s(_), puedo,tener, alguna, enfermedad, que, manejas, _], [flagReg], [3]).
template(['Si', viaje, a , s(_), que, enfermedad, puedo, tener,_], [flagReg], [3]).
template(['Si', estuve, en, algunos, paises, de, s(_), que, enfermedad, puedo, tener_], [flagReg], [6]).
template(['Si', viaje, a , s(_), puedo, tener, alguna, enfermedad, que, manejas, _], [flagPai], [3]).
template(['Si', viaje, a , s(_), que, enfermedad, puedo, tener,_], [flagPai], [3]).
template([si, viaje, a, s(_), puedo, tener, alguna, enfermedad, que, manejas, _], [flagPai], [3]).
template([si, viaje, a, s(_), que, enfermedad, puedo, tener,_], [flagPai], [3]).



% repetir informacion
template(_, ['Por favor', 'intenta', 'de', 'nuevo', '.'], []).




% sintomas: flagSin
elizaSin(X, R):- sintomas(X,Y), R = ['Bueno', si, tienes, X, puede, que, tengas, Y, 'Si', tienes, algun, otro, sintoma, comentamelo].
elizaSin(X, R):- \+sintomas(X,_), R = ['Lo', siento, pero, no, tengo, conocimiento, sobre, X, en, mi, base, de, conocimientos].
sintomas(fiebre_alta, chikungunya).
sintomas(dolor_intenso_en_las_articulaciones, chikungunya).
sintomas(inflamacion_en_las_articulaciones, chikungunya).
sintomas(dolor_de_cabeza, chikungunya).
sintomas(dolor_muscular, chikungunya).
sintomas(erupcion_cutanea, chikungunya).
sintomas(fatiga, chikungunya).
sintomas(nauseas, chikungunya).
sintomas(vomitos, chikungunya).
sintomas(conjuntivitis, chikungunya).
sintomas(dolor_de_tras_de_los_ojos, chikungunya).
sintomas(sensacion_de_malestar_general, chikungunya).

sintomas(enrojecimiento_de_ojos, conjuntivitis).
sintomas(picazon_en_los_ojos, conjuntivitis).
sintomas(sensacion_de_ardor_en_los_ojos, conjuntivitis).
sintomas(secrecion_ocular, conjuntivitis).
sintomas(lagrimeo_excesivo, conjuntivitis).
sintomas(sensibilidad_a_la_luz, conjuntivitis).
sintomas(vision_borrosa, conjuntivitis).
sintomas(sensacion_de_tener_un_cuerpo_extrano_en_el_ojo, conjuntivitis).

sintomas(dolor_abdominal_recurrente_o_colicos, colonIrritado).
sintomas(hinchazon_abdominal, colonIrritado).
sintomas(cambios_en_los_habitos_intestinales, colonIrritado).
sintomas(dolor_o_malestar_alrededor_del_area_abdominal, colonIrritado).
sintomas(diarrea, colonIrritado).
sintomas(estrenimiento, colonIrritado).
sintomas(mucosidad_en_las_heces, colonIrritado).
sintomas(sensacion_de_evacuacion_incompleta, colonIrritado).
sintomas(flatulencia, colonIrritado).
sintomas(nauseas_con_dolor_adbominal, colonIrritado).
sintomas(malestar_general, colonIrritado).



% derivaciones : flagDer
elizaDer(X, R):- derivaciones(X,Y), R = ['Bueno', por, lo, que, veo, tienes, Y, la, cual, es, derivacion, de, X, 'Si', tienes, algun, otro, sintoma, comentamelo].
elizaDer(X, R):- \+derivaciones(X,_), R = ['Lo', siento, pero, no, tengo, conocimiento, sobre, ninguna, derivacion, que, tenga, X, en, mi, base, de, conocimientos, puede, que, sea, un, sintoma, y, no, una, derivacion].

derivaciones(sindrome_de_Guillain_Barre, chikungunya).
derivaciones(complicaciones_neurologicas, chikungunya).
derivaciones(artritis_cronica, chikungunya).
derivaciones(manifestaciones_oculares, chikungunya).
derivaciones(complicaciones_cardiovasculares, chikungunya).
derivaciones(complicaciones_en_mujeres_embarazadas, chikungunya).
derivaciones(recurrencia_de_sintomas_en_casos_cronicos, chikungunya).

derivaciones(trastornos_de_ansiedad_o_depresion, colonIrritado).
derivaciones(sindrome_del_intestino_Irritable_postinfeccioso, colonIrritado).
derivaciones(fibromialgia, colonIrritado).
derivaciones(trastornos_funcionales_gastrointestinales, colonIrritado).

derivaciones(infeccion_del_parpado_y_tejidos_circundantes, conjuntivitis).
derivaciones(ulceras_corneales, conjuntivitis).
derivaciones(cicatrices_corneales, conjuntivitis).
derivaciones(conjuntivitis_cronica, conjuntivitis).



% listado derivaciones : flagLisDer
elizaLisDer(X, R):- derivaciones2(Y,X), R = ['Las', derivaciones, de, X, son, ':', Y, 'Si', tienes, algun, otro, sintoma, pregunta, o, duda, comentamelo].
elizaLisDer(X, R):- \+derivaciones2(_,X), R = ['Lo', siento, pero, no, tengo, conocimiento, sobre, ninguna, derivacion, que, tenga, que, ver, con, X, en, mi, base, de, conocimientos, puede, que, sea, un, sintoma, y, no, una, derivacion].

derivaciones2(sindrome_de_Guillain_Barre_complicaciones_neurologicas_artritis_cronica_manifestaciones_oculares_complicaciones_cardiovasculares_complicaciones_en_mujeres_embarazadas_y_recurrencia_de_sintomas_en_casos_cronicos, chikungunya).
derivaciones2(trastornos_de_ansiedad_o_depresion_sindrome_del_intestino_Irritable_postinfeccioso_fibromialgia_y_trastornos_funcionales_gastrointestinales, colonIrritado).
derivaciones2(infeccion_del_parpado_y_tejidos_circundantes_ulceras_corneales_cicatrices_corneales_y_conjuntivitis_cronica, conjuntivitis).


% doctores: flagDoc
elizaDoc(Y, R):- medico(X,Y), R = ['Bueno', debes, de, ir, con, un, X, ya, que, tienes, Y, 'Si', tienes, algun, otro, sintoma, comentamelo].
elizaDoc(X, R):- \+medico(X,_), R = ['Lo', siento, pero, no, tengo, conocimiento, sobre, que, doctor, ve, la, enfermedad, de, X, en, mi, base, de, conocimientos].
medico(medico_Infectologo, chikungunya).
medico(gastroenterologo, colonIrritado).
medico(oftalmologo, conjuntivitis).



% regiones flagReg
elizaReg(X, R):- region(X,Y), R = ['Bueno', por, lo, que, veo, viajaste,a, X,  en, donde, se, puede, contraer, Y,pero, recuerda, que, esto, solo, es, un, factor, y, debes, de, guiarte, por, los, sintomas, e, ir, con, un, especialista, para, confirmar, recuerda, que, soy, un, chatbot, y, solo, puedo, darte, cierta, informacion].
elizaReg(X, R):- \+region(X,_), R = ['Lo', siento, pero, si, viajaste, por, X, no, puedo, ser, de, mucha, ayuda, recuerda, que, tengo, informacion, sobre, chikungunya, colonIrritado, y, conjuntivitis, por, otro, lado, recuerda, que, soy, un, chatbot, y, no, tengo, mucho, conocimiento, si, tienes, algun, sintoma, comentamelo, espero, ayudarte, mas].
region(africa, chikungunya).
region(asia, chikungunya).
region(america, chikungunya).
region(europa, chikungunya).
region(todo_el_mundo, conjuntivitis_o_colonIrritado_o_chikungunya).

% paises flagPai
elizaPai(X, R):- pais(X,Y), R = ['Bueno', por, lo, que, veo, viajaste,a, X,  en, donde, se, puede, contraer, Y,pero, recuerda, que, esto, solo, es, un, factor, y, debes, de, guiarte, por, los, sintomas, e, ir, con, un, especialista, para, confirmar, recuerda, que, soy, un, chatbot, y, solo, puedo, darte, cierta, informacion].
elizaPai(X, R):- \+pais(X,_), R = ['Lo', siento, pero, si, viajaste, por, X, no, puedo, ser, de, mucha, ayuda, recuerda, que, tengo, informacion, sobre, chikungunya, colonIrritado, y, conjuntivitis, por, otro, lado, recuerda, que, soy, un, chatbot, y, no, tengo, mucho, conocimiento, si, tienes, algun, sintoma, comentamelo, espero, ayudarte, mas].
pais(india,chikungunya).
pais(tailandia,chikungunya).
pais(filipinas,chikungunya).
pais(indonesia,chikungunya).
pais(malasia,chikungunya).
pais(republica_Dominicana, chikungunya).
pais(haiti,chikungunya).
pais(puerto_Rico, chikungunya).
pais(colombia, chikungunya).
pais(brasil,chikungunya).


% tratamientos flagTra
elizaTra(X, R):- tratamiento(Y,X), R = ['El', tratamiento, que, se,recomienda, para, X, es, ':', Y, 'Si', tienes, otra, consulta, o, pregunta, que, puedo, contestar, dejamelo, saber].
elizaTra(X, R):- \+tratamiento(_,X), R = ['Lo', siento, pero, no, tengo, conocimiento, sobre, el, tratamiento, de, X, recuerda, que, soy, un, chatbot, con, poco, conocimiento].

tratamiento(alivio_de_los_sintomas_con_analgesicos_y_antipireticos_Descanso_y_mantenerse_hidratado_Aplicacion_de_compresas_frias_o_calientes_para_reducir_el_dolor_en_las_articulaciones_Evitar_el_uso_de_medicamentos_antiinflamatorios_no_esteroides_como_el_ibuprofeno_ya_que_pueden_aumentar_el_riesgo_de_hemorragias_Seguir_las_recomendaciones_medicas_para_el_manejo_de_los_sintomas_y_la_recuperacion, chikungunya).
tratamiento(modificacion_de_la_dieta_evitando_alimentos_desencadenantes_como_ciertos_tipos_de_carbohidratos_manejo_del_estres_y_tecnicas_de_relajacion_como_ejercicios_de_respiracion_profunda_o_yoga_uso_de_medicamentos_para_aliviar_los_sintomas_como_antiespasmodicos_o_antidiarreicos_suplementos_de_fibra_para_regular_los_movimientos_intestinales_terapia_psicologica_como_terapia_cognitivo-conductual_para_ayudar_a_manejar_los_factores_psicologicos_relacionados_con_el_sindrome_del_intestino_irritable, colonIrritado).
tratamiento(aplicacion_de_compresas_frias_sobre_los_ojos_para_aliviar_la_inflamacion_lavado_suave_de_los_ojos_con_solucion_salina_para_eliminar_las_secreciones_uso_de_lagrimas_artificiales_para_aliviar_la_sequedad_ocular_evitar_el_uso_de_lentes_de_contacto_durante_el_tratamiento_uso_de_medicamentos_antivirales_antibioticos_o_colirios_esteroides_en_casos_especificos_segun_la_causa_de_la_conjuntivitis, conjuntivitis).


% causas flagCau
elizaCau(X, R):- causa(Y,X), R = ['Algunas', de, las, causas, de, X, son, ':', Y, 'Si', tienes, otra, consulta, o, pregunta, que, puedo, contestar, dejamelo, saber].
elizaCau(X, R):- \+causa(_,X), R = ['Lo', siento, pero, no, tengo, conocimiento, sobre, las, causas, de, X, recuerda, que, soy, un, chatbot, con, poco, conocimiento].

causa(el_virus_del_Chikungunya_es_transmitido_por_mosquitos_infectados_principalmente_por_el_mosquito_Aedes_aegypti_y_Aedes_albopictus_El_virus_tambien_puede_transmitirse_de_madre_a_hijo_durante_el_parto_a_traves_de_transfusiones_de_sangre_infectada_o_por_contacto_con_sangre_contaminada_No_se_transmite_de_persona_a_persona_de_manera_directa_como_a_traves_del_contacto_casual_o_el_contacto_con_las_gotas_respiratorias, chikungunya).
causa(la_conjuntivitis_puede_ser_causada_por_virus_bacterias_alergenos_o_irritantes_como_el_humo_o_los_productos_quimicos_La_conjuntivitis_viral_se_puede_transmitir_por_contacto_directo_con_secreciones_oculares_de_una_persona_infectada_La_conjuntivitis_bacteriana_puede_ser_causada_por_diferentes_bacterias_y_tambien_se_transmite_por_contacto_directo_con_las_secreciones_oculares_infectadas_la_conjuntivitis_alergica_se_desencadena_por_alergenos_como_el_polen_el_polvo_o_los_acaros_y_no_es_contagiosa_La_conjuntivitis_irritativa_puede_ser_causada_por_el_contacto_con_sustancias_irritantes_y_no_es_contagiosa, conjuntivitis).
causa(la_causa_exacta_del_sindrome_del_intestino_irritable_no_se_conoce_pero_se_cree_que_esta_relacionado_con_alteraciones_en_la_funcion_y_la_sensibilidad_del_intestino_Factores_de_riesgo_incluyen_antecedentes_familiares_de_colon_irritable_infecciones_gastrointestinales_previas_estres_emocional_y_sensibilidad_alimentaria_El_colon_irritable_no_se_debe_a_una_enfermedad_inflamatoria_intestinal_ni_aumenta_el_riesgo_de_desarrollar_cancer_colorrectal,colonIrritado).


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


% Eliza sintomas:
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X, Y),
	X == flagSin,
	Y=Y,
	elizaSin(Atom, R).

% Eliza derivaciones:
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X, Y),
	X == flagDer,
	Y=Y,
	elizaDer(Atom, R).


% Eliza lista de derivaciones:
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X, Y),
	X == flagLisDer,
	Y=Y,
	elizaLisDer(Atom, R).


% Eliza doctores:
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, Y, X),
	Y== flagDoc,
	X=X,
	elizaDoc(Atom, R).


% Eliza regiones:
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X, Y),
	X == flagReg,
	Y=Y,
	elizaReg(Atom, R).

% Eliza paises:
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X, Y),
	X == flagPai,
	Y=Y,
	elizaPai(Atom, R).

% Eliza lista de tratamientos:
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X, Y),
	X == flagTra,
	Y=Y,
	elizaTra(Atom, R).

% Eliza causas:
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X, Y),
	X == flagCau,
	Y=Y,
	elizaCau(Atom, R).


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
