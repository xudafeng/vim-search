" search.vim - search in browser
" Author:       xdf <xudafeng@126.com>
" URL:          http://github.com/xudafeng/vim-search/
" Version:      1.1
" ReleaseDate:  2014 jun 08

" check the vim supports python

if !has('python')
  echo 'Error: Required vim compile with +python'
  finish
endif

" define command
python << EOF
#coding=utf-8 
import webbrowser
import sys
import urllib
reload(sys)
sys.setdefaultencoding('utf8')

engine = 'www.baidu.com'
url = 'http://' + engine + '/s?wd='

class Search:
    def do(self, w):
    	webbrowser.open(url + urllib.quote(w))
    	self.log(w)
    def log(self, msg):
    	print 'Searched -> "' + msg + '" through ' + ' ' + engine
EOF
command! -nargs=1 Search exec('py Search().do(<f-args>)')
command! -nargs=1 Baidu exec('py Search().do(<f-args>)')
