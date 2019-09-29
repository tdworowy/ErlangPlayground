%% @doc Example from book "Introducing Erlang, 2nd Edition" by Simon St. Laurent.

-module(drop_app).
-behaviour(application).
-export([start/2, stop/1]).

start(_Type, _StartArgs) ->
  supervisor_exl:start_link().

stop(_State) ->
  ok.

%% using:
%% c(drop_app).
%% code:add_path(".").
%% application:load(drop).
%% application:loaded_applications().
%% application:start(drop).
%% gen_server:call(gen_server_exl, 60).