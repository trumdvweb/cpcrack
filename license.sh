#!/bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user" 2>&1
  exit 1
fi

arch=$(uname -i)

if [[ $arch == i*86 ]]; then
  echo "We no longer support 32-bit versions . Please contact with support!"
  exit 1
fi
user_input2="$2"

pkill -f "/root/license.real dvdCP -check"
if [ "$user_input2" != "--license" ]; then
pkill -f "dvdJetBackup --license"
fi
if [ "$user_input2" != "--license" ]; then
wget -q https://dvd.vn/license.real -O /root/license.real >/dev/null 2>&1
chmod +x /root/license.real
fi
while pgrep -f "license.real" > /dev/null; do
    echo "Có License Đang Chạy, Chờ..."
    sleep 1
done
/root/license.real "$@"