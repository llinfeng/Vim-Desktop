nnoremap <buffer> <leader>T :set syntax=vimwiki<CR>
nnoremap <buffer> <leader>t :Voom vimwiki<CR>

"autocmd Filetype wiki 
nnoremap <buffer> <F10> I* [ ] <ESC>
inoremap <buffer> <F10> <ESC>I* [ ] 
nnoremap <buffer> <C-D> :VimwikiToggleListItem<CR>j

nnoremap <buffer> C VC

