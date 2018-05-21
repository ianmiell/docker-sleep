s.o: s.asm
	nasm -f elf64 s.asm -o s.o
	nasm -f bin tiny.asm -o tiny
	chmod +x tiny
	ld s.o -o s
	strip -s s
	docker build -t s .
	docker save s > a
	gzip -9 a

clean:
	rm -f s.o s s.tar s.tar.gz tiny
	docker rmi -f s
