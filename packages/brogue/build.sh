TERMUX_PKG_VERSION=1.7.4
TERMUX_PKG_HOMEPAGE=https://sites.google.com/site/broguegame/
TERMUX_PKG_DESCRIPTION="Roguelike dungeon crawling game"
TERMUX_PKG_DEPENDS="ncurses"
TERMUX_PKG_SRCURL=https://sites.google.com/site/broguegame/brogue-${TERMUX_PKG_VERSION}-linux-i386.tbz2
TERMUX_PKG_EXTRA_MAKE_ARGS="curses"
TERMUX_PKG_BUILD_IN_SRC=yes
TERMUX_PKG_FOLDERNAME=brogue-${TERMUX_PKG_VERSION}

CC="$CC $CFLAGS $CPPFLAGS $LDFLAGS"

#termux_step_configure () {
# Tarball has an extra level of folders.
#TERMUX_PKG_BUILDDIR=$TERMUX_PKG_SRCDIR/brogue-${TERMUX_PKG_VERSION}
#}

termux_step_make_install () {
	cp bin/brogue $TERMUX_PREFIX/bin
}
