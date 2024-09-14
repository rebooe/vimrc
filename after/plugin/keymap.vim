"let mapleader="\<Space>"

"绑定ESC
inoremap jk <ESC>
"保存
nnoremap <Leader>w :w<CR>
inoremap <Leader>w <ESC>:w<CR>
"切换标签
nnoremap <Tab> <C-w>w
nnoremap <S-Tab> <C-w>W
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
  autocmd FileType qf nnoremap <buffer> <C-n> :cnext<CR><C-w>w
  autocmd FileType qf nnoremap <buffer> <C-p> :cprevious<CR><C-w>w
augroup END

"全局搜索
nnoremap <Leader>gr :noautocmd execute "vimgrep " . input("Enter search command (e.g: /<pattern>/gj **/*): ") <Bar> copen<CR>
