TERMUX_PKG_HOMEPAGE=https://ukoethe.github.io/vigra/
TERMUX_PKG_DESCRIPTION="Computer vision library"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=1.11.1
TERMUX_PKG_REVISION=3
TERMUX_PKG_SRCURL=https://github.com/ukoethe/vigra/releases/download/Version-${TERMUX_PKG_VERSION//./-}/vigra-${TERMUX_PKG_VERSION}-src.tar.gz
TERMUX_PKG_SHA256=a5564e1083f6af6a885431c1ee718bad77d11f117198b277557f8558fa461aaf
TERMUX_PKG_DEPENDS="libc++, libhdf5, libjpeg-turbo, libpng, libtiff, openexr, zlib"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
-DRUN_RESULT=0
-DRUN_RESULT__TRYRUN_OUTPUT=201103
-DWITH_OPENEXR=ON
"
TERMUX_PKG_RM_AFTER_INSTALL="doc"
