%% @author Tomasz
%% @doc hourglass sum
%% input: [[3, 7, -3, 0, 1, 8],[1, -4, -7, -8, -6, 5],[-8, 1, 3, 3, 5, 7],[-2, 4, 3, 1, 2, 7],[2, 4, -5, 1, 8, 4],[5, -7, 6,5, 2, 8]]
%% output: 33

-module(hourglass).
-export([hourglass_sum/1]).


%% @doc sum hourglass.
-spec(hourglass_sum(list()) -> number()).
hourglass_sum(Arr) ->
    Horugs = get_all_hourgs(Arr,1,1,4,2,[]),
    F = fun (Horug) ->
        lists:sum(tuple_to_list(Horug)) 
    end,
    Sums = lists:map(F,Horugs),
    max(Sums).

get_all_hourgs(Arr,Li,I,J,Z,Horugs) when Li+2 =< length(Arr) ->
    Sub_list1 = lists:nth(Li,Arr),
    Sub_list2 = lists:nth(Li+1,Arr),
    Sub_list3 = lists:nth(Li+2,Arr),
    Sub_list1_lth = length(Sub_list1),
    if J =< Sub_list1_lth ->
        X1 = slice(Sub_list1,I,J),
        X2 = lists:nth(Z,Sub_list2),
        X3 = slice(Sub_list3,I,J),
        if Horugs  /=[] ->
            New_Horugs = lists:append(Horugs, [list_to_tuple(lists:concat([X1,X2,X3]))]);
        true ->
             New_Horugs = [list_to_tuple(lists:concat([X1,X2,X3]))]
        end,
        if z < Sub_list1_lth ->
            New_Z = Z + 1;
        true ->
            New_Z = Z
        end,
        get_all_hourgs(Arr,Li+1,I+1,J+1,New_Z,New_Horugs);
    true ->
        get_all_hourgs(Arr,Li+1,I+1,J+1,Z,Horugs)
    end;
       

get_all_hourgs(Arr,Li,I,J,Z,Horugs) when Li+2 > length(Arr) ->
    Horugs.

slice([H|_],_,High,_,High)->
[H];
slice([H|T],Low,HighCount,Low,High)->
[H|slice(T,Low,HighCount+1,Low,High)];
slice([_|T],X,Low,Low,High)->
slice(T,X+1,Low,Low,High).
slice(_,X,X)->
[];
slice(L,Low,High)->
slice(L,1,Low,Low,High).

max([Max|T]) -> max(Max, T).

