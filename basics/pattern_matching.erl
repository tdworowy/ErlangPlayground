%% @author Tomasz
%% @doc Pattern maching example

-module(pattern_matching).
-export([fall_velocity/2,rock_paper_scissors/2]).

%% @doc Compute fall velocity on difrent planets (planet name is atom).
-spec(fall_velocity(atom(),number()) -> number()).
fall_velocity(earth, Distance) -> math:sqrt(2 * 9.8 * Distance);
fall_velocity(moon, Distance) -> math:sqrt(2 * 1.6 * Distance);
fall_velocity(mars, Distance) -> math:sqrt(2 * 3.71 * Distance).

%% @doc Rock–paper–scissors.
-spec(rock_paper_scissors(atom(),atom()) -> atom()).
rock_paper_scissors(rock,paper) -> paper;
rock_paper_scissors(rock,scissors) -> rock;
rock_paper_scissors(paper,scissors) -> scissors;
rock_paper_scissors(paper,rock) -> paper;
rock_paper_scissors(scissors,rock) -> rock;
rock_paper_scissors(scissors,paper) -> scissors;
rock_paper_scissors(_,_) -> remmis.