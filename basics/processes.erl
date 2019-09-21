%% @author Tomasz
%% @doc Processes/messaging example.

-module(processes).
-import(recursion,[fibb_tail/1]).
-export([display_message/0,display_message_recursive/0,display_fibonacci/0]).


%% @doc Display recived massage (only once).
-spec(display_message() -> atom()).
display_message() ->
    receive Message -> io:format("Recived ~p~n",[Message])
end.

%% @doc Display recived massage (stay alive).
-spec(display_message_recursive() -> atom()).
display_message_recursive() ->
    receive Message -> io:format("Recived ~p~n",[Message]),
                       display_message_recursive()
end.

%% @doc Display fibbonaci.
-spec(display_fibonacci() -> atom()).
display_fibonacci() ->
    receive Message->
                case Message of 
                    Message when is_number(Message) ->
                       io:format("fibonacci sequence for element ~p~n is ~p~n",[Message,fibb_tail(Message)]),
                       display_fibonacci();
                    Otherwise->
                       io:format("Message should be number~n"),
                       display_fibonacci()
                end
    end.
                       


