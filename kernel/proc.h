struct context
{
  uint64 ra;
  uint64 sp;

  // callee-saved
  uint64 s0;
  uint64 s1;
  uint64 s2;
  uint64 s3;
  uint64 s4;
  uint64 s5;
  uint64 s6;
  uint64 s7;
  uint64 s8;
  uint64 fp;
};

struct cpu {
  struct proc *proc;          // The process running on this cpu, or null.
  struct context context;     // swtch() here to enter scheduler().
  int noff;                   // Depth of push_off() nesting.
  int intena;                 // Were interrupts enabled before push_off()?
};

extern struct cpu cpus[NCPU];

struct trapframe {
  /*   0 */ uint64 kernel_satp;   // kernel page table
  /*   8 */ uint64 kernel_sp;     // top of process's kernel stack
  /*  16 */ uint64 kernel_trap;   // usertrap()
  /*  24 */ uint64 era;           // saved user program counter
  /*  32 */ uint64 kernel_hartid; // saved kernel tp
  /*  40 */ uint64 ra;
  /*  48 */ uint64 tp;
  /*  56 */ uint64 sp;
  /*  64 */ uint64 a0;
  /*  72 */ uint64 a1;
  /*  80 */ uint64 a2;
  /*  88 */ uint64 a3;
  /*  96 */ uint64 a4;
  /* 104 */ uint64 a5;
  /* 112 */ uint64 a6;
  /* 120 */ uint64 a7;
  /* 128 */ uint64 t0;
  /* 136 */ uint64 t1;
  /* 144 */ uint64 t2;
  /* 152 */ uint64 t3;
  /* 160 */ uint64 t4;
  /* 168 */ uint64 t5;
  /* 176 */ uint64 t6;
  /* 184 */ uint64 t7;
  /* 192 */ uint64 t8;
  /* 200 */ uint64 r21;
  /* 208 */ uint64 fp;
  /* 216 */ uint64 s0;
  /* 224 */ uint64 s1;
  /* 232 */ uint64 s2;
  /* 240 */ uint64 s3;
  /* 248 */ uint64 s4;
  /* 256 */ uint64 s5;
  /* 264 */ uint64 s6;
  /* 272 */ uint64 s7;
  /* 280 */ uint64 s8;
};


enum procstate { UNUSED, USED, SLEEPING, RUNNABLE, RUNNING, ZOMBIE };

struct proc
{
  struct spinlock lock;

  // p->lock must be held when using these:
  enum procstate state;        // Process state
  void *chan;                  // If non-zero, sleeping on chan
  int killed;                  // If non-zero, have been killed
  int xstate;                  // Exit status to be returned to parent's wait
  int pid;                     // Process ID

  // wait_lock must be held when using this:
  struct proc *parent;         // Parent process

  // these are private to the process, so p->lock need not be held.
  uint64 kstack;               // Virtual address of kernel stack
  uint64 sz;                   // Size of process memory (bytes)
  pagetable_t pagetable;    // User lower half address page table
  struct trapframe *trapframe; // data page for trampoline.S
  struct context context;      // swtch() here to run process
  struct file *ofile[NOFILE];  // Open files
  struct inode *cwd;           // Current directory
  char name[16];               // Process name (debugging)
};