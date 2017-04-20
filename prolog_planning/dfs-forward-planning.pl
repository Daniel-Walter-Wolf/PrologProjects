%% Daniel W. Wolf
%% Project 5
%%
%% Implementation of forward planning using iterative deepening to
%% search through the state space.
%% subset, subtract, union.
:- use_module(library(lists)).


:- ['blocks'].

run :-
    initial_state(InitialStateUnsorted),
    sort(InitialStateUnsorted, InitialState),
    goal(Goals),
    limit_plan_length(Plan),
    plan(InitialState, Goals, Plan, FinalState, []),
    write('INITIAL STATE'), nl,
    write(InitialState), nl,
    write('GOAL'), nl,
    write(Goals), nl,
    write('PLAN'), nl,
    write(Plan), nl,
    write('FINAL STATE'), nl,
    write(FinalState).


%% first look for plans of length 0, then lenght 1, length 2, etc.
limit_plan_length([]).
limit_plan_length([_|Rest]) :-
    limit_plan_length(Rest).


%% plan(CurrentState, Goals, Plan, FinalState, Visited)
plan(State, Goals, [], State, _) :-
    satisfied(Goals, State).
plan(State, Goals, [Action|RestPlan], FinalState, Visited) :-
    applicable(Action, State),
    apply(Action, State, NextState),
    \+ member(NextState, Visited),
    plan(NextState, Goals, RestPlan, FinalState, [State|Visited]).


%% All Goals/Conditions are satisfied in State.
satisfied([], _).
satisfied([Goal|OtherGoals], State) :-
    %% Goal literal is either in State or true due to background knowledge
    (member(Goal, State) ;
     Goal),
    satisfied(OtherGoals, State).


%% Find an applicable Action.
applicable(Action, State) :-
    %% This predicate succeeds if Action is an action that is
    %% applicable in the given State. Normally, this will be called
    %% with a fully specified State and Action not instantiated.
    %%applicable = postive preconditons are in the state description and negatives arent

    %get the preconditions from the Action
    preconditions(Action,Pre),
    %Check wether the preconditions are satisfied
    satisfied(Pre, State).


%% Apply an Action.
apply(Action, State, NextState) :-
    %% This predicate succeeds if applying the given Action in the
    %% given State yields NextState. Normally this will be called with
    %% Action and State instantiated and NextState not instantiated.

    %get the things to add and delete
    add(Action, ToAdd),
    del(Action, ToDel),
    %remove the ones to delete
    subtract(State,ToDel,X),
    %Union the ones to add onto the new state
    union(X,ToAdd,NextState).
