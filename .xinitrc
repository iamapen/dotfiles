#!/bin/sh

# for Let's note (Left=無変換 Right=変換)
xmodmap -e 'keycode 102 = Pointer_Button1'
xmodmap -e 'keycode 100 = Pointer_Button3'

# enable mousekey and expire off
xkbset m
xkbset exp =m
