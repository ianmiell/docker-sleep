s.o: s.asm
	nasm -f elf64 s.asm -o s.o
	ld s.o -o s
	strip -s s
	docker build -t s .
	docker save s > s.tar
	gzip -9 s.tar

clean:
	rm -f s.o s s.tar s.tar.gz
	docker rmi -f s
