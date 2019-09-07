%% @author Tomasz
%% @doc recursion example
-module(recursion).
-export([countdown/1,countup/1,fibb/1, fibb_tail/1]).

%% @doc Count down.
-spec(countdown(number()) -> atom()).
countdown(From) when From > 0 ->
  io:format("~w~n", [From]),
  countdown(From-1);

%% @doc End of counting.
countdown(_) ->
  io:format("End!~n").

%% @doc Countup.
-spec(countup(number()) -> atom()).
countup(Limit) ->
  countup(1, Limit).

countup(Count, Limit) when Count =< Limit ->
    io:format("~w!~n", [Count]),
    countup(Count+1, Limit);

countup(Count, Limit) ->
    io:format("Finished.~n").

%% @doc Fibonacci sequence - normal recursion.
-spec(fibb(number()) -> number()).
fibb(Element) when Element == 0 -> 0;
fibb(Element) when Element == 1 -> 1;
fibb(Element) when Element > 1 -> fibb(Element-1) + fibb(Element-2).

%% @doc Fibonacci sequence - taill recursion (Private function).
-spec(fibb_tail(number(),number(),number()) -> number()).
fibb_tail(Element, A, B) when Element > 0 -> 
case Element of
    Element when Element == 0 -> A;
    Element when Element == 1 -> B;
    Element when Element >1 -> fibb_tail(Element-1, B , A+B)
end.

%% @doc Fibonacci sequence - taill recursion (Public function).
-spec(fibb_tail(number()) -> number()).
fibb_tail(Element) -> fibb_tail(Element,0,1).