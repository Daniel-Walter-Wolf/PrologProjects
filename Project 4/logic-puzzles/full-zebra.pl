%Daniel W. Wolf
%Full Zebra

%sublist stuff
prefix(P,L) :- append(P,_,L).

suffix(S,L) :- append(_,S,L).

sublist(SubL,L) :- suffix(S,L),prefix(SubL,S).



house(_Color,_Nationality,_Pet,_Drink,_Smoke). %represents a house


xor(A,B) :- A , not(B) ; B, not(A). %exclusive or

%something is next to another thing if it is either to the left or rigth of that thing.
next_to(X,Y,List) :- xor(sublist([X,Y],List), sublist([Y,X],List)).


answer(water_drinker(A),zebra_owner(B)) :-

  Street = [_House1,_House2,_House3,_House4,_House5], %the list we will use.

  member(house(red,english,_,_,_), Street), % The Englishman lives in the red house.

  member(house(_,spanish,dog,_,_), Street), % The Spaniard owns the dog.

  member(house(green,_,_,coffee,_), Street), %Coffee is drunk in the green house.

  member(house(_,ukraine,_,tea,_), Street), % The Ukrainian drinks tea.

  sublist([house(ivory,_,_,_,_),house(green,_,_,_,_)], Street), %The green house is immediately to the right of the ivory house.

  member(house(_,_,snail,_,oldGold), Street), %The Old Gold smoker owns snails.

  member(house(yellow,_,_,_,kools), Street), % Kools are smoked in the yellow house.

  sublist([_,_,house(_,_,_,milk,_)], Street), %Milk is drunk in the middle house.

  prefix([house(_,norwegian,_,_,_)], Street), %The Norwegian lives in the first house.

  next_to(house(_,_,_,_,chesterfields),house(_,_,fox,_,_), Street), %The man who smokes Chesterfields lives in the house next to the man with the fox.

  next_to(house(_,_,_,_,kools),house(_,_,horse,_,_), Street), %Kools are smoked in the house next to the house where the horse is kept.

  member(house(_,_,_,orangeJuice,luckyStrike), Street), %The Lucky Strike smoker drinks orange juice

  member(house(_,japanese,_,_,parliaments), Street), %The Japanese smokes Parliaments.

  next_to(house(_,norwegian,_,_,_),house(blue,_,_,_,_), Street), % The Norwegian lives next to the blue house.

  member(house(_,A,_,water,_), Street), %

  member(house(_,B,zebra,_,_), Street). %
