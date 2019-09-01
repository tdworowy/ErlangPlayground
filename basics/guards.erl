%% @author Tomasz
%% @doc Guards example

-module(guards).
-export([fall_velocity/2,fizzbuzz/1]).

%% @doc Compute fall velocity on difrent planets (planet name is atom) white guards that checks if Distance is greater than or equal to zero.
 -spec(fall_velocity(atom(),number()) -> number()).
fall_velocity(earth, Distance) when Distance >= 0 -> math:sqrt(2 * 9.8 * Distance);
fall_velocity(moon, Distance)  when Distance >= 0 -> math:sqrt(2 * 1.6 * Distance);
fall_velocity(mars, Distance)  when Distance >= 0 -> math:sqrt(2 * 3.71 * Distance).

%% @doc fizzBuzz white guards.
-spec(fizzbuzz(number()) -> string()).
fizzbuzz(Number) when Number rem 15 == 0 -> "fizzBuzz";
fizzbuzz(Number) when Number rem 5 == 0 -> "buzz";
fizzbuzz(Number) when Number rem 3 == 0 -> "fizz".