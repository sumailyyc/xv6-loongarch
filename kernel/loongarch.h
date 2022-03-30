#define  CSR_CRMD_IE_SHIFT		    2
#define  CSR_CRMD_IE			        ( 0x1 << CSR_CRMD_IE_SHIFT )

// read and write tp, the thread pointer, which holds
// this core's hartid (core number), the index into cpus[].
static inline uint64
r_tp()
{
  uint64 x;
  asm volatile("addi.d %0, $tp, 0" : "=r" (x) );
  return x;
}

static inline uint32
r_csr_crmd()
{
  uint32 x;
  asm volatile("csrrd %0, 0x0" : "=r" (x) );
  return x;
}

static inline void 
w_csr_crmd(uint32 x)
{
  asm volatile("csrwr %0, 0x0" : : "r" (x));
}

static inline int
intr_get()
{
  uint32 x = r_csr_crmd();
  return (x & CSR_CRMD_IE) != 0;
}

// enable device interrupts
static inline void
intr_on()
{
  w_csr_crmd(r_csr_crmd() | CSR_CRMD_IE);
}

// disable device interrupts
static inline void
intr_off()
{
  w_csr_crmd(r_csr_crmd() & ~CSR_CRMD_IE);
}

typedef uint64 pte_t;
typedef uint64 *pagetable_t;