
/*
these things are on top of eachother.  for eaxample a is on b.
*/

on(a,b). 

on(e,f).

on(d,e).

on(c,d).

%these things are just left of the other things.  for example b is just left of f.

just_left(b,f).

just_left(f,g).




above(X,Y) :- on(X,Y). %% X is above Y if it is directly on Y

above(X,Y) :- on(Z,Y), above(X,Z). %% X is above Y if there is a Z on Y and X is above Z.



left(X,Y) :- just_left(X,Y). %% X is left of Y if it is just_left of Y


left(X,Y) :- just_left(Z,Y), left(X,Z) ; just_left(Z,Y), above(X,Z).  %% X is left of Y if a Z is just_left of Y and X is left of Z. OR if a Z is just_left of Y and X is above Z.

left(X,Y) :- above(Y,Z), left(X,Z). %% X is left of Y if Y is above some Z and X is left of that Z.


right(X,Y) :- left(Y,X).  %% X is right of Y if Y is left of X.

