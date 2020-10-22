#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:9b5e1cb2aa728c435f9013e88a41c3fd5a62fe76; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:67108864:0245a6e189f4dd21a0ca5c1ad76d43486834b981 \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:9b5e1cb2aa728c435f9013e88a41c3fd5a62fe76 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
