#!/usr/bin/env python
# generate a shortened pwd for bash prompt

import os
from commands import getoutput
from socket import gethostname
hostname = gethostname()
username = os.environ['USER']
pwd = os.getcwd()
homedir = os.path.expanduser('~')
pwd = pwd.replace(homedir, '~', 1)
dirs = os.path.split(pwd)

if len(pwd) > 30:
    pwd = pwd[:10] + '.../' + dirs[-1]
    # pwd = pwd[:10]+'...'+pwd[-20:] # first 10 chars+last 20 chars
print '%s@%s:%s' % (username, hostname, pwd)
