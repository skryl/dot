" ----------------------------------------------------------------------------
" STARTUP
" ----------------------------------------------------------------------------
set nocompatible                       " Vim doesn't act like Vi
let s:is_macvim  = has('gui_macvim')   " used later
let g:is_posix = 1                     " bash scripts are not highlighted as sh

if system('uname') =~ 'Darwin'
  let $PATH = $HOME .
    \ '/usr/local/bin:/usr/local/sbin:' .
    \ '/usr/pkg/bin:' .
    \ '/opt/local/bin:/opt/local/sbin:' .
    \ $PATH
endif

" set grepprg
if executable('ack')
  set grepprg=ack\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow\ $*
  set grepformat=%f:%l:%c:%m
endif

if executable('ag')
  set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
  set grepformat=%f:%l:%c:%m
endif

" ----------------------------------------------------------------------------
" PACKAGES
" ----------------------------------------------------------------------------
  if has ('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
  endif

  call neobundle#rc(expand('~/.vim/bundle/'))

  NeoBundle 'Shougo/neobundle.vim'
  NeoBundle 'Shougo/vimproc', { 'build': {
        \   'mac': 'make -f make_mac.mak',
        \   'unix': 'make -f make_unix.mak',
        \ }  }

" FUNCTIONALITY

  NeoBundle     '907th/vim-auto-save'
  NeoBundle     'Lokaltog/vim-easymotion'
  NeoBundle     'Raimondi/delimitMate'
  NeoBundle     'Rename'
  NeoBundle     'SirVer/ultisnips'
  " NeoBundle     'Valloric/ListToggle' " conflict with ,q
  NeoBundle     'Valloric/MatchTagAlways'
  NeoBundle     'ZoomWin'
  NeoBundle     'bling/vim-airline'
  NeoBundle     'bufkill.vim'
  NeoBundle     'dahu/vim-fanfingtastic'
  NeoBundle     'epmatsw/ag.vim'
  NeoBundle     'gavinbeatty/dragvisuals.vim'
  NeoBundle     'godlygeek/tabular'
  NeoBundle     'kien/rainbow_parentheses.vim'
  NeoBundle     'kshenoy/vim-signature'
  NeoBundle     'matthias-guenther/hammer.vim'
  NeoBundle     'michaeljsmith/vim-indent-object'
  NeoBundle     'mileszs/ack.vim'
  NeoBundle     'nathanaelkane/vim-indent-guides'
  NeoBundle     'scrooloose/syntastic'
  NeoBundle     'skryl/tslime.vim'
  NeoBundle     'skryl/vimdoc'
  NeoBundle     'terryma/vim-expand-region'
  NeoBundle     'tomtom/tcomment_vim'
  NeoBundle     'tpope/vim-repeat'
  NeoBundle     'tpope/vim-surround'
  NeoBundle     'tpope/vim-unimpaired'
  NeoBundle     'vis'
  NeoBundle     'Valloric/YouCompleteMe', { 'build': {'mac': 'install.sh', 'unix': 'install.sh'}}
  NeoBundle     'kien/ctrlp.vim',         { 'depends': 'tacahiroy/ctrlp-funky' }
  NeoBundle     'xolox/vim-easytags',     { 'depends': 'xolox/vim-misc' }
  NeoBundle     'xolox/vim-session',      { 'depends': 'xolox/vim-misc' }
  NeoBundleLazy 'EasyGrep',               { 'autoload':{'commands':'GrepOptions'}}
  " NeoBundleLazy 'Shougo/vimshell.vim',    { 'autoload':{'commands':'VimShell'}}
  NeoBundleLazy 'majutsushi/tagbar',      { 'autoload':{'commands':'TagbarToggle'}}
  NeoBundleLazy 'mattn/gist-vim',         { 'autoload':{'commands':'Gist' }, 'depends': 'mattn/webapi-vim'}
  NeoBundleLazy 'mbbill/undotree',        { 'autoload':{'commands':'UndotreeToggle'}}
  NeoBundleLazy 'scrooloose/nerdtree',    { 'autoload':{'commands':['NERDTreeToggle','NERDTreeFind']}}
  NeoBundleLazy 'tpope/vim-endwise',      { 'autoload':{'filetypes':['lua','ruby','sh','zsh','vb','vbnet','aspvbs','vim','c','cpp','xdefaults']}}

" UNITE

  " NeoBundleLazy 'Shougo/unite-outline',      { 'autoload': { 'unite_sources':'outline'}}
  " NeoBundleLazy 'Shougo/unite.vim',          { 'autoload': { 'commands':'Unite', 'insert': 1}}
  " NeoBundleLazy 'ujihisa/unite-colorscheme', { 'autoload': { 'unite_sources':'colorscheme'}}

" LANGUAGE SUPPORT

 " git
  NeoBundle     'tpope/vim-fugitive'
  NeoBundle     'tpope/vim-git'
  NeoBundle     'mhinz/vim-signify'
  NeoBundleLazy 'gregsexton/gitv',  {'depends':['tpope/vim-fugitive'], 'autoload':{'commands':'Gitv'}}

  " ruby
  NeoBundleLazy 'henrik/vim-ruby-runner',  { 'autoload':{'filetypes':['ruby']}}
  NeoBundleLazy 't9md/vim-ruby-xmpfilter', { 'autoload':{'filetypes':['ruby']}}
  NeoBundleLazy 'tpope/vim-bundler',       { 'autoload':{'filetypes':['ruby']}}
  NeoBundleLazy 'tpope/vim-rails',         { 'autoload':{'filetypes':['ruby']}}

  " racket
  NeoBundleLazy 'wlangstroth/vim-racket',  {'autoload':{'filetypes':['racket','scheme']}}

  " clojure
  NeoBundleLazy 'guns/vim-clojure-static', { 'autoload':{'filetypes':['clojure']}}
  NeoBundleLazy 'paredit.vim',             { 'autoload':{'filetypes':['clojure','scheme','racket','lisp']}}
  NeoBundleLazy 'tpope/vim-fireplace',     { 'autoload':{'filetypes':['clojure']}}
  " NeoBundleLazy 'tpope/vim-classpath',     { 'autoload':{'filetypes':['clojure']}}

  " markup
  NeoBundleLazy 'Valloric/vim-instant-markdown', { 'autoload':{'filetypes':['markdown']}}
  NeoBundleLazy 'tpope/vim-markdown',        { 'autoload':{'filetypes':['markdown']}}

  " html/css
  NeoBundleLazy 'ap/vim-css-color',          { 'autoload': { 'filetypes':['css','scss','sass','less','styl']}}
  NeoBundleLazy 'cakebaker/scss-syntax.vim', { 'autoload': { 'filetypes':['scss','sass']}}
  NeoBundleLazy 'gregsexton/MatchTag',       { 'autoload': { 'filetypes':['html','xml']}}
  NeoBundleLazy 'groenewege/vim-less',       { 'autoload': { 'filetypes':['less']}}
  NeoBundleLazy 'hail2u/vim-css3-syntax',    { 'autoload': { 'filetypes':['css','scss','sass']}}
  NeoBundleLazy 'othree/html5.vim',          { 'autoload': { 'filetypes':['html']}}
  NeoBundleLazy 'tpope/vim-haml',            { 'autoload': { 'filetypes':['haml']}}

  " js
  NeoBundleLazy 'kchmck/vim-coffee-script',   { 'autoload': { 'filetypes':['coffee']}}
  NeoBundleLazy 'leafgarland/typescript-vim', { 'autoload': { 'filetypes':['typescript']}}
  NeoBundleLazy 'leshill/vim-json',           { 'autoload': { 'filetypes':['javascript','json']}}
  NeoBundleLazy 'maksimr/vim-jsbeautify',     { 'autoload': { 'filetypes':['javascript']}}
  NeoBundleLazy 'mmalecki/vim-node.js',       { 'autoload': { 'filetypes':['javascript']}}
  NeoBundleLazy 'pangloss/vim-javascript',    { 'autoload': { 'filetypes':['javascript']}}
  NeoBundleLazy 'othree/javascript-libraries-syntax.vim', { 'autoload': { 'filetypes':['javascript','coffee','typescript']}}

  " random
  NeoBundle     'bccalc.vim'                                                     " inline calc
  NeoBundleLazy 'JuliaLang/julia-vim',  { 'autoload': { 'filetypes':['julia']}}  " julia
  NeoBundleLazy 'a.vim',                { 'autoload': { 'filetypes':['c']}}      " c
  NeoBundleLazy 'def-lkb/ocp-indent',   { 'autoload': { 'filetypes':['sml']}}    " sml
  NeoBundleLazy 'derekwyatt/vim-scala', { 'autoload': { 'filetypes':['scala']}}  " scala
  NeoBundleLazy 'jimenezrick/vimerl',   { 'autoload': { 'filetypes':['erlang']}} " erlang
  NeoBundleLazy 'jnwhiteh/vim-golang',  { 'autoload': { 'filetypes':['go']}}     " go
  NeoBundleLazy 'salinasv/vim-vhdl',    { 'autoload': { 'filetypes':['vhdl']}}   " vhdl

" THEMES

  NeoBundle 'altercation/vim-colors-solarized'


" ----------------------------------------------------------------------------
" SETTINGS
" ----------------------------------------------------------------------------
  set autoread               " updates buffer when file is changed outside of vim
  set encoding=utf-8
  set fileformats=unix,dos,mac  " detects unix, dos, mac file formats in that order
  set hidden                 " allows switching buffers without saving first
  set modeline               " allows addition of a vim modeline to the bottom of a file
  set modelines=1            " only checks the last line for a modeline
  set shell=/bin/bash        " the shell to run for !commands
  set spelllang=en_us        " English bitches!
  set timeoutlen=300         " time to wait between keypresses on mappings
  set ttimeoutlen=50         " sets the keycode delay, eliminates delays on ESC presses
  set ttyfast                " set this for modern terminals, improves smoothness of redrawing
  set winaltkeys=no          " turn off the Alt key bindings in the gui menu

  " fix clipboard in osx/tmux
  if exists('$TMUX')
    set clipboard=
  else
    set clipboard=unnamed
  end

" TEXT FORMATTING/INDENTATION

  set autoindent             " copy indent from current line when starting new one
  set cindent                " smart indent for C like languages
  set copyindent             " copy indentation chars from previous line
  set expandtab              " expand tabs to spaces
  set formatoptions+=tcroqn  " autoformats text correctly during Q
  set nowrap                 " do not wrap lines visually
  set shiftwidth=2
  set smartindent            " smart indentation for non C languages
  set smarttab               " only insert blanks up to shiftwidth
  set softtabstop=2
  set tabstop=2              " two spaces per tab
  set virtualedit=all        " place cursor where there is no text
  set backspace=2            " allow backspacing over everything in insert mode

"  UI

  set ch=2                   " command line height
  set cmdheight=2            " number of screen lines to use for the command line
  set laststatus=2           " always show the status line
  set lazyredraw             " do not update screen when running macros
  set nofoldenable           " fuck folds
  set noshowcmd              " don't display incomplete commands
  set nostartofline          " don't jump to the start of line when scrolling
  set number                 " line numbers
  set pumheight=15           " maximum number of items to show in completion menu
  set report=0               " always provide a report message for commands
  set ruler                  " show cursor position in status bar
  set scrolloff=3            " # of lines to keep above and below cursor when scrolling
  set shortmess=aI           " avoid the "hit enter to continue" messages
  set showcmd                " show typed command in status bar
  set showmode               " show mode in status bar (insert, replace, etc)
  set statusline=[%n]\ %<%f%m%r\ %w\ %y\ \ <%{&fileformat}>%=[%o]\ %l,%c%V\/%L\ \ %P
  set title                  " show file in titlebar
  set titlestring=VIM:\ %-25.55F\ %a%r%m titlelen=70
  set wildmenu               " enhances command line completion

  " When you type the first tab, it will provide a list and complete as much
  " as possible, the third and subsequent tabs will cycle through completion
  " options so you can complete the file without further keys
  "
  set wildmode=list:longest,full
  set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
  set wildignore+=*.swp,*~,._*
  set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
  set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*,*/tmp/*
  set wildcharm=<C-z>        " wildchar to use inside a macro

" VISUAL CUES / SEARCH

  set gdefault               " search/replace is global by default
  set hlsearch               " highlight search matches
  set ignorecase             " ignore case during searches
  set incsearch              " incremental search
  set matchtime=5            " duration to show matching brace (1/10 sec)
  set showmatch              " show matching parentheses
  set smartcase              " ovverride ignore case if pattern has upcase
  " set cursorline             " hightlight the line that the cursor is on (slow)

" SOUND

  set noerrorbells           " don't ring any bells
  set novisualbell           " i mean it!
  set t_vb=                  " fucking seriously!

" MOUSE

  set mouse=a                " enable mouse
  set mousehide              " hide mouse when typing
  set mousef                 " allows the mouse to change the position of the cursor

" COMPLETION

  set complete=.,w,b,u,t,i
  set completeopt=menu,menuone,longest

" GUI

if has('gui_running')
    set lines=999 columns=9999 " open maximized

    " With this, the gui (gvim and macvim) now doesn't have the toolbar, the
    " left and right scrollbars and the menu.
    set guioptions-=T
    set guioptions-=l
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R
    set guioptions-=m
    set guioptions-=M

    set guicursor+=a:blinkon0
    set guifont=Source_Code_Pro_For_Powerline:h12
    set transparency=0
endif

" HISTORY/BACKUPS

  set tags=.git/tags,tags,~/.vim/.cache/tags  " places to check for tags
  set history=1000                            " command line history

  set nobackup                                " do not keep backups after close
  set backupdir=~/.vim/.cache/backup

  set noswapfile                              " dont keep buffer in a swapfile
  set directory=~/.vim/.cache/swap            " swapfile directory

  " set undofile                                " keeps undo history around after file is closed
  " set undodir=~/.vim/.cache/undo
  set undolevels=1000                         " number of forgivable mistakes
  set updatecount=100                         " write undo file to disk every 100 chars

  set errorfile=/tmp/vim.errors.log           " where VIM yells at you

  " used to remember information after vim quits remember copy registers after
  " quitting, 20 jump marks and regs up to 500 lines
  set viminfo='20,\"500

  function! EnsureExists(path)
    if !isdirectory(expand(a:path))
      call mkdir(expand(a:path))
    endif
  endfunction

  " create all necessary directories
  "
  call EnsureExists('~/.vim/.cache')
  call EnsureExists(&backupdir)
  call EnsureExists(&directory)
  call EnsureExists(&undodir)

" COLORS/THEME/VISUAL

  highlight Comment ctermfg=DarkGrey guifg=#444444
  highlight CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
  highlight CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
  highlight IncSearch guibg=white guifg=black
  highlight Normal guibg=black guifg=white
  highlight Pmenu ctermbg=238 gui=bold      " improve autocomplete menu color
  highlight Search guibg=white guifg=black
  highlight SpecialKey ctermfg=DarkGray ctermbg=Black
  highlight StatusLine guifg=#00ff00 guibg=#000000
  highlight StatusLineNC guifg=#ff0000 guibg=#000000

  " how whitespace is displayed
  set listchars=tab:»·,trail:·,eol:¬
  set listchars+=extends:>
  set listchars+=precedes:<

  set background=dark
  colorscheme solarized

" EDITING / NAVIGATION

  " vim-gnome must be installed to acess the X cliboard
  set pastetoggle=<F6>       " toggle paste mode, turn off auto indentation
  set iskeyword+=_,$,@,%,#   " none of these should be word dividers, so make them not be

  " jump to last position of buffer when opening
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

" WINDOWS, TABS and BUFFERS

  set splitright  " split vertically to the right
  set splitbelow  " split horizontally below
  set equalalways " resize windows equally after splits or deletion

" FUNCTIONS / COMMANDS

  " strip all trailing whitespace in file
  function! StripWhitespace ()
    exec ':%s/ \+$//gc'
  endfunction

  " finds existing vim session
  function! Make_session_finder (filename)
      exec 'nnoremap ss :!terminal_promote_vim_session ' . a:filename . '<CR>:q!<CR>'
  endfunction

  com! FormatJSON %!python -m json.tool

"  AUTOCOMMANDS

" enable brace matching
  runtime! macros/matchit.vim

" Language autocmds
  command! FR set filetype=ruby
  au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"
  au BufRead,BufNewFile *Makefile* set filetype=make
  au FileType c setlocal omnifunc=ClangComplete
  au FileType c setlocal cindent
  au FileType cpp setlocal omnifunc=ClangComplete
  au FileType cpp setlocal cindent
  au FileType ruby,eruby set omnifunc=rubycomplete#Complete
  au FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
  au FileType ruby,eruby let g:rubycomplete_rails = 1
  au FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
  au FileType css setlocal omnifunc=csscomplete#CompleteCSS
  au FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  au FileType python setlocal omnifunc=pythoncomplete#Complete
  au FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  au FileType javascript set omnifunc=javascriptcomplete#CompleteJS
  au FileType markdown,vim let b:loaded_delimitMate=1
  au FileType css set omnifunc=csscomplete#CompleteCSS
  au FileType xml set omnifunc=xmlcomplete#CompleteTags
  au BufNewFile,BufRead *.csv setf csv
  au BufReadPost *.rkt,*.rktl set filetype=racket
  au filetype racket set lisp
  au filetype racket set autoindent

  " delete trailing DOS-returns and whitespace on file open and write.
  augroup vimrc
    autocmd BufRead,BufWritePre,FileWritePre * silent! %s/[\r \t]\+$//
  augroup END

  " auto set read only mode when another vim session opens an already open file
  augroup NoSimultaneousEdits
    autocmd!
    autocmd SwapExists *  let v:swapchoice = 'o'
    autocmd SwapExists *  echohl ErrorMsg
    autocmd SwapExists *  echo 'Duplicate edit session (readonly)'
    autocmd SwapExists *  echohl None
    autocmd SwapExists *  call Make_session_finder( expand('<afile>') )
    autocmd SwapExists *  sleep 2
  augroup END

  " rainbow parens
  au VimEnter * RainbowParenthesesToggle
  au Syntax   * RainbowParenthesesLoadRound
  au Syntax   * RainbowParenthesesLoadSquare
  au Syntax   * RainbowParenthesesLoadBraces


" ----------------------------------------------------------------------------
" PACKAGE SETTINGS
" ----------------------------------------------------------------------------

" A.VIM

  nnoremap <Leader>aa :A<CR>
  nnoremap <Leader>as :AS<CR>
  nnoremap <Leader>av :AV<CR>
  nnoremap <Leader>an :AN<CR>

" ACK

  nnoremap <Leader>ac :Ack

" BCCALC

  vnoremap <Leader>cc "eyy:call CalcLines(1)"<CR>
  noremap  <Leader>cc "eyy:call CalcLines(0)"<CR>

" CTRLP

  let g:ctrlp_working_path_mode = 'ra'
  let g:ctrlp_open_multiple_files = '1vir'
  let g:ctrlp_clear_cache_on_exit=1
  let g:ctrlp_max_height=40
  let g:ctrlp_show_hidden=0
  let g:ctrlp_follow_symlinks=1
  let g:ctrlp_working_path_mode=0
  let g:ctrlp_max_files=20000
  let g:ctrlp_cache_dir='~/.vim/.cache/ctrlp'
  let g:ctrlp_extensions=['funky']
  let g:ctrlp_map = '<nop>'

  nnoremap <Leader>ff :CtrlP<CR>
  nnoremap <Leader>fb :CtrlPBuffer<CR>
  nnoremap <Leader>fm :CtrlPMixed<CR>
  " nnoremap [ctrlp]t :CtrlPBufTag<cr>
  " nnoremap [ctrlp]T :CtrlPTag<cr>
  " nnoremap [ctrlp]l :CtrlPLine<cr>
  " nnoremap [ctrlp]o :CtrlPFunky<cr>

" DELIMITMATE

  let g:delimitMate_expand_space = 1
  let g:delimitMate_balance_matchpairs = 1

" EASYGREP

  let g:EasyGrepRecursive=1
  let g:EasyGrepAllOptionsInExplorer=1
  let g:EasyGrepCommand=1

  nnoremap <leader>eg :GrepOptions<cr>

" EASYMOTION

  let g:EasyMotion_keys = 'asdfghjklqwertyuiopzxcvbnm'
  autocmd ColorScheme * highlight EasyMotionTarget ctermfg=32 guifg=#0087df
  autocmd ColorScheme * highlight EasyMotionShade ctermfg=237 guifg=#3a3a3a

" EASYTAGS / CTAGS / CSCOPE

  let g:easytags_file = '~/.vim/.cache/tags'
  let g:easytags_auto_update = 0
  let g:easytags_updatetime_min = 2000
  let g:easytags_python_enabled = 1
  let g:easytags_resolve_links = 1
  let g:easytags_dynamic_files = 2  " write tags to current dir

  cnoreabbrev csa cs add
  cnoreabbrev csf cs find
  cnoreabbrev csk cs kill
  cnoreabbrev csr cs reset
  cnoreabbrev css cs show
  cnoreabbrev csh cs help

  map <Leader>tu :UpdateTags -R `pwd`<CR>
  map <Leader>tsu :!cscope -bR<CR><CR>
  set cscopetag cscopeverbose
  set cscopequickfix=s-,c-,d-,i-,t-,e-

" GIST

  let g:gist_clip_command = 'pbcopy'
  let g:gist_detect_filetype = 1
  let g:gist_open_browser_after_post = 1
  let g:gist_post_private=1
  let g:gist_show_privates=1

" INSTANT-MARKDOWN

  let g:instant_markdown_slow = 1

" JS-BEAUTIFY

  nnoremap <leader>fjs :call JsBeautify()<cr>

" MRU

  nnoremap <C-O> :MRU<cr>

" NEOBUNDLE

  nnoremap <Leader>bi :NeoBundleInstall<CR>
  nnoremap <Leader>bc :NeoBundleClean<CR>
  nnoremap <leader>nbu :Unite neobundle/update -vertical -no-start-insert<cr>

" NERDTREE

  let NERDChristmasTree = 1
  let NERDTreeHighlightCursorline = 1
  let NERDTreeShowBookmarks = 1
  let NERDTreeShowHidden = 1
  let NERDTreeWinSize = 50
  let NERDTreeQuitOnOpen=0
  let NERDTreeShowLineNumbers=1
  let NERDTreeChDirMode=0
  let NERDTreeShowBookmarks=1
  let NERDTreeIgnore=['\.git','\.hg']
  let NERDTreeBookmarksFile='~/.vim/.cache/NERDTreeBookmarks'

  nnoremap <C-e> :NERDTreeToggle<CR>
  nnoremap <C-f> :NERDTreeFind<CR>

" RAINBOW PARENS

  let g:rbpt_colorpairs = [
      \ ['brown',       'RoyalBlue3'],
      \ ['Darkblue',    'SeaGreen3'],
      \ ['darkgray',    'DarkOrchid3'],
      \ ['darkgreen',   'firebrick3'],
      \ ['darkcyan',    'RoyalBlue3'],
      \ ['darkred',     'SeaGreen3'],
      \ ['darkmagenta', 'DarkOrchid3'],
      \ ['brown',       'firebrick3'],
      \ ['gray',        'RoyalBlue3'],
      \ ['darkmagenta', 'DarkOrchid3'],
      \ ['Darkblue',    'firebrick3'],
      \ ['darkgreen',   'RoyalBlue3'],
      \ ['darkcyan',    'SeaGreen3'],
      \ ['darkred',     'DarkOrchid3'],
      \ ['red',         'firebrick3'],
      \ ]

" RUBY RUNNER

  nnoremap <leader>rr :call :RunRuby<CR>

" SILVER-SEARCHER

  map <leader>ag :Ag!<space><<C-R><C-W>\><CR>

" SYNTASTIC

  let g:syntastic_error_symbol = '✗'
  let g:syntastic_style_error_symbol = '✠'
  let g:syntastic_warning_symbol = '∆'
  let g:syntastic_style_warning_symbol = '≈'

  let g:syntastic_auto_loc_list=1
  let g:syntastic_enable_signs=1
  let g:syntastic_enable_highlighting=1
  " let g:syntastic_quiet_warnings=1
  let g:syntastic_auto_jump=1
  let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
  let g:syntastic_cpp_check_header = 1
  let g:syntastic_cpp_compiler_options=' -I../src -I./src -I./include -I../include'
  " let g:syntastic_mode_map = { 'passive_filetypes': ['scala','ml','sml','ocaml'] }

  set statusline+=%#warningmsg#
  " set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*

" TABULAR

  nnoremap <Leader>a& :Tabularize /&<CR>
  vnoremap <Leader>a& :Tabularize /&<CR>
  nnoremap <Leader>a= :Tabularize /=<CR>
  vnoremap <Leader>a= :Tabularize /=<CR>
  nnoremap <Leader>a: :Tabularize /:<CR>
  vnoremap <Leader>a: :Tabularize /:<CR>
  nnoremap <Leader>a:: :Tabularize /:\zs<CR>
  vnoremap <Leader>a:: :Tabularize /:\zs<CR>
  nnoremap <Leader>a, :Tabularize /,<CR>
  vnoremap <Leader>a, :Tabularize /,<CR>
  nnoremap <Leader>a<Bar> :Tabularize /<Bar><CR>
  vnoremap <Leader>a<Bar> :Tabularize /<Bar><CR>

" TAGBAR

  nnoremap <C-T> :TagbarToggle<CR>
  map <C-\> :tnext<CR>
  let g:tagbar_left = 1

" TCOMMENT

  noremap ,c<Space> <C-_><C-_>
  vnoremap ,c<Space> <C-_><C-_>

" TSLIME

  let g:tmux_sessionname = 0
  let g:tmux_windowname = 1
  let g:tmux_panenumber = 2
  nnoremap <leader><CR> V"ty:call Send_to_Tmux(@t)<CR>
  vnoremap <leader><CR> "ty:call Send_to_Tmux(@t)<CR>
  nnoremap <leader>tv :call Tmux_Vars()<CR>

" UNDOTREE

  nnoremap <C-g> :UndotreeToggle<CR>
  let g:undotree_SetFocusWhenToggle=1

" UNITE

  " let bundle = neobundle#get('unite.vim')
  " function! bundle.hooks.on_source(bundle)
  "   call unite#filters#matcher_default#use(['matcher_fuzzy'])
  "   call unite#filters#sorter_default#use(['sorter_rank'])
  "   call unite#set_profile('files', 'smartcase', 1)
  "   call unite#custom#source('line,outline','matchers','matcher_fuzzy')
  " endfunction

  " " let g:unite_enable_start_insert=1
  " let g:unite_data_directory='~/.vim/.cache/unite'
  " let g:unite_source_history_yank_enable=1
  " let g:unite_source_rec_max_cache_files=5000
  " let g:unite_prompt='» '

  " if executable('ag')
  "   let g:unite_source_grep_command='ag'
  "   let g:unite_source_grep_default_opts='--nocolor --nogroup --hidden'
  "   let g:unite_source_grep_recursive_opt=''
  " elseif executable('ack')
  "   let g:unite_source_grep_command='ack'
  "   let g:unite_source_grep_default_opts='--no-heading --no-color -a'
  "   let g:unite_source_grep_recursive_opt=''
  " endif

  " function! s:unite_settings()
  "   nnoremap <buffer> Q <plug>(unite_exit)
  "   nnoremap <buffer> <esc> <plug>(unite_exit)
  "   inoremap <buffer> <esc> <plug>(unite_exit)
  " endfunction
  " autocmd FileType unite call s:unite_settings()

  " nnoremap <space> [unite]
  " nnoremap [unite] <nop>

  " nnoremap <silent> [unite]/ :<C-u>Unite -no-quit -buffer-name=search grep:.<cr>
  " nnoremap <silent> [unite]f :<C-u>Unite -toggle -auto-resize -buffer-name=files file_rec/async<cr><c-u>
  " nnoremap <silent> [unite]b :<C-u>Unite -auto-resize -buffer-name=buffers buffer<cr>
  " nnoremap <silent> [unite]y :<C-u>Unite -buffer-name=yanks history/yank<cr>
  " nnoremap <silent> [unite]l :<C-u>Unite -auto-resize -buffer-name=line line<cr>
  " nnoremap <silent> [unite]m :<C-u>Unite -auto-resize -buffer-name=mappings mapping<cr>
  " nnoremap <silent> [unite]s :<C-u>Unite -quick-match buffer<cr>
  " nnoremap <silent> [unite]t :<C-u>Unite -auto-resize -buffer-name=tags tags tags/file<cr>
  " nnoremap <silent> [unite]o :<C-u>Unite -auto-resize -buffer-name=outline outline<cr>
  " nnoremap <silent> [unite]<space> :<C-u>Unite -toggle -auto-resize -buffer-name=mixed file_rec/async buffer file_mru bookmark<cr><c-u>

" UTILSNIPS

  " let g:UltiSnipsExpandTrigger="<c-tab>"
  " let g:UltiSnipsListSnippets="<c-s-tab>"
  let g:UltiSnipsExpandTrigger="<tab>"
  let g:UltiSnipsJumpForwardTrigger="<tab>"
  let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
  let g:UltiSnipsSnippetsDir='~/.vim/snippets'

" VIM-AIRLINE

  let g:airline#extensions#tabline#enabled = 1
  let g:airline_powerline_fonts = 1

" VIM-AUTO-SAVE

  let g:auto_save = 1

" VIM-CLOJURE-STATIC

  let g:clojure_align_multiline_strings = 0

" VIM-DRAGVISUALS

  vnoremap  <expr>  <C-h>   DVB_Drag('left')
  vnoremap  <expr>  <C-l>   DVB_Drag('right')
  vnoremap  <expr>  <C-j>   DVB_Drag('down')
  vnoremap  <expr>  <C-k>   DVB_Drag('up')
  vnoremap  <expr>  D       DVB_Duplicate()


" VIM-EXPAND-REGION

  " vnoremap K <Plug>(expand_region_expand)
  " vnoremap J <Plug>(expand_region_shrink)

" VIMFUGITIVE

  nnoremap <silent> <leader>gs :Gstatus<CR>
  nnoremap <silent> <leader>gd :Gdiff<CR>
  nnoremap <silent> <leader>gc :Gcommit<CR>
  nnoremap <silent> <leader>gb :Gblame<CR>
  nnoremap <silent> <leader>gl :Glog<CR>
  nnoremap <silent> <leader>gp :Git push<CR>
  nnoremap <silent> <leader>gw :Gwrite<CR>
  nnoremap <silent> <leader>gr :Gremove<CR>
  autocmd FileType gitcommit nnoremap <buffer> U :Git checkout -- <C-r><C-g><CR>
  autocmd BufReadPost fugitive://* set bufhidden=delete

  " gitv extension
  nnoremap <silent> <leader>gv :Gitv<CR>
  nnoremap <silent> <leader>gV :Gitv!<CR>

" VIM-INDENT-GUIDES

  let g:indent_guides_start_level=1
  let g:indent_guides_guide_size=1
  let g:indent_guides_enable_on_vim_startup=0
  let g:indent_guides_color_change_percent=3
  if !has('gui_running')
    let g:indent_guides_auto_colors=0
    function! s:indent_set_console_colors()
      hi IndentGuidesOdd ctermbg=235
      hi IndentGuidesEven ctermbg=236
    endfunction
    autocmd VimEnter,Colorscheme * call s:indent_set_console_colors()
  endif

" VIM-RUBY-XMPFILTER

  nnoremap <buffer> <F5> <Plug>(xmpfilter-run)
  xnoremap <buffer> <F5> <Plug>(xmpfilter-run)
  inoremap <buffer> <F5> <Plug>(xmpfilter-run)

  nnoremap <buffer> <F4> <Plug>(xmpfilter-mark)
  xnoremap <buffer> <F4> <Plug>(xmpfilter-mark)
  inoremap <buffer> <F4> <Plug>(xmpfilter-mark))

" VIM-SESSION

  let g:session_autoload = 'no'
  let g:session_autosave = 'no'

  nnoremap <Leader>ss :SaveSession<CR>
  nnoremap <Leader>so :OpenSession<CR>
  nnoremap <Leader>sc :CloseSession<CR>
  nnoremap <Leader>sd :DeleteSession<CR>
  nnoremap <Leader>sv :ViewSession<CR>

" VIMSHELL

  " nnoremap <leader>cmd :VimShell -split<CR>

  " if s:is_macvim
  "   let g:vimshell_editor_command='mvim'
  " else
  "   let g:vimshell_editor_command='vim'
  " endif

  " let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
	" let g:vimshell_right_prompt = 'vcs#info("(%s)-[%b]", "(%s)-[%b|%a]")'
	" let g:vimshell_enable_smart_case = 1
  " let g:vimshell_prompt = $USER."% "
  " let g:vimshell_temporary_directory='~/.vim/.cache/vimshell'
  " let g:vimshell_vimshrc_path='~/.vim/vimshrc'

	" autocmd FileType vimshell
	"  call vimshell#altercmd#define('g', 'git')
	" \| call vimshell#altercmd#define('i', 'iexe')
	" \| call vimshell#altercmd#define('l', 'll')
	" \| call vimshell#altercmd#define('ll', 'ls -l')

" VIM-SIGNATURE

  " nnoremap K [`
  " nnoremap J ]`

" VIM-SIGNIFY

  let g:signify_disable_by_default = 1
  let g:signify_mapping_toggle_highlight = '<leader>gh'
  let g:signify_mapping_toggle = '<leader>gt'

" YOUCOMPLETEME

  let g:EclimCompletionMethod = 'omnifunc'
  let g:ycm_complete_in_comments_and_strings=1
  let g:ycm_autoclose_preview_window_after_completion=1
  let g:ycm_filetype_blacklist = {
    \ 'notes': 1,
    \ 'markdown': 1,
    \ 'text': 1,
    \ 'unite': 1,
    \ }

" ZOOMWIN

  map <leader>zz :ZoomWin<CR>


" ----------------------------------------------------------------------------
" KEYMAPPINGS
" ----------------------------------------------------------------------------
" TODO: work out sensible leader system

" GENERAL

  let mapleader = ","
  let g:mapleader=","
  vnoremap . :norm.<cr>

  " remap semicolon to colon
  nnoremap ; :
  vnoremap ; :

  "" Keep search matches in the middle of the window.
  " zz centers the screen on the cursor, zv unfolds any fold if the cursor
  " suddenly appears inside a fold.
  nnoremap * *zzzv
  nnoremap n nzzzv
  nnoremap N Nzzzv

  "" Also center the screen when jumping through the changelist
  nnoremap g; g;zz
  nnoremap g, g,zz

  "" Map the arrow keys to be based on display lines, not physical lines
  nnoremap j gj
  nnoremap k gk
  nnoremap <Down> gj
  nnoremap <Up> gk

  "" edit/reload vimrc
  nnoremap <leader>v :e ~/.vimrc<CR>
  nnoremap <leader>V :source ~/.vimrc<CR>

  "" turn on spellcheck
  nnoremap <silent> <leader>sp s:set spell!<CR>

  "" fast saving
  nnoremap <leader>ww :w !sudo tee %<CR>
  nnoremap <leader>w :w!<cr>

  "" for faster scrolling
  nnoremap <C-f> 15gj
  nnoremap <C-b> 15gk


" VISUAL CUES / SEARCH

  " highlight cursor column
  nnoremap <Leader>hc :set cursorcolumn!<CR>

  "" Make vaa select the entire file...
  vnoremap aa VGo1G

  "" Make BS/DEL delete in visual mode
  vnoremap <BS> x

  "" Visual Block mode is more useful than Visual mode, swap v and C-v
  nnoremap v <C-V>
  nnoremap <C-V> v
  vnoremap v <C-V>
  vnoremap <C-V> v

  "" Toggle hlsearch with <leader>hs
  nnoremap <leader>hs :set hlsearch! hlsearch?<CR>

  "" find merge conflict markers
  nnoremap <silent> <leader>hm <ESC>/\v^[<=>]{7}( .*\|$)<CR>

  "" set text wrapping toggles
  nnoremap <silent> <leader>tw :set invwrap<CR>:set wrap?<CR>


" SYMBOL LOOKUP

  "" call :help for word under cursor
  noremap <leader>h "zyiw:exe "h ".@z.""<CR>

  "" g<c-]> is jump to tag if there's only one matching tag,
  "but show list of options when there is more than one definition
  nnoremap <leader>go g<c-]>


" EDITING

  "" upper/lower word
  nnoremap <leader>U mQviwU`Q
  nnoremap <leader>L mQviwu`Q

  "" upper/lower first char of word
  nnoremap <leader>C mQgewvU`Q
  nnoremap <leader>N mQgewvu`Q

  "" underscore/camelcase
  noremap + /\$\w\+_<CR>
  noremap _ f_x~

  "" Some helpers to edit mode
  cnoremap %% <C-R>=expand('%:h').'/'<cr>
  noremap <leader>ew :e %%         " open file in current path
  noremap <leader>es :sp %%        " open file for h split
  noremap <leader>ev :vsp %%       " open file for vsplit
  noremap <leader>cd :cd %:p:h<cr> " switch to the directory

  "" swap two words
  nnoremap <silent> sw :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`'

  "" Underline the current line with '='
  nnoremap <silent> <leader>ul :t.\|s/./=/g\|:nohls<cr>

  " show whitespace
  nnoremap <Leader>ws :set list!<CR>

  " strip all trailing whitespace
  noremap <leader>wt :call StripWhitespace ()<CR>

  "" reflow paragraph with Q in normal and visual mode
  nnoremap Q gqap
  vnoremap Q gq

  "" Dont exit visual mode when shifting code
  vnoremap < <gv
  vnoremap > >gv


" WINDOWS / NAVIGATION

  "" Adjust viewports to the same size
  noremap <Leader>= <C-w>=

  "" Switches to the previous buffer that was shown
  noremap <leader>p <c-^> :bd #<cr>

  "" This is quit all
  noremap <Leader>qa :wqa<cr>

  " rotates the orientation of all windows on screen
  nnoremap <leader>rv :windo wincmd H<CR>
  nnoremap <leader>rh :windo wincmd K<CR>

  "" Ctrl-HJKL keys move between windows
  nnoremap <C-h> <C-w>h
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  nnoremap <C-l> <C-w>l
  nnoremap <leader>wq <C-w>q

  "" splits and buffers
  nnoremap <leader>sh :split<CR>
  nnoremap <leader>sv :vsplit<CR>
  nnoremap <leader>shb :split<CR>:b <C-Z><C-Z>
  nnoremap <leader>svb :vsplit<CR>:b <C-Z><C-Z>
  nnoremap <C-p> :bprev<CR>
  nnoremap <C-n> :bnext<CR>
  nnoremap <C-x> :BW<CR>

" ----------------------------------------------------------------------------
" FINISH STARTUP
" ----------------------------------------------------------------------------

  filetype plugin indent on  " don't move/change this line
  syntax on
  NeoBundleCheck             " check for new packages
