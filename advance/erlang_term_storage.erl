%% @author Tomasz
%% @doc Example of Erlang Term Storage.

-module(erlang_term_storage).
-export([create_table/0]).

%% record definition (with default values).
-record(example_record, {name="Test1", description="Example record"}).

%% @doc create example table.
create_table() ->
 ExampleTable=ets:new(exmTable, [named_table, {keypos, #example_record.name}]),
 ets:insert(exmTable,#example_record{}), %% Insert default data by table name
 ets:insert(ExampleTable,#example_record{name="TestName1",description="Test descritopn"}), %% Insert default data be variable
 ets:info(ExampleTable).