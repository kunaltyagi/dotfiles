" Begin .vimrc

syntax on
let mapleader=";"
"set columns=80
set wrapmargin=8
set ruler
set mouse=a
set background=dark
set shiftwidth=4
set tabstop=4
set autoindent
set expandtab
set smartindent
set number
set pastetoggle=<F3>
set smarttab
set hlsearch
set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class,*.o
set title
set visualbell
set noerrorbells
set list
set listchars=tab:».,trail:.,precedes:<,extends:>,nbsp:.
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set ignorecase          " Do case insensitive matching
set smartcase           " Do smart case matching
set incsearch           " Incremental search
set hidden              " Hide buffers when they are abandoned

" Status bar begin
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
" Status bar end

" Pathogen plugin
execute pathogen#infect()

" Remapping
nnoremap ; :
imap <F4> <C-v><tab>
inoremap jk <Esc>
inoremap jjjjj <Esc>
inoremap kkkkk <Esc>
nmap <F5> i<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
imap <F5> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>
vmap Q gq
nmap Q gqap
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
nnoremap j gj
nnoremap k gk
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
cnoreabbrev <expr> w!!
                \((getcmdtype() == ':' && getcmdline() == 'w!!')
                \?('!sudo tee % >/dev/null'):('w!!'))

" indentation plugin
if has("autocmd")
    filetype plugin indent on
endif


" au BufWritePost : immediately update changes after saving.
au BufLeave ~/.vimrc :source ~/.vimrc

" Shortcuts
iabbrev ssig -- <cr>Kunal Tyagi<cr>tyagi.kunal@live.com
iabbrev ssign Kunal Tyagi "tyagi.kunal@live.com"
iabbrev @@ thekunaltyagi@yahoo.com
iab <expr> DTS strftime("%c")

" Remove trailing white spaces in files
autocmd FileType c,cpp,java,php,python autocmd BufWritePre <buffer> :%s/\s\+$//e

" autocmd filetype html,xml set listchars-=tab:>.

" End .vimrc
