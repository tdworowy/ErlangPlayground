%% @author Tomasz
%% @doc count valleys.
%% input = "UDDDUDUU"output = 1
%% input = "DDUUDDUDUUUD" output = 2
-module(counting_valleys).
-export([count_valleys/1]).

%% @doc count valeus in string.
-spec(count_valleys(string()) -> number()).
count_valleys(String) ->
    [Char| Tail] =  [[X] || X <- String],
    Data = check_char(Char,{0,false,0}),
    count_valleys(Tail,Data).

count_valleys([],Data)->
    element(3,Data);

count_valleys(List,Data)->
    [Char| Tail] = List,
    New_data = check_char(Char,Data),
    New_data2 = check_data(New_data),
    count_valleys(Tail,New_data2).


check_char(Char,{Level,In,Valleys}) when Char=="U" -> {Level+1,In,Valleys};
check_char(Char,{Level,In,Valleys}) when Char=="D" -> {Level-1,In,Valleys}.
check_data({Level,In,Valleys}) when (Level <0) and (In==false) -> {Level,true,Valleys +1};
check_data({Level,In,Valleys}) when Level >=0 -> {Level,false,Valleys};
check_data({Level,In,Valleys}) -> {Level,In,Valleys}.
