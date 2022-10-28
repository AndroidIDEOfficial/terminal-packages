TERMUX_PKG_HOMEPAGE=https://gitlab.com/volian/nala
TERMUX_PKG_DESCRIPTION="Commandline frontend for the apt package manager"
TERMUX_PKG_LICENSE="GPL-3.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=0.7.2
TERMUX_PKG_REVISION=1
TERMUX_PKG_SRCURL=https://gitlab.com/volian/nala/-/archive/v${TERMUX_PKG_VERSION}/nala-v${TERMUX_PKG_VERSION}.tar.bz2
TERMUX_PKG_SHA256=0ac394ab2bd924c28c513a8e8bfc9e899a21f2f8fa5e5d77366cb20e0be8676e
TERMUX_PKG_DEPENDS="python-apt"
TERMUX_PKG_PLATFORM_INDEPENDENT=true
TERMUX_PKG_BUILD_IN_SRC=true

_PYTHON_VERSION=$(. $TERMUX_SCRIPTDIR/packages/python/build.sh; echo $_MAJOR_VERSION)

termux_step_post_get_source() {
	sed 's:@TERMUX_PKG_VERSION@:'${TERMUX_PKG_VERSION##*:}':g' \
		${TERMUX_PKG_BUILDER_DIR}/pyproject.toml.diff | \
		patch --silent -p1
}

termux_step_pre_configure() {
	termux_setup_python_crossenv
	pushd $TERMUX_PYTHON_CROSSENV_SRCDIR
	_CROSSENV_PREFIX=$TERMUX_PKG_BUILDDIR/python-crossenv-prefix
	python${_PYTHON_VERSION} -m crossenv \
		$TERMUX_PREFIX/bin/python${_PYTHON_VERSION} \
		${_CROSSENV_PREFIX}
	popd
	. ${_CROSSENV_PREFIX}/bin/activate

	build-pip install tomli
}

termux_step_make_install() {
	export PYTHONPATH=$TERMUX_PREFIX/lib/python${_PYTHON_VERSION}/site-packages
	pip install --no-deps . --prefix $TERMUX_PREFIX

	install -Dm600 -t $TERMUX_PREFIX/etc/nala debian/nala.conf
}

termux_step_create_debscripts() {
	cat <<- EOF > ./postinst
	#!$TERMUX_PREFIX/bin/sh
	mkdir -p $TERMUX_PREFIX/var/lib/nala
	mkdir -p $TERMUX_PREFIX/var/log/nala
	echo "Installing dependencies through pip..."
	pip3 install anyio httpx jsbeautifier pexpect rich
	EOF
}
