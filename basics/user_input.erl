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
  Input1 = io:get_line("Enter first number>> "),
  Value1 = string:strip(Input1, right, $\n),
  {Number1, _} = string:to_integer(Value1),
  
  Input2 = io:get_line("Enter second number>> "),
  Value2 = string:strip(Input2, right, $\n),
  {Number2, _} = string:to_integer(Value2),
  
  Sum = Number1 + Number2,
  io:format("Sum is "++integer_to_list(Sum)++"\n").
 