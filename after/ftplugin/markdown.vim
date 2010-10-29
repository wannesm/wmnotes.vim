" Markdown extension for Vim
" Author: Wannes Meert
" Email: wannesm@gmail.com

if exists("b:did_wmnotes")
  finish
endif
let b:did_wmnotes = 1

set ai formatoptions=tcroqn2 comments=n:>

" Location of support folder
let g:WMMarkdown_support = expand("<sfile>:h:h:h") . '/support/css'

" Preview
function! PreviewMarkdown()
python << EOF
import markdown
import vim

mkd_file = vim.current.buffer.name
md = markdown.Markdown()
markdown.markdownFromFile(input=mkd_file, output="/tmp/markdown.html",  extensions=[], encoding=None)
EOF

let s:header = '"<html><head><title>Preview</title><link rel=\"stylesheet\" href=\"'.g:WMMarkdown_support.'/wm_mkd.css\" type=\"text/css\" title=\"no title\" charset=\"utf-8\"><meta http-equiv=\"content-type\" content=\"text/html; charset=utf-8\" /><script type=\"text/javascript\" src=\"/usr/local/mathjax/MathJax.js\"></script></head><body><div id=\"content\">"'

let s:cmd = '!echo '.s:header.'  > /tmp/markdown2.html'
echomsg s:cmd
exec s:cmd
!cat /tmp/markdown.html >> /tmp/markdown2.html
!echo "</div></body></html>" >> /tmp/markdown2.html

!open "/tmp/markdown2.html"
endfunction

" Key mappings
nmap <buffer> <LocalLeader>ll :silent call PreviewMarkdown()<CR>
nmap <buffer> <LocalLeader>lv :silent call PreviewMarkdown()<CR>

