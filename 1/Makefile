hw.o: hw.asm
	nasm -f elf64 hw.asm -o hw.o
	ld hw.o -o hw
	strip -s hw

clean:
	rm -f hw.o hw
