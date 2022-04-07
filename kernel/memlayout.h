// Physical memory layout

// 0x00200000 -- bios loads kernel here and jumps here
// 0x1c000000 -- reset address
// 0x1fe00000 -- I/O interrupt base address
// 0x1fe001e0 -- uart16550 serial port
// 0x90000000 -- RAM used by user pages

#define DMWIN_MASK 0x9000000000000000

// qemu puts UART registers here in virtual memory.
#define UART0 (0x1fe001e0UL | DMWIN_MASK)
#define UART0_IRQ 10

#define LOONGSON_REG_BASE	(0x1fe00000 | DMWIN_MASK)
#define IOCR_ROUTING  (LOONGSON_REG_BASE + 0x1400UL)
#define IOCR_INTISR  (LOONGSON_REG_BASE + 0x1420UL)
#define IOCR_INTENSET  (LOONGSON_REG_BASE + 0x1428UL)
#define IOCR_INTENCLR  (LOONGSON_REG_BASE + 0x142cUL)
#define IOCR_INTEDGE  (LOONGSON_REG_BASE + 0x1434UL)

// the kernel expects there to be RAM
// for use by user pages
// from physical address 0x90000000 to PHYSTOP.
#define RAMBASE (0x90000000UL | DMWIN_MASK)
#define RAMSTOP (RAMBASE + 1024*1024*1024)
