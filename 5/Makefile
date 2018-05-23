
XZ ?= xz
NASM ?= nasm
DOCKER ?= docker

all: b.lzma 32/b.lzma

%.lzma: %
	$(XZ) --format=lzma -9 --extreme --lzma1=preset=9,lc=1,lp=0,pb=0 --keep --stdout "$<" > "$@"
	@wc -c "$@"

32/t: 32/tiny.asm
	$(NASM) -fbin -o"$@" "$<"
	@chmod +x "$@"
	@wc -c "$@"

t: tiny.asm
	$(NASM) -fbin -o"$@" "$<"
	@chmod +x "$@"
	@wc -c "$@"

32/b: 32/t 32/
	$(DOCKER) build -t $^
	$(DOCKER) save "$<" > "$@"
	@wc -c "$@"

b: t .
	$(DOCKER) build -t $^
	$(DOCKER) save "$<" > "$@"
	@wc -c "$@"

clean:
	-rm -vf {32/,}t {32/,}b {32/,}*.lzma
	-$(DOCKER) rmi -f t
	-$(DOCKER) rmi -f 3

