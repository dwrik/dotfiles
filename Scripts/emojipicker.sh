#/usr/bin/zsh
fzf < ~/Scripts/emojipicker-assets/emoji_list.txt | awk '{print $1}' | tr -d \\n | xsel --clipboard
