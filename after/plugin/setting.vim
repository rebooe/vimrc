if !has('nvim')
	set previewpopup=height:20,width:80 "把预览窗口配置为弹出窗口
	set completeopt=menuone,popup,noinsert,noselect "设置自动补全
endif

set number "显示行号
"set relativenumber "显示相对行号
set encoding=utf-8 "字符编码
set fileencodings=utf-8 
set mouse=ncr "鼠标使用模式

" 统一缩进为4
set tabstop=4
set softtabstop=4
set shiftwidth=4
set backspace=2 "允许自动缩进、换行符、插入开始位置上退格
set scrolloff=5 "光标上下两侧最少保留行数

set nocompatible "去掉讨厌的有关vi一致性模式,避免以前版本的一些bug和局限
set autoread "设置当文件被改动时自动载入

set termguicolors "使用终端真颜色
colorscheme evening "设置主题
set cursorline "开启当前行高亮
set showmatch "高亮显示匹配的括号
set nohlsearch "取消搜索高亮

set showcmd "在底部显示，当前键入的指令
set wildmenu "开启提示菜单
set wildoptions=pum "使用弹出菜单来显示补全匹配
set ignorecase " 忽略大小写 
set smartcase " 只包含小写字母时才忽略大小写

"filetype plugin on "根据文件类型自动加载插件
"syntax on "语法高亮
"set foldmethod=syntax "用语法高亮来自动折叠

"写入文件前不要备份
set nobackup
set nowritebackup
set noswapfile "不要交换文件

set splitbelow "始终在当前窗口下方打开新窗口
set tabpagemax=15 "允许最大标签数
