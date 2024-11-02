## compile file:
    1. in cmd werl
    2. c("filename")

## run function(in wrl):
    fielname:functionName(<parameters>)

## generate documentation: 
     edoc:files(["functions.erl"], [{dir, "docs"}]).

## spawn process:
    Pid=spawn(<module name>,<function name>,[<list of argumnets>]). in case of empty arguments use []

## Register process:
    register(<process name (atom)>,Pid1).

## Get registered process pid:
    whereis(<process name>).

## Get list of registered proccesses:
    regs()

## Send message:
    Pid ! <Message>    

## Proccess observer: 
    observer:start().

## Spawn linked process:
    pawn_link(<module name>,<function name>,[<list of argumnets>]). in case of empty arguments use []
 
## Debugging:
    c(<module name>, [debug_info]).
    debugger:start().

## Tracing messages:
    dbg:tracer().
    dbg:p(Pid1,m).

## Tracing function calls:
    dbg:tracer().
    dbg:p(all, c).
    dbg:tpl(<module name>, <function name>, []).

## Erlang Term Storage(in-memory collection store):
    ets:...