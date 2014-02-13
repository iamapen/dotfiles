app.Env("CYGWIN") = "nodosfilewarning";

Config.tty.execute_command = "/bin/bash --login -i";
Config.tty.title = "ck3";
Config.tty.savelines = 1000;
Config.tty.input_encoding   = Encoding.UTF8;
Config.tty.display_encoding = Encoding.SJIS | Encoding.EUCJP | Encoding.UTF8;
Config.tty.scroll_key = 1;
Config.tty.scroll_output = 0;
Config.tty.bs_as_del  = 0;
Config.tty.use_bell   = 0;
Config.tty.cjk_width  = 1;

Config.window.position_x = null;
Config.window.position_y = null;
Config.window.cols = 120;
Config.window.rows = 40;

Config.window.scrollbar_show  = 1;
Config.window.scrollbar_right = 1;
Config.window.blink_cursor    = 0;
Config.window.zorder          = WinZOrder.Normal;
Config.window.transparent     = 0xC8;
Config.window.linespace       = 0;
Config.window.border_left     = 1;
Config.window.border_top      = 1;
Config.window.border_right    = 1;
Config.window.border_bottom   = 1;

Config.window.font_name = "MS Gothic";
Config.window.font_size = 9;

Config.window.background_file     = "";
Config.window.background_repeat_x = Place.NoRepeat;
Config.window.background_repeat_y = Place.NoRepeat;
Config.window.background_align_x  = Align.Center;
Config.window.background_align_y  = Align.Center;
Config.window.color_foreground    = 0xFFFFFF;
Config.window.color_background    = 0x000000;
Config.window.color_selection     = 0x663297FD;
Config.window.color_cursor        = 0x00AA00;
Config.window.color_imecursor     = 0xAA0000;

Config.window.color_alpha   = 0xCC;
Config.window.color_color0  = 0x000000;
Config.window.color_color1  = 0xCD0000;
Config.window.color_color2  = 0x00CD00;
Config.window.color_color3  = 0xCDCD00;
Config.window.color_color4  = 0x0000CD;
Config.window.color_color5  = 0xCD00CD;
Config.window.color_color6  = 0x00CDCD;
Config.window.color_color7  = 0xE5E5E5;
Config.window.color_color8  = 0x4D4D4D;
Config.window.color_color9  = 0xFF0000;
Config.window.color_color10 = 0x00FF00;
Config.window.color_color11 = 0xFFFF00;
Config.window.color_color12 = 0x0000FF;
Config.window.color_color13 = 0xFF00FF;
Config.window.color_color14 = 0x00FFFF;
Config.window.color_color15 = 0xFFFFFF;

Config.window.mouse_left         = MouseCmd.Select;
Config.window.mouse_middle       = MouseCmd.Paste;
Config.window.mouse_right        = MouseCmd.Paste;

Config.accelkey.new_shell        = Keys.ShiftL | Keys.CtrlL | Keys.N;
Config.accelkey.new_window       = Keys.ShiftL | Keys.CtrlL | Keys.M;
Config.accelkey.open_window      = Keys.ShiftL | Keys.CtrlL | Keys.O;
Config.accelkey.close_window     = Keys.ShiftL | Keys.CtrlL | Keys.W;
Config.accelkey.next_shell       = Keys.CtrlL  | Keys.Tab;
Config.accelkey.prev_shell       = Keys.ShiftL | Keys.CtrlL | Keys.Tab;
Config.accelkey.paste            = Keys.ShiftL | Keys.Insert;
Config.accelkey.popup_menu       = Keys.ShiftL | Keys.F10;
Config.accelkey.popup_sys_menu   = Keys.AltR   | Keys.Space;
Config.accelkey.scroll_page_up   = Keys.ShiftL | Keys.PageUp;
Config.accelkey.scroll_page_down = Keys.ShiftL | Keys.PageDown;
Config.accelkey.scroll_line_up   = Keys.None;
Config.accelkey.scroll_line_down = Keys.None;
Config.accelkey.scroll_top       = Keys.ShiftL | Keys.Home;
Config.accelkey.scroll_bottom    = Keys.ShiftL | Keys.End;
