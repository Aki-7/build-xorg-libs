
echo_and_exec() {
  echo "$ $@"
  eval $@
}

SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
cd $SCRIPTPATH/src

git clone -b server-1.20-branch https://gitlab.freedesktop.org/xorg/xserver.git $SCRIPTPATH/src/xserver

GITROOT=https://gitlab.freedesktop.org
export GITROOT
PKG_CONFIG_PATH=$SCRIPTPATH/build/lib/x86_64-linux-gnu/pkgconfig
export PKG_CONFIG_PATH

echo_and_exec mkdir $SCRIPTPATH/build
echo_and_exec $SCRIPTPATH/src/util/modular/build.sh --clone $SCRIPTPATH/build
