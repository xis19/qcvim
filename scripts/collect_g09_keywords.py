#! /usr/bin/env python3

import copy
import logging
import re
import urllib
import sys
import typing

import bs4
import requests

logger = logging.getLogger(__name__)
FORMATTER = logging.Formatter('%(asctime)-15s [%(levelname)5s] %(message)s')

GAUSSIAN_KEYWORDS_URL_BASE = 'http://www.gaussian.com/'
GAUSSIAN_KEYWORD_LIST_URL = 'keywords'

CBS_METHODS = 'CBS Methods'
CC_METHODS = 'CCD and CCSD'
CHKBASIS_KEYWORD = 'ChkBasis'
CI_KEYWORDS = 'CID and CISD'
CIS_KEYWORDS = 'CIS'
DENSITYFIT_KEYWORDS = 'DensityFit and NoDensityFit'


def _setup_logger():
    logger.setLevel(logging.DEBUG)

    handler = logging.StreamHandler(stream=sys.stderr)
    handler.setLevel(logging.DEBUG)
    handler.setFormatter(FORMATTER)

    logger.addHandler(handler)


def _route_parser(parsed_html: bs4.BeautifulSoup) -> dict:
    return {
        '#route': ['#'] + [item.text for item in parsed_html.select('h4[class="option"] span[class="kwit"]')]
    }


def _casscf_parser(parsed_html: bs4.BeautifulSoup) -> dict:
    # CASSCF page includes 4 different keywords:
    #   CASSCF, CAS, RASSCF, RAS
    result = _gaussian_page_parser(parsed_html)
    return {
        'CASSCF': result['CASSCF'],
        'CAS': result['CASSCF']
    }


def _cbs_parser(parsed_html: bs4.BeautifulSoup) -> dict:
    # CBS includes:
    #   CBS-4M
    #   CBS-QB3
    #   CBS-APNO
    result = _gaussian_page_parser(parsed_html)
    keywords = [str(item.text) for item in parsed_html.select('li[class="ns"] span[class="kwit"]')]
    return {
        k: result[CBS_METHODS]
        for k in keywords
    }


def _synonyms_options(keywords: list, options: list) -> dict:
    return {
        keyword: options
        for keyword in keywords
    }


def _ccsd_parser(parsed_html: bs4.BeautifulSoup) -> dict:
    # CCD and CCSD
    #   CC, QCID, CCD
    #   CCSD
    #   CCSD-T
    result = _gaussian_page_parser(parsed_html)

    # Many of the keywords are for CCSD only, e.g. T
    ccd_options = copy.deepcopy(result[CC_METHODS])
    ccd_options.remove('T')
    ccd_options.remove('E4T')
    ccd_options.remove('T1Diag')

    ccsdt_options = copy.deepcopy(result[CC_METHODS])
    # T is already included in the keyword
    ccsdt_options.remove('T')

    return {
        'CCSD': result[CC_METHODS],
        'CCSD-T': ccsdt_options,
        **_synonyms_options(['CC', 'QCID', 'CCD'], ccd_options)
    }


def _chkbasis_parser(parsed_html: bs4.BeautifulSoup) -> dict:
    # ChkBasis = CheckBasis = CheckPointBasis = ReadBasis = RdBasis
    result = _gaussian_page_parser(parsed_html)
    return _synonyms_options(
        ['ChkBasis', 'CheckBasis', 'CheckPointBasis', 'ReadBasis', 'RdBass'],
        result[CHKBASIS_KEYWORD]
    )


def _ci_parser(parsed_html: bs4.BeautifulSoup) -> dict:
    # CI = CISD
    result = _gaussian_page_parser(parsed_html)
    return {
        "CID": result['CI_KEYWORDS'],
        **_synonyms_options(['CI', 'CISD'], result['CI_KEYWORDS'])
    }


def _cis_parser(parsed_html: bs4.BeautifulSoup) -> dict:
    # CIS has option 'D'
    result = _gaussian_page_parser(parsed_html)
    result['CIS'].append('D')
    return result


def _densityfit_parser(parsed_html: bs4.BeautifulSoup) -> dict:
    result = _gaussian_page_parser(parsed_html)
    options = result[DENSITYFIT_KEYWORDS]
    return {
        _synonyms_options(['DensityFit', 'DenFit'], options),
        _synonyms_options(['NoDensity', 'NoDensityFit', 'NoDenFit'], [])
    }


def _gaussian_page_parser(parsed_html : bs4.BeautifulSoup) -> dict:
    keyword_element = parsed_html.select('h1[class~="main_title"]')
    if len(keyword_element) != 1:
        raise ValueError('Unable to find a unique main_title element: {}'.format(keyword_element))

    keyword = str(keyword_element[0].text)
    options = [str(item.find(text=True)) for item in parsed_html.select('h4[class~="option"]')]
    return {
        keyword: options
    }


def _dft_methods_parser(parsed_html: bs4.BeautifulSoup) -> dict:
    pass


KEYWORD_PARSER = {
    '#': _route_parser,
    'CASSCF': _casscf_parser,
    CBS_METHODS: _cbs_parser,
    CC_METHODS: _ccsd_parser,
    CHKBASIS_KEYWORD: _chkbasis_parser,
    CI_KEYWORDS: _ci_parser,
    DENSITYFIT_KEYWORDS: _densityfit_parser,
    DFT_METHODS: _dft_parser
}


def read_keyword_webpage() -> typing.Generator[typing.Tuple[str, str], None, None]:
    url = urllib.parse.urljoin(GAUSSIAN_KEYWORDS_URL_BASE, GAUSSIAN_KEYWORD_LIST_URL)
    logger.debug('Traversing keywords: {}'.format(url))

    data = requests.get(url)
    if data.status_code != 200:
        raise RuntimeError('Unable to fetch {}'.format(url))
    parsed = bs4.BeautifulSoup(data.content, 'html.parser')

    for item in parsed.select('li[class="ns"]'):
        href = item.select('a[href]')[0]
        caption = str(href.text)
        relative_path = str(href['href'])

        logger.debug('Keyword {} -> {}'.format(caption, relative_path))
        yield (caption, relative_path)


def main() -> int:
    _setup_logger()

    keyword_option_tree = {}
    for caption, link in read_keyword_webpage():
        url = urllib.parse.urljoin(GAUSSIAN_KEYWORDS_URL_BASE, link)
        logger.debug('URL: {}'.format(url))

        data = requests.get(url)
        if data.status_code != 200:
            logger.error('Unable to fetch {}'.format(url))
            continue

        parsed_html = bs4.BeautifulSoup(data.content, 'html.parser')
        keyword_option_tree.update(
            KEYWORD_PARSER.get(caption, _gaussian_page_parser)(parsed_html)
        )

        if caption == CI_KEYWORDS: break

    import pprint
    pprint.pprint(keyword_option_tree)
    return 0

if __name__ == '__main__':
    logger.setLevel(logging.DEBUG)
    sys.exit(main())
