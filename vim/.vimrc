" Begin .vimrc

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
filetype indent on
filetype plugin on
set autoindent
set smartindent
" }}}

" Search {{{
set ignorecase          " Do case insensitive matching
set smartcase           " Do smart case matching
set incsearch           " Incremental search
set hlsearch            " Highlight all matches
" remove highlighted matches
nnoremap <leader><space> :nohlsearch<CR>
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

" Status bar {{{
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
set statusline+=%=                              "left/right separator
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  "highlight current word type
set statusline+=%c,                             "cursor column
set statusline+=%V                              "virtual cursor column
set statusline+=%l/%L                           "cursor line/total lines
set statusline+=\ %P                            "percent through file
" }}}

" Pathogen {{{
"execute pathogen#infect()
" }}}

" Remapping {{{
let mapleader=";"
nnoremap ; :
imap <F4> <C-v><tab>
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

" Ctrl+V {{{
" Use F3 to toggle the use of system clipboard for pasting
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
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
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
" }}}

" Split shortcuts {{{
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" }}}

cnoreabbrev <expr> w!!
                \((getcmdtype() == ':' && getcmdline() == 'w!!')
                \?('!sudo tee % >/dev/null'):('w!!'))

" indentation plugin
if has("autocmd")
    filetype plugin indent on
endif


" au BufWritePost : immediately update changes after saving.
au BufLeave ~/.vimrc :source ~/.vimrc

" Signature {{{
iabbrev ssig -- <cr>Kunal Tyagi<cr>tyagi.kunal@live.com
iabbrev ssign Kunal Tyagi "tyagi.kunal@live.com"
iabbrev @@ thekunaltyagi@yahoo.com
" }}}

" Remove trailing white spaces in files
autocmd FileType c,cpp,java,php,python autocmd BufWritePre <buffer> :%s/\s\+$//e

" autocmd filetype html,xml set listchars-=tab:>.

" Mode line {{{
" add line to tell vim to fold data
" vim:foldmethod=marker:foldlevel=0
" }}}
" End .vimrc
