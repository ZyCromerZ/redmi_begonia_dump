#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:fd9bc9d6880c171dbc0117a75eeed40bb3553660; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:67108864:8b1da85a35aed7551ab23a1d47981d8a2f7aa6e8 \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:fd9bc9d6880c171dbc0117a75eeed40bb3553660 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
