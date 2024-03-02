local wezterm = require 'wezterm'

return {
  default_prog = { '/opt/homebrew/bin/fish', '-l' },
  window_decorations = 'RESIZE',
  font = wezterm.font('JetBrains Mono'),
  font_size = 13.0,
  window_background_opacity = 0.95,
}
