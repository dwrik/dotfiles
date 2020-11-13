# Delete the old entry
efibootmgr -b $(efibootmgr | grep "Arch" | awk '{print $1}' | sed 's/Boot//g' | sed 's/*//g') -B

# Create new entry

# initrd=\intel-ucode.img is for intel microcode
# pci=nocrs is for touchpad and wifi to work

# edit string in --unicode parameter to add/remove kernel parameters

efibootmgr --disk /dev/nvme0n1 --part 1 --create --label "Arch Linux" --loader /vmlinuz-linux --unicode 'root=UUID=dfb9a48e-df40-411c-9e03-0aca8cd31d32 rw initrd=\intel-ucode.img initrd=\initramfs-linux.img pci=nocrs' --verbose
