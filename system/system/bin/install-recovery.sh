#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:58ec565a64ed15a35a43bf59d743a146672a919b; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:67108864:facf014e7e6c29c6a9fdd996e920b2519d49f804 \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:58ec565a64ed15a35a43bf59d743a146672a919b && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
