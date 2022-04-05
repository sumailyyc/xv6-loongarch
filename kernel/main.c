#include "types.h"
#include "param.h"
#include "loongarch.h"
#include "defs.h"
#include "memlayout.h"

// entry.S needs one stack per CPU.
__attribute__ ((aligned (16))) char stack0[4096 * NCPU];

volatile static int started = 0;

// entry.S jumps here on stack0.
void
main()
{
   if(cpuid() == 0){
    consoleinit();
    printfinit();
    printf("\n");
    printf("xv6 kernel is booting\n");
    printf("\n");
    kinit();         // physical page allocator
    printf("physical memory init\n");
    tlbinit();
    printf("tlb init\n");
    vminit();        // create kernel page table
    printf("virtual memory init\n");
    procinit();      // process table
    printf("proc init\n");
    trapinit();      // trap vectors
    printf("trap init\n");
    int* p = (int*)0x0UL;
    *p = 19981119;
    int k = *p;
    printf("%d\n",k);
    __sync_synchronize();
    started = 1;
    printf("init done\n");
  } else {
    while(started == 0)
      ;
    __sync_synchronize();
    printf("hart %d starting\n", cpuid());
  }
 
}

