LD = ../origdev/pic32/compiler/pic32-tools/bin/pic32-gcc
CC = ../origdev/pic32/compiler/pic32-tools/bin/pic32-gcc
OBJDUMP = ../origdev/pic32/compiler/pic32-tools/bin/pic32-objdump
CFLAG = -Os -minterlink-compressed -mprocessor=32MX250F128B -Wall -c -g
OBJ = \
NVMem.o \
cmpdata.o\
compiler.o\
debug.o\
editor.o\
error.o\
exception.o\
float.o\
function.o\
globalvars.o\
keyinput.o\
library.o\
linker.o\
main.o\
memory.o\
music.o\
operator.o\
run.o\
statement.o\
string.o\
value.o\
varname.o\
crti.S\
crtn.S\
crt0.S\
file.o




machikaz.hex: machikaz
	/opt/microchip/xc32/v1.44/bin/xc32-bin2hex $^

machikaz: $(OBJ)
	$(LD) -o $@ $^  -mprocessor=32MX250F128B -Os -T App_32MX170F256B.ld *.a -Wl,--defsym,_min_heap_size=0,--defsym=_min_stack_size=1000,--gc-sections,--report-mem -lm -nostartfiles
	cp machikaz machikaz.elf
	$(OBJDUMP) machikaz.elf -S > machi.dis

clean:
	rm $(OBJ)

NVMem.o	:NVMem.c
	$(CC) $^ $(CFLAG)

aoutloader.o:aoutloader.c
	$(CC) $^  $(CFLAG)

cmpdata.o:cmpdata.c
	$(CC) $^ $(CFLAG)

compiler.o:compiler.c
	$(CC) $^ $(CFLAG)

debug.o:debug.c
	$(CC) $^ $(CFLAG)

editor.o:editor.c
	$(CC)  $^ $(CFLAG)

error.o:error.c
	$(CC) $^ $(CFLAG)

exception.o:exception.c
	$(CC) $^ $(CFLAG)

ff.o:ff.c
	$(CC)  $^ $(CFLAG)

ff_wrap.o:ff_wrap.c
	$(CC) $^  $(CFLAG)

flash.o:flash.c
	$(CC) $^  $(CFLAG)

float.o:float.c
	$(CC) $^ $(CFLAG)

function.o:function.c
	$(CC) $^ $(CFLAG)

globalvars.o:globalvars.c
	$(CC) $^ $(CFLAG)

keyinput.o:keyinput.c
	$(CC) $^ $(CFLAG)

library.o:library.c
	$(CC) $^ $(CFLAG)

linker.o:linker.c
	$(CC) $^ $(CFLAG)

main.o:main.c
	$(CC) $^  $(CFLAG)

memory.o:memory.c
	$(CC) $^ $(CFLAG)

music.o:music.c
	$(CC) $^ $(CFLAG)

operator.o:operator.c
	$(CC) $^ $(CFLAG)

run.o:run.c
	$(CC) $^ $(CFLAG)

statement.o:statement.c
	$(CC) $^ $(CFLAG)

string.o:string.c
	$(CC) $^ $(CFLAG)

file.o:file.c
	$(CC) $^  $(CFLAG)

value.o:value.c
	$(CC) $^ $(CFLAG)

varname.o:varname.c
	$(CC) $^ $(CFLAG)

xprintf.o:xprintf.c
	$(CC) $^  $(CFLAG)
