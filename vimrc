"-----------------------------------set---------------------------------
"显示行号
set number
"统一缩进为4
set tabstop=4
"鼠标使用模式
set mouse=r
"语法高亮
syntax on
"字符编码
set encoding=utf-8 fileencodings=utf-8,ucs-bom,cp936
"注释颜色
hi comment ctermfg=6
"在底部显示，当前键入的指令
set showcmd
"去掉讨厌的有关vi一致性模式,避免以前版本的一些bug和局限
set nocompatible
"任何情况允许使用退格键删除
set backspace=2
"中文帮助
set helplang=cn
"设置当文件被改动时自动载入
set autoread
"高亮显示匹配的括号
set showmatch
"折叠方式
set fdm=marker
"开启提示菜单
set wildmenu
"开启实时搜索
"set incsearch
"根据文件类型自动加载插件
filetype plugin on
"开启当前行高亮
"set cursorline
"取消外部粘贴内容时自动添加注释
set paste

"--------------------------------netrw-----------------------------------
"取消横幅
let g:netrw_banner = 0
"默认视图类型，树形
let g:netrw_liststyle = 3
"打开文件的方式，1用水平拆分窗口打开文件,2用垂直拆分窗口打开文件,3用新建标签页打开文件,4用前一个窗口打开文件
let g:netrw_browse_split = 4
"设置文件浏览器窗口宽度
let g:netrw_winsize = 20

"---------------------------------map-------------------------------------
"显示行号
nnoremap <F2> :set nu!<CR>
"目录树
nnoremap <Leader>1 :20Vex<CR>
nnoremap <Leader>2 <C-w>h:q<CR>
"单词环绕符号
nnoremap <Leader>" viw<Esc>bi"<Esc>ea"<Esc>
nnoremap <Leader>' viw<Esc>bi'<Esc>ea'<Esc>
nnoremap <Leader>() viw<Esc>bi(<Esc>ea)<Esc>
nnoremap <Leader>{} viw<Esc>bi{<Esc>ea}<Esc>
nnoremap <Leader>[] viw<Esc>bi[<Esc>ea]<Esc>
nnoremap <Leader><> viw<Esc>bi<<Esc>ea><Esc>
"行尾加符号
nnoremap <Leader>; $a;<Esc>
"快速注释/取消注释
nnoremap <Leader>/ :s/^/\/\/\ /g<CR>j
nnoremap <Leader>? :s/^\/\/\s*//g<CR>
nnoremap <Leader># :s/^/# /g<CR>j
"快速滚动
nnoremap J 5<c-e>
nnoremap K 5<c-y>

"绑定ESC
inoremap jk <ESC>
