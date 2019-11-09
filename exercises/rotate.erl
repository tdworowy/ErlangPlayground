%% @author Tomasz
%% @doc rotate list
%% input(left): d = 4, a = [1, 2, 3, 4, 5] 
%% output(left): [5, 1, 2, 3, 4]
-module(rotate).
-export([rot_left/2,rot_right/2]).

%% @doc rotate left.
-spec(rot_left(list(),number()) -> list()). 
rot_left(List, Times) ->
    rot_left(List, Times, []).

rot_left([], Times, Acc) when Times > 0 ->
    rot_left(reverse(Acc), Times, []);

rot_left(List, 0, Acc) ->
    List ++ reverse(Acc);

rot_left([H|T], Times, Acc) ->
    rot_left(T, Times-1, [H|Acc]).
 
%% @doc rotate righy.
-spec(rot_right(list(),number()) -> list()).
rot_right(List, Times) ->
     reverse(rotate:rot_left(reverse(List), Times)).

reverse(List) ->
    reverse(List, []).

reverse([], Acc) ->
    Acc;

reverse([H|T], Acc) ->
    reverse(T, [H|Acc]).