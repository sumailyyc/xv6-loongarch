#include "types.h"
#include "param.h"
#include "memlayout.h"
#include "loongarch.h"
#include "spinlock.h"
#include "proc.h"
#include "defs.h"

struct spinlock tickslock;
uint ticks;

extern char trampoline[], uservec[], userret[];

// in kernelvec.S, calls kerneltrap().
void kernelvec();
void handle_tlbr();
void handle_merr();

extern int devintr();

void
trapinit(void)
{
  initlock(&tickslock, "time");
  uint32 ecfg = ( 0U << CSR_ECFG_VS_SHIFT ) | HWI_VEC;
  w_csr_ecfg(ecfg);
  w_csr_eentry((uint64)kernelvec);
  w_csr_tlbrentry((uint64)handle_tlbr);
  w_csr_merrentry((uint64)handle_merr);
}

// interrupts and exceptions from kernel code go here via kernelvec,
// on whatever the current kernel stack is.
void 
kerneltrap()//todo
{
  printf("trap\n");
  int which_dev = 0;
  uint64 era = r_csr_era();
  uint64 prmd = r_csr_prmd();
  
  if((prmd & PRMD_PPLV) != 0)
    panic("kerneltrap: not from privilege0");
  if(intr_get() != 0)
    panic("kerneltrap: interrupts enabled");

  if((which_dev = devintr()) == 0){
    printf("estat %x\n", r_csr_estat());
    printf("era=%p eentry=%p\n", r_csr_era(), r_csr_eentry());
    panic("kerneltrap");
  }

  // give up the CPU if this is a timer interrupt.
  if(which_dev == 2 && myproc() != 0 && myproc()->state == RUNNING)
    yield();

  // the yield() may have caused some traps to occur,
  // so restore trap registers for use by kernelvec.S's instruction.
  w_csr_era(era);
  w_csr_prmd(prmd);
}

void 
machine_trap()
{
  panic("machine error");
}

void
clockintr()
{
  //todo
  acquire(&tickslock);
  ticks++;
  wakeup(&ticks);
  release(&tickslock);
}

// check if it's an external interrupt or software interrupt,
// and handle it.
// returns 2 if timer interrupt,
// 1 if other device,
// 0 if not recognized.
int
devintr()//todo
{
  uint32 estat = r_csr_estat();
  uint32 ecfg = r_csr_ecfg();

  if(estat & ecfg & HWI_VEC) {
    // this is a hardware interrupt, via IOCR.

    // irq indicates which device interrupted.
    uint32 irq = iocsr_claim();
    if(irq & (1U << UART0_IRQ)){
      uartintr();

    // tell the IOCR the device is
    // now allowed to interrupt again.
      iocsr_complete(1U << UART0_IRQ);
    } else if(irq){
       printf("unexpected interrupt irq=%d\n", irq);
      iocsr_complete(irq);
    }

    return 1;
  } else if(estat & ecfg & TI_VEC){
    //timer interrupt,

    if(cpuid() == 0){
      clockintr();
    }
    
    // acknowledge the timer interrupt by clearing
    // the TI bit in TICLR.
    w_csr_ticlr(r_csr_ticlr() | CSR_TICLR_CLR);

    return 2;
  } else {
    return 0;
  }
}