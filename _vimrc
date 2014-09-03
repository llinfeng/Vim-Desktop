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
" Canned 封存 {{{

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 启动窗口最大化, maximizing the interface upon start. 
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
" => 关于编辑器的基本设定
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
" => 读不懂的 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ru 
"Always show current position
set ruler

set hidden
set wildmenu
" Ignore compiled files (including those from tex files). 
set wildignore=*.o,*~,*.pyc,*.aux,*.bak,*.bbl,*.blg,*.log,*.out,*.pdf,*.synctex,*.png,*.jpg
set wildignore+=*.pdfsync,*.sty,*.bst
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
set wildignore+=*.xlsx,*.mm,*.pptx,*.docx,*.doc,*.xls
set wildignore+=*.bbl,*.blg,*.sav
set wildmode=list:full
"set wildmode=""
"set wildmode=longest,list


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 分段 & Tab-key
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart Tab setup == use spaces instead. 
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
"set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4
set shiftround "Founding the shiftwidth to the closed 整数倍...

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

set textwidth=0
set wrapmargin=0
set number


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
" => 不明觉厉 
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
Plugin 'llinfeng/mru.vim'
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
Plugin 'honza/vim-snippets'
Plugin 'vim-scripts/listmaps.vim'
Plugin 'vim-scripts/matlab_run.vim'
Plugin 'vim-scripts/grep.vim'

"Plugin 'jcf/vim-latex'
"Plugin 'jeffkreeftmeijer/vim-numbertoggle' " use set relativenumber!

"Plugin 'tpope/vim-surround' " It is not well performing. I just added it in directly. 


"Plugin 'bling/vim-airline'

" Something I don't find useful.
"Plugin 'llinfeng/yankring'
"Plugin 'tpope/vim-fugitive'

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
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$\|.rvm$'
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
"共享剪贴板  
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
" Solarized Coloring {{{
syntax enable
let g:solarized_italic=0 " All parameters should be set before calling the color scheme. 
let g:solarized_termcolors=256

"Or | "high" or "low"
let g:solarized_visibility="normal" 
" }}} 
" MRU {{{
highlight link MRUFileName LineNr 
let MRU_Max_Entries = 400
let MRU_Exclude_Files = '^.log,.tmp'     
" }}}
" LanguageTool {{{
let g:languagetool_jar= 'C:\Users\llinfeng\Dropbox\Tool\Language-Tool_Stand_alone\languagetool-commandline.jar'
" }}}
" NERDTree {{{
let NERDTreeIgnore=['\.vim$', '\~$', '\.aux', '\.log', '\.out', '\.pdf', '\.pdfsync', '\.synctex', '\.latexmain', '\.bst', '\.sty', '\.bbl', '\.blg', '\.bak', '\.sav']
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
"let wiki_1.diary_rel_path = 'C:/gUsers/llinfeng/Dropbox/Dropbox/Wiki/Warehouse'
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
noremap <F2> :NERDTreeToggle<CR>B
noremap <silent> <F3> :noh<cr>
nnoremap <F4> :GundoToggle<CR>
nnoremap <S-CR> [sz=<CR>
nnoremap Y y$

" To add a task in VimWiki.
"autocmd Filetype wiki 
autocmd FileType vimwiki nnoremap <F10> I* [ ] <ESC>
autocmd FileType vimwiki inoremap <F10> <ESC>I* [ ] 


" }}}
" Mapping for moving cursor around (both windows and tabs) {{{

" Treat long lines as break lines (useful when moving around in them)
noremap j gj
noremap k gk
inoremap <silent> <Down> <C-o>gj
inoremap <silent> <Up> <C-o>gk

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
" Leader Mapping {{{
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
" Change pwd to the directory of the buffer.
noremap <leader>cd :cd %:p:h<cr>

" Fast saving
nnoremap <leader>s :w!<cr>
inoremap <C-CR> <ESC>[sz=<cr>
" Disable highlight when <leader><cr> is pressed

call togglebg#map("<leader>c")

nnoremap <Leader>d :bd<CR>
nnoremap <Leader>D :bd!<CR>
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>N :set relativenumber!<CR>
nnoremap <Leader>p :bp<CR>
nnoremap <Leader>b :bp<CR>

nnoremap <Leader>e :vsp $MYVIMRC<CR>
noremap <leader>f <ESC>:Fullscreen<CR>
nnoremap <leader>i :PluginInstall<CR>
nnoremap <Leader>l :ls<CR>
" <F12> is used for toggling the menu bar.
nnoremap <leader>m :if &go=~'m'<bar>set go-=m<bar>else<bar>set go+=m<bar>endif<cr>
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
nnoremap <Leader><Leader> :cd %:p:h<cr>
nnoremap <leader><space> :nohl<CR>

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
" iab mapping {{{
iab sj <c-r>=strftime("20%y-%m-%d %H:%M:%S")<cr>
iab rq <c-r>=strftime("20%y-%m-%d")<cr>
iab SJ <c-r>=strftime("%H:%M:%S")<cr>
" }}}
" }}}
" My functions {{{
" Stata Do-File Scripts {{{

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
autocmd FileType stata nnoremap <F11> :<C-U>call RunIt() <ENTER>
autocmd FileType stata inoremap <F11> <Esc>:<C-U>call RunIt() <ENTER>
autocmd FileType stata vnoremap <F11> <Esc>:<C-U>call RunIt() <ENTER>

" <F12> is used to run a line command, regardless of whether the line is visually selected or not.
autocmd FileType stata noremap <F12> V:<C-U>call RunDoLines() <CR>
autocmd FileType stata inoremap <F12> <ESC>V:<C-U>call RunDoLines() <CR>
autocmd FileType stata vnoremap <F12> :<C-U>call RunDoLines() <CR>


" A working version for Mac users (hopefully those using *nix)
" Source: http://stackoverflow.com/questions/4226145/sending-code-from-vim-to-stata
" Also refer to: https://github.com/dinosv/statascripts/blob/master/stata_vim/README
"" STATA DO-FILE SCRIPTS
"fun! RunIt()
"  w
"  "adjust this path to the bash script
"  !sh "/home/username/.rundo.sh" "%:p"
"endfun
"au FileType stata noremap <F8> :<C-U>call RunIt()<CR><CR>
"fun! RunDoLines()
"  let selectedLines = getbufline('%', line("'<"), line("'>"))
" if col("'>") < strlen(getline(line("'>")))
"  let selectedLines[-1] = strpart(selectedLines[-1], 0, col("'>"))
"  endif
" if col("'<") != 1
"  let selectedLines[0] = strpart(selectedLines[0], col("'<")-1)
"  endif
" let temp = tempname() . ".do"
"  call writefile(selectedLines, temp)
"          "adjust this path to the bash script
"          exec "!sh /home/username/.rundo.sh " . temp
"    "au VimLeave * exe "!del -y" temp
"    au VimLeave * silent exe '!del /Q "'.$TEMP.'\*.tmp.do"'
"endfun
"au FileType stata noremap <F9> :<C-U>call RunDoLines()<CR><CR> 

" }}} 
" }}}


" AutoCommand {{{
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
"autocmd  BufRead,BufWritePre *.do normal gg=G

autocmd FileType vimwiki nnoremap <leader>T :set syntax=vimwiki<CR>
autocmd FileType vimwiki nnoremap <leader>t :Voom vimwiki<CR>
autocmd FileType vimwiki nnoremap C VC
 
autocmd FileType tex nnoremap <leader>T :set syntax=tex<CR>
autocmd FileType tex nnoremap <leader>t :Voom latex<CR>


autocmd FocusLost * wall
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |   exe "normal g`\"" | endif

augroup vimscript 
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

au BufRead,BufNewFile *.tex setlocal wrap linebreak nolist textwidth=80 wrapmargin=0 formatoptions+=t
au BufRead,BufNewFile *.m setlocal wrap linebreak nolist textwidth=75 wrapmargin=0 formatoptions+=t
au BufRead,BufNewFile *.py setlocal wrap linebreak nolist textwidth=80 wrapmargin=0 formatoptions+=t foldmethod=indent foldlevel=99

autocmd FileType python nnoremap <f5> :w<cr>:!python %<cr>
" }}}

"Restoring the functionality of redo. <C-R> had been mapped siliently to :nohl<CR> somewhere in the body of _vimrc


noremap <C-R> :redo<CR>
"colorscheme solarized 
"set background=dark
