if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -U fish_greeting ""

source ~/.snigdhaos_bash_aliases

zoxide init fish | source

#set -x BFETCH_INFO "pfetch"
#set -x BFETCH_ART "$HOME/.local/textart/fetch/unix.textart"
#set -x PF_INFO "Unix Genius"

#set -x BFETCH_INFO "curl --silent --location 'wttr.in/rome?0pq'"
#set -x BFETCH_ART "printf \"\033[35m\"; figlet -f Bloody Spooky"
#set -x BFETCH_COLOR "$HOME/.local/textart/color/icon/ghosts.textart"

#set -x BFETCH_INFO "exa -la"
#set -x BFETCH_ART "$HOME/.local/textart/fetch/pacman-maze.textart"
#set -x BFETCH_COLOR "$HOME/.local/textart/color/icon/pacman.textart"

set -x BFETCH_INFO "pfetch"
set -x BFETCH_ART "cowsay '<3 Snigdha OS'"
set -x BFETCH_COLOR "$HOME/.local/textart/color/icon/panes.textart"


set -gx TERM xterm-256color
if status is-interactive
    # Commands to run in interactive sessions can go here
    if not set -q NO_REPETITION
        neofetch
    end
end
