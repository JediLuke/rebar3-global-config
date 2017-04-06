# rebar3 global config

This is my global rebar3 config, which has global variables and templates included.

## Installtion

	$ cd ~/.config
	$ mkdir rebar3
	$ cd rebar3
	$ git clone this_repo

## Usage

This command creats a new gen_server, using my custom template, in the current directory

	$ rebar3 new gensrv module_name=the_modname