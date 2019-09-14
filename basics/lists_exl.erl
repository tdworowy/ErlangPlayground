%% @author Tomasz
%% @doc Lists example
-module(lists_exl).
-export([sum_all/1,keystore_exl/0]).

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
    