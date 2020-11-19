#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:95d0c495bf6bdfcc29c024cb86ff23b511f6e09d; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:67108864:a90bd8b474197718b1c54906f67b756a1685f9b3 \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:95d0c495bf6bdfcc29c024cb86ff23b511f6e09d && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
