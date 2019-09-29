%% @author Tomasz
%% @doc case example

-module(case_exl).
-export([fall_velocity/2,fall_velocity2/2,fizzbuzz/1]).

%% @doc Compute fall velocity on difrent planets (planet name is atom).
 -spec(fall_velocity(atom(),number()) -> number()).
fall_velocity(Planemo, Distance) when Distance >= 0  ->
  case Planemo of
    earth -> math:sqrt(2 * 9.8 * Distance);
    moon ->  math:sqrt(2 * 1.6 * Distance);
    mars ->  math:sqrt(2 * 3.71 * Distance)  
  end.

%% @doc Compute fall velocity on difrent planets (planet name is atom).
 -spec(fall_velocity2(atom(),number()) -> number()).
fall_velocity2(Planemo, Distance) when Distance >= 0  ->
  Gravity = case Planemo of
    earth -> 9.8;
    moon ->  1.6;
    mars ->  3.71
  end,  
  math:sqrt(2 * Gravity * Distance).


%% @doc fizzBuzz white case.
-spec(fizzbuzz(number()) -> string()).
fizzbuzz(Number) ->
    case Number of
        Number when Number rem 15 == 0 -> "fizzBuzz";
        Number when Number rem 5 == 0 -> "buzz";
        Number when Number rem 3 == 0 -> "fizz"
    end.