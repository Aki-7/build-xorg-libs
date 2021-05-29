# Build X libraries

X Window Systemのライブラリをソースからビルドする。

ビルドの仕方は[公式のページ](https://www.x.org/wiki/Building_the_X_Window_System/)にまとめられているが、
管理しているgitレポジトリがGitLabに移行した？ことにより、うまく動かなかったので、動くようにした。

## Build
```
MAKEFLAGS="CWARNFLAGS=-Wno-error" ./build.sh
```

### Tips

1. ビルドの途中で失敗した。

`src/util/modular/build.sh` の build_all_modules() の `build xxx yyy` の部分をビルドが終わったとこまでコメントアウトして、
再開したいとこから始める。

ビルドキャッシュなどで再開がうまく行かないことがある。
再開時に以下のようなメッセージが出ている場合**など**は

```
ninja: Entering directory `builddir'
ninja: error: loading 'build.ninja': No such file or directory
```

src/配下の該当するパッケージのフォルダ(`build xxx yyy` の場合は `src/xxx/yyy`)に`builddir`という
ディレクトリが生成されているので、それを削除してあげる。

```
rm -r src/xxx/yyy/builddir
```

## Run

- CLIモードになる。
- 既存のディスプレイマネージャを停止する。

GNOMEとかを使っていれば
```
$ systemctl stop gdm
```

- Run

```
cd build/bin
```
```
./xinit # super userで実行
```

- 停止

起動したときに出てくるシェルから`exit`すれば停止する。
