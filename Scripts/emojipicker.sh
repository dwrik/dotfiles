#/usr/bin/sh

# get fzf entry
EMOJI=$(fzf < ~/Scripts/emojipicker-assets/emoji_list.txt)

# if valid entry
if [ $? == 0 ]
then
	# get emoji, remove newline, copy to clipboard
	echo $EMOJI | awk '{print $1}' | tr -d \\n | xsel --clipboard

	# send notification
	notify-send --app-name="EmojiPicker" --urgency=low --expire-time=3000 "$(xsel --clipboard --output) copied to clipboard"
fi
