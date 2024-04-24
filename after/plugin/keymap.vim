"let mapleader="\<Space>"

"显示/隐藏行号
noremap <F2> :set number!<CR>
"绑定ESC
inoremap jk <ESC>
"Ctrl+s 保存
nnoremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>

"切换标签
nnoremap <C-k> <C-w>w
nnoremap <C-j> <C-w>W
nnoremap <C-l> gt
nnoremap <C-h> gT

"单词环绕符号
vnoremap <Leader>" s""<Esc>hp
vnoremap <Leader>' s''<Esc>hp
vnoremap <Leader>( s()<Esc>hp
vnoremap <Leader>{ s{}<Esc>hp
vnoremap <Leader>[ s[]<Esc>hp
vnoremap <Leader>< s<><Esc>hp
nnoremap <Leader>" viw<Esc>bi"<Esc>ea"<Esc>
nnoremap <Leader>' viw<Esc>bi'<Esc>ea'<Esc>
nnoremap <Leader>( viw<Esc>bi(<Esc>ea)<Esc>
nnoremap <Leader>{ viw<Esc>bi{<Esc>ea}<Esc>
nnoremap <Leader>[ viw<Esc>bi[<Esc>ea]<Esc>
nnoremap <Leader>< viw<Esc>bi<<Esc>ea><Esc>

" 输入括号光标移动至中间
inoremap () ()<Left>
inoremap {} {}<Left>
inoremap [] []<Left>
inoremap "" ""<Left>
inoremap '' ''<Left>
inoremap <> <><Left>
