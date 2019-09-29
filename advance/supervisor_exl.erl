%% @doc Supervisor example from book "Introducing Erlang, 2nd Edition" by Simon St. Laurent.
-module(supervisor_exl).
-behaviour(supervisor).
-export([start_link/0]). % convenience call for startup
-export([init/1]). % supervisor calls
-define(SERVER, ?MODULE).

%% @doc convenience method for startup
start_link() ->
        supervisor:start_link({local, ?SERVER}, ?MODULE, []).

%% @doc supervisor callback
init([]) ->
    SupFlags = #{strategy => one_for_one,
                 intensity => 1,
                 period => 5},
    %% supervisor for module gen_server_exl
    Gen_server_exl = #{id => 'gen_server_exl',
             start => {'gen_server_exl', start_link, []},
             restart => permanent,
             shutdown => 5000,
             type => worker,
             modules => ['gen_server_exl']},

     {ok, {SupFlags, [Gen_server_exl]}}.

%%% Internal functions (none here)

%%  using:
%% {ok, Pid} = supervisor_exl:start_link().
%% unlink(Pid).
%% gen_server:call(gen_server_exl, 60).

