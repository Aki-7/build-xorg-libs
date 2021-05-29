# Build Xorg libraries

## Tips

1. ビルドの途中で失敗した。

`build.sh` の build_all_modules() の `build xxx yyy` の部分をビルドが終わったとこまでコメントアウトして、
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
$ rm -r src/xxx/yyy/builddir
```