#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery:9592832:f052a258663f2d63627407fa883dd5e22a39d232; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/boot:8626176:76961bfeced6c3577338c735a987586e8d237406 EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery fb4d396ff5aa63fb859ce917868b95579e8207c8 9590784 76961bfeced6c3577338c735a987586e8d237406:/system/recovery-from-boot.p && installed=1 && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
  [ -n "$installed" ] && dd if=/system/recovery-sig of=/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery bs=1 seek=9590784 && sync && log -t recovery "Install new recovery signature: succeeded" || log -t recovery "Installing new recovery signature: failed"
else
  log -t recovery "Recovery image already installed"
fi
