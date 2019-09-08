%% @author Tomasz
%% @doc useer imput example
-module(user_input).
-export([hello/0,my_sum/0]).


%% @doc Hello function.
-spec(hello() -> atom()).
hello() ->
  Input = io:read("What your name? >> "),
  Name = element(2,Input),
  Message = string:concat("Hello ",Name),
  io:format(Message++"\n").


%% @doc Sume function.
-spec(my_sum() -> atom()).
my_sum() ->
  Number1 = get_number(),
  Number2 = get_number(),
  
  Sum = Number1 + Number2,
  io:format("Sum is "++integer_to_list(Sum)++"\n").

%% @doc get number for user.
-spec(get_number() -> number()).
get_number() ->
   Input = io:get_line("Enter number>> "),
   Value = string:strip(Input, right, $\n),
  {Number, _} = string:to_integer(Value),
  Number.
 