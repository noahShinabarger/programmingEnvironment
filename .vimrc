"This is the .vimrc of Noah Shinabarger

"Disable Arrowkeys/Mouse
nnoremap <up>       <nop>
nnoremap <down>     <nop>
nnoremap <left>     <nop>
nnoremap <right>    <nop>
inoremap <up>       <nop>
inoremap <down>     <nop>
inoremap <left>     <nop>
inoremap <right>    <nop>

"Enable Pathogen
execute pathogen#infect()

"Enables NERDtree on startup
"autocmd vimenter * NERDTree


"let base16colorspace=256
colorscheme sierra

filetype plugin on

"Enable syntax recognition
syntax enable
syntax on
set cindent
set smartindent
filetype indent on
set showmatch		"highlight matching [{()}]
set foldenable
:silent !echo g++

"Sets leader key to space
let mapleader=" "

"Highlights/removes trailing whitespace
match ErrorMsg '\s\+$'
nnoremap <Leader>rtw :%s/\s\+$//e<CR>
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction
nnoremap <silent><Leader>rts :call TrimWhiteSpace() <CR>

"Customizes searching
set incsearch	"search as the characters are typed
set hlsearch	"highlight matches
set showmatch
nnoremap <leader><space> :nohlsearch<CR>
set ignorecase	"if you search without capitalization, will ignore case
set smartcase	"if you search with capitalization, will be case-specific
set gdefault	"substitutions are, by default, global
nnoremap <tab> %
vnoremap <tab> %

"Sets line number display schematic
set number
set relativenumber
set numberwidth=4
set cursorline

"Disables vi compatibility
set nocompatible

"Sets indentation preferences
set expandtab	"tabs are made of spaces
set tabstop=4	"number of visual spaces per tab
set softtabstop=4	"number of spaces a tab counts for when editing
set shiftwidth=4	"number of spaces used for indentation
set autoindent

autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

"Makes long lines handled in a better manner
set wrap
set textwidth=79
set formatoptions=qrn1
"I can't get the colorcolumns to look right, so they're being disabled for now
set colorcolumn=73,80
set colorcolumn=0

"Ensures you always have 'x' lines of context
set scrolloff=5

set showcmd

"Enables auto-complete for commands
set wildmenu
set wildmode=list:longest,full

"Uses a visual bell instead of an auditory bell
set visualbell

"Redraw only when necessary
set lazyredraw

"Ensures everything is autosaved
autocmd FocusLost * :wa

"-----------------------------------------
"Keyboard Shortcuts
"-----------------------------------------

"Make movement across wrapped lines more natural
"nnoremap j gj
"nnoremap k gk

"Make colon more natural to press in normal mode
nnoremap ; :

nnoremap 0 ^

inoremap fj <ESC>

nnoremap _ ddp
nnoremap - :m-2<CR>==

nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

hi Normal ctermbg=none
hi NonText ctermbg=none
