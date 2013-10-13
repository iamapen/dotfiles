" vim 設定ファイル
" ~/.vimrc

"====================
"   color
"====================
syntax enable

highlight LineNr ctermfg=darkyellow
highlight NonText ctermfg=darkgrey
highlight Folded ctermfg=blue
highlight SpecialKey cterm=underline ctermfg=darkgrey   " 特殊記号
highlight DiffAdd cterm=bold ctermbg=green
highlight StatusLine ctermbg=black ctermfg=white
set background=dark

" プルダウンの配色
highlight Pmenu ctermbg=4
highlight PmenuSel ctermbg=1
highlight PmenuSbar ctermbg=4

" TAB
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab			" tabでスペース挿入

"====================
"	encoding
"====================
set enc=utf-8
set fenc=utf8
set fileencodings=utf-8,iso-2022-jp,cp932,euc-jp

"
set number
set foldmethod=marker

" backup
set nobackup


"exploreのソート順
let g:netrw_sort_sequence="[\\/]$,*,\\.\\(mv\\|old\\|cp\\|bak\\|orig\\)[0-9]*[\\/]$,\\.\\(mv\\|old\\|cp\\|bak\\|orig\\)[0-9]*$,\\.o$,\\.info$,\\.swp$,\\.obj$ "

" 記号文字の表示がおかしくならないように
set ambiwidth=double

"set backupdir=~/tmp/vim
"set directory=~/tmp/vim
"set nowrap
set guioptions+=b
set hlsearch					" Switch on search pattern highlighting.
set autoindent					" 新しい行を自動インデント
set smartindent					" 新しい行を高度な自動インデント
set smarttab					" shiftwidth の数だけインデント
set whichwrap=b,s,h,l,<,>,[,]	" カーソルを行頭，行末で止まらないように
set nocompatible				" VI互換を無効
set laststatus=2				" ステータスラインを表示
set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']['.&ft.']'}\ %F%=%l,%c%V%8P	" ステータスライン

filetype on
filetype indent on
filetype plugin on

sy on

" 全角スペースを視覚化
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=white
match ZenkakuSpace /　/


" ===================
"	検索関連
" ===================
" 検索文字列が小文字の場合は区別なく検索
"(noignorecase)
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索
"(nosmartcase)
set smartcase
" インクリメンタルサーチ
set incsearch

" 検索結果のハイライトをESCで消す
nmap <Esc><Esc> :nohlsearch<CR><Esc>

if v:version < 700
	set migemo
endif
	

" ====================
"	auto command
" ====================
augroup InsertHook
"autocmd!
autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90

autocmd FileType php :set omnifunc=phpcomplete#CompletePHP
autocmd FileType class :set omnifunc=phpcomplete#CompletePHP
autocmd FileType html,javascript :set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType *
    \ if &omnifunc == "" |
    \   setlocal omnifunc=syntaxcomplete#Complete |
    \ endif



