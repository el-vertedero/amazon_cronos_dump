#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery:9592832:7be21d7cc37907e1104d030a9ed448561655bf47; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/boot:8626176:c3eb29c5599df910b0d57013f2ebd9e093fae40b EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery 51ff943e539303900e05e61bfdd68162a34ee318 9590784 c3eb29c5599df910b0d57013f2ebd9e093fae40b:/system/recovery-from-boot.p && installed=1 && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
  [ -n "$installed" ] && dd if=/system/recovery-sig of=/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery bs=1 seek=9590784 && sync && log -t recovery "Install new recovery signature: succeeded" || log -t recovery "Installing new recovery signature: failed"
else
  log -t recovery "Recovery image already installed"
fi
