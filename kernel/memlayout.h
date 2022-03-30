// Physical memory layout

// 0x00200000 -- bios loads kernel here and jumps here
// 0x1c000000 -- reset address
// 0x1fe001e0 -- uart16550 serial port


// qemu puts UART registers here in physical memory.
#define UART0 0x1fe001e0
#define UART0_IRQ 10
