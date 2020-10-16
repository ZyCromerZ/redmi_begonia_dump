#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:5c904baebf5bd20c7e3a61c17d20a8ef02148fdd; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:67108864:b31fc8cd582133d35c1619b5f039cb7eaede3b6a \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:5c904baebf5bd20c7e3a61c17d20a8ef02148fdd && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
