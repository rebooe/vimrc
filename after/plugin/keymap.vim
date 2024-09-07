"let mapleader="\<Space>"

"绑定ESC
inoremap jk <ESC>
"保存
nnoremap <Leader>w :w<CR>
inoremap <Leader>w <ESC>:w<CR>
"退出
nnoremap <Leader>q :q<CR>
"切换标签
nnoremap <C-k> <C-w>w
nnoremap <C-j> <C-w>W
nnoremap <C-l> gt
nnoremap <C-h> gT
"光标跳转
nnoremap <A-j> 5j
nnoremap <A-k> 5k
nnoremap <A-h> ^
nnoremap <A-l> $

"缩进选中块
vnoremap << <gv
vnoremap >> >gv

"Quickfix 模式下的按键映射
augroup QuickfixMappings
  autocmd!
  autocmd FileType qf nnoremap <buffer> q :q<CR>
  autocmd FileType qf nnoremap <buffer> <C-n> :cnext <Bar> copen <CR>
  autocmd FileType qf nnoremap <buffer> <C-p> :cprevious <Bar> copen <CR>
augroup END
