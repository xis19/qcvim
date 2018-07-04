#! /usr/bin/env python3

import scrapy
import scrapy.linkextractors


INCAR_WIKI_URL = 'https://cms.mpi.univie.ac.at/wiki/index.php/Category:INCAR'


class INCARKeywordItem(scrapy.Item):
    keyword = scrapy.Field()


class INCARWikiSpider(scrapy.spiders.CrawlSpider):

    name = 'VaspIncar'
    allowed_domains = ['cms.mpi.univie.ac.at']
    start_urls = [INCAR_WIKI_URL]
    rules = [
        scrapy.spiders.Rule(
            scrapy.linkextractors.LinkExtractor(
                allow='/wiki/index\.php\?title=Category:INCAR&pagefrom='
            ),
            follow=True
        ),
        scrapy.spiders.Rule(
            scrapy.linkextractors.LinkExtractor(
                allow='/wiki/index\.php/[A-Z_]+'
            ),
            callback='parse_keyword'
        )
    ]
        
    def parse_keyword(self, response: scrapy.http.response.html.HtmlResponse):
        self.logger.info('Found new keyword page: {}'.format(response.url))
        
        keyword = response.css('div[id=mw-content-text] p strong::text').extract_first()
        
        if keyword:
            yield INCARKeywordItem(keyword=keyword)


def main():
    print('To run collect_vasp_incar_keywords.py: ')
    print('     scrapy runspider collect_vasp_incar_keywords.py -o vasp_keywords.jl')
    return


if __name__ == '__main__':
    main()