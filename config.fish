# Cargo / Rust
set -gx PATH $HOME/.cargo/bin $PATH

# Starship 提示符
if command -q starship
    starship init fish | source
end

# autojump
[ -f /usr/share/autojump/autojump.fish ]; and source /usr/share/autojump/autojump.fish

# yazi 目录跟随
function y
    set tmp (mktemp -t "yazi-cwd.XXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

# 别名
alias lg="lazygit"
