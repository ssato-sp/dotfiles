
" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

let g:python3_host_prog = expand('$HOME/dotfiles/.python/.pyenv/versions/python3_neovim/bin/python')
let $CONFIG = $XDG_CONFIG_HOME
let $CACHE  = $XDG_CACHE_HOME
let $DATA   = $XDG_DATA_HOME

let mapleader = "\<Space>"

" Load File
function! s:load(file) abort
  let s:path = expand('$CONFIG/nvim/dein/' . a:file . '.vim')    
  if filereadable(s:path)
    execute 'source' fnameescape(s:path)
  endif
endfunction

call s:load('plugins')

" setting
set viminfo=
set fenc=utf-8
set autoread
set hidden
set showcmd

" color schema    
autocmd ColorScheme * highlight LineNr ctermfg=255

highlight Normal ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE
highlight LineNr ctermbg=NONE guibg=NONE
highlight Folded ctermbg=NONE guibg=NONE
highlight EndOfBuffer ctermbg=NONE guibg=NONE

set number    
set cursorline    
set virtualedit=onemore    
set smartindent
set visualbell
set showmatch
set laststatus=2
set wildmode=list:longest
nnoremap j gj
nnoremap k gk

set expandtab
set tabstop=4
set shiftwidth=4

set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch

set timeout timeoutlen=3000 ttimeoutlen=100

nnoremap ; :
nnoremap : ;

nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H

nnoremap sc :<C-u>tabnew<CR>
nnoremap sn gt
nnoremap sp gT

nnoremap <Leader>z :noh<CR>
