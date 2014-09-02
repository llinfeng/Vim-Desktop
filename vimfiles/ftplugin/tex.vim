" this is mostly a matter of taste. but LaTeX looks good with just a bit
" of indentation.
set sw=2
" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
set iskeyword+=:
set iskeyword+=-

map <C-s> :wall!<CR>,ll
imap <C-s> <ESC>:wall!<CR>
imap <tab> <Plug>IMAP_JumpForward
imap <S-CR> <ESC>[sz=
imap <tab> <space><space><space><space>
imap <S-tab> <backspace><backspace><backspace><backspace>

" imap <S-CR> <ESC>[sz=<cr>


nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

let g:Tex_Leader2 = '\'
