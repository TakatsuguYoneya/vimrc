" Author: Takatsugu Yoneya

set autoindent
set autoread
set autowrite
set backspace=indent,eol,start
set cursorcolumn
set cursorline
set encoding=utf8
set expandtab
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set fileformats=unix,dos,mac
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set list
set listchars=tab:>-,trail:-,eol:↲,nbsp:%,extends:>,precedes:<
set mouse=a
set nobackup
set noswapfile
set nrformats-=octal
set nu
set shiftwidth=2
set showcmd
set showmatch
set smartcase
set smartindent
set softtabstop=2
set statusline=%<%F\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set tabstop=4
set title
set whichwrap=b,s,[,],<,>
set wildmode=list:longest
set wrapscan

""""""""""""""""
" Keybinds
"
" OSXとそれ以外でキーバインドを変更する
if system('uname') =="Darwin\n"
  colorscheme hybrid
  " TODO そのうちkeybind変える
  nnoremap <C-n> gt
  nnoremap <C-p> gT
  inoremap <expr><C-g>  neocomplcache#undo_completion()
  inoremap <expr><C-l>  neocomplcache#complete_common_string()
else
  colorscheme molokai
  nnoremap <C-n> gt
  nnoremap <C-p> gT
  inoremap <expr><C-g>  neocomplcache#undo_completion()
  inoremap <expr><C-l>  neocomplcache#complete_common_string()
endif

" 折り返し時に表示行単位での移動をできるようにする
nnoremap j gj
nnoremap k gk

" 英字キーボードに合わせてコロンとセミコロンを入れ替える
noremap ; :

" reload
nnoremap ,r :<C-u>source $HOME/.vimrc<CR>

" highlight解除キー
nnoremap ,h :noh<CR>

syntax on

""""""""""""""""
" DEIN
"
if &compatible
  set nocompatible
endif
filetype plugin indent on

set runtimepath+=~/.vim/dein/dein.vim
call dein#begin(expand('~/.vim/dein'))
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/neocomplcache.vim')
call dein#add('Shougo/unite.vim')
call dein#add('airblade/vim-gitgutter')
call dein#add('groenewege/vim-less')
call dein#add('itchyny/lightline.vim')
call dein#add('jistr/vim-nerdtree-tabs')
call dein#add('jwalton512/vim-blade')
call dein#add('kannokanno/previm')
call dein#add('kchmck/vim-coffee-script')
call dein#add('miyakogi/seiya.vim')
call dein#add('nikvdp/ejs-syntax')
call dein#add('plasticboy/vim-markdown')
call dein#add('posva/vim-vue')
call dein#add('rhysd/accelerated-jk')
call dein#add('scrooloose/nerdtree')
call dein#add('tpope/vim-fugitive')
call dein#add('twitvim/twitvim')
call dein#add('tyru/open-browser.vim')
call dein#end()

if dein#check_install()
  call dein#install()
endif

""""""""""""""""""
" autocmd の設定一覧
"
augroup vimrc_loading
  autocmd!
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  autocmd BufNewFile,BufRead vim set expandtab shiftwidth=2 softtabstop=2
  autocmd BufNewFile,BufRead *.coffee set filetype=coffee expandtab shiftwidth=2 softtabstop=2
  autocmd BufNewFile,BufRead *.ejs set filetype=ejs expandtab shiftwidth=2 softtabstop=2
  autocmd BufNewFile,BufRead .env.* set filetype=sh expandtab shiftwidth=2 softtabstop=2
  autocmd BufNewFile,BufRead *.html set filetype=html expandtab shiftwidth=2 softtabstop=2
  autocmd BufNewFile,BufRead *.less set filetype=less expandtab shiftwidth=2 softtabstop=2
  autocmd BufNewFile,BufRead *.md set filetype=markdown expandtab shiftwidth=2 softtab=2
  autocmd BufNewFile,BufRead *.php set filetype=php noexpandtab shiftwidth=4 softtabstop=4
  autocmd BufNewFile,BufRead *.py set filetype=python expandtab shiftwidth=2 softtabstop=2
  autocmd BufNewFile,BufRead *.blade.php set filetype=php expandtab shiftwidth=2 softtabstop=2
  autocmd BufNewFile,BufRead *.vue set filetype=vue expandtab shiftwidth=2 softtabstop=2
augroup END

""""""""""""""""""
" lightlineの設定
"

set t_Co=256

let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste'],
  \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'fugitive#head'
  \ },
  \ }

"""""""""""""""""""
" NERDTREEの設定
"

" Ctr + r でTreeを開けるようにする
nnoremap <silent><C-t> :NERDTreeTabsToggle<CR>

let g:nerdtree_tabs_open_on_console_startup = 1

" 隠しファイルを表示
let NERDTreeShowHidden = 1

" NerdTreeの幅設定
let NERDTreeWinSize = 25

" DefaultでBookmarkを表示
let g:NERDTreeShowBookmarks = 1

"""""""""""""""""""
" NEOCOMPLCACHEの設定
"

" AcpComplpopを無効化
let g:acp_enableAtStartup = 0
" 起動時にneocomplcacheを有効
let g:neocomplcache_enable_at_startup = 1
" 大文字が入力されるまで大文字小文字の区別を無視
let g:neocomplcache_enable_smart_case = 1
" _区切りの補完を有効
let g:neocomplcache_enable_underbar_completion = 1
" 3文字からシンタックスをキャッシュする
let g:neocomplcache_min_syntax_length = 3
" KeyWordパターンを設定
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
  \ 'default' : ''
  \ }


""""""""""""""""""""
" vim-gitgutterの設定
"

" vim起動時にgit差分をハイライトで表示する
let g:gitgutter_highlight_lines = 1

" 更新時間を早める
set updatetime=250

filetype plugin indent on

"""""""""""""""""""
" Seiyaの設定
"
let g:seiya_auto_enable = 1

"""""""""""""""""""
" twitvimの設定
"

" twitvimを有効にする
let g:twit_vim_enable_python = 1
let twitvim_count = 40

nnoremap ,tl :<C-u>SetLoginTwitter<CR>
nnoremap ,tp :<C-u>PosttoTwitter<CR>
nnoremap ,tf :<C-u>FriendsTwitter<CR>
nnoremap ,tn :<C-u>NextTwitter<CR>

""""""""""""""""""
" Unite.vim の設定
"

" 入力モードでスタートさせる
let g:unite_enable_start_insert=1

" バッファ一覧
noremap ,ub :Unite buffer<CR>
" ファイル一覧
noremap ,uf :Unite -buffer-name=file file<CR>
" 最近使ったファイル一覧
noremap ,ur :Unite file_mru<CR>
" sourceを今見ているディレクトリ以下にする
noremap ,ucd :<C-u>UniteWithBufferDir file -buffer-name=file<CR>

" ウィンドウを分割して開く
au Filetype unite nnoremap <silent> <buffer> <expr> <C-S> unite#do_action('split')
au Filetype unite inoremap <silent> <buffer> <expr> <C-S> unite#do_action('split')

" esc2回押しで終了
au filetype unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au filetype unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

""""""""""""""""
" accelerated-jk
"
nmap j <Plug>(accelerated_jk_gj_position)
nmap k <Plug>(accelerated_jk_gk_position)
nmap <Down> <Plug>(accelerated_jk_gj_position)
nmap <Up> <Plug>(accelerated_jk_gk_position)

""""""""""""""""
" vim-markdownの設定
"
let g:previm_open_cmd = 'open -a Chrome'
