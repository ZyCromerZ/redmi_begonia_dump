#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:23faecf52ea8cb7c5f55fdd076a957812c50e757; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:67108864:0d4761aaefb6ca5c8d4c64dadd56fa3eed2564db \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:23faecf52ea8cb7c5f55fdd076a957812c50e757 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
