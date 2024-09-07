"打开/关闭目录树
noremap <Leader>e :NERDTreeToggle<CR>

augroup NERDTREE
	autocmd!

	" Start NERDTree and put the cursor back in the other window.
	" autocmd VimEnter * NERDTree | wincmd p

	" Start NERDTree when Vim starts with a directory argument.
	autocmd StdinReadPre * let s:std_in=1
	autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') | execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

	" Close the tab if NERDTree is the only window remaining in it.
	autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif

	" Open the existing NERDTree on each new tab.
	"autocmd BufWinEnter * if &buftype != 'quickfix' && getcmdwintype() == '' && tabpagenr('$') > 1 | call feedkeys(":NERDTreeMirror\<CR>:wincmd p\<CR>") | endif
	autocmd BufWinEnter * if &buftype != 'quickfix' && getcmdwintype() == '' && tabpagenr('$') > 1 | silent NERDTreeMirror | endif

	" Auto commands to handle OS commandline arguments
	autocmd StdinReadPre * let s:std_in=1
	autocmd VimEnter * if argc()==1 && !exists('s:std_in') | if <SID>OpenFileOrExplorer(argv()[0]) | wincmd p | enew | wincmd p | endif | endif
augroup END

" Function to open the file or NERDTree or netrw.
"   Returns: 1 if either file explorer was opened; otherwise, 0.
function! s:OpenFileOrExplorer(...)
    if a:0 == 0 || a:1 == ''
        NERDTree
    elseif filereadable(a:1)
        execute 'edit '.a:1
        return 0
    elseif a:1 =~? '^\(scp\|ftp\)://' " Add other protocols as needed.
        execute 'Vexplore '.a:1
    elseif isdirectory(a:1)
        execute 'NERDTree '.a:1
    endif
    return 1
endfunction

" Command to call the OpenFileOrExplorer function.
command! -n=? -complete=file -bar Edit :call <SID>OpenFileOrExplorer('<args>')

" Command-mode abbreviation to replace the :edit Vim command.
cnoreabbrev e Edit
