#! /usr/bin/env python3

import collections
import functools
import jinja2
import json
import sys

VIM_SYNTAX_TEMPLATE = """\
" Gaussian VIM highlight file
" Language:         Gaussian
" Maintainer:       Xiaoge Su (magichp@gmail.com)
" Last Revision:    Sat Jul 22 00:05:47 PDT 2017
" Version:          0.1

if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif

let b:current_syntax = "gaussian"

" Gaussian input file is NOT case sensitive.
syntax case ignore

" Comments always starts with !, like FORTRAN
syntax match gaussianComment /^\\s*!.\+$/
highlight link gaussianComment Comment

" Operators
syntax match gaussianOperator "\\v\\="
syntax match gaussianOperator "\\v\\("
syntax match gaussianOperator "\\v\\)"
syntax match gaussianOperator "\\v#"
syntax match gaussianOperator "\\v\\%"
highlight link gaussianOperator Operator

" Link0 commands
{% for link0Command in gaussianLink0Commands -%}
syntax match gaussianLink0Command /^\\s*{{ link0Command }}/
{% endfor -%}
highlight default link gaussianLink0Command PreProc

" Link1 command
syntax match gaussianLink1 /\\v^--LINK1--$/
highlight default link gaussianLink1 PreProc

" Route command
{% set route_region_index = [1] -%} {# As in jinja2 there you cannot change variable defined outside the loop #}

{% for route, arguments in gaussianRouteCommands.items() -%}

syntax match gaussianRouteCommand "\<{{ route }}\>"
    \ containedin=gaussianRouteRegion
    \ contained

{% if arguments|length != 0 -%}

{% for argument in arguments -%}
syntax match gaussianRouteCommandArg{{ route_region_index[0] }}
    \ "{{ argument }}"
    \ containedin=gaussianRouteCommandRegion{{ route_region_index[0] }}
    \ contained
{% endfor -%}   {# for argument in arguments #}

syntax region gaussianRouteCommandRegion{{ route_region_index[0] }}
    \ matchgroup=gaussianRouteCommand
    \ start="{{ route }}=\?("
    \ end=")"
    \ transparent
    \ contains=gaussianRouteCommandArg{{ route_region_index[0] }}
    \ containedin=gaussianRouteRegion
    \ contained

highlight link gaussianRouteCommandArg{{ route_region_index[0] }} Identifier

{% if route_region_index.append(route_region_index.pop() + 1) -%} {% endif -%}

{% endif -%}    {# if arguments|length != 0 #}
{% endfor -%}   {# for route, arguments in gaussianRouteCommands.items() #}

highlight link gaussianRouteCommand Keyword

syntax region gaussianRouteRegion
    \ start=/\\v^\\s*#/rs=e+1 end=/\\v^\\s*$/re=s-1
    \ transparent
    \ contains=gaussianRouteCommand
"""


ROUTE_COMMANDS_STR = '#route'
LINK_0_COMMANDS_STR = 'Link 0 Commands'


def _sort_keyword(str1: str, str2: str) -> int:
    if str1 == str2:
        return 0
    if str1[0] == str2[0]:
        if len(str1[0]) > len(str2[0]):
            return -1
        return 1
    else:
        if str1 > str2:
            return -1
        else:
            return 1


def main() -> int:
    with open('gaussian_keywords.json', 'r') as stream:
        keywords = json.load(stream)

    link0_commands = keywords[LINK_0_COMMANDS_STR]
    del keywords[LINK_0_COMMANDS_STR]

    route_headers = keywords[ROUTE_COMMANDS_STR]
    del keywords[ROUTE_COMMANDS_STR]

    routes = sorted(keywords.keys())
    keyword_dicts = collections.OrderedDict()
    for route in routes:
        keyword_dicts[route] = keywords[route]

    print(jinja2.Template(VIM_SYNTAX_TEMPLATE).render(
        gaussianLink0Commands=link0_commands,
        gaussianRouteCommands=keyword_dicts
    ))
    return 0

if __name__ == '__main__':
    sys.exit(main())
