


killer(butch). % butch is a killer

married(mia,marsellus). % mia and marsellus are married

dead(zed). % zed is dead

kills(marsellus,X) :- foot_massage(X,mia). %marsellus killes any X if X gives mia a foot massage.

loves(mia,X) :- good_dancer(X). % mia loves X if X is a good dancer.

eats(jules,X) :- nutritious(X). %jules eats X if X is nutritious

eats(jules,X) :- tasty(X). %jules eats X if X is tasty
