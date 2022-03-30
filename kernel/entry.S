	# qemu -kernel loads the kernel at 0x00000000
        # and causes each CPU to jump there.
        # kernel.ld causes the following code to
        # be placed at 0x00000000.

#include "asm.h"

.section .text
.global _entry
_entry:
        li.d        $t0, 0x8000000000000000   
        csrwr       $t0, LOONGARCH_CSR_DMWIN0
        li.d        $t0, 0x9000000000000011   # CA, PLV0, 0x9000 xxxx xxxx xxxx
        csrwr       $t0, LOONGARCH_CSR_DMWIN1
	# set up a stack for C.
        # stack0 is declared in start.c,
        # with a 4096-byte stack per CPU.
        # sp = stack0 + (hartid * 4096)
        la.global   $t0, 0f
        jirl        $zero, $t0, 0
      0:      
        la          $sp, stack0
        li.d        $a0, 1024*4
	csrrd       $a1, LOONGARCH_CSR_CPUID
        addi.d      $tp, $a1, 0
        addi.d      $a1, $a1, 1
        mul.d       $a0, $a0, $a1
        add.d       $sp, $sp, $a0
	# jump to start() in start.c
        bl          main
spin:
        b           spin
