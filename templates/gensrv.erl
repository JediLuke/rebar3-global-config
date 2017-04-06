-module({{module_name}}).
-behaviour(gen_server).
-include_lib("eunit/include/eunit.hrl").


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% @version    {{version_num}}
%%% @title      {{title}}
%%% @author     {{author_name}}
%%% @copyright  {{copyright_year}} {{author_name}}
%%%   
%%%   
%%% @doc
%%% {{docstring}}
%%%
%%% @end
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% TODO: If unnamed server, remove definition below.
-define(SERVER, ?MODULE).
-record(state, {}).


% Type definitions
-type start_link_error() :: {already_started, pid()} | term().


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% = API functions =
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-export([start_link/0, stop/1]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2,
        terminate/2, code_change/3]).


%%% 
%%% start_link
%%%
%-spec start_link() -> {ok, pid()} | ignore | {error, start_link_error()}.
% start_link(Parameters) ->
%     gen_server:start_link({local, ?SERVER}, ?MODULE, [Parameters], []).
start_link() ->
    % @doc
    % ==== Starts the server ====
    % @spec start_link() -> {ok, Pid} | ignore | {error, Error}
    % @end
    gen_server:start_link({local, ?SERVER}, ?MODULE, [], []).


%%% 
%%% stop
%%%
stop(normal) ->
    % @doc
    % Stops gen_server implementation process
    % @spec stop() -> ok.
    % @end
    gen_server:cast(?SERVER, shutdown).


%%% 
%%% init
%%%
init(Args) ->
    % @private
    % @callback gen_server
    % @doc
    % Initializes the server.
    % @spec init(Args) -> {ok, State} | {ok, State, Timeout} |
    %                     ignore | {stop, Reason}
    % @end
    {ok, Args}.


%%% 
%%% handle_call
%%%
handle_call(_Request, _From, State) ->
    % @private
    % @doc
    % Handling call messages
    %
    % @spec handle_call(Request, From, State) ->
    %                                   {reply, Reply, State} |
    %                                   {reply, Reply, State, Timeout} |
    %                                   {noreply, State} |
    %                                   {noreply, State, Timeout} |
    %                                   {stop, Reason, Reply, State} |
    %                                   {stop, Reason, State}
    % @end
    {reply, ignored, State}.


%%% 
%%% handle_cast
%%%
handle_cast(_Msg, State) ->
    % @private
    % @doc
    % Handling cast messages
    %
    % @spec handle_cast(Msg, State) -> {noreply, State} |
    %                                  {noreply, State, Timeout} |
    %                                  {stop, Reason, State}
    % @end
    {noreply, State}.


%%% 
%%% handle_info
%%%
handle_info(_Info, State) ->
    % @private
    % @doc
    % Handling all non call/cast messages
    %
    % @spec handle_info(Info, State) -> {noreply, State} |
    %                                   {noreply, State, Timeout} |
    %                                   {stop, Reason, State}
    % @end
    {noreply, State}.


%%% 
%%% terminate
%%%
terminate(_Reason, _State) ->
    % @private
    % @doc
    % This function is called by a gen_server when it is about to
    % terminate. It should be the opposite of Module:init/1 and do any
    % necessary cleaning up. When it returns, the gen_server terminates
    % with Reason. The return value is ignored.
    %
    % @spec terminate(Reason, State) -> void()
    % @end
    ok.


%%% 
%%% code_change
%%%
code_change(_OldVsn, State, _Extra) ->
    % @private
    % @doc
    % Convert process state when code is changed
    %
    % @spec code_change(OldVsn, State, Extra) -> {ok, NewState}
    % @end
    {ok, State}.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% = private functions =
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% eUnit tests
%%% http://erlang.org/doc/apps/eunit/chapter.html
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%% modules ending in _test are run automatically


{{module_name}}_simple_test() ->
    ok.
 

%%% modules ending in _test_ return a list of tests to be run


{{module_name}}_test_() ->
    % @doc  Add your asserts in the returned list to run test suite
    % @spec {{name}}_test_() -> List where List = [term()]
    % @end
    [
        % ?assert(?MODULE:double(2) =:= 4),
        ?assertMatch({ok, Pid}, ?SERVER:start_link()),
        % ?assertEqual("ba", ?MODULE:reverse("ab")),
        % ?assertError(badarith, ?MODULE:divide(X, 0)),
        % ?assertThrow({not_found, _}, ?MODULE:func(unknown_object)),
        ?assertExit(normal, ?SERVER:stop(normal))
    ].