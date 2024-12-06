"" basic sets
set ignorecase
set scrolloff=10
set history=1000
set hlsearch
set incsearch
set number relativenumber
set showcmd
set showmode

"" leader
noremap <space> <nop>
let mapleader = " "

"" escape remap
inoremap kl <esc>
inoremap <esc> <nop>

"" movement remap
noremap j h
noremap k j
noremap l k
noremap ñ l

"" x doesnt go to defoult registry
nnoremap x "_x
"" make X a "remove without going to registry" operator
nmap X "_d
nmap XX "_dd
vmap X "_d
vmap XX "_dd

"" changeing with c doesnt go to register either
nnoremap c "xc
xnoremap c "xc

"" clear search
nnoremap <silent> <leader>h :let @/ = ""<CR>

"" idk
filetype plugin indent on

"" quick-scope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

"" which-key
set notimeout
let g:WhichKey_PrefixColor = "#a403fe"
let g:WhichKey_CommandColor = "#01ffff"
let g:WhichKey_PrefixStyle = "bold"
let g:WhichKey_KeyStyle = "italic"
let g:WhichKey_SortOrder = "by_key_prefix_first"
let g:WhichKey_ShowTypedSequence = "true"

"" highlightedyank
let g:highlightedyank_highlight_duration = 250


"" Plugins
call plug#begin()
"" General
Plug 'unblevable/quick-scope'
Plug 'justinmk/vim-sneak'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'vim-scripts/argtextobj.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'junegunn/vim-peekaboo'
Plug 'liuchengxu/vim-which-key'
call plug#end()

echo "buenas"
