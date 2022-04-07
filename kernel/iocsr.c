#include "types.h"
#include "param.h"
#include "memlayout.h"
#include "loongarch.h"
#include "defs.h"

//
// the loongarch I/O Interrupt Controller Registers(IOCR).
//

void
iocsrinit(void)//todo
{
  iocsr_writel(0x110000U, IOCSR_ROUTING_OFFSET+8);
  printf("ROUTING=%x\n",iocsr_readl(IOCSR_ROUTING_OFFSET+8));

  iocsr_writel(1U << UART0_IRQ, IOCSR_INTENSET_OFFSET);
  printf("INTENSET=%x\n",iocsr_readl(IOCSR_INTENSET_OFFSET));

  iocsr_writel(0U << UART0_IRQ, IOCSR_INTEDGE_OFFSET);
  printf("INTEDGE=%x\n",iocsr_readl(IOCSR_INTEDGE_OFFSET));
}

// ask the IOCR what interrupt we should serve.
uint32
iocsr_claim(void)
{
  return iocsr_readl(IOCSR_INTISR_OFFSET);
}

// tell the IOCR we've served this IRQ.
void
iocsr_complete(uint32 irq)
{
  iocsr_writel(irq, IOCSR_INTENCLR_OFFSET);
  iocsr_writel(irq, IOCSR_INTENSET_OFFSET);
}
