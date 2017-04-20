%% Daniel W. Wolf
%% Project 5
%%
:- dynamic(on/2).
:- dynamic(ball/1).
:- dynamic(box/1).
:- dynamic(pyramid/1).
:- dynamic(closed/1).
:- dynamic(open/1).
:- dynamic(empty/1).
:- dynamic(full/1).
:- dynamic(in/1).
:- dynamic(block/1).
:- dynamic(in/2).


%% Background knowledge
%% Things that won't change

block(a).
block(b).
block(c)
clear(table).

object(X) :- ball(X) ; box(X) ; pyramid(X) ;block(X) ; X = table.

%stackable(X) :- box(X), closed(X).
%stackable(X) :- block(X); X = table.


%% Initial State

initial_state([clear(b),on(b,table), empty(b),closed(b),on(a,table),on(c,a),clear(c)]).

%% Goal Conditions

goal([on(a,b),on(b,c)]).

%% Action Schemata

%% move(X, From, To)
preconditions(move(X, From, To),
	      [on(X, From), clear(X), clear(To),
	      object(X), dif(X, To), object(From), dif(From, To), dif(X, From), \+ ball(X),\+ ball(To),\+ box(To),\+ pyramid(To)]).
add(move(X, From, To),
    [on(X, To), clear(From)]).
del(move(X, From, To),
    [on(X, From), clear(To)]).

%% moveToBox(X, From, To) : moves an object on top of a closed box
preconditions(moveToBox(X, From, To),[on(X,From), clear(X),clear(To), object(X), dif(X,To), object(From), dif(From,To),dif(X, From), box(To) ,\+ ball(X), closed(To)]).
add(moveToBox(X, From, To),
    [on(X, To), clear(From)]).
del(moveToBox(X, From, To),
		[on(X, From), clear(To)]).
%% open(X) : open the box
preconditions(open(X) ,[box(X),closed(X),clear(X)]).
add(open(X),[open(X)]).
del(open(X),[closed(X)]).

%% close(X) : close the box
preconditions(close(X),[open(X),clear(X),box(X)]).
add(close(X),[closed(X)]).
del(close(X),[open(X)]).

%% putIn(X,from,Y) : puts an item from From into the box
preconditions(placeIn(X,From,Y), [on(X, From), box(Y), open(Y),clear(X),empty(Y),object(From),\+ box(X),object(X),dif(X,table)]).
add(placeIn(X,From,Y), [in(X,Y), clear(From), full(Y)] ).
del(placeIn(X,From,Y), [empty(Y), on(X,From), clear(X)]).

%% takeOut(X,To,Y) : removes the item from the box and puts it on to
preconditions(takeOut(X,To,Y), [box(Y), clear(To), dif(Y,To),open(Y), full(Y), in(X,Y),\+ pyramid(To),\+ ball(To), object(To)]).
add(takeOut(X,To,Y), [empty(Y),on(X,To)]).
del(takeOut(X,To,Y), [full(Y),in(X,Y),clear(To)]).
