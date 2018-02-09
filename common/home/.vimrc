" ----------------------------------------------------------------------------
" STARTUP
" ----------------------------------------------------------------------------
set nocompatible                       " Vim mode
let s:is_macvim  = has('gui_macvim')
let g:is_posix = 1
let mapleader = ","
let g:mapleader=","
vnoremap . :norm.<cr>

if system('uname') =~ 'Darwin'
  let $PATH = $HOME .
    \ '/usr/local/bin:/usr/local/sbin:' .
    \ '/usr/pkg/bin:' .
    \ '/opt/local/bin:/opt/local/sbin:' .
    \ $PATH
endif

" ----------------------------------------------------------------------------
" PACKAGES
" ----------------------------------------------------------------------------
  call plug#begin('~/.config/nvim/bundle')


"" CORE FUNCTIONALITY
"
  " Plug  'Shougo/unite.vim'     |
  " Plug  'shougo/neomru.vim'    |
  " Plug  'shougo/unite-outline' |
  " Plug  'shougo/unite-help'    |
  " Plug  'shougo/unite-session'

	Plug  'vim-airline/vim-airline'           " buffer list and status bar
	Plug  'vim-airline/vim-airline-themes'    " themes for status bar
  Plug  'SirVer/ultisnips'                  " snippet manager
  "Plug  'terryma/vim-multiple-cursors'      " multiple cursors
  Plug  'honza/vim-snippets'                " snippet collection
  Plug  'Raimondi/delimitMate'              " auto close delimiters
  Plug  'Valloric/YouCompleteMe'            " code completion
  Plug  'altercation/vim-colors-solarized'  " solarized color theme
  Plug  'vim-scripts/bccalc.vim'            " eval mathematical expressions
  Plug  'benmills/vimux'                    " run in tmux pane
  Plug  'bronson/vim-trailing-whitespace'   " auto remove trailing whitespace
  Plug  'brooth/far.vim'                    " find and replace
  Plug  'vim-scripts/bufkill.vim'           " kill buffers
  Plug  'ctrlpvim/ctrlp.vim'                " fuzzy search
  Plug  'gavinbeatty/dragvisuals.vim'       " move visual blocks
  Plug  'janko-m/vim-test'                  " run tests easily
  Plug  'junegunn/rainbow_parentheses.vim'  " color parentheses highlighting
  Plug  'junegunn/vim-easy-align'           " easiliy align code blocks
  Plug  'kshenoy/vim-signature'             " display tags
  Plug  'majutsushi/tagbar'                 " tag sidebar
  Plug  'mbbill/undotree'                   " undo history sidebar
  Plug  'rking/ag.vim'                      " fast grep
  Plug  'scrooloose/nerdcommenter'          " multilanguage block commenting
  Plug  'scrooloose/nerdtree'               " file sidebar
  Plug  'skryl/tslime.vim'                  " send text to tmux pane
  Plug  'tpope/vim-endwise'                 " auto-close code blocks
  Plug  'tpope/vim-repeat'                  " enhance repeat command
  Plug  'tpope/vim-surround'                " easy parenthesizing
  Plug  'tpope/vim-unimpaired'              " some mapping defaults
  Plug  'vim-scripts/vis'                   " visual mode enhancements
  " Plug  'w0rp/ale'                          " async linter/syntax checker
  "Plug  'xolox/vim-misc' | Plug 'xolox/vim-easytags' " highlight tags

" LANGUAGE SUPPORT

 " git
  Plug  'mattn/gist-vim',             { 'on': 'Gist' }      " quickly create gists
  Plug  'tpope/vim-fugitive'                                " all the git things
  Plug  'junegunn/gv.vim'                                   " git commit browser


  " ruby
  Plug  't9md/vim-ruby-xmpfilter',    { 'for': 'ruby' }     " ruby eval
  Plug  'vim-ruby/vim-ruby',          { 'for': 'ruby' }     " ruby syntax
  Plug  'tpope/vim-rails',            { 'for': 'ruby' }     " rails commands


  " ios / swift / objc
  Plug  'keith/swift.vim',            { 'for': 'swift' }    " swift syntax
  Plug  'b4winckler/vim-objc',        { 'for': 'objc'  }    " objective c syntax


  " clojure
  Plug  'guns/vim-clojure-static',    { 'for': 'clojure' }  " clojure syntax and tools
  Plug  'tpope/vim-fireplace',        { 'for': 'clojure' }  " clojure repl


  " plaintext / markup
  Plug  'junegunn/goyo.vim',          { 'for': ['txt', 'markdown']      } " distraction free writing
  Plug  'junegunn/vim-xmark',         { 'do': 'make', 'for': 'markdown' } " markdown preview
  Plug  'plasticboy/vim-markdown',    { 'for': 'markdown'               } " markdown syntax


  " html/css
  Plug  'othree/html5.vim',           { 'for': 'html'                }    " html syntax
  Plug  'Valloric/MatchTagAlways',    { 'for': ['html', 'xml']       }    " xml/html tag matching
  Plug  'groenewege/vim-less',        { 'for': 'less'                }    " less syntax
  Plug  'slim-template/vim-slim',     { 'for': 'slim'                }    " slim syntax
  Plug  'digitaltoad/vim-pug',        { 'for': ['jade', 'pug']       }    " pug/jade syntax
  Plug  'tpope/vim-haml',             { 'for': 'haml'                }    " haml syntax
  Plug  'tpope/vim-liquid',           { 'for': 'html'                }    " liquid syntax
  Plug  'hail2u/vim-css3-syntax',     { 'for': ['css','scss','sass'] }    " css3 syntax
  Plug  'cakebaker/scss-syntax.vim',  { 'for': ['scss','sass']       }    " scss syntax
  Plug  'ap/vim-css-color',           { 'for': ['css','scss','sass','less'] } " css colors


  " js
  Plug  'pangloss/vim-javascript',    { 'for': ['javascript','json'] }    " js syntax
  Plug  'moll/vim-node',              { 'for': 'javascript'          }    " node syntax
  Plug  'kchmck/vim-coffee-script',   { 'for': 'coffee'              }    " coffee syntax
  Plug  'leafgarland/typescript-vim', { 'for': 'typescript'          }    " typescript syntax


  " random
  Plug  'rust-lang/rust.vim',         { 'for': ['rust']              }    " rust syntax
  Plug  'sophacles/vim-processing',   { 'for': ['pde', 'processing'] }    " processing syntax
  Plug  'OCamlPro/ocp-indent',        { 'for': ['sml', 'ocaml']      }    " ocaml syntax
  Plug  'derekwyatt/vim-scala',       { 'for': 'scala'               }    " scala syntax
  Plug  'elixir-lang/vim-elixir',     { 'for': 'elixir'              }    " elixir syntax
  Plug  'jnwhiteh/vim-golang',        { 'for': 'go'                  }    " go syntax
  Plug  'wlangstroth/vim-racket',     { 'for': ['racket','scheme']   }    " racket syntax
  Plug  'tmux-plugins/vim-tmux',      { 'for': 'tmux'                }    " tmux syntax
  Plug  'tomlion/vim-solidity',       { 'for': 'solidity'            }    " ethereum


  call plug#end()


" ----------------------------------------------------------------------------
" SETTINGS
" ----------------------------------------------------------------------------

  set autoread               " updates buffer when file is changed outside of vim
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
  set clipboard=             " copy to osx clipboard

" TEXT FORMATTING/INDENTATION

  set autoindent             " copy indent from current line when starting new one
  set cindent                " smart indent for C like languages
  set copyindent             " copy indentation chars from previous line
  set expandtab              " expand tabs to spaces
  set formatoptions+=tcroqn  " autoformats text correctly during Q
"  set nowrap                 " do not wrap lines visually
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

  " set mouse=a                " enable mouse
  " set mousehide              " hide mouse when typing
  " set mousef                 " allows the mouse to change the position of the cursor

" COMPLETION

  set complete=.,w,b,u,t,i
  set completeopt=menu,menuone,longest

" GUI

if has('gui_running')
    set lines=75 columns=150

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
    set guifont=Sauce\ Code\ Powerline\ Light:h14
    set transparency=0
    set vb t_vb=
endif

" HISTORY/BACKUPS

  set tags=./tags                             " places to check for tags
  set history=1000                            " command line history

  set nobackup                                " do not keep backups after close
  set backupdir=~/.vim/.cache/backup

  set noswapfile                              " dont keep buffer in a swapfile
  set directory=~/.vim/.cache/swap            " swapfile directory

  set undofile                                " keeps undo history around after file is closed
  set undodir=~/.vim/.cache/undo
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

  highlight Comment      ctermfg=DarkGrey guifg=#444444
  highlight CursorColumn cterm=NONE       ctermbg=darkred ctermfg=white guibg=darkred guifg=white
  highlight CursorLine   cterm=NONE       ctermbg=darkred ctermfg=white guibg=darkred guifg=white
  highlight IncSearch    guibg=white      guifg=black
  highlight Normal       guibg=black      guifg=white
  highlight Pmenu        ctermbg=238      gui=bold
  highlight Search       guibg=white      guifg=black
  highlight SpecialKey   ctermfg=DarkGray ctermbg=Black
  highlight StatusLine   guifg=#00ff00    guibg=#000000
  highlight StatusLineNC guifg=#ff0000    guibg=#000000

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

"  AUTOCOMMANDS

  au BufNewFile,BufRead *.csv setf csv
  au BufRead,BufNewFile *Makefile* set filetype=make
  au BufReadPost *.rkt,*.rktl set filetype=racket
  au FileType c setlocal cindent
  au FileType cpp setlocal cindent
  au filetype racket set autoindent
  au filetype racket set lisp

  " ruby omnifunc settings
  autocmd FileType ruby,eruby let g:rubycomplete_rails = 0
  autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
  autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
  autocmd FileType ruby,eruby let g:rubycomplete_include_object = 1
  autocmd FileType ruby,eruby let g:rubycomplete_include_objectspace = 1

" enable brace matching
  runtime! macros/matchit.vim

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

" ----------------------------------------------------------------------------
" PACKAGE SETTINGS
" ----------------------------------------------------------------------------

" UNITE

  " let g:unite_force_overwrite_statusline = 0
  " let g:unite_source_history_yank_enable = 1
	" let g:unite_source_grep_max_candidates = 200
  " let g:unite_source_grep_command = 'ag'
  " let g:unite_source_grep_recursive_opt = ''
  " let g:unite_source_grep_default_opts =
  " \ '-i --line-numbers --nocolor --nogroup --hidden --ignore ' .
  " \  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
  "
	" " Like ctrlp.vim settings.
	" call unite#custom#profile('default', 'context', {
  " \   'prompt': '>>>',
	" \   'winheight': 25,
  " \   'max-multi-lines': 1,
	" \   'direction': 'topleft',
	" \ })
  "
  " function! s:unite_settings()
  "   let b:SuperTabDisabled=1
  "   imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  "   imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
  "   imap <silent><buffer><expr> <C-x> unite#do_action('split')
  "   imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  "   imap <silent><buffer><expr> <C-t> unite#do_action('tabopen')
  "   imap <buffer> <ESC> <Plug>(unite_exit)
  "   nmap <buffer> <ESC> <Plug>(unite_exit)
  " endfunction
  "
	" autocmd FileType unite call s:unite_settings()
  "
  " call unite#filters#matcher_default#use(['matcher_fuzzy'])
  " nnoremap <leader>fb :<C-u>Unite  -auto-resize buffer<cr>
  " nnoremap <leader>fc :<C-u>Unite  -auto-resize -start-insert command<cr>
  " " nnoremap <leader>ff :<C-u>Unite  -auto-resize -start-insert file_rec/async:!<cr>
  " nnoremap <leader>fg :<C-u>Unite  -auto-resize grep:.<cr>
  " nnoremap <leader>fh :<C-u>Unite  -auto-resize -start-insert help<cr>
  " nnoremap <leader>fm :<C-u>Unite  -auto-resize -start-insert mapping<cr>
  " nnoremap <leader>fo :<C-u>Unite  -auto-resize -start-insert outline<cr>
  " nnoremap <leader>f" :<C-u>Unite  -auto-resize register<cr>
  " nnoremap <leader>fr :<C-u>Unite  -auto-resize file_mru<cr>
  " nnoremap <leader>fs :<C-u>Unite  -auto-resize session<cr>
  " nnoremap <leader>fu :<C-u>Unite  -auto-resize source<cr>
  " nnoremap <leader>fy :<C-u>Unite  -auto-resize history/yank<cr>
  " nnoremap <leader>fp :<C-u>Unite  -auto-resize -start-insert process<cr>
  " nnoremap <leader>fnl :<C-u>Unite -auto-resize neobundle<cr>
  " nnoremap <leader>fns :<C-u>Unite -auto-resize neobundle/search<cr>
  " nnoremap <leader>fnu :<C-u>Unite -auto-resize neobundle/update<cr>

" ALE

  let g:ale_lint_on_text_changed = 'never'
  let g:ale_lint_on_enter = 0
  let g:ale_set_loclist = 1
  let g:ale_set_quickfix = 1
  let g:ale_open_list = 1
  let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
  let g:ale_linters = {
  \   'coffeescript': ['coffeelint'],
  \}

" BCCALC

  vnoremap <Leader>cc "eyy:call CalcLines(1)"<CR>
  noremap  <Leader>cc "eyy:call CalcLines(0)"<CR>

" CTRLP

  let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:40'
  let g:ctrlp_open_multiple_files = '1vir'
  let g:ctrlp_follow_symlinks=1
  let g:ctrlp_working_path_mode=0
  let g:ctrlp_max_files=5000
  let g:ctrlp_map = '<nop>'
  let g:ctrlp_use_caching=0

  let g:ctrlp_user_command = 'ag %s -i
        \ --nocolor --nogroup --hidden --ignore .git --ignore .svn
        \ --ignore .hg --ignore .DS_Store --ignore "**/*.pyc" -g ""'


  nnoremap <Leader>ff :CtrlP<CR>
  nnoremap <Leader>ft :CtrlPTag<CR>
  nnoremap <Leader>fb :CtrlPBuffer<CR>
  nnoremap <Leader>fm :CtrlPMRU<CR>

" DELIMITMATE

  let g:delimitMate_expand_space = 1
  let g:delimitMate_balance_matchpairs = 1

" EASYALIGN

  xmap ga <Plug>(EasyAlign)
  nmap ga <Plug>(EasyAlign)
  nnoremap <leader>aa :EasyAlign<CR>
  vnoremap <leader>aa :EasyAlign<CR>

" EASYTAGS / CTAGS / CSCOPE

  let g:easytags_file = '~/.vim/.cache/tags'
  let g:easytags_async=1
  let g:easytags_python_enabled  = 1
  let g:easytags_resolve_links   = 1
  let g:easytags_dynamic_files   = 1
  let g:easytags_suppress_report = 1
  let g:easytags_syntax_keyword = 'always'

" GIST

  let g:gist_clip_command = 'pbcopy'
  let g:gist_detect_filetype = 1
  let g:gist_open_browser_after_post = 1
  let g:gist_post_private=1
  let g:gist_show_privates=1

" MULTIPLE CURSORS

  let g:multi_cursor_start_key='<C-m>'

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
  let NERDTreeBookmarksFile=expand("$HOME/.vim/.cache/nerdtree")

  nnoremap <C-e> :NERDTreeToggle<CR>
  nnoremap <leader>n :NERDTreeFind<CR>


" NERDCOMMENTER
  let g:NERDSpaceDelims  = 1
  let g:NERDDefaultAlign = 'left'
  let g:NERDCommentEmptyLines = 1

" PLUG

  nnoremap <Leader>pi :PlugInstall<CR>


" RAINBOW PARENS

  augroup rainbow_lisp
    autocmd!
    autocmd FileType lisp,clojure,scheme RainbowParentheses
  augroup END


" SILVER-SEARCHER

  set grepprg=ag\ --nogroup\ --nocolor

 "search for word under cursor
  nnoremap F :Ag "<C-R><C-W>"<CR>

" SYNTASTIC

  let g:syntastic_error_symbol = '✗'
  let g:syntastic_style_error_symbol = '✠'
  let g:syntastic_warning_symbol = '∆'
  let g:syntastic_style_warning_symbol = '≈'

  let g:syntastic_auto_loc_list=1
  let g:syntastic_enable_signs=1
  let g:syntastic_enable_highlighting=1
  "let g:syntastic_quiet_messages = {'level': 'warnings'}
  let g:syntastic_auto_jump=0
  let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
  let g:syntastic_cpp_check_header = 1
  let g:syntastic_cpp_compiler_options=' -I../src -I./src -I./include -I../include'
  let g:syntastic_mode_map = { 'passive_filetypes': [] }
  let g:syntastic_javascript_checkers = ['eslint']

  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*

" TAGBAR

  nnoremap <C-T> :TagbarToggle<CR>
  let g:tagbar_left = 1

" TSLIME

  let g:tmux_sessionname = 0
  let g:tmux_windowname = 1
  let g:tmux_panenumber = 2
  nnoremap <leader><CR> V"ty:call Send_to_Tmux(@t)<CR>
  vnoremap <leader><CR> "ty:call Send_to_Tmux(@t)<CR>
  nnoremap <leader>tm :call Tmux_Vars()<CR>

" UNDOTREE

  nnoremap <C-z> :UndotreeToggle<CR>
  let g:undotree_SetFocusWhenToggle=1

" UTILSNIPS

  let g:UltiSnipsExpandTrigger="<tab>"
  let g:UltiSnipsJumpForwardTrigger="<tab>"
  let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
  let g:UltiSnipsSnippetsDir='~/.vim/snippets'

" VIM-AIRLINE

  let g:airline#extensions#tabline#enabled = 1
  let g:airline_powerline_fonts = 1

" VIM-CLOJURE-STATIC

  let g:clojure_align_multiline_strings = 0

" VIM-DRAGVISUALS

  " FIXME
  vnoremap  <expr>  <Left>  DVB_Drag('left')
  vnoremap  <expr>  <Right> DVB_Drag('right')
  vnoremap  <expr>  <Down>  DVB_Drag('down')
  vnoremap  <expr>  <Up>    DVB_Drag('up')
  vnoremap  <expr>  D       DVB_Duplicate()

" FAR
  let g:far#source = 'agnvim'
  let g:far#preview_window_height = 40
  let g:far#window_layout = 'tab'
  let g:far#file_mask_favorites = ['%', '**/*.*', '**/*.rb', '**/*.js']


" VIM-FUGITIVE

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

" GV

  nnoremap <silent> <leader>gv :GV<CR>
  nnoremap <silent> <leader>gV :GV!<CR>

" VIM-RUBY-XMPFILTER

  nmap <buffer> <F5> <Plug>(xmpfilter-run)
  xmap <buffer> <F5> <Plug>(xmpfilter-run)
  imap <buffer> <F5> <Plug>(xmpfilter-run)

  nmap <buffer> <F4> <Plug>(xmpfilter-mark)
  xmap <buffer> <F4> <Plug>(xmpfilter-mark)
  imap <buffer> <F4> <Plug>(xmpfilter-mark)


" VIM-TEST
  let test#strategy = "tslime"
  nmap <silent> <leader>tt :TestNearest<CR>
  nmap <silent> <leader>tf :TestFile<CR>
  nmap <silent> <leader>ts :TestSuite<CR>
  nmap <silent> <leader>tl :TestLast<CR>
  nmap <silent> <leader>tv :TestVisit<CR>


" YOUCOMPLETEME

  " make ycm play nice with UltiSnips
  let g:ycm_server_python_interpreter    = '/usr/local/bin/python3'
  let g:ycm_key_list_select_completion   = ['<Down>']
  let g:ycm_key_list_previous_completion = ['<Up>']

  let g:ycm_collect_identifiers_from_tags_files=1
  let g:ycm_min_num_of_chars_for_completion=2
  let g:ycm_complete_in_comments_and_strings=0
  let g:ycm_autoclose_preview_window_after_completion=1
  let g:ycm_filetype_blacklist = { 'notes': 1, 'text': 1 }

  " let g:ycm_server_use_vim_stdout = 1
  " let g:ycm_server_keep_logfiles = 1
  " let g:ycm_server_log_level = 'debug'

  nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>


" ----------------------------------------------------------------------------
" KEYMAPPINGS
" ----------------------------------------------------------------------------

" GENERAL

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
  " nnoremap <leader>ww :w !sudo tee %<CR>
  " nnoremap <leader>w :w!<cr>

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
  noremap <leader>d "zyiw:exe "h ".@z.""<CR>

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

  "" Linting

  nnoremap <leader>js %!python -m json.tool<CR>
  nnoremap <leader>xml :silent 1,$!xmllint --format --recover - 2>/dev/null<CR>

  "" Terminal
  nnoremap <leader>t :terminal<CR>
  " tnoremap <Esc> <C-\><C-n>
  " tnoremap <A-h> <C-\><C-n><C-w>h
  " tnoremap <A-j> <C-\><C-n><C-w>j
  " tnoremap <A-k> <C-\><C-n><C-w>k
  " tnoremap <A-l> <C-\><C-n><C-w>l

" ----------------------------------------------------------------------------
" FINISH STARTUP
" ----------------------------------------------------------------------------

  filetype plugin indent on  " don't move/change this line
  syntax on
