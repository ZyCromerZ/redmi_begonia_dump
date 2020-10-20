#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:5895a0fba0be9ea12b2b396d9b31a3906dcd99e6; then
  applypatch  EMMC:/dev/block/platform/bootdevice/by-name/boot:67108864:80808035a2037d9107c2708bc38228ce553f8a13 EMMC:/dev/block/platform/bootdevice/by-name/recovery 5895a0fba0be9ea12b2b396d9b31a3906dcd99e6 67108864 80808035a2037d9107c2708bc38228ce553f8a13:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
