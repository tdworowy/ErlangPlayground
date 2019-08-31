%% @author Tomasz
%% @doc Simple erlang functions examples

-module(functions).
-export([circle_field/1,hello_World/1,add/2]).

%% @doc Compute area of circle for given radius.
-spec(circle_field(number()) -> number()). %% is optional
circle_field(R) -> math:pi() * math:pow(R,2).

%% @doc Classic helloworld. 
-spec(hello_World(string()) -> string()).
hello_World(Name) ->  io:format("Hello", Name).

%% @doc just add function.
-spec(add(number(),number()) -> number()).
add(X,Y) -> X + Y.