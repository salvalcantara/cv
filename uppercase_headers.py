"""
Convert the text in all headers to uppercase
"""

import panflute as pf

def upper_str(elem, doc):
    if isinstance(elem, pf.Str):
        pf.debug(elem.text)
        #elem.text = elem.text.upper()
        elem.text = 'salva'

def upper_header(elem, doc):
    if isinstance(elem, pf.DefinitionList):
        for td in elem.content:
            pf.debug()
            for i in td.term:
                if isinstance(i, pf.Str):
                    pf.debug(i.text)
            for d in td.definitions:
                pf.debug(d)
    if isinstance(elem, pf.Header):
        elem.content = [pf.Str('my text')]
        return elem
        #return pf.Header(*content)
        #return elem.walk(upper_str)

if __name__ == '__main__':
    pf.toJSONFilter(upper_header)
