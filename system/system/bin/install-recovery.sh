#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:f3cc873318081e24d93d8a97c47a3ac9a349aa2c; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:67108864:4db5aa12c94dda5c0e2240bb6fcb6b31196e2860 \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:f3cc873318081e24d93d8a97c47a3ac9a349aa2c && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
