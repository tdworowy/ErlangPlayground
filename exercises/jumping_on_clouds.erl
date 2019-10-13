%% @author Tomasz
%% @doc jumping on clouds
%%input= [0, 0, 1, 0, 0, 1, 0] output= 4
%%input= [0, 0, 0, 0, 1, 0] output= 3
-module(jumping_on_clouds).
-export([jumping/1]).

%% @doc jumping.
-spec(jumping(list()) -> number()).
jumping(Clouds) ->
     Data=check({0,1,false},Clouds),
     [Head|Tail] = Clouds,
     jumping(Data,Clouds,Tail).

jumping(Data,Clouds,Tail) when Tail /=[]->
     New_Data=check(Data,Clouds),
     [Head|New_Tail] = Tail,
     jumping(New_Data,Clouds,New_Tail);

jumping(Data,Clouds,[]) ->
     element(1,Data).

check({Jumps,Index,Changed},Clouds)->
   Data = inter_check({Jumps,Index,false},Clouds,2),
   if not element(3,Data)->
       inter_check(Data,Clouds,1);
   true ->
        Data
   end.

inter_check({Jumps,Index,Chnaged},Clouds,I) ->
    if Index+I =< length(Clouds) ->
        X = lists:nth(Index + I, Clouds),
         if X == 0 -> {Jumps +1, Index + I, true};
            X == 1 -> {Jumps,Index, false}
         end;
    true ->
        {Jumps,Index,false}
    end.
