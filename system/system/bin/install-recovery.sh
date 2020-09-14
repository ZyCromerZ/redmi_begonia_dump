#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:c125a544a7ea323a6e2a5a0117f2ca034bbbec41; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:67108864:b692699636b8ecfcb239b9da125ae612766c3f00 \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:c125a544a7ea323a6e2a5a0117f2ca034bbbec41 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
