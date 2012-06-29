from subprocess import check_call
import os, sys

def run(main):
    os.chdir(vimfiles)
    main(sys.argv[1:])

def usage(message):
    print('Usage: ' + sys.argv[0] + ' ' + message)
    sys.exit(1)

def git(*args):
    check_call(('git',) + args)

def humanish(s):
    slash = s.rfind('/')
    if slash >= 0:
        s = s[slash+1:]

    colon = s.rfind(':')
    if colon >= 0:
        s = s[colon+1:]

    if s.endswith('.git'):
        s = s[:-4]

    return s

def vim_humanish(s):
    s = humanish(s)

    if s.endswith('.vim'):
        s = s[:-4]

    if s.startswith('vim-'):
        s = s[4:]

    return s

scriptdir = os.path.dirname(os.path.realpath(__file__))
vimfiles = os.path.realpath(os.path.join(scriptdir, '..'))
