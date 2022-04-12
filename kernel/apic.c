#include "types.h"
#include "param.h"
#include "memlayout.h"
#include "loongarch.h"
#include "defs.h"

//
// the loongarch 7A1000 I/O Interrupt Controller Registers.
//

void
apic_init(void)//todo
{
  *(volatile uint64*)(LS7A_INT_MASK_REG) = ~(0x1UL << UART0_IRQ);
  *(volatile uint64*)(LS7A_INT_HTMSI_EN_REG) = 0x0UL;
  *(volatile uint64*)(LS7A_INT_EDGE_REG) = 0x0UL;
  *(volatile uint64*)(LS7A_INT_AUTO_CTRL0) = 0x0UL;
  *(volatile uint64*)(LS7A_INT_AUTO_CTRL1) = 0x0UL;
  *(volatile uint8*)(LS7A_INT_ROUTE_ENTRY_REG + UART0_IRQ) = 0b01U; 
  *(volatile uint64*)(LS7A_INT_POL_REG) = 0x0UL;


  printf("ID:%p\n",*(volatile uint64*)LS7A_PCH_REG_BASE);
  printf("MASK:%p\n",*(volatile uint64*)(LS7A_INT_MASK_REG));
  printf("HTMSI_EN:%p\n",*(volatile uint64*)(LS7A_INT_HTMSI_EN_REG));
  printf("EDGE:%p\n",*(volatile uint64*)(LS7A_INT_EDGE_REG));
  printf("CTRL0:%p\n",*(volatile uint64*)(LS7A_INT_AUTO_CTRL0));
  printf("CTRL1:%p\n",*(volatile uint64*)(LS7A_INT_AUTO_CTRL1));
  printf("UART0_ROUTE_ENTRY:%x\n",*(volatile uint8*)(LS7A_INT_ROUTE_ENTRY_REG + UART0_IRQ));
  printf("ISR:%p\n",*(volatile uint64*)(LS7A_INT_STATUS_REG));
  printf("POL:%p\n",*(volatile uint64*)(LS7A_INT_POL_REG));
}

// ask the apic what interrupt we should serve.
uint64
apic_claim(void)
{
  return *(volatile uint64*)(LS7A_INT_STATUS_REG);
}

// tell the apic we've served this IRQ.
void
apic_complete(uint64 irq)
{
  *(volatile uint64*)(LS7A_INT_CLEAR_REG) = (irq);
  *(volatile uint64*)(LS7A_INT_MASK_REG) = ((*(volatile uint64*)(LS7A_INT_MASK_REG)) & (~irq));
}
