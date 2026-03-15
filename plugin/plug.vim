call plug#begin('~/.plugged')

" 光标快速跳转
Plug 'easymotion/vim-easymotion', { 'for': '*' }
" 浮动终端
" Plug 'voldikss/vim-floaterm', {'on': ['FloatermToggle', 'FloatermNew']}
" 平滑滚动
" Plug 'psliwka/vim-smoothie', {'on': []}
" 快速注释
Plug 'tpope/vim-commentary', { 'for': '*' }
" 多光标
" Plug 'mg979/vim-visual-multi', {'branch': 'master', 'on': []}
" 目录树
" Plug 'preservim/nerdtree', {'on': ['NERDTree', 'NERDTreeToggle', 'NERDTreeMirror']}
" git插件
" Plug 'tpope/vim-fugitive', {'on': []}
" Plug 'airblade/vim-gitgutter', {'on': []}
" 查找文件
" Plug 'ctrlpvim/ctrlp.vim', {'on': []}
" 自动括号
Plug 'LunarWatcher/auto-pairs', { 'for': '*' }
" 代码大纲
" Plug 'liuchengxu/vista.vim', {'on': 'Vista'}

call plug#end()
