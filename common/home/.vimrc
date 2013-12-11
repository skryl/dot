  set nocompatible
  let s:is_windows = has('win32') || has('win64')
  let s:is_cygwin = has('win32unix')
  let s:is_macvim = has('gui_macvim')

" ----------------------------------------------------------------------------
" NEOBUNDLE
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

" DROP?


" THEMES

  NeoBundle 'altercation/vim-colors-solarized'

" FUNCTIONALITY

  NeoBundle     '907th/vim-auto-save'
  NeoBundle     'Lokaltog/vim-easymotion'
  NeoBundle     'Raimondi/delimitMate'
  NeoBundle     'Rename'
  NeoBundle     'SirVer/ultisnips'
  NeoBundle     'Valloric/ListToggle'
  NeoBundle     'Valloric/MatchTagAlways'
  NeoBundle     'Valloric/YouCompleteMe'
  NeoBundle     'ZoomWin'
  NeoBundle     'bling/vim-airline'
  NeoBundle     'bufkill.vim'
  NeoBundle     'dahu/vim-fanfingtastic'
  NeoBundle     'epmatsw/ag.vim'
  NeoBundle     'godlygeek/tabular'
  NeoBundle     'kien/rainbow_parentheses.vim'
  NeoBundle     'kshenoy/vim-signature'
  NeoBundle     'matthias-guenther/hammer.vim'
  NeoBundle     'michaeljsmith/vim-indent-object'
  NeoBundle     'mileszs/ack.vim'
  NeoBundle     'nathanaelkane/vim-indent-guides'
  NeoBundle     'scrooloose/syntastic'
  NeoBundle     'skryl/tslime.vim'
  NeoBundle     'terryma/vim-expand-region'
  NeoBundle     'tomtom/tcomment_vim'
  NeoBundle     'tpope/vim-repeat'
  NeoBundle     'tpope/vim-surround'
  NeoBundle     'tpope/vim-unimpaired'
  NeoBundleLazy 'EasyGrep',            {'autoload':{'commands':'GrepOptions'}}
  NeoBundle     'kien/ctrlp.vim',      { 'depends': 'tacahiroy/ctrlp-funky' }
  NeoBundle     'xolox/vim-easytags',  { 'depends': 'xolox/vim-misc' }
  NeoBundle     'xolox/vim-session',   { 'depends': 'xolox/vim-misc' }
  NeoBundleLazy 'Shougo/vimshell.vim', { 'autoload':{'commands':'VimShell'}}
  NeoBundleLazy 'majutsushi/tagbar',   { 'autoload':{'commands':'TagbarToggle'}}
  NeoBundleLazy 'mattn/gist-vim',      { 'autoload':{'commands':'Gist' }, 'depends': 'mattn/webapi-vim'}
  NeoBundleLazy 'mbbill/undotree',     { 'autoload':{'commands':'UndotreeToggle'}}
  NeoBundleLazy 'scrooloose/nerdtree', { 'autoload':{'commands':['NERDTreeToggle','NERDTreeFind']}}
  NeoBundleLazy 'tpope/vim-endwise',   { 'autoload':{'filetypes':['lua','ruby','sh','zsh','vb','vbnet','aspvbs','vim','c','cpp','xdefaults']}}

" UNITE

  NeoBundleLazy 'Shougo/unite-outline',      { 'autoload': { 'unite_sources':'outline'}}
  NeoBundleLazy 'Shougo/unite.vim',          { 'autoload': { 'commands':'Unite', 'insert': 1}}
  NeoBundleLazy 'ujihisa/unite-colorscheme', { 'autoload': { 'unite_sources':'colorscheme'}}

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

" ----------------------------------------------------------------------------
" GENERAL
" ----------------------------------------------------------------------------
  set encoding=utf-8
  set fileformat=unix
  set fileformats=unix,dos,mac  " detects unix, dos, mac file formats in that order
  set nrformats-=octal
  set ruler              " show cursor position in status bar
  set cmdheight=2        " number of screen lines to use for the command line
  set shortmess=a        " avoid the "hit enter to continue" messages
  set title              " show file in titlebar
  set titlestring=VIM:\ %-25.55F\ %a%r%m titlelen=70
  set ttyfast
  set autoread
  set timeoutlen=300
  set ttimeoutlen=50
  set modeline
  set modelines=1
  set hidden             " allows switching buffers without saving first
  let mapleader = ","
  let g:mapleader=","
  vnoremap . :norm.<cr>
  if exists('$TMUX')
    set clipboard=
  else
    set clipboard=unnamed
  end
  set errorfile=/tmp/vim.errors.log
  set shell=/bin/bash

 " this makes sure that shell scripts are highlighted
 " as bash scripts and not sh scripts
  let g:is_posix = 1

" ----------------------------------------------------------------------------
" TEXT FORMATTING/INDENTATION
" ----------------------------------------------------------------------------
  set nowrap              " do not wrap lines"
  set textwidth=80
  set virtualedit=all     " place cursor where there is no text
  set expandtab           " expand tabs to spaces
  set nosmarttab          " fuck tabs
  set tabstop=2
  set softtabstop=2
  set shiftwidth=2
  set autoindent
  set copyindent
  set cindent
  set smartindent
  set formatoptions+=tcroqnj    " support for numbered/bullet lists and stuff

" ----------------------------------------------------------------------------
"  UI
" ----------------------------------------------------------------------------
  set ruler                  " show the cursor position all the time
  set noshowcmd              " don't display incomplete commands
  set lazyredraw             " turn off lazy redraw
  set number                 " line numbers
  set wildmenu               " turn on wild menu

  " When you type the first tab, it will complete as much as possible, the
  " second tab hit will provide a list, the third and subsequent tabs will
  " cycle through completion options so you can complete the file without
  " further keys
  set wildmode=list:longest,full

  set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
  set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
  set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*,*/tmp/*
  set wildignore+=*.swp,*~,._*
  set ch=2                   " command line height
  set backspace=2            " allow backspacing over everything in insert mode
  set report=0               " tell us about changes
  set nostartofline          " don't jump to the start of line when scrolling
  set showmode               " show mode in status bar (insert, replace, etc)
  set showcmd                " show typed command in status bar
  set scrolloff=3            " # of lines to keep above and below cursor when scrolling
  set pumheight=15
  set winaltkeys=no          " turn off the Alt key bindings in the gui menu

" sounds
  set noerrorbells
  set novisualbell
  set t_vb=

" folding
 " set foldmethod=syntax " kills autocomplete performance
 " set foldnestmax=3
 set nofoldenable

" mouse
  set mouse=a   " enable mouse
  set mousehide " hide mouse when typing
  set mousef    " allows the mouse the change the position of the cursor

" completion
  set complete=.,w,b,u,t,i

  " The "longest" option makes completion insert the longest prefix of all
  " the possible matches; see :h completeopt

  set completeopt=menu,menuone,longest
  " set wildchar=<Tab>
  set wildcharm=<C-z>
  set statusline=[%n]\ %<%f%m%r\ %w\ %y\ \ <%{&fileformat}>%=[%o]\ %l,%c%V\/%L\ \ %P
  set laststatus=2

" spelling
  set spelllang=en_us

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

" ----------------------------------------------------------------------------
" VISUAL CUES/SEARCH
" ----------------------------------------------------------------------------
  set showmatch   " show matching parentheses
  set matchtime=5       " duration to show matching brace (1/10 sec)
  set hlsearch    " highlight search matches
  set incsearch   " incremental search
  set gdefault    " searc/replace is global by default
  set ignorecase  " ignore case during searches
  set smartcase   " ovverride ignore case if pattern has upcase

  :hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
  :hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
  " :nnoremap <Leader>cc :set cursorcolumn!<CR>
  :nnoremap <Leader>ll :set list!<CR>
  set cursorline

" ---------------------------------------------------------------------------
" HISTORY/BACKUPS
" ---------------------------------------------------------------------------
  set tags=./.tags;,~/.vimtags
  set history=1000

  set nobackup                                " do not keep backups after close
  set backupdir=~/.vim/.cache/backup

  set noswapfile                              " do not keep backups after close
  set directory=~/.vim/.cache/swap            " swapfile directory

  set undofile           " stores undo state even when files are closed (in undodir)
  set undodir=~/.vim/.cache/undo

  set undolevels=1000                         " number of forgivable mistakes
  set updatecount=100                         " write swap file to disk every 100 chars

  set viminfo='20,\"500                        " remember copy registers after quitting in the .viminfo
                                              " 20 jump links and regs up to 500 lines

  function! EnsureExists(path)
    if !isdirectory(expand(a:path))
      call mkdir(expand(a:path))
    endif
  endfunction

  call EnsureExists('~/.vim/.cache')
  call EnsureExists(&backupdir)
  call EnsureExists(&directory)

" ---------------------------------------------------------------------------
" COLORS/THEME/VISUAL
" ---------------------------------------------------------------------------
  hi StatusLineNC guifg=#ff0000 guibg=#000000
  hi StatusLine guifg=#00ff00 guibg=#000000
  hi Comment ctermfg=DarkGrey guifg=#444444
  hi SpecialKey ctermfg=DarkGray ctermbg=Black
  hi Normal guibg=black guifg=white
  hi Search guibg=white guifg=black
  hi IncSearch guibg=white guifg=black
  set listchars=tab:»·,trail:·,eol:¬
  set listchars+=extends:>
  set listchars+=precedes:<
  "improve autocomplete menu color
  highlight Pmenu ctermbg=238 gui=bold
  " set t_Co=256
  set background=dark
  colorscheme solarized
  " let g:solarized_termcolors=256
  " colorscheme ir_black

" ----------------------------------------------------------------------------
" EDITING/NAVIGATION
" ----------------------------------------------------------------------------
  " make sure to install vim-gnome to enable access to X clipboard
  set pastetoggle=<F6>     " toggle paste mode, turn off auto indentation
  set iskeyword+=_,$,@,%,# " none of these should be word dividers, so make them not be

  " jump to last position of buffer when opening
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

" ---------------------------------------------------------------------------
" WINDOWS, TABS and BUFFERS
" ---------------------------------------------------------------------------
  set splitright  " split vertically to the right
  set splitbelow  " split horizontally below
  set equalalways " resize windows equally after splits or deletion

" ---------------------------------------------------------------------------
" FUNCTIONS
" ---------------------------------------------------------------------------
" Strip all trailing whitespace in file
  function! StripWhitespace ()
    exec ':%s/ \+$//gc'
  endfunction

  " Automatically delete trailing DOS-returns and whitespace on file open and
  " write.
  augroup vimrc
    autocmd BufRead,BufWritePre,FileWritePre * silent! %s/[\r \t]\+$//
  augroup END


" ----------------------------------------------------------------------------
"  SETTINGS
" ----------------------------------------------------------------------------
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

  " rainbow parens
  au VimEnter * RainbowParenthesesToggle
  au Syntax   * RainbowParenthesesLoadRound
  au Syntax   * RainbowParenthesesLoadSquare
  au Syntax   * RainbowParenthesesLoadBraces

" ----------------------------------------------------------------------------
" PLUGINS [deprecated]
" ----------------------------------------------------------------------------

" BUFTABS
  " let g:buftabs_only_basename=1

" MINIBUFEXPL
  " let g:miniBufExplSplitBelow = 0

" SIMPLEFOLD
  " let g:SimpleFold_use_subfolds = 0

" POWERLINE
  " let g:Powerline_symbols = 'fancy'

" VIM-INDENT-GUIDES
  " let g:indent_guides_start_level=1
  " let g:indent_guides_guide_size=1
  " let g:indent_guides_enable_on_vim_startup=0
  " let g:indent_guides_color_change_percent=3
  " if !has('gui_running')
  "   let g:indent_guides_auto_colors=0
  "   function! s:indent_set_console_colors()
  "     hi IndentGuidesOdd ctermbg=235
  "     hi IndentGuidesEven ctermbg=236
  "   endfunction
  "   autocmd VimEnter,Colorscheme * call s:indent_set_console_colors()
  " endif


" VIM-SIGNATURE
  " nmap K [`
  " nmap J ]`

" VIM-SIGNIFY
  " let g:signify_disable_by_default = 1
  " let g:signify_mapping_toggle_highlight = '<leader>gh'
  " let g:signify_mapping_toggle = '<leader>gt'

" ZOOMWIN
  " map <leader>zz :ZoomWin<CR>

" ----------------------------------------------------------------------------
" PLUGINS
" ----------------------------------------------------------------------------

" A.VIM
  nmap <Leader>aa :A<CR>
  nmap <Leader>as :AS<CR>
  nmap <Leader>av :AV<CR>
  nmap <Leader>an :AN<CR>

" ACK
  nmap <Leader>ac :Ack

" BCCALC
  vnoremap <Leader>cc "eyy:call CalcLines(1)<CR>"
  noremap  <Leader>cc "eyy:call CalcLines(0)<CR>"

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
  nmap <silent> <Leader>ff :CtrlP<CR>
  nmap <silent> <Leader>fb :CtrlPBuffer<CR>
  nmap <silent> <Leader>fm :CtrlPMixed<CR>

  " nmap \ [ctrlp]
  " nnoremap [ctrlp] <nop>

  " nnoremap [ctrlp]t :CtrlPBufTag<cr>
  " nnoremap [ctrlp]T :CtrlPTag<cr>
  " nnoremap [ctrlp]l :CtrlPLine<cr>
  " nnoremap [ctrlp]o :CtrlPFunky<cr>
  " nnoremap [ctrlp]b :CtrlPBuffer<cr>

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
  let g:easytags_updatetime_min = 2000
  let g:easytags_python_enabled = 1
  let g:easytags_auto_update = 0

  " map <Leader>tu :!ctags -R --extras=+f .<CR><CR>
  map <Leader>tu :UpdateTags -R `pwd`<CR>
  map <Leader>tsu :!cscope -bR<CR><CR>
  set cscopetag cscopeverbose
  set cscopequickfix=s-,c-,d-,i-,t-,e-

  cnoreabbrev csa cs add
  cnoreabbrev csf cs find
  cnoreabbrev csk cs kill
  cnoreabbrev csr cs reset
  cnoreabbrev css cs show
  cnoreabbrev csh cs help

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
  nmap <C-O> :MRU<cr>

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
  nmap <leader>rr :call :RunRuby<CR>

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
  let g:syntastic_quiet_warnings=1
  let g:syntastic_auto_jump=1
  let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
  let g:syntastic_cpp_check_header = 1
  let g:syntastic_cpp_compiler_options=' -I../src -I./src -I./include -I../include'
  let g:syntastic_mode_map = { 'passive_filetypes': ['scala','ml','sml','ocaml'] }

  set statusline+=%#warningmsg#
  " set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*

" TABULAR
  nmap <Leader>a& :Tabularize /&<CR>
  vmap <Leader>a& :Tabularize /&<CR>
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:<CR>
  vmap <Leader>a: :Tabularize /:<CR>
  nmap <Leader>a:: :Tabularize /:\zs<CR>
  vmap <Leader>a:: :Tabularize /:\zs<CR>
  nmap <Leader>a, :Tabularize /,<CR>
  vmap <Leader>a, :Tabularize /,<CR>
  nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
  vmap <Leader>a<Bar> :Tabularize /<Bar><CR>

" TAGBAR
  nmap <C-T> :TagbarToggle<CR>
  map <C-\> :tnext<CR>
  let g:tagbar_left = 1

" TCOMMENT
  nmap ,c<Space> <C-_><C-_>
  vmap ,c<Space> <C-_><C-_>

" TSLIME
  let g:tmux_sessionname = 0
  let g:tmux_windowname = 1
  let g:tmux_panenumber = 2
  nmap <leader><CR> V"ty:call Send_to_Tmux(@t)<CR>
  vmap <leader><CR> "ty:call Send_to_Tmux(@t)<CR>
  nmap <leader>tv :call Tmux_Vars()<CR>

" UNDOTREE
  nnoremap <C-g> :UndotreeToggle<CR>
  let g:undotree_SetFocusWhenToggle=1

" UNITE
  let bundle = neobundle#get('unite.vim')
  function! bundle.hooks.on_source(bundle)
    call unite#filters#matcher_default#use(['matcher_fuzzy'])
    call unite#filters#sorter_default#use(['sorter_rank'])
    call unite#set_profile('files', 'smartcase', 1)
    call unite#custom#source('line,outline','matchers','matcher_fuzzy')
  endfunction

  " let g:unite_enable_start_insert=1
  let g:unite_data_directory='~/.vim/.cache/unite'
  let g:unite_source_history_yank_enable=1
  let g:unite_source_rec_max_cache_files=5000
  let g:unite_prompt='» '

  if executable('ag')
    let g:unite_source_grep_command='ag'
    let g:unite_source_grep_default_opts='--nocolor --nogroup --hidden'
    let g:unite_source_grep_recursive_opt=''
  elseif executable('ack')
    let g:unite_source_grep_command='ack'
    let g:unite_source_grep_default_opts='--no-heading --no-color -a'
    let g:unite_source_grep_recursive_opt=''
  endif

  function! s:unite_settings()
    nmap <buffer> Q <plug>(unite_exit)
    nmap <buffer> <esc> <plug>(unite_exit)
    imap <buffer> <esc> <plug>(unite_exit)
  endfunction
  autocmd FileType unite call s:unite_settings()

  nmap <space> [unite]
  nnoremap [unite] <nop>

  nnoremap <silent> [unite]/ :<C-u>Unite -no-quit -buffer-name=search grep:.<cr>
  nnoremap <silent> [unite]f :<C-u>Unite -toggle -auto-resize -buffer-name=files file_rec/async<cr><c-u>
  nnoremap <silent> [unite]b :<C-u>Unite -auto-resize -buffer-name=buffers buffer<cr>
  nnoremap <silent> [unite]y :<C-u>Unite -buffer-name=yanks history/yank<cr>
  nnoremap <silent> [unite]l :<C-u>Unite -auto-resize -buffer-name=line line<cr>
  nnoremap <silent> [unite]m :<C-u>Unite -auto-resize -buffer-name=mappings mapping<cr>
  nnoremap <silent> [unite]s :<C-u>Unite -quick-match buffer<cr>
  nnoremap <silent> [unite]t :<C-u>Unite -auto-resize -buffer-name=tags tags tags/file<cr>
  nnoremap <silent> [unite]o :<C-u>Unite -auto-resize -buffer-name=outline outline<cr>
  nnoremap <silent> [unite]<space> :<C-u>Unite -toggle -auto-resize -buffer-name=mixed file_rec/async buffer file_mru bookmark<cr><c-u>

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

" VIM-EXPAND-REGION
  vmap K <Plug>(expand_region_expand)
  vmap J <Plug>(expand_region_shrink)

" VIMFUGITIVE
  nnoremap <silent> <leader>gs :Gstatus<CR>
  nnoremap <silent> <leader>gd :Gdiff<CR>
  nnoremap <silent> <leader>gc :Gcommit<CR>
  nnoremap <silent> <leader>gb :Gblame<CR>
  nnoremap <silent> <leader>gl :Glog<CR>
  nnoremap <silent> <leader>gp :Git push<CR>
  nnoremap <silent> <leader>gw :Gwrite<CR>
  nnoremap <silent> <leader>gr :Gremove<CR>
  autocmd FileType gitcommit nmap <buffer> U :Git checkout -- <C-r><C-g><CR>
  autocmd BufReadPost fugitive://* set bufhidden=delete
  " gitv extension
  nnoremap <silent> <leader>gv :Gitv<CR>
  nnoremap <silent> <leader>gV :Gitv!<CR>

" VIMSHELL
  nnoremap <leader>cmd :VimShell -split<CR>

  if s:is_macvim
    let g:vimshell_editor_command='mvim'
  else
    let g:vimshell_editor_command='vim'
  endif

  let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
	"let g:vimshell_right_prompt = 'vcs#info("(%s)-[%b]", "(%s)-[%b|%a]")'
	let g:vimshell_enable_smart_case = 1
  let g:vimshell_prompt = $USER."% "
  let g:vimshell_temporary_directory='~/.vim/.cache/vimshell'
  let g:vimshell_vimshrc_path='~/.vim/vimshrc'

	autocmd FileType vimshell
	\ call vimshell#altercmd#define('g', 'git')
	\| call vimshell#altercmd#define('i', 'iexe')
	\| call vimshell#altercmd#define('l', 'll')
	\| call vimshell#altercmd#define('ll', 'ls -l')

" VIM-RUBY-XMPFILTER
  nmap <buffer> <F5> <Plug>(xmpfilter-run)
  xmap <buffer> <F5> <Plug>(xmpfilter-run)
  imap <buffer> <F5> <Plug>(xmpfilter-run)

  nmap <buffer> <F4> <Plug>(xmpfilter-mark)
  xmap <buffer> <F4> <Plug>(xmpfilter-mark)
  imap <buffer> <F4> <Plug>(xmpfilter-mark))

" VIM-SESSION
  let g:session_autoload = 'no'
  let g:session_autosave = 'no'

  nmap <Leader>ss :SaveSession<CR>
  nmap <Leader>so :OpenSession<CR>
  nmap <Leader>sc :CloseSession<CR>
  nmap <Leader>sd :DeleteSession<CR>
  nmap <Leader>sv :ViewSession<CR>

" NEOBUNDLE
  nmap <Leader>bi :NeoBundleInstall<CR>
  nmap <Leader>bc :NeoBundleClean<CR>
  nnoremap <leader>nbu :Unite neobundle/update -vertical -no-start-insert<cr>

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

" ----------------------------------------------------------------------------
" KEYMAPPINGS
" ----------------------------------------------------------------------------

" command mode
nnoremap ; :
vnoremap ; :

" edit/reload vimrc
nnoremap <leader>v :e ~/.vimrc<CR>
nnoremap <leader>V :source ~/.vimrc<CR>

nmap <silent> <leader>sp s:set spell!<CR>

" g<c-]> is jump to tag if there's only one matching tag, but show list of
" options when there is more than one definition
nnoremap <leader>go g<c-]>

" Keep search matches in the middle of the window.
" zz centers the screen on the cursor, zv unfolds any fold if the cursor
" suddenly appears inside a fold.
nnoremap * *zzzv
nnoremap n nzzzv
nnoremap N Nzzzv

" Also center the screen when jumping through the changelist
nnoremap g; g;zz
nnoremap g, g,zz

" upper/lower word
" nmap <leader>u mQviwU`Q
" nmap <leader>l mQviwu`Q

" upper/lower first char of word
" nmap <leader>U mQgewvU`Q
" nmap <leader>L mQgewvu`Q

" underscore/camelcase
noremap + /\$\w\+_<CR>
noremap _ f_x~

" Some helpers to edit mode
" http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%

" swap two words
nmap <silent> gw :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`'

" Underline the current line with '='
nmap <silent> <leader>ul :t.\|s/./=/g\|:nohls<cr>

" set text wrapping toggles
nmap <silent> <leader>tw :set invwrap<CR>:set wrap?<CR>

" find merge conflict markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" Map the arrow keys to be based on display lines, not physical lines
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk

" Toggle hlsearch with <leader>hs
nmap <leader>hs :set hlsearch! hlsearch?<CR>

" Adjust viewports to the same size
map <Leader>= <C-w>=

" Bubble lines
" nmap <C-Up> [e
" nmap <C-Down> ]e
vmap <C-k> [egv
vmap <C-j> ]egv

" let macvim_hig_shift_movement = 1
"  map <leader>l `.
" nnoremap ' `

" reflow paragraph with Q in normal and visual mode
nnoremap Q gqap
vnoremap Q gq

" whitespace
nmap <leader>ws :set nolist!<CR>            " highlight trailing whitespace
map <leader>wt :call StripWhitespace ()<CR> " strip all trailing whitespace

" fast saving
nnoremap <leader>w!! :w !sudo tee %<CR>
nnoremap <leader>w :w!<cr>

" for faster scrolling
" TODO: create a command for scrolling by ~70% of the window height
noremap <c-j> 15gj
noremap <c-k> 15gk

" Using '<' and '>' in visual mode to shift code by a tab-width left/right by
" default exits visual mode. With this mapping we remain in visual mode after
" such an operation.
vnoremap < <gv
vnoremap > >gv

" Switches to the previous buffer that was shown in the current window, but also
" closes the current buffer before switching to the previous one
noremap <leader>bq <c-^> :bd #<cr>

" Switch to the directory of the open buffer
noremap <leader>cd :cd %:p:h<cr>

" This is quit all
noremap <Leader>qa :qa<cr>

" resizing
  " map - :resize -3<CR>
  " map + :resize +3<CR>

" rotates the orientation of all windows on screen (doesn't work with bufexplr)
  " nnoremap <leader>rv :windo wincmd H<CR>
  " nnoremap <leader>rh :windo wincmd K<CR>

" window navigation
  nnoremap <C-h> <C-w>h
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  nnoremap <C-l> <C-w>l
  noremap <leader>wq <C-w>q

" buffer navigation
  nnoremap <leader>sh :split<CR>
  nnoremap <leader>sv :vsplit<CR>
  nnoremap <leader>sb :split<CR>:b <C-Z><C-Z>
  nnoremap <leader>svb :vsplit<CR>:b <C-Z><C-Z>
  nnoremap <C-p> :bprev<CR>
  nnoremap <C-n> :bnext<CR>
  nnoremap <C-x> :BW<CR>

" tabs
  nnoremap <leader>tc :tabnew<cr>
  nnoremap <leader>tk :tabclose<cr>
  nnoremap <leader>tn :tabnext<cr>
  nnoremap <leader>tp :tabprev<cr>
  nnoremap <leader>ts :tab split<cr>
  nnoremap <leader>tb :tab split<cr>:b <C-Z><C-Z>

" some C helpers
  nmap <leader>; $a;<Esc>
  nmap <leader>mf $xo{<cr>}<Esc>O

" finish loading, don't move/change this line
  filetype plugin indent on

" switch syntax highlighting on if the terminal has color
  if &t_Co > 2 || has("gui_running")
    syntax on
  endif

  NeoBundleCheck
