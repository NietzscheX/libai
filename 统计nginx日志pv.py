#!/usr/bin/env python
#-*- coding: utf-8 -*-
#
# pip install click
#

import os
import click


@click.command()
@click.option('--path', default='/tmp/test.log', help='The log file path.')
@click.option('--with_urls', default=0, help='If with urls detail.')
@click.option('--min_pv', default=100, help='Min pv to display.')
def run(path, with_urls, min_pv):
    rows = dict()
    f = open(path)

    for line in f:
        fields = line.split(' ')
        ip = fields[0]
        url = fields[6]
        
        if rows.has_key(ip):
            rows[ip] = {'urls': rows[ip]['urls'] + [url], 'pv': rows[ip]['pv'] + 1}
        else:
            rows[ip] = {'urls': [url], 'pv': 1}

    res = sorted(rows.iteritems(), key=lambda r:r[1]['pv'], reverse=True)

    for r in res:
        if r[1]['pv'] > min_pv:
            print '%s - pv: %s' % (r[0], r[1]['pv'])

            if with_urls == True:
                for u in r[1]['urls']:
                    print '  %s' % u
        
            print '\r\n'

    f.close()


if __name__ == '__main__':
    run()
