# p7zip-zstd
p7zip with ZStandard support. 

## Build instructions:

### Quick and dirty build

Read makefile.common to see available make targets. If you're in a hurry:
- Download https://github.com/tehmul/p7zip-zstd/blob/master/p7zip_15.14.1_zstd_src_all.tar.bz2
- Extract: ```tar jxvf p7zip_15.14.1_zstd_src_all.tar.bz2``` 
- Compile:
```sh
make all4
sudo make install
```

### Patching the original p7zip_15.14.1 source

If you'd already have the original p7zip_15.14.1 source from sourceforge, download  https://github.com/tehmul/p7zip-zstd/blob/master/p7zip_15.14.1_ZStd.diff
and apply the patch using:
```sh
patch -p0 <p7zip_15.14.1_ZStd.diff
```
