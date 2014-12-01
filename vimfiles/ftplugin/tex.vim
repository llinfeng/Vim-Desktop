" this is mostly a matter of taste. but LaTeX looks good with just a bit
" of indentation.
set sw=2
" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
set iskeyword+=:
set iskeyword+=-
set iskeyword+=_

map <buffer> <C-s> :wall!<CR>,ll
imap <buffer> <C-s> <ESC>:wall!<CR>

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

let g:Tex_Leader2 = '\'
let g:Tex_Env_sjlog="\\begin{stlog}\<CR>\\input{../../../tex/sj_files/<++>}\<CR>\\end{stlog}"
let g:Tex_Env_stlog="\\begin{stlog}\<CR>\\input{../../../tex/sj_files/<++>}\<CR>\\end{stlog}"

let g:Tex_Env_multi="\\begin{figure}[!htb]\<CR>\\centering\<CR>\\begin{subfigure}[b]{0.4\\textwidth}\<CR>\\includegraphics[width=\\textwidth]{../../../tex/<++>.eps}\<CR>\\caption{<++>}\<CR>\\end{subfigure}\<CR>~\<CR>\\begin{subfigure}[b]{0.4\\textwidth}\<CR>\\includegraphics[width=\\textwidth]{../../../tex/<++>.eps}\<CR>\\caption{<++>}\<CR>\\end{subfigure}\<CR>\\caption{<+Caption for the two pics+>}\<CR>\\label{<+label+>}\<CR>\\end{figure}"

let g:Tex_Env_regression="\\paragraph{<+Command for regression+>} $ $ \\newline\<CR>\\begin{adjustbox}{width=\\textwidth,totalheight=\\textheight,keepaspectratio}\<CR>\\input{../../../tex/<++>.tex}\<CR>\\end{adjustbox}\<CR>"
let g:Tex_Env_reg="\\paragraph{<+Command for regression+>} $ $ \\newline\<CR>\\begin{adjustbox}{width=\\textwidth,totalheight=\\textheight,keepaspectratio}\<CR>\\input{../../../tex/<++>.tex}\<CR>\\end{adjustbox}\<CR>"

let g:Tex_Env_mfile="\<CR>\\lstinputlisting[firstline=<+line-begin+>, lastline=<+line-end+>]{<++>.m}\<CR>"
let g:Tex_Env_mcode="\\begin{lstlisting}\<CR><++>\<CR>\\end{lstlisting}"



let g:Tex_Env_line="\<CR>\\noindent\\rule{\\textwidth}{1pt} % I am a line!\<CR>\<CR>"
let g:Tex_Env_frame="\\begin{frame}\<CR>\\frametitle{<+FrameTitle+>}\<CR><++>\<CR>\\end{frame}"

"vmap <buffer> <C-b> <Plug>Tex_MathBF
"vmap <buffer> <C-c> <Plug>Tex_MathCal
"vmap <buffer> <C-l> <Plug>Tex_LeftRight

nnoremap <buffer> <leader>T :set syntax=tex<CR>
nnoremap <buffer> <leader>t :Voom latex<CR>
