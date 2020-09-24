#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:fa38a1b58821e02eb1a31c31133fddd57ae327d0; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:67108864:ecff4f8bc570fb140e7f1c0a7736ff31954ecac4 \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:fa38a1b58821e02eb1a31c31133fddd57ae327d0 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
