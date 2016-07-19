# p7zip-zstd
p7zip with ZStandard support. 

## Build instructions:

### Easy way

Read makefile.common to see available make targets. If you're in a hurry:
- Download https://github.com/tehmul/p7zip-zstd/blob/master/p7zip_16.02_zstd_0.7.4.tar.bz2
- Extract: ```tar jxvf p7zip_16.02_zstd_0.7.4.tar.bz2``` 
- Compile:
```sh
make all3 all4
sudo make install
```

### Patching the original p7zip_16.02 source

If you'd already have the original p7zip_16.02 source from sourceforge, download  https://github.com/tehmul/p7zip-zstd/blob/master/p7zip_16.02_zstd_0.7.4.diff
and apply the patch:
```sh
tar jxvf p7zip_16.02_src_all.tar.bz2
patch -p0 <p7zip_16.02_zstd_0.7.4.diff
```
## Usage

No args given, standard 7-zip behavior
```
7z a archive.7z ...

```

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
- Original sources for the 7-zip Zstd plugin:
    - Website: https://mcmilk.de/projects/7-Zip-ZStd/,
    - Gihub:   https://github.com/mcmilk/7-Zip-Zstd
- Original p7zip sources: http://p7zip.sourceforge.net/
