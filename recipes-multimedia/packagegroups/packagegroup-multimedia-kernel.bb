SUMMARY = "Multimedia kernel modules package groups"
LICENSE = "GPL-2.0-only & MIT"


DEPENDS = "kernel-module-mmngr kernel-module-mmngrbuf \
    kernel-module-vspm kernel-module-vspmif \
"

PR = "r0"

inherit packagegroup

PACKAGES = " \
    packagegroup-multimedia-kernel-modules \
"

RDEPENDS:packagegroup-multimedia-kernel-modules = " \
    kernel-module-mmngr \
    kernel-module-mmngrbuf \
    kernel-module-vspm \
    kernel-module-vspmif \
    kernel-module-mmngr-dev \
    kernel-module-mmngrbuf-dev \
    kernel-module-vspm-dev \
    kernel-module-vspmif-dev \
"

