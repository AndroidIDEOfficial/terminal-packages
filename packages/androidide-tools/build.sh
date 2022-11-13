TERMUX_PKG_HOMEPAGE=https://androidide.com/
TERMUX_PKG_DESCRIPTION="Basic system tools for AndroidIDE"
TERMUX_PKG_LICENSE="GPL-3.0"
TERMUX_PKG_MAINTAINER="@itsaky"
TERMUX_PKG_VERSION=0.02
TERMUX_PKG_SRCURL=https://github.com/AndroidIDEOfficial/androidide-tools/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=ead6e587e7da9bbe0b99978bfa75e8cd49af9c1abd35edabb055a9f9aa59d35a
TERMUX_PKG_PLATFORM_INDEPENDENT=true
TERMUX_PKG_ESSENTIAL=true

# Required by the tools included
TERMUX_PKG_DEPENDS="libcurl, jq, nano, wget"
TERMUX_PKG_RECOMMENDS="openjdk-17"

termux_step_make_install() {
    for script in idesetup ideenv; do
        install -Dm700 $TERMUX_PKG_SRCDIR/scripts/$script $TERMUX_PREFIX/bin/$script
    done
}
