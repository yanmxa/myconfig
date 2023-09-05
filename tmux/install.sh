

yum install tmux

mv ~/.tmux.conf ~/.tmux.conf.bak

cp tmux/tmux.conf ~/.tmux.conf

# clone tmux plgin
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Reload TMUX environment so TPM is sourced:
# type this in terminal if tmux is already running
tmux source ~/.tmux.conf

# Installing plugins
# Add new plugin to ~/.tmux.conf with set -g @plugin '...'
# Press `prefix + I` 

# Uninstalling plugins
# Remove (or comment out) plugin from the list.
# Press `prefix + alt + u` (lowercase u as in uninstall) to remove the plugin.

# All the plugins are installed to ~/.tmux/plugins/ so alternatively you can find plugin directory there and remove it.

