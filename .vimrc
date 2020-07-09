
" ENV
let $CONFIG = empty($XDG_CONFIG_HOME) ? expand('$HOME/.config')      : $XDG_CONFIG_HOME
let $CACHE  = empty($XDG_CACHE_HOME)  ? expand('$HOME/.cache')       : $XDG_CACHE_HOME
let $DATA   = empty($XDG_DATA_HOME)   ? expand('$HOME/.local/share') : $XDG_DATA_HOME
let g:python3_host_prog = $PYENV_ROOT.'/versions/neovim/bin/python'

" Load File
function! s:load(file) abort
  let s:path = expand('$CONFIG/nvim/dein/' . a:file . '.vim')
  if filereadable(s:path)
    execute 'source' fnameescape(s:path)
  endif
endfunction

call s:load('plugins')

" setting
"文字コードをUFT-8に設定
set fenc=utf-8
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd
" color schema
set background=dark
colorscheme hybrid

" 見た目系
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk

" Tab系
" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=4
" 行頭でのTab文字の表示幅
set shiftwidth=4

" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>
noremap ; :
noremap : ;

inoremap { {}<Left>
inoremap [ []<Left>
inoremap ( ()<Left>
inoremap " ""<Left>
inoremap ' ''<Left>
inoremap < <><Left>


" window split mapping
" window大きさ変更 <C-e>[h,j,k,l]
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

"タブ操作
nnoremap st :<C-u>tabnew<CR>
nnoremap sn gt
nnoremap sp gT

" terminal
nnoremap <Leader>t :<C-u>sp<CR><C-w>j :term<CR>
tnoremap <C-[> : <C-\><C-n>

