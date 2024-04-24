augroup Vista
	autocmd!
	" 最后一个窗口自动退出
	autocmd BufEnter * if (winnr('$') == 1 && &filetype == 'coc-explorer') | q | endif
augroup END
