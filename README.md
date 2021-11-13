# android_add_swapfile
Android adds swap partition.

## How to use?

**Precondition**

+ root
+ busybox

## Execute the following command

```bash
adb shell push add_swap.sh /data/local/tmp/add_swap.sh

adb shell

su

cd /data/local/tmp/

chmod +x add_swap.sh

sh add_swap.sh

```
