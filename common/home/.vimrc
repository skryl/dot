" TODO:
" - fix easytags / easygrep
" - upgrade to new powerline

  set nocompatible

" ----------------------------------------------------------------------------
" VUNDLE
" ----------------------------------------------------------------------------
  if has ('vim_starting')
      set runtimepath+=~/.vim/bundle/neobundle.vim/
    endif

  call neobundle#rc(expand('~/.vim/bundle/'))

  NeoBundle 'Shougo/neobundle.vim'
  NeoBundle 'Shougo/vimproc', { 'build': {
        \   'windows': 'make -f make_mingw32.mak',
        \   'cygwin': 'make -f make_cygwin.mak',
        \   'mac': 'make -f make_mac.mak',
        \   'unix': 'make -f make_unix.mak',
        \ }  }

  " functionality
  NeoBundle 'Lokaltog/vim-easymotion'
  NeoBundle 'JuliaLang/julia-vim'
  NeoBundle 'Lokaltog/vim-powerline'
  NeoBundle 'MarcWeber/vim-addon-mw-utils'
  NeoBundle 'Raimondi/delimitMate'
  NeoBundle 'ShowMarks'
  NeoBundle 'SirVer/ultisnips'
  "NeoBundle 'Valloric/YouCompleteMe'
  NeoBundle 'VimClojure'
  NeoBundle 'ZoomWin'
  NeoBundle 'a.vim'
  NeoBundle 'bufkill.vim'
  NeoBundle 'derekwyatt/vim-scala'
  NeoBundle 'dhazel/conque-term'
  " NeoBundle 'easytags.vim'
  NeoBundle 'gmarik/vundle'
  NeoBundle 'godlygeek/tabular'
  NeoBundle 'henrik/vim-ruby-runner'
  NeoBundle 'kien/ctrlp.vim'
  NeoBundle 'kien/rainbow_parentheses.vim'
  NeoBundle 'majutsushi/tagbar'
  NeoBundle 'mattn/gist-vim'
  NeoBundle 'michaeljsmith/vim-indent-object'
  NeoBundle 'mileszs/ack.vim'
  NeoBundle 'epmatsw/ag.vim'
  NeoBundle 'minibufexpl.vim'
  NeoBundle 'buftabs'
  NeoBundle 'mru.vim'
  NeoBundle 'paredit.vim'
  NeoBundle 'scrooloose/nerdtree'
  NeoBundle 'scrooloose/syntastic'
  NeoBundle 'searchfold.vim'
  NeoBundle 'simplefold'
  NeoBundle 'sjl/gundo.vim'
  NeoBundle 'skryl/tslime.vim'
  NeoBundle 'suan/vim-instant-markdown.git'
  NeoBundle 'tomtom/tcomment_vim'
  NeoBundle 'tpope/vim-surround'
  NeoBundle 'tpope/vim-endwise'
  NeoBundle 'tpope/vim-fugitive'
  NeoBundle 'tpope/vim-git'
  NeoBundle 'tpope/vim-repeat'
  NeoBundle 'tpope/vim-rvm'
  NeoBundle 'tpope/vim-unimpaired'
  NeoBundle 'xolox/vim-session'
  NeoBundle 'xolox/vim-misc'
  NeoBundle '907th/vim-auto-save'
  NeoBundle 'jimenezrick/vimerl'
  NeoBundle 'vim-multiple-cursors'
  NeoBundle 'gregsexton/gitv'
  NeoBundle 'mhinz/vim-signify'
  NeoBundle 'mhinz/vim-startify'
  NeoBundle 'VimIRC.vim'
  " NeoBundle 'EasyGrep'

  " unite
  NeoBundle 'Shougo/unite.vim'
  NeoBundle 'Shougo/unite-outline'
  NeoBundle 'Shougo/unite-session'
  NeoBundle 'Shougo/junkfile.vim'
  NeoBundle 'ujihisa/unite-colorscheme'
  NeoBundle 'thinca/vim-unite-history'

  " syntax
  NeoBundle 'kchmck/vim-coffee-script'
  NeoBundle 'pangloss/vim-javascript'
  NeoBundle 'timcharper/textile.vim'
  NeoBundle 'tpope/vim-haml'
  NeoBundle 'tpope/vim-markdown'
  NeoBundle 'vim-ruby/vim-ruby'
  NeoBundle 'tpope/vim-rails'
  NeoBundle 'ap/vim-css-color'

  " colors
  NeoBundle 'altercation/vim-colors-solarized'
  NeoBundle 'wgibbs/vim-irblack'

  " dependencies
  NeoBundle 'MarcWeber/vim-addon-mw-utils'
  NeoBundle 'tomtom/tlib_vim'
  NeoBundle 'mattn/webapi-vim'

  filetype plugin indent on    " don't move/change this line
  syntax enable
  NeoBundleCheck

" ----------------------------------------------------------------------------
" GENERAL
" ----------------------------------------------------------------------------
  set encoding=utf-8
  set fileformats=unix
  set ruler
  set cmdheight=2
  set shortmess=aTItoOr
  set title
  set titlestring=VIM:\ %-25.55F\ %a%r%m titlelen=70
  set ttyfast
  set autoread
  set timeoutlen=300
  set ttimeoutlen=50
  set modeline
  set modelines=1
  " allows switching buffers without saving first
  set hidden            
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

" ----------------------------------------------------------------------------
" TEXT FORMATTING/INDENTATION
" " ----------------------------------------------------------------------------
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
  set lazyredraw           " turn off lazy redraw
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

" sounds
  set noerrorbells
  set novisualbell
  set t_vb=

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

if has('gui_running')
    " open maximized
    set lines=999 columns=9999
    set guioptions+=t                                 "tear off menu items
    set guioptions-=T                                 "toolbar icons

    set guifont=Monaco:h11
    " set gfn=Ubuntu_Mono:h14
    set transparency=2
  else
    if $TERM_PROGRAM == 'iTerm.app'
      " different cursors for insert vs normal mode
      if exists('$TMUX')
        let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
        let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
      else
        let &t_SI = "\<Esc>]50;CursorShape=1\x7"
        let &t_EI = "\<Esc>]50;CursorShape=0\x7"
      endif
    endif
  endif
"}}}

" ----------------------------------------------------------------------------
" VISUAL CUES/SEARCH
" ----------------------------------------------------------------------------
  set showmatch   " show matching parentheses
  set mat=5       " duration to show matching brace (1/10 sec)
  set hlsearch    " highlight search matches
  set incsearch   " incremental search
  set ignorecase  " ignore case during searches
  set smartcase   " ovverride ignore case if pattern has upcase

  :hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
  :hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
  :nnoremap <Leader>c :set cursorcolumn!<CR>
  :nnoremap <Leader>l :set list!<CR>
  set cursorline

" ---------------------------------------------------------------------------
" HISTORY/BACKUPS
" ---------------------------------------------------------------------------
  set tags=./.tags;,~/.vimtags
  set history=1000
  set nobackup                                " do not keep backups after close
  set noswapfile                              " do not keep backups after close
  " set writebackup                           " do keep a backup while working
  " set backupcopy=yes                        " keep attributes of original file
  " set backupskip=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*
  " set backupdir=$HOME/.vim_backup
  " set directory=$HOME/.vim_backup,~/tmp,/tmp  " swapfile directory
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
  set listchars=tab:»·,trail:·
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
  au BufReadPost *.rkt,*.rktl set filetype=racket
  au filetype racket set lisp
  au filetype racket set autoindent

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

" BUFTABS
  let g:buftabs_only_basename=1

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

" ECLIM
  let g:EclimCompletionMethod = 'omnifunc'

" EASYGREP
  let g:EasyGrepCommand=1

" EASYMOTION
  let g:EasyMotion_leader_key = '<Leader><Leader>'

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

" GUNDO
  nnoremap <C-g> :GundoToggle<CR>

" INSTANT-MARKDOWN
  let g:instant_markdown_slow = 1

" MINIBUFEXPL
  let g:miniBufExplSplitBelow = 0

" MRU
  nmap <C-O> :MRU<cr>

" NERDTREE
  let NERDChristmasTree = 1
  let NERDTreeHighlightCursorline = 1
  let NERDTreeShowBookmarks = 1
  let NERDTreeShowHidden = 1
  let NERDTreeWinSize = 50
  nnoremap <C-e> :execute 'NERDTreeToggle ' . getcwd()<CR>

" POWERLINE
  let g:Powerline_symbols = 'fancy'

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

" SHOWMARKS
  let g:showmarks_enable = 0
  let g:showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
  let g:showmarks_textlower="\t*"
  highlight ShowMarksHLl guifg=red guibg=green
  highlight ShowMarksHLu guifg=red guibg=green
  highlight ShowMarksHLo guifg=red guibg=green
  highlight ShowMarksHLm guifg=red guibg=green

" SILVER-SEARCHER
  map <leader>ag :Ag!<space><<C-R><C-W>\><CR>

" SIMPLEFOLD
  let g:SimpleFold_use_subfolds = 0

" SYNTASTIC
  let g:syntastic_auto_loc_list=1
  let g:syntastic_enable_signs=1
  let g:syntastic_enable_highlighting=1
  let g:syntastic_quiet_warnings=1
  let g:syntastic_auto_jump=1
  let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
  let g:syntastic_cpp_check_header = 1
  let g:syntastic_cpp_compiler_options=' -I../src -I./src -I./include -I../include'
  let g:syntastic_mode_map = { 'passive_filetypes': ['scala'] }

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

  let g:junkfile#directory=expand("~/.vim/.cache/junk")
  nnoremap <silent> [unite]/ :<C-u>Unite -no-quit -buffer-name=search grep:.<cr>
  nnoremap <silent> [unite]f :<C-u>Unite -toggle -auto-resize -buffer-name=files file_rec/async<cr><c-u> 
  nnoremap <silent> [unite]b :<C-u>Unite -auto-resize -buffer-name=buffers buffer<cr>
  nnoremap <silent> [unite]y :<C-u>Unite -buffer-name=yanks history/yank<cr>
  nnoremap <silent> [unite]l :<C-u>Unite -auto-resize -buffer-name=line line<cr>
  nnoremap <silent> [unite]m :<C-u>Unite -auto-resize -buffer-name=mappings mapping<cr>
  nnoremap <silent> [unite]s :<C-u>Unite -quick-match buffer<cr>
  nnoremap <silent> [unite]t :<C-u>Unite -auto-resize -buffer-name=tags tags tags/file<cr>
  nnoremap <silent> [unite]j :<C-u>Unite -auto-resize -buffer-name=junk junkfile junkfile/new<cr>
  nnoremap <silent> [unite]o :<C-u>Unite -auto-resize -buffer-name=outline outline<cr>
  nnoremap <silent> [unite]<space> :<C-u>Unite -toggle -auto-resize -buffer-name=mixed file_rec/async buffer file_mru bookmark<cr><c-u>

" VIM-AUTO-SAVE
  let g:auto_save = 1

" VIMCLOJURE
  let vimclojure#WantBackend = 1
  let vimclojure#SplitPos = "right"
  let g:vimclojure#HighlightBuiltins = 1
  let g:paredit_mode = 1

" VIM-MULTIPLE-CURSOR
  let g:multi_cursor_use_default_mapping=0
  let g:multi_cursor_next_key="\<C-w>"
  let g:multi_cursor_prev_key="\<C-q>"
  let g:multi_cursor_skip_key="\<C-x>"
  let g:multi_cursor_exit_key="\<Esc>"

" VIM-SESSION
  let g:session_autoload = 'no'
  let g:session_autosave = 'no'

  nmap <Leader>ss :SaveSession<CR>
  nmap <Leader>so :OpenSession<CR>
  nmap <Leader>sc :CloseSession<CR>
  nmap <Leader>sd :DeleteSession<CR>
  nmap <Leader>sv :ViewSession<CR>

" VIM-SIGNIFY
  let g:signify_disable_by_default = 1
  let g:signify_mapping_toggle_highlight = '<leader>gh'
  let g:signify_mapping_toggle = '<leader>gt'

" VUNDLE
  nmap <Leader>bi :NeoBundleInstall<CR>
  nmap <Leader>bc :NeoBundleClean<CR>

" YOUCOMPLETEME
  let g:ycm_filetype_blacklist = { 
    \ 'notes': 1,  
    \ 'markdown': 1,  
    \ 'text': 1,  
    \ 'ruby': 1  
    \ }

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
  nmap <leader>w :w!<cr>

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
