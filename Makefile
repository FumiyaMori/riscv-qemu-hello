CC = riscv64-unknown-elf-gcc
CFLAGS = -g -O0 -Wall -ffreestanding
CFLAGS += -mcmodel=medany
# CFLAGS += -march=rv32i -mabi=ilp32
CFLAGS += -march=rv64g -mabi=lp64

LD = riscv64-unknown-elf-ld
LDFLAGS = -nostdlib -static
# LDFLAGS += -melf32lriscv
LDFLAGS += -melf64lriscv

# QEMU = qemu-system-riscv32
QEMU = qemu-system-riscv64

GDB = riscv64-unknown-elf-gdb
GDBSERVERPORT = 10000

DEST = dest

.PHONY: qemu debug clean

default: $(DEST)/hello

$(DEST)/boot.o: boot.s
	$(CC) $(CFLAGS) -o $(DEST)/boot.o -c $^

$(DEST)/main.o: main.c
	$(CC) $(CFLAGS) -o $(DEST)/main.o -c $^

$(DEST)/hello: hello.ld $(DEST)/boot.o $(DEST)/main.o
	$(LD) $(LDFLAGS) -T hello.ld -o $(DEST)/hello $(DEST)/boot.o $(DEST)/main.o

qemu: $(DEST)/hello
	$(QEMU) -M virt -nographic -bios none -kernel $^

debug: $(DEST)/hello
	$(QEMU) -M virt -nographic -bios none -kernel $^ -gdb tcp::$(GDBSERVERPORT) -S &
	$(GDB) --eval-command="target remote localhost:$(GDBSERVERPORT)" $^

clean:
	rm $(DEST)/*
