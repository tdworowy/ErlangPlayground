%% @author Tomasz
%% @doc Logging example
-module(logging).
-export([log_message/2]).

%% @doc Log message to file.
-spec(log_message(string(),atom()) -> atom()).
log_message(Message, Type) ->
    %%error_logger:logfile("log.log"),    
    case Type of
        info -> error_logger:info_msg("Info: ~s~n", [Message]);
        warning -> error_logger:warning_msg("Warning: ~s~n", [Message]);
        error -> error_logger:error_msg("Error: ~s~n", [Message])
    end.
