%% @author Tomasz
%% @doc Lists example
-module(lists_exl).
-export([sum_all/1,keystore_exl/0,foreach_exl/0,comperhension_exl/0,comperhension_exl2/0,filter_exl/0,partition_exl/0,foldl_exl/0,foldr_exl/0]).

%% @doc Sum all.
-spec(sum_all(list()) -> number()).
sum_all([]) -> 0; 
sum_all(List) -> sum_all(List,0).
sum_all([], Sum) -> Sum; 
sum_all([Head|Tail], Sum) -> sum_all(Tail, Sum + Head).

%% @doc Example of lists:keystore.
-spec(keystore_exl() -> atom()).
keystore_exl() ->
    Initial=[{1,tiger}, {3,bear}, {5,lion}],
    Second=lists:keystore(7,1,Initial,{7,panther}),
    Third=lists:keystore(7,1,Second,{7,leopard}).

%% @doc Example of lists:foreach.
-spec(foreach_exl() -> atom()).
foreach_exl() -> 
    X = [1,2,3,10,23],
    Print = fun(Value) -> io:format("  ~p~n",[Value]) end,
    lists:foreach(Print,X).


%% @doc Example of lists comperhension.
-spec(comperhension_exl() -> atom()).
comperhension_exl() -> 
    X = [1,2,3,10,23],
    Square = fun(Value)->Value*Value end,
    [Square(Value) || Value <- X].

%% @doc Another example of lists comperhension.
-spec(comperhension_exl2() -> atom()).
comperhension_exl2() -> 
    X = [1,2,3,8,13,2,10,23],
    [Value || Value <- X, Value<16, Value>=0].


%% @doc Cxample of lists:filter (same resoult as comperhension_exl2).
-spec(filter_exl() -> atom()).
filter_exl() -> 
    X = [1,2,3,8,13,2,10,23],
    Four_bits = fun(Value)-> (Value<16) and (Value>=0) end,
    lists:filter(Four_bits,X).


%% @doc Cxample of lists:partition.
-spec(partition_exl() -> atom()).
partition_exl() -> 
    X = [1,2,3,8,13,2,10,23],
    Four_bits = fun(Value)-> (Value<16) and (Value>=0) end,
    lists:partition(Four_bits,X).

%% @doc Example of lists:foldl (fold from left to right).
-spec(foldl_exl() -> atom()).
foldl_exl() -> 
    X = [1,2,3,10,23],
    Prod = fun(Value,Accumulator)->Value*Accumulator end,
    lists:foldl(Prod,1,X).

%% @doc Example of lists:foldr (fold from right to left).
-spec(foldr_exl() -> atom()).
foldr_exl() -> 
    X = [1,2,3,10,23],
    Prod = fun(Value,Accumulator)->Value*Accumulator end,
    lists:foldr(Prod,1,X).