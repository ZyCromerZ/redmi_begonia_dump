#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:9b7d7019ccef41bcbb0d869c3ed475200525f8cb; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:67108864:1482ddd07fa6e3a8aad4daf76681a98e0bce4850 \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:9b7d7019ccef41bcbb0d869c3ed475200525f8cb && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
