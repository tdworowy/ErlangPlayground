%% @author Tomasz
%% @doc Given a square matrix, calculate the absolute difference between the sums of its diagonals.
%% input: 1 2 3
%%        4 5 6
%%        9 8 9  
%% output: 2

-module(diagonal_difference).
-export([diff/1]).

%% @doc copmute diagonal difference.
-spec(diff(map()) -> number()).
diff(Arr) ->
    Diag1 = count(0,Arr),
    Diag2 = count(0,lists:reverse(Arr)),
    abs(Diag1 - Diag2).

count(Arr) ->
  %% TODO, some alternatve way to implement nested for loop is needed


index_of(Item, List) -> index_of(Item, List, 1).
index_of(_, [], _)  -> not_found;
index_of(Item, [Item|_], Index) -> Index;
index_of(Item, [_|Tl], Index) -> index_of(Item, Tl, Index+1).

