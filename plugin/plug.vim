call plug#begin('~/.plugged')

" 中文帮助
Plug 'yianwillis/vimcdoc', {'on': []}
" 光标快速跳转
Plug 'easymotion/vim-easymotion', {'on': []}
" 浮动终端
Plug 'voldikss/vim-floaterm', {'on': ['FloatermToggle', 'FloatermNew']}
" 平滑滚动
Plug 'psliwka/vim-smoothie', {'on': []}
" 快速注释
Plug 'tpope/vim-commentary', {'on': []}
" 数据库管理工具
"Plug 'tpope/vim-dadbod', {'on': 'DBUI'}
"Plug 'kristijanhusak/vim-dadbod-ui', {'on': 'DBUI'}
" Plug 'kristijanhusak/vim-dadbod-completion', {'on': 'DBUI'}
" Plug 'pbogut/vim-dadbod-ssh', {'on': 'DBUI'}
" 多光标
Plug 'mg979/vim-visual-multi', {'branch': 'master', 'on': []}
" 目录树
Plug 'preservim/nerdtree', {'on': ['NERDTree', 'NERDTreeToggle', 'NERDTreeMirror']}
" git插件
" Plug 'tpope/vim-fugitive', {'on': []}
Plug 'airblade/vim-gitgutter', {'on': []}
" 查找文件
Plug 'ctrlpvim/ctrlp.vim', {'on': []}
" 自动括号
Plug 'LunarWatcher/auto-pairs', {'on': []}
" 代码大纲
Plug 'liuchengxu/vista.vim', {'on': 'Vista'}

call plug#end()

" 启动时加载插件
call plug#load(
\ 'vimcdoc',
\ 'vim-easymotion',
\ 'vim-smoothie',
\ 'vim-commentary',
\ 'vim-visual-multi',
\ 'vim-gitgutter',
\ 'ctrlp.vim',
\ 'auto-pairs',
\ )
