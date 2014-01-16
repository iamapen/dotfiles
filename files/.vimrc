" vim:set foldmethod=marker:
" vim:set foldlevel=0:

if v:version < 700
    echoerr 'Does not work this version of Vim "' . v:version . '".'
    finish
endif

" for windows
if has('win32') || has('win64')
    set runtimepath^=$HOME/.vim
endif

" NeoBundle
"{{{
set nocompatible
filetype off
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim.git/
    call neobundle#rc(expand('~/.vim/bundle'))
endif
filetype plugin on

NeoBundle 'thinca/vim-quickrun'
NeoBundle 'Shougo/vimproc'
NeoBundle 'elzr/vim-json'

"runtime macros/matchit.vim
"}}}

" statusline
" {{{
set laststatus=2
set statusline=[%n]  "file no
set statusline+=%m   "changed?
set statusline+=%r   "read-only?
set statusline+=%h   "help?
set statusline+=%w   "preview?
set statusline+=%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']['.&ft.']'}  "encode, linefeed, filetype
set statusline+=%<%F  "filename
set statusline+=%=    "separator
set statusline+=%c/%{col('$')-1}:%l/%L  "列/全列:行/全行
set statusline+=%8P     "全体から見た現在ページの位置
" }}}

" apperance(表示系)
"{{{
" 不可視文字
set list
"set listchars=eol:$,tab:>\ ,extends:<
set listchars=tab:>\ ,extends:<
set display=uhex

set number
set ruler


" カーソル行強調
set cursorline
" current windowのみ
augroup cch
    autocmd! cch
    autocmd WinLeave * set nocursorline
    autocmd WinEnter,BufRead * set cursorline
augroup END
"}}}

" basic(基本設定)
" {{{
set nobackup
set nowrap
set backspace=indent
set nocompatible
"set hidden
set formatoptions=lmoq
set visualbell t_vb=                    " beep off
set whichwrap=b,s,h,l,<,>,[,]   " カーソルを行頭，行末で止まらないように
set showcmd
set showmode


" 記号文字の表示がおかしくならないように
set ambiwidth=double

set virtualedit=block

" sort order for explorer
let g:netrw_sort_sequence="[\\/]$,*,\\.\\(mv\\|old\\|cp\\|bak\\|orig\\)[0-9]*[\\/]$,\\.\\(mv\\|old\\|cp\\|bak\\|orig\\)[0-9]*$,\\.o$,\\.info$,\\.swp$,\\.obj$ "
" }}}

" colorscheme
" {{{
set t_Co=256
colorscheme iamapen
" }}}

" color(色関係)
" {{{
syntax enable
set background=dark

" 全角スペース
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=white
match ZenkakuSpace /　/
" }}}

" dictionary関連(C-x C-k)
"{{{
"autocmd FileType php :set dictionary=~/.vim/dict/php.dict
"}}}

" edit(編集関連)
"{{{
"set foldmethod=marker
set foldmethod=syntax       " foldingはfiletype別
set foldlevelstart=99       " 全展開で開始

set history=100     " コマンド履歴

" 前回終了したカーソル行に復帰
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" :Ptでインデントモード切替
"command! Pt :set paste!
set pastetoggle=<f5>

" buffer移動
nnoremap <silent> [b :bprev<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>
" 引数リスト移動
nnoremap <silent> [a :prev<CR>
nnoremap <silent> ]a :next<CR>
nnoremap <silent> [A :first<CR>
nnoremap <silent> ]A :last<CR>
" quickfixリスト移動
nnoremap <silent> [c :cprev<CR>
nnoremap <silent> ]c :cnext<CR>
nnoremap <silent> [C :cfirst<CR>
nnoremap <silent> ]C :clast<CR>
" ロケーション
nnoremap <silent> [l :lprev<CR>
nnoremap <silent> ]l :lnext<CR>
nnoremap <silent> [L :lfirst<CR>
nnoremap <silent> ]L :llast<CR>
" taglist
nnoremap <silent> [t :tprev<CR>
nnoremap <silent> ]t :tnext<CR>
nnoremap <silent> [T :tfirst<CR>
nnoremap <silent> ]T :tlast<CR>

" 現在の選択範囲を検索
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>
function! s:VSetSearch()
    let temp = @s
    norm! gv"sy
    let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
    let @s = temp
endfunction

" wrapトグル
nmap <silent> <f4> :set wrap!<CR>

" 不可視文字表示切り替え
function ListModeChange()
    if &listchars == 'tab:> ,extends:<'
        set listchars=eol:$,tab:>\ ,extends:<
    else
        set listchars=tab:>\ ,extends:<
    endif
    echo &listchars
endfunction
nmap <silent> <f3> :call ListModeChange()<CR>

" :Jqでjq
command! -nargs=? Jq call s:Jq(<f-args>)
function! s:Jq(...)
    if - 0 == a:0
        let l:arg = "."
    else
        let l:arg = a:1
    endif
    execute "%! jq \"" . l:arg . "\""
endfunction

" quickfixウィンドウをqで閉じる
autocmd FileType qf nnoremap <buffer> q :ccl<CR>
autocmd FileType qf nnoremap <buffer> <ESC> :ccl<CR>

" cwでquickfixウィンドウ表示をtoggle
"function! s:toggle_qf_window()
"  for bufnr in range(1, winnr('$'))
"    if getwinvar(bufnr, '&buftype') ==# 'quickfix'
"      execute 'ccl'
"      return
"    endif
"  endfor
"  execute 'botright cw'
"endfunction
"nnoremap <silent> cw :call <SID>toggle_qf_window()<CR>
"}}}

" encoding関連
" {{{
set enc=utf-8
set fenc=utf8
set fileencodings=utf-8,iso-2022-jp,cp932,euc-jp
set ffs=unix,dos
" }}}

" indent関連
" {{{
set autoindent
set smartindent
set cindent

set expandtab       " TABでスペース挿入
set tabstop=4
set shiftwidth=4    " autoindent
set softtabstop=0

set smarttab " 行頭TABは shiftwidth の数だけインデント
filetype indent on
" }}}

" plugin関連
" {{{
"-- quickrun
"let g:quickrun_config = {
"\    '_': {
"\       'outputter/buffer/split': 'botright 8sp',
"\       'hook/time/enable': 1,
"\       'runner': 'vimproc',
"\       'runner/vimproc/updatetime': 40,
"\    },
"\}
let g:quickrun_config = {
\    '_': {
\       'outputter/buffer/split': 'botright 8sp',
\       'hook/time/enable': 1,
\       'runner/vimproc/updatetime': 40,
\    },
\}
" }}}

" search関連
" {{{
set incsearch     "incremental search
set ignorecase
set smartcase     "検索文字列に大文字が含まれている場合のみ区別する
set hlsearch      "検索結果ハイライト
set nowrapscan
set infercase

"検索結果のハイライトをESCで消す
nmap <Esc><Esc> :nohlsearch<CR><Esc> 
" }}}



" お試し中
set nrformats=  "すべての数値を10進扱い。加算/減算用。

" 上書き
if filereadable(expand('~/.vimrc.local'))
    source ~/.vimrc.local
endif


" memo
" {{{
"if has('win32') || has('win64')
"    " Windowsの場合
"endif
"if has('gui_running')
"    " GUIの場合
"endif
" }}}

" TODO
" Surround.vim  囲みヘルパ
" Abolish.vim  強力な置換コマンド
" NERD_commenter.vim    簡単コメント
" YankRing              ペースト履歴
