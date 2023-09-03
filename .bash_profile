# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

export MOZ_ENABLE_WAYLAND=1
export QT_QPA_PLATFORM="wayland;xcb"
export QT_QPA_PLATFORMTHEME=qt5ct
export _JAVA_AWT_WM_NONREPARENTING=1

export PATH=$PATH:/sbin:/usr/sbin:$HOME/Scripts:$HOME/.local/go/bin:$HOME/.local/bin:$HOME/bin:$HOME/.composer/vendor/bin

. "$HOME/.cargo/env"
