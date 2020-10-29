#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:3858f95bedf809b9f795f9ccd5534f007f670b5d; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:67108864:7dfeaf07be7365798acaae96d86acf42003a5bf0 \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:3858f95bedf809b9f795f9ccd5534f007f670b5d && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
