call plug#begin('~/.plugged')

" 中文帮助
Plug 'yianwillis/vimcdoc', {'on': []}
" 光标快速跳转
Plug 'easymotion/vim-easymotion', {'on': []}
" 浮动终端
Plug 'voldikss/vim-floaterm', {'on': 'FloatermToggle'}
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
" Coc 插件
Plug 'neoclide/coc.nvim', {'branch': 'release', 'on': []}
" 代码片段
Plug 'honza/vim-snippets', {'on': []}

if has("nvim")
	" 文件搜索
	" Plug 'nvim-lua/plenary.nvim', {'on': 'Telescope'}
	" Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' , 'on': 'Telescope'}
	" 语法高亮
	" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate', 'on': []}
endif

call plug#end()

" 启动时加载插件
call plug#load(
\ 'vimcdoc',
\ 'vim-easymotion',
\ 'vim-smoothie',
\ 'vim-commentary',
\ 'vim-visual-multi',
\ 'coc.nvim',
\ 'vim-snippets',
\ )
