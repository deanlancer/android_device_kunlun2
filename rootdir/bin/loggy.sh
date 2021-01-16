#!/system/bin/sh
# loggy.sh.

logcat -b all -v time -f  /cache/loggy_logcat.txt & dmesg -w > /cache/loggy_kmsg.txt
