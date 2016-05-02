# p7zip-zstd
p7zip with ZStandard support. 

## Build instructions:

### Easy way

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
## Usage

Fastest mode, no bcj processing
```
7z a archive.7z -m0=zstd -mx0 ...
```

Fast mode, bcj processing
```
7z a archive.7z -m0=zstd -mx1 ...
```

Slow mode, bcj processing
```
7z a archive.7z -m0=zstd -mx21 ..
```

Ultra mode, bcj processing
```
7z a archive.7z -m0=zstd -mx22 ..
```

## References:
- Original sources for Zstd: https://github.com/Cyan4973/zstd
- Original sources for Zstd plugin: https://mcmilk.de/projects/7-Zip-ZStd/
- Original p7zip sources: http://p7zip.sourceforge.net/
