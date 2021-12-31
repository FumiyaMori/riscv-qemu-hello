  .section .text
  .global _start
_start:
  la sp, stack0 # set up stack pointer
  jal main
halt:
  j halt
