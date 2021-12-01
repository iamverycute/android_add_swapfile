#!/system/bin/sh
if [ `whoami` != "root" ]
then
	echo "Please run as root!" 
	exit 0
fi
v_part=$(find /dev/block | grep -E "loop" | head -n1);
swapfile=/sdcard/swapfile;
if [[ ! -f $swapfile ]] || [[ $(($(du $swapfile | tr -cd '[:digit:]') >> 10)) -lt 2048 ]];
	then busybox dd if=/dev/zero of=$swapfile bs=4M count=512;
elif [[ $(free -m | grep -i "swap" | tr -s ' ' | cut -d ' ' -f2) -lt 2048 ]];
	then losetup "$v_part" "$swapfile" && busybox mkswap "$v_part" && busybox swapon "$v_part";
fi
