%% @author Tomasz
%% @doc hourglass sum
%% input: [[3, 7, -3, 0, 1, 8],[1, -4, -7, -8, -6, 5],[-8, 1, 3, 3, 5, 7],[-2, 4, 3, 1, 2, 7],[2, 4, -5, 1, 8, 4],[5, -7, 6,5, 2, 8]]
%% output: 33
%% input [[-1, 1, -1, 0, 0, 0],[0, -1, 0, 0, 0, 0],[-1, -1, -1, 0, 0, 0],[0, -9, 2, -4, -4, 0],[-7, 0, 0, -2, 0, 0],[0, 0, -1, -2, -4, 0]]
%% output: 0

-module(hourglass).
-export([hourglass_sum/1]).


%% @doc sum hourglass.
-spec(hourglass_sum(list()) -> number()).
hourglass_sum(Arr) ->
    Horugs = get_all_hourgs(Arr,1,1,3,2,[]),
    F = fun (Horug) ->
        lists:sum(tuple_to_list(Horug))
    end,
    Sums = lists:map(F,Horugs),
    lists:max(Sums).
 
get_all_hourgs(Arr,Li,I,J,Z,Horugs) when Li+2 =< length(Arr) ->
    Sub_list1 = lists:nth(Li,Arr),
    Sub_list2 = lists:nth(Li+1,Arr),
    Sub_list3 = lists:nth(Li+2,Arr),
    Sub_list1_lth = length(Sub_list1),
    
    if I =< Sub_list1_lth-2 ->
        X1 = lists:sublist(Sub_list1,I,J),
        X2 = lists:nth(Z,Sub_list2),
        X3 = lists:sublist(Sub_list3,I,J),
    
        if Horugs /=[] ->
            New_Horugs = lists:append(Horugs, [list_to_tuple(lists:concat([X1,[X2],X3]))]);
        true ->
             New_Horugs = [list_to_tuple(lists:concat([X1,[X2],X3]))]
        end,
        if Z < Sub_list1_lth ->
            New_Z = Z + 1;
        true ->
            New_Z = Z
        end,
        get_all_hourgs(Arr,Li,I+1,J,New_Z,New_Horugs);
    true ->
        get_all_hourgs(Arr,Li+1,1,3,2,Horugs)
    end;
       

get_all_hourgs(Arr,Li,I,J,Z,Horugs) when Li+2 > length(Arr) ->
    Horugs.