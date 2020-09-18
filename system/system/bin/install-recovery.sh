#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:93769988c2d9698fdbdaa5cd4674f43c795a4f83; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:67108864:a98cff329fd20cdb506ad6d2efc4a5e0c005db73 \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:93769988c2d9698fdbdaa5cd4674f43c795a4f83 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
