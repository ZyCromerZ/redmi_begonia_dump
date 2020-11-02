#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:b4fe8dfa44d3472d311ebc061327abbeb837e298; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:67108864:29c64b77aecae6b03d020eb5ca213518bacdd911 \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:b4fe8dfa44d3472d311ebc061327abbeb837e298 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
