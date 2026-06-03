#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery:9592832:6fd1a47348bbfdd9f8c3e02bf5798b10d4062e44; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/boot:8626176:89813bd66408294698b4e47fc8ed0037810ce00c EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery c39ff2cae2c5e46de562ab1e5935797ea29ac8c3 9590784 89813bd66408294698b4e47fc8ed0037810ce00c:/system/recovery-from-boot.p && installed=1 && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
  [ -n "$installed" ] && dd if=/system/recovery-sig of=/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery bs=1 seek=9590784 && sync && log -t recovery "Install new recovery signature: succeeded" || log -t recovery "Installing new recovery signature: failed"
else
  log -t recovery "Recovery image already installed"
fi
