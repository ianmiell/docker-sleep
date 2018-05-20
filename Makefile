s.o: sleep.asm
	nasm -f elf64 sleep.asm -o s.o
	ld sleep.o -o s
	strip -s s
	docker build -t s .

clean:
	rm -f s.o s
