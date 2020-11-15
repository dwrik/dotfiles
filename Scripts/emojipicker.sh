#/usr/bin/zsh

# get emoji, remove newline, copy to clipboard
fzf < ~/Scripts/emojipicker-assets/emoji_list.txt | awk '{print $1}' | tr -d \\n | xsel --clipboard

# send notification
notify-send --app-name="EmojiPicker" --urgency=low --expire-time=3000 "$(xsel --clipboard --output) copied to clipboard"
