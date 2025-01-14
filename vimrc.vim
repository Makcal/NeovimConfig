"  _   _                 _            
" | \ | | ___  _____   _(_)_ __ ___   
" |  \| |/ _ \/ _ \ \ / / | '_ ` _ \  
" | |\  |  __/ (_) \ V /| | | | | | | 
" |_| \_|\___|\___/ \_/ |_|_| |_| |_| 
"                                     
" by Stephan Raabe (2023) 
" ----------------------------------------------------- 

set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set relativenumber          " add relative line numbers
set wildmode=longest,list   " get bash-like tab completions
" set cc=80                   " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamed       " (not) using system clipboard
filetype plugin on
" set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
" set spell                 " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.

hi NonText ctermbg=none guibg=NONE
hi Normal guibg=NONE ctermbg=NONE
hi NormalNC guibg=NONE ctermbg=NONE
hi SignColumn ctermbg=NONE ctermfg=NONE guibg=NONE

hi Pmenu ctermbg=NONE ctermfg=NONE guibg=NONE
hi FloatBorder ctermbg=NONE ctermfg=NONE guibg=NONE
hi NormalFloat ctermbg=NONE ctermfg=NONE guibg=NONE
hi TabLine ctermbg=None ctermfg=None guibg=None

" ======
" CUSTOM
" ======

" delete forward in insert mode (delete backward is <C-w>)
imap <C-Del> <Esc><Right>dei

" pseudo rename (use <Leader>ra instead)
nnoremap <F2> gd[{V%::s/<C-R>///gc<left><left><left>
nnoremap <F14> gd:%s/<C-R>///gc<left><left><left>

" duplicate line(s)
nnoremap dl "dyy']"dp

" line moves
nnoremap <M-Up> ^:IMoveNodeWithLeft<CR>
nnoremap <M-Down> ^:IMoveNodeWithRight<CR>

" swap
nnoremap <M-s> :ISwapWithRight<CR>

" Quit without save
nnoremap <C-q><C-q> <cmd>wa<CR><cmd>qa<CR>

" changes to the directory on each buffer change
"set autochdir

" open quickfix window automatically when AsyncRun is executed
" set the quickfix window 6 lines height.
let g:asyncrun_open = 6
" F10 to toggle quickfix window
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>

" Normal mode enter
nnoremap <S-CR> A<CR><ESC>

" Insert mode save
inoremap <C-s> <cmd>w<CR>

" Signature help
inoremap <C-p> <cmd>lua vim.lsp.buf.signature_help()<CR>

" Around without leading spaces
"nmap ya y2i
"nmap va v2i
"nmap da d2i
"nmap ca c2i

" Replace selected
vnoremap <C-r> "hy:%s/\<<C-r>h\>//gc<left><left><left>

" Find selected
vnoremap <C-f> "hy/\<<C-r>h\><CR>N

" Help tab
nnoremap H K

" LSP signature overloads
inoremap <C-m> <cmd>LspOverloadsSignature<CR>

" Treat .h as C header
let g:c_syntax_for_h = 1

