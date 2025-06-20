
# COMPATIBLE_MACHINE is regex matcher.
COMPATIBLE_MACHINE:rzv2h-evk-ver1 = "(rzv2h-evk-ver1)"
COMPATIBLE_MACHINE = "^(aarch64|rzv2h-evk-ver1)$"

inherit kernel
inherit kernel-devicetree

KBRANCH:rzv2h-evk-ver1  = "styhead/rz-cmn"
SRC_URI:rzv2h-evk-ver1 = "git://github.com/Renesas-SST/linux-rz.git;name=machine;branch=${KBRANCH};protocol=https"

FILESEXTRAPATHS:prepend := "${THISDIR}:"

# Apply patches for RZV2H EVK ver1 board
SRC_URI:append:rzv2h-evk-ver1 = "\
    file://dts-patches/0001-rzg2l-sbc-Bring-compat_alloc_user_space-back.patch \
"

SRC_URI:append:rzv2h-evk-ver1 = "\
                    file://touch.cfg \
                    file://panfrost.cfg \
                    file://dexhand.cfg \
                "

KCONFIG_MODE:rzv2h-evk-ver1 = "alldefconfig"

KBUILD_DEFCONFIG:rzv2h-evk-ver1 ?= "rzv2h_defconfig"

# Supported device tree and device tree overlays
KERNEL_DEVICETREE:rzv2h-evk-ver1 = "renesas/r9a09g057h4-evk-ver1.dtb"

# Override the dtc flags to support dtbo build in kernel-devicetree.bbclass
# KERNEL_DTC_FLAGS = "-@"

# Install overlays folder and kernel images to target/images in build folder
do_deploy:append() {
    if [ "${MACHINE}" = "rzv2h-evk-ver1" ]; then
        install -d ${DEPLOYDIR}/target/images/dtbs

        install -m 0644 ${B}/arch/arm64/boot/Image ${DEPLOYDIR}/target/images/${KERNEL_IMAGETYPE}-${KERNEL_ARTIFACT_NAME}.bin
        ln -sf ${KERNEL_IMAGETYPE}-${KERNEL_ARTIFACT_NAME}.bin ${DEPLOYDIR}/target/images/Image

        install -m 0644 ${B}/arch/arm64/boot/dts/renesas/r9a09g057h4-evk-ver1.dtb ${DEPLOYDIR}/target/images/dtbs/r9a09g057h4-evk-ver1-${KERNEL_DTB_NAME}.$dtb_ext
        ln -sf r9a09g057h4-evk-ver1-${KERNEL_DTB_NAME}.$dtb_ext ${DEPLOYDIR}/target/images/dtbs/r9a09g057h4-evk-ver1.dtb
    fi
}

SRCREV_machine:rzv2h-evk-ver1 ?= "${AUTOREV}"
LINUX_VERSION:rzv2h-evk-ver1 ?= "6.10.14"