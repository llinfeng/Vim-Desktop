"" Now, forget about the F11 and F12. Just use contextual ctrl-enter.
"map <buffer> <C-CR> :<C-U>call RunIt() <CR>
"imap <buffer> <C-CR> <Esc>:<C-U>call RunIt() <CR>
"vmap <buffer> <c-CR> :<C-U>call RunDoLines() <CR>
"imap <buffer> <c-CR> <ESC>Vgg:<C-U>call RunDoLines() <CR>

noremap  <buffer> <CR> V:<C-U>call RunDoLines() <CR>
vnoremap <buffer> <CR> :<C-U>call RunDoLines() <CR>

" Mappings for Stata Command.    
"autocmd FileType stata noremap <F8> :<C-U>call RunIt() <CR>
"autocmd FileType stata inoremap <F8> <Esc>:<C-U>call RunIt() <CR>
"autocmd FileType stata nnoremap <F9> :<C-U>call RunDoLines() <CR>
"autocmd FileType stata inoremap <F9> <Esc>:<C-U>call RunDoLines() <CR>
"autocmd FileType stata vnoremap <F9> :<C-U>call RunDoLines() <CR>
"
" <F11> is used to run a entire do file, from the beginning to the end.    
nnoremap <buffer> <F11> :<C-U>call RunIt() <ENTER>
inoremap <buffer> <F11> <Esc>:<C-U>call RunIt() <ENTER>
vnoremap <buffer> <F11> <Esc>:<C-U>call RunIt() <ENTER>

" <F12> is used to run a line command, regardless of whether the line is visually selected or not.
noremap  <buffer> <F12> V:<C-U>call RunDoLines() <CR>
inoremap <buffer> <F12> <ESC>V:<C-U>call RunDoLines() <CR>
vnoremap <buffer> <F12> :<C-U>call RunDoLines() <CR>

autocmd CmdwinEnter * nnoremap <CR> <CR>
autocmd BufReadPost quickfix nnoremap <CR> <CR>
