%% @author Tomasz
%% @doc Example of mnsesia  database management system.

-module(mnesia_exl).
-include_lib("stdlib/include/qlc.hrl"). 
-export([create_new_db/0,read_data/0,read_all_data/0]).
%% record definition (with default values).
-record(example_record, {name="Test1", description="Example record"}).

%% @doc Crate new mnsesia db and add some data.
-spec(create_new_db() -> atom()).
create_new_db() ->
    mnesia:create_schema([node()]),
    mnesia:start(),
    mnesia:create_table(example_record, [{attributes, record_info(fields, example_record)}]),
    
    Write_data = fun() ->
        mnesia:write(#example_record{name="TestName1",description="Test descritopn1"}),
        mnesia:write(#example_record{name="TestName2",description="Test descritopn2"})
    end,
    mnesia:transaction(Write_data),
    mnesia:table_info(example_record,all).

%% @doc Reruen row with key "TestName1".
-spec(read_data() -> {atom(),example_record}).
read_data() ->
     mnesia:transaction(fun() -> mnesia:read(example_record,"TestName1") end).

%% @doc Reruen all data from table (using list comprehensions).
-spec(read_all_data() -> {atom(),list()}).
read_all_data() ->
  mnesia:transaction(
    fun() ->
        qlc:e(
        qlc:q( [X || X <- mnesia:table(example_record)] )
        )
    end
).