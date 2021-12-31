OUTPUT_ARCH("riscv")
ENTRY(_start)
SECTIONS
{
    . = 0x80000000; /* entry point of qemu */
    .text   : { *(.text) }
    .rodata : { *(.rodata) }
    .data   : { *(.data) }
    .bss    : { *(.bss) }
    . = ALIGN(4);
    stack = .;     /* start point of stack area */
    . = . + 0x400; /* stack area is 1KiB */
    stack0 = .;    /* initial value of stack pointer */
}
