%% @author Tomasz
%% @doc count pairs of number in list.
%% list1 [10, 20, 20, 10, 10, 30, 50, 10, 20] output: 3
%% list2 [1, 1, 3, 1, 2, 1, 3, 3, 3, 3]
%% list3 [44, 55, 11, 15, 4, 72, 26, 91, 80, 14, 43, 78, 70, 75, 36, 83, 78, 91, 17, 17, 54, 65, 60,
%% 21, 58, 98, 87, 45, 75, 97, 81, 18, 51, 43, 84, 54, 66, 10, 44, 45, 23, 38, 22, 44, 65, 9, 78, 42, 100, 94, 58, 5, 11, 69, 26, 20, 
%% 19, 64, 64, 93, 60, 96, 10, 10, 39, 94, 15, 4, 3, 10, 1, 77, 48, 74, 20, 12, 83, 97, 5, 82, 43, 15, 86, 5, 35, 63, 24, 53, 27, 87, 45, 38, 34,
%% 7, 48, 24, 100, 14, 80, 54] utput: 30

-module(pair_count).
-export([count_pairs/1,print_pairs/1]).

%% @doc count pairs of number in list.
-spec(count_pairs(list()) -> number()).
count_pairs(List) ->
    New_list = sets:to_list(sets:from_list(List)),
    lists:sum([trunc(count(Value,List)/2) || Value <- New_list]).

%% @doc count element occurrence in list.
count(Element, List) -> count(Element, List, 0).
count(_, [], Count) -> Count;
count(X, [X|Rest], Count) -> count(X, Rest, Count+1);
count(X, [_|Rest], Count) -> count(X, Rest, Count).

%% @doc print the count function resoult.
-spec(print_pairs(list()) -> atom()).
print_pairs(List) ->
    New_list = sets:to_list(sets:from_list(List)),
    Print = fun (Value)->  io:format("~p~n",[trunc(count(Value,List)/2)]) end, 
    lists:foreach(Print,New_list).
    