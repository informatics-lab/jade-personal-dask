#! /usr/bin/python
import base64
import sys
config = sys.argv[1]
b64 = base64.b64encode(open(config).read())
open(config+'.b64','w').write(b64.replace('\n',''))
