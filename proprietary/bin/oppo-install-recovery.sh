#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:83886080:7b1ff25238bb50caad8c47f7310306f39b2ced72; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:100663296:903d485a48bc57d04dad045b367a3978bbc79d11 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:83886080:7b1ff25238bb50caad8c47f7310306f39b2ced72 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
