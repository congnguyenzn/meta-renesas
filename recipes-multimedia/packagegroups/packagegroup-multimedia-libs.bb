SUMMARY = "Multimedia user libraries modules package groups"
LICENSE = "MIT"

DEPENDS = "mmngr-user-module mmngrbuf-user-module \
    vspmif-user-module \
"

PR = "r0"
PACKAGE_ARCH = "${MACHINE_ARCH}"

inherit packagegroup

PACKAGES = " \
    packagegroup-multimedia-libs \
"

RDEPENDS:packagegroup-multimedia-libs = " \
    mmngr-user-module \
    mmngrbuf-user-module \
    vspmif-user-module \
    mmngr-user-module-dev \
    mmngrbuf-user-module-dev \
    vspmif-user-module-dev \
"
