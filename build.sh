#!/bin/bash
echo "Setting Up Environment"
echo ""
export ARCH=arm64
export ANDROID_MAJOR_VERSION=q
export PLATFORM_VERSION=10.0.0
export USE_CCACHE=1
export CROSS_COMPILE=/home/neel/Desktop/toolchain/gcc/bin/aarch64-linux-android-
export ARCH=arm64
export SUBARCH=arm64
export DTC_EXT=dtc

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
echo "2 = Clean Build"
echo "3 = Kernel+zip"
echo "4 = Exit"
read n

if [ $n -eq 1 ]; then
echo "========="
echo "Clearing"
echo "========="
make clean && make mrproper
rm ./out/arch/arm64/boot/Image
rm ./out/arch/arm64/boot/Image.gz
rm ./out/Image
rm ./output/*.zip
rm ./PRISH/AK/Image
rm ./PRISH/AK/1*.zip
make mrproper
rm -rf out
fi

if [ $n -eq 2 ]; then
echo "==============="
echo "Building Clean"
echo "==============="
make clean && make mrproper
rm ./out/arch/arm64/boot/Image
rm ./out/arch/arm64/boot/Image.gz
rm ./out/Image
rm ./output/*.zip
rm ./PRISH/AK/Image
rm ./PRISH/AK/1*.zip
make mrproper
rm -rf out
############################################
# If other device make change here
############################################
make O=out ARCH=arm64 8A_defconfig -j4
make O=out -C ${PWD} -j4
echo ""
echo "Kernel Compiled"
echo ""
cp -r ./out/arch/arm64/boot/Image.gz-dtb ./output/OLDDT/Image.gz-dtb
fi

if [ $n -eq 3 ]; then
echo "======================="
echo "Making kernel with ZIP"
echo "======================="
make clean && make mrproper
rm ./out/arch/arm64/boot/Image
rm ./out/arch/arm64/boot/Image.gz
rm ./out/Image
rm ./output/*.zip
rm ./PRISH/AK/Image
rm ./PRISH/AK/1*.zip
make mrproper
rm -rf out
############################################
# If other device make change here
############################################
make O=out 8A_defconfig -j4
make O=out -C ${PWD} -j4
echo "======================="
echo "Getting wlan.co"
echo "======================="
aarch64-linux-gnu-strip --strip-unneeded --strip-debug out/drivers/staging/prima/wlan.ko
cp -r ./out/drivers/staging/prima/wlan.ko ./output/WIFI/pronto_wlan.ko
cp -r ./out/drivers/staging/prima/wlan.ko ./PRISH/AK/modules/vendor/lib/modules/pronto_wlan.ko
echo "======================="
echo "Packing into anykernel"
echo "======================="
rm ./PRISH/AK/Image.gz-dtb
rm ./output/*.zip
cp -r ./out/arch/arm64/boot/Image.gz-dtb ./output/OLDDT/Image.gz-dtb
cp -r ./out/arch/arm64/boot/Image.gz-dtb ./PRISH/AK/Image.gz-dtb
cd PRISH/AK
. zip.sh
cd ../..
cp -r ./PRISH/AK/1*.zip ./output/PrishKernel-P1-Q-R8A.zip
echo " "
fi

if [ $n -eq 4 ]; then
echo "========"
echo "Exiting"
echo "========"
exit
fi
