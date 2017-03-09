" menu
source $VIMRUNTIME/delmenu.vim
set langmenu=ja_jp.utf-8
source $VIMRUNTIME/menu.vim
set guioptions-=T

"color
colorscheme iamapen
autocmd GUIEnter * set transparency=230


" font
set guifont=Terminal:h10:cSHIFTJIS

" ime color
if has('multi_byte_ime')
    highlight Cursor guifg=NONE guibg=Green
    highlight CursorIM guifg=NONE guibg=Purple
endif

" window size
set lines=40
set columns=120


" clipboard
set clipboard+=unnamed          " OSのクリップボードを使用
"set clipboard+=autoselect       " 選択範囲を自動でコピー(CUI)
set guioptions+=a               " 選択範囲を自動でコピー(GUI)

" mouse
set mouse=a
set ttymouse=xterm2
" 右クリックでOSのクリップボードをペースト
nnoremap <RightMouse> "*p
inoremap <RightMouse> <C-r><C-o>*
