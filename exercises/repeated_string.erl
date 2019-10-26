%% @author Tomasz
%% @doc Lilah has a string s of lowercase English letters that she repeated infinitely many times.Given an integer n find and print the number of letter a's in the first n letters of Lilah's infinite string.
%%s1 = "aba"
%%n1 = 10 
%%output 7
%%s2 = "a"
%%n2 = 1000000000000
%%output 1000000000000
%%s3 = "aab"
%%n3 = 882787
%%output 588525

-module(repeated_string).
-export([repeated_string/2,count_chr/2]).

%% @doc repeated string function.
-spec(repeated_string(string(),number()) -> number()).
repeated_string(S,N) ->
      count_chr(S,$a) * trunc((N/length(S))) + count_chr(lists:sublist(S,1, N rem length(S)),$a).


%% @doc count character occurrence in string.
count_chr(String, Chr) ->
    F = fun(X, N) when X =:= Chr -> N + 1;
           (_, N)                -> N
        end,
    lists:foldl(F, 0, String).