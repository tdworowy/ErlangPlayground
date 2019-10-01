%% @author Tomasz
%% @doc count pairs of number in list.
%% list1 [10, 20, 20, 10, 10, 30, 50, 10, 20]
%% list2 [1, 1, 3, 1, 2, 1, 3, 3, 3, 3]
-module(pair_count).
-export([count_pairs/1]).

%% @doc count pairs of number in list.
-spec(count_pairs(list()) -> number()).
count_pairs(List) ->
    New_list = sets:to_list(sets:from_list(List)),
    trunc( %% round down
        lists:sum(
            [count(Value,List)/2 || Value <- New_list])).

%% @doc ccount element occurrence in list.
count(Element, List) -> count(Element, List, 0).
count(_, [], Count) -> Count;
count(X, [X|Rest], Count) -> count(X, Rest, Count+1);
count(X, [_|Rest], Count) -> count(X, Rest, Count).