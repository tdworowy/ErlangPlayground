%% @author Tomasz
%% @doc Example of data structures.

-module(data_structures).
-export([print_map/0,print_record/0]).

%% record definition (with default values).
-record(example_record, {name="Test1", description="Example record"}).


%% @doc Map Example.
print_map() ->
    ExampleMap = #{key => "Value",1=>"Value"},
    io:format("Map: ~p~n",[ExampleMap]),
    io:format("Map value fpr key ~p  ~p~n",[key,maps:get(key,ExampleMap)]).

%% @doc Print records.
print_record() ->
    New_record1 = #example_record{}, %% example values
    New_record2 = #example_record{name="Test2", description="Example record2"},
    New_record3 = #example_record{name="Test3", description="Example record3"},
    
    io:format("Record1: ~p~n",[New_record1]),
    io:format("Record2: ~p~n",[New_record2]),
    io:format("Record3: ~p~n",[New_record3]),

    io:format("Record1 name: ~p~n",[New_record1#example_record.name]),
    io:format("Record1 description: ~p~n",[New_record2#example_record.description]).
