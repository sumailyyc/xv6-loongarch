#include "types.h"
#include "param.h"
#include "memlayout.h"
#include "loongarch.h"
#include "defs.h"

//
// the loongarch I/O Interrupt Controller Registers(IOCR).
//

void
iocrinit(void)//todo
{

  *(volatile uint8*)(IOCR_ROUTING + UART0_IRQ) = 0x11;
  *(volatile uint32*)IOCR_INTENSET = (1U << UART0_IRQ);
  *(volatile uint32*)IOCR_INTEDGE = (0U << UART0_IRQ);
}

// ask the IOCR what interrupt we should serve.
uint32
iocr_claim(void)
{
  uint32 irq = *(volatile uint32*)IOCR_INTISR;
  return irq;
}

// tell the IOCR we've served this IRQ.
void
iocr_complete(uint32 irq)
{
  *(uint32*)IOCR_INTENCLR = (irq);
  *(uint32*)IOCR_INTENSET = (irq);
}
