%% @doc Example from book "Introducing Erlang, 2nd Edition" by Simon St. Laurent.

-module(gen_server_exl).
-behaviour(gen_server).
-export([start_link/0]). % convenience call for startup
-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]). % gen_server callbacks
-define(SERVER, ?MODULE). % macro that just defines this module as server
-record(state, {count}). % simple counter state

%% @doc convenience method for startup
start_link() ->
        gen_server:start_link({local, ?SERVER}, ?MODULE, [], []).

%% @doc gen_server callbacks
init([]) ->
        {ok, #state{count=0}}.

handle_call(_Request, _From, State) ->
        Distance = _Request,
        Reply = {ok, fall_velocity(Distance)},
        NewState=#state{ count = State#state.count+1 },
        {reply, Reply, NewState}.

handle_cast(_Msg, State) ->
        io:format("So far, calculated ~w velocities.~n", [State#state.count]),
        {noreply, State}.

handle_info(_Info, State) ->
        {noreply, State}.

terminate(_Reason, _State) ->
        ok.

code_change(_OldVsn, State, _Extra) ->
        {ok, State}.

%% @doc Internal functions
fall_velocity(Distance) -> math:sqrt(2 * 9.8 * Distance).

%% using:
%% gen_server_exl:start_link().
%% gen_server:call(gen_server_exl, 20).
%% gen_server:cast(gen_server_exl, {}).