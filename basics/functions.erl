-module(functions).
-export([circleField/1]).
circleField(R) -> math:pi() * math:pow(R,2). 
