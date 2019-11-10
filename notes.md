compile file:
1. in cmd werl
2. c("filename")

run function(in wrl):
1.fielname:functionName(<parameters>)

generate documentation: edoc:files(["functions.erl"], [{dir, "docs"}]).

spawn process:
    Pid=spawn(<module name>,<function name>,[<list of argumnets>]). in case of empty arguments use []
Register process:
    register(<process name (atom)>,Pid1).
Get registered process pid:
    whereis(<process name>).
Get list of registered proccesses:
    regs()

Send message
 Pid ! <Message>    

Proccess observer: 
    observer:start().

Spawn linked process
spawn_link(<module name>,<function name>,[<list of argumnets>]). in case of empty arguments use []

debugging:
    c(<module name>, [debug_info]).
    debugger:start().

Tracing messages:
    dbg:tracer().
    dbg:p(Pid1,m).

Tracing function calls:
    dbg:tracer().
    dbg:p(all, c).
    dbg:tpl(<module name>, <function name>, []).

______________
Erlang Term Storage(in-memory collection store)
	ets:...
______________
Builds:
	https://www.rebar3.org
	http://erlang.org/doc/man/escript.html

______________

Erlang shell commands
Command	Action
q()Quits the shell and the Erlang runtime
c(file)Compiles the specified Erlang file
b()Displays all variable bindings
f()Clears all variable bindings
f(X)Clears specified variable binding
h()Prints the history list of commands
e(N)Repeats the command on line N
v(N)The return value of line N
catch_exception(boolean)Sets how strict the shell will be in passing errors
rd(Name,Definition)Defines a record type Name with contents specified by Definition
rr(File)Defines record types based on the contents of File
rf()Clears all record definitions. Can also clear specific definitions
rl()Lists all current record definitions
pwd()Gets the present working directory
ls()Lists files at the current location
cd(Directory)Changes to the specified Directory
