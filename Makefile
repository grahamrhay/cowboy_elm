PROJECT = cowboy_elm
DEPS = cowboy
include erlang.mk

.PHONY: elm

elm:
	cd elm && elm-make Todo.elm --output=../priv/static/elm.js
