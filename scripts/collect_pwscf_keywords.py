#! /usr/bin/env python3

import argparse
import copy
import json
import logging
import re
import urllib
import sys
import time
import typing

import bs4
import requests

logger = logging.getLogger(__name__)
FORMATTER = logging.Formatter('%(asctime)-15s [%(levelname)5s] %(message)s')

REFERENCE_URL = 'https://www.quantum-espresso.org/Doc/INPUT_PW.html'


def _setup_logger(debug=False):
    if debug:
        logger.setLevel(logging.DEBUG)

    handler = logging.StreamHandler(stream=sys.stderr)
    handler.setLevel(logging.DEBUG)
    handler.setFormatter(FORMATTER)

    logger.addHandler(handler)


def read_keyword_webpage():
    data = requests.get(REFERENCE_URL)
    if data.status_code != 200:
        raise RuntimeError('Unable to fetch {}'.format(url))
    
    parsed = bs4.BeautifulSoup(data.content, 'html.parser')
    main_table = parsed.body.table
    main_table_body = main_table.find_all('tr', recursive=False)[-1].td
    sub_tables = main_table_body.find_all('table', recursive=False)

    for sub_table in sub_tables:
        yield sub_table
        
    
def parse_namelist_arguments(table_body):
    all_parameters_tables = table_body.td.table.tbody.tr.td.find_all('table', recursive=False)
    
    for parameter_table in all_parameters_tables:
        rows = parameter_table.find_all('tr', recursive=False)
        if len(rows) == 2:
            # No default value
            name_row, description_row = rows
        elif len(rows) == 3:
            # Has default value
            name_row, _1, description_row = rows
        elif len(rows) == 4:
            # Has default/see also
            name_row, _1, _2, description_row = rows

        name = name_row.th.text.strip().lower()
        type_ = name_row.td.text.strip().upper()

        if type_ == 'CHARACTER':
            # We ignore the default value row, check for possible variables
            possible_values = []
            for v in description_row.find_all('tt'):
                possible_values.append(v.span.text.strip())
        elif type_ == 'LOGICAL':
            possible_values = ['.TRUE.', '.FALSE.']
        else:
            possible_values = None

        logger.debug(' {:20s} {:10s} {}'.format(name, type_, possible_values))

        yield name, type_, possible_values


def parse_cards(table_body):
    # We have quite few cards, so we will manually modify rather than use a script
    pass


def keyword_table_parser(keyword_table):
    table_header, table_body = keyword_table.find_all('tr', recursive=False)
    
    text_table_header = ''.join(table_header.th.find_all(text=True)).strip()
    
    if text_table_header.startswith('Namelist:'):
        keyword = text_table_header.split()[-1]
        parameters = {}
        logger.debug('Namelist: {}'.format(keyword))
        for name, type_, possible_values in parse_namelist_arguments(table_body):
            parameters[name] = {
                'type': type_,
                'possible_values': possible_values
            }
    else:
        keyword = ''
        parameters = []

    return (keyword, parameters)


def _parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser()

    parser.add_argument('--debug', default=False, action='store_true')

    return parser.parse_args()


def main() -> int:
    args = _parse_args()

    _setup_logger(args.debug)

    keyword_option_tree = {}
    for sub_table in read_keyword_webpage():
        keyword, parameters = keyword_table_parser(sub_table)
        keyword_option_tree[keyword] = parameters

    with open('pwscf_keywords.json', 'w') as stream:
        stream.write(json.dumps(keyword_option_tree, indent=2))

    return 0

if __name__ == '__main__':
    sys.exit(main())
