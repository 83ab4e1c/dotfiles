local wezterm = require("wezterm");
return {
  -- default_prog = {"pwsh"},
  enable_wayland = true,
  enable_tab_bar = false,
  initial_cols = 120,
  initial_rows = 30,
  font = wezterm.font_with_fallback({
    'Operator Mono Book',
    'Operator Mono Medium',
    'ComicMono Nerd Font',
    'LXGWWenKaiMono Nerd Font',
  }),
  font_size = 18,
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
  color_scheme = "Github Dark",
  colors = {
    background = '#262a33',
  },
  cursor_blink_ease_in = "Constant",
  cursor_blink_ease_out = "Constant",
  enable_csi_u_key_encoding = true
}
