" Begin .vimrc

" INFO: Folded sections
" Use 'za' (without quotes) to unfold/refold

" INFO: If this vimrc is in use,
"     use <space> to toggle folds in normal mode
"     use ; not : for commands

let mapleader=";"       " set ; key as the mapleader

" Vundle {{{
" Setup {{{
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"}}}
" Other plugins here: {{{

" Time tracker
Plugin 'wakatime/vim-wakatime'
" Git gutter
Plugin 'airblade/vim-gitgutter'
" Git wrapper
Plugin 'tpope/vim-fugitive'
" Modify surrounding brackets, quotes, tags
Plugin 'tpope/vim-surround'
" Repeat groups of commands, not a single command
Plugin 'tpope/vim-repeat'
" Better increment/decrement for dates
Plugin 'tpope/vim-speeddating'
" Better substitution using %S instead of %s
Plugin 'tpope/vim-abolish'
" Better movements, like [b for bprevious
Plugin 'tpope/vim-unimpaired'
" Better comments
Plugin 'tpope/vim-commentary'
" Snippet engine
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine
Plugin 'honza/vim-snippets'
" Faster movement in window
" Plugin 'easymotion/vim-easymotion'
" ag plugin, sudo apt install ack-grep
Plugin 'mileszs/ack.vim'
" Fuzzy search
Plugin 'ctrlpvim/ctrlp.vim'
" Run time completion
Plugin 'Valloric/YouCompleteMe'
" Generate file required for YCM
Plugin 'rdnetto/YCM-Generator'
" Theme manager
Plugin 'reedes/vim-thematic'
" Tagbar
Plugin 'majutsushi/tagbar'
" Markdown Syntax
Plugin 'gabrielelana/vim-markdown'
" Navigation Tree
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
" Better Sublime-ish delimiters, ie the end braces open appear automatically
Plugin 'Raimondi/delimitMate'
" Powerline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Python auto-complete
Plugin 'davidhalter/jedi-vim'
" PyVirtual env
Plugin 'jmcantrell/vim-virtualenv'
" csv
Plugin 'chrisbra/csv.vim'
" Python
" Plugin 'klen/python-mode' till i switch off its no wrap
" Color coding
" Plugin 'jeaye/color_coded'
Plugin 'vimwiki/vimwiki'

" gundo, easy motion

" TODO
" Generate tags (install exuberant-ctags first)
" Plugin 'xolox/vim-easytags'
" Plugin 'szw/vim-tags'
" Syntax
" Plugin 'scrooloose/syntastic'

"}}}
" Cleanup {{{
" All of your Plugins must be added before the following line
call vundle#end()            " required
" }}}
" Help {{{
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" }}}
" }}}

" Plugin Settings {{{
" vim-gitgutter {{{
highlight link GitGutterAdd DiffAdd
highlight link GitGutterChange DiffChange
highlight link GitGutterDelete DiffDelete
" }}}
" CtrlP {{{
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ack %s -l --nocolor -g ""'
let g:ctrlp_working_path_mode = 'ra'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
" set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
" let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }
"  \ 'link': 'some_bad_symbolic_links', << unused option
nnoremap <C-g> :CtrlPTag<cr>
" }}}
" Repeat {{{
" Insert the following at the end of map function (uncomment it)
" silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)
" }}}
" Ultisnips {{{
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" }}}
" YouCompleteMe {{{
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_key_list_select_completion = ['<Down>']
" [<Tab>, '<Down>, '<Enter>]
let g:ycm_extra_conf_globlist = ['~/Documents/graphics/*', '~/ros_ws/src/*', '~/catkin_ws/src/*','!~/*']

nnoremap <leader>ycm :YcmGenerateConfig<CR>
" }}}
" Ack {{{
nnoremap <leader>a :Ack
" }}}
" TagBar {{{
nnoremap <F8> :TagbarToggle<CR>
" }}}
" Thematic {{{
let g:thematic#theme_name = 'ron'
" }}}
" Tabular {{{ [[rlc][padding]]* for right, left or center align
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
" }}}
" Syntastic {{{
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_quiet_messages = { "type": "syntax" } " For catkin_ws, it fucks up the warnings
" }}}
" Markdown {{{
" let g:vim_markdown_math=1
" let g:vim_markdown_frontmatter=1
" }}}
" NERDTree {{{
" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('cpp', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

nnoremap <leader>nav :NERDTreeToggle<CR>
" Open NERDTree if only `$ vim` is used
augroup vimrcNerdTree
    autocmd!
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    " Put cursor in the other window
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | wincmd p | endif
    " use ;qa to exit
augroup End
" }}}
" Airline {{{
let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t' " Show just the filename
let g:airline#extensions#virtualenv#enabled = 1
" Enable status
set noruler
set laststatus=2
" Enable colors
set t_Co=256
" }}}
" Pymode{{{
let g:pymode_breakpoint_bind = '<leader>pb'
let g:pymode_options_max_line_length = 120
" }}}
" }}}

" Basics {{{
syntax on
" }}}

" Colors {{{
set background=dark
" }}}

" Rendering {{{
set ttyfast
set backspace=indent,eol,start "solve bksp problems
" }}}

" Spaces & Tabs {{{
set smarttab
set shiftwidth=4
set tabstop=4
set expandtab
" }}}

" Autodetect {{{
" detect settings from mode line in file
" INSECURE, use at own risk
set modeline
set modelines=5
" }}}

" Indent {{{
" indentation plugin
set autoindent
if has("autocmd")
    filetype plugin indent on
endif
" }}}

" Search {{{
set ignorecase          " Do case insensitive matching
set smartcase           " Do smart case matching
set incsearch           " Incremental search
set hlsearch            " Highlight all matches
" remove highlighted matches
nnoremap <leader>rm :nohlsearch
" }}}

" UI {{{
set mouse=a
"set columns=80
set lazyredraw
set wrapmargin=8
set ruler
set number
set encoding=utf-8
set nocursorline        " No to Highlight cursor line
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set hidden              " Hide buffers when they are abandoned
nnoremap <F7> :tab ball<CR>
" }}}

" Folding {{{
set foldmethod=indent   " fold based on indent level
set foldnestmax=10      " max 10 depth
set foldenable          " don't fold files by default on open
set foldlevelstart=10   " start with fold level of 1
" space in Cmd mode tries to fold
nnoremap <space> za
" }}}

" Misc {{{
set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class,*.o
set title
set visualbell
set noerrorbells
set list
set listchars=tab:».,trail:.,precedes:<,extends:>,nbsp:.
" }}}

" Ctrl+V {{{
" Use F3 to toggle the use of verbatim pasting mode
set pastetoggle=<F3>
" }}}

" Date & Time {{{
nmap <F5> i<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
imap <F5> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>
iab <expr> DTS strftime("%c")
" }}}

" Edit {{{
" sets paragraph to max width
vmap Q gq
nmap Q gqap
" }}}

" Learning {{{
" Disable Arrow keys in Cmd mode
"map <up> <nop>
"map <down> <nop>
"map <left> <nop>
"map <right> <nop>
" }}}

" Line shortcuts {{{
nnoremap j gj
nnoremap k gk
" Goto begin of line (overwrites existing binding)
" nnoremap B ^
" Goto end of line (overwrites existing binding)
" nnoremap E $
" highlight last inserted text
nnoremap gV `[v`]
set whichwrap+=<,>,[,]
" }}}

" Split shortcuts {{{
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" }}}

" Mode line {{{
" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
  let l:modeline = printf(" vim: set fdm=syntax ff=%d ts=%d sw=%d %set :",
        \ &fileformat, &tabstop, &shiftwidth, &expandtab ? '' : 'no')
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction
" Not working
nnoremap <Leader>ml :call AppendModeline()<CR>
" }}}

" Dictionary {{{
set dictionary+=/usr/share/dict/words
set dictionary+=~/.vim/words/common.txt
" spell check on (gives immense pain when works)
" set spell
" dictionary completion on (not working)
set complete+=k
" tag file completion on (not working)
set complete+=t
" find words for blah.tex in ~/.vim/words/tex.txt, etc.
au FileType * execute 'setlocal dict+=~/.vim/words/' .&filetype.'.txt'
" autocomplete syntax
set omnifunc=syntaxcomplete#Complete
" if has("autocmd") && exists("+omnifunc")
"     autocmd FileType *
"         \ if &omnifunc == "" |
"         \ setlocal omnifunc=syntaxcomplete#Complete |
"         \ endif
" endif

" personal tag file
set tag+=~/ros_ws/src/robosub/tags
set tag+=~/ros_ws/src/octomap/octomap/tags
" }}}

" Custom Syntax {{{
augroup vimrcSyntax
    autocmd!
    " HTML {{{
    autocmd FileType html,xml setlocal shiftwidth=2 tabstop=2
    " }}}
    " CMake {{{
    autocmd BufRead,BufNewFile CMake*.txt set filetype=cmake
    " }}}
    " Remove trailing white spaces in files {{{
    autocmd FileType c,cpp,java,php,python,cml,html,css,vim
        \ autocmd BufWritePre <buffer> :%s/\s\+$//e
    " }}}
augroup End
" }}}

" Sudo write function, doesn't work
cnoreabbrev <expr> w!!
                \((getcmdtype() == ':' && getcmdline() == 'w!!')
                \?('!sudo tee % >/dev/null'):('w!!'))

" au BufWritePost : immediately update changes after saving.
au BufLeave ~/.vimrc :source ~/.vimrc | :AirlineRefresh

" Testing and Debugging {{{
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
" }}}

" Signature {{{
iabbrev ssig -- <cr>Kunal Tyagi<cr>tyagi.kunal@live.com
iabbrev ssign Kunal Tyagi "tyagi.kunal@live.com"
iabbrev @@ thekunaltyagi@yahoo.com
" }}}

" Remapping {{{
" swap ; and : functions <WARN>
nnoremap ; :
nnoremap : ;

" Insert TAB by choice
imap <F4> <C-v><tab>

" Easy exit into normal mode fron insert mode
inoremap jk <Esc>
inoremap JK <Esc>
inoremap kj <Esc>
inoremap KJ <Esc>
inoremap HHHHH <Esc>
inoremap JJJJJ <Esc>
inoremap KKKKK <Esc>
inoremap LLLLL <Esc>
inoremap hhhhh <Esc>
inoremap jjjjj <Esc>
inoremap kkkkk <Esc>
inoremap lllll <Esc>
" }}}

" Mode line {{{
" add line to tell vim to fold data
" vim:foldmethod=marker:foldlevel=0
" }}}
" End .vimrc
