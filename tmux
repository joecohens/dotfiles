# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'tmux-plugins/tmux-prefix-highlight'
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'christoomey/vim-tmux-navigator'
set -g @plugin 'catppuccin/tmux'

# Resurrect for vim & neovim
set -g @resurrect-strategy-vim 'session'
set -g @resurrect-strategy-nvim 'session'

# Global config
set -g default-terminal "xterm-256color"
set -g status-right '#{prefix_highlight} | %a %Y-%m-%d %H:%M'
set -g @prefix_highlight_fg 'black'
set -g @prefix_highlight_bg 'white'
set-option -g mouse on
set-window-option -g mode-keys vi
set-option -g status-position top

# Start window numbers at 1 to match keyboard order with tmux window order
set -g base-index 1
set-window-option -g pane-base-index 1

# Renumber windows sequentially after closing any of them
set -g renumber-windows on

# Set theme
set -g @catppuccin_window_left_separator ""
set -g @catppuccin_window_right_separator " "
set -g @catppuccin_window_middle_separator " █"
set -g @catppuccin_window_number_position "right"

set -g @catppuccin_window_default_fill "number"
set -g @catppuccin_window_default_text "#W"

set -g @catppuccin_window_current_fill "number"
set -g @catppuccin_window_current_text "#W"

set -g @catppuccin_status_modules_right "directory session"
set -g @catppuccin_status_left_separator  " "
set -g @catppuccin_status_right_separator ""
set -g @catppuccin_status_fill "icon"
set -g @catppuccin_status_connect_separator "no"

set -g @catppuccin_directory_text "#{pane_current_path}"

# Soften status bar color from harsh green to bw
set -g status-bg '#ffffff'
set -g status-fg '#000000'

# Reload config with R
unbind r
bind r source-file ~/.tmux.conf

run '~/.tmux/plugins/tpm/tpm'

