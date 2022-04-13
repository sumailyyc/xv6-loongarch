// Physical memory layout

// 0x00200000 -- bios loads kernel here and jumps here
// 0x10000000 -- 
// 0x1c000000 -- reset address
// 0x1fe00000 -- I/O interrupt base address
// 0x1fe001e0 -- uart16550 serial port
// 0x90000000 -- RAM used by user pages

#define DMWIN_MASK 0x9000000000000000

// qemu puts UART registers here in virtual memory.
#define UART0 (0x1fe001e0UL | DMWIN_MASK)
#define UART0_IRQ 2

/* ============== LS7A registers =============== */
#define LS7A_PCH_REG_BASE		(0x10000000UL | DMWIN_MASK)

#define LS7A_INT_MASK_REG		LS7A_PCH_REG_BASE + 0x020
#define LS7A_INT_EDGE_REG		LS7A_PCH_REG_BASE + 0x060
#define LS7A_INT_CLEAR_REG		LS7A_PCH_REG_BASE + 0x080
#define LS7A_INT_HTMSI_VEC_REG		LS7A_PCH_REG_BASE + 0x200
#define LS7A_INT_STATUS_REG		LS7A_PCH_REG_BASE + 0x3a0
#define LS7A_INT_POL_REG		LS7A_PCH_REG_BASE + 0x3e0

// the kernel expects there to be RAM
// for use by user pages
// from physical address 0x90000000 to PHYSTOP.
#define RAMBASE (0x90000000UL | DMWIN_MASK)
#define RAMSTOP (RAMBASE + 1024*1024*1024)

// virtio mmio interface
#define VIRTIO0 (0x100000000 | DMWIN_MASK)
#define VIRTIO0_IRQ 1
