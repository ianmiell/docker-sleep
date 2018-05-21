tiny: tiny.asm
	nasm -f bin tiny.asm -o t
	chmod +x t
	docker build -t t .
	docker save t > b
	gzip -9 b

clean:
	rm -f b.gz tiny b
	docker rmi -f t
