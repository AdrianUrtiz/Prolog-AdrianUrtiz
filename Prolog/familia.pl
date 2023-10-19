padre(juan).
padre(antonio).
padre(luis).
padre(eduardo).
madre(luisa).
padrede(pedro, juan).
padrede(juan, julio).
padrede(juan, jose).
madrede(luisa, maria).
madrede(luisa, juan).
abuelo(X, Y) :- (padrede(X, W); madrede(X,W)), padrede(W, Y).