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

GAUSSIAN_KEYWORDS_URL_BASE = 'http://www.gaussian.com/'
GAUSSIAN_KEYWORD_LIST_URL = 'keywords'

CASSCF_METHOD = 'CASSCF'
CBS_METHODS = 'CBS Methods'
CC_METHODS = 'CCD and CCSD'
CHKBASIS_KEYWORD = 'ChkBasis'
CI_KEYWORDS = 'CID and CISD'
CIS_KEYWORDS = 'CIS'
DENSITYFIT_KEYWORDS = 'DensityFit and NoDensityFit'
DFT_METHODS = 'DFT Methods'
DFTB_METHODS = 'DFTB and DFTBA'
EXTERNAL_KEYWORD = 'External'
EXTRA_BASIS_KEYWORD = 'ExtraBasis & ExtraDensityBasis'
GEN_GENECP_KEYWORD = 'Gen and GenECP'
GN_METHODS_KEYWORD = 'Gn Methods'
HARTREE_FOCK_KEYWORD = 'HF'
INTEGRAL_KEYWORD = 'Integral'
IRC_KEYWORD = 'IRC'
MM_METHODS_KEYWORDS = 'MM Methods'
MP_METHODS_KEYWORDS = 'MP Methods'
OPTIMIZATION_KEYWORD = 'Optimization'
POPULATION_KEYWORD = 'Population'
SAC_CI_KEYWORD = 'SAC-CI'
SEMI_EMPIRICAL_METHODS = 'Semi-Empirical Methods'
SYMMETRY_KEYWORD = 'Symmetry'
W1_METHODS = 'W1 Methods'
WINDOW_KEYWORD = 'Window Keyword and Frozen Core Options'


def _setup_logger(debug=False):
    if debug:
        logger.setLevel(logging.DEBUG)

    handler = logging.StreamHandler(stream=sys.stderr)
    handler.setLevel(logging.DEBUG)
    handler.setFormatter(FORMATTER)

    logger.addHandler(handler)


def _gaussian_page_parser(parsed_html: bs4.BeautifulSoup) -> dict:
    keyword_element = parsed_html.select('h1[class~="main_title"]')
    if len(keyword_element) != 1:
        raise ValueError('Unable to find a unique main_title element: {}'.format(keyword_element))

    keyword = str(keyword_element[0].text)
    raw_options = [str(item.find(text=True)) for item in parsed_html.select('h4[class~="option"]')]
    options = []
    for raw_option in raw_options:
        if ',' in raw_option:
            options.extend([item.strip() for item in raw_option.split(',')])
        elif '[=' in raw_option:
            option = raw_option.rstrip('[=]')
            options.append(option)
            options.append(option + '=')
        else:
            options.append(raw_option)

    return {
        keyword: options
    }


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
        "CID": result[CI_KEYWORDS],
        **_synonyms_options(['CI', 'CISD'], result[CI_KEYWORDS])
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
        **_synonyms_options(['DensityFit', 'DenFit'], options),
        **_synonyms_options(['NoDensity', 'NoDensityFit', 'NoDenFit'], [])
    }


def _dft_methods_parser(parsed_html: bs4.BeautifulSoup) -> dict:
    def hybrid_functionals_parser(parsed_html: bs4.element.Tag) -> list:
        return [
            str(span.text)
            for span in parsed_html.select('span[class="kwit"]')
            if 'IOp' not in span.text
        ]

    def pure_functionals_parser(parsed_html: bs4.element.Tag) -> list:
        def exchange_functionals(parsed_html: bs4.element.Tag) -> list:
            ul = section.find_next_sibling('ul')
            for item in ul.select('span[class="kwit"]'):
                yield item.text

        def correlation_functionals(parsed_html: bs4.element.Tag) -> list:
            # Correlation part has two sections
            ul = section.find_next_sibling('ul')
            for item in ul.select('span[class="kwit"]'):
                yield item.text
            ul = ul.find_next_sibling('ul')
            for item in ul.select('span[class="kwit"]'):
                yield item.text

        def standalone_functionals(parsed_html: bs4.element.Tag) -> list:
            ul = section.find_next_sibling('ul')
            for item in ul.select('span[class="kwit"]'):
                yield item.text

        exchange = []
        correlation = []
        standalone = []

        mapper = {
            'Exchange Functionals': (exchange_functionals, exchange),
            'Correlation Functionals': (correlation_functionals, correlation),
            'Standalone Pure Functionals': (standalone_functionals, standalone)
        }

        sections = parsed_html.select('h3[class="ksection"]')
        for section in sections:
            func, store = mapper[str(section.text)]
            store.extend(list(func(section)))

        # exchange * correlation
        result = []
        # XXX we have to consdier those stand-alone exchange functionals, like
        # S/HFS, XA/XAlpha, B/HFB, etc.
        for exchange_item in exchange:
            for correlation_item in correlation:
                result.append(exchange_item + correlation_item)

        result.extend(standalone)

        return result

    def empirical_dispersion_parser(parsed_html: bs4.element.Tag) -> list:
        EMPIRICAL_DISPERSION = 'EmpiricalDispersion'
        result = {
            EMPIRICAL_DISPERSION: []
        }
        for item in [str(span.text) for span in parsed_html.select('span[class="kwit"]')]:
            if EMPIRICAL_DISPERSION in item:
                if '=' in item:
                    result[EMPIRICAL_DISPERSION].append(item.split('=')[-1])
            else:
                result[item] = []
        return result

    hybrid_functionals = []
    pure_functionals = []
    dispersion = {}

    for tab in parsed_html.select('p[class="tabtitle"]'):
        if 'Hybrid' in tab.text:
            hybrid_functionals = hybrid_functionals_parser(tab.parent)
        elif 'Pure' in tab.text:
            pure_functionals = pure_functionals_parser(tab.parent)
        elif 'Dispersion' in tab.text:
            dispersion = empirical_dispersion_parser(tab.parent)

    result = {
        key: []
        for key in hybrid_functionals + pure_functionals
    }
    result.update(dispersion)
    return result


def _dftb_methods_parser(parsed_html: bs4.BeautifulSoup) -> dict:
    result = _gaussian_page_parser(parsed_html)
    return _synonyms_options(['DFTB', 'DFTBA'], result[DFTB_METHODS])


def _external_parser(parsed_html: bs4.BeautifulSoup) -> dict:
    # FIXME need more knowledge on External keyword
    logger.critical('Not implemented "External" keyword parsing')
    return {
        "External": []
    }


def _extra_basis_parser(parsed_html: bs4.BeautifulSoup) -> dict:
    return {
        'ExtraBasis': [],
        'ExtraDensityBasis': []
    }


def _gen_and_genecp_parser(parsed_html: bs4.BeautifulSoup) -> dict:
    result = _gaussian_page_parser(parsed_html)
    return _synonyms_options(['Gen', 'GenECP'], result[GEN_GENECP_KEYWORD])


def _gn_methods_parser(parsed_html: bs4.BeautifulSoup) -> dict:
    result = _gaussian_page_parser(parsed_html)
    return _synonyms_options([
        'G1', 'G2', 'G3', 'G4', 'G2MP2', 'G3MP2',
        'G3B3', 'G3MP2B3', 'G4', 'G4MP2'
    ], result[GN_METHODS_KEYWORD])


def _hf_parser(parsed_html: bs4.BeautifulSoup) -> dict:
    # Hartree Fock:
    #    HF, RHF, ROHF, UHF
    result = _gaussian_page_parser(parsed_html)
    return _synonyms_options([
        'HF', 'RHF', 'ROHF', 'UHF'
    ], result[HARTREE_FOCK_KEYWORD])


def _integral_parser(parsed_html: bs4.BeautifulSoup) -> dict:
    # For integral grids:
    #   CoarseGrid, SG1Grid, FineGrid, UltraFine, SuperFineGrid
    GRIDS = [
        'CoarseGrid', 'SG1Grid', 'FineGrid', 'UltraFineGrid', 'SuperFineGrid',
        'Coarse', 'SG1', 'Fine', 'UltraFine', 'SuperFine'
    ]

    result = _gaussian_page_parser(parsed_html)
    keywords = result[INTEGRAL_KEYWORD]
    keywords.remove('Grid=')
    for grid_type in GRIDS:
        keywords.append(grid_type)
        keywords.append('Grid={}'.format(grid_type))
    return _synonyms_options(
        ['Integral', 'Int'],
        keywords
    )


def _irc_parser(parsed_html: bs4.BeautifulSoup) -> dict:
    REPORT_ITEMS = ['Read', 'Bonds', 'Angles', 'Dihedrals', 'Cartesians']
    RECORRECT_ITEMS = ['Never', 'Always', 'Test']

    result = _gaussian_page_parser(parsed_html)
    keywords = result[IRC_KEYWORD]

    keywords.remove('Report=')
    keywords.extend(['Report={}'.format(item) for item in REPORT_ITEMS])
    keywords.remove('ReCorrect=')
    keywords.extend(['ReCorrect={}'.format(item) for item in RECORRECT_ITEMS])

    return {
        'IRC': keywords
    }


def _mm_methods_parser(parsed_html: bs4.BeautifulSoup) -> dict:
    # Supported MM force fields:
    #   Amber, Dreiding, UFF
    return _synonyms_options(
        ['Amber', 'Dreiding', 'UFF'],
        _gaussian_page_parser(parsed_html)['Molecular Mechanics Methods']
    )


def _mp_methods_parser(parsed_html: bs4.BeautifulSoup) -> dict:
    # Moller-Plesset perturbation theory:
    #   MP2, MP3, MP4, MP5
    # For MP2, there can be variants of RMP2, ROMP2, UMP2.
    # The Grimme DFT double hybrid methods should be processed in DFT part.
    keywords = _gaussian_page_parser(parsed_html)[MP_METHODS_KEYWORDS]
    mp4_keywords = copy.deepcopy(keywords)
    mp4_keywords.extend(['DQ', 'SDQ'])
    return {
        **_synonyms_options([
            'MP2', 'UMP2', 'ROMP2', 'RMP2',
            'MP3', 'MP5'
        ], keywords),
        'MP4': mp4_keywords
    }


def _optimization_parser(parsed_html: bs4.BeautifulSoup) -> dict:
    return _synonyms_options([
        'Opt', 'Optimization'
    ], _gaussian_page_parser(parsed_html)[OPTIMIZATION_KEYWORD])


def _population_parser(parsed_html: bs4.BeautifulSoup) -> dict:
    return _synonyms_options([
        'Pop', 'Population'
    ], _gaussian_page_parser(parsed_html)[POPULATION_KEYWORD])


def _sac_ci_parser(parsed_html: bs4.BeautifulSoup) -> dict:
    # FIXME to be done
    return {}


def _semi_empirical_methods_parser(parsed_html: bs4.BeautifulSoup) -> dict:
    return _synonyms_options([
        'AM1', 'PM3', 'PM6', 'PM7'
    ], _gaussian_page_parser(parsed_html)[SEMI_EMPIRICAL_METHODS])


def _symmetry_parser(parsed_html: bs4.BeautifulSoup) -> dict:
    result = _gaussian_page_parser(parsed_html)
    result['Symmetry'].remove('Axis=[X|Y|Z]')
    result['Symmetry'].append('Axis=')
    return result


def _w1_methods_parser(parsed_html: bs4.BeautifulSoup) -> dict:
    return _synonyms_options([
        'W1U', 'W1BD', 'W1RO'
    ], _gaussian_page_parser(parsed_html)[W1_METHODS])


def _window_keyword_parser(parsed_html: bs4.BeautifulSoup) -> dict:
    return _synonyms_options([
        'Window'
    ], _gaussian_page_parser(parsed_html)[WINDOW_KEYWORD])


# FIXME Link0 keywords should be preprocesse:
#   1. Keyword with "=" and "L" can contain spaces, e.g. "%rwf  = " is also
#   valid.
KEYWORD_PARSER = {
    '#': _route_parser,
    CASSCF_METHOD: _casscf_parser,
    CBS_METHODS: _cbs_parser,
    CC_METHODS: _ccsd_parser,
    CHKBASIS_KEYWORD: _chkbasis_parser,
    CI_KEYWORDS: _ci_parser,
    DENSITYFIT_KEYWORDS: _densityfit_parser,
    DFT_METHODS: _dft_methods_parser,
    DFTB_METHODS: _dftb_methods_parser,
    EXTRA_BASIS_KEYWORD: _extra_basis_parser,
    GEN_GENECP_KEYWORD: _gen_and_genecp_parser,
    GN_METHODS_KEYWORD: _gn_methods_parser,
    HARTREE_FOCK_KEYWORD: _hf_parser,
    INTEGRAL_KEYWORD: _integral_parser,
    IRC_KEYWORD: _irc_parser,
    MM_METHODS_KEYWORDS: _mm_methods_parser,
    MP_METHODS_KEYWORDS: _mp_methods_parser,
    OPTIMIZATION_KEYWORD: _optimization_parser,
    POPULATION_KEYWORD: _population_parser,
    SAC_CI_KEYWORD: _sac_ci_parser,
    SEMI_EMPIRICAL_METHODS: _semi_empirical_methods_parser,
    SYMMETRY_KEYWORD: _symmetry_parser,
    W1_METHODS: _w1_methods_parser,
    WINDOW_KEYWORD: _window_keyword_parser
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


def _parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser()

    parser.add_argument('--caption', default=None)
    parser.add_argument('--debug', default=False, action='store_true')

    return parser.parse_args()


def main() -> int:
    args = _parse_args()

    _setup_logger(args.debug)

    keyword_option_tree = {}
    for caption, link in read_keyword_webpage():
        if args.caption and args.caption != caption:
            logger.debug('Not interested caption: {}'.format(caption))
            continue
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

        # Gaussian website is NOT happy for crawlers.
        time.sleep(5)

    with open('gaussian_keywords.json', 'w') as stream:
        stream.write(json.dumps(keyword_option_tree, indent=2))

    return 0

if __name__ == '__main__':
    sys.exit(main())
