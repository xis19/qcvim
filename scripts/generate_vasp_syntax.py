#! /usr/bin/env python3

import jinja2
import json
import sys

VASP_INCAR_KEYWORDS = 'vasp_keywords.jl'

VIM_SYNTAX_TEMPLATE = """\
" VASP INCAR VIM highlight file
" Language:         VASP_INCAR
" Maintainer:       Xiaoge Su (magichp@gmail.com)
" Last Revision:    Wed Jul 04 01:03:17 PDT 2018
" Version:          0.1

if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif

let b:current_syntax = "vasp_incar"

" Comments
syntax match vaspIncarComment /\\v#.*$/
syntax match vaspIncarComment /\\v!.*$/
highlight link vaspIncarComment Comment

" Operator
syntax match vaspIncarOperator "\\v\\="
syntax match vaspIncarOperator "\\v\\;"
highlight link vaspIncarOperator Operator

" Values
syntax match vaspIncarBooleanValue "\\v\\.TRUE\\."
syntax match vaspIncarBooleanValue "\\v\\.FALSE\\."
highlight link vaspIncarBooleanValue Boolean

syntax match vaspIncarNumericalValue /\\v[-+]?[0-9]*\.?[0-9]+([eE][-+]?[0-9]+)?/
highlight link vaspIncarNumericalValue Float

" Keywords
{% for keyword in keywords %}
syntax match vaspIncarKeyword "\\v{{ keyword }}"
{% endfor -%}   {# for keyword in keywords #}
highlight link vaspIncarKeyword Keyword
"""


def vasp_incar_keywords():
    with open(VASP_INCAR_KEYWORDS) as stream:
        for keyword_line in stream:
            yield json.loads(keyword_line)['keyword']


def main() -> int:
    keywords = list(vasp_incar_keywords())
    print(jinja2.Template(VIM_SYNTAX_TEMPLATE).render(keywords=keywords))
    return 0

if __name__ == '__main__':
    sys.exit(main())