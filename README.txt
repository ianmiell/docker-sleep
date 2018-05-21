

1/* - Initial creation of small binary using 'pause' syscall [i], [ii]

2/* - Reduction with hexered

3/* - Using tiny.asm [iii]

[i] - https://www.muppetlabs.com/~breadbox/software/tiny/teensy.html

[ii] - http://asm.sourceforge.net/syscall.html

[iii] - https://blog.stalkr.net/2014/10/tiny-elf-3264-with-nasm.html



Other tricks/notes:

- tar filename is in the gzip - remove that for a couple of bytes

- gzip beats other compression for small files

- no command - require that is passed in on invocation

- Using hexered to reduce the size of the binary by hand

