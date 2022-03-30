
kernel/kernel:     file format elf64-loongarch


Disassembly of section .text:

9000000000200000 <_entry>:
9000000000200000:	0320000c 	lu52i.d     	$t0, $zero, -2048(0x800)
9000000000200004:	0406002c 	csrwr       	$t0, 0x180
9000000000200008:	0380440c 	ori         	$t0, $zero, 0x11
900000000020000c:	0324018c 	lu52i.d     	$t0, $t0, -1792(0x900)
9000000000200010:	0406042c 	csrwr       	$t0, 0x181
9000000000200014:	1c000043 	pcaddu12i   	$sp, 2(0x2)
9000000000200018:	28c5f063 	ld.d        	$sp, $sp, 380(0x17c)
900000000020001c:	14000024 	lu12i.w     	$a0, 1(0x1)
9000000000200020:	04008005 	csrrd       	$a1, 0x20
9000000000200024:	02c000a2 	addi.d      	$tp, $a1, 0
9000000000200028:	02c004a5 	addi.d      	$a1, $a1, 1(0x1)
900000000020002c:	001d9484 	mul.d       	$a0, $a0, $a1
9000000000200030:	00109063 	add.d       	$sp, $sp, $a0
9000000000200034:	54000800 	bl          	8(0x8)	# 900000000020003c <main>

9000000000200038 <spin>:
9000000000200038:	50000000 	b           	0	# 9000000000200038 <spin>

900000000020003c <main>:
volatile static int started = 0;

// entry.S jumps here on stack0.
void
main()
{
900000000020003c:	02ffc063 	addi.d      	$sp, $sp, -16(0xff0)
9000000000200040:	29c02061 	st.d        	$ra, $sp, 8(0x8)
9000000000200044:	27000076 	stptr.d     	$fp, $sp, 0
9000000000200048:	02c04076 	addi.d      	$fp, $sp, 16(0x10)
   if(cpuid() == 0){
900000000020004c:	54075000 	bl          	1872(0x750)	# 900000000020079c <cpuid>
    printf("xv6 kernel is booting\n");
    printf("\n");
    __sync_synchronize();
    started = 1;
  } else {
    while(started == 0)
9000000000200050:	1c00006d 	pcaddu12i   	$t1, 3(0x3)
9000000000200054:	02c541ad 	addi.d      	$t1, $t1, 336(0x150)
   if(cpuid() == 0){
9000000000200058:	40003480 	beqz        	$a0, 52(0x34)	# 900000000020008c <main+0x50>
    while(started == 0)
900000000020005c:	240001ac 	ldptr.w     	$t0, $t1, 0
9000000000200060:	43fffd9f 	beqz        	$t0, -4(0x7ffffc)	# 900000000020005c <main+0x20>
      ;
    __sync_synchronize();
9000000000200064:	38720000 	dbar        	0x0
    printf("hart %d starting\n", cpuid());
9000000000200068:	54073400 	bl          	1844(0x734)	# 900000000020079c <cpuid>
900000000020006c:	00150085 	move        	$a1, $a0
9000000000200070:	1c000044 	pcaddu12i   	$a0, 2(0x2)
9000000000200074:	02fea084 	addi.d      	$a0, $a0, -88(0xfa8)
9000000000200078:	5404bc00 	bl          	1212(0x4bc)	# 9000000000200534 <printf>
  }
 
}
900000000020007c:	28c02061 	ld.d        	$ra, $sp, 8(0x8)
9000000000200080:	26000076 	ldptr.d     	$fp, $sp, 0
9000000000200084:	02c04063 	addi.d      	$sp, $sp, 16(0x10)
9000000000200088:	4c000020 	jirl        	$zero, $ra, 0
    consoleinit();
900000000020008c:	54120000 	bl          	4608(0x1200)	# 900000000020128c <consoleinit>
    printfinit();
9000000000200090:	5406c800 	bl          	1736(0x6c8)	# 9000000000200758 <printfinit>
    printf("\n");
9000000000200094:	1c000044 	pcaddu12i   	$a0, 2(0x2)
9000000000200098:	02fe5084 	addi.d      	$a0, $a0, -108(0xf94)
900000000020009c:	54049800 	bl          	1176(0x498)	# 9000000000200534 <printf>
    printf("xv6 kernel is booting\n");
90000000002000a0:	1c000044 	pcaddu12i   	$a0, 2(0x2)
90000000002000a4:	02fd8084 	addi.d      	$a0, $a0, -160(0xf60)
90000000002000a8:	54048c00 	bl          	1164(0x48c)	# 9000000000200534 <printf>
    printf("\n");
90000000002000ac:	1c000044 	pcaddu12i   	$a0, 2(0x2)
90000000002000b0:	02fdf084 	addi.d      	$a0, $a0, -132(0xf7c)
90000000002000b4:	54048000 	bl          	1152(0x480)	# 9000000000200534 <printf>
    __sync_synchronize();
90000000002000b8:	38720000 	dbar        	0x0
    started = 1;
90000000002000bc:	1c00006c 	pcaddu12i   	$t0, 3(0x3)
90000000002000c0:	02c3918c 	addi.d      	$t0, $t0, 228(0xe4)
90000000002000c4:	0280040d 	addi.w      	$t1, $zero, 1(0x1)
90000000002000c8:	2500018d 	stptr.w     	$t1, $t0, 0
90000000002000cc:	53ffb3ff 	b           	-80(0xfffffb0)	# 900000000020007c <main+0x40>

90000000002000d0 <uartinit>:

void uartstart();

void
uartinit(void)
{
90000000002000d0:	02ffc063 	addi.d      	$sp, $sp, -16(0xff0)
90000000002000d4:	29c02061 	st.d        	$ra, $sp, 8(0x8)
90000000002000d8:	27000076 	stptr.d     	$fp, $sp, 0
90000000002000dc:	02c04076 	addi.d      	$fp, $sp, 16(0x10)
  // disable interrupts.
  WriteReg(IER, 0x00);
90000000002000e0:	143fc00c 	lu12i.w     	$t0, 130560(0x1fe00)
90000000002000e4:	0387858d 	ori         	$t1, $t0, 0x1e1
90000000002000e8:	290001a0 	st.b        	$zero, $t1, 0

  // special mode to set baud rate.
  WriteReg(LCR, LCR_BAUD_LATCH);
90000000002000ec:	03878d8f 	ori         	$t3, $t0, 0x1e3
90000000002000f0:	02be000e 	addi.w      	$t2, $zero, -128(0xf80)
90000000002000f4:	290001ee 	st.b        	$t2, $t3, 0

  // LSB for baud rate of 38.4K.
  WriteReg(0, 0x03);
90000000002000f8:	03878190 	ori         	$t4, $t0, 0x1e0
90000000002000fc:	02800c0e 	addi.w      	$t2, $zero, 3(0x3)
9000000000200100:	2900020e 	st.b        	$t2, $t4, 0

  // MSB for baud rate of 38.4K.
  WriteReg(1, 0x00);
9000000000200104:	290001a0 	st.b        	$zero, $t1, 0

  // leave set-baud mode,
  // and set word length to 8 bits, no parity.
  WriteReg(LCR, LCR_EIGHT_BITS);
9000000000200108:	290001ee 	st.b        	$t2, $t3, 0

  // reset and enable FIFOs.
  WriteReg(FCR, FCR_FIFO_ENABLE | FCR_FIFO_CLEAR);
900000000020010c:	0387898c 	ori         	$t0, $t0, 0x1e2
9000000000200110:	02801c0f 	addi.w      	$t3, $zero, 7(0x7)
9000000000200114:	2900018f 	st.b        	$t3, $t0, 0

  // enable transmit and receive interrupts.
  WriteReg(IER, IER_TX_ENABLE | IER_RX_ENABLE);
9000000000200118:	290001ae 	st.b        	$t2, $t1, 0

  initlock(&uart_tx_lock, "uart");
900000000020011c:	1c000045 	pcaddu12i   	$a1, 2(0x2)
9000000000200120:	02fc50a5 	addi.d      	$a1, $a1, -236(0xf14)
9000000000200124:	1c000064 	pcaddu12i   	$a0, 3(0x3)
9000000000200128:	02c2d084 	addi.d      	$a0, $a0, 180(0xb4)
900000000020012c:	540a3000 	bl          	2608(0xa30)	# 9000000000200b5c <initlock>
}
9000000000200130:	28c02061 	ld.d        	$ra, $sp, 8(0x8)
9000000000200134:	26000076 	ldptr.d     	$fp, $sp, 0
9000000000200138:	02c04063 	addi.d      	$sp, $sp, 16(0x10)
900000000020013c:	4c000020 	jirl        	$zero, $ra, 0

9000000000200140 <uartputc_sync>:
// use interrupts, for use by kernel printf() and
// to echo characters. it spins waiting for the uart's
// output register to be empty.
void
uartputc_sync(int c)
{
9000000000200140:	02ff8063 	addi.d      	$sp, $sp, -32(0xfe0)
9000000000200144:	29c06061 	st.d        	$ra, $sp, 24(0x18)
9000000000200148:	29c04076 	st.d        	$fp, $sp, 16(0x10)
900000000020014c:	29c02077 	st.d        	$s0, $sp, 8(0x8)
9000000000200150:	02c08076 	addi.d      	$fp, $sp, 32(0x20)
9000000000200154:	00150097 	move        	$s0, $a0
  push_off();
9000000000200158:	540a7000 	bl          	2672(0xa70)	# 9000000000200bc8 <push_off>

  if(panicked){
900000000020015c:	1c00004c 	pcaddu12i   	$t0, 2(0x2)
9000000000200160:	28c0b18c 	ld.d        	$t0, $t0, 44(0x2c)
9000000000200164:	2400018c 	ldptr.w     	$t0, $t0, 0
9000000000200168:	44004180 	bnez        	$t0, 64(0x40)	# 90000000002001a8 <uartputc_sync+0x68>
    for(;;)
      ;
  }

  // wait for Transmit Holding Empty to be set in LSR.
  while((ReadReg(LSR) & LSR_TX_IDLE) == 0)
900000000020016c:	143fc00d 	lu12i.w     	$t1, 130560(0x1fe00)
9000000000200170:	038795ad 	ori         	$t1, $t1, 0x1e5
9000000000200174:	2a0001ac 	ld.bu       	$t0, $t1, 0
9000000000200178:	0340818c 	andi        	$t0, $t0, 0x20
900000000020017c:	43fff99f 	beqz        	$t0, -8(0x7ffff8)	# 9000000000200174 <uartputc_sync+0x34>
    ;
  WriteReg(THR, c);
9000000000200180:	00c702e4 	bstrpick.d  	$a0, $s0, 0x7, 0x0
9000000000200184:	143fc00c 	lu12i.w     	$t0, 130560(0x1fe00)
9000000000200188:	0387818c 	ori         	$t0, $t0, 0x1e0
900000000020018c:	29000184 	st.b        	$a0, $t0, 0

  pop_off();
9000000000200190:	540b0000 	bl          	2816(0xb00)	# 9000000000200c90 <pop_off>
}
9000000000200194:	28c06061 	ld.d        	$ra, $sp, 24(0x18)
9000000000200198:	28c04076 	ld.d        	$fp, $sp, 16(0x10)
900000000020019c:	28c02077 	ld.d        	$s0, $sp, 8(0x8)
90000000002001a0:	02c08063 	addi.d      	$sp, $sp, 32(0x20)
90000000002001a4:	4c000020 	jirl        	$zero, $ra, 0
    for(;;)
90000000002001a8:	50000000 	b           	0	# 90000000002001a8 <uartputc_sync+0x68>

90000000002001ac <uartstart>:
// called from both the top- and bottom-half.
void
uartstart()
{
  while(1){
    if(uart_tx_w == uart_tx_r){
90000000002001ac:	1c00006c 	pcaddu12i   	$t0, 3(0x3)
90000000002001b0:	02fff18c 	addi.d      	$t0, $t0, -4(0xffc)
90000000002001b4:	2600018c 	ldptr.d     	$t0, $t0, 0
90000000002001b8:	1c00006d 	pcaddu12i   	$t1, 3(0x3)
90000000002001bc:	02ffe1ad 	addi.d      	$t1, $t1, -8(0xff8)
90000000002001c0:	260001ad 	ldptr.d     	$t1, $t1, 0
90000000002001c4:	5800b1ac 	beq         	$t1, $t0, 176(0xb0)	# 9000000000200274 <uartstart+0xc8>
{
90000000002001c8:	02ff0063 	addi.d      	$sp, $sp, -64(0xfc0)
90000000002001cc:	29c0e061 	st.d        	$ra, $sp, 56(0x38)
90000000002001d0:	29c0c076 	st.d        	$fp, $sp, 48(0x30)
90000000002001d4:	29c0a077 	st.d        	$s0, $sp, 40(0x28)
90000000002001d8:	29c08078 	st.d        	$s1, $sp, 32(0x20)
90000000002001dc:	29c06079 	st.d        	$s2, $sp, 24(0x18)
90000000002001e0:	29c0407a 	st.d        	$s3, $sp, 16(0x10)
90000000002001e4:	29c0207b 	st.d        	$s4, $sp, 8(0x8)
90000000002001e8:	2700007c 	stptr.d     	$s5, $sp, 0
90000000002001ec:	02c10076 	addi.d      	$fp, $sp, 64(0x40)
      // transmit buffer is empty.
      return;
    }
    
    if((ReadReg(LSR) & LSR_TX_IDLE) == 0){
90000000002001f0:	143fc019 	lu12i.w     	$s2, 130560(0x1fe00)
90000000002001f4:	0387973a 	ori         	$s3, $s2, 0x1e5
      // so we cannot give it another byte.
      // it will interrupt when it's ready for a new byte.
      return;
    }
    
    int c = uart_tx_buf[uart_tx_r % UART_TX_BUF_SIZE];
90000000002001f8:	1c00007c 	pcaddu12i   	$s5, 3(0x3)
90000000002001fc:	02ff039c 	addi.d      	$s5, $s5, -64(0xfc0)
    uart_tx_r += 1;
9000000000200200:	1c000078 	pcaddu12i   	$s1, 3(0x3)
9000000000200204:	02fea318 	addi.d      	$s1, $s1, -88(0xfa8)
    
    // maybe uartputc() is waiting for space in the buffer.
    wakeup(&uart_tx_r);
    
    WriteReg(THR, c);
9000000000200208:	03878339 	ori         	$s2, $s2, 0x1e0
    if(uart_tx_w == uart_tx_r){
900000000020020c:	1c00007b 	pcaddu12i   	$s4, 3(0x3)
9000000000200210:	02fe937b 	addi.d      	$s4, $s4, -92(0xfa4)
    if((ReadReg(LSR) & LSR_TX_IDLE) == 0){
9000000000200214:	2a00034d 	ld.bu       	$t1, $s3, 0
9000000000200218:	034081ad 	andi        	$t1, $t1, 0x20
900000000020021c:	400031a0 	beqz        	$t1, 48(0x30)	# 900000000020024c <uartstart+0xa0>
    int c = uart_tx_buf[uart_tx_r % UART_TX_BUF_SIZE];
9000000000200220:	03407d97 	andi        	$s0, $t0, 0x1f
9000000000200224:	38005f97 	ldx.b       	$s0, $s5, $s0
    uart_tx_r += 1;
9000000000200228:	02c0058c 	addi.d      	$t0, $t0, 1(0x1)
900000000020022c:	2700030c 	stptr.d     	$t0, $s1, 0
    wakeup(&uart_tx_r);
9000000000200230:	00150304 	move        	$a0, $s1
9000000000200234:	54079800 	bl          	1944(0x798)	# 90000000002009cc <wakeup>
    WriteReg(THR, c);
9000000000200238:	00c702f7 	bstrpick.d  	$s0, $s0, 0x7, 0x0
900000000020023c:	29000337 	st.b        	$s0, $s2, 0
    if(uart_tx_w == uart_tx_r){
9000000000200240:	2600030c 	ldptr.d     	$t0, $s1, 0
9000000000200244:	2600036d 	ldptr.d     	$t1, $s4, 0
9000000000200248:	5fffcdac 	bne         	$t1, $t0, -52(0x3ffcc)	# 9000000000200214 <uartstart+0x68>
  }
}
900000000020024c:	28c0e061 	ld.d        	$ra, $sp, 56(0x38)
9000000000200250:	28c0c076 	ld.d        	$fp, $sp, 48(0x30)
9000000000200254:	28c0a077 	ld.d        	$s0, $sp, 40(0x28)
9000000000200258:	28c08078 	ld.d        	$s1, $sp, 32(0x20)
900000000020025c:	28c06079 	ld.d        	$s2, $sp, 24(0x18)
9000000000200260:	28c0407a 	ld.d        	$s3, $sp, 16(0x10)
9000000000200264:	28c0207b 	ld.d        	$s4, $sp, 8(0x8)
9000000000200268:	2600007c 	ldptr.d     	$s5, $sp, 0
900000000020026c:	02c10063 	addi.d      	$sp, $sp, 64(0x40)
9000000000200270:	4c000020 	jirl        	$zero, $ra, 0
9000000000200274:	4c000020 	jirl        	$zero, $ra, 0

9000000000200278 <uartputc>:
{
9000000000200278:	02ff4063 	addi.d      	$sp, $sp, -48(0xfd0)
900000000020027c:	29c0a061 	st.d        	$ra, $sp, 40(0x28)
9000000000200280:	29c08076 	st.d        	$fp, $sp, 32(0x20)
9000000000200284:	29c06077 	st.d        	$s0, $sp, 24(0x18)
9000000000200288:	29c04078 	st.d        	$s1, $sp, 16(0x10)
900000000020028c:	29c02079 	st.d        	$s2, $sp, 8(0x8)
9000000000200290:	2700007a 	stptr.d     	$s3, $sp, 0
9000000000200294:	02c0c076 	addi.d      	$fp, $sp, 48(0x30)
9000000000200298:	0015009a 	move        	$s3, $a0
  acquire(&uart_tx_lock);
900000000020029c:	1c000064 	pcaddu12i   	$a0, 3(0x3)
90000000002002a0:	02fcf084 	addi.d      	$a0, $a0, -196(0xf3c)
90000000002002a4:	54098c00 	bl          	2444(0x98c)	# 9000000000200c30 <acquire>
  if(panicked){
90000000002002a8:	1c00004c 	pcaddu12i   	$t0, 2(0x2)
90000000002002ac:	28fb818c 	ld.d        	$t0, $t0, -288(0xee0)
90000000002002b0:	2400018c 	ldptr.w     	$t0, $t0, 0
90000000002002b4:	40000980 	beqz        	$t0, 8(0x8)	# 90000000002002bc <uartputc+0x44>
    for(;;)
90000000002002b8:	50000000 	b           	0	# 90000000002002b8 <uartputc+0x40>
    if(uart_tx_w == uart_tx_r + UART_TX_BUF_SIZE){
90000000002002bc:	1c00006c 	pcaddu12i   	$t0, 3(0x3)
90000000002002c0:	02fbd18c 	addi.d      	$t0, $t0, -268(0xef4)
90000000002002c4:	2600018d 	ldptr.d     	$t1, $t0, 0
90000000002002c8:	1c00006c 	pcaddu12i   	$t0, 3(0x3)
90000000002002cc:	02fb818c 	addi.d      	$t0, $t0, -288(0xee0)
90000000002002d0:	2600018c 	ldptr.d     	$t0, $t0, 0
90000000002002d4:	02c0818c 	addi.d      	$t0, $t0, 32(0x20)
90000000002002d8:	5c00398d 	bne         	$t0, $t1, 56(0x38)	# 9000000000200310 <uartputc+0x98>
      sleep(&uart_tx_r, &uart_tx_lock);
90000000002002dc:	1c000079 	pcaddu12i   	$s2, 3(0x3)
90000000002002e0:	02fbf339 	addi.d      	$s2, $s2, -260(0xefc)
90000000002002e4:	1c000077 	pcaddu12i   	$s0, 3(0x3)
90000000002002e8:	02fb12f7 	addi.d      	$s0, $s0, -316(0xec4)
    if(uart_tx_w == uart_tx_r + UART_TX_BUF_SIZE){
90000000002002ec:	1c000078 	pcaddu12i   	$s1, 3(0x3)
90000000002002f0:	02fb1318 	addi.d      	$s1, $s1, -316(0xec4)
      sleep(&uart_tx_r, &uart_tx_lock);
90000000002002f4:	00150325 	move        	$a1, $s2
90000000002002f8:	001502e4 	move        	$a0, $s0
90000000002002fc:	54065800 	bl          	1624(0x658)	# 9000000000200954 <sleep>
    if(uart_tx_w == uart_tx_r + UART_TX_BUF_SIZE){
9000000000200300:	2600030d 	ldptr.d     	$t1, $s1, 0
9000000000200304:	260002ec 	ldptr.d     	$t0, $s0, 0
9000000000200308:	02c0818c 	addi.d      	$t0, $t0, 32(0x20)
900000000020030c:	5bffe98d 	beq         	$t0, $t1, -24(0x3ffe8)	# 90000000002002f4 <uartputc+0x7c>
      uart_tx_buf[uart_tx_w % UART_TX_BUF_SIZE] = c;
9000000000200310:	03407dac 	andi        	$t0, $t1, 0x1f
9000000000200314:	1c00006e 	pcaddu12i   	$t2, 3(0x3)
9000000000200318:	02fa91ce 	addi.d      	$t2, $t2, -348(0xea4)
900000000020031c:	381031da 	stx.b       	$s3, $t2, $t0
      uart_tx_w += 1;
9000000000200320:	02c005ad 	addi.d      	$t1, $t1, 1(0x1)
9000000000200324:	1c00006c 	pcaddu12i   	$t0, 3(0x3)
9000000000200328:	02fa318c 	addi.d      	$t0, $t0, -372(0xe8c)
900000000020032c:	2700018d 	stptr.d     	$t1, $t0, 0
      uartstart();
9000000000200330:	57fe7fff 	bl          	-388(0xffffe7c)	# 90000000002001ac <uartstart>
      release(&uart_tx_lock);
9000000000200334:	1c000064 	pcaddu12i   	$a0, 3(0x3)
9000000000200338:	02fa9084 	addi.d      	$a0, $a0, -348(0xea4)
900000000020033c:	5409c800 	bl          	2504(0x9c8)	# 9000000000200d04 <release>
}
9000000000200340:	28c0a061 	ld.d        	$ra, $sp, 40(0x28)
9000000000200344:	28c08076 	ld.d        	$fp, $sp, 32(0x20)
9000000000200348:	28c06077 	ld.d        	$s0, $sp, 24(0x18)
900000000020034c:	28c04078 	ld.d        	$s1, $sp, 16(0x10)
9000000000200350:	28c02079 	ld.d        	$s2, $sp, 8(0x8)
9000000000200354:	2600007a 	ldptr.d     	$s3, $sp, 0
9000000000200358:	02c0c063 	addi.d      	$sp, $sp, 48(0x30)
900000000020035c:	4c000020 	jirl        	$zero, $ra, 0

9000000000200360 <uartgetc>:

// read one input character from the UART.
// return -1 if none is waiting.
int
uartgetc(void)
{
9000000000200360:	02ffc063 	addi.d      	$sp, $sp, -16(0xff0)
9000000000200364:	29c02076 	st.d        	$fp, $sp, 8(0x8)
9000000000200368:	02c04076 	addi.d      	$fp, $sp, 16(0x10)
  if(ReadReg(LSR) & 0x01){
900000000020036c:	143fc00c 	lu12i.w     	$t0, 130560(0x1fe00)
9000000000200370:	0387958c 	ori         	$t0, $t0, 0x1e5
9000000000200374:	2a00018c 	ld.bu       	$t0, $t0, 0
9000000000200378:	0340058c 	andi        	$t0, $t0, 0x1
900000000020037c:	40002180 	beqz        	$t0, 32(0x20)	# 900000000020039c <uartgetc+0x3c>
    // input data is ready.
    return ReadReg(RHR);
9000000000200380:	143fc00c 	lu12i.w     	$t0, 130560(0x1fe00)
9000000000200384:	0387818c 	ori         	$t0, $t0, 0x1e0
9000000000200388:	2a000184 	ld.bu       	$a0, $t0, 0
900000000020038c:	00c70084 	bstrpick.d  	$a0, $a0, 0x7, 0x0
  } else {
    return -1;
  }
}
9000000000200390:	28c02076 	ld.d        	$fp, $sp, 8(0x8)
9000000000200394:	02c04063 	addi.d      	$sp, $sp, 16(0x10)
9000000000200398:	4c000020 	jirl        	$zero, $ra, 0
    return -1;
900000000020039c:	02bffc04 	addi.w      	$a0, $zero, -1(0xfff)
90000000002003a0:	53fff3ff 	b           	-16(0xffffff0)	# 9000000000200390 <uartgetc+0x30>

90000000002003a4 <uartintr>:
// handle a uart interrupt, raised because input has
// arrived, or the uart is ready for more output, or
// both. called from trap.c.
void
uartintr(void)
{
90000000002003a4:	02ff8063 	addi.d      	$sp, $sp, -32(0xfe0)
90000000002003a8:	29c06061 	st.d        	$ra, $sp, 24(0x18)
90000000002003ac:	29c04076 	st.d        	$fp, $sp, 16(0x10)
90000000002003b0:	29c02077 	st.d        	$s0, $sp, 8(0x8)
90000000002003b4:	02c08076 	addi.d      	$fp, $sp, 32(0x20)
  // read and process incoming characters.
  while(1){
    int c = uartgetc();
    if(c == -1)
90000000002003b8:	02bffc17 	addi.w      	$s0, $zero, -1(0xfff)
90000000002003bc:	50000800 	b           	8(0x8)	# 90000000002003c4 <uartintr+0x20>
      break;
    consoleintr(c);
90000000002003c0:	540d0c00 	bl          	3340(0xd0c)	# 90000000002010cc <consoleintr>
    int c = uartgetc();
90000000002003c4:	57ff9fff 	bl          	-100(0xfffff9c)	# 9000000000200360 <uartgetc>
    if(c == -1)
90000000002003c8:	5ffff897 	bne         	$a0, $s0, -8(0x3fff8)	# 90000000002003c0 <uartintr+0x1c>
  }

  // send buffered characters.
  acquire(&uart_tx_lock);
90000000002003cc:	1c000064 	pcaddu12i   	$a0, 3(0x3)
90000000002003d0:	02f83084 	addi.d      	$a0, $a0, -500(0xe0c)
90000000002003d4:	54085c00 	bl          	2140(0x85c)	# 9000000000200c30 <acquire>
  uartstart();
90000000002003d8:	57fdd7ff 	bl          	-556(0xffffdd4)	# 90000000002001ac <uartstart>
  release(&uart_tx_lock);
90000000002003dc:	1c000064 	pcaddu12i   	$a0, 3(0x3)
90000000002003e0:	02f7f084 	addi.d      	$a0, $a0, -516(0xdfc)
90000000002003e4:	54092000 	bl          	2336(0x920)	# 9000000000200d04 <release>
}
90000000002003e8:	28c06061 	ld.d        	$ra, $sp, 24(0x18)
90000000002003ec:	28c04076 	ld.d        	$fp, $sp, 16(0x10)
90000000002003f0:	28c02077 	ld.d        	$s0, $sp, 8(0x8)
90000000002003f4:	02c08063 	addi.d      	$sp, $sp, 32(0x20)
90000000002003f8:	4c000020 	jirl        	$zero, $ra, 0

90000000002003fc <printint>:

static char digits[] = "0123456789abcdef";

static void
printint(int xx, int base, int sign)
{
90000000002003fc:	02ff4063 	addi.d      	$sp, $sp, -48(0xfd0)
9000000000200400:	29c0a061 	st.d        	$ra, $sp, 40(0x28)
9000000000200404:	29c08076 	st.d        	$fp, $sp, 32(0x20)
9000000000200408:	29c06077 	st.d        	$s0, $sp, 24(0x18)
900000000020040c:	29c04078 	st.d        	$s1, $sp, 16(0x10)
9000000000200410:	02c0c076 	addi.d      	$fp, $sp, 48(0x30)
  char buf[16];
  int i;
  uint x;

  if(sign && (sign = xx < 0))
9000000000200414:	400008c0 	beqz        	$a2, 8(0x8)	# 900000000020041c <printint+0x20>
9000000000200418:	6000b880 	bltz        	$a0, 184(0xb8)	# 90000000002004d0 <printint+0xd4>
    x = -xx;
  else
    x = xx;
900000000020041c:	00150012 	move        	$t6, $zero
9000000000200420:	02ff42ce 	addi.d      	$t2, $fp, -48(0xfd0)

  i = 0;
9000000000200424:	0015000d 	move        	$t1, $zero
  do {
    buf[i++] = digits[x % base];
9000000000200428:	1c000050 	pcaddu12i   	$t4, 2(0x2)
900000000020042c:	02f0e210 	addi.d      	$t4, $t4, -968(0xc38)
9000000000200430:	001501b1 	move        	$t5, $t1
9000000000200434:	028005ad 	addi.w      	$t1, $t1, 1(0x1)
9000000000200438:	0021948c 	mod.wu      	$t0, $a0, $a1
900000000020043c:	5c0008a0 	bne         	$a1, $zero, 8(0x8)	# 9000000000200444 <printint+0x48>
9000000000200440:	002a0007 	break       	0x7
9000000000200444:	00df018c 	bstrpick.d  	$t0, $t0, 0x1f, 0x0
9000000000200448:	0010b20c 	add.d       	$t0, $t4, $t0
900000000020044c:	2a00018c 	ld.bu       	$t0, $t0, 0
9000000000200450:	290001cc 	st.b        	$t0, $t2, 0
  } while((x /= base) != 0);
9000000000200454:	0015008c 	move        	$t0, $a0
9000000000200458:	0021148f 	div.wu      	$t3, $a0, $a1
900000000020045c:	5c0008a0 	bne         	$a1, $zero, 8(0x8)	# 9000000000200464 <printint+0x68>
9000000000200460:	002a0007 	break       	0x7
9000000000200464:	001501e4 	move        	$a0, $t3
9000000000200468:	02c005ce 	addi.d      	$t2, $t2, 1(0x1)
900000000020046c:	6fffc585 	bgeu        	$t0, $a1, -60(0x3ffc4)	# 9000000000200430 <printint+0x34>

  if(sign)
9000000000200470:	40001a40 	beqz        	$t6, 24(0x18)	# 9000000000200488 <printint+0x8c>
    buf[i++] = '-';
9000000000200474:	02ff81ac 	addi.d      	$t0, $t1, -32(0xfe0)
9000000000200478:	0010d98d 	add.d       	$t1, $t0, $fp
900000000020047c:	0280b40c 	addi.w      	$t0, $zero, 45(0x2d)
9000000000200480:	293fc1ac 	st.b        	$t0, $t1, -16(0xff0)
9000000000200484:	02800a2d 	addi.w      	$t1, $t5, 2(0x2)

  while(--i >= 0)
9000000000200488:	6400300d 	blez        	$t1, 48(0x30)	# 90000000002004b8 <printint+0xbc>
900000000020048c:	02ff42cc 	addi.d      	$t0, $fp, -48(0xfd0)
9000000000200490:	0010b597 	add.d       	$s0, $t0, $t1
9000000000200494:	02fffd98 	addi.d      	$s1, $t0, -1(0xfff)
9000000000200498:	0010b718 	add.d       	$s1, $s1, $t1
900000000020049c:	02bffdad 	addi.w      	$t1, $t1, -1(0xfff)
90000000002004a0:	00df01ad 	bstrpick.d  	$t1, $t1, 0x1f, 0x0
90000000002004a4:	0011b718 	sub.d       	$s1, $s1, $t1
    consputc(buf[i]);
90000000002004a8:	283ffee4 	ld.b        	$a0, $s0, -1(0xfff)
90000000002004ac:	540bd800 	bl          	3032(0xbd8)	# 9000000000201084 <consputc>
  while(--i >= 0)
90000000002004b0:	02fffef7 	addi.d      	$s0, $s0, -1(0xfff)
90000000002004b4:	5ffff6f8 	bne         	$s0, $s1, -12(0x3fff4)	# 90000000002004a8 <printint+0xac>
}
90000000002004b8:	28c0a061 	ld.d        	$ra, $sp, 40(0x28)
90000000002004bc:	28c08076 	ld.d        	$fp, $sp, 32(0x20)
90000000002004c0:	28c06077 	ld.d        	$s0, $sp, 24(0x18)
90000000002004c4:	28c04078 	ld.d        	$s1, $sp, 16(0x10)
90000000002004c8:	02c0c063 	addi.d      	$sp, $sp, 48(0x30)
90000000002004cc:	4c000020 	jirl        	$zero, $ra, 0
    x = -xx;
90000000002004d0:	00111004 	sub.w       	$a0, $zero, $a0
  if(sign && (sign = xx < 0))
90000000002004d4:	02800412 	addi.w      	$t6, $zero, 1(0x1)
    x = -xx;
90000000002004d8:	53ff4bff 	b           	-184(0xfffff48)	# 9000000000200420 <printint+0x24>

90000000002004dc <panic>:
    release(&pr.lock);
}

void
panic(char *s)
{
90000000002004dc:	02ff8063 	addi.d      	$sp, $sp, -32(0xfe0)
90000000002004e0:	29c06061 	st.d        	$ra, $sp, 24(0x18)
90000000002004e4:	29c04076 	st.d        	$fp, $sp, 16(0x10)
90000000002004e8:	29c02077 	st.d        	$s0, $sp, 8(0x8)
90000000002004ec:	02c08076 	addi.d      	$fp, $sp, 32(0x20)
90000000002004f0:	00150097 	move        	$s0, $a0
  pr.locking = 0;
90000000002004f4:	1c00006c 	pcaddu12i   	$t0, 3(0x3)
90000000002004f8:	02f4118c 	addi.d      	$t0, $t0, -764(0xd04)
90000000002004fc:	29806180 	st.w        	$zero, $t0, 24(0x18)
  printf("panic: ");
9000000000200500:	1c000044 	pcaddu12i   	$a0, 2(0x2)
9000000000200504:	02ece084 	addi.d      	$a0, $a0, -1224(0xb38)
9000000000200508:	54002c00 	bl          	44(0x2c)	# 9000000000200534 <printf>
  printf(s);
900000000020050c:	001502e4 	move        	$a0, $s0
9000000000200510:	54002400 	bl          	36(0x24)	# 9000000000200534 <printf>
  printf("\n");
9000000000200514:	1c000044 	pcaddu12i   	$a0, 2(0x2)
9000000000200518:	02ec5084 	addi.d      	$a0, $a0, -1260(0xb14)
900000000020051c:	54001800 	bl          	24(0x18)	# 9000000000200534 <printf>
  panicked = 1; // freeze uart output from other CPUs
9000000000200520:	1c00006c 	pcaddu12i   	$t0, 3(0x3)
9000000000200524:	02f3418c 	addi.d      	$t0, $t0, -816(0xcd0)
9000000000200528:	0280040d 	addi.w      	$t1, $zero, 1(0x1)
900000000020052c:	2500018d 	stptr.w     	$t1, $t0, 0
  for(;;)
9000000000200530:	50000000 	b           	0	# 9000000000200530 <panic+0x54>

9000000000200534 <printf>:
{
9000000000200534:	02fd4063 	addi.d      	$sp, $sp, -176(0xf50)
9000000000200538:	29c1a061 	st.d        	$ra, $sp, 104(0x68)
900000000020053c:	29c18076 	st.d        	$fp, $sp, 96(0x60)
9000000000200540:	29c16077 	st.d        	$s0, $sp, 88(0x58)
9000000000200544:	29c14078 	st.d        	$s1, $sp, 80(0x50)
9000000000200548:	29c12079 	st.d        	$s2, $sp, 72(0x48)
900000000020054c:	29c1007a 	st.d        	$s3, $sp, 64(0x40)
9000000000200550:	29c0e07b 	st.d        	$s4, $sp, 56(0x38)
9000000000200554:	29c0c07c 	st.d        	$s5, $sp, 48(0x30)
9000000000200558:	29c0a07d 	st.d        	$s6, $sp, 40(0x28)
900000000020055c:	29c0807e 	st.d        	$s7, $sp, 32(0x20)
9000000000200560:	29c0607f 	st.d        	$s8, $sp, 24(0x18)
9000000000200564:	02c1c076 	addi.d      	$fp, $sp, 112(0x70)
9000000000200568:	0015009a 	move        	$s3, $a0
900000000020056c:	29c022c5 	st.d        	$a1, $fp, 8(0x8)
9000000000200570:	29c042c6 	st.d        	$a2, $fp, 16(0x10)
9000000000200574:	29c062c7 	st.d        	$a3, $fp, 24(0x18)
9000000000200578:	29c082c8 	st.d        	$a4, $fp, 32(0x20)
900000000020057c:	29c0a2c9 	st.d        	$a5, $fp, 40(0x28)
9000000000200580:	29c0c2ca 	st.d        	$a6, $fp, 48(0x30)
9000000000200584:	29c0e2cb 	st.d        	$a7, $fp, 56(0x38)
  locking = pr.locking;
9000000000200588:	1c00006c 	pcaddu12i   	$t0, 3(0x3)
900000000020058c:	02f1c18c 	addi.d      	$t0, $t0, -912(0xc70)
9000000000200590:	2400199f 	ldptr.w     	$s8, $t0, 24(0x18)
  if(locking)
9000000000200594:	440037e0 	bnez        	$s8, 52(0x34)	# 90000000002005c8 <printf+0x94>
  if (fmt == 0)
9000000000200598:	40003f40 	beqz        	$s3, 60(0x3c)	# 90000000002005d4 <printf+0xa0>
  va_start(ap, fmt);
900000000020059c:	02c022cc 	addi.d      	$t0, $fp, 8(0x8)
90000000002005a0:	29fe62cc 	st.d        	$t0, $fp, -104(0xf98)
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
90000000002005a4:	2a000344 	ld.bu       	$a0, $s3, 0
90000000002005a8:	40016880 	beqz        	$a0, 360(0x168)	# 9000000000200710 <printf+0x1dc>
90000000002005ac:	00150019 	move        	$s2, $zero
    if(c != '%'){
90000000002005b0:	0280941b 	addi.w      	$s4, $zero, 37(0x25)
    switch(c){
90000000002005b4:	0281c01d 	addi.w      	$s6, $zero, 112(0x70)
    consputc(digits[x >> (sizeof(uint64) * 8 - 4)]);
90000000002005b8:	1c00005c 	pcaddu12i   	$s5, 2(0x2)
90000000002005bc:	02eaa39c 	addi.d      	$s5, $s5, -1368(0xaa8)
    switch(c){
90000000002005c0:	0281cc1e 	addi.w      	$s7, $zero, 115(0x73)
90000000002005c4:	50003400 	b           	52(0x34)	# 90000000002005f8 <printf+0xc4>
    acquire(&pr.lock);
90000000002005c8:	00150184 	move        	$a0, $t0
90000000002005cc:	54066400 	bl          	1636(0x664)	# 9000000000200c30 <acquire>
90000000002005d0:	53ffcbff 	b           	-56(0xfffffc8)	# 9000000000200598 <printf+0x64>
    panic("null fmt");
90000000002005d4:	1c000044 	pcaddu12i   	$a0, 2(0x2)
90000000002005d8:	02e9d084 	addi.d      	$a0, $a0, -1420(0xa74)
90000000002005dc:	57ff03ff 	bl          	-256(0xfffff00)	# 90000000002004dc <panic>
      consputc(c);
90000000002005e0:	540aa400 	bl          	2724(0xaa4)	# 9000000000201084 <consputc>
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
90000000002005e4:	02800739 	addi.w      	$s2, $s2, 1(0x1)
90000000002005e8:	3800674c 	ldx.b       	$t0, $s3, $s2
90000000002005ec:	0343fd8c 	andi        	$t0, $t0, 0xff
90000000002005f0:	00150184 	move        	$a0, $t0
90000000002005f4:	40011d80 	beqz        	$t0, 284(0x11c)	# 9000000000200710 <printf+0x1dc>
    if(c != '%'){
90000000002005f8:	5fffe89b 	bne         	$a0, $s4, -24(0x3ffe8)	# 90000000002005e0 <printf+0xac>
    c = fmt[++i] & 0xff;
90000000002005fc:	02800739 	addi.w      	$s2, $s2, 1(0x1)
9000000000200600:	3800674c 	ldx.b       	$t0, $s3, $s2
9000000000200604:	0343fd8c 	andi        	$t0, $t0, 0xff
9000000000200608:	00150197 	move        	$s0, $t0
    if(c == 0)
900000000020060c:	40010580 	beqz        	$t0, 260(0x104)	# 9000000000200710 <printf+0x1dc>
    switch(c){
9000000000200610:	580062fd 	beq         	$s0, $s6, 96(0x60)	# 9000000000200670 <printf+0x13c>
9000000000200614:	640033b7 	bge         	$s6, $s0, 48(0x30)	# 9000000000200644 <printf+0x110>
9000000000200618:	58009afe 	beq         	$s0, $s7, 152(0x98)	# 90000000002006b0 <printf+0x17c>
900000000020061c:	0281e00c 	addi.w      	$t0, $zero, 120(0x78)
9000000000200620:	5c00deec 	bne         	$s0, $t0, 220(0xdc)	# 90000000002006fc <printf+0x1c8>
      printint(va_arg(ap, int), 16, 1);
9000000000200624:	28fe62cc 	ld.d        	$t0, $fp, -104(0xf98)
9000000000200628:	02c0218d 	addi.d      	$t1, $t0, 8(0x8)
900000000020062c:	29fe62cd 	st.d        	$t1, $fp, -104(0xf98)
9000000000200630:	02800406 	addi.w      	$a2, $zero, 1(0x1)
9000000000200634:	02804005 	addi.w      	$a1, $zero, 16(0x10)
9000000000200638:	24000184 	ldptr.w     	$a0, $t0, 0
900000000020063c:	57fdc3ff 	bl          	-576(0xffffdc0)	# 90000000002003fc <printint>
      break;
9000000000200640:	53ffa7ff 	b           	-92(0xfffffa4)	# 90000000002005e4 <printf+0xb0>
    switch(c){
9000000000200644:	5800aefb 	beq         	$s0, $s4, 172(0xac)	# 90000000002006f0 <printf+0x1bc>
9000000000200648:	0281900c 	addi.w      	$t0, $zero, 100(0x64)
900000000020064c:	5c00b2ec 	bne         	$s0, $t0, 176(0xb0)	# 90000000002006fc <printf+0x1c8>
      printint(va_arg(ap, int), 10, 1);
9000000000200650:	28fe62cc 	ld.d        	$t0, $fp, -104(0xf98)
9000000000200654:	02c0218d 	addi.d      	$t1, $t0, 8(0x8)
9000000000200658:	29fe62cd 	st.d        	$t1, $fp, -104(0xf98)
900000000020065c:	02800406 	addi.w      	$a2, $zero, 1(0x1)
9000000000200660:	02802805 	addi.w      	$a1, $zero, 10(0xa)
9000000000200664:	24000184 	ldptr.w     	$a0, $t0, 0
9000000000200668:	57fd97ff 	bl          	-620(0xffffd94)	# 90000000002003fc <printint>
      break;
900000000020066c:	53ff7bff 	b           	-136(0xfffff78)	# 90000000002005e4 <printf+0xb0>
      printptr(va_arg(ap, uint64));
9000000000200670:	28fe62cc 	ld.d        	$t0, $fp, -104(0xf98)
9000000000200674:	02c0218d 	addi.d      	$t1, $t0, 8(0x8)
9000000000200678:	29fe62cd 	st.d        	$t1, $fp, -104(0xf98)
900000000020067c:	26000198 	ldptr.d     	$s1, $t0, 0
  consputc('0');
9000000000200680:	0280c004 	addi.w      	$a0, $zero, 48(0x30)
9000000000200684:	540a0000 	bl          	2560(0xa00)	# 9000000000201084 <consputc>
  consputc('x');
9000000000200688:	0281e004 	addi.w      	$a0, $zero, 120(0x78)
900000000020068c:	5409f800 	bl          	2552(0x9f8)	# 9000000000201084 <consputc>
9000000000200690:	02804017 	addi.w      	$s0, $zero, 16(0x10)
    consputc(digits[x >> (sizeof(uint64) * 8 - 4)]);
9000000000200694:	0045f304 	srli.d      	$a0, $s1, 0x3c
9000000000200698:	38001384 	ldx.b       	$a0, $s5, $a0
900000000020069c:	5409e800 	bl          	2536(0x9e8)	# 9000000000201084 <consputc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
90000000002006a0:	00411318 	slli.d      	$s1, $s1, 0x4
90000000002006a4:	02bffef7 	addi.w      	$s0, $s0, -1(0xfff)
90000000002006a8:	47ffeeff 	bnez        	$s0, -20(0x7fffec)	# 9000000000200694 <printf+0x160>
90000000002006ac:	53ff3bff 	b           	-200(0xfffff38)	# 90000000002005e4 <printf+0xb0>
      if((s = va_arg(ap, char*)) == 0)
90000000002006b0:	28fe62cc 	ld.d        	$t0, $fp, -104(0xf98)
90000000002006b4:	02c0218d 	addi.d      	$t1, $t0, 8(0x8)
90000000002006b8:	29fe62cd 	st.d        	$t1, $fp, -104(0xf98)
90000000002006bc:	26000197 	ldptr.d     	$s0, $t0, 0
90000000002006c0:	400022e0 	beqz        	$s0, 32(0x20)	# 90000000002006e0 <printf+0x1ac>
      for(; *s; s++)
90000000002006c4:	280002e4 	ld.b        	$a0, $s0, 0
90000000002006c8:	43ff1c9f 	beqz        	$a0, -228(0x7fff1c)	# 90000000002005e4 <printf+0xb0>
        consputc(*s);
90000000002006cc:	5409b800 	bl          	2488(0x9b8)	# 9000000000201084 <consputc>
      for(; *s; s++)
90000000002006d0:	02c006f7 	addi.d      	$s0, $s0, 1(0x1)
90000000002006d4:	280002e4 	ld.b        	$a0, $s0, 0
90000000002006d8:	47fff49f 	bnez        	$a0, -12(0x7ffff4)	# 90000000002006cc <printf+0x198>
90000000002006dc:	53ff0bff 	b           	-248(0xfffff08)	# 90000000002005e4 <printf+0xb0>
        s = "(null)";
90000000002006e0:	1c000057 	pcaddu12i   	$s0, 2(0x2)
90000000002006e4:	02e582f7 	addi.d      	$s0, $s0, -1696(0x960)
      for(; *s; s++)
90000000002006e8:	0280a004 	addi.w      	$a0, $zero, 40(0x28)
90000000002006ec:	53ffe3ff 	b           	-32(0xfffffe0)	# 90000000002006cc <printf+0x198>
      consputc('%');
90000000002006f0:	00150364 	move        	$a0, $s4
90000000002006f4:	54099000 	bl          	2448(0x990)	# 9000000000201084 <consputc>
      break;
90000000002006f8:	53feefff 	b           	-276(0xffffeec)	# 90000000002005e4 <printf+0xb0>
      consputc('%');
90000000002006fc:	00150364 	move        	$a0, $s4
9000000000200700:	54098400 	bl          	2436(0x984)	# 9000000000201084 <consputc>
      consputc(c);
9000000000200704:	001502e4 	move        	$a0, $s0
9000000000200708:	54097c00 	bl          	2428(0x97c)	# 9000000000201084 <consputc>
      break;
900000000020070c:	53fedbff 	b           	-296(0xffffed8)	# 90000000002005e4 <printf+0xb0>
  if(locking)
9000000000200710:	44003be0 	bnez        	$s8, 56(0x38)	# 9000000000200748 <printf+0x214>
}
9000000000200714:	28c1a061 	ld.d        	$ra, $sp, 104(0x68)
9000000000200718:	28c18076 	ld.d        	$fp, $sp, 96(0x60)
900000000020071c:	28c16077 	ld.d        	$s0, $sp, 88(0x58)
9000000000200720:	28c14078 	ld.d        	$s1, $sp, 80(0x50)
9000000000200724:	28c12079 	ld.d        	$s2, $sp, 72(0x48)
9000000000200728:	28c1007a 	ld.d        	$s3, $sp, 64(0x40)
900000000020072c:	28c0e07b 	ld.d        	$s4, $sp, 56(0x38)
9000000000200730:	28c0c07c 	ld.d        	$s5, $sp, 48(0x30)
9000000000200734:	28c0a07d 	ld.d        	$s6, $sp, 40(0x28)
9000000000200738:	28c0807e 	ld.d        	$s7, $sp, 32(0x20)
900000000020073c:	28c0607f 	ld.d        	$s8, $sp, 24(0x18)
9000000000200740:	02c2c063 	addi.d      	$sp, $sp, 176(0xb0)
9000000000200744:	4c000020 	jirl        	$zero, $ra, 0
    release(&pr.lock);
9000000000200748:	1c000064 	pcaddu12i   	$a0, 3(0x3)
900000000020074c:	02eac084 	addi.d      	$a0, $a0, -1360(0xab0)
9000000000200750:	5405b400 	bl          	1460(0x5b4)	# 9000000000200d04 <release>
}
9000000000200754:	53ffc3ff 	b           	-64(0xfffffc0)	# 9000000000200714 <printf+0x1e0>

9000000000200758 <printfinit>:
    ;
}

void
printfinit(void)
{
9000000000200758:	02ffc063 	addi.d      	$sp, $sp, -16(0xff0)
900000000020075c:	29c02061 	st.d        	$ra, $sp, 8(0x8)
9000000000200760:	27000076 	stptr.d     	$fp, $sp, 0
9000000000200764:	02c04076 	addi.d      	$fp, $sp, 16(0x10)
  initlock(&pr.lock, "pr");
9000000000200768:	1c000045 	pcaddu12i   	$a1, 2(0x2)
900000000020076c:	02e3c0a5 	addi.d      	$a1, $a1, -1808(0x8f0)
9000000000200770:	1c000064 	pcaddu12i   	$a0, 3(0x3)
9000000000200774:	02ea2084 	addi.d      	$a0, $a0, -1400(0xa88)
9000000000200778:	5403e400 	bl          	996(0x3e4)	# 9000000000200b5c <initlock>
  pr.locking = 1;
900000000020077c:	1c00006c 	pcaddu12i   	$t0, 3(0x3)
9000000000200780:	02e9f18c 	addi.d      	$t0, $t0, -1412(0xa7c)
9000000000200784:	0280040d 	addi.w      	$t1, $zero, 1(0x1)
9000000000200788:	2980618d 	st.w        	$t1, $t0, 24(0x18)
900000000020078c:	28c02061 	ld.d        	$ra, $sp, 8(0x8)
9000000000200790:	26000076 	ldptr.d     	$fp, $sp, 0
9000000000200794:	02c04063 	addi.d      	$sp, $sp, 16(0x10)
9000000000200798:	4c000020 	jirl        	$zero, $ra, 0

900000000020079c <cpuid>:
// Must be called with interrupts disabled,
// to prevent race with process being moved
// to a different CPU.
int
cpuid()
{
900000000020079c:	02ffc063 	addi.d      	$sp, $sp, -16(0xff0)
90000000002007a0:	29c02076 	st.d        	$fp, $sp, 8(0x8)
90000000002007a4:	02c04076 	addi.d      	$fp, $sp, 16(0x10)
// this core's hartid (core number), the index into cpus[].
static inline uint64
r_tp()
{
  uint64 x;
  asm volatile("addi.d %0, $tp, 0" : "=r" (x) );
90000000002007a8:	02c00044 	addi.d      	$a0, $tp, 0
  int id = r_tp();
90000000002007ac:	00408084 	slli.w      	$a0, $a0, 0x0
  return id;
}
90000000002007b0:	28c02076 	ld.d        	$fp, $sp, 8(0x8)
90000000002007b4:	02c04063 	addi.d      	$sp, $sp, 16(0x10)
90000000002007b8:	4c000020 	jirl        	$zero, $ra, 0

90000000002007bc <mycpu>:

// Return this CPU's cpu struct.
// Interrupts must be disabled.
struct cpu*
mycpu(void) {
90000000002007bc:	02ffc063 	addi.d      	$sp, $sp, -16(0xff0)
90000000002007c0:	29c02076 	st.d        	$fp, $sp, 8(0x8)
90000000002007c4:	02c04076 	addi.d      	$fp, $sp, 16(0x10)
90000000002007c8:	02c0004c 	addi.d      	$t0, $tp, 0
  int id = r_tp();
90000000002007cc:	0040818c 	slli.w      	$t0, $t0, 0x0
  int id = cpuid();
  struct cpu *c = &cpus[id];
90000000002007d0:	00410d84 	slli.d      	$a0, $t0, 0x3
90000000002007d4:	0011b08c 	sub.d       	$t0, $a0, $t0
  return c;
}
90000000002007d8:	1c000104 	pcaddu12i   	$a0, 8(0x8)
90000000002007dc:	02c10084 	addi.d      	$a0, $a0, 64(0x40)
90000000002007e0:	002d9184 	alsl.d      	$a0, $t0, $a0, 0x4
90000000002007e4:	28c02076 	ld.d        	$fp, $sp, 8(0x8)
90000000002007e8:	02c04063 	addi.d      	$sp, $sp, 16(0x10)
90000000002007ec:	4c000020 	jirl        	$zero, $ra, 0

90000000002007f0 <myproc>:

// Return the current struct proc *, or zero if none.
struct proc*
myproc(void) {
90000000002007f0:	02ff8063 	addi.d      	$sp, $sp, -32(0xfe0)
90000000002007f4:	29c06061 	st.d        	$ra, $sp, 24(0x18)
90000000002007f8:	29c04076 	st.d        	$fp, $sp, 16(0x10)
90000000002007fc:	29c02077 	st.d        	$s0, $sp, 8(0x8)
9000000000200800:	02c08076 	addi.d      	$fp, $sp, 32(0x20)
  push_off();
9000000000200804:	5403c400 	bl          	964(0x3c4)	# 9000000000200bc8 <push_off>
9000000000200808:	02c0004c 	addi.d      	$t0, $tp, 0
  int id = r_tp();
900000000020080c:	0040818c 	slli.w      	$t0, $t0, 0x0
  struct cpu *c = mycpu();
  struct proc *p = c->proc;
9000000000200810:	00410d8d 	slli.d      	$t1, $t0, 0x3
9000000000200814:	0011b1ac 	sub.d       	$t0, $t1, $t0
9000000000200818:	1c00010d 	pcaddu12i   	$t1, 8(0x8)
900000000020081c:	02c001ad 	addi.d      	$t1, $t1, 0
9000000000200820:	002db58c 	alsl.d      	$t0, $t0, $t1, 0x4
9000000000200824:	26000197 	ldptr.d     	$s0, $t0, 0
  pop_off();
9000000000200828:	54046800 	bl          	1128(0x468)	# 9000000000200c90 <pop_off>
  return p;
}
900000000020082c:	001502e4 	move        	$a0, $s0
9000000000200830:	28c06061 	ld.d        	$ra, $sp, 24(0x18)
9000000000200834:	28c04076 	ld.d        	$fp, $sp, 16(0x10)
9000000000200838:	28c02077 	ld.d        	$s0, $sp, 8(0x8)
900000000020083c:	02c08063 	addi.d      	$sp, $sp, 32(0x20)
9000000000200840:	4c000020 	jirl        	$zero, $ra, 0

9000000000200844 <sched>:
// be proc->intena and proc->noff, but that would
// break in the few places where a lock is held but
// there's no process.
void
sched(void)
{
9000000000200844:	02ff4063 	addi.d      	$sp, $sp, -48(0xfd0)
9000000000200848:	29c0a061 	st.d        	$ra, $sp, 40(0x28)
900000000020084c:	29c08076 	st.d        	$fp, $sp, 32(0x20)
9000000000200850:	29c06077 	st.d        	$s0, $sp, 24(0x18)
9000000000200854:	29c04078 	st.d        	$s1, $sp, 16(0x10)
9000000000200858:	29c02079 	st.d        	$s2, $sp, 8(0x8)
900000000020085c:	02c0c076 	addi.d      	$fp, $sp, 48(0x30)
  int intena;
  struct proc *p = myproc();
9000000000200860:	57ff93ff 	bl          	-112(0xfffff90)	# 90000000002007f0 <myproc>
9000000000200864:	00150097 	move        	$s0, $a0

  if(!holding(&p->lock))
9000000000200868:	54031800 	bl          	792(0x318)	# 9000000000200b80 <holding>
900000000020086c:	4000b880 	beqz        	$a0, 184(0xb8)	# 9000000000200924 <sched+0xe0>
9000000000200870:	02c0004c 	addi.d      	$t0, $tp, 0
  int id = r_tp();
9000000000200874:	0040818c 	slli.w      	$t0, $t0, 0x0
    panic("sched p->lock");
  if(mycpu()->noff != 1)
9000000000200878:	00410d8d 	slli.d      	$t1, $t0, 0x3
900000000020087c:	0011b1ac 	sub.d       	$t0, $t1, $t0
9000000000200880:	1c00010d 	pcaddu12i   	$t1, 8(0x8)
9000000000200884:	02fe61ad 	addi.d      	$t1, $t1, -104(0xf98)
9000000000200888:	002db58c 	alsl.d      	$t0, $t0, $t1, 0x4
900000000020088c:	2400698d 	ldptr.w     	$t1, $t0, 104(0x68)
9000000000200890:	0280040c 	addi.w      	$t0, $zero, 1(0x1)
9000000000200894:	5c009dac 	bne         	$t1, $t0, 156(0x9c)	# 9000000000200930 <sched+0xec>
    panic("sched locks");
  if(p->state == RUNNING)
9000000000200898:	24001aed 	ldptr.w     	$t1, $s0, 24(0x18)
900000000020089c:	0280100c 	addi.w      	$t0, $zero, 4(0x4)
90000000002008a0:	58009dac 	beq         	$t1, $t0, 156(0x9c)	# 900000000020093c <sched+0xf8>

static inline uint32
r_csr_crmd()
{
  uint32 x;
  asm volatile("csrrd %0, 0x0" : "=r" (x) );
90000000002008a4:	0400000c 	csrrd       	$t0, 0x0

static inline int
intr_get()
{
  uint32 x = r_csr_crmd();
  return (x & CSR_CRMD_IE) != 0;
90000000002008a8:	0340118c 	andi        	$t0, $t0, 0x4
    panic("sched running");
  if(intr_get())
90000000002008ac:	44009d80 	bnez        	$t0, 156(0x9c)	# 9000000000200948 <sched+0x104>
  asm volatile("addi.d %0, $tp, 0" : "=r" (x) );
90000000002008b0:	02c0004c 	addi.d      	$t0, $tp, 0
    panic("sched interruptible");

  intena = mycpu()->intena;
90000000002008b4:	1c000118 	pcaddu12i   	$s1, 8(0x8)
90000000002008b8:	02fd9318 	addi.d      	$s1, $s1, -156(0xf64)
  int id = r_tp();
90000000002008bc:	0040818c 	slli.w      	$t0, $t0, 0x0
  intena = mycpu()->intena;
90000000002008c0:	00410d8d 	slli.d      	$t1, $t0, 0x3
90000000002008c4:	0011b1ac 	sub.d       	$t0, $t1, $t0
90000000002008c8:	002de18c 	alsl.d      	$t0, $t0, $s1, 0x4
90000000002008cc:	24006d99 	ldptr.w     	$s2, $t0, 108(0x6c)
90000000002008d0:	02c0004c 	addi.d      	$t0, $tp, 0
  int id = r_tp();
90000000002008d4:	0040818c 	slli.w      	$t0, $t0, 0x0
  swtch(&p->context, &mycpu()->context);
90000000002008d8:	00410d85 	slli.d      	$a1, $t0, 0x3
90000000002008dc:	0011b0a5 	sub.d       	$a1, $a1, $t0
90000000002008e0:	002de0a5 	alsl.d      	$a1, $a1, $s1, 0x4
90000000002008e4:	02c020a5 	addi.d      	$a1, $a1, 8(0x8)
90000000002008e8:	02c182e4 	addi.d      	$a0, $s0, 96(0x60)
90000000002008ec:	5406fc00 	bl          	1788(0x6fc)	# 9000000000200fe8 <swtch>
90000000002008f0:	02c0004c 	addi.d      	$t0, $tp, 0
  int id = r_tp();
90000000002008f4:	0040818c 	slli.w      	$t0, $t0, 0x0
  mycpu()->intena = intena;
90000000002008f8:	00410d8d 	slli.d      	$t1, $t0, 0x3
90000000002008fc:	0011b1ac 	sub.d       	$t0, $t1, $t0
9000000000200900:	002de18c 	alsl.d      	$t0, $t0, $s1, 0x4
9000000000200904:	2981b199 	st.w        	$s2, $t0, 108(0x6c)
}
9000000000200908:	28c0a061 	ld.d        	$ra, $sp, 40(0x28)
900000000020090c:	28c08076 	ld.d        	$fp, $sp, 32(0x20)
9000000000200910:	28c06077 	ld.d        	$s0, $sp, 24(0x18)
9000000000200914:	28c04078 	ld.d        	$s1, $sp, 16(0x10)
9000000000200918:	28c02079 	ld.d        	$s2, $sp, 8(0x8)
900000000020091c:	02c0c063 	addi.d      	$sp, $sp, 48(0x30)
9000000000200920:	4c000020 	jirl        	$zero, $ra, 0
    panic("sched p->lock");
9000000000200924:	1c000024 	pcaddu12i   	$a0, 1(0x1)
9000000000200928:	02dd5084 	addi.d      	$a0, $a0, 1876(0x754)
900000000020092c:	57fbb3ff 	bl          	-1104(0xffffbb0)	# 90000000002004dc <panic>
    panic("sched locks");
9000000000200930:	1c000024 	pcaddu12i   	$a0, 1(0x1)
9000000000200934:	02dd6084 	addi.d      	$a0, $a0, 1880(0x758)
9000000000200938:	57fba7ff 	bl          	-1116(0xffffba4)	# 90000000002004dc <panic>
    panic("sched running");
900000000020093c:	1c000024 	pcaddu12i   	$a0, 1(0x1)
9000000000200940:	02dd7084 	addi.d      	$a0, $a0, 1884(0x75c)
9000000000200944:	57fb9bff 	bl          	-1128(0xffffb98)	# 90000000002004dc <panic>
    panic("sched interruptible");
9000000000200948:	1c000024 	pcaddu12i   	$a0, 1(0x1)
900000000020094c:	02dd8084 	addi.d      	$a0, $a0, 1888(0x760)
9000000000200950:	57fb8fff 	bl          	-1140(0xffffb8c)	# 90000000002004dc <panic>

9000000000200954 <sleep>:

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
9000000000200954:	02ff4063 	addi.d      	$sp, $sp, -48(0xfd0)
9000000000200958:	29c0a061 	st.d        	$ra, $sp, 40(0x28)
900000000020095c:	29c08076 	st.d        	$fp, $sp, 32(0x20)
9000000000200960:	29c06077 	st.d        	$s0, $sp, 24(0x18)
9000000000200964:	29c04078 	st.d        	$s1, $sp, 16(0x10)
9000000000200968:	29c02079 	st.d        	$s2, $sp, 8(0x8)
900000000020096c:	02c0c076 	addi.d      	$fp, $sp, 48(0x30)
9000000000200970:	00150099 	move        	$s2, $a0
9000000000200974:	001500b8 	move        	$s1, $a1
  struct proc *p = myproc();
9000000000200978:	57fe7bff 	bl          	-392(0xffffe78)	# 90000000002007f0 <myproc>
900000000020097c:	00150097 	move        	$s0, $a0
  // Once we hold p->lock, we can be
  // guaranteed that we won't miss any wakeup
  // (wakeup locks p->lock),
  // so it's okay to release lk.

  acquire(&p->lock);  //DOC: sleeplock1
9000000000200980:	5402b000 	bl          	688(0x2b0)	# 9000000000200c30 <acquire>
  release(lk);
9000000000200984:	00150304 	move        	$a0, $s1
9000000000200988:	54037c00 	bl          	892(0x37c)	# 9000000000200d04 <release>

  // Go to sleep.
  p->chan = chan;
900000000020098c:	29c082f9 	st.d        	$s2, $s0, 32(0x20)
  p->state = SLEEPING;
9000000000200990:	0280080c 	addi.w      	$t0, $zero, 2(0x2)
9000000000200994:	298062ec 	st.w        	$t0, $s0, 24(0x18)

  sched();
9000000000200998:	57feafff 	bl          	-340(0xffffeac)	# 9000000000200844 <sched>

  // Tidy up.
  p->chan = 0;
900000000020099c:	29c082e0 	st.d        	$zero, $s0, 32(0x20)

  // Reacquire original lock.
  release(&p->lock);
90000000002009a0:	001502e4 	move        	$a0, $s0
90000000002009a4:	54036000 	bl          	864(0x360)	# 9000000000200d04 <release>
  acquire(lk);
90000000002009a8:	00150304 	move        	$a0, $s1
90000000002009ac:	54028400 	bl          	644(0x284)	# 9000000000200c30 <acquire>
}
90000000002009b0:	28c0a061 	ld.d        	$ra, $sp, 40(0x28)
90000000002009b4:	28c08076 	ld.d        	$fp, $sp, 32(0x20)
90000000002009b8:	28c06077 	ld.d        	$s0, $sp, 24(0x18)
90000000002009bc:	28c04078 	ld.d        	$s1, $sp, 16(0x10)
90000000002009c0:	28c02079 	ld.d        	$s2, $sp, 8(0x8)
90000000002009c4:	02c0c063 	addi.d      	$sp, $sp, 48(0x30)
90000000002009c8:	4c000020 	jirl        	$zero, $ra, 0

90000000002009cc <wakeup>:

// Wake up all processes sleeping on chan.
// Must be called without any p->lock.
void
wakeup(void *chan)
{
90000000002009cc:	02ff0063 	addi.d      	$sp, $sp, -64(0xfc0)
90000000002009d0:	29c0e061 	st.d        	$ra, $sp, 56(0x38)
90000000002009d4:	29c0c076 	st.d        	$fp, $sp, 48(0x30)
90000000002009d8:	29c0a077 	st.d        	$s0, $sp, 40(0x28)
90000000002009dc:	29c08078 	st.d        	$s1, $sp, 32(0x20)
90000000002009e0:	29c06079 	st.d        	$s2, $sp, 24(0x18)
90000000002009e4:	29c0407a 	st.d        	$s3, $sp, 16(0x10)
90000000002009e8:	29c0207b 	st.d        	$s4, $sp, 8(0x8)
90000000002009ec:	02c10076 	addi.d      	$fp, $sp, 64(0x40)
90000000002009f0:	0015009a 	move        	$s3, $a0
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++) {
90000000002009f4:	1c000077 	pcaddu12i   	$s0, 3(0x3)
90000000002009f8:	02e092f7 	addi.d      	$s0, $s0, -2012(0x824)
    if(p != myproc()){
      acquire(&p->lock);
      if(p->state == SLEEPING && p->chan == chan) {
90000000002009fc:	02800819 	addi.w      	$s2, $zero, 2(0x2)
        p->state = RUNNABLE;
9000000000200a00:	02800c1b 	addi.w      	$s4, $zero, 3(0x3)
  for(p = proc; p < &proc[NPROC]; p++) {
9000000000200a04:	1c000038 	pcaddu12i   	$s1, 1(0x1)
9000000000200a08:	02dcb318 	addi.d      	$s1, $s1, 1836(0x72c)
9000000000200a0c:	50001800 	b           	24(0x18)	# 9000000000200a24 <wakeup+0x58>
      }
      release(&p->lock);
9000000000200a10:	001502e4 	move        	$a0, $s0
9000000000200a14:	5402f000 	bl          	752(0x2f0)	# 9000000000200d04 <release>
  for(p = proc; p < &proc[NPROC]; p++) {
9000000000200a18:	02c562f7 	addi.d      	$s0, $s0, 344(0x158)
9000000000200a1c:	2600030c 	ldptr.d     	$t0, $s1, 0
9000000000200a20:	58002eec 	beq         	$s0, $t0, 44(0x2c)	# 9000000000200a4c <wakeup+0x80>
    if(p != myproc()){
9000000000200a24:	57fdcfff 	bl          	-564(0xffffdcc)	# 90000000002007f0 <myproc>
9000000000200a28:	5bfff2e4 	beq         	$s0, $a0, -16(0x3fff0)	# 9000000000200a18 <wakeup+0x4c>
      acquire(&p->lock);
9000000000200a2c:	001502e4 	move        	$a0, $s0
9000000000200a30:	54020000 	bl          	512(0x200)	# 9000000000200c30 <acquire>
      if(p->state == SLEEPING && p->chan == chan) {
9000000000200a34:	24001aec 	ldptr.w     	$t0, $s0, 24(0x18)
9000000000200a38:	5fffd999 	bne         	$t0, $s2, -40(0x3ffd8)	# 9000000000200a10 <wakeup+0x44>
9000000000200a3c:	28c082ec 	ld.d        	$t0, $s0, 32(0x20)
9000000000200a40:	5fffd19a 	bne         	$t0, $s3, -48(0x3ffd0)	# 9000000000200a10 <wakeup+0x44>
        p->state = RUNNABLE;
9000000000200a44:	298062fb 	st.w        	$s4, $s0, 24(0x18)
9000000000200a48:	53ffcbff 	b           	-56(0xfffffc8)	# 9000000000200a10 <wakeup+0x44>
    }
  }
}
9000000000200a4c:	28c0e061 	ld.d        	$ra, $sp, 56(0x38)
9000000000200a50:	28c0c076 	ld.d        	$fp, $sp, 48(0x30)
9000000000200a54:	28c0a077 	ld.d        	$s0, $sp, 40(0x28)
9000000000200a58:	28c08078 	ld.d        	$s1, $sp, 32(0x20)
9000000000200a5c:	28c06079 	ld.d        	$s2, $sp, 24(0x18)
9000000000200a60:	28c0407a 	ld.d        	$s3, $sp, 16(0x10)
9000000000200a64:	28c0207b 	ld.d        	$s4, $sp, 8(0x8)
9000000000200a68:	02c10063 	addi.d      	$sp, $sp, 64(0x40)
9000000000200a6c:	4c000020 	jirl        	$zero, $ra, 0

9000000000200a70 <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
9000000000200a70:	02fec063 	addi.d      	$sp, $sp, -80(0xfb0)
9000000000200a74:	29c12061 	st.d        	$ra, $sp, 72(0x48)
9000000000200a78:	29c10076 	st.d        	$fp, $sp, 64(0x40)
9000000000200a7c:	29c0e077 	st.d        	$s0, $sp, 56(0x38)
9000000000200a80:	29c0c078 	st.d        	$s1, $sp, 48(0x30)
9000000000200a84:	29c0a079 	st.d        	$s2, $sp, 40(0x28)
9000000000200a88:	29c0807a 	st.d        	$s3, $sp, 32(0x20)
9000000000200a8c:	29c0607b 	st.d        	$s4, $sp, 24(0x18)
9000000000200a90:	29c0407c 	st.d        	$s5, $sp, 16(0x10)
9000000000200a94:	29c0207d 	st.d        	$s6, $sp, 8(0x8)
9000000000200a98:	02c14076 	addi.d      	$fp, $sp, 80(0x50)
  [ZOMBIE]    "zombie"
  };
  struct proc *p;
  char *state;

  printf("\n");
9000000000200a9c:	1c000024 	pcaddu12i   	$a0, 1(0x1)
9000000000200aa0:	02d63084 	addi.d      	$a0, $a0, 1420(0x58c)
9000000000200aa4:	57fa93ff 	bl          	-1392(0xffffa90)	# 9000000000200534 <printf>
  for(p = proc; p < &proc[NPROC]; p++){
9000000000200aa8:	1c000058 	pcaddu12i   	$s1, 2(0x2)
9000000000200aac:	02ddc318 	addi.d      	$s1, $s1, 1904(0x770)
9000000000200ab0:	02c52317 	addi.d      	$s0, $s1, 328(0x148)
9000000000200ab4:	140000ac 	lu12i.w     	$t0, 5(0x5)
9000000000200ab8:	039d218c 	ori         	$t0, $t0, 0x748
9000000000200abc:	0010b318 	add.d       	$s1, $s1, $t0
    if(p->state == UNUSED)
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
9000000000200ac0:	0280141c 	addi.w      	$s5, $zero, 5(0x5)
      state = states[p->state];
    else
      state = "???";
9000000000200ac4:	1c000039 	pcaddu12i   	$s2, 1(0x1)
9000000000200ac8:	02d7f339 	addi.d      	$s2, $s2, 1532(0x5fc)
    printf("%d %s %s", p->pid, state, p->name);
9000000000200acc:	1c00003b 	pcaddu12i   	$s4, 1(0x1)
9000000000200ad0:	02d7f37b 	addi.d      	$s4, $s4, 1532(0x5fc)
    printf("\n");
9000000000200ad4:	1c00003a 	pcaddu12i   	$s3, 1(0x1)
9000000000200ad8:	02d5535a 	addi.d      	$s3, $s3, 1364(0x554)
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
9000000000200adc:	1c00003d 	pcaddu12i   	$s6, 1(0x1)
9000000000200ae0:	02d893bd 	addi.d      	$s6, $s6, 1572(0x624)
9000000000200ae4:	50002000 	b           	32(0x20)	# 9000000000200b04 <procdump+0x94>
    printf("%d %s %s", p->pid, state, p->name);
9000000000200ae8:	24fee8e5 	ldptr.w     	$a1, $a3, -280(0xfee8)
9000000000200aec:	00150364 	move        	$a0, $s4
9000000000200af0:	57fa47ff 	bl          	-1468(0xffffa44)	# 9000000000200534 <printf>
    printf("\n");
9000000000200af4:	00150344 	move        	$a0, $s3
9000000000200af8:	57fa3fff 	bl          	-1476(0xffffa3c)	# 9000000000200534 <printf>
  for(p = proc; p < &proc[NPROC]; p++){
9000000000200afc:	02c562f7 	addi.d      	$s0, $s0, 344(0x158)
9000000000200b00:	580032f8 	beq         	$s0, $s1, 48(0x30)	# 9000000000200b30 <procdump+0xc0>
    if(p->state == UNUSED)
9000000000200b04:	001502e7 	move        	$a3, $s0
9000000000200b08:	24fed2ec 	ldptr.w     	$t0, $s0, -304(0xfed0)
9000000000200b0c:	43fff19f 	beqz        	$t0, -16(0x7ffff0)	# 9000000000200afc <procdump+0x8c>
      state = "???";
9000000000200b10:	00150326 	move        	$a2, $s2
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
9000000000200b14:	6bffd78c 	bltu        	$s5, $t0, -44(0x3ffd4)	# 9000000000200ae8 <procdump+0x78>
9000000000200b18:	00df018c 	bstrpick.d  	$t0, $t0, 0x1f, 0x0
9000000000200b1c:	002d018c 	alsl.d      	$t0, $t0, $zero, 0x3
9000000000200b20:	380c33a6 	ldx.d       	$a2, $s6, $t0
9000000000200b24:	47ffc4df 	bnez        	$a2, -60(0x7fffc4)	# 9000000000200ae8 <procdump+0x78>
      state = "???";
9000000000200b28:	00150326 	move        	$a2, $s2
9000000000200b2c:	53ffbfff 	b           	-68(0xfffffbc)	# 9000000000200ae8 <procdump+0x78>
  }
9000000000200b30:	28c12061 	ld.d        	$ra, $sp, 72(0x48)
9000000000200b34:	28c10076 	ld.d        	$fp, $sp, 64(0x40)
9000000000200b38:	28c0e077 	ld.d        	$s0, $sp, 56(0x38)
9000000000200b3c:	28c0c078 	ld.d        	$s1, $sp, 48(0x30)
9000000000200b40:	28c0a079 	ld.d        	$s2, $sp, 40(0x28)
9000000000200b44:	28c0807a 	ld.d        	$s3, $sp, 32(0x20)
9000000000200b48:	28c0607b 	ld.d        	$s4, $sp, 24(0x18)
9000000000200b4c:	28c0407c 	ld.d        	$s5, $sp, 16(0x10)
9000000000200b50:	28c0207d 	ld.d        	$s6, $sp, 8(0x8)
9000000000200b54:	02c14063 	addi.d      	$sp, $sp, 80(0x50)
9000000000200b58:	4c000020 	jirl        	$zero, $ra, 0

9000000000200b5c <initlock>:
#include "proc.h"
#include "defs.h"

void
initlock(struct spinlock *lk, char *name)
{
9000000000200b5c:	02ffc063 	addi.d      	$sp, $sp, -16(0xff0)
9000000000200b60:	29c02076 	st.d        	$fp, $sp, 8(0x8)
9000000000200b64:	02c04076 	addi.d      	$fp, $sp, 16(0x10)
  lk->name = name;
9000000000200b68:	29c02085 	st.d        	$a1, $a0, 8(0x8)
  lk->locked = 0;
9000000000200b6c:	25000080 	stptr.w     	$zero, $a0, 0
  lk->cpu = 0;
9000000000200b70:	29c04080 	st.d        	$zero, $a0, 16(0x10)
}
9000000000200b74:	28c02076 	ld.d        	$fp, $sp, 8(0x8)
9000000000200b78:	02c04063 	addi.d      	$sp, $sp, 16(0x10)
9000000000200b7c:	4c000020 	jirl        	$zero, $ra, 0

9000000000200b80 <holding>:
// Interrupts must be off.
int
holding(struct spinlock *lk)
{
  int r;
  r = (lk->locked && lk->cpu == mycpu());
9000000000200b80:	2400008c 	ldptr.w     	$t0, $a0, 0
9000000000200b84:	44000d80 	bnez        	$t0, 12(0xc)	# 9000000000200b90 <holding+0x10>
9000000000200b88:	00150004 	move        	$a0, $zero
  return r;
}
9000000000200b8c:	4c000020 	jirl        	$zero, $ra, 0
{
9000000000200b90:	02ff8063 	addi.d      	$sp, $sp, -32(0xfe0)
9000000000200b94:	29c06061 	st.d        	$ra, $sp, 24(0x18)
9000000000200b98:	29c04076 	st.d        	$fp, $sp, 16(0x10)
9000000000200b9c:	29c02077 	st.d        	$s0, $sp, 8(0x8)
9000000000200ba0:	02c08076 	addi.d      	$fp, $sp, 32(0x20)
  r = (lk->locked && lk->cpu == mycpu());
9000000000200ba4:	28c04097 	ld.d        	$s0, $a0, 16(0x10)
9000000000200ba8:	57fc17ff 	bl          	-1004(0xffffc14)	# 90000000002007bc <mycpu>
9000000000200bac:	001592e4 	xor         	$a0, $s0, $a0
9000000000200bb0:	02400484 	sltui       	$a0, $a0, 1(0x1)
}
9000000000200bb4:	28c06061 	ld.d        	$ra, $sp, 24(0x18)
9000000000200bb8:	28c04076 	ld.d        	$fp, $sp, 16(0x10)
9000000000200bbc:	28c02077 	ld.d        	$s0, $sp, 8(0x8)
9000000000200bc0:	02c08063 	addi.d      	$sp, $sp, 32(0x20)
9000000000200bc4:	4c000020 	jirl        	$zero, $ra, 0

9000000000200bc8 <push_off>:
// it takes two pop_off()s to undo two push_off()s.  Also, if interrupts
// are initially off, then push_off, pop_off leaves them off.

void
push_off(void)
{
9000000000200bc8:	02ff8063 	addi.d      	$sp, $sp, -32(0xfe0)
9000000000200bcc:	29c06061 	st.d        	$ra, $sp, 24(0x18)
9000000000200bd0:	29c04076 	st.d        	$fp, $sp, 16(0x10)
9000000000200bd4:	29c02077 	st.d        	$s0, $sp, 8(0x8)
9000000000200bd8:	02c08076 	addi.d      	$fp, $sp, 32(0x20)
  asm volatile("csrrd %0, 0x0" : "=r" (x) );
9000000000200bdc:	04000017 	csrrd       	$s0, 0x0
9000000000200be0:	0400000c 	csrrd       	$t0, 0x0

// disable device interrupts
static inline void
intr_off()
{
  w_csr_crmd(r_csr_crmd() & ~CSR_CRMD_IE);
9000000000200be4:	02bfec0d 	addi.w      	$t1, $zero, -5(0xffb)
9000000000200be8:	0014b58c 	and         	$t0, $t0, $t1
  asm volatile("csrwr %0, 0x0" : : "r" (x));
9000000000200bec:	0400002c 	csrwr       	$t0, 0x0
  int old = intr_get();

  intr_off();
  if(mycpu()->noff == 0)
9000000000200bf0:	57fbcfff 	bl          	-1076(0xffffbcc)	# 90000000002007bc <mycpu>
9000000000200bf4:	2400688c 	ldptr.w     	$t0, $a0, 104(0x68)
9000000000200bf8:	40002980 	beqz        	$t0, 40(0x28)	# 9000000000200c20 <push_off+0x58>
    mycpu()->intena = old;
  mycpu()->noff += 1;
9000000000200bfc:	57fbc3ff 	bl          	-1088(0xffffbc0)	# 90000000002007bc <mycpu>
9000000000200c00:	2400688c 	ldptr.w     	$t0, $a0, 104(0x68)
9000000000200c04:	0280058c 	addi.w      	$t0, $t0, 1(0x1)
9000000000200c08:	2981a08c 	st.w        	$t0, $a0, 104(0x68)
}
9000000000200c0c:	28c06061 	ld.d        	$ra, $sp, 24(0x18)
9000000000200c10:	28c04076 	ld.d        	$fp, $sp, 16(0x10)
9000000000200c14:	28c02077 	ld.d        	$s0, $sp, 8(0x8)
9000000000200c18:	02c08063 	addi.d      	$sp, $sp, 32(0x20)
9000000000200c1c:	4c000020 	jirl        	$zero, $ra, 0
    mycpu()->intena = old;
9000000000200c20:	57fb9fff 	bl          	-1124(0xffffb9c)	# 90000000002007bc <mycpu>
  return (x & CSR_CRMD_IE) != 0;
9000000000200c24:	00628af7 	bstrpick.w  	$s0, $s0, 0x2, 0x2
9000000000200c28:	2981b097 	st.w        	$s0, $a0, 108(0x6c)
9000000000200c2c:	53ffd3ff 	b           	-48(0xfffffd0)	# 9000000000200bfc <push_off+0x34>

9000000000200c30 <acquire>:
{
9000000000200c30:	02ff8063 	addi.d      	$sp, $sp, -32(0xfe0)
9000000000200c34:	29c06061 	st.d        	$ra, $sp, 24(0x18)
9000000000200c38:	29c04076 	st.d        	$fp, $sp, 16(0x10)
9000000000200c3c:	29c02077 	st.d        	$s0, $sp, 8(0x8)
9000000000200c40:	02c08076 	addi.d      	$fp, $sp, 32(0x20)
9000000000200c44:	00150097 	move        	$s0, $a0
  push_off(); // disable interrupts to avoid deadlock.
9000000000200c48:	57ff83ff 	bl          	-128(0xfffff80)	# 9000000000200bc8 <push_off>
  if(holding(lk))
9000000000200c4c:	001502e4 	move        	$a0, $s0
9000000000200c50:	57ff33ff 	bl          	-208(0xfffff30)	# 9000000000200b80 <holding>
  while(__sync_lock_test_and_set(&lk->locked, 1) != 0)
9000000000200c54:	0280040d 	addi.w      	$t1, $zero, 1(0x1)
  if(holding(lk))
9000000000200c58:	44002c80 	bnez        	$a0, 44(0x2c)	# 9000000000200c84 <acquire+0x54>
  while(__sync_lock_test_and_set(&lk->locked, 1) != 0)
9000000000200c5c:	386036ec 	amswap.w    	$t0, $t1, $s0
9000000000200c60:	47fffd9f 	bnez        	$t0, -4(0x7ffffc)	# 9000000000200c5c <acquire+0x2c>
  __sync_synchronize();
9000000000200c64:	38720000 	dbar        	0x0
  lk->cpu = mycpu();
9000000000200c68:	57fb57ff 	bl          	-1196(0xffffb54)	# 90000000002007bc <mycpu>
9000000000200c6c:	29c042e4 	st.d        	$a0, $s0, 16(0x10)
}
9000000000200c70:	28c06061 	ld.d        	$ra, $sp, 24(0x18)
9000000000200c74:	28c04076 	ld.d        	$fp, $sp, 16(0x10)
9000000000200c78:	28c02077 	ld.d        	$s0, $sp, 8(0x8)
9000000000200c7c:	02c08063 	addi.d      	$sp, $sp, 32(0x20)
9000000000200c80:	4c000020 	jirl        	$zero, $ra, 0
    panic("acquire");
9000000000200c84:	1c000024 	pcaddu12i   	$a0, 1(0x1)
9000000000200c88:	02d2d084 	addi.d      	$a0, $a0, 1204(0x4b4)
9000000000200c8c:	57f853ff 	bl          	-1968(0xffff850)	# 90000000002004dc <panic>

9000000000200c90 <pop_off>:

void
pop_off(void)
{
9000000000200c90:	02ffc063 	addi.d      	$sp, $sp, -16(0xff0)
9000000000200c94:	29c02061 	st.d        	$ra, $sp, 8(0x8)
9000000000200c98:	27000076 	stptr.d     	$fp, $sp, 0
9000000000200c9c:	02c04076 	addi.d      	$fp, $sp, 16(0x10)
  struct cpu *c = mycpu();
9000000000200ca0:	57fb1fff 	bl          	-1252(0xffffb1c)	# 90000000002007bc <mycpu>
  asm volatile("csrrd %0, 0x0" : "=r" (x) );
9000000000200ca4:	0400000c 	csrrd       	$t0, 0x0
  return (x & CSR_CRMD_IE) != 0;
9000000000200ca8:	0340118c 	andi        	$t0, $t0, 0x4
  if(intr_get())
9000000000200cac:	44004180 	bnez        	$t0, 64(0x40)	# 9000000000200cec <pop_off+0x5c>
    panic("pop_off - interruptible");
  if(c->noff < 1)
9000000000200cb0:	2400688c 	ldptr.w     	$t0, $a0, 104(0x68)
9000000000200cb4:	6400440c 	blez        	$t0, 68(0x44)	# 9000000000200cf8 <pop_off+0x68>
    panic("pop_off");
  c->noff -= 1;
9000000000200cb8:	02bffd8d 	addi.w      	$t1, $t0, -1(0xfff)
9000000000200cbc:	02bffd8c 	addi.w      	$t0, $t0, -1(0xfff)
9000000000200cc0:	2981a08d 	st.w        	$t1, $a0, 104(0x68)
  if(c->noff == 0 && c->intena)
9000000000200cc4:	44001980 	bnez        	$t0, 24(0x18)	# 9000000000200cdc <pop_off+0x4c>
9000000000200cc8:	24006c8c 	ldptr.w     	$t0, $a0, 108(0x6c)
9000000000200ccc:	40001180 	beqz        	$t0, 16(0x10)	# 9000000000200cdc <pop_off+0x4c>
  asm volatile("csrrd %0, 0x0" : "=r" (x) );
9000000000200cd0:	0400000c 	csrrd       	$t0, 0x0
  w_csr_crmd(r_csr_crmd() | CSR_CRMD_IE);
9000000000200cd4:	0380118c 	ori         	$t0, $t0, 0x4
  asm volatile("csrwr %0, 0x0" : : "r" (x));
9000000000200cd8:	0400002c 	csrwr       	$t0, 0x0
    intr_on();
}
9000000000200cdc:	28c02061 	ld.d        	$ra, $sp, 8(0x8)
9000000000200ce0:	26000076 	ldptr.d     	$fp, $sp, 0
9000000000200ce4:	02c04063 	addi.d      	$sp, $sp, 16(0x10)
9000000000200ce8:	4c000020 	jirl        	$zero, $ra, 0
    panic("pop_off - interruptible");
9000000000200cec:	1c000024 	pcaddu12i   	$a0, 1(0x1)
9000000000200cf0:	02d15084 	addi.d      	$a0, $a0, 1108(0x454)
9000000000200cf4:	57f7ebff 	bl          	-2072(0xffff7e8)	# 90000000002004dc <panic>
    panic("pop_off");
9000000000200cf8:	1c000024 	pcaddu12i   	$a0, 1(0x1)
9000000000200cfc:	02d18084 	addi.d      	$a0, $a0, 1120(0x460)
9000000000200d00:	57f7dfff 	bl          	-2084(0xffff7dc)	# 90000000002004dc <panic>

9000000000200d04 <release>:
{
9000000000200d04:	02ff8063 	addi.d      	$sp, $sp, -32(0xfe0)
9000000000200d08:	29c06061 	st.d        	$ra, $sp, 24(0x18)
9000000000200d0c:	29c04076 	st.d        	$fp, $sp, 16(0x10)
9000000000200d10:	29c02077 	st.d        	$s0, $sp, 8(0x8)
9000000000200d14:	02c08076 	addi.d      	$fp, $sp, 32(0x20)
9000000000200d18:	00150097 	move        	$s0, $a0
  if(!holding(lk))
9000000000200d1c:	57fe67ff 	bl          	-412(0xffffe64)	# 9000000000200b80 <holding>
9000000000200d20:	40002880 	beqz        	$a0, 40(0x28)	# 9000000000200d48 <release+0x44>
  lk->cpu = 0;
9000000000200d24:	29c042e0 	st.d        	$zero, $s0, 16(0x10)
  __sync_synchronize();
9000000000200d28:	38720000 	dbar        	0x0
  __sync_lock_release(&lk->locked);
9000000000200d2c:	386902e0 	amswap_db.w 	$zero, $zero, $s0
  pop_off();
9000000000200d30:	57ff63ff 	bl          	-160(0xfffff60)	# 9000000000200c90 <pop_off>
}
9000000000200d34:	28c06061 	ld.d        	$ra, $sp, 24(0x18)
9000000000200d38:	28c04076 	ld.d        	$fp, $sp, 16(0x10)
9000000000200d3c:	28c02077 	ld.d        	$s0, $sp, 8(0x8)
9000000000200d40:	02c08063 	addi.d      	$sp, $sp, 32(0x20)
9000000000200d44:	4c000020 	jirl        	$zero, $ra, 0
    panic("release");
9000000000200d48:	1c000024 	pcaddu12i   	$a0, 1(0x1)
9000000000200d4c:	02d06084 	addi.d      	$a0, $a0, 1048(0x418)
9000000000200d50:	57f78fff 	bl          	-2164(0xffff78c)	# 90000000002004dc <panic>

9000000000200d54 <memset>:
#include "types.h"

void*
memset(void *dst, int c, uint n)
{
9000000000200d54:	02ffc063 	addi.d      	$sp, $sp, -16(0xff0)
9000000000200d58:	29c02076 	st.d        	$fp, $sp, 8(0x8)
9000000000200d5c:	02c04076 	addi.d      	$fp, $sp, 16(0x10)
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
9000000000200d60:	40001cc0 	beqz        	$a2, 28(0x1c)	# 9000000000200d7c <memset+0x28>
9000000000200d64:	0015008c 	move        	$t0, $a0
9000000000200d68:	00df00c6 	bstrpick.d  	$a2, $a2, 0x1f, 0x0
9000000000200d6c:	001090cd 	add.d       	$t1, $a2, $a0
    cdst[i] = c;
9000000000200d70:	29000185 	st.b        	$a1, $t0, 0
  for(i = 0; i < n; i++){
9000000000200d74:	02c0058c 	addi.d      	$t0, $t0, 1(0x1)
9000000000200d78:	5ffff98d 	bne         	$t0, $t1, -8(0x3fff8)	# 9000000000200d70 <memset+0x1c>
  }
  return dst;
}
9000000000200d7c:	28c02076 	ld.d        	$fp, $sp, 8(0x8)
9000000000200d80:	02c04063 	addi.d      	$sp, $sp, 16(0x10)
9000000000200d84:	4c000020 	jirl        	$zero, $ra, 0

9000000000200d88 <memcmp>:

int
memcmp(const void *v1, const void *v2, uint n)
{
9000000000200d88:	02ffc063 	addi.d      	$sp, $sp, -16(0xff0)
9000000000200d8c:	29c02076 	st.d        	$fp, $sp, 8(0x8)
9000000000200d90:	02c04076 	addi.d      	$fp, $sp, 16(0x10)
  const uchar *s1, *s2;

  s1 = v1;
  s2 = v2;
  while(n-- > 0){
9000000000200d94:	40004cc0 	beqz        	$a2, 76(0x4c)	# 9000000000200de0 <memcmp+0x58>
9000000000200d98:	02bffcd0 	addi.w      	$t4, $a2, -1(0xfff)
9000000000200d9c:	00df0210 	bstrpick.d  	$t4, $t4, 0x1f, 0x0
9000000000200da0:	02c00610 	addi.d      	$t4, $t4, 1(0x1)
9000000000200da4:	0010c090 	add.d       	$t4, $a0, $t4
    if(*s1 != *s2)
9000000000200da8:	2a00008c 	ld.bu       	$t0, $a0, 0
9000000000200dac:	2a0000ad 	ld.bu       	$t1, $a1, 0
9000000000200db0:	0015018f 	move        	$t3, $t0
9000000000200db4:	001501ae 	move        	$t2, $t1
9000000000200db8:	5c0019ee 	bne         	$t3, $t2, 24(0x18)	# 9000000000200dd0 <memcmp+0x48>
      return *s1 - *s2;
    s1++, s2++;
9000000000200dbc:	02c00484 	addi.d      	$a0, $a0, 1(0x1)
9000000000200dc0:	02c004a5 	addi.d      	$a1, $a1, 1(0x1)
  while(n-- > 0){
9000000000200dc4:	5fffe490 	bne         	$a0, $t4, -28(0x3ffe4)	# 9000000000200da8 <memcmp+0x20>
  }

  return 0;
9000000000200dc8:	00150004 	move        	$a0, $zero
9000000000200dcc:	50000800 	b           	8(0x8)	# 9000000000200dd4 <memcmp+0x4c>
      return *s1 - *s2;
9000000000200dd0:	00113584 	sub.w       	$a0, $t0, $t1
}
9000000000200dd4:	28c02076 	ld.d        	$fp, $sp, 8(0x8)
9000000000200dd8:	02c04063 	addi.d      	$sp, $sp, 16(0x10)
9000000000200ddc:	4c000020 	jirl        	$zero, $ra, 0
  return 0;
9000000000200de0:	00150004 	move        	$a0, $zero
9000000000200de4:	53fff3ff 	b           	-16(0xffffff0)	# 9000000000200dd4 <memcmp+0x4c>

9000000000200de8 <memmove>:

void*
memmove(void *dst, const void *src, uint n)
{
9000000000200de8:	02ffc063 	addi.d      	$sp, $sp, -16(0xff0)
9000000000200dec:	29c02076 	st.d        	$fp, $sp, 8(0x8)
9000000000200df0:	02c04076 	addi.d      	$fp, $sp, 16(0x10)
  const char *s;
  char *d;

  if(n == 0)
9000000000200df4:	400028c0 	beqz        	$a2, 40(0x28)	# 9000000000200e1c <memmove+0x34>
    return dst;
  
  s = src;
  d = dst;
  if(s < d && s + n > d){
9000000000200df8:	680030a4 	bltu        	$a1, $a0, 48(0x30)	# 9000000000200e28 <memmove+0x40>
    s += n;
    d += n;
    while(n-- > 0)
      *--d = *--s;
  } else
    while(n-- > 0)
9000000000200dfc:	00df00c6 	bstrpick.d  	$a2, $a2, 0x1f, 0x0
9000000000200e00:	001098ac 	add.d       	$t0, $a1, $a2
{
9000000000200e04:	0015008d 	move        	$t1, $a0
      *d++ = *s++;
9000000000200e08:	02c004a5 	addi.d      	$a1, $a1, 1(0x1)
9000000000200e0c:	02c005ad 	addi.d      	$t1, $t1, 1(0x1)
9000000000200e10:	283ffcae 	ld.b        	$t2, $a1, -1(0xfff)
9000000000200e14:	293ffdae 	st.b        	$t2, $t1, -1(0xfff)
    while(n-- > 0)
9000000000200e18:	5ffff0ac 	bne         	$a1, $t0, -16(0x3fff0)	# 9000000000200e08 <memmove+0x20>

  return dst;
}
9000000000200e1c:	28c02076 	ld.d        	$fp, $sp, 8(0x8)
9000000000200e20:	02c04063 	addi.d      	$sp, $sp, 16(0x10)
9000000000200e24:	4c000020 	jirl        	$zero, $ra, 0
  if(s < d && s + n > d){
9000000000200e28:	00df00ce 	bstrpick.d  	$t2, $a2, 0x1f, 0x0
9000000000200e2c:	0010b8ad 	add.d       	$t1, $a1, $t2
9000000000200e30:	6fffcc8d 	bgeu        	$a0, $t1, -52(0x3ffcc)	# 9000000000200dfc <memmove+0x14>
    d += n;
9000000000200e34:	0010b88e 	add.d       	$t2, $a0, $t2
    while(n-- > 0)
9000000000200e38:	02bffccc 	addi.w      	$t0, $a2, -1(0xfff)
9000000000200e3c:	00df018c 	bstrpick.d  	$t0, $t0, 0x1f, 0x0
9000000000200e40:	0014300c 	nor         	$t0, $zero, $t0
9000000000200e44:	0010b1ac 	add.d       	$t0, $t1, $t0
      *--d = *--s;
9000000000200e48:	02fffdad 	addi.d      	$t1, $t1, -1(0xfff)
9000000000200e4c:	02fffdce 	addi.d      	$t2, $t2, -1(0xfff)
9000000000200e50:	280001af 	ld.b        	$t3, $t1, 0
9000000000200e54:	290001cf 	st.b        	$t3, $t2, 0
    while(n-- > 0)
9000000000200e58:	5ffff18d 	bne         	$t0, $t1, -16(0x3fff0)	# 9000000000200e48 <memmove+0x60>
9000000000200e5c:	53ffc3ff 	b           	-64(0xfffffc0)	# 9000000000200e1c <memmove+0x34>

9000000000200e60 <memcpy>:

// memcpy exists to placate GCC.  Use memmove.
void*
memcpy(void *dst, const void *src, uint n)
{
9000000000200e60:	02ffc063 	addi.d      	$sp, $sp, -16(0xff0)
9000000000200e64:	29c02061 	st.d        	$ra, $sp, 8(0x8)
9000000000200e68:	27000076 	stptr.d     	$fp, $sp, 0
9000000000200e6c:	02c04076 	addi.d      	$fp, $sp, 16(0x10)
  return memmove(dst, src, n);
9000000000200e70:	57ff7bff 	bl          	-136(0xfffff78)	# 9000000000200de8 <memmove>
}
9000000000200e74:	28c02061 	ld.d        	$ra, $sp, 8(0x8)
9000000000200e78:	26000076 	ldptr.d     	$fp, $sp, 0
9000000000200e7c:	02c04063 	addi.d      	$sp, $sp, 16(0x10)
9000000000200e80:	4c000020 	jirl        	$zero, $ra, 0

9000000000200e84 <strncmp>:

int
strncmp(const char *p, const char *q, uint n)
{
9000000000200e84:	02ffc063 	addi.d      	$sp, $sp, -16(0xff0)
9000000000200e88:	29c02076 	st.d        	$fp, $sp, 8(0x8)
9000000000200e8c:	02c04076 	addi.d      	$fp, $sp, 16(0x10)
  while(n > 0 && *p && *p == *q)
9000000000200e90:	40002cc0 	beqz        	$a2, 44(0x2c)	# 9000000000200ebc <strncmp+0x38>
9000000000200e94:	2800008c 	ld.b        	$t0, $a0, 0
9000000000200e98:	40002d80 	beqz        	$t0, 44(0x2c)	# 9000000000200ec4 <strncmp+0x40>
9000000000200e9c:	280000ad 	ld.b        	$t1, $a1, 0
9000000000200ea0:	5c0025ac 	bne         	$t1, $t0, 36(0x24)	# 9000000000200ec4 <strncmp+0x40>
    n--, p++, q++;
9000000000200ea4:	02bffcc6 	addi.w      	$a2, $a2, -1(0xfff)
9000000000200ea8:	02c00484 	addi.d      	$a0, $a0, 1(0x1)
9000000000200eac:	02c004a5 	addi.d      	$a1, $a1, 1(0x1)
  while(n > 0 && *p && *p == *q)
9000000000200eb0:	47ffe4df 	bnez        	$a2, -28(0x7fffe4)	# 9000000000200e94 <strncmp+0x10>
  if(n == 0)
    return 0;
9000000000200eb4:	00150004 	move        	$a0, $zero
9000000000200eb8:	50001c00 	b           	28(0x1c)	# 9000000000200ed4 <strncmp+0x50>
9000000000200ebc:	00150004 	move        	$a0, $zero
9000000000200ec0:	50001400 	b           	20(0x14)	# 9000000000200ed4 <strncmp+0x50>
  if(n == 0)
9000000000200ec4:	40001cc0 	beqz        	$a2, 28(0x1c)	# 9000000000200ee0 <strncmp+0x5c>
  return (uchar)*p - (uchar)*q;
9000000000200ec8:	2a000084 	ld.bu       	$a0, $a0, 0
9000000000200ecc:	2a0000ac 	ld.bu       	$t0, $a1, 0
9000000000200ed0:	00113084 	sub.w       	$a0, $a0, $t0
}
9000000000200ed4:	28c02076 	ld.d        	$fp, $sp, 8(0x8)
9000000000200ed8:	02c04063 	addi.d      	$sp, $sp, 16(0x10)
9000000000200edc:	4c000020 	jirl        	$zero, $ra, 0
    return 0;
9000000000200ee0:	00150004 	move        	$a0, $zero
9000000000200ee4:	53fff3ff 	b           	-16(0xffffff0)	# 9000000000200ed4 <strncmp+0x50>

9000000000200ee8 <strncpy>:

char*
strncpy(char *s, const char *t, int n)
{
9000000000200ee8:	02ffc063 	addi.d      	$sp, $sp, -16(0xff0)
9000000000200eec:	29c02076 	st.d        	$fp, $sp, 8(0x8)
9000000000200ef0:	02c04076 	addi.d      	$fp, $sp, 16(0x10)
  char *os;

  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
9000000000200ef4:	0015008c 	move        	$t0, $a0
9000000000200ef8:	001500ce 	move        	$t2, $a2
9000000000200efc:	02bffcc6 	addi.w      	$a2, $a2, -1(0xfff)
9000000000200f00:	6400180e 	blez        	$t2, 24(0x18)	# 9000000000200f18 <strncpy+0x30>
9000000000200f04:	02c0058c 	addi.d      	$t0, $t0, 1(0x1)
9000000000200f08:	280000ad 	ld.b        	$t1, $a1, 0
9000000000200f0c:	293ffd8d 	st.b        	$t1, $t0, -1(0xfff)
9000000000200f10:	02c004a5 	addi.d      	$a1, $a1, 1(0x1)
9000000000200f14:	47ffe5bf 	bnez        	$t1, -28(0x7fffe4)	# 9000000000200ef8 <strncpy+0x10>
    ;
  while(n-- > 0)
9000000000200f18:	0015018d 	move        	$t1, $t0
9000000000200f1c:	64002406 	blez        	$a2, 36(0x24)	# 9000000000200f40 <strncpy+0x58>
9000000000200f20:	0040818c 	slli.w      	$t0, $t0, 0x0
9000000000200f24:	0010398c 	add.w       	$t0, $t0, $t2
9000000000200f28:	02bffd8c 	addi.w      	$t0, $t0, -1(0xfff)
    *s++ = 0;
9000000000200f2c:	02c005ad 	addi.d      	$t1, $t1, 1(0x1)
9000000000200f30:	293ffda0 	st.b        	$zero, $t1, -1(0xfff)
  while(n-- > 0)
9000000000200f34:	004081ae 	slli.w      	$t2, $t1, 0x0
9000000000200f38:	0011398e 	sub.w       	$t2, $t0, $t2
9000000000200f3c:	63fff00e 	bgtz        	$t2, -16(0x3fff0)	# 9000000000200f2c <strncpy+0x44>
  return os;
}
9000000000200f40:	28c02076 	ld.d        	$fp, $sp, 8(0x8)
9000000000200f44:	02c04063 	addi.d      	$sp, $sp, 16(0x10)
9000000000200f48:	4c000020 	jirl        	$zero, $ra, 0

9000000000200f4c <safestrcpy>:

// Like strncpy but guaranteed to NUL-terminate.
char*
safestrcpy(char *s, const char *t, int n)
{
9000000000200f4c:	02ffc063 	addi.d      	$sp, $sp, -16(0xff0)
9000000000200f50:	29c02076 	st.d        	$fp, $sp, 8(0x8)
9000000000200f54:	02c04076 	addi.d      	$fp, $sp, 16(0x10)
  char *os;

  os = s;
  if(n <= 0)
9000000000200f58:	64003006 	blez        	$a2, 48(0x30)	# 9000000000200f88 <safestrcpy+0x3c>
9000000000200f5c:	02bffcce 	addi.w      	$t2, $a2, -1(0xfff)
9000000000200f60:	00df01ce 	bstrpick.d  	$t2, $t2, 0x1f, 0x0
9000000000200f64:	0010b8ae 	add.d       	$t2, $a1, $t2
9000000000200f68:	0015008c 	move        	$t0, $a0
    return os;
  while(--n > 0 && (*s++ = *t++) != 0)
9000000000200f6c:	580018ae 	beq         	$a1, $t2, 24(0x18)	# 9000000000200f84 <safestrcpy+0x38>
9000000000200f70:	02c004a5 	addi.d      	$a1, $a1, 1(0x1)
9000000000200f74:	02c0058c 	addi.d      	$t0, $t0, 1(0x1)
9000000000200f78:	283ffcad 	ld.b        	$t1, $a1, -1(0xfff)
9000000000200f7c:	293ffd8d 	st.b        	$t1, $t0, -1(0xfff)
9000000000200f80:	47ffedbf 	bnez        	$t1, -20(0x7fffec)	# 9000000000200f6c <safestrcpy+0x20>
    ;
  *s = 0;
9000000000200f84:	29000180 	st.b        	$zero, $t0, 0
  return os;
}
9000000000200f88:	28c02076 	ld.d        	$fp, $sp, 8(0x8)
9000000000200f8c:	02c04063 	addi.d      	$sp, $sp, 16(0x10)
9000000000200f90:	4c000020 	jirl        	$zero, $ra, 0

9000000000200f94 <strlen>:

int
strlen(const char *s)
{
9000000000200f94:	02ffc063 	addi.d      	$sp, $sp, -16(0xff0)
9000000000200f98:	29c02076 	st.d        	$fp, $sp, 8(0x8)
9000000000200f9c:	02c04076 	addi.d      	$fp, $sp, 16(0x10)
  int n;

  for(n = 0; s[n]; n++)
9000000000200fa0:	2800008c 	ld.b        	$t0, $a0, 0
9000000000200fa4:	40003d80 	beqz        	$t0, 60(0x3c)	# 9000000000200fe0 <strlen+0x4c>
9000000000200fa8:	02c00484 	addi.d      	$a0, $a0, 1(0x1)
9000000000200fac:	0015008c 	move        	$t0, $a0
9000000000200fb0:	0015018e 	move        	$t2, $t0
9000000000200fb4:	02c0058c 	addi.d      	$t0, $t0, 1(0x1)
9000000000200fb8:	283ffd8d 	ld.b        	$t1, $t0, -1(0xfff)
9000000000200fbc:	47fff5bf 	bnez        	$t1, -12(0x7ffff4)	# 9000000000200fb0 <strlen+0x1c>
9000000000200fc0:	00408084 	slli.w      	$a0, $a0, 0x0
9000000000200fc4:	0280040c 	addi.w      	$t0, $zero, 1(0x1)
9000000000200fc8:	00111184 	sub.w       	$a0, $t0, $a0
9000000000200fcc:	004081ce 	slli.w      	$t2, $t2, 0x0
9000000000200fd0:	00103884 	add.w       	$a0, $a0, $t2
    ;
  return n;
9000000000200fd4:	28c02076 	ld.d        	$fp, $sp, 8(0x8)
9000000000200fd8:	02c04063 	addi.d      	$sp, $sp, 16(0x10)
9000000000200fdc:	4c000020 	jirl        	$zero, $ra, 0
  for(n = 0; s[n]; n++)
9000000000200fe0:	00150004 	move        	$a0, $zero
9000000000200fe4:	53fff3ff 	b           	-16(0xffffff0)	# 9000000000200fd4 <strlen+0x40>

9000000000200fe8 <swtch>:
9000000000200fe8:	29c00081 	st.d        	$ra, $a0, 0
9000000000200fec:	29c02083 	st.d        	$sp, $a0, 8(0x8)
9000000000200ff0:	29c04097 	st.d        	$s0, $a0, 16(0x10)
9000000000200ff4:	29c06098 	st.d        	$s1, $a0, 24(0x18)
9000000000200ff8:	29c08099 	st.d        	$s2, $a0, 32(0x20)
9000000000200ffc:	29c0a09a 	st.d        	$s3, $a0, 40(0x28)
9000000000201000:	29c0c09b 	st.d        	$s4, $a0, 48(0x30)
9000000000201004:	29c0e09c 	st.d        	$s5, $a0, 56(0x38)
9000000000201008:	29c1009d 	st.d        	$s6, $a0, 64(0x40)
900000000020100c:	29c1209e 	st.d        	$s7, $a0, 72(0x48)
9000000000201010:	29c1409f 	st.d        	$s8, $a0, 80(0x50)
9000000000201014:	29c16096 	st.d        	$fp, $a0, 88(0x58)
9000000000201018:	28c000a1 	ld.d        	$ra, $a1, 0
900000000020101c:	28c020a3 	ld.d        	$sp, $a1, 8(0x8)
9000000000201020:	28c040b7 	ld.d        	$s0, $a1, 16(0x10)
9000000000201024:	28c060b8 	ld.d        	$s1, $a1, 24(0x18)
9000000000201028:	28c080b9 	ld.d        	$s2, $a1, 32(0x20)
900000000020102c:	28c0a0ba 	ld.d        	$s3, $a1, 40(0x28)
9000000000201030:	28c0c0bb 	ld.d        	$s4, $a1, 48(0x30)
9000000000201034:	28c0e0bc 	ld.d        	$s5, $a1, 56(0x38)
9000000000201038:	28c100bd 	ld.d        	$s6, $a1, 64(0x40)
900000000020103c:	28c120be 	ld.d        	$s7, $a1, 72(0x48)
9000000000201040:	28c140bf 	ld.d        	$s8, $a1, 80(0x50)
9000000000201044:	28c160b6 	ld.d        	$fp, $a1, 88(0x58)
9000000000201048:	06483800 	ertn        

900000000020104c <consolewrite>:
// user write()s to the console go here.
//

int
consolewrite(int user_src, uint64 src, int n)
{
900000000020104c:	02ffc063 	addi.d      	$sp, $sp, -16(0xff0)
9000000000201050:	29c02076 	st.d        	$fp, $sp, 8(0x8)
9000000000201054:	02c04076 	addi.d      	$fp, $sp, 16(0x10)
 //todo
 return 0;
}
9000000000201058:	00150004 	move        	$a0, $zero
900000000020105c:	28c02076 	ld.d        	$fp, $sp, 8(0x8)
9000000000201060:	02c04063 	addi.d      	$sp, $sp, 16(0x10)
9000000000201064:	4c000020 	jirl        	$zero, $ra, 0

9000000000201068 <consoleread>:
// user_dist indicates whether dst is a user
// or kernel address.
//
int
consoleread(int user_dst, uint64 dst, int n)
{
9000000000201068:	02ffc063 	addi.d      	$sp, $sp, -16(0xff0)
900000000020106c:	29c02076 	st.d        	$fp, $sp, 8(0x8)
9000000000201070:	02c04076 	addi.d      	$fp, $sp, 16(0x10)
 //todo
 return 0;
}
9000000000201074:	00150004 	move        	$a0, $zero
9000000000201078:	28c02076 	ld.d        	$fp, $sp, 8(0x8)
900000000020107c:	02c04063 	addi.d      	$sp, $sp, 16(0x10)
9000000000201080:	4c000020 	jirl        	$zero, $ra, 0

9000000000201084 <consputc>:
{
9000000000201084:	02ffc063 	addi.d      	$sp, $sp, -16(0xff0)
9000000000201088:	29c02061 	st.d        	$ra, $sp, 8(0x8)
900000000020108c:	27000076 	stptr.d     	$fp, $sp, 0
9000000000201090:	02c04076 	addi.d      	$fp, $sp, 16(0x10)
  if(c == BACKSPACE){
9000000000201094:	0284000c 	addi.w      	$t0, $zero, 256(0x100)
9000000000201098:	5800188c 	beq         	$a0, $t0, 24(0x18)	# 90000000002010b0 <consputc+0x2c>
    uartputc_sync(c);
900000000020109c:	57f0a7ff 	bl          	-3932(0xffff0a4)	# 9000000000200140 <uartputc_sync>
}
90000000002010a0:	28c02061 	ld.d        	$ra, $sp, 8(0x8)
90000000002010a4:	26000076 	ldptr.d     	$fp, $sp, 0
90000000002010a8:	02c04063 	addi.d      	$sp, $sp, 16(0x10)
90000000002010ac:	4c000020 	jirl        	$zero, $ra, 0
    uartputc_sync('\b'); uartputc_sync(' '); uartputc_sync('\b');
90000000002010b0:	02802004 	addi.w      	$a0, $zero, 8(0x8)
90000000002010b4:	57f08fff 	bl          	-3956(0xffff08c)	# 9000000000200140 <uartputc_sync>
90000000002010b8:	02808004 	addi.w      	$a0, $zero, 32(0x20)
90000000002010bc:	57f087ff 	bl          	-3964(0xffff084)	# 9000000000200140 <uartputc_sync>
90000000002010c0:	02802004 	addi.w      	$a0, $zero, 8(0x8)
90000000002010c4:	57f07fff 	bl          	-3972(0xffff07c)	# 9000000000200140 <uartputc_sync>
90000000002010c8:	53ffdbff 	b           	-40(0xfffffd8)	# 90000000002010a0 <consputc+0x1c>

90000000002010cc <consoleintr>:
// do erase/kill processing, append to cons.buf,
// wake up consoleread() if a whole line has arrived.
//
void
consoleintr(int c)
{
90000000002010cc:	02ff8063 	addi.d      	$sp, $sp, -32(0xfe0)
90000000002010d0:	29c06061 	st.d        	$ra, $sp, 24(0x18)
90000000002010d4:	29c04076 	st.d        	$fp, $sp, 16(0x10)
90000000002010d8:	29c02077 	st.d        	$s0, $sp, 8(0x8)
90000000002010dc:	27000078 	stptr.d     	$s1, $sp, 0
90000000002010e0:	02c08076 	addi.d      	$fp, $sp, 32(0x20)
90000000002010e4:	00150097 	move        	$s0, $a0
  acquire(&cons.lock);
90000000002010e8:	1c0000e4 	pcaddu12i   	$a0, 7(0x7)
90000000002010ec:	02de8084 	addi.d      	$a0, $a0, 1952(0x7a0)
90000000002010f0:	57fb43ff 	bl          	-1216(0xffffb40)	# 9000000000200c30 <acquire>

  switch(c){
90000000002010f4:	0280540c 	addi.w      	$t0, $zero, 21(0x15)
90000000002010f8:	5800c6ec 	beq         	$s0, $t0, 196(0xc4)	# 90000000002011bc <consoleintr+0xf0>
90000000002010fc:	60003d97 	blt         	$t0, $s0, 60(0x3c)	# 9000000000201138 <consoleintr+0x6c>
9000000000201100:	0280200c 	addi.w      	$t0, $zero, 8(0x8)
9000000000201104:	58010aec 	beq         	$s0, $t0, 264(0x108)	# 900000000020120c <consoleintr+0x140>
9000000000201108:	0280400c 	addi.w      	$t0, $zero, 16(0x10)
900000000020110c:	5c0132ec 	bne         	$s0, $t0, 304(0x130)	# 900000000020123c <consoleintr+0x170>
  case C('P'):  // Print process list.
    procdump();
9000000000201110:	57f963ff 	bl          	-1696(0xffff960)	# 9000000000200a70 <procdump>
      }
    }
    break;
  }
  
  release(&cons.lock);
9000000000201114:	1c0000e4 	pcaddu12i   	$a0, 7(0x7)
9000000000201118:	02ddd084 	addi.d      	$a0, $a0, 1908(0x774)
900000000020111c:	57fbebff 	bl          	-1048(0xffffbe8)	# 9000000000200d04 <release>
}
9000000000201120:	28c06061 	ld.d        	$ra, $sp, 24(0x18)
9000000000201124:	28c04076 	ld.d        	$fp, $sp, 16(0x10)
9000000000201128:	28c02077 	ld.d        	$s0, $sp, 8(0x8)
900000000020112c:	26000078 	ldptr.d     	$s1, $sp, 0
9000000000201130:	02c08063 	addi.d      	$sp, $sp, 32(0x20)
9000000000201134:	4c000020 	jirl        	$zero, $ra, 0
  switch(c){
9000000000201138:	0281fc0c 	addi.w      	$t0, $zero, 127(0x7f)
900000000020113c:	5800d2ec 	beq         	$s0, $t0, 208(0xd0)	# 900000000020120c <consoleintr+0x140>
    if(c != 0 && cons.e-cons.r < INPUT_BUF){
9000000000201140:	1c0000ed 	pcaddu12i   	$t1, 7(0x7)
9000000000201144:	02dd21ad 	addi.d      	$t1, $t1, 1864(0x748)
9000000000201148:	2400a1ac 	ldptr.w     	$t0, $t1, 160(0xa0)
900000000020114c:	240099ad 	ldptr.w     	$t1, $t1, 152(0x98)
9000000000201150:	0011358c 	sub.w       	$t0, $t0, $t1
9000000000201154:	0281fc0d 	addi.w      	$t1, $zero, 127(0x7f)
9000000000201158:	6bffbdac 	bltu        	$t1, $t0, -68(0x3ffbc)	# 9000000000201114 <consoleintr+0x48>
      c = (c == '\r') ? '\n' : c;
900000000020115c:	0280340c 	addi.w      	$t0, $zero, 13(0xd)
9000000000201160:	5800e6ec 	beq         	$s0, $t0, 228(0xe4)	# 9000000000201244 <consoleintr+0x178>
      consputc(c);
9000000000201164:	001502e4 	move        	$a0, $s0
9000000000201168:	57ff1fff 	bl          	-228(0xfffff1c)	# 9000000000201084 <consputc>
      cons.buf[cons.e++ % INPUT_BUF] = c;
900000000020116c:	1c0000ec 	pcaddu12i   	$t0, 7(0x7)
9000000000201170:	02dc718c 	addi.d      	$t0, $t0, 1820(0x71c)
9000000000201174:	2400a18d 	ldptr.w     	$t1, $t0, 160(0xa0)
9000000000201178:	028005af 	addi.w      	$t3, $t1, 1(0x1)
900000000020117c:	028005ae 	addi.w      	$t2, $t1, 1(0x1)
9000000000201180:	2982818f 	st.w        	$t3, $t0, 160(0xa0)
9000000000201184:	0341fdad 	andi        	$t1, $t1, 0x7f
9000000000201188:	0010b58c 	add.d       	$t0, $t0, $t1
900000000020118c:	29006197 	st.b        	$s0, $t0, 24(0x18)
      if(c == '\n' || c == C('D') || cons.e == cons.r+INPUT_BUF){
9000000000201190:	0280280c 	addi.w      	$t0, $zero, 10(0xa)
9000000000201194:	5800e2ec 	beq         	$s0, $t0, 224(0xe0)	# 9000000000201274 <consoleintr+0x1a8>
9000000000201198:	0280100c 	addi.w      	$t0, $zero, 4(0x4)
900000000020119c:	5800daec 	beq         	$s0, $t0, 216(0xd8)	# 9000000000201274 <consoleintr+0x1a8>
90000000002011a0:	1c0000ec 	pcaddu12i   	$t0, 7(0x7)
90000000002011a4:	02dba18c 	addi.d      	$t0, $t0, 1768(0x6e8)
90000000002011a8:	2400998c 	ldptr.w     	$t0, $t0, 152(0x98)
90000000002011ac:	0282018c 	addi.w      	$t0, $t0, 128(0x80)
90000000002011b0:	5fff65cc 	bne         	$t2, $t0, -156(0x3ff64)	# 9000000000201114 <consoleintr+0x48>
      cons.buf[cons.e++ % INPUT_BUF] = c;
90000000002011b4:	0015018e 	move        	$t2, $t0
90000000002011b8:	5000bc00 	b           	188(0xbc)	# 9000000000201274 <consoleintr+0x1a8>
    while(cons.e != cons.w &&
90000000002011bc:	1c0000ed 	pcaddu12i   	$t1, 7(0x7)
90000000002011c0:	02db31ad 	addi.d      	$t1, $t1, 1740(0x6cc)
90000000002011c4:	2400a1ac 	ldptr.w     	$t0, $t1, 160(0xa0)
90000000002011c8:	24009dad 	ldptr.w     	$t1, $t1, 156(0x9c)
          cons.buf[(cons.e-1) % INPUT_BUF] != '\n'){
90000000002011cc:	1c0000f7 	pcaddu12i   	$s0, 7(0x7)
90000000002011d0:	02daf2f7 	addi.d      	$s0, $s0, 1724(0x6bc)
    while(cons.e != cons.w &&
90000000002011d4:	02802818 	addi.w      	$s1, $zero, 10(0xa)
90000000002011d8:	5bff3dac 	beq         	$t1, $t0, -196(0x3ff3c)	# 9000000000201114 <consoleintr+0x48>
          cons.buf[(cons.e-1) % INPUT_BUF] != '\n'){
90000000002011dc:	02bffd8c 	addi.w      	$t0, $t0, -1(0xfff)
90000000002011e0:	0341fd8d 	andi        	$t1, $t0, 0x7f
90000000002011e4:	0010b6ed 	add.d       	$t1, $s0, $t1
    while(cons.e != cons.w &&
90000000002011e8:	280061ad 	ld.b        	$t1, $t1, 24(0x18)
90000000002011ec:	5bff29b8 	beq         	$t1, $s1, -216(0x3ff28)	# 9000000000201114 <consoleintr+0x48>
      cons.e--;
90000000002011f0:	298282ec 	st.w        	$t0, $s0, 160(0xa0)
      consputc(BACKSPACE);
90000000002011f4:	02840004 	addi.w      	$a0, $zero, 256(0x100)
90000000002011f8:	57fe8fff 	bl          	-372(0xffffe8c)	# 9000000000201084 <consputc>
    while(cons.e != cons.w &&
90000000002011fc:	2400a2ec 	ldptr.w     	$t0, $s0, 160(0xa0)
9000000000201200:	24009eed 	ldptr.w     	$t1, $s0, 156(0x9c)
9000000000201204:	5fffd9ac 	bne         	$t1, $t0, -40(0x3ffd8)	# 90000000002011dc <consoleintr+0x110>
9000000000201208:	53ff0fff 	b           	-244(0xfffff0c)	# 9000000000201114 <consoleintr+0x48>
    if(cons.e != cons.w){
900000000020120c:	1c0000ed 	pcaddu12i   	$t1, 7(0x7)
9000000000201210:	02d9f1ad 	addi.d      	$t1, $t1, 1660(0x67c)
9000000000201214:	2400a1ac 	ldptr.w     	$t0, $t1, 160(0xa0)
9000000000201218:	24009dad 	ldptr.w     	$t1, $t1, 156(0x9c)
900000000020121c:	5bfef9ac 	beq         	$t1, $t0, -264(0x3fef8)	# 9000000000201114 <consoleintr+0x48>
      cons.e--;
9000000000201220:	02bffd8c 	addi.w      	$t0, $t0, -1(0xfff)
9000000000201224:	1c0000ed 	pcaddu12i   	$t1, 7(0x7)
9000000000201228:	02d991ad 	addi.d      	$t1, $t1, 1636(0x664)
900000000020122c:	298281ac 	st.w        	$t0, $t1, 160(0xa0)
      consputc(BACKSPACE);
9000000000201230:	02840004 	addi.w      	$a0, $zero, 256(0x100)
9000000000201234:	57fe53ff 	bl          	-432(0xffffe50)	# 9000000000201084 <consputc>
9000000000201238:	53fedfff 	b           	-292(0xffffedc)	# 9000000000201114 <consoleintr+0x48>
    if(c != 0 && cons.e-cons.r < INPUT_BUF){
900000000020123c:	43fedaff 	beqz        	$s0, -296(0x7ffed8)	# 9000000000201114 <consoleintr+0x48>
9000000000201240:	53ff03ff 	b           	-256(0xfffff00)	# 9000000000201140 <consoleintr+0x74>
      consputc(c);
9000000000201244:	02802804 	addi.w      	$a0, $zero, 10(0xa)
9000000000201248:	57fe3fff 	bl          	-452(0xffffe3c)	# 9000000000201084 <consputc>
      cons.buf[cons.e++ % INPUT_BUF] = c;
900000000020124c:	1c0000ec 	pcaddu12i   	$t0, 7(0x7)
9000000000201250:	02d8f18c 	addi.d      	$t0, $t0, 1596(0x63c)
9000000000201254:	2400a18d 	ldptr.w     	$t1, $t0, 160(0xa0)
9000000000201258:	028005af 	addi.w      	$t3, $t1, 1(0x1)
900000000020125c:	028005ae 	addi.w      	$t2, $t1, 1(0x1)
9000000000201260:	2982818f 	st.w        	$t3, $t0, 160(0xa0)
9000000000201264:	0341fdad 	andi        	$t1, $t1, 0x7f
9000000000201268:	0010b58c 	add.d       	$t0, $t0, $t1
900000000020126c:	0280280d 	addi.w      	$t1, $zero, 10(0xa)
9000000000201270:	2900618d 	st.b        	$t1, $t0, 24(0x18)
        cons.w = cons.e;
9000000000201274:	1c0000e4 	pcaddu12i   	$a0, 7(0x7)
9000000000201278:	02d85084 	addi.d      	$a0, $a0, 1556(0x614)
900000000020127c:	2982708e 	st.w        	$t2, $a0, 156(0x9c)
        wakeup(&cons.r);
9000000000201280:	02c26084 	addi.d      	$a0, $a0, 152(0x98)
9000000000201284:	57f74bff 	bl          	-2232(0xffff748)	# 90000000002009cc <wakeup>
9000000000201288:	53fe8fff 	b           	-372(0xffffe8c)	# 9000000000201114 <consoleintr+0x48>

900000000020128c <consoleinit>:

void
consoleinit(void)
{
900000000020128c:	02ffc063 	addi.d      	$sp, $sp, -16(0xff0)
9000000000201290:	29c02061 	st.d        	$ra, $sp, 8(0x8)
9000000000201294:	27000076 	stptr.d     	$fp, $sp, 0
9000000000201298:	02c04076 	addi.d      	$fp, $sp, 16(0x10)
  initlock(&cons.lock, "cons");
900000000020129c:	1c000025 	pcaddu12i   	$a1, 1(0x1)
90000000002012a0:	02fb30a5 	addi.d      	$a1, $a1, -308(0xecc)
90000000002012a4:	1c0000e4 	pcaddu12i   	$a0, 7(0x7)
90000000002012a8:	02d79084 	addi.d      	$a0, $a0, 1508(0x5e4)
90000000002012ac:	57f8b3ff 	bl          	-1872(0xffff8b0)	# 9000000000200b5c <initlock>

  uartinit();
90000000002012b0:	57ee23ff 	bl          	-4576(0xfffee20)	# 90000000002000d0 <uartinit>

  // connect read and write system calls
  // to consoleread and consolewrite.
  devsw[CONSOLE].read = consoleread;
90000000002012b4:	1c00002c 	pcaddu12i   	$t0, 1(0x1)
90000000002012b8:	28fb918c 	ld.d        	$t0, $t0, -284(0xee4)
90000000002012bc:	1c00000d 	pcaddu12i   	$t1, 0
90000000002012c0:	02f6b1ad 	addi.d      	$t1, $t1, -596(0xdac)
90000000002012c4:	29c0418d 	st.d        	$t1, $t0, 16(0x10)
  devsw[CONSOLE].write = consolewrite;
90000000002012c8:	1c00000d 	pcaddu12i   	$t1, 0
90000000002012cc:	02f611ad 	addi.d      	$t1, $t1, -636(0xd84)
90000000002012d0:	29c0618d 	st.d        	$t1, $t0, 24(0x18)
}
90000000002012d4:	28c02061 	ld.d        	$ra, $sp, 8(0x8)
90000000002012d8:	26000076 	ldptr.d     	$fp, $sp, 0
90000000002012dc:	02c04063 	addi.d      	$sp, $sp, 16(0x10)
90000000002012e0:	4c000020 	jirl        	$zero, $ra, 0

90000000002012e4 <initsleeplock>:
#include "proc.h"
#include "sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
90000000002012e4:	02ff8063 	addi.d      	$sp, $sp, -32(0xfe0)
90000000002012e8:	29c06061 	st.d        	$ra, $sp, 24(0x18)
90000000002012ec:	29c04076 	st.d        	$fp, $sp, 16(0x10)
90000000002012f0:	29c02077 	st.d        	$s0, $sp, 8(0x8)
90000000002012f4:	27000078 	stptr.d     	$s1, $sp, 0
90000000002012f8:	02c08076 	addi.d      	$fp, $sp, 32(0x20)
90000000002012fc:	00150097 	move        	$s0, $a0
9000000000201300:	001500b8 	move        	$s1, $a1
  initlock(&lk->lk, "sleep lock");
9000000000201304:	1c000025 	pcaddu12i   	$a1, 1(0x1)
9000000000201308:	02f9b0a5 	addi.d      	$a1, $a1, -404(0xe6c)
900000000020130c:	02c02084 	addi.d      	$a0, $a0, 8(0x8)
9000000000201310:	57f84fff 	bl          	-1972(0xffff84c)	# 9000000000200b5c <initlock>
  lk->name = name;
9000000000201314:	29c082f8 	st.d        	$s1, $s0, 32(0x20)
  lk->locked = 0;
9000000000201318:	250002e0 	stptr.w     	$zero, $s0, 0
  lk->pid = 0;
900000000020131c:	2980a2e0 	st.w        	$zero, $s0, 40(0x28)
}
9000000000201320:	28c06061 	ld.d        	$ra, $sp, 24(0x18)
9000000000201324:	28c04076 	ld.d        	$fp, $sp, 16(0x10)
9000000000201328:	28c02077 	ld.d        	$s0, $sp, 8(0x8)
900000000020132c:	26000078 	ldptr.d     	$s1, $sp, 0
9000000000201330:	02c08063 	addi.d      	$sp, $sp, 32(0x20)
9000000000201334:	4c000020 	jirl        	$zero, $ra, 0

9000000000201338 <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
9000000000201338:	02ff8063 	addi.d      	$sp, $sp, -32(0xfe0)
900000000020133c:	29c06061 	st.d        	$ra, $sp, 24(0x18)
9000000000201340:	29c04076 	st.d        	$fp, $sp, 16(0x10)
9000000000201344:	29c02077 	st.d        	$s0, $sp, 8(0x8)
9000000000201348:	27000078 	stptr.d     	$s1, $sp, 0
900000000020134c:	02c08076 	addi.d      	$fp, $sp, 32(0x20)
9000000000201350:	00150097 	move        	$s0, $a0
  acquire(&lk->lk);
9000000000201354:	02c02098 	addi.d      	$s1, $a0, 8(0x8)
9000000000201358:	00150304 	move        	$a0, $s1
900000000020135c:	57f8d7ff 	bl          	-1836(0xffff8d4)	# 9000000000200c30 <acquire>
  while (lk->locked) {
9000000000201360:	240002ec 	ldptr.w     	$t0, $s0, 0
9000000000201364:	40001980 	beqz        	$t0, 24(0x18)	# 900000000020137c <acquiresleep+0x44>
    sleep(lk, &lk->lk);
9000000000201368:	00150305 	move        	$a1, $s1
900000000020136c:	001502e4 	move        	$a0, $s0
9000000000201370:	57f5e7ff 	bl          	-2588(0xffff5e4)	# 9000000000200954 <sleep>
  while (lk->locked) {
9000000000201374:	240002ec 	ldptr.w     	$t0, $s0, 0
9000000000201378:	47fff19f 	bnez        	$t0, -16(0x7ffff0)	# 9000000000201368 <acquiresleep+0x30>
  }
  lk->locked = 1;
900000000020137c:	0280040c 	addi.w      	$t0, $zero, 1(0x1)
9000000000201380:	250002ec 	stptr.w     	$t0, $s0, 0
  lk->pid = myproc()->pid;
9000000000201384:	57f46fff 	bl          	-2964(0xffff46c)	# 90000000002007f0 <myproc>
9000000000201388:	2400308c 	ldptr.w     	$t0, $a0, 48(0x30)
900000000020138c:	2980a2ec 	st.w        	$t0, $s0, 40(0x28)
  release(&lk->lk);
9000000000201390:	00150304 	move        	$a0, $s1
9000000000201394:	57f973ff 	bl          	-1680(0xffff970)	# 9000000000200d04 <release>
}
9000000000201398:	28c06061 	ld.d        	$ra, $sp, 24(0x18)
900000000020139c:	28c04076 	ld.d        	$fp, $sp, 16(0x10)
90000000002013a0:	28c02077 	ld.d        	$s0, $sp, 8(0x8)
90000000002013a4:	26000078 	ldptr.d     	$s1, $sp, 0
90000000002013a8:	02c08063 	addi.d      	$sp, $sp, 32(0x20)
90000000002013ac:	4c000020 	jirl        	$zero, $ra, 0

90000000002013b0 <releasesleep>:

void
releasesleep(struct sleeplock *lk)
{
90000000002013b0:	02ff8063 	addi.d      	$sp, $sp, -32(0xfe0)
90000000002013b4:	29c06061 	st.d        	$ra, $sp, 24(0x18)
90000000002013b8:	29c04076 	st.d        	$fp, $sp, 16(0x10)
90000000002013bc:	29c02077 	st.d        	$s0, $sp, 8(0x8)
90000000002013c0:	27000078 	stptr.d     	$s1, $sp, 0
90000000002013c4:	02c08076 	addi.d      	$fp, $sp, 32(0x20)
90000000002013c8:	00150097 	move        	$s0, $a0
  acquire(&lk->lk);
90000000002013cc:	02c02098 	addi.d      	$s1, $a0, 8(0x8)
90000000002013d0:	00150304 	move        	$a0, $s1
90000000002013d4:	57f85fff 	bl          	-1956(0xffff85c)	# 9000000000200c30 <acquire>
  lk->locked = 0;
90000000002013d8:	250002e0 	stptr.w     	$zero, $s0, 0
  lk->pid = 0;
90000000002013dc:	2980a2e0 	st.w        	$zero, $s0, 40(0x28)
  wakeup(lk);
90000000002013e0:	001502e4 	move        	$a0, $s0
90000000002013e4:	57f5ebff 	bl          	-2584(0xffff5e8)	# 90000000002009cc <wakeup>
  release(&lk->lk);
90000000002013e8:	00150304 	move        	$a0, $s1
90000000002013ec:	57f91bff 	bl          	-1768(0xffff918)	# 9000000000200d04 <release>
}
90000000002013f0:	28c06061 	ld.d        	$ra, $sp, 24(0x18)
90000000002013f4:	28c04076 	ld.d        	$fp, $sp, 16(0x10)
90000000002013f8:	28c02077 	ld.d        	$s0, $sp, 8(0x8)
90000000002013fc:	26000078 	ldptr.d     	$s1, $sp, 0
9000000000201400:	02c08063 	addi.d      	$sp, $sp, 32(0x20)
9000000000201404:	4c000020 	jirl        	$zero, $ra, 0

9000000000201408 <holdingsleep>:

int
holdingsleep(struct sleeplock *lk)
{
9000000000201408:	02ff4063 	addi.d      	$sp, $sp, -48(0xfd0)
900000000020140c:	29c0a061 	st.d        	$ra, $sp, 40(0x28)
9000000000201410:	29c08076 	st.d        	$fp, $sp, 32(0x20)
9000000000201414:	29c06077 	st.d        	$s0, $sp, 24(0x18)
9000000000201418:	29c04078 	st.d        	$s1, $sp, 16(0x10)
900000000020141c:	29c02079 	st.d        	$s2, $sp, 8(0x8)
9000000000201420:	02c0c076 	addi.d      	$fp, $sp, 48(0x30)
9000000000201424:	00150097 	move        	$s0, $a0
  int r;
  
  acquire(&lk->lk);
9000000000201428:	02c02098 	addi.d      	$s1, $a0, 8(0x8)
900000000020142c:	00150304 	move        	$a0, $s1
9000000000201430:	57f803ff 	bl          	-2048(0xffff800)	# 9000000000200c30 <acquire>
  r = lk->locked && (lk->pid == myproc()->pid);
9000000000201434:	240002ec 	ldptr.w     	$t0, $s0, 0
9000000000201438:	44003180 	bnez        	$t0, 48(0x30)	# 9000000000201468 <holdingsleep+0x60>
900000000020143c:	00150017 	move        	$s0, $zero
  release(&lk->lk);
9000000000201440:	00150304 	move        	$a0, $s1
9000000000201444:	57f8c3ff 	bl          	-1856(0xffff8c0)	# 9000000000200d04 <release>
  return r;
9000000000201448:	001502e4 	move        	$a0, $s0
900000000020144c:	28c0a061 	ld.d        	$ra, $sp, 40(0x28)
9000000000201450:	28c08076 	ld.d        	$fp, $sp, 32(0x20)
9000000000201454:	28c06077 	ld.d        	$s0, $sp, 24(0x18)
9000000000201458:	28c04078 	ld.d        	$s1, $sp, 16(0x10)
900000000020145c:	28c02079 	ld.d        	$s2, $sp, 8(0x8)
9000000000201460:	02c0c063 	addi.d      	$sp, $sp, 48(0x30)
9000000000201464:	4c000020 	jirl        	$zero, $ra, 0
  r = lk->locked && (lk->pid == myproc()->pid);
9000000000201468:	24002af9 	ldptr.w     	$s2, $s0, 40(0x28)
900000000020146c:	57f387ff 	bl          	-3196(0xffff384)	# 90000000002007f0 <myproc>
9000000000201470:	24003097 	ldptr.w     	$s0, $a0, 48(0x30)
9000000000201474:	0015e6f7 	xor         	$s0, $s0, $s2
9000000000201478:	024006f7 	sltui       	$s0, $s0, 1(0x1)
900000000020147c:	53ffc7ff 	b           	-60(0xfffffc4)	# 9000000000201440 <holdingsleep+0x38>
	...
