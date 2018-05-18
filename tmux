# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'tmux-plugins/tmux-prefix-highlight'
set -g @plugin 'christoomey/vim-tmux-navigator'
set -g @plugin 'tmux-plugins/tmux-resurrect'

# Global config
set -g default-terminal "xterm-256color"
set -g status-right '#{prefix_highlight} | %a %Y-%m-%d %H:%M'
set -g @prefix_highlight_fg 'black'
set -g @prefix_highlight_bg 'white'

# Start window numbers at 1 to match keyboard order with tmux window order
set -g base-index 1
set-window-option -g pane-base-index 1

# Renumber windows sequentially after closing any of them
set -g renumber-windows on

# Soften status bar color from harsh green to bw
set -g status-bg '#ffffff'
set -g status-fg '#000000'

# Reload config with R
unbind r
bind r source-file ~/.tmux.conf

run '~/.tmux/plugins/tpm/tpm'

