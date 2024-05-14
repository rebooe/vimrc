"======================================================================
" statusline
"======================================================================
"--- https://bruhtus.github.io/posts/vim-statusline/
"--- https://jdhao.github.io/2019/11/03/vim_custom_statusline/
set statusline=\ 

set statusline+=%{StatusLineGit()}\ 
" set statusline+=[buf:%n]\ 
set statusline+=%f\ 

set statusline+=%=

set statusline+=%l:%c\ 
set statusline+=%{StatusLineExpandtab()}\ 
set statusline+=%{&fenc}\ 
set statusline+=%{&fileformat}\ 
set statusline+=%p%%\ 
set statusline+=%{&filetype}\ 
set statusline+=%m%r%w%q\ 

function! StatusLineGit()
	if exists('*FugitiveHead')
		return '[' . fugitive#Head() . ']'
	endif
endfunction

function! StatusLineExpandtab()
	return &expandtab == "1" ? "Spaces:".&tabstop : "Tabs:".&tabstop
endfunction

"hi StatusLine ctermbg=32 ctermfg=254 guibg=#007acc guifg=#dfe9ed
"hi StatusLineNC ctermbg=240 ctermfg=240 guibg=#d0d0d0 guifg=#444444

"hi StatusLineTerm ctermbg=32 ctermfg=254 guibg=#007acc guifg=#dfe9ed
"hi StatusLineTermNC ctermbg=252 ctermfg=240 guibg=#d0d0d0 guifg=#444444

