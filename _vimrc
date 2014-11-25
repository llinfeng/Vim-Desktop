" Use spaces instead of tabs
"set expandtab
 "colorscheme papayawhip
"default
"olive
set fdm=marker
let mapleader = ","
let g:mapleader = ","
set nocompatible

" The new feature for Vim 7.4.338 ==> To wrap a long line!
set breakindent

" Vim settings {{{
" Linfeng's Directory setting {{{
set undodir=C:\Users\llinfeng\Documents\Vim-document\undodir
" Change working directory 
" set the runtime path to include Vundle and initialize
set rtp+=C:/Vim/vimfiles/bundle/Vundle.vim/
set rtp+=c:\Vim\vimfiles\bundle\vim-snipmate\snippets\
set rtp+=c:\Users\llinfeng\Dropbox\Shu\SnipMate\snippets\
let path='C:/Vim/vimfiles/bundle'
" For handling the .swp file and files that ends with ~. 
set noswapfile
set autoread 
set directory=C:\Users\llinfeng\Documents\Vim-document\VimSwapFiles
set backupdir=C:\Users\llinfeng\Documents\Vim-document\VimBackupFiles
set viewdir=C:\Users\llinfeng\Documents\Vim-document\ViewFiles
set undodir=C:\Users\llinfeng\Documents\Vim-document\undodir
autocmd BufEnter * silent! lcd %:p:h
" }}}
" Canned ·â´æ {{{

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Æô¶¯´°¿Ú×î´ó»¯, maximizing the interface upon start. 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" To maximize the Vim window in Windows. Does not grantee proper functionality in *nix environment.
if has("gui_running")
    " GUI is running or is about to start.
    " Maximize gvim window.
    au GUIEnter * simalt ~x "maximum the initial window
else
    " This is console Vim.
    if exists("+lines")
        set lines=50
    endif
    if exists("+columns")
        set columns=100
    endif
endif


" Returns true if paste mode is enabled [Used for customizing the status line.
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction


" }}}
" Set-commends: Customize my editor {{{ 
" For manipulating the search environment. 
set ignorecase 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ¹ØÓÚ±à¼­Æ÷µÄ»ù±¾Éè¶¨
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set to auto read when a file is changed from the outside
set autoread
" Enabling Spell-check and make changes to how it looks.
set spell spelllang=en_us
" To enable spell check for main body of tex file.
autocmd BufEnter * syntax spell toplevel

" to jump BRIEFLY to the matching bracket
set showmatch

" leaving one line above the screen
set scrolloff=1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ¶Á²»¶®µÄ 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ru 
"Always show current position
set ruler

set hidden
set wildmenu
" Ignore compiled files (including those from tex files). 
set wildignore=*.o,*~,*.pyc,*.aux,*.bak,*.bbl,*.blg,*.out,*.pdf,*.synctex,*.png,*.jpg
set wildignore+=*.pdfsync,*.sty,*.bst
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
set wildignore+=*.xlsx,*.mm,*.pptx,*.docx,*.doc,*.xls
set wildignore+=*.bbl,*.blg,*.sav
set wildignore+=*.dta,*.csv "Comment his when trying to get a grasp of the structure of the dataset
set wildmode=list:full
"set wildmode=""
"set wildmode=longest,list


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ·Ö¶Î & Tab-key
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart Tab setup == use spaces instead. 

" Be smart when using tabs ;)
"set smarttab


" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2
set softtabstop=2
set shiftround "Founding the shiftwidth to the closed ÕûÊý±¶...

set autoindent  "Auto indent
set smartindent

" Linebreak on 500 characters
set lbr
set tw=500

set wrap "Wrap lines
"set showbreak=->
set linebreak " The value of 'showbreak' is used to put in front of wrapped lines.
set formatoptions+=l2nmt
" These two are not necessary when I am writing code on my X230T, which had a
" quite narrow screen, and a line would usually end around 80 chars. 
"set textwidth=79 " =0 for unset.
"set wrapmargin=3

" For formatting the texts.
set textwidth=80
set wrapmargin=0
set number
set relativenumber


" Parameters for no-line-breaking and no-wrapping (till the edge of the
" window)

" >>>>>>>>> Now, there is no need to specify this given that the new patch
" made breakindent possible! (Patch 7.4.338)
" au BufRead,BufNewFile *.tex setlocal wrap linebreak nolist textwidth=0 wrapmargin=0

" It turns out that I still want to have a one-line per paragraph structure in my tex files. At least, this makes commenting out one line easier. (Otherwise, I would have to invent a new mapping that comments out a selected visual block.)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Search Options, search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" For regular expressions turn magic on
set magic

" Show matching bracets when text indicator is over them
set showmatch



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ²»Ã÷¾õÀ÷ 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight current line
set cursorline
set nocursorcolumn

" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugin
filetype plugin on
filetype indent on



" For displaying the @ percent. 
set display=lastline  

set mat=2 "How many tenths of a second to blink
"Persistent undo
set backup " Backups are nice ...
set undofile " So is persistent undo ...
set undolevels=1000 " Maximum number of changes that can be undone
set undoreload=10000 " Maximum number lines to save for undo on a buffer reload

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Format the status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" Always show the status line
"set laststatus=2

"For better typing experience
set nrformats-=octal
set backspace=indent,eol,start

"Fixes slow O inserts (all three)
set timeout
set timeoutlen=1000
set ttimeoutlen=100
" }}} 
" }}}
" Plugins {{{
" Vundle Setup and Installing other packages {{{
set nocompatible              " be iMproved, required

call vundle#begin(path)
" let Vundle manage Vundle, required
" Plugin 'gmarik/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
"Plugin 'llinfeng/mru.vim'
Plugin 'llinfeng/dwm.vim'
Plugin 'llinfeng/LanguageTool'
Plugin 'llinfeng/FeralToggleCommentify.vim'
Plugin 'vim-scripts/Align'
Plugin 'scrooloose/nerdtree'
Plugin 'xolox/vim-misc' 
Plugin 'xolox/vim-shell'
Plugin 'sjl/gundo.vim' " (Requires +Python)
Plugin 'kien/ctrlp.vim'
Plugin 'vim-voom/VOoM'
Plugin 'vimwiki/vimwiki'
Plugin 'vim-scripts/listmaps.vim'
Plugin 'vim-scripts/matlab_run.vim'
Plugin 'vim-scripts/grep.vim'
Plugin 'llinfeng/vim-latex-suite'

Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/neomru.vim'
Plugin 'dkprice/vim-easygrep'
Plugin 'llinfeng/vim-snipmate'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'

Plugin 'MarcWeber/vim-addon-async'

"Plugin 'Shougo/neocomplete.vim'
"Plugin 'SirVer/ultisnips'

Plugin 'tpope/vim-surround' " It is not well performing. I just added it in directly. 
Plugin 'bling/vim-airline'
Plugin 'mileszs/ack.vim'



" I don't like changing colors!
"Plugin 'xolox/vim-colorscheme-switcher'
"Plugin 'Taverius/vim-colorscheme-manager'

" Something I don't find useful.

" Vim with R, the dependnece part.
"Plugin 'Vim-R-plugin'
"Plugin 'jalvesaq/VimCom'

" Vim Color Schemes.
"Plugin 'zeis/vim-kolor'
"Plugin 'tomasr/molokai'
"Plugin 'vim-scripts/ScrollColors'




" Plugin 'vim-scripts/bufexplorer.zip'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" }}} 
" VIm-shell {{{
nnoremap <C-S-CR> :Open<CR>
" }}}
" Ctrl+P Suite {{{
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_cache_dir='C:\Users\llinfeng\Documents\Vim-document\CtrlP'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_by_filename = 1
let g:ctrlp_regexp = 1
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$\|.rvm$|.dta$'
let g:ctrlp_open_new_file = 'v'
"let g:ctrlp_mruf_include = '\.py$\|\.rb$|\.wiki$|\.ado$|\.tex$|\.bib%|'
"let g:ctrlp_mruf_include = '.py,.tex,.wiki'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:57,results:57'

"let g:ctrlp_use_caching=1
"let g:ctrlp_by_filename = 1
"let g:ctrlp_match_window_bottom=1
"let g:ctrlp_max_height=15
"let g:ctrlp_match_window_reversed=0
"let g:ctrlp_mruf_max=500
"let g:ctrlp_follow_symlinks=1
" }}}
" Customizing Windows Machine {{{
"¹²Ïí¼ôÌù°å  
"Sharing the storage space of yanking with windows clipboard. 
" set clipboard+=unnamed  
set history=1000
" }}}
" Directory and Defualts {{{ 
" [Change these settings to the directories on your machine]
" Change my name  "Linfeng" to be your user name. 

set guioptions+=a
set guioptions-=r " Make sure that the touch-screen effectiveness. 
set guioptions+=h
set guioptions-=m  "remove menu bar
set guioptions-=T
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions-=b
set guioptions-=e

" }}}
" Vim-Latex {{{ 
filetype plugin on
filetype indent on
set shellslash
set grepprg=grep\ -nH\ $*
set diffexpr=MyDiff()
function! MyDiff()
    let opt = '-a --binary '
    if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
    if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
    let arg1 = v:fname_in
    if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
    let arg2 = v:fname_new
    if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
    let arg3 = v:fname_out
    if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
    let eq = ''
    if $VIMRUNTIME =~ ' '
        if &sh =~ '\<cmd'
            let cmd = '""' . $VIMRUNTIME . '\diff"'
            let eq = '"'
        else
            let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
        endif
    else
        let cmd = $VIMRUNTIME . '\diff'
    endif
    silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction
let g:tex_flavor='latex'

let g:Tex_GotoError=0 " Will keep the cursor as is.
"let g:Tex_IgnoredWarnings =
"        \'Underfull'."\n".
"        \'Overfull'."\n".
"        \'specifier changed to'."\n".
"        \'You have requested'."\n".
"        \'Missing number, treated as zero.'."\n".
"        \'There were undefined references'."\n".
"        \'Citation %.%# undefined'."\n".
"        \'Font Warning'
let g:tex_IgnoredWarnings = 
    \'Underfull'."\n".
    \'Overfull'."\n".
    \'specifier changed to'."\n".
    \'You have requested'."\n".
    \'Missing number, treated as zero.'."\n".
    \'There were undefined references'."\n".
    \'Citation %.%# undefined'."\n".
    \'Double space found.'."\n".
    \'Latex Warning'."\n"
let g:Tex_IgnoreLevel = 9

let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_CompileRule_pdf = 'pdflatex --synctex=-1 -src-specials -interaction=nonstopmode $*'
let g:Tex_ViewRule_pdf = 'C:\Program Files (x86)\SumatraPDF\SumatraPDF.exe -reuse-instance -inverse-search "C:\vim\vim74\gvim  -c \":RemoteOpen +\%l \%f\"" '
" "C:\Program Files (x86)\Notepad++\notepad++.exe" -n%l "%f"
let g:Tex_MultipleCompileFormats='pdf'

" }}} 
" DWM (for window managing) {{{
" Decide the size of the master window!
"let g:dwm_map_keys=0
let g:dwm_master_pane_width="50%"
"nnoremap <c-n> <C-W>n
"nnoremap <c-c> <C-W>c
"nnoremap <c-k> <C-W>w
"nnoremap <c-j> <C-W>W
"nnoremap <c-h> <C-W><left>
"nnoremap <c-l> <C-W><right>
" }}}
" MRU {{{
highlight link MRUFileName LineNr 
let MRU_Max_Entries = 400
let MRU_Exclude_Files = '.tmp'     
" }}}
" LanguageTool {{{
let g:languagetool_jar= 'c:\users\llinfeng\apps\LanguageTool-2.7\languagetool-commandline.jar'
" }}}
" NERDTree {{{
let NERDTreeIgnore=['\.vim$', '\~$', '\.aux', '\.out', '\.pdf', '\.pdfsync', '\.synctex', '\.latexmain', '\.bst', '\.sty', '\.bbl', '\.blg', '\.bak', '\.sav']
" }}} 
" Gundo {{{
set undofile
set undolevels=100
" }}}
" Vim Airline {{{
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Displaying Time ^.^
let g:airline_section_b = '%{strftime("%c")}'
let g:airline_section_y = 'BN: %{bufnr("%")}'

" Separators can be configured independently for the tabline, so here is how you can define "straight" tabs:
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

"function! MyOverride(...)
"  call	a:l.add_section('StatusLine', ' all ')
"  call	a:l.add_section('Tag', 'your ')
"  call	a:l.add_section('Search', 'base ')
"  call	a:l.add_section('Title',' are ')
"  call	a:l.add_section('TabLineSel', 'belong')
"  call	a:l.add_section('ErrorMsg', ' to ')
"  call	a:l.add_section('StatusLineNC','%f ')
"  call	a:l.split()	
"  call	a:l.add_section('Error', ' %p%%')
"  return l "tells the pipeline to write the statusline with the builder
"endfunction
"call airline#add_statusline_func('MyOverride')

" }}}
" VimWiki {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""     VimWiki and its parameters 2014-06-14"""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimwiki_use_mouse = 1
let g:vimwiki_use_calendar = 1
let g:vimwiki_hl_cb_checked = 1
let g:vimwiki_auto_checkbox = 1
"let g:vimwiki_folding='expr'
let g:vimwiki_table_auto_fmt = 1
let g:vimwiki_html_header_numbering_sym = '.'

let wiki_1 = {}
let wiki_1.index = 'Academia'
let wiki_1.path = 'C:/Users/llinfeng/Dropbox/Wiki/Warehouse'
let wiki_1.diary_rel_path = ''
let wiki_1.diary_index = 'Journal'
let wiki_1.path_html = 'C:/Users/llinfeng/Dropbox/Wiki/html'
let wiki_1.html_header = 'C:/Users/llinfeng/Dropbox/Wiki/html'
let wiki_1.template_path = 'C:/Users/llinfeng/Dropbox/Shu/HTML/Template-Defualt'
let wiki_1.template_default = 'default'
let wiki_1.template_ext = '.html'
let wiki_1.auto_export = 1

let wiki_2 = {}
let wiki_2.index = 'Life'
let wiki_2.path = 'C:/Users/llinfeng/Dropbox/Wiki/Warehouse'
let wiki_2.diary_rel_path = ''
let wiki_2.diary_index = 'Journal'
let wiki_2.path_html = 'C:/Users/llinfeng/Dropbox/Wiki/html'
let wiki_2.html_header = 'C:/Users/llinfeng/Dropbox/Wiki/html'
let wiki_2.template_path = 'C:/Users/llinfeng/Dropbox/Shu/HTML/Template-Defualt'
let wiki_2.template_default = 'default'
let wiki_2.template_ext = '.html'
let wiki_2.auto_export = 1

let wiki_3 = {}
let wiki_3.index = 'Work'
let wiki_3.path = 'C:/Users/llinfeng/Dropbox/Wiki/Warehouse'
let wiki_3.path_html = 'C:/Users/llinfeng/Dropbox/Wiki/html'
let wiki_3.html_header = 'C:/Users/llinfeng/Dropbox/Wiki/html'
let wiki_3.template_path = 'C:/Users/llinfeng/Dropbox/Shu/HTML/Template-Defualt'
let wiki_3.template_default = 'default'
let wiki_3.template_ext = '.html'
let wiki_3.auto_export = 1

" This is the "make" commend that constructs the two wiki's. 
let g:vimwiki_list = [wiki_1, wiki_2, wiki_3]

" }}} 
" Customizing the xolox-shell, for full-screen looks of Vim the editor {{{
let g:shell_fullscreen_always_on_top = 0
let g:shell_fullscreen_items="mT"
" }}}
" }}}

" Mapings {{{
" Mapping for functionality: tab and line-toggle {{{

" Show case of keys for a better life. 

" Tab section [Enables normal behavior of TAB]
"nnoremap <tab> V>
"nnoremap <s-tab> V<
"vnoremap <tab> >gv
"vnoremap <s-tab> <gv
"inoremap <tab> <space><space><space><space> 
" <Ctrl-Shift-r> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-S-r> :nohl<CR><C-l>
" ## Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
" TODO: this is not working due to the new patch (I have know idea which one it is.)
nnoremap <M-j> mz:m+<cr>`z
nnoremap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
nnoremap <A-j> mz:m+<cr>`z
nnoremap <A-k> mz:m-2<cr>`z
vmap <A-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <A-k> :m'<-2<cr>`>my`<mzgv`yo`z
"    }}} 
" Mapping for key-combination  {{{
nnoremap <C-s> :wall!<CR>
inoremap <C-s> <ESC>:wall!<CR><right>
inoremap <C-BS> <C-W>

" nnoremap <C-space> :DWM_Focus<CR>
" Forget about this: now use <C-@>

"unnoremap <C-n>
"nnoremap <C-n> :tabnext<CR>
nnoremap <C-n> :bn<CR>

" Visually select all (to prepare for other formating methods)
"map <C-A> ggVG
" Comment: This would be primitive, but I am happy to introduce it here. 
" The above line enables visual selecting the entire text of the file.

nnoremap <M-w> :tabclose<CR>
nnoremap <M-c> :tabnew<CR>
nnoremap <M-n> :tabnext<CR>
nnoremap <M-p> :tabprevious<CR>
inoremap <S-tab> <backspace><backspace><backspace><backspace>

"inoremap zz <ESC>Vapgqi<end> 
" Mapping anything to jj is not a good idea.
"inoremap  jj <ESC>[sz=
"nnoremap jj <ESC>[sz=
"inoremap  zz <ESC>[sz=
"nnoremap zz <ESC>[sz=
inoremap  aa <ESC>[sz=
nnoremap  aa <ESC>[sz=


" 

" }}}
" Mapping for Single Keys & (F1-F12) keys {{{
" Short key feature for toggling
"
nnoremap <insert> :LanguageToolCheck<CR>
nnoremap <S-insert> :LanguageToolClear<CR>
inoremap <silent> <insert> <ESC>:YRShow<CR>
noremap <F2> :NERDTreeToggle<CR> 
noremap <silent> <F3> :noh<cr>
nnoremap <F4> :GundoToggle<CR>
nnoremap <S-CR> [sz=<CR>
nnoremap Y y$

" To add a task in VimWiki.
" All the mappings have been transported to the ftpluging .vim files. 


" }}}
" Mapping for moving cursor around (both windows and tabs) {{{

" Treat long lines as break lines (useful when moving around in them)
noremap <home> g0
noremap <end> g$
"noremap 0 g0
"noremap $ g$
inoremap <silent> <Down> <C-o>gj
inoremap <silent> <Up> <C-o>gk
inoremap <home> <C-o>g0
inoremap <end> <C-o>g$

" }}}
" Mapping for Windows {{{
map <C-V>		"+gP
cmap <C-V>		<C-R>+
exe 'inoremap <script> <C-V> <C-G>u' . paste#paste_cmd['i']
exe 'vnoremap <script> <C-V> ' . paste#paste_cmd['v']
imap <S-Insert>		<C-V>
vmap <S-Insert>		<C-V>
noremap <C-Q>		<C-V>
noremap <C-A> gggH<C-O>G
inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-A> <C-C>gggH<C-O>G
onoremap <C-A> <C-C>gggH<C-O>G

" }}}
" Change pwd to the directory of the buffer.




" <F12> is used for toggling the menu bar.


"
" It's useful to show the buffer number in the status line.
" TODO: tune the statusline through checking out the help files. 
set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

let c = 1
while c <= 99
    execute "nnoremap " . c . "g :" . c . "b\<CR>"
    let c += 1
endwhile
" }}} 
" My functions {{{
" Run the whole do file at a time.
    fun! RunIt()
        wa
        !start /min "C:\Vim\vimfiles\ftplugin\Stata-Vim-Suite\rundo.exe" "%:p"
    endfun

" Run the lines that has been visually selected.
    fun! RunDoLines()
        let selectedLines = getbufline('%', line("'<"), line("'>"))

        if col("'>") < strlen(getline(line("'>")))
            let selectedLines[-1] = strpart(selectedLines[-1], 0, col("'>"))
        endif
        if col("'<") != 1
            let selectedLines[0] = strpart(selectedLines[0], col("'<")-1)
        endif

        let temp = tempname() . ".do"
        call writefile(selectedLines, temp)

        " *** CHANGE PATH AND NAME TO REFLECT YOUR SETUP. USE \\ INSTEAD OF \ ***
        exec "!start C:\\Vim\\vimfiles\\ftplugin\\Stata-Vim-Suite\\rundo.exe " . temp

        " Delete the temp file after Vim closes
        au VimLeave * exe "!del -y" temp
    endfun

" <F11> is used to run a entire do file, from the beginning to the end.    
" The actual mappings are moved to stata.vim located in the in ftplugin. 
" The reasons is that: there is no local keymapping function in Vim.

" <F12> is used to run a line command, regardless of whether the line is visually selected or not.


" }}}

" AutoCommand {{{
autocmd BufNewFile,BufReadPost *.md setlocal filetype=markdown
"autocmd  BufRead,BufWritePre *.do normal gg=G

 


autocmd FocusLost * wall
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |   exe "normal g`\"" | endif

augroup vimscript 
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

au FileType tex setlocal linebreak nolist textwidth=80 wrapmargin=0 formatoptions+=t fdm=manual
au FileType matlab setlocal linebreak nolist textwidth=0 wrapmargin=0 formatoptions+=t fdm=manual shiftwidth=4 tabstop=4 softtabstop=4 shiftround 
au FileType stata setlocal wrap nolinebreak nolist textwidth=0 wrapmargin=0 fdm=manual
au BufRead,BufNewFile *.m setlocal wrap linebreak nolist textwidth=0 wrapmargin=0 formatoptions+=t
au BufRead,BufNewFile *.py setlocal wrap linebreak nolist textwidth=80 wrapmargin=0 formatoptions+=t foldmethod=indent foldlevel=99

autocmd FileType python nnoremap <f5> :w<cr>:!python %<cr>
" }}}

"Restoring the functionality of redo. <C-R> had been mapped siliently to :nohl<CR> somewhere in the body of _vimrc


noremap <C-R> :redo<CR>

nnoremap <space> <C-F>

function! ToggleSlash(independent) range
  let from = ''
  for lnum in range(a:firstline, a:lastline)
    let line = getline(lnum)
    let first = matchstr(line, '[/\\]')
    if !empty(first)
      if a:independent || empty(from)
        let from = first
      endif
      let opposite = (from == '/' ? '\' : '/')
      call setline(lnum, substitute(line, from, opposite, 'g'))
    endif
  endfor
endfunction
command! -bang -range ToggleSlash <line1>,<line2>call ToggleSlash(<bang>1)
"noremap <silent> <F8> :ToggleSlash<CR>

" Behave Win: 
vnoremap <BS> d


"Diff-ing two consecutive lines
"That is not a feature, however it is easily scripted, e.g. in your vimrc:
function! DiffLineWithNext()
    let f1=tempname()
    let f2=tempname()

    .write &f1
    .+1write &f2

    tabedit &f1
    vert diffsplit &f2
endfunction

"This will open the current and next lines in vertical split in another tab. Note that this code is a sample
"
"    it doesn't check whether next line exists (there are any following lines)
"    it doesn't cleanup the tempfiles created
"    a nice improvement would be to take a range, or use the '' mark to select the other line
"
"You can leave off the 'vert' in order to have a horizontal split
"
"Map it to something fancy so you don't have to :call it manually:
nnoremap <F17> :call DiffLineWithNext()^M

" Defining commandline functions.
command! O only
command! Co :copen
command! CO :copen
command! C :center

" the following command defines the SaveIt command, which writes out the specified range to the file "save_file": 
"command! -range=% SaveIt :<line1>,<line2>write! save_file
" Comment: this is not so ideal. At lease I would like to save it to a directory
" of my choice.

" Undo bdelete
autocmd BufDelete * let g:latest_deleted_buffer = expand("<afile>:p")

nnoremap <F8> :e <C-R>=fnameescape(g:latest_deleted_buffer)<CR><CR>
nnoremap <F8> :e <C-R>=fnameescape(g:latest_deleted_buffer)<CR><CR>

" Copy the full file path to windows clipboard.
nnoremap yyy :let @* = expand("%:p")<CR>

" Copy the file name to windows clipboard.
nnoremap Y :let @* = expand("%:p:t")<CR>

" complete list of the choices: 
    " Path(absolute) to the file: "%:p" 
    " Path to the directory of the file: "%:p:h"
    " File name only: "%:t"
    " Relative path: "%"

nnoremap DDD :call delete(expand('%')) 
"autocmd QuickFixCmdPost [^l]* nested copen
autocmd QuickFixCmdPost    l* nested copen


imap <tab> <Plug>snipMateNextOrTrigger
smap <tab> <Plug>snipMateNextOrTrigger

" Don't tough my macros!
" l = line-separator
"let @l = "i*79.yypO"
let @l = "i*79.yypO/* */:CC€kbwhs"
" r = run
let @r = "Vgg€F2"
" w = write
let @w = "G5ki"
" c = center
let @c = "i/*A*/:C"
let @t = "Itex j"
let @p = ":s/^/tex /g^["

"2014-11-21 21:48:34, for centering the comment line.
"This would need no auto linebreak. wrapping is also not well accepted.
let @o = ":CV:s/\t/g€kb  /gikV:s/ /*/gJxA40A*d80|, "


call unite#filters#matcher_default#use(['matcher_fuzzy'])


"nnoremap M :Unite -start-insert file_mru<CR>
command! M :Unite -start-insert file_mru
command! MRU :Unite -vertical file_mru
command! L :Unite -start-insert line
command! S :Unite -start-insert file buffer file_mru

nnoremap S :Unite -start-insert file buffer file_mru<CR>
" Search through yank history.
let g:unite_source_history_yank_enable = 1




" Leader Mapping {{{
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
nnoremap <leader>cd :cd %:p:h<cr>
nnoremap <Leader>d :bd<CR>
nnoremap <Leader>D :bd!<CR>
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>N :setlocal relativenumber!<CR>
nnoremap <Leader>e :e $MYVIMRC<CR> :O<CR>
noremap <leader>f <ESC>:Fullscreen<CR>:Fullscreen<CR>:Fullscreen<CR>
nnoremap <leader>i :PluginInstall<CR>
"nnoremap <Leader>l :ls<CR>
nnoremap <leader>M :if &go=~'m'<bar>set go-=m<bar>else<bar>set go+=m<bar>endif<cr>
nnoremap <leader>sy ggVGy<C-W>wggVGp<C-W>w
nnoremap <leader>u :e C:\Users\llinfeng\Dropbox\Wiki\Warehouse\URL.wiki<CR>
nnoremap <leader>x :wa!<CR><ESC>:exit<CR>
"nnoremap <leader>t :r !time /T<CR><ESC>=
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>
nnoremap <leader><space> :nohl<CR>
nnoremap <leader><leader>f :let @* = expand("%:p")<CR>
nnoremap <leader><leader>n :let @* = expand("%:t")<CR>
nnoremap <leader><leader>p :let @* = expand("%:p:h")<CR>
nnoremap <leader>l :Unite -start-insert line<CR>
nnoremap <leader>s :Unite -start-insert file buffer file_mru<CR>
nnoremap <leader><leader> :Unite -start-insert file buffer file_mru<CR>
nnoremap <leader>r :<C-u>Unite -start-insert file_rec/async:!<CR>
nnoremap <leader>m :<C-u>Unite -start-insert file_mru<CR>
nnoremap <leader>y :<C-u>Unite history/yank<CR>
" k for keyword
nnoremap <leader>k :grep <cword> *<CR>
nnoremap <leader>w :w!<CR>
vnoremap <leader>g gq
nnoremap <leader>g gq
vnoremap <leader>G gqap
nnoremap <leader>G gqap

" leader key for opening files
nnoremap <leader>a :e C:/Users/llinfeng/Dropbox/Wiki/Warehouse/apply.wiki<CR>

" For searching
nnoremap <leader>m :Unite -start-insert file_mru

" For buffer management
nnoremap <leader>o :only<CR>
" }}}
	\item \verb|cat_A = 1| if and only if there is at least $A$ presented.



"
nnoremap <F5> <ESC>:marks<CR>
"map <c-m> :marks<CR>
"unmap <cr>
cd c:\noda

map <leader>c :CC<CR>
map <leader>u :UC<CR>

"nnoremap <leader>u :e C:\Users\llinfeng\Dropbox\Wiki\Warehouse\URL.wiki
command! U :e c:\Users\llinfeng\Dropbox\Wiki\Warehouse\URL.wiki
command! PRESETTEX :s/^/tex /g

" Solarized Coloring {{{
syntax enable
let g:solarized_italic=0 " All parameters should be set before calling the color scheme. 
let g:solarized_termcolors=256

"Or | "high" or "low"
let g:solarized_visibility="normal" 
colorscheme solarized 
set background=dark
"set background=light

" }}} 


" iab mapping: saving keystrokes
iab sj <c-r>=strftime("20%y-%m-%d %H:%M:%S")<cr>
iab rq <c-r>=strftime("20%y-%m-%d")<cr>
iab SJ <c-r>=strftime("%H:%M:%S")<cr>
iab v1 {v^1}
iab v2 {v^2}
iab c1 {c^1}
iab c2 {c^2}
iab l1 {l^1}
iab l2 {l^2}
iab ti {\theta_i}

"set guioptions+=r
