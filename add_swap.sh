#!/system/bin/sh
if [ `whoami` != "root" ]
then
	echo "Please run as root!" 
	exit 0
fi
export swap_path="/sdcard/swapfile"
export virtual_path="/dev/block/loop7"
if [ ! -f "$swap_path" ]
then
        echo "Creating swap file..."
	dd if=/dev/zero of=$swap_path bs=1m count=1143
fi
if [[ `free -m | grep Swap | tr -s ' ' | cut -d ' ' -f 2` -lt 2000 ]]
then
	losetup -d $virtual_path && losetup $virtual_path $swap_path && busybox mkswap $virtual_path && busybox swapon $virtual_path
	echo "Swap mounted successfully!"
else
	echo "Swap is mounted!"
fi