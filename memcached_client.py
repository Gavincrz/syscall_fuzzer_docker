#!/usr/bin/env python3
import memcached_udp

try:
    client = memcached_udp.Client([('127.0.0.1', 11111)], response_timeout=3)
    client.set('key1', 'value1')
    r = client.get('key1')
    # print(r)
    if r == 'value1':
        exit(0)
    else:
        exit(-1)
except Exception as e:
    # print(e)
    exit(-1)