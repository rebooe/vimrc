"======================================================================
" statusline
"======================================================================
"--- https://bruhtus.github.io/posts/vim-statusline/
"--- https://jdhao.github.io/2019/11/03/vim_custom_statusline/

" so that autocmd didn't stack up and slow down vim
augroup StatuslineStartup
  autocmd!
  " for more info :help WinEnter and :help BufWinEnter
  autocmd WinEnter,BufWinEnter * call StatusLineActive()
  autocmd WinLeave * call StatusLineInactive()
augroup END

" 当前所在文件
function! StatusLineActive()
	setlocal statusline=\ 
	setlocal statusline+=%{StatusLineGit()}\ 
	" setlocal statusline+=[buf:%n]\ 
	setlocal statusline+=%f\ 

	setlocal statusline+=%=

	setlocal statusline+=%l:%c\ 
	setlocal statusline+=%{StatusLineExpandtab()}\ 
	setlocal statusline+=%{&fenc}\ 
	setlocal statusline+=%{&fileformat}\ 
	setlocal statusline+=%p%%\ 
	setlocal statusline+=%{&filetype}\ 
	setlocal statusline+=%m%r%w%q\ 
	setlocal statusline+=%{StatusLineFileSize(@%)}\ 
endfunction

function! StatusLineInactive()
	setlocal statusline=\ 
	setlocal statusline+=%f\ 

	setlocal statusline+=%=

	setlocal statusline+=%{&filetype}\ 
endfunction

function! StatusLineGit()
	if executable('git')
		let l:currentDir = expand('%:p:h')

		let l:isGitRepo = substitute(system('git -C ' . l:currentDir . ' rev-parse --is-inside-work-tree'), '\n', '', 'g')
		if l:isGitRepo != "true"
			return ''
		endif

		return '[' . substitute(system('git -C ' . l:currentDir . ' branch --show-current'), '\n', '', 'g') . ']'
	endif
endfunction

function! StatusLineExpandtab()
	return &expandtab == "1" ? "Spaces:".&tabstop : "Tabs:".&tabstop
endfunction

function! StatusLineFileSize(f)
    let l:size = getfsize(expand(a:f))
    if l:size == 0 || l:size == -1 || l:size == -2
        return ''
    endif
    if l:size < 1024
        return l:size.'B'
    elseif l:size < 1024*1024
        return printf('%.1f', l:size/1024.0).'K'
    elseif l:size < 1024*1024*1024
        return printf('%.1f', l:size/1024.0/1024.0).'M'
    else
        return printf('%.1f', l:size/1024.0/1024.0/1024.0).'G'
    endif
endfunction

"hi StatusLine ctermbg=32 ctermfg=254 guibg=#007acc guifg=#dfe9ed
"hi StatusLineNC ctermbg=240 ctermfg=240 guibg=#d0d0d0 guifg=#444444

"hi StatusLineTerm ctermbg=32 ctermfg=254 guibg=#007acc guifg=#dfe9ed
"hi StatusLineTermNC ctermbg=252 ctermfg=240 guibg=#d0d0d0 guifg=#444444

