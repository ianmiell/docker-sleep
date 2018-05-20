s.o: s.asm
	nasm -f elf64 s.asm -o s.o
	ld s.o -o s
	strip -s s
	docker build -t s .

clean:
	rm -f s.o s
