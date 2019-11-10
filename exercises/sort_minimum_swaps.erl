%% @author Tomasz
%% @doc sort_minimum_swaps
%% input is unordered array consisting of consecutive integers  [1, 2, 3, ..., n] without any duplicates.
%% input: [2, 31, 1, 38, 29, 5, 44, 6, 12, 18, 39, 9, 48, 49, 13, 11, 7, 27, 14, 33, 50, 21, 46, 23, 15, 26, 8, 47, 40, 3, 32, 22, 34, 42, 16, 41, 24, 10, 4, 28, 36, 30, 37, 35, 20, 17, 45, 43, 25, 19]
%% output: 46
%% input: [1, 3, 5, 2, 4, 6, 7 ]
%% output: 3
-module(sort_minimum_swaps).
-export([minimum_swaps/1]).

%% @doc Return minimum number of swaps required to sort the array in ascending order.
-spec(minimum_swaps(list()) -> number()).
minimum_swaps(Arr) ->
    Arr_len = length(Arr),
    minimum_swaps(Arr,1,Arr_len,0).

minimum_swaps(Arr,I,Len,Swaps) when I < Len ->
    Ele1 = lists:nth(I,Arr),   
    if Ele1 == I ->
        minimum_swaps(Arr,I+1,Len,Swaps);
    true ->
         New_Arr = swap(Arr,Ele1,I),
         minimum_swaps(New_Arr,I,Len,Swaps+1)
    end; 

  
minimum_swaps(_,I,Len,Swaps)when I >= Len ->
    Swaps. 

swap(List,S1,S2) -> {List2,[F|List3]} = lists:split(S1-1,List),
   LT = List2++[lists:nth(S2,List)|List3],
   {List4,[_|List5]} = lists:split(S2-1,LT),
   List4++[F|List5].

