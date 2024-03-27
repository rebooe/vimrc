"-----------------------------------set---------------------------------
" 显示行号
set number
" 显示相对行号
set relativenumber
" 统一缩进为4
set tabstop=4
set softtabstop=4
set shiftwidth=4
" 鼠标使用模式
set mouse=r
" 语法高亮
syntax on
" 字符编码
set encoding=utf-8 fileencodings=utf-8,ucs-bom,cp936
" 在底部显示，当前键入的指令
set showcmd
" 去掉讨厌的有关vi一致性模式,避免以前版本的一些bug和局限
set nocompatible
" 任何情况允许使用退格键删除
set backspace=2
" 中文帮助
set helplang=cn
" 设置当文件被改动时自动载入
set autoread
" 高亮显示匹配的括号
set showmatch
" 设置背景颜色
set background=dark
" 用语法高亮来定义折叠
set foldmethod=syntax 
" 开启提示菜单
set wildmenu
" 根据文件类型自动加载插件
filetype plugin on
" 开启当前行高亮
"set cursorline
" 取消搜索高亮
set nohlsearch

"--------------------------------netrw-----------------------------------
" 取消横幅
let g:netrw_banner = 0
" 默认视图类型，树形
let g:netrw_liststyle = 3
" 打开文件的方式,1用水平拆分窗口打开文件,2用垂直拆分窗口打开文件,3用新建标签页打开文件,4用前一个窗口打开文件
let g:netrw_browse_split = 4
" 设置文件浏览器窗口宽度
let g:netrw_winsize = 20

"---------------------------------map-------------------------------------
" let mapleader = ";"
" 显示行号
nnoremap <F2> :set number!<CR>:set relativenumber!<CR>
" 目录树
nnoremap <F3> :20Vex<CR>
" 切换搜索高亮
nnoremap <F11> :set hlsearch!<CR>
" 切换 paste 模式
set pastetoggle=<F12>

" 绑定ESC
inoremap jj <ESC>

" 单词环绕符号
inoremap <Leader>" <Esc>viw<Esc>bi"<Esc>ea"<Esc>a
inoremap <Leader>' <Esc>viw<Esc>bi'<Esc>ea'<Esc>a
inoremap <Leader>( <Esc>viw<Esc>bi(<Esc>ea)<Esc>a
inoremap <Leader>{ <Esc>viw<Esc>bi{<Esc>ea}<Esc>a
inoremap <Leader>[ <Esc>viw<Esc>bi[<Esc>ea]<Esc>a
inoremap <Leader>< <Esc>viw<Esc>bi<<Esc>ea><Esc>a
nnoremap <Leader>" viw<Esc>bi"<Esc>ea"<Esc>
nnoremap <Leader>' viw<Esc>bi'<Esc>ea'<Esc>
nnoremap <Leader>( viw<Esc>bi(<Esc>ea)<Esc>
nnoremap <Leader>{ viw<Esc>bi{<Esc>ea}<Esc>
nnoremap <Leader>[ viw<Esc>bi[<Esc>ea]<Esc>
nnoremap <Leader>< viw<Esc>bi<<Esc>ea><Esc>
vnoremap <Leader>" s""<Esc>hp
vnoremap <Leader>' s''<Esc>hp
vnoremap <Leader>( s()<Esc>hp
vnoremap <Leader>{ s{}<Esc>hp
vnoremap <Leader>[ s[]<Esc>hp
vnoremap <Leader>< s<><Esc>hp

" 行尾加符号
nnoremap <Leader>; $a;<Esc>
inoremap <Leader>; <Esc>$a;

" 快速注释/取消注释
nnoremap <Leader>/ ^i<space><esc>j 
nnoremap <Leader>? :s/\/\/\s*//g<CR>
vnoremap <Leader>/ :s/^/\/\/ /g<CR>
vnoremap <Leader>? :s/\/\/\s*//g<CR>

" 快速滚动
nnoremap J 5j
nnoremap K 5k
