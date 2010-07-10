if exists("b:did_wmnotes")
  finish
endif
let b:did_wmnotes = 1

set ai formatoptions=tcroqn2 comments=n:>

function! PreviewMDK()
python << EOF
import markdown
import vim

mkd_file = vim.current.buffer.name
md = markdown.Markdown()
markdown.markdownFromFile(input=mkd_file, output="/tmp/markdown.html",  extensions=[], encoding=None)
EOF

!echo "<html><head><title>Preview</title><link rel=\"stylesheet\" href=\"/Users/wannes/.vim/bundle/wmnotes.vim.git/support/css/wm_mkd.css\" type=\"text/css\" media=\"screen\" title=\"no title\" charset=\"utf-8\"></head><body><div id='content'>" > /tmp/markdown2.html
!cat /tmp/markdown.html >> /tmp/markdown2.html
!echo "</div></body></html>" >> /tmp/markdown2.html

!open "/tmp/markdown2.html"
endfunction

map <silent> <Leader>p :call PreviewMDK()<CR>
noremap <silent> <D-r> :call PreviewMDK()<CR>

