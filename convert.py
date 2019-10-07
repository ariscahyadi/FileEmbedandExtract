#!/usr/bin/python

import binascii

file = 'xor.txt'
with open(file,'rb') as f:
     content = f.read()
out = binascii.unhexlify(content.strip())

f = open('xor.py','wb')
f.write(out)
f.close()
