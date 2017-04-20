%Daniel W. Wolf
%endangered animals

%sublist stuff
prefix(P,L) :- append(P,_,L).

suffix(S,L) :- append(_,S,L).

sublist(SubL,L) :- suffix(S,L),prefix(SubL,S).



%before(A,B,List) :- sublist([A,B], List) ; sublist([C,B],List), before(A,C,List).

before(A,B,List) :- sublist([A,B], List) ; sublist([A,_,B], List) ;sublist([A,_,_,B], List) ;sublist([A,_,_,_,B], List) ;sublist([A,_,_,_,_,B], List) ;sublist([A,_,_,_,_,_,B], List).

%Test = [one,two,three,four,five].

test(A,B) :-
  Test = [one,two,three,four,five,six,seven],
  before(A,B,Test).

animal(_Name,_Country,_Population,_Year).

%Either_or(A,B) :-
report(endangered(Animals)) :-

  Animals = [_Animal1,_Animal2,_Animal3,_Animal4,_Animal5,_Animal6,_Animal7],


  member(animal(_,egypt,_,_), Animals), %one of the animals lives in egypt.

  dif(animal('perens pig',_,_,_), animal(_,_,525,_)), % The perens pig doesn’t have a surviving population of 525.

  sublist([animal(_,_,525,_),animal('niber newt',_,_,_)], Animals), % The species with a population size of 525 was listed 1 year before the nibner newt.

  dif(animal(_,_,_,2009),animal(_,ukaraine,_,_)), %Neither the animal added to the list in 2009 nor the species with a population size of 350 is the animal that lives in Ukraine.

  dif(animal(_,_,350,_),animal(_,ukaraine,_,_)), %see above

  sublist([animal(_,_,245,_),animal(_,_,420,_)], Animals), %The species with a population size of 420 was listed 1 year after the animal with a population size of 245.

  sublist([animal('dobra dingo',_,_,_),_,animal('listener cat',_,_,_)], Animals), %The dobra dingo was listed 2 years before the lisner cat.

  (member(animal(_,_,315,2011), Animals) ; member(animal(_,venezuela,_,2011), Animals)), %The animal added to the list in 2011 is either the animal with a population size of 315 or the species that lives in Venezuela.

  (member(animal('elder elk',_,_,2008), Animals) ; member(animal('elder elk',indonesia,_,_), Animals)), % The eldar elk is either the animal added to the list in 2008 or the animal that lives in Indonesia.

  sublist([animal('elder elk',_,_,_), animal(_,kosovo,_,_)], Animals), %The eldar elk was listed 1 year before the species that lives in Kosovo.

  sublist([animal(_,_,525,_),_,_,_,animal(_,oman,_,_,_)], Animals), %The animal that lives in Oman was listed 4 years after the species with a population size of 525.

  sublist([animal(_,_,525,_),animal(_,indonesia,_,_)], Animals), %The species with a population size of 525 was listed 1 year before the species that lives in Indonesia.

  (member(animal(_,ukaraine,_,2010), Animals) ;member(animal(_,_,560,2010), Animals)), % Of the animal that lives in Ukraine and the animal with a population size of 560, one was recognized as endangered in 2010 and the other was recognized as endangered in 2006.

  (member(animal(_,ukaraine,_,2006), Animals) ; member(animal(_,_,560,2006), Animals)), %^

  (member(animal(_,slovakia,_,2008), Animals) ; member(animal('listener cat',_,_,2008), Animals)), % Of the animal that lives in Slovakia and the lisner cat, one was recognized as endangered in 2008 and the other has 315 surviving individuals.

  (member(animal(_,slovakia,315,_), Animals) ; member(animal('listener cat',_,315,_), Animals)), %^

  (member(animal(_,slovakia,420,_),Animals) ; member(animal(_,slovakia,525,_), Animals)), %The animal that lives in Slovakia is either the animal with a population size of 420 or the animal with a population size of 525.

  before(animal(_,kosovo,_,_),animal('byengo bat',_,_,_), Animals), %The byengo bat was listed sometime after the animal that lives in Kosovo.

  before(animal(_,_,350,_), animal(_,_,315,_), Animals), %The animal with a population size of 350 was listed sometime before the species with a population size of 315

  sublist([animal('osbele onyx',_,_,_),_,_,animal(_,_,280,_)], Animals). %The osbele onyx was listed 3 years before the animal with a population size of 280.
