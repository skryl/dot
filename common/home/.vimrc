" ----------------------------------------------------------------------------
" GENERAL
" ----------------------------------------------------------------------------
  set nocompatible
  set encoding=utf-8
  set fileformats=unix
  set ruler
  set cmdheight=2
  set shortmess=aTItoOr
  set title
  set titlestring=VIM:\ %-25.55F\ %a%r%m titlelen=70
  set ttyfast
  set autoread
  set timeoutlen=500
  set modeline
  set modelines=1
" allows switching buffers without saving first
  set hidden            
  filetype plugin indent on
  syntax enable
  let mapleader = ","
  set clipboard+=unnamed
  set errorfile=/tmp/vim.errors.log
  set shell=/bin/bash

" ----------------------------------------------------------------------------
" VUNDLE
" ----------------------------------------------------------------------------
  filetype off                 " required!
  set rtp+=~/.vim/bundle/vundle
  call vundle#rc()

  " functionality
  " Bundle 'easytags.vim'
  Bundle 'CCTree'
  Bundle 'dhazel/conque-term'
  Bundle 'Lokaltog/vim-easymotion'
  Bundle 'Lokaltog/vim-easymotion'
  Bundle 'Lokaltog/vim-powerline'
  Bundle 'MarcWeber/vim-addon-mw-utils'
  Bundle 'ShowMarks'
  Bundle 'ZoomWin'
  Bundle 'a.vim'
  Bundle 'bufkill.vim'
  Bundle 'chazy/cscope_maps'
  Bundle 'ddollar/nerdcommenter'
  " Bundle 'ervandew/supertab'
  " Bundle 'garbas/vim-snipmate'
  Bundle 'gmarik/vundle'
  Bundle 'godlygeek/tabular'
  Bundle 'greyblake/vim-preview'
  Bundle 'henrik/vim-ruby-runner'
  " Bundle 'honza/snipmate-snippets'
  Bundle 'jeetsukumaran/vim-buffergator'
  Bundle 'kien/ctrlp.vim'
  Bundle 'kien/rainbow_parentheses.vim'
  Bundle 'majutsushi/tagbar'
  Bundle 'mattn/gist-vim'
  Bundle 'michaeljsmith/vim-indent-object'
  Bundle 'mileszs/ack.vim'
  Bundle 'minibufexpl.vim'
  Bundle 'mru.vim'
  Bundle 'Raimondi/delimitMate'
  Bundle 'scrooloos/nerdtree'
  Bundle 'scrooloose/syntastic'
  Bundle 'searchfold.vim'
  Bundle 'Shougo/neocomplcache'
  Bundle 'simplefold'
  Bundle 'sjl/gundo.vim'
  Bundle 'skryl/tslime.vim'
  Bundle 'taglist.vim'
  Bundle 'tpope/surround.vim'
  Bundle 'tpope/vim-endwise'
  Bundle 'tpope/vim-fugitive'
  Bundle 'tpope/vim-repeat'
  Bundle 'tpope/vim-rvm'
  Bundle 'tpope/vim-unimpaired'
  Bundle 'VimClojure'

  " syntax
  Bundle 'kchmck/vim-coffee-script'
  Bundle 'pangloss/vim-javascript'
  Bundle 'timcharper/textile.vim'
  Bundle 'tpope/vim-haml'
  Bundle 'tpope/vim-markdown'
  Bundle 'html5.vim'
  Bundle 'vim-ruby/vim-ruby'
  Bundle 'tpope/vim-rails'
  Bundle 'Rip-Rip/clang_complete'
  Bundle 'ap/vim-css-color'

  " colors
  Bundle 'altercation/vim-colors-solarized'
  Bundle 'wgibbs/vim-irblack'

  " dependencies
  Bundle 'MarcWeber/vim-addon-mw-utils'
  Bundle 'tomtom/tlib_vim'
  Bundle 'mattn/webapi-vim'

  filetype plugin indent on    " don't move/change this line

" ----------------------------------------------------------------------------
" TEXT FORMATTING/INDENTATION
" " ----------------------------------------------------------------------------
  "set cursorline
  set nowrap              " do not wrap lines"
  set textwidth=80
  set virtualedit=all     " place cursor where there is no text
  set expandtab           " expand tabs to spaces
  set nosmarttab          " fuck tabs
  set tabstop=2
  set softtabstop=2
  set shiftwidth=2
  set autoindent
  set smartindent
  set formatoptions+=n    " support for numbered/bullet lists

" ----------------------------------------------------------------------------
"  UI
" ----------------------------------------------------------------------------
  set ruler                  " show the cursor position all the time
  set noshowcmd              " don't display incomplete commands
  set nolazyredraw           " turn off lazy redraw
  set number                 " line numbers
  set wildmenu               " turn on wild menu
  set wildmode=list:longest,full
  set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
  set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
  set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*,*/tmp/*
  set wildignore+=*.swp,*~,._*
  set ch=2                   " command line height
  set backspace=2            " allow backspacing over everything in insert mode
  set report=0               " tell us about changes
  set nostartofline          " don't jump to the start of line when scrolling
  set showmode
  set showcmd                " show the command characters
  set scrolloff=3            " min # of lines to keep above and below cursor
  set pumheight=15

" folding
 " set foldmethod=syntax " kills autocomplete performance
 " set foldnestmax=3
 set nofoldenable
 
" mouse
  "set mouse=a  " enable mouse
  set mousehide " hide mouse when typing
  set mousef    " allows the mouse the change the position of the cursor

" completion
  set complete=.,w,b,u,t,i
  set completeopt=menu,menuone,longest
  " set wildchar=<Tab>
  set wildcharm=<C-z>
  set statusline=[%n]\ %<%f%m%r\ %w\ %y\ \ <%{&fileformat}>%=[%o]\ %l,%c%V\/%L\ \ %P
  set laststatus=2

" spelling
  set spelllang=en_us

" ----------------------------------------------------------------------------
" VISUAL CUES/SEARCH
" ----------------------------------------------------------------------------
  set showmatch   " show matching parentheses
  set mat=5       " duration to show matching brace (1/10 sec)
  set hlsearch    " highlight search matches
  set incsearch   " incremental search
  set ignorecase  " ignore case during searches
  set smartcase   " ovverride ignore case if pattern has upcase

" ---------------------------------------------------------------------------
" HISTORY/BACKUPS
" ---------------------------------------------------------------------------
  set history=1000
  set nobackup                             " do not keep backups after close
  set noswapfile                           " do not keep backups after close
  " set writebackup                           " do keep a backup while working
  " set backupcopy=yes                        " keep attributes of original file
  " set backupskip=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*
  set backupdir=$HOME/.vim_backup
  set directory=$HOME/.vim_backup,~/tmp,/tmp  " swapfile directory
  set undolevels=1000                         " number of forgivable mistakes
  set updatecount=100                         " write swap file to disk every 100 chars

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
  set guifont=Monaco:h11
  set guioptions-=T
  set listchars=tab:>-,trail:.
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
  set pastetoggle=<leader>p " toggle paste mode, turn off auto indentation

  " jump to last position of buffer when opening
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

" ---------------------------------------------------------------------------
" WINDOWS, TABS and BUFFERS
" ---------------------------------------------------------------------------
  set splitright " split vertically to the right
  set splitbelow " split horizontally below
  set equalalways " resize windows equally after splits or deletion

" ---------------------------------------------------------------------------
" FUNCTIONS
" ---------------------------------------------------------------------------
" Strip all trailing whitespace in file
  function! StripWhitespace ()
    exec ':%s/ \+$//gc'
  endfunction

" ----------------------------------------------------------------------------
"  PATH on MacOS X
" ----------------------------------------------------------------------------
  if system('uname') =~ 'Darwin'
    let $PATH = $HOME .
      \ '/usr/local/bin:/usr/local/sbin:' .
      \ '/usr/pkg/bin:' .
      \ '/opt/local/bin:/opt/local/sbin:' .
      \ $PATH
  endif

" enable brace matching
  runtime! macros/matchit.vim

" Language autofuncs
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
  " au FileType html set omnifunc=htmlcomplete#CompleteTags
  au FileType css set omnifunc=csscomplete#CompleteCSS
  au FileType xml set omnifunc=xmlcomplete#CompleteTags
  au BufNewFile,BufRead *.csv setf csv
  au VimEnter * RainbowParenthesesToggle
  au Syntax * RainbowParenthesesLoadRound
  au Syntax * RainbowParenthesesLoadSquare
  au Syntax * RainbowParenthesesLoadBraces



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

" BUFFERGATOR
  nmap <C-B> :BuffergatorToggle<CR>

" CLANG_COMPLETE
  let g:clang_complete_auto = 0
  let g:clang_complete_copen = 1

" CONQUE-TERM
  nmap <Leader>sh :ConqueTermVSplit zsh<CR>
  nmap <Leader>pry :ConqueTermVSplit pry<CR>
  nmap <Leader>clj :ConqueTermVSplit lein repl<CR>
  let g:ConqueTerm_ReadUnfocused = 1
  let g:ConqueTerm_CWInsert = 1
  let g:ConqueTerm_ToggleKey = '<F8>'
  let g:ConqueTerm_SendVisKey = '<F9>'
  let g:ConqueTerm_SendFileKey = '<F10>'
  let g:ConqueTerm_ExecFileKey = '<F11>'

" CTAGS/CSCOPE
  map <Leader>rt :!ctags -R --extra=+f .<CR><CR>
  map <Leader>rs :!cscope -bR<CR><CR>
  set cscopetag cscopeverbose
  set cscopequickfix=s-,c-,d-,i-,t-,e-

  cnoreabbrev csa cs add
  cnoreabbrev csf cs find
  cnoreabbrev csk cs kill
  cnoreabbrev csr cs reset
  cnoreabbrev css cs show
  cnoreabbrev csh cs help

" CTRLP
  let g:ctrlp_map = ''
  let g:ctrlp_cmd = ''
  let g:ctrlp_working_path_mode = 'ra'
  nmap <silent> <Leader>ff :CtrlP<CR>
  nmap <silent> <Leader>fb :CtrlPBuffer<CR>
  nmap <silent> <Leader>fm :CtrlPMixed<CR>
  let g:ctrlp_open_multiple_files = '1vir'

" DELIMITMATE
  let g:delimitMate_expand_space = 1
  let g:delimitMate_balance_matchpairs = 1

" EASYMOTION
  let g:EasyMotion_leader_key = '<Leader><Leader>'

" GIST
  let g:gist_clip_command = 'pbcopy'
  let g:gist_detect_filetype = 1
  let g:gist_open_browser_after_post = 1

" GUNDO
  nnoremap <C-g> :GundoToggle<CR>

" MINIBUFEXPL
  let g:miniBufExplSplitBelow = 0

" MRU
  nmap <leader>mr :MRU<cr>

" NEOCOMPLCACHE

  " Use neocomplcache.
  let g:neocomplcache_enable_at_startup = 1
  let g:neocomplcache_max_list = 20
  let g:neocomplcache_enable_smart_case = 1
  let g:neocomplcache_enable_camel_case_completion = 1
  let g:neocomplcache_enable_underbar_completion = 1
  let g:neocomplcache_min_syntax_length = 3
  let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

  if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
  endif
  let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

  if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
  endif
  let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
  let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
  let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
  let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

  " inoremap <expr><CR> neocomplcache#smart_close_popup()."\<CR>"
  inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
  inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
  inoremap <expr><C-y>  neocomplcache#close_popup()
  inoremap <expr><C-e>  neocomplcache#cancel_popup()

" NERDCOMMENTER
  let NERDShutUp = 1
  " bind command-/ to toggle comment
  nmap <D-/> ,c<Space>
  vmap <D-/> ,c<Space>
  imap <D-/> <C-O>,c<Space>

" NERDTREE
  let NERDChristmasTree = 1
  let NERDTreeHighlightCursorline = 1
  let NERDTreeShowBookmarks = 1
  let NERDTreeShowHidden = 1
  let NERDTreeWinSize = 50
  nnoremap <C-e> :execute 'NERDTreeToggle ' . getcwd()<CR>

" POWERLINE
  let g:Powerline_symbols = 'fancy'

" RUBY RUNNER
  nmap <leader>rr :call :RunRuby<CR>

" SHOWMARKS
  let g:showmarks_enable = 0
  let g:showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
  let g:showmarks_textlower="\t*"
  highlight ShowMarksHLl guifg=red guibg=green
  highlight ShowMarksHLu guifg=red guibg=green
  highlight ShowMarksHLo guifg=red guibg=green
  highlight ShowMarksHLm guifg=red guibg=green

" SIMPLEFOLD
  let g:SimpleFold_use_subfolds = 0

" SYNTASTIC
  let g:syntastic_enable_signs=1
  let g:syntastic_quiet_warnings=1
  let g:syntastic_auto_jump=1
  let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
  let g:syntastic_cpp_check_header = 1
  let g:syntastic_cpp_compiler_options=' -I../src -I./src -I./include -I../include'

  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*

" SUPERTAB
  " let g:SuperTabDefaultCompletionType = "context"

" TABULAR
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>A= :Tabularize /=\zs<CR>
  vmap <Leader>A= :Tabularize /=\zs<CR>
  nmap <Leader>a- :Tabularize /-<CR>
  vmap <Leader>a- :Tabularize /-<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>

" TAGBAR
  nmap <C-T> :TagbarToggle<CR>
  map <C-\> :tnext<CR>

" TAGLIST
  let g:ctags_statusline=1
  let Tlist_Compact_Format = 1
  let Tlist_GainFocus_On_ToggleOpen = 1
  let Tlist_File_Fold_Auto_Close = 1
  let Tlist_Process_File_Always = 1
  let Tlist_Inc_Winwidth = 0
  let Tlist_WinWidth = 50
  let Tlist_Enable_Fold_Column = 1   " Disable drawing the fold column
  let Tlist_Use_SingleClick = 1      " Single click tag selection
  let Tlist_Use_Right_Window = 1
  let Tlist_Exit_OnlyWindow = 1      " Exit if only the taglist is open
  let Tlist_File_Fold_Auto_Close = 1 " Only auto expand the current file
  nmap tl :TlistToggle<CR>

" TSLIME
  let g:tmux_sessionname = 'hack'
  let g:tmux_windowname = 1
  let g:tmux_panenumber = 2
  nmap <leader><CR> V"ty:call Send_to_Tmux(@t)<CR>
  vmap <leader><CR> "ty:call Send_to_Tmux(@t)<CR>
  nmap <leader>tv :call Tmux_Vars()<CR>

" VUNDLE
  nmap <Leader>bi :BundleInstall<CR>
  nmap <Leader>bc :BundleClean<CR>

" ZOOMWIN
  map <leader>zz :ZoomWin<CR>

" ----------------------------------------------------------------------------
" KEYMAPPINGS
" ----------------------------------------------------------------------------

" command mode
  nnoremap ; :

" edit/reload vimrc
  nnoremap <leader>vs :source ~/.vimrc<CR>
  nnoremap <leader>vv :e ~/.vimrc<CR>

  nmap <silent> <leader>sp :set spell!<CR>

" upper/lower word
  nmap <leader>u mQviwU`Q
  nmap <leader>l mQviwu`Q

" upper/lower first char of word
  nmap <leader>U mQgewvU`Q
  nmap <leader>L mQgewvu`Q

" underscore/camelcase
  noremap + /\$\w\+_<CR>
  noremap _ f_x~

" Some helpers to edit mode
" http://vimcasts.org/e/14
  cnoremap %% <C-R>=expand('%:h').'/'<cr>
  map <leader>ew :e %%
  map <leader>es :sp %%
  map <leader>ev :vsp %%
  map <leader>et :tabe %%

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
  nmap <leader>w :w!<cr>

" resizing
  " map - :resize -3<CR>
  " map + :resize +3<CR>

" rotates the orientation of all windows on screen
  nnoremap <leader>rv :windo wincmd H<CR>
  nnoremap <leader>rh :windo wincmd K<CR>

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

