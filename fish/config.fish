# 非対話シェルでは何もしない（VSCode拡張機能Remote-SSHなど）
status is-interactive; or return

# 共通設定
source ~/.aliases
source ~/.variables

# グリーティングメッセージを無効
set -U fish_greeting

# fzf
fzf --fish | source
fzf_configure_bindings --processes=\cp

function fish_prompt -d "Write out the prompt"
    # This shows up as USER@HOST /home/user/ >, with the directory colored
    # $USER and $hostname are set by fish, so you can just use them
    # instead of using `whoami` and `hostname`
    printf '%s@%s %s%s%s > ' $USER $hostname \
        (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
end

if status is-interactive
    # starship
    starship init fish | source
    # https://github.com/end-4/dots-hyprland/discussions/1151#discussioncomment-14113829
    if not set -q TMUX
        if test -f ~/.local/state/quickshell/user/generated/terminal/sequences.txt
            cat ~/.local/state/quickshell/user/generated/terminal/sequences.txt
        end
    end
end

# Add ~/.local/bin to PATH
if test -d "$HOME/.local/bin"
    fish_add_path $HOME/.local/bin
end

# mise setting
~/.local/bin/mise activate fish | source
