%% @author Tomasz
%% @doc count valleys.
%% A mountain is a sequence of consecutive steps above sea level, starting with a step up from sea level and ending with a step down to sea level.
%% A valley is a sequence of consecutive steps below sea level, starting with a step down from sea level and ending with a step up to sea level.
%% input = "UDDDUDUU"output = 1
%% input = "DDUUDDUDUUUD" output = 2
-module(counting_valleys).
-export([count_valleys/1]).

%% @doc count valleys in string.
-spec(count_valleys(string()) -> number()).
count_valleys(String) ->
    [Char| Tail] =  [[X] || X <- String],
    Data1 = check_char(Char,{0,false,0}),
    Data2 = check_data(Data1),
    count_valleys(Tail,Data2).

count_valleys([],Data)->
    element(3,Data);

count_valleys(List,Data)->
    [Char| Tail] = List,
    New_data1 = check_char(Char,Data),
    New_data2 = check_data(New_data1),
    count_valleys(Tail,New_data2).


check_char(Char,{Level,In,Valleys}) when Char=="U" -> {Level+1,In,Valleys};
check_char(Char,{Level,In,Valleys}) when Char=="D" -> {Level-1,In,Valleys}.

check_data({Level,In,Valleys}) when (Level <0) and (In==false) -> {Level,true,Valleys +1};
check_data({Level,In,Valleys}) when Level >=0 -> {Level,false,Valleys};
check_data({Level,In,Valleys}) -> {Level,In,Valleys}.
