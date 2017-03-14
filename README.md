# Greybeard Backup

## What?

A _simple_ backup script for
[the greybeard](http://pastebin.com/kMZ4hDf2 "Greybeard defined").
No frills. No proprietary magic. And **no security**. If you need security you
will have to encrypt the resulting archive file yourself.

This is **not** intended as your primary backup solution. It is only the
backup for when the complex full featured systems fail.

All it does is make a simple compressed Tar archive of a given directory. The
current user home directory is assumed by default. You can then for example
move said archive to a flash drive and lock it in a
[fire safe](https://en.wikipedia.org/wiki/Safe#Fire-resistant_safes).

## FAQ

### [What?](#what?)

[This.](#what?)

### Do you actually use this?

Yes. But I *also* use
<a href="https://en.wikipedia.org/wiki/Time_Machine_(macOS)">Time Machine</a>
on my
[MacBook Air](http://www.apple.com/macbook-air).

### Why Tar?

It preserves symbolic links. So you can copy your backup archive file onto a
filesystem that does not support them like
[exFAT](https://en.wikipedia.org/wiki/ExFAT).

<hr>
Released under the [BSD license](LICENSE.txt).
