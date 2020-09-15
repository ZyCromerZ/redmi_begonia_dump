#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:e7bf01e68ea71f82d4920b54156eeb3c5f26bb0a; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:67108864:819536a760ce68c52672ce089067b47252cc8a14 \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:e7bf01e68ea71f82d4920b54156eeb3c5f26bb0a && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
