#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:f065b4ab038644156d0964876c21169e57047bbc; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:67108864:b5b3e13318a402bdc23e6b35ccd608fd1e884750 \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:f065b4ab038644156d0964876c21169e57047bbc && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
