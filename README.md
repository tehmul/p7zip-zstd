# p7zip-zstd
p7zip with ZStandard support. 

## Build instructions:

### Easy way

Read makefile.common to see available make targets. 
- Compile:
```sh
make all3 all4
sudo make install
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
