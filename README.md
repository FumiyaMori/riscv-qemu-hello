# riscv-qemu hello

### Set up

```sh
brew install qemu
brew tap riscv/riscv
brew install riscv-tools
```

## Run

```sh
make qemu
```

To exit qemu, `ctrl + c` , `x`.

## qemu virt_memmap

memory map of qemu virt.
https://github.com/qemu/qemu/blob/master/hw/riscv/virt.c#L45-L61


## binutils

```sh
riscv64-unknown-elf-objdump -d dest/hello
riscv64-unknown-elf-readelf -a dest/hello
```
