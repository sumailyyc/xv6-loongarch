#include "types.h"
#include "param.h"
#include "memlayout.h"
#include "loongarch.h"
#include "defs.h"

void extioi_init(void)
{
    iocsr_writeq((1UL << EXT_INT_EN_SHIFT),LOONGARCH_OTHER_FUNC);
    printf("OTHER_FUNC:%p\n",iocsr_readq(LOONGARCH_OTHER_FUNC));

    iocsr_writeq(0x1UL << UART0_IRQ,LOONGARCH_IOCSR_EXTIOI_EN_BASE);
    printf("EN_BASE:%p\n",iocsr_readq(LOONGARCH_IOCSR_EXTIOI_EN_BASE));

    iocsr_writeq(0x0,LOONGARCH_IOCSR_EXTIOI_BOUNCE_BASE);
    printf("BOUNCE_BASE:%p\n",iocsr_readq(LOONGARCH_IOCSR_EXTIOI_BOUNCE_BASE));

    iocsr_writeq(0x0808080808080808UL,LOONGARCH_IOCSR_EXTIOI_MAP_BASE);
    printf("MAP_BASE:%p\n",iocsr_readq(LOONGARCH_IOCSR_EXTIOI_MAP_BASE));

    int i;
    for(i = 0;i < 8; i++)
    {
        iocsr_writeq(0x0101010101010101,LOONGARCH_IOCSR_EXTIOI_ROUTE_BASE + i*8);
    }
    printf("ROUTE_BASE:%p\n",iocsr_readq(LOONGARCH_IOCSR_EXTIOI_ROUTE_BASE));

    iocsr_writeq(0x0,LOONGARCH_IOCSR_EXRIOI_NODETYPE_BASE);
    printf("NODETYPE_BASE:%p\n",iocsr_readq(LOONGARCH_IOCSR_EXRIOI_NODETYPE_BASE));

    printf("ISR_BASE:%p\n",iocsr_readq(LOONGARCH_IOCSR_EXTIOI_ISR_BASE));
}