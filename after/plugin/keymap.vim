"let mapleader = "\"
"显示/隐藏行号
noremap <F2> :set number!<CR>:set relativenumber!<CR>

"终端
noremap <C-\> :terminal ++rows=5<CR> 
tnoremap <C-\> <C-w>:q!<CR>

"绑定ESC
inoremap jj <ESC>
"Ctrl+s 保存
nnoremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>

"切换窗口
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

"调整窗口大小
nnoremap <C-Up> <C-w>+
nnoremap <C-Down> <C-w>-
nnoremap <C-Left> <C-w>>
nnoremap <C-Right> <C-w><

"单词环绕符号
vnoremap <Leader>" s""<Esc>hp
vnoremap <Leader>' s''<Esc>hp
vnoremap <Leader>( s()<Esc>hp
vnoremap <Leader>{ s{}<Esc>hp
vnoremap <Leader>[ s[]<Esc>hp
vnoremap <Leader>< s<><Esc>hp

" 快速注释/取消注释
vnoremap <Leader>/ :s/^/\/\/ /g<CR>
vnoremap <Leader>? :s/\/\/\s*//g<CR>
