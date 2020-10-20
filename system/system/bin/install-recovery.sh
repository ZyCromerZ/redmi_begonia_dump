#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:a72328f71a9b8c211373ed0ea6d71209f8745476; then
  applypatch  EMMC:/dev/block/platform/bootdevice/by-name/boot:67108864:0495c522b1d02e55b2634bb13076c784ad6d3b3a EMMC:/dev/block/platform/bootdevice/by-name/recovery a72328f71a9b8c211373ed0ea6d71209f8745476 67108864 0495c522b1d02e55b2634bb13076c784ad6d3b3a:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
