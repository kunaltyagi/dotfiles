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
" Git wrapper
Plugin 'tpope/vim-fugitive'
" Git gutter
Plugin 'airblade/vim-gitgutter'
" Surround
Plugin 'tpope/vim-surround'
" Repeat
Plugin 'tpope/vim-repeat'
" Better increment/decrement for dates
Plugin 'tpope/vim-speeddating'
" Better substitution
Plugin 'tpope/vim-abolish'
" Snippet engine
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine
Plugin 'honza/vim-snippets'
" Better movements
Plugin 'tpope/vim-unimpaired'
" Faster movement in window
Plugin 'easymotion/vim-easymotion'
" Better comments, NOT WORKING
Plugin 'tpope/vim-commentary'
" ag plugin, sudo apt-get install silversearcher-ag
Plugin 'rking/ag.vim'
" Fuzzy search
Plugin 'ctrlpvim/ctrlp.vim'
" Run time completion
"Plugin 'Valloric/YouCompleteMe'
" Theme manager
Plugin 'reedes/vim-thematic'
" Tagbar
Plugin 'majutsushi/tagbar'
" Better undo, SUCKS
Plugin 'sjl/gundo.vim'
" Markdown Syntax
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
" Navigation Tree
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
" Better Sublime-ish delimiters
Plugin 'Raimondi/delimitMate'

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
" CtrlP {{{
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
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
" YouCompleteMe {{{
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
" [<Tab>, '<Down>, '<Enter>]
let g:ycm_key_list_select_completion = ['<Down>']
" }}}
" Ag {{{
nnoremap <leader>a :Ag
" }}}
" TagBar {{{
nnoremap <F8> :TagbarToggle<CR>
" }}}
" Thematic {{{
let g:thematic#theme_name = 'ron'
" }}}
" Gundo {{{
" Not working
nnoremap <leader>u :GundoToggle<CR>
" }}}
" Syntastic {{{
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_quiet_messages = { "type": "syntax" } " For catkin_ws, it fucks up the warnings
" }}}
" Markdown {{{
let g:vim_markdown_math=1
let g:vim_markdown_frontmatter=1
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
if has("autocmd")
    filetype plugin indent on
endif
set autoindent
set smartindent
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

" Pathogen {{{
"execute pathogen#infect()
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

" dictionary on
set dictionary+=/use/share/dict/words
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
set tag+=~/catkin_ws/src/robosub/tags
set tag+=~/catkin_ws/src/octomap/octomap/tags

" Sudo write function, doesn't work
cnoreabbrev <expr> w!!
                \((getcmdtype() == ':' && getcmdline() == 'w!!')
                \?('!sudo tee % >/dev/null'):('w!!'))

au BufWritePost : immediately update changes after saving.
" au BufLeave ~/.vimrc :source ~/.vimrc

" Signature {{{
iabbrev ssig -- <cr>Kunal Tyagi<cr>tyagi.kunal@live.com
iabbrev ssign Kunal Tyagi "tyagi.kunal@live.com"
iabbrev @@ thekunaltyagi@yahoo.com
" }}}

" Remove trailing white spaces in files
autocmd FileType c,cpp,java,php,python autocmd BufWritePre <buffer> :%s/\s\+$//e

" autocmd filetype html,xml set listchars-=tab:>.

" Status bar {{{
set noruler
set laststatus=2
set statusline=                                 "clear the status line
set statusline+=%-3.3n\                         " buffer number
set statusline+=%#todo#                         "todo color
set statusline+=%F                              "full filename
set statusline+=%*                              "normal color
"set statusline=%t                               "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}]                         "file format
set statusline+=%#error#                        "error color
set statusline+=%h                              "help file flag
set statusline+=%m                              "modified flag
set statusline+=%r                              "read only flag
set statusline+=%w                              "preview flag
set statusline+=%*                              "normal color
set statusline+=%y                              "filetype
" Syntastic {{{
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
" }}}
set statusline+=%=                              "left/right separator
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  "highlight current word type
set statusline+=%c,                             "cursor column
set statusline+=%V                              "virtual cursor column
set statusline+=%l/%L                           "cursor line/total lines
set statusline+=\ %P                            "percent through file
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
" fd0868c1d6ce6bf015c0
" 90b78698ebe6f6f8c4ac
" KTRRA-CV3WN-RL3DU-4PGD6-83SR2
" sutekgfytsbkcepr
" a0cbc c1f11 ab94c c4642 (1/1)
" 94bb3 289be 97908 307ec (0/1)
