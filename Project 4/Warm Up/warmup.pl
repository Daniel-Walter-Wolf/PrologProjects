
house(_Color,_Nationality,_Pet).



prefix(P,L) :- append(P,_,L).

suffix(S,L) :- append(_,S,L).

sublist(SubL,L) :- suffix(S,L),prefix(SubL,S).

zebra(N) :-

  Street = [_House1,_House2,_House3],

  member(house(red,_,_), Street),

  member(house(blue,_,_), Street),

  member(house(green,_,_), Street),

  member(house(red,english,_), Street),

  member(house(_,spanish,jaguar), Street),

  sublist([house(_,_,snail), house(_,japanese,_)], Street),

  sublist([house(_,_,snail), house(blue,_,_)], Street),

  member(house(_,N,zebra), Street).
