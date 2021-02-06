#!/bin/bash
echo "Setting Up Environment"
echo ""
export ARCH=arm64
export ANDROID_MAJOR_VERSION=q
export PLATFORM_VERSION=10.0.0
export USE_CCACHE=1
export CROSS_COMPILE="ccache /home/neel/Desktop/toolchain/gcc/bin/aarch64-linux-android-"
export ARCH=arm64
export SUBARCH=arm64
export DTC_EXT=dtc
export CCACHE_EXEC="/usr/bin/ccache"
export USE_CCACHE=1
export ccache -M 50G
export CCACHE_COMPRESS=1
export CCACHE_DIR=/home/neel/Desktop/ccache/.ccache

clear
echo "                                                     "
echo "             _     _                     _       _   "
echo "  _ __  _ __(_)___| |__    ___  ___ _ __(_)_ __ | |_ "                                              
echo " | '_ \| '__| / __| '_ \  / __|/ __| '__| | '_ \| __|"                                              
echo " | |_) | |  | \__ \ | | | \__ \ (__| |  | | |_) | |_ "                                              
echo " | .__/|_|  |_|___/_| |_| |___/\___|_|  |_| .__/ \__|"
echo " |_|                                      |_|        "
echo "                                                     "
echo "              coded by Neel0210, DAvinash97          "
echo "                                                     "
echo "Select"
echo "1 = Clear"
echo "2 = Olivelite"
echo "3 = Olive"
echo "4 = Olivewood"
echo "5 = Pine"
echo "6 = Build-All"
echo "7 = Exit"
read n

if [ $n -eq 1 ]; then
echo "============="
echo "Clearing ALL"
echo "============="
################################
# remove from kernel source
################################
rm -rf out
################################
# remove from Prish folder
################################
rm ./PRISH/AK/I*
rm ./PRISH/AK/1*.zip
################################
# remove from Output folder
################################
# Olivelite
rm ./output/kernel/olivelite/*.zip
rm ./output/OLDDT/olivelite/I*
rm ./output/WIFI/olive/p*
#olive
rm ./output/kernel/olive/*.zip
rm ./output/OLDDT/olive/I*
rm ./output/WIFI/olive/p*
#pine
rm ./output/kernel/pine/*.zip
rm ./output/OLDDT/pine/I*
rm ./output/WIFI/pine/p*
#olivewood
rm ./output/kernel/olivewood/*.zip
rm ./output/OLDDT/olivewood/I*
rm ./output/WIFI/olivewood/p*
################################
# Cleaning script
################################
make clean && make mrproper
fi

if [ $n -eq 2 ]; then
echo "=========="
echo "Olivelite"
echo "=========="
rm ./PRISH/AK/I*
rm ./PRISH/AK/1*.zip
rm ./output/kernel/olivelite/*.zip
rm ./output/OLDDT/olivelite/I*
rm ./output/WIFI/olivelite/p*
make clean && make mrproper
############################################
# If other device make change here
############################################
make O=out ARCH=arm64 olivelite_defconfig -j4
make O=out -C ${PWD} -j4
echo ""
echo "Kernel Compiled"
echo ""
cp -r ./out/arch/arm64/boot/Image.gz-dtb ./output/OLDDT/olivelite/Image.gz-dtb
echo "================"
echo "Getting wlan.co"
echo "================"
aarch64-linux-gnu-strip --strip-unneeded --strip-debug out/drivers/staging/prima/wlan.ko
cp -r ./out/drivers/staging/prima/wlan.ko ./output/WIFI/olivelite/pronto_wlan.ko
cp -r ./out/drivers/staging/prima/wlan.ko ./PRISH/AK/modules/vendor/lib/modules/pronto_wlan.ko
echo "======================="
echo "Packing into anykernel"
echo "======================="
cp -r ./out/arch/arm64/boot/Image.gz-dtb ./output/OLDDT/olivelite/Image.gz-dtb
cp -r ./out/arch/arm64/boot/Image.gz-dtb ./PRISH/AK/Image.gz-dtb
cd PRISH/AK
. zip.sh
cd ../..
cp -r ./PRISH/AK/1*.zip ./output/kernel/olivelite/PrishKernel-P1-Q-Redmi8A.zip
rm ./PRISH/AK/1*.zip
rm ./PRISH/AK/I*
echo "========================"
echo "Done!"
echo "========================"
echo " "
cd output/kernel
echo " "
pwd
ls
echo " "
echo "-- Get kernel from here"
echo " "
fi

if [ $n -eq 3 ]; then
echo "======"
echo "Olive"
echo "======"
rm ./PRISH/AK/I*
rm ./PRISH/AK/1*.zip
rm ./output/kernel/olive/*.zip
rm ./output/OLDDT/olive/I*
rm ./output/WIFI/olive/p*
make clean && make mrproper
############################################
# If other device make change here
############################################
make O=out ARCH=arm64 olive_defconfig -j4
make O=out -C ${PWD} -j4
echo ""
echo "Kernel Compiled"
echo ""
cp -r ./out/arch/arm64/boot/Image.gz-dtb ./output/OLDDT/olive/Image.gz-dtb
echo "================"
echo "Getting wlan.co"
echo "================"
aarch64-linux-gnu-strip --strip-unneeded --strip-debug out/drivers/staging/prima/wlan.ko
cp -r ./out/drivers/staging/prima/wlan.ko ./output/WIFI/olive/pronto_wlan.ko
cp -r ./out/drivers/staging/prima/wlan.ko ./PRISH/AK/modules/vendor/lib/modules/pronto_wlan.ko
echo "======================="
echo "Packing into anykernel"
echo "======================="
cp -r ./out/arch/arm64/boot/Image.gz-dtb ./output/OLDDT/olive/Image.gz-dtb
cp -r ./out/arch/arm64/boot/Image.gz-dtb ./PRISH/AK/Image.gz-dtb
cd PRISH/AK
. zip.sh
cd ../..
cp -r ./PRISH/AK/1*.zip ./output/kernel/olive/PrishKernel-P1-Q-Redmi8.zip
rm ./PRISH/AK/1*.zip
rm ./PRISH/AK/I*
echo "========================"
echo "Done!"
echo "========================"
echo " "
cd output/kernel
echo " "
pwd
ls
echo " "
echo "-- Get kernel from here"
echo " "
fi

if [ $n -eq 4 ]; then
echo "=========="
echo "Olivewood"
echo "=========="
rm ./PRISH/AK/I*
rm ./PRISH/AK/1*.zip
rm ./output/kernel/olivewood/*.zip
rm ./output/OLDDT/olivewood/I*
rm ./output/WIFI/olivewood/p*
make clean && make mrproper
############################################
# If other device make change here
############################################
make O=out ARCH=arm64 olivewood_defconfig -j4
make O=out -C ${PWD} -j4
echo ""
echo "Kernel Compiled"
echo ""
cp -r ./out/arch/arm64/boot/Image.gz-dtb ./output/OLDDT/olivewood/Image.gz-dtb
echo "================"
echo "Getting wlan.co"
echo "================"
aarch64-linux-gnu-strip --strip-unneeded --strip-debug out/drivers/staging/prima/wlan.ko
cp -r ./out/drivers/staging/prima/wlan.ko ./output/WIFI/olivewood/pronto_wlan.ko
cp -r ./out/drivers/staging/prima/wlan.ko ./PRISH/AK/modules/vendor/lib/modules/pronto_wlan.ko
echo "======================="
echo "Packing into anykernel"
echo "======================="
cp -r ./out/arch/arm64/boot/Image.gz-dtb ./output/OLDDT/olivewood/Image.gz-dtb
cp -r ./out/arch/arm64/boot/Image.gz-dtb ./PRISH/AK/Image.gz-dtb
cd PRISH/AK
. zip.sh
cd ../..
cp -r ./PRISH/AK/1*.zip ./output/kernel/olivewood/PrishKernel-P1-Q-Redmi8A_Dual.zip
rm ./PRISH/AK/1*.zip
rm ./PRISH/AK/I*
echo "========================"
echo "Done!"
echo "========================"
echo " "
cd output/kernel
echo " "
pwd
ls
echo " "
echo "-- Get kernel from here"
echo " "
fi

if [ $n -eq 5 ]; then
echo "====="
echo "Pine"
echo "====="
rm ./PRISH/AK/I*
rm ./PRISH/AK/1*.zip
rm ./output/kernel/pine/*.zip
rm ./output/OLDDT/pine/I*
rm ./output/WIFI/pine/p*
make clean && make mrproper
############################################
# If other device make change here
############################################
make O=out ARCH=arm64 pine_defconfig -j4
make O=out -C ${PWD} -j4
echo ""
echo "Kernel Compiled"
echo ""
cp -r ./out/arch/arm64/boot/Image.gz-dtb ./output/OLDDT/pine/Image.gz-dtb
echo "================"
echo "Getting wlan.co"
echo "================"
aarch64-linux-gnu-strip --strip-unneeded --strip-debug out/drivers/staging/prima/wlan.ko
cp -r ./out/drivers/staging/prima/wlan.ko ./output/WIFI/pine/pronto_wlan.ko
cp -r ./out/drivers/staging/prima/wlan.ko ./PRISH/AK/modules/vendor/lib/modules/pronto_wlan.ko
echo "======================="
echo "Packing into anykernel"
echo "======================="
cp -r ./out/arch/arm64/boot/Image.gz-dtb ./output/OLDDT/pine/Image.gz-dtb
cp -r ./out/arch/arm64/boot/Image.gz-dtb ./PRISH/AK/Image.gz-dtb
cd PRISH/AK
. zip.sh
cd ../..
cp -r ./PRISH/AK/1*.zip ./output/kernel/pine/PrishKernel-P1-Q-Redmi7A.zip
rm ./PRISH/AK/1*.zip
rm ./PRISH/AK/I*
echo "========================"
echo "Done!"
echo "========================"
echo " "
cd output/kernel
echo " "
pwd
ls
echo " "
echo "-- Get kernel from here"
echo " "
fi

if [ $n -eq 6 ]; then
echo "=========="
echo "Build-All"
echo "=========="
rm -rf out
rm ./PRISH/AK/I*
rm ./PRISH/AK/1*.zip
rm ./output/kernel/olivelite/*.zip
rm ./output/OLDDT/olivelite/I*
rm ./output/WIFI/olive/p*
rm ./output/kernel/olive/*.zip
rm ./output/OLDDT/olive/I*
rm ./output/WIFI/olive/p*
rm ./output/kernel/pine/*.zip
rm ./output/OLDDT/pine/I*
rm ./output/WIFI/pine/p*
rm ./output/kernel/olivewood/*.zip
rm ./output/OLDDT/olivewood/I*
rm ./output/WIFI/olivewood/p*
make clean && make mrproper
############################################
# If other device make change here
############################################
echo "==================="
echo "Building Olivelite"
echo "==================="
make clean
make O=out ARCH=arm64 olivelite_defconfig -j4
make O=out -C ${PWD} -j4
aarch64-linux-gnu-strip --strip-unneeded --strip-debug out/drivers/staging/prima/wlan.ko
cp -r ./out/drivers/staging/prima/wlan.ko ./output/WIFI/olivelite/pronto_wlan.ko
cp -r ./out/drivers/staging/prima/wlan.ko ./PRISH/AK/modules/vendor/lib/modules/pronto_wlan.ko
cp -r ./out/arch/arm64/boot/Image.gz-dtb ./output/OLDDT/olivelite/Image.gz-dtb
cp -r ./out/arch/arm64/boot/Image.gz-dtb ./PRISH/AK/Image.gz-dtb
cd PRISH/AK
. zip.sh
cd ../..
cp -r ./PRISH/AK/1*.zip ./output/kernel/olivelite/PrishKernel-P1-Q-Redmi8A.zip
rm ./PRISH/AK/1*.zip
rm ./PRISH/AK/I*
echo "==============="
echo "Olivelite done"
echo "==============="
echo "=========================================================================================="
echo "=============="
echo "Building Olive"
echo "=============="
make clean
make O=out ARCH=arm64 olive_defconfig -j4
make O=out -C ${PWD} -j4
aarch64-linux-gnu-strip --strip-unneeded --strip-debug out/drivers/staging/prima/wlan.ko
cp -r ./out/drivers/staging/prima/wlan.ko ./output/WIFI/olive/pronto_wlan.ko
cp -r ./out/drivers/staging/prima/wlan.ko ./PRISH/AK/modules/vendor/lib/modules/pronto_wlan.ko
cp -r ./out/arch/arm64/boot/Image.gz-dtb ./output/OLDDT/olive/Image.gz-dtb
cp -r ./out/arch/arm64/boot/Image.gz-dtb ./PRISH/AK/Image.gz-dtb
cd PRISH/AK
. zip.sh
cd ../..
cp -r ./PRISH/AK/1*.zip ./output/kernel/olive/PrishKernel-P1-Q-Redmi8.zip
rm ./PRISH/AK/1*.zip
rm ./PRISH/AK/I*
echo "==========="
echo "Olive done"
echo "==========="
echo "=========================================================================================="
echo "==================="
echo "Building Olivewood"
echo "==================="
make clean
make O=out ARCH=arm64 olivewood_defconfig -j4
make O=out -C ${PWD} -j4
aarch64-linux-gnu-strip --strip-unneeded --strip-debug out/drivers/staging/prima/wlan.ko
cp -r ./out/drivers/staging/prima/wlan.ko ./output/WIFI/olivewood/pronto_wlan.ko
cp -r ./out/drivers/staging/prima/wlan.ko ./PRISH/AK/modules/vendor/lib/modules/pronto_wlan.ko
cp -r ./out/arch/arm64/boot/Image.gz-dtb ./output/OLDDT/olivewood/Image.gz-dtb
cp -r ./out/arch/arm64/boot/Image.gz-dtb ./PRISH/AK/Image.gz-dtb
cd PRISH/AK
. zip.sh
cd ../..
cp -r ./PRISH/AK/1*.zip ./output/kernel/olivewood/PrishKernel-P1-Q-Redmi8A_Dual.zip
rm ./PRISH/AK/1*.zip
rm ./PRISH/AK/I*
echo "==============="
echo "Olivewood done"
echo "==============="
echo "=========================================================================================="
echo "=============="
echo "Building Pine"
echo "=============="
make clean
make O=out ARCH=arm64 pine_defconfig -j4
make O=out -C ${PWD} -j4
aarch64-linux-gnu-strip --strip-unneeded --strip-debug out/drivers/staging/prima/wlan.ko
cp -r ./out/drivers/staging/prima/wlan.ko ./output/WIFI/pine/pronto_wlan.ko
cp -r ./out/drivers/staging/prima/wlan.ko ./PRISH/AK/modules/vendor/lib/modules/pronto_wlan.ko
cp -r ./out/arch/arm64/boot/Image.gz-dtb ./output/OLDDT/pine/Image.gz-dtb
cp -r ./out/arch/arm64/boot/Image.gz-dtb ./PRISH/AK/Image.gz-dtb
cd PRISH/AK
. zip.sh
cd ../..
cp -r ./PRISH/AK/1*.zip ./output/kernel/pine/PrishKernel-P1-Q-Redmi7A.zip
rm ./PRISH/AK/1*.zip
rm ./PRISH/AK/I*
echo "=========="
echo "Pine done"
echo "=========="
echo "=========================================================================================="
echo " "
cd output/kernel
echo " "
pwd
ls
echo " "
echo "-- Get kernel from here"
echo " "
cd ../..
fi

if [ $n -eq 7 ]; then
echo "========"
echo "Exiting"
echo "========"
exit
fi
