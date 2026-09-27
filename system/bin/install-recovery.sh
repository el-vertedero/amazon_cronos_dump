#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery:9594880:cbce30e9b67d7e2da314c2b31fe0632346514dda; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/boot:8626176:df13dae045e919c0f1d93ff07927b4ff0adb68d5 EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery b432a9bc469049e8c44ca50ffd698bda43b2bbb7 9592832 df13dae045e919c0f1d93ff07927b4ff0adb68d5:/system/recovery-from-boot.p && installed=1 && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
  [ -n "$installed" ] && dd if=/system/recovery-sig of=/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery bs=1 seek=9592832 && sync && log -t recovery "Install new recovery signature: succeeded" || log -t recovery "Installing new recovery signature: failed"
else
  log -t recovery "Recovery image already installed"
fi
