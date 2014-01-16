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
