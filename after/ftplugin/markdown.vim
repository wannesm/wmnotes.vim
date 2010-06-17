if exists("b:did_wmnotes")
  finish
endif
let b:did_wmnotes = 1

set ai formatoptions=tcroqn2 comments=n:>

"let g:wmn_pluginpath = expand("%:p")
"let g:wmn_csspath = !find ~/.vim/ -name wm_mkd.css
"let g:wmn_css2path = !find ~/.vim/ -name wm_mkd_bright.css

function! PreviewMDK()
python << EOF
import markdown
import vim

#css1 = vim.eval("g:wmn_csspath")
#css2 = vim.eval("g:wmn_css2path")

mkd_file = vim.current.buffer.name
md = markdown.Markdown()
markdown.markdownFromFile(input=mkd_file, output="/tmp/markdown.html",  extensions=[], encoding=None)
EOF
!open "/tmp/markdown.html"
endfunction

map <silent> <Leader>p :call PreviewMDK()<CR>

