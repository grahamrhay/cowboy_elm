-module(cowboy_elm_app).
-behaviour(application).

-export([start/2]).
-export([stop/1]).

start(_Type, _Args) ->
    Dispatch = cowboy_router:compile([{'_', [
        {"/", cowboy_static, {priv_file, cowboy_elm, "static/index.html"}},
        {"/[...]", cowboy_static, {priv_dir, cowboy_elm, "static/"}}
    ]}]),
    {ok, _} = cowboy:start_http(my_http_listener, 100, [{port, 8000}],
        [{env, [{dispatch, Dispatch}]}]
    ),
    cowboy_elm_sup:start_link().

stop(_State) ->
    ok.
