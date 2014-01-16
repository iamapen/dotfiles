@echo off
setlocal

set BASE_DIR=%~dp0
set VIMRUNTIME="C:\cygwin\home\pen\project\rc\.vim"

cd "%HOMEDRIVE%\%HOMEPATH%"
mklink .vimrc "%BASE_DIR%\files\.vimrc"
mklink .gvimrc "%BASE_DIR%\files\.gvimrc"

mkdir .vim
cd .vim
mklink /d bundle "%VIMRUNTIME%\bundle"
mklink /d colors "%VIMRUNTIME%\colors"
mklink /d ftplugin "%VIMRUNTIME%\ftplugin"
mklink filetype "%VIMRUNTIME%filetype"

endlocal
