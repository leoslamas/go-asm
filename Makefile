main: clean main.go helloAsm.o helloC.o
	gccgo helloAsm.o helloC.o main.go -o main
	@echo "Main done."

helloAsm.o: helloAsm.asm
	nasm -f elf64 -o helloAsm.o helloAsm.asm
	@echo "HelloAsm done."

helloC.o: helloC.c
	gccgo -c helloC.c -o helloC.o -shared
	objcopy --prefix-symbols=main. helloC.o
	@echo "HelloC done."

clean:
	rm -rf _obj *.o *~ *.6 *.gch a.out main
	@echo "Clean done."