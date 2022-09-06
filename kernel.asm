
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00006117          	auipc	sp,0x6
    80000004:	99013103          	ld	sp,-1648(sp) # 80005990 <_GLOBAL_OFFSET_TABLE_+0x28>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	0e0020ef          	jal	ra,800020fc <start>

0000000080000020 <spin>:
    80000020:	0000006f          	j	80000020 <spin>
	...

0000000080001000 <_ZN5Riscv14supervisorTrapEv>:
.align 4
.global _ZN5Riscv14supervisorTrapEv
.type _ZN5Riscv14supervisorTrapEv, @function
_ZN5Riscv14supervisorTrapEv:
    # push all registers to stack
    addi sp, sp, -256
    80001000:	f0010113          	addi	sp,sp,-256
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    80001004:	00013023          	sd	zero,0(sp)
    80001008:	00113423          	sd	ra,8(sp)
    8000100c:	00213823          	sd	sp,16(sp)
    80001010:	00313c23          	sd	gp,24(sp)
    80001014:	02413023          	sd	tp,32(sp)
    80001018:	02513423          	sd	t0,40(sp)
    8000101c:	02613823          	sd	t1,48(sp)
    80001020:	02713c23          	sd	t2,56(sp)
    80001024:	04813023          	sd	s0,64(sp)
    80001028:	04913423          	sd	s1,72(sp)
    8000102c:	04a13823          	sd	a0,80(sp)
    80001030:	04b13c23          	sd	a1,88(sp)
    80001034:	06c13023          	sd	a2,96(sp)
    80001038:	06d13423          	sd	a3,104(sp)
    8000103c:	06e13823          	sd	a4,112(sp)
    80001040:	06f13c23          	sd	a5,120(sp)
    80001044:	09013023          	sd	a6,128(sp)
    80001048:	09113423          	sd	a7,136(sp)
    8000104c:	09213823          	sd	s2,144(sp)
    80001050:	09313c23          	sd	s3,152(sp)
    80001054:	0b413023          	sd	s4,160(sp)
    80001058:	0b513423          	sd	s5,168(sp)
    8000105c:	0b613823          	sd	s6,176(sp)
    80001060:	0b713c23          	sd	s7,184(sp)
    80001064:	0d813023          	sd	s8,192(sp)
    80001068:	0d913423          	sd	s9,200(sp)
    8000106c:	0da13823          	sd	s10,208(sp)
    80001070:	0db13c23          	sd	s11,216(sp)
    80001074:	0fc13023          	sd	t3,224(sp)
    80001078:	0fd13423          	sd	t4,232(sp)
    8000107c:	0fe13823          	sd	t5,240(sp)
    80001080:	0ff13c23          	sd	t6,248(sp)

    call _ZN5Riscv20handleSupervisorTrapEv
    80001084:	3d1000ef          	jal	ra,80001c54 <_ZN5Riscv20handleSupervisorTrapEv>

    #provera da li je bio ecall, jer ako jeste povratna vrednost koja je zapisana u a0 ce biti izmenjena
    csrr t0, scause
    80001088:	142022f3          	csrr	t0,scause
    addi t0, t0, -8
    8000108c:	ff828293          	addi	t0,t0,-8
    beqz t0, anula
    80001090:	00028663          	beqz	t0,8000109c <anula>
    addi t0, t0, -1
    80001094:	fff28293          	addi	t0,t0,-1
    bnez t0, popregs
    80001098:	00029463          	bnez	t0,800010a0 <popregs>

000000008000109c <anula>:
anula:
    sd a0, 80(sp)
    8000109c:	04a13823          	sd	a0,80(sp)

00000000800010a0 <popregs>:
popregs:
    # pop all registers from stack
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    800010a0:	00013003          	ld	zero,0(sp)
    800010a4:	00813083          	ld	ra,8(sp)
    800010a8:	01013103          	ld	sp,16(sp)
    800010ac:	01813183          	ld	gp,24(sp)
    800010b0:	02013203          	ld	tp,32(sp)
    800010b4:	02813283          	ld	t0,40(sp)
    800010b8:	03013303          	ld	t1,48(sp)
    800010bc:	03813383          	ld	t2,56(sp)
    800010c0:	04013403          	ld	s0,64(sp)
    800010c4:	04813483          	ld	s1,72(sp)
    800010c8:	05013503          	ld	a0,80(sp)
    800010cc:	05813583          	ld	a1,88(sp)
    800010d0:	06013603          	ld	a2,96(sp)
    800010d4:	06813683          	ld	a3,104(sp)
    800010d8:	07013703          	ld	a4,112(sp)
    800010dc:	07813783          	ld	a5,120(sp)
    800010e0:	08013803          	ld	a6,128(sp)
    800010e4:	08813883          	ld	a7,136(sp)
    800010e8:	09013903          	ld	s2,144(sp)
    800010ec:	09813983          	ld	s3,152(sp)
    800010f0:	0a013a03          	ld	s4,160(sp)
    800010f4:	0a813a83          	ld	s5,168(sp)
    800010f8:	0b013b03          	ld	s6,176(sp)
    800010fc:	0b813b83          	ld	s7,184(sp)
    80001100:	0c013c03          	ld	s8,192(sp)
    80001104:	0c813c83          	ld	s9,200(sp)
    80001108:	0d013d03          	ld	s10,208(sp)
    8000110c:	0d813d83          	ld	s11,216(sp)
    80001110:	0e013e03          	ld	t3,224(sp)
    80001114:	0e813e83          	ld	t4,232(sp)
    80001118:	0f013f03          	ld	t5,240(sp)
    8000111c:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    80001120:	10010113          	addi	sp,sp,256

    sret
    80001124:	10200073          	sret
	...

0000000080001130 <_ZN7_thread13contextSwitchEPNS_7ContextES1_>:
.global _ZN7_thread13contextSwitchEPNS_7ContextES1_
.type _ZN7_thread13contextSwitchEPNS_7ContextES1_, @function
_ZN7_thread13contextSwitchEPNS_7ContextES1_:
    sd ra, 0 * 8(a0)
    80001130:	00153023          	sd	ra,0(a0) # 1000 <_entry-0x7ffff000>
    sd sp, 1 * 8(a0)
    80001134:	00253423          	sd	sp,8(a0)

    ld ra, 0 * 8(a1)
    80001138:	0005b083          	ld	ra,0(a1)
    ld sp, 1 * 8(a1)
    8000113c:	0085b103          	ld	sp,8(a1)

    80001140:	00008067          	ret

0000000080001144 <_Z7syscallv>:
#include "../h/syscall_c.h"
#include "../h/syscall_codes.h"
#include "../h/print.hpp"
#include "../h/tcb.hpp"

void syscall(){
    80001144:	ff010113          	addi	sp,sp,-16
    80001148:	00813423          	sd	s0,8(sp)
    8000114c:	01010413          	addi	s0,sp,16
    __asm__ volatile("ecall");
    80001150:	00000073          	ecall
}
    80001154:	00813403          	ld	s0,8(sp)
    80001158:	01010113          	addi	sp,sp,16
    8000115c:	00008067          	ret

0000000080001160 <_Z7setArgsv>:

void setArgs(){
    80001160:	ff010113          	addi	sp,sp,-16
    80001164:	00813423          	sd	s0,8(sp)
    80001168:	01010413          	addi	s0,sp,16

}
    8000116c:	00813403          	ld	s0,8(sp)
    80001170:	01010113          	addi	sp,sp,16
    80001174:	00008067          	ret

0000000080001178 <_Z9mem_allocm>:

//pakovanje poziva sa argumentima

void* mem_alloc(size_t size){
    80001178:	fe010113          	addi	sp,sp,-32
    8000117c:	00813c23          	sd	s0,24(sp)
    80001180:	02010413          	addi	s0,sp,32
    uint64 volatile blocksNum;
    if(size % MEM_BLOCK_SIZE != 0) {
    80001184:	03f57793          	andi	a5,a0,63
    80001188:	02078a63          	beqz	a5,800011bc <_Z9mem_allocm+0x44>
        blocksNum = size / MEM_BLOCK_SIZE + 1;
    8000118c:	00655513          	srli	a0,a0,0x6
    80001190:	00150513          	addi	a0,a0,1
    80001194:	fea43423          	sd	a0,-24(s0)
    }
    else {
        blocksNum = size / MEM_BLOCK_SIZE;
    }
    __asm__ volatile("mv a0, %0" : : "r" (MEM_ALLOC));
    80001198:	00100793          	li	a5,1
    8000119c:	00078513          	mv	a0,a5
    __asm__ volatile("mv a1, %0" : : "r" (blocksNum));
    800011a0:	fe843783          	ld	a5,-24(s0)
    800011a4:	00078593          	mv	a1,a5
    __asm__ volatile("ecall");
    800011a8:	00000073          	ecall
    //poziv za blockNum
    void* ret;
    __asm__ volatile("mv %0, a0" : "=r" (ret));
    800011ac:	00050513          	mv	a0,a0
//    printString("povratak iz prekidne rutine\n");
//    printInteger((uint64)ret);
    return (void*)ret;
}
    800011b0:	01813403          	ld	s0,24(sp)
    800011b4:	02010113          	addi	sp,sp,32
    800011b8:	00008067          	ret
        blocksNum = size / MEM_BLOCK_SIZE;
    800011bc:	00655513          	srli	a0,a0,0x6
    800011c0:	fea43423          	sd	a0,-24(s0)
    800011c4:	fd5ff06f          	j	80001198 <_Z9mem_allocm+0x20>

00000000800011c8 <_Z8mem_freePv>:

int mem_free(void *p){
    800011c8:	ff010113          	addi	sp,sp,-16
    800011cc:	00813423          	sd	s0,8(sp)
    800011d0:	01010413          	addi	s0,sp,16
    //prvo cu upisati p u a1, jer ako stavim prvo da se upise vrednost u a0 promenicu i argumen p
    //jer je preko njega poslat argument f-je
    __asm__ volatile("mv a1, %0" : : "r" (p));
    800011d4:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %0" : : "r" (MEM_FREE));
    800011d8:	00200793          	li	a5,2
    800011dc:	00078513          	mv	a0,a5

    __asm__ volatile("ecall");
    800011e0:	00000073          	ecall
    uint64 ret;
    __asm__ volatile("mv %0, a0" : "=r" (ret));
    800011e4:	00050513          	mv	a0,a0
    return ret;
}
    800011e8:	0005051b          	sext.w	a0,a0
    800011ec:	00813403          	ld	s0,8(sp)
    800011f0:	01010113          	addi	sp,sp,16
    800011f4:	00008067          	ret

00000000800011f8 <_Z13thread_createPP7_threadPFvPvES2_>:

int thread_create( thread_t* handle,
                   void(*start_routine)(void*),
                   void *arg
                   ){
    800011f8:	fc010113          	addi	sp,sp,-64
    800011fc:	02113c23          	sd	ra,56(sp)
    80001200:	02813823          	sd	s0,48(sp)
    80001204:	02913423          	sd	s1,40(sp)
    80001208:	03213023          	sd	s2,32(sp)
    8000120c:	01313c23          	sd	s3,24(sp)
    80001210:	04010413          	addi	s0,sp,64
    80001214:	00050993          	mv	s3,a0
    80001218:	00058913          	mv	s2,a1
    8000121c:	00060493          	mv	s1,a2
    //za ABI poziv mora se dodati i argument za stek

    void* volatile stack = new uint64[1024];
    80001220:	00002537          	lui	a0,0x2
    80001224:	00001097          	auipc	ra,0x1
    80001228:	998080e7          	jalr	-1640(ra) # 80001bbc <_Znam>
    8000122c:	fca43423          	sd	a0,-56(s0)
    printInteger((uint64)stack);
    80001230:	fc843503          	ld	a0,-56(s0)
    80001234:	00001097          	auipc	ra,0x1
    80001238:	e0c080e7          	jalr	-500(ra) # 80002040 <_Z12printIntegerm>
    if(stack != nullptr) {
    8000123c:	fc843783          	ld	a5,-56(s0)
    80001240:	04078463          	beqz	a5,80001288 <_Z13thread_createPP7_threadPFvPvES2_+0x90>
        __asm__ volatile("mv a0, %0" : : "r" (THREAD_CREATE));
    80001244:	01100793          	li	a5,17
    80001248:	00078513          	mv	a0,a5
        __asm__ volatile("mv a1, %0" : : "r" (handle));
    8000124c:	00098593          	mv	a1,s3
        __asm__ volatile("mv a2, %0" : : "r" (start_routine));
    80001250:	00090613          	mv	a2,s2
        __asm__ volatile("mv a3, %0" : : "r" (arg));
    80001254:	00048693          	mv	a3,s1
        __asm__ volatile("mv a4, %0" : : "r" (stack));
    80001258:	fc843783          	ld	a5,-56(s0)
    8000125c:	00078713          	mv	a4,a5
        __asm__ volatile("ecall");
    80001260:	00000073          	ecall

        uint64 ret;
        __asm__ volatile("mv %0, a0" : "=r" (ret));
    80001264:	00050513          	mv	a0,a0
        return ret;
    80001268:	0005051b          	sext.w	a0,a0

    } else{
        return -2;
    }
}
    8000126c:	03813083          	ld	ra,56(sp)
    80001270:	03013403          	ld	s0,48(sp)
    80001274:	02813483          	ld	s1,40(sp)
    80001278:	02013903          	ld	s2,32(sp)
    8000127c:	01813983          	ld	s3,24(sp)
    80001280:	04010113          	addi	sp,sp,64
    80001284:	00008067          	ret
        return -2;
    80001288:	ffe00513          	li	a0,-2
    8000128c:	fe1ff06f          	j	8000126c <_Z13thread_createPP7_threadPFvPvES2_+0x74>

0000000080001290 <_Z11thread_exitv>:

int thread_exit(){
    80001290:	ff010113          	addi	sp,sp,-16
    80001294:	00813423          	sd	s0,8(sp)
    80001298:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a0, %0" : : "r" (THREAD_EXIT));
    8000129c:	01200793          	li	a5,18
    800012a0:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    800012a4:	00000073          	ecall
    uint64 ret;
    __asm__ volatile("mv %0, a0" : "=r" (ret));
    800012a8:	00050513          	mv	a0,a0
    return ret;
}
    800012ac:	0005051b          	sext.w	a0,a0
    800012b0:	00813403          	ld	s0,8(sp)
    800012b4:	01010113          	addi	sp,sp,16
    800012b8:	00008067          	ret

00000000800012bc <_ZL9fibonaccim>:
        }
    }
}

static uint64 fibonacci(uint64 n)
{
    800012bc:	fe010113          	addi	sp,sp,-32
    800012c0:	00113c23          	sd	ra,24(sp)
    800012c4:	00813823          	sd	s0,16(sp)
    800012c8:	00913423          	sd	s1,8(sp)
    800012cc:	01213023          	sd	s2,0(sp)
    800012d0:	02010413          	addi	s0,sp,32
    800012d4:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    800012d8:	00100793          	li	a5,1
    800012dc:	02a7f863          	bgeu	a5,a0,8000130c <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { _thread::yield(); }
    800012e0:	00a00793          	li	a5,10
    800012e4:	02f577b3          	remu	a5,a0,a5
    800012e8:	02078e63          	beqz	a5,80001324 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    800012ec:	fff48513          	addi	a0,s1,-1
    800012f0:	00000097          	auipc	ra,0x0
    800012f4:	fcc080e7          	jalr	-52(ra) # 800012bc <_ZL9fibonaccim>
    800012f8:	00050913          	mv	s2,a0
    800012fc:	ffe48513          	addi	a0,s1,-2
    80001300:	00000097          	auipc	ra,0x0
    80001304:	fbc080e7          	jalr	-68(ra) # 800012bc <_ZL9fibonaccim>
    80001308:	00a90533          	add	a0,s2,a0
}
    8000130c:	01813083          	ld	ra,24(sp)
    80001310:	01013403          	ld	s0,16(sp)
    80001314:	00813483          	ld	s1,8(sp)
    80001318:	00013903          	ld	s2,0(sp)
    8000131c:	02010113          	addi	sp,sp,32
    80001320:	00008067          	ret
    if (n % 10 == 0) { _thread::yield(); }
    80001324:	00000097          	auipc	ra,0x0
    80001328:	758080e7          	jalr	1880(ra) # 80001a7c <_ZN7_thread5yieldEv>
    8000132c:	fc1ff06f          	j	800012ec <_ZL9fibonaccim+0x30>

0000000080001330 <_Z11workerBodyAv>:
{
    80001330:	fe010113          	addi	sp,sp,-32
    80001334:	00113c23          	sd	ra,24(sp)
    80001338:	00813823          	sd	s0,16(sp)
    8000133c:	00913423          	sd	s1,8(sp)
    80001340:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++)
    80001344:	00000493          	li	s1,0
    80001348:	0300006f          	j	80001378 <_Z11workerBodyAv+0x48>
        for (uint64 j = 0; j < 10000; j++)
    8000134c:	00168693          	addi	a3,a3,1
    80001350:	000027b7          	lui	a5,0x2
    80001354:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80001358:	00d7ee63          	bltu	a5,a3,80001374 <_Z11workerBodyAv+0x44>
            for (uint64 k = 0; k < 30000; k++)
    8000135c:	00000713          	li	a4,0
    80001360:	000077b7          	lui	a5,0x7
    80001364:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80001368:	fee7e2e3          	bltu	a5,a4,8000134c <_Z11workerBodyAv+0x1c>
    8000136c:	00170713          	addi	a4,a4,1
    80001370:	ff1ff06f          	j	80001360 <_Z11workerBodyAv+0x30>
    for (uint64 i = 0; i < 10; i++)
    80001374:	00148493          	addi	s1,s1,1
    80001378:	00900793          	li	a5,9
    8000137c:	0297ec63          	bltu	a5,s1,800013b4 <_Z11workerBodyAv+0x84>
        printString("A: i=");
    80001380:	00004517          	auipc	a0,0x4
    80001384:	c8050513          	addi	a0,a0,-896 # 80005000 <kvmincrease+0xb00>
    80001388:	00001097          	auipc	ra,0x1
    8000138c:	c48080e7          	jalr	-952(ra) # 80001fd0 <_Z11printStringPKc>
        printInteger(i);
    80001390:	00048513          	mv	a0,s1
    80001394:	00001097          	auipc	ra,0x1
    80001398:	cac080e7          	jalr	-852(ra) # 80002040 <_Z12printIntegerm>
        printString("\n");
    8000139c:	00004517          	auipc	a0,0x4
    800013a0:	d9450513          	addi	a0,a0,-620 # 80005130 <kvmincrease+0xc30>
    800013a4:	00001097          	auipc	ra,0x1
    800013a8:	c2c080e7          	jalr	-980(ra) # 80001fd0 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++)
    800013ac:	00000693          	li	a3,0
    800013b0:	fa1ff06f          	j	80001350 <_Z11workerBodyAv+0x20>
    void* p = mem_alloc(4096);
    800013b4:	00001537          	lui	a0,0x1
    800013b8:	00000097          	auipc	ra,0x0
    800013bc:	dc0080e7          	jalr	-576(ra) # 80001178 <_Z9mem_allocm>
    800013c0:	00050493          	mv	s1,a0
    printString("stigao do dealokacije\n");
    800013c4:	00004517          	auipc	a0,0x4
    800013c8:	c4450513          	addi	a0,a0,-956 # 80005008 <kvmincrease+0xb08>
    800013cc:	00001097          	auipc	ra,0x1
    800013d0:	c04080e7          	jalr	-1020(ra) # 80001fd0 <_Z11printStringPKc>
    printInteger((uint64)p);
    800013d4:	00048513          	mv	a0,s1
    800013d8:	00001097          	auipc	ra,0x1
    800013dc:	c68080e7          	jalr	-920(ra) # 80002040 <_Z12printIntegerm>
    if(mem_free(p) == 0)
    800013e0:	00048513          	mv	a0,s1
    800013e4:	00000097          	auipc	ra,0x0
    800013e8:	de4080e7          	jalr	-540(ra) # 800011c8 <_Z8mem_freePv>
    800013ec:	02051463          	bnez	a0,80001414 <_Z11workerBodyAv+0xe4>
        printString("USPESNO OSLOBODJENA MEMORIJA!");
    800013f0:	00004517          	auipc	a0,0x4
    800013f4:	c3050513          	addi	a0,a0,-976 # 80005020 <kvmincrease+0xb20>
    800013f8:	00001097          	auipc	ra,0x1
    800013fc:	bd8080e7          	jalr	-1064(ra) # 80001fd0 <_Z11printStringPKc>
}
    80001400:	01813083          	ld	ra,24(sp)
    80001404:	01013403          	ld	s0,16(sp)
    80001408:	00813483          	ld	s1,8(sp)
    8000140c:	02010113          	addi	sp,sp,32
    80001410:	00008067          	ret
        printString("NEUSPESNO OSLOBODJENA MEMORIJA");
    80001414:	00004517          	auipc	a0,0x4
    80001418:	c2c50513          	addi	a0,a0,-980 # 80005040 <kvmincrease+0xb40>
    8000141c:	00001097          	auipc	ra,0x1
    80001420:	bb4080e7          	jalr	-1100(ra) # 80001fd0 <_Z11printStringPKc>
}
    80001424:	fddff06f          	j	80001400 <_Z11workerBodyAv+0xd0>

0000000080001428 <_Z11workerBodyBv>:
{
    80001428:	fe010113          	addi	sp,sp,-32
    8000142c:	00113c23          	sd	ra,24(sp)
    80001430:	00813823          	sd	s0,16(sp)
    80001434:	00913423          	sd	s1,8(sp)
    80001438:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++)
    8000143c:	00000493          	li	s1,0
    80001440:	0300006f          	j	80001470 <_Z11workerBodyBv+0x48>
        for (uint64 j = 0; j < 10000; j++)
    80001444:	00168693          	addi	a3,a3,1
    80001448:	000027b7          	lui	a5,0x2
    8000144c:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80001450:	00d7ee63          	bltu	a5,a3,8000146c <_Z11workerBodyBv+0x44>
            for (uint64 k = 0; k < 30000; k++)
    80001454:	00000713          	li	a4,0
    80001458:	000077b7          	lui	a5,0x7
    8000145c:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80001460:	fee7e2e3          	bltu	a5,a4,80001444 <_Z11workerBodyBv+0x1c>
    80001464:	00170713          	addi	a4,a4,1
    80001468:	ff1ff06f          	j	80001458 <_Z11workerBodyBv+0x30>
    for (uint64 i = 0; i < 16; i++)
    8000146c:	00148493          	addi	s1,s1,1
    80001470:	00f00793          	li	a5,15
    80001474:	0297ec63          	bltu	a5,s1,800014ac <_Z11workerBodyBv+0x84>
        printString("B: i=");
    80001478:	00004517          	auipc	a0,0x4
    8000147c:	be850513          	addi	a0,a0,-1048 # 80005060 <kvmincrease+0xb60>
    80001480:	00001097          	auipc	ra,0x1
    80001484:	b50080e7          	jalr	-1200(ra) # 80001fd0 <_Z11printStringPKc>
        printInteger(i);
    80001488:	00048513          	mv	a0,s1
    8000148c:	00001097          	auipc	ra,0x1
    80001490:	bb4080e7          	jalr	-1100(ra) # 80002040 <_Z12printIntegerm>
        printString("\n");
    80001494:	00004517          	auipc	a0,0x4
    80001498:	c9c50513          	addi	a0,a0,-868 # 80005130 <kvmincrease+0xc30>
    8000149c:	00001097          	auipc	ra,0x1
    800014a0:	b34080e7          	jalr	-1228(ra) # 80001fd0 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++)
    800014a4:	00000693          	li	a3,0
    800014a8:	fa1ff06f          	j	80001448 <_Z11workerBodyBv+0x20>
}
    800014ac:	01813083          	ld	ra,24(sp)
    800014b0:	01013403          	ld	s0,16(sp)
    800014b4:	00813483          	ld	s1,8(sp)
    800014b8:	02010113          	addi	sp,sp,32
    800014bc:	00008067          	ret

00000000800014c0 <_Z11workerBodyCv>:

void workerBodyC()
{
    800014c0:	fe010113          	addi	sp,sp,-32
    800014c4:	00113c23          	sd	ra,24(sp)
    800014c8:	00813823          	sd	s0,16(sp)
    800014cc:	00913423          	sd	s1,8(sp)
    800014d0:	01213023          	sd	s2,0(sp)
    800014d4:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    800014d8:	00000493          	li	s1,0
    800014dc:	0380006f          	j	80001514 <_Z11workerBodyCv+0x54>
    for (; i < 3; i++)
    {
        printString("C: i=");
    800014e0:	00004517          	auipc	a0,0x4
    800014e4:	b8850513          	addi	a0,a0,-1144 # 80005068 <kvmincrease+0xb68>
    800014e8:	00001097          	auipc	ra,0x1
    800014ec:	ae8080e7          	jalr	-1304(ra) # 80001fd0 <_Z11printStringPKc>
        printInteger(i);
    800014f0:	00048513          	mv	a0,s1
    800014f4:	00001097          	auipc	ra,0x1
    800014f8:	b4c080e7          	jalr	-1204(ra) # 80002040 <_Z12printIntegerm>
        printString("\n");
    800014fc:	00004517          	auipc	a0,0x4
    80001500:	c3450513          	addi	a0,a0,-972 # 80005130 <kvmincrease+0xc30>
    80001504:	00001097          	auipc	ra,0x1
    80001508:	acc080e7          	jalr	-1332(ra) # 80001fd0 <_Z11printStringPKc>
    for (; i < 3; i++)
    8000150c:	0014849b          	addiw	s1,s1,1
    80001510:	0ff4f493          	andi	s1,s1,255
    80001514:	00200793          	li	a5,2
    80001518:	fc97f4e3          	bgeu	a5,s1,800014e0 <_Z11workerBodyCv+0x20>
    }

    printString("C: yield\n");
    8000151c:	00004517          	auipc	a0,0x4
    80001520:	b5450513          	addi	a0,a0,-1196 # 80005070 <kvmincrease+0xb70>
    80001524:	00001097          	auipc	ra,0x1
    80001528:	aac080e7          	jalr	-1364(ra) # 80001fd0 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    8000152c:	00700313          	li	t1,7
    _thread::yield();
    80001530:	00000097          	auipc	ra,0x0
    80001534:	54c080e7          	jalr	1356(ra) # 80001a7c <_ZN7_thread5yieldEv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80001538:	00030913          	mv	s2,t1

    printString("C: t1=");
    8000153c:	00004517          	auipc	a0,0x4
    80001540:	b4450513          	addi	a0,a0,-1212 # 80005080 <kvmincrease+0xb80>
    80001544:	00001097          	auipc	ra,0x1
    80001548:	a8c080e7          	jalr	-1396(ra) # 80001fd0 <_Z11printStringPKc>
    printInteger(t1);
    8000154c:	00090513          	mv	a0,s2
    80001550:	00001097          	auipc	ra,0x1
    80001554:	af0080e7          	jalr	-1296(ra) # 80002040 <_Z12printIntegerm>
    printString("\n");
    80001558:	00004517          	auipc	a0,0x4
    8000155c:	bd850513          	addi	a0,a0,-1064 # 80005130 <kvmincrease+0xc30>
    80001560:	00001097          	auipc	ra,0x1
    80001564:	a70080e7          	jalr	-1424(ra) # 80001fd0 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    80001568:	00c00513          	li	a0,12
    8000156c:	00000097          	auipc	ra,0x0
    80001570:	d50080e7          	jalr	-688(ra) # 800012bc <_ZL9fibonaccim>
    80001574:	00050913          	mv	s2,a0
    printString("C: fibonaci=");
    80001578:	00004517          	auipc	a0,0x4
    8000157c:	b1050513          	addi	a0,a0,-1264 # 80005088 <kvmincrease+0xb88>
    80001580:	00001097          	auipc	ra,0x1
    80001584:	a50080e7          	jalr	-1456(ra) # 80001fd0 <_Z11printStringPKc>
    printInteger(result);
    80001588:	00090513          	mv	a0,s2
    8000158c:	00001097          	auipc	ra,0x1
    80001590:	ab4080e7          	jalr	-1356(ra) # 80002040 <_Z12printIntegerm>
    printString("\n");
    80001594:	00004517          	auipc	a0,0x4
    80001598:	b9c50513          	addi	a0,a0,-1124 # 80005130 <kvmincrease+0xc30>
    8000159c:	00001097          	auipc	ra,0x1
    800015a0:	a34080e7          	jalr	-1484(ra) # 80001fd0 <_Z11printStringPKc>
    800015a4:	0380006f          	j	800015dc <_Z11workerBodyCv+0x11c>

    for (; i < 6; i++)
    {
        printString("C: i=");
    800015a8:	00004517          	auipc	a0,0x4
    800015ac:	ac050513          	addi	a0,a0,-1344 # 80005068 <kvmincrease+0xb68>
    800015b0:	00001097          	auipc	ra,0x1
    800015b4:	a20080e7          	jalr	-1504(ra) # 80001fd0 <_Z11printStringPKc>
        printInteger(i);
    800015b8:	00048513          	mv	a0,s1
    800015bc:	00001097          	auipc	ra,0x1
    800015c0:	a84080e7          	jalr	-1404(ra) # 80002040 <_Z12printIntegerm>
        printString("\n");
    800015c4:	00004517          	auipc	a0,0x4
    800015c8:	b6c50513          	addi	a0,a0,-1172 # 80005130 <kvmincrease+0xc30>
    800015cc:	00001097          	auipc	ra,0x1
    800015d0:	a04080e7          	jalr	-1532(ra) # 80001fd0 <_Z11printStringPKc>
    for (; i < 6; i++)
    800015d4:	0014849b          	addiw	s1,s1,1
    800015d8:	0ff4f493          	andi	s1,s1,255
    800015dc:	00500793          	li	a5,5
    800015e0:	fc97f4e3          	bgeu	a5,s1,800015a8 <_Z11workerBodyCv+0xe8>
    }
//    _thread::yield();
}
    800015e4:	01813083          	ld	ra,24(sp)
    800015e8:	01013403          	ld	s0,16(sp)
    800015ec:	00813483          	ld	s1,8(sp)
    800015f0:	00013903          	ld	s2,0(sp)
    800015f4:	02010113          	addi	sp,sp,32
    800015f8:	00008067          	ret

00000000800015fc <_Z11workerBodyDv>:

void workerBodyD()
{
    800015fc:	fe010113          	addi	sp,sp,-32
    80001600:	00113c23          	sd	ra,24(sp)
    80001604:	00813823          	sd	s0,16(sp)
    80001608:	00913423          	sd	s1,8(sp)
    8000160c:	01213023          	sd	s2,0(sp)
    80001610:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80001614:	00a00493          	li	s1,10
    80001618:	0380006f          	j	80001650 <_Z11workerBodyDv+0x54>
    for (; i < 13; i++)
    {
        printString("D: i=");
    8000161c:	00004517          	auipc	a0,0x4
    80001620:	a7c50513          	addi	a0,a0,-1412 # 80005098 <kvmincrease+0xb98>
    80001624:	00001097          	auipc	ra,0x1
    80001628:	9ac080e7          	jalr	-1620(ra) # 80001fd0 <_Z11printStringPKc>
        printInteger(i);
    8000162c:	00048513          	mv	a0,s1
    80001630:	00001097          	auipc	ra,0x1
    80001634:	a10080e7          	jalr	-1520(ra) # 80002040 <_Z12printIntegerm>
        printString("\n");
    80001638:	00004517          	auipc	a0,0x4
    8000163c:	af850513          	addi	a0,a0,-1288 # 80005130 <kvmincrease+0xc30>
    80001640:	00001097          	auipc	ra,0x1
    80001644:	990080e7          	jalr	-1648(ra) # 80001fd0 <_Z11printStringPKc>
    for (; i < 13; i++)
    80001648:	0014849b          	addiw	s1,s1,1
    8000164c:	0ff4f493          	andi	s1,s1,255
    80001650:	00c00793          	li	a5,12
    80001654:	fc97f4e3          	bgeu	a5,s1,8000161c <_Z11workerBodyDv+0x20>
    }

    printString("D: yield\n");
    80001658:	00004517          	auipc	a0,0x4
    8000165c:	a4850513          	addi	a0,a0,-1464 # 800050a0 <kvmincrease+0xba0>
    80001660:	00001097          	auipc	ra,0x1
    80001664:	970080e7          	jalr	-1680(ra) # 80001fd0 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80001668:	00500313          	li	t1,5
    _thread::yield();
    8000166c:	00000097          	auipc	ra,0x0
    80001670:	410080e7          	jalr	1040(ra) # 80001a7c <_ZN7_thread5yieldEv>

    uint64 result = fibonacci(16);
    80001674:	01000513          	li	a0,16
    80001678:	00000097          	auipc	ra,0x0
    8000167c:	c44080e7          	jalr	-956(ra) # 800012bc <_ZL9fibonaccim>
    80001680:	00050913          	mv	s2,a0
    printString("D: fibonaci=");
    80001684:	00004517          	auipc	a0,0x4
    80001688:	a2c50513          	addi	a0,a0,-1492 # 800050b0 <kvmincrease+0xbb0>
    8000168c:	00001097          	auipc	ra,0x1
    80001690:	944080e7          	jalr	-1724(ra) # 80001fd0 <_Z11printStringPKc>
    printInteger(result);
    80001694:	00090513          	mv	a0,s2
    80001698:	00001097          	auipc	ra,0x1
    8000169c:	9a8080e7          	jalr	-1624(ra) # 80002040 <_Z12printIntegerm>
    printString("\n");
    800016a0:	00004517          	auipc	a0,0x4
    800016a4:	a9050513          	addi	a0,a0,-1392 # 80005130 <kvmincrease+0xc30>
    800016a8:	00001097          	auipc	ra,0x1
    800016ac:	928080e7          	jalr	-1752(ra) # 80001fd0 <_Z11printStringPKc>
    800016b0:	0380006f          	j	800016e8 <_Z11workerBodyDv+0xec>

    for (; i < 16; i++)
    {
        printString("D: i=");
    800016b4:	00004517          	auipc	a0,0x4
    800016b8:	9e450513          	addi	a0,a0,-1564 # 80005098 <kvmincrease+0xb98>
    800016bc:	00001097          	auipc	ra,0x1
    800016c0:	914080e7          	jalr	-1772(ra) # 80001fd0 <_Z11printStringPKc>
        printInteger(i);
    800016c4:	00048513          	mv	a0,s1
    800016c8:	00001097          	auipc	ra,0x1
    800016cc:	978080e7          	jalr	-1672(ra) # 80002040 <_Z12printIntegerm>
        printString("\n");
    800016d0:	00004517          	auipc	a0,0x4
    800016d4:	a6050513          	addi	a0,a0,-1440 # 80005130 <kvmincrease+0xc30>
    800016d8:	00001097          	auipc	ra,0x1
    800016dc:	8f8080e7          	jalr	-1800(ra) # 80001fd0 <_Z11printStringPKc>
    for (; i < 16; i++)
    800016e0:	0014849b          	addiw	s1,s1,1
    800016e4:	0ff4f493          	andi	s1,s1,255
    800016e8:	00f00793          	li	a5,15
    800016ec:	fc97f4e3          	bgeu	a5,s1,800016b4 <_Z11workerBodyDv+0xb8>
    }
//    _thread::yield();
    800016f0:	01813083          	ld	ra,24(sp)
    800016f4:	01013403          	ld	s0,16(sp)
    800016f8:	00813483          	ld	s1,8(sp)
    800016fc:	00013903          	ld	s2,0(sp)
    80001700:	02010113          	addi	sp,sp,32
    80001704:	00008067          	ret

0000000080001708 <main>:
#include "../h/print.hpp"
#include "../h/riscv.hpp"
#include "../h/syscall_c.h"

int main()
{
    80001708:	fb010113          	addi	sp,sp,-80
    8000170c:	04113423          	sd	ra,72(sp)
    80001710:	04813023          	sd	s0,64(sp)
    80001714:	02913c23          	sd	s1,56(sp)
    80001718:	03213823          	sd	s2,48(sp)
    8000171c:	05010413          	addi	s0,sp,80
    _thread *threads[5];

    threads[0] = _thread::createThread(nullptr);
    80001720:	00000513          	li	a0,0
    80001724:	00000097          	auipc	ra,0x0
    80001728:	184080e7          	jalr	388(ra) # 800018a8 <_ZN7_thread12createThreadEPFvvE>
    8000172c:	faa43c23          	sd	a0,-72(s0)
    _thread::running = threads[0];
    80001730:	00004797          	auipc	a5,0x4
    80001734:	2407b783          	ld	a5,576(a5) # 80005970 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001738:	00a7b023          	sd	a0,0(a5)

    threads[1] = _thread::createThread(workerBodyA);
    8000173c:	00004517          	auipc	a0,0x4
    80001740:	24c53503          	ld	a0,588(a0) # 80005988 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001744:	00000097          	auipc	ra,0x0
    80001748:	164080e7          	jalr	356(ra) # 800018a8 <_ZN7_thread12createThreadEPFvvE>
    8000174c:	fca43023          	sd	a0,-64(s0)
    printString("ThreadA created\n");
    80001750:	00004517          	auipc	a0,0x4
    80001754:	97050513          	addi	a0,a0,-1680 # 800050c0 <kvmincrease+0xbc0>
    80001758:	00001097          	auipc	ra,0x1
    8000175c:	878080e7          	jalr	-1928(ra) # 80001fd0 <_Z11printStringPKc>
    threads[2] = _thread::createThread(workerBodyB);
    80001760:	00004517          	auipc	a0,0x4
    80001764:	22053503          	ld	a0,544(a0) # 80005980 <_GLOBAL_OFFSET_TABLE_+0x18>
    80001768:	00000097          	auipc	ra,0x0
    8000176c:	140080e7          	jalr	320(ra) # 800018a8 <_ZN7_thread12createThreadEPFvvE>
    80001770:	fca43423          	sd	a0,-56(s0)
    printString("ThreadB created\n");
    80001774:	00004517          	auipc	a0,0x4
    80001778:	96450513          	addi	a0,a0,-1692 # 800050d8 <kvmincrease+0xbd8>
    8000177c:	00001097          	auipc	ra,0x1
    80001780:	854080e7          	jalr	-1964(ra) # 80001fd0 <_Z11printStringPKc>
    threads[3] = _thread::createThread(workerBodyC);
    80001784:	00004517          	auipc	a0,0x4
    80001788:	21453503          	ld	a0,532(a0) # 80005998 <_GLOBAL_OFFSET_TABLE_+0x30>
    8000178c:	00000097          	auipc	ra,0x0
    80001790:	11c080e7          	jalr	284(ra) # 800018a8 <_ZN7_thread12createThreadEPFvvE>
    80001794:	fca43823          	sd	a0,-48(s0)
    printString("ThreadC created\n");
    80001798:	00004517          	auipc	a0,0x4
    8000179c:	95850513          	addi	a0,a0,-1704 # 800050f0 <kvmincrease+0xbf0>
    800017a0:	00001097          	auipc	ra,0x1
    800017a4:	830080e7          	jalr	-2000(ra) # 80001fd0 <_Z11printStringPKc>
//    threads[4] = _thread::createThread(workerBodyD);
//    printString("ThreadD created\n");

    Riscv::w_stvec((uint64) &Riscv::supervisorTrap);
    800017a8:	00004797          	auipc	a5,0x4
    800017ac:	1d07b783          	ld	a5,464(a5) # 80005978 <_GLOBAL_OFFSET_TABLE_+0x10>
    return stvec;
}

inline void Riscv::w_stvec(uint64 stvec)
{
    __asm__ volatile ("csrw stvec, %[stvec]" : : [stvec] "r"(stvec));
    800017b0:	10579073          	csrw	stvec,a5
    __asm__ volatile ("csrw sip, %[sip]" : : [sip] "r"(sip));
}

inline void Riscv::ms_sstatus(uint64 mask)
{
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    800017b4:	00200793          	li	a5,2
    800017b8:	1007a073          	csrs	sstatus,a5
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);
    int ret = thread_create(&threads[4], reinterpret_cast<void (*)(void *)>(workerBodyD), nullptr);
    800017bc:	00000613          	li	a2,0
    800017c0:	00004597          	auipc	a1,0x4
    800017c4:	1e05b583          	ld	a1,480(a1) # 800059a0 <_GLOBAL_OFFSET_TABLE_+0x38>
    800017c8:	fd840513          	addi	a0,s0,-40
    800017cc:	00000097          	auipc	ra,0x0
    800017d0:	a2c080e7          	jalr	-1492(ra) # 800011f8 <_Z13thread_createPP7_threadPFvPvES2_>
    800017d4:	00050493          	mv	s1,a0
    printString("ThreadD created\n");
    800017d8:	00004517          	auipc	a0,0x4
    800017dc:	93050513          	addi	a0,a0,-1744 # 80005108 <kvmincrease+0xc08>
    800017e0:	00000097          	auipc	ra,0x0
    800017e4:	7f0080e7          	jalr	2032(ra) # 80001fd0 <_Z11printStringPKc>
    printInteger(ret);
    800017e8:	00048513          	mv	a0,s1
    800017ec:	00001097          	auipc	ra,0x1
    800017f0:	854080e7          	jalr	-1964(ra) # 80002040 <_Z12printIntegerm>
    800017f4:	00c0006f          	j	80001800 <main+0xf8>
    while (!(threads[1]->isFinished() &&
             threads[2]->isFinished() &&
             threads[3]->isFinished() &&
             threads[4]->isFinished()))
    {
        _thread::yield();
    800017f8:	00000097          	auipc	ra,0x0
    800017fc:	284080e7          	jalr	644(ra) # 80001a7c <_ZN7_thread5yieldEv>
    while (!(threads[1]->isFinished() &&
    80001800:	fc043783          	ld	a5,-64(s0)
class _thread
{
public:
    ~_thread() { delete[] stack; }

    bool isFinished() const { return finished; }
    80001804:	0287c783          	lbu	a5,40(a5)
    80001808:	fe0788e3          	beqz	a5,800017f8 <main+0xf0>
             threads[2]->isFinished() &&
    8000180c:	fc843783          	ld	a5,-56(s0)
    80001810:	0287c783          	lbu	a5,40(a5)
    while (!(threads[1]->isFinished() &&
    80001814:	fe0782e3          	beqz	a5,800017f8 <main+0xf0>
             threads[3]->isFinished() &&
    80001818:	fd043783          	ld	a5,-48(s0)
    8000181c:	0287c783          	lbu	a5,40(a5)
             threads[2]->isFinished() &&
    80001820:	fc078ce3          	beqz	a5,800017f8 <main+0xf0>
             threads[4]->isFinished()))
    80001824:	fd843783          	ld	a5,-40(s0)
    80001828:	0287c783          	lbu	a5,40(a5)
    while (!(threads[1]->isFinished() &&
    8000182c:	fc0786e3          	beqz	a5,800017f8 <main+0xf0>
    }
    printString("test");
    80001830:	00004517          	auipc	a0,0x4
    80001834:	8f050513          	addi	a0,a0,-1808 # 80005120 <kvmincrease+0xc20>
    80001838:	00000097          	auipc	ra,0x0
    8000183c:	798080e7          	jalr	1944(ra) # 80001fd0 <_Z11printStringPKc>
    //DODATI DELETE I NEW!!!
    for (auto &thread: threads)
    80001840:	fb840493          	addi	s1,s0,-72
    80001844:	0140006f          	j	80001858 <main+0x150>
    {
        delete thread;
    80001848:	00090513          	mv	a0,s2
    8000184c:	00000097          	auipc	ra,0x0
    80001850:	398080e7          	jalr	920(ra) # 80001be4 <_ZdlPv>
    for (auto &thread: threads)
    80001854:	00848493          	addi	s1,s1,8
    80001858:	fe040793          	addi	a5,s0,-32
    8000185c:	02f48063          	beq	s1,a5,8000187c <main+0x174>
        delete thread;
    80001860:	0004b903          	ld	s2,0(s1)
    80001864:	fe0908e3          	beqz	s2,80001854 <main+0x14c>
    ~_thread() { delete[] stack; }
    80001868:	00893503          	ld	a0,8(s2)
    8000186c:	fc050ee3          	beqz	a0,80001848 <main+0x140>
    80001870:	00000097          	auipc	ra,0x0
    80001874:	39c080e7          	jalr	924(ra) # 80001c0c <_ZdaPv>
    80001878:	fd1ff06f          	j	80001848 <main+0x140>
    }
    printString("Finished\n");
    8000187c:	00004517          	auipc	a0,0x4
    80001880:	8ac50513          	addi	a0,a0,-1876 # 80005128 <kvmincrease+0xc28>
    80001884:	00000097          	auipc	ra,0x0
    80001888:	74c080e7          	jalr	1868(ra) # 80001fd0 <_Z11printStringPKc>

    return 0;
}
    8000188c:	00000513          	li	a0,0
    80001890:	04813083          	ld	ra,72(sp)
    80001894:	04013403          	ld	s0,64(sp)
    80001898:	03813483          	ld	s1,56(sp)
    8000189c:	03013903          	ld	s2,48(sp)
    800018a0:	05010113          	addi	sp,sp,80
    800018a4:	00008067          	ret

00000000800018a8 <_ZN7_thread12createThreadEPFvvE>:

uint64 _thread::timeSliceCounter = 0;

//mickov kod za kreiranje niti
_thread *_thread::createThread(Body body)
{
    800018a8:	fe010113          	addi	sp,sp,-32
    800018ac:	00113c23          	sd	ra,24(sp)
    800018b0:	00813823          	sd	s0,16(sp)
    800018b4:	00913423          	sd	s1,8(sp)
    800018b8:	01213023          	sd	s2,0(sp)
    800018bc:	02010413          	addi	s0,sp,32
    800018c0:	00050913          	mv	s2,a0
    return new _thread(body, TIME_SLICE);
    800018c4:	03800513          	li	a0,56
    800018c8:	00000097          	auipc	ra,0x0
    800018cc:	2cc080e7          	jalr	716(ra) # 80001b94 <_Znwm>
    800018d0:	00050493          	mv	s1,a0
            stack(body != nullptr ? new uint64[STACK_SIZE] : nullptr),
            context({(uint64) &threadWrapper,
                     stack != nullptr ? (uint64) &stack[STACK_SIZE] : 0
                    }),
            timeSlice(timeSlice),
            finished(false)
    800018d4:	01253023          	sd	s2,0(a0)
            stack(body != nullptr ? new uint64[STACK_SIZE] : nullptr),
    800018d8:	00090a63          	beqz	s2,800018ec <_ZN7_thread12createThreadEPFvvE+0x44>
    800018dc:	00002537          	lui	a0,0x2
    800018e0:	00000097          	auipc	ra,0x0
    800018e4:	2dc080e7          	jalr	732(ra) # 80001bbc <_Znam>
    800018e8:	0080006f          	j	800018f0 <_ZN7_thread12createThreadEPFvvE+0x48>
    800018ec:	00000513          	li	a0,0
            finished(false)
    800018f0:	00a4b423          	sd	a0,8(s1)
    800018f4:	00000797          	auipc	a5,0x0
    800018f8:	1a478793          	addi	a5,a5,420 # 80001a98 <_ZN7_thread13threadWrapperEv>
    800018fc:	00f4b823          	sd	a5,16(s1)
                     stack != nullptr ? (uint64) &stack[STACK_SIZE] : 0
    80001900:	02050a63          	beqz	a0,80001934 <_ZN7_thread12createThreadEPFvvE+0x8c>
    80001904:	000027b7          	lui	a5,0x2
    80001908:	00f507b3          	add	a5,a0,a5
            finished(false)
    8000190c:	00f4bc23          	sd	a5,24(s1)
    80001910:	00200793          	li	a5,2
    80001914:	02f4b023          	sd	a5,32(s1)
    80001918:	02048423          	sb	zero,40(s1)
    8000191c:	0204b823          	sd	zero,48(s1)
    {
        if (body != nullptr) { Scheduler::put(this); printString("pozvan konstukror");}
    80001920:	04090663          	beqz	s2,8000196c <_ZN7_thread12createThreadEPFvvE+0xc4>
    80001924:	00048513          	mv	a0,s1
    80001928:	00000097          	auipc	ra,0x0
    8000192c:	608080e7          	jalr	1544(ra) # 80001f30 <_ZN9Scheduler3putEP7_thread>
    80001930:	00c0006f          	j	8000193c <_ZN7_thread12createThreadEPFvvE+0x94>
                     stack != nullptr ? (uint64) &stack[STACK_SIZE] : 0
    80001934:	00000793          	li	a5,0
    80001938:	fd5ff06f          	j	8000190c <_ZN7_thread12createThreadEPFvvE+0x64>
        if (body != nullptr) { Scheduler::put(this); printString("pozvan konstukror");}
    8000193c:	00003517          	auipc	a0,0x3
    80001940:	7fc50513          	addi	a0,a0,2044 # 80005138 <kvmincrease+0xc38>
    80001944:	00000097          	auipc	ra,0x0
    80001948:	68c080e7          	jalr	1676(ra) # 80001fd0 <_Z11printStringPKc>
    8000194c:	0200006f          	j	8000196c <_ZN7_thread12createThreadEPFvvE+0xc4>
    80001950:	00050913          	mv	s2,a0
    80001954:	00048513          	mv	a0,s1
    80001958:	00000097          	auipc	ra,0x0
    8000195c:	28c080e7          	jalr	652(ra) # 80001be4 <_ZdlPv>
    80001960:	00090513          	mv	a0,s2
    80001964:	00005097          	auipc	ra,0x5
    80001968:	184080e7          	jalr	388(ra) # 80006ae8 <_Unwind_Resume>
}
    8000196c:	00048513          	mv	a0,s1
    80001970:	01813083          	ld	ra,24(sp)
    80001974:	01013403          	ld	s0,16(sp)
    80001978:	00813483          	ld	s1,8(sp)
    8000197c:	00013903          	ld	s2,0(sp)
    80001980:	02010113          	addi	sp,sp,32
    80001984:	00008067          	ret

0000000080001988 <_ZN7_thread12createThreadEPPS_PFvvEPvS4_>:
//poziv za projekat
int _thread::createThread(thread_t* handle, Body body, void *args, void *stack)
{
    80001988:	fc010113          	addi	sp,sp,-64
    8000198c:	02113c23          	sd	ra,56(sp)
    80001990:	02813823          	sd	s0,48(sp)
    80001994:	02913423          	sd	s1,40(sp)
    80001998:	03213023          	sd	s2,32(sp)
    8000199c:	01313c23          	sd	s3,24(sp)
    800019a0:	01413823          	sd	s4,16(sp)
    800019a4:	01513423          	sd	s5,8(sp)
    800019a8:	04010413          	addi	s0,sp,64
    800019ac:	00050a13          	mv	s4,a0
    800019b0:	00058993          	mv	s3,a1
    800019b4:	00060a93          	mv	s5,a2
    800019b8:	00068913          	mv	s2,a3
    *handle = new _thread(body, args, stack);
    800019bc:	03800513          	li	a0,56
    800019c0:	00000097          	auipc	ra,0x0
    800019c4:	1d4080e7          	jalr	468(ra) # 80001b94 <_Znwm>
    800019c8:	00050493          	mv	s1,a0
            context({(uint64) &threadWrapper,
                     stack != nullptr ?  (uint64) &stack[1024] : 0
                    }),
            timeSlice(DEFAULT_TIME_SLICE),
            finished(false),
            args(args)
    800019cc:	01353023          	sd	s3,0(a0)
            stack(body != nullptr ? (uint64*)stackk : nullptr),
    800019d0:	04098463          	beqz	s3,80001a18 <_ZN7_thread12createThreadEPPS_PFvvEPvS4_+0x90>
            args(args)
    800019d4:	0124b423          	sd	s2,8(s1)
    800019d8:	00000797          	auipc	a5,0x0
    800019dc:	0c078793          	addi	a5,a5,192 # 80001a98 <_ZN7_thread13threadWrapperEv>
    800019e0:	00f4b823          	sd	a5,16(s1)
                     stack != nullptr ?  (uint64) &stack[1024] : 0
    800019e4:	02090e63          	beqz	s2,80001a20 <_ZN7_thread12createThreadEPPS_PFvvEPvS4_+0x98>
    800019e8:	000026b7          	lui	a3,0x2
    800019ec:	00d90933          	add	s2,s2,a3
            args(args)
    800019f0:	0124bc23          	sd	s2,24(s1)
    800019f4:	00200793          	li	a5,2
    800019f8:	02f4b023          	sd	a5,32(s1)
    800019fc:	02048423          	sb	zero,40(s1)
    80001a00:	0354b823          	sd	s5,48(s1)
    {
        if (body != nullptr) {
    80001a04:	02098263          	beqz	s3,80001a28 <_ZN7_thread12createThreadEPPS_PFvvEPvS4_+0xa0>
            Scheduler::put(this);
    80001a08:	00048513          	mv	a0,s1
    80001a0c:	00000097          	auipc	ra,0x0
    80001a10:	524080e7          	jalr	1316(ra) # 80001f30 <_ZN9Scheduler3putEP7_thread>
    80001a14:	0140006f          	j	80001a28 <_ZN7_thread12createThreadEPPS_PFvvEPvS4_+0xa0>
            stack(body != nullptr ? (uint64*)stackk : nullptr),
    80001a18:	00000913          	li	s2,0
    80001a1c:	fb9ff06f          	j	800019d4 <_ZN7_thread12createThreadEPPS_PFvvEPvS4_+0x4c>
                     stack != nullptr ?  (uint64) &stack[1024] : 0
    80001a20:	00000913          	li	s2,0
    80001a24:	fcdff06f          	j	800019f0 <_ZN7_thread12createThreadEPPS_PFvvEPvS4_+0x68>
    80001a28:	009a3023          	sd	s1,0(s4)
    if(*handle != nullptr)
    80001a2c:	02048663          	beqz	s1,80001a58 <_ZN7_thread12createThreadEPPS_PFvvEPvS4_+0xd0>
        return 0;
    80001a30:	00000513          	li	a0,0
    else
        return -2;
}
    80001a34:	03813083          	ld	ra,56(sp)
    80001a38:	03013403          	ld	s0,48(sp)
    80001a3c:	02813483          	ld	s1,40(sp)
    80001a40:	02013903          	ld	s2,32(sp)
    80001a44:	01813983          	ld	s3,24(sp)
    80001a48:	01013a03          	ld	s4,16(sp)
    80001a4c:	00813a83          	ld	s5,8(sp)
    80001a50:	04010113          	addi	sp,sp,64
    80001a54:	00008067          	ret
        return -2;
    80001a58:	ffe00513          	li	a0,-2
    80001a5c:	fd9ff06f          	j	80001a34 <_ZN7_thread12createThreadEPPS_PFvvEPvS4_+0xac>
    80001a60:	00050913          	mv	s2,a0
    *handle = new _thread(body, args, stack);
    80001a64:	00048513          	mv	a0,s1
    80001a68:	00000097          	auipc	ra,0x0
    80001a6c:	17c080e7          	jalr	380(ra) # 80001be4 <_ZdlPv>
    80001a70:	00090513          	mv	a0,s2
    80001a74:	00005097          	auipc	ra,0x5
    80001a78:	074080e7          	jalr	116(ra) # 80006ae8 <_Unwind_Resume>

0000000080001a7c <_ZN7_thread5yieldEv>:

void _thread::yield()
{
    80001a7c:	ff010113          	addi	sp,sp,-16
    80001a80:	00813423          	sd	s0,8(sp)
    80001a84:	01010413          	addi	s0,sp,16
    __asm__ volatile ("ecall");
    80001a88:	00000073          	ecall
}
    80001a8c:	00813403          	ld	s0,8(sp)
    80001a90:	01010113          	addi	sp,sp,16
    80001a94:	00008067          	ret

0000000080001a98 <_ZN7_thread13threadWrapperEv>:

    _thread::contextSwitch(&old->context, &running->context);
}

void _thread::threadWrapper()
{
    80001a98:	fe010113          	addi	sp,sp,-32
    80001a9c:	00113c23          	sd	ra,24(sp)
    80001aa0:	00813823          	sd	s0,16(sp)
    80001aa4:	00913423          	sd	s1,8(sp)
    80001aa8:	02010413          	addi	s0,sp,32
    Riscv::popSppSpie();
    80001aac:	00000097          	auipc	ra,0x0
    80001ab0:	188080e7          	jalr	392(ra) # 80001c34 <_ZN5Riscv10popSppSpieEv>
    running->body();
    80001ab4:	00004497          	auipc	s1,0x4
    80001ab8:	f4c48493          	addi	s1,s1,-180 # 80005a00 <_ZN7_thread7runningE>
    80001abc:	0004b783          	ld	a5,0(s1)
    80001ac0:	0007b783          	ld	a5,0(a5)
    80001ac4:	000780e7          	jalr	a5
    running->setFinished(true);
    80001ac8:	0004b783          	ld	a5,0(s1)
    void setFinished(bool value) { finished = value; }
    80001acc:	00100713          	li	a4,1
    80001ad0:	02e78423          	sb	a4,40(a5)
    printString("gotova nit");
    80001ad4:	00003517          	auipc	a0,0x3
    80001ad8:	67c50513          	addi	a0,a0,1660 # 80005150 <kvmincrease+0xc50>
    80001adc:	00000097          	auipc	ra,0x0
    80001ae0:	4f4080e7          	jalr	1268(ra) # 80001fd0 <_Z11printStringPKc>
    _thread::yield();
    80001ae4:	00000097          	auipc	ra,0x0
    80001ae8:	f98080e7          	jalr	-104(ra) # 80001a7c <_ZN7_thread5yieldEv>
}
    80001aec:	01813083          	ld	ra,24(sp)
    80001af0:	01013403          	ld	s0,16(sp)
    80001af4:	00813483          	ld	s1,8(sp)
    80001af8:	02010113          	addi	sp,sp,32
    80001afc:	00008067          	ret

0000000080001b00 <_ZN7_thread8dispatchEv>:
{
    80001b00:	fe010113          	addi	sp,sp,-32
    80001b04:	00113c23          	sd	ra,24(sp)
    80001b08:	00813823          	sd	s0,16(sp)
    80001b0c:	00913423          	sd	s1,8(sp)
    80001b10:	02010413          	addi	s0,sp,32
    _thread *old = running;
    80001b14:	00004497          	auipc	s1,0x4
    80001b18:	eec4b483          	ld	s1,-276(s1) # 80005a00 <_ZN7_thread7runningE>
    bool isFinished() const { return finished; }
    80001b1c:	0284c783          	lbu	a5,40(s1)
    if (!old->isFinished()) { Scheduler::put(old); }
    80001b20:	02078c63          	beqz	a5,80001b58 <_ZN7_thread8dispatchEv+0x58>
    running = Scheduler::get();
    80001b24:	00000097          	auipc	ra,0x0
    80001b28:	3a4080e7          	jalr	932(ra) # 80001ec8 <_ZN9Scheduler3getEv>
    80001b2c:	00004797          	auipc	a5,0x4
    80001b30:	eca7ba23          	sd	a0,-300(a5) # 80005a00 <_ZN7_thread7runningE>
    _thread::contextSwitch(&old->context, &running->context);
    80001b34:	01050593          	addi	a1,a0,16
    80001b38:	01048513          	addi	a0,s1,16
    80001b3c:	fffff097          	auipc	ra,0xfffff
    80001b40:	5f4080e7          	jalr	1524(ra) # 80001130 <_ZN7_thread13contextSwitchEPNS_7ContextES1_>
}
    80001b44:	01813083          	ld	ra,24(sp)
    80001b48:	01013403          	ld	s0,16(sp)
    80001b4c:	00813483          	ld	s1,8(sp)
    80001b50:	02010113          	addi	sp,sp,32
    80001b54:	00008067          	ret
    if (!old->isFinished()) { Scheduler::put(old); }
    80001b58:	00048513          	mv	a0,s1
    80001b5c:	00000097          	auipc	ra,0x0
    80001b60:	3d4080e7          	jalr	980(ra) # 80001f30 <_ZN9Scheduler3putEP7_thread>
    80001b64:	fc1ff06f          	j	80001b24 <_ZN7_thread8dispatchEv+0x24>

0000000080001b68 <_ZN7_thread10threadStopEv>:

int _thread::threadStop(){
    80001b68:	ff010113          	addi	sp,sp,-16
    80001b6c:	00813423          	sd	s0,8(sp)
    80001b70:	01010413          	addi	s0,sp,16
    void setFinished(bool value) { finished = value; }
    80001b74:	00004797          	auipc	a5,0x4
    80001b78:	e8c7b783          	ld	a5,-372(a5) # 80005a00 <_ZN7_thread7runningE>
    80001b7c:	00100713          	li	a4,1
    80001b80:	02e78423          	sb	a4,40(a5)
//    }

//    delete []running->stack;
//    nzm da se brise nit ili se samo zaustavlja
return 0;
    80001b84:	00000513          	li	a0,0
    80001b88:	00813403          	ld	s0,8(sp)
    80001b8c:	01010113          	addi	sp,sp,16
    80001b90:	00008067          	ret

0000000080001b94 <_Znwm>:
#include "../h/print.hpp"

using size_t = decltype(sizeof(0));

void *operator new(size_t n)
{
    80001b94:	ff010113          	addi	sp,sp,-16
    80001b98:	00113423          	sd	ra,8(sp)
    80001b9c:	00813023          	sd	s0,0(sp)
    80001ba0:	01010413          	addi	s0,sp,16
//    printString("new operator");
    return __mem_alloc(n);
    80001ba4:	00002097          	auipc	ra,0x2
    80001ba8:	6e4080e7          	jalr	1764(ra) # 80004288 <__mem_alloc>
}
    80001bac:	00813083          	ld	ra,8(sp)
    80001bb0:	00013403          	ld	s0,0(sp)
    80001bb4:	01010113          	addi	sp,sp,16
    80001bb8:	00008067          	ret

0000000080001bbc <_Znam>:

void *operator new[](size_t n)
{
    80001bbc:	ff010113          	addi	sp,sp,-16
    80001bc0:	00113423          	sd	ra,8(sp)
    80001bc4:	00813023          	sd	s0,0(sp)
    80001bc8:	01010413          	addi	s0,sp,16
    return __mem_alloc(n);
    80001bcc:	00002097          	auipc	ra,0x2
    80001bd0:	6bc080e7          	jalr	1724(ra) # 80004288 <__mem_alloc>
}
    80001bd4:	00813083          	ld	ra,8(sp)
    80001bd8:	00013403          	ld	s0,0(sp)
    80001bdc:	01010113          	addi	sp,sp,16
    80001be0:	00008067          	ret

0000000080001be4 <_ZdlPv>:

void operator delete(void *p) noexcept
{
    80001be4:	ff010113          	addi	sp,sp,-16
    80001be8:	00113423          	sd	ra,8(sp)
    80001bec:	00813023          	sd	s0,0(sp)
    80001bf0:	01010413          	addi	s0,sp,16
    __mem_free(p);
    80001bf4:	00002097          	auipc	ra,0x2
    80001bf8:	5c8080e7          	jalr	1480(ra) # 800041bc <__mem_free>
}
    80001bfc:	00813083          	ld	ra,8(sp)
    80001c00:	00013403          	ld	s0,0(sp)
    80001c04:	01010113          	addi	sp,sp,16
    80001c08:	00008067          	ret

0000000080001c0c <_ZdaPv>:

void operator delete[](void *p) noexcept
{
    80001c0c:	ff010113          	addi	sp,sp,-16
    80001c10:	00113423          	sd	ra,8(sp)
    80001c14:	00813023          	sd	s0,0(sp)
    80001c18:	01010413          	addi	s0,sp,16
    __mem_free(p);
    80001c1c:	00002097          	auipc	ra,0x2
    80001c20:	5a0080e7          	jalr	1440(ra) # 800041bc <__mem_free>
    80001c24:	00813083          	ld	ra,8(sp)
    80001c28:	00013403          	ld	s0,0(sp)
    80001c2c:	01010113          	addi	sp,sp,16
    80001c30:	00008067          	ret

0000000080001c34 <_ZN5Riscv10popSppSpieEv>:

//zasto se ne uvozi body iz tcb.hpp???(using vazi samo za fajl u kom je definisan?)
using Body = void (*)();

void Riscv::popSppSpie()
{
    80001c34:	ff010113          	addi	sp,sp,-16
    80001c38:	00813423          	sd	s0,8(sp)
    80001c3c:	01010413          	addi	s0,sp,16
    __asm__ volatile("csrw sepc, ra");
    80001c40:	14109073          	csrw	sepc,ra
    __asm__ volatile("sret");
    80001c44:	10200073          	sret
}
    80001c48:	00813403          	ld	s0,8(sp)
    80001c4c:	01010113          	addi	sp,sp,16
    80001c50:	00008067          	ret

0000000080001c54 <_ZN5Riscv20handleSupervisorTrapEv>:

void Riscv::handleSupervisorTrap()
{
    80001c54:	f8010113          	addi	sp,sp,-128
    80001c58:	06113c23          	sd	ra,120(sp)
    80001c5c:	06813823          	sd	s0,112(sp)
    80001c60:	06913423          	sd	s1,104(sp)
    80001c64:	07213023          	sd	s2,96(sp)
    80001c68:	05313c23          	sd	s3,88(sp)
    80001c6c:	05413823          	sd	s4,80(sp)
    80001c70:	08010413          	addi	s0,sp,128
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r"(scause));
    80001c74:	142027f3          	csrr	a5,scause
    80001c78:	faf43423          	sd	a5,-88(s0)
    return scause;
    80001c7c:	fa843703          	ld	a4,-88(s0)
    uint64 scause = r_scause();

    if (scause == 0x0000000000000008UL || scause == 0x0000000000000009UL)
    80001c80:	ff870693          	addi	a3,a4,-8
    80001c84:	00100793          	li	a5,1
    80001c88:	02d7f863          	bgeu	a5,a3,80001cb8 <_ZN5Riscv20handleSupervisorTrapEv+0x64>
        }

        w_sstatus(sstatus);
        w_sepc(sepc);
    }
    else if (scause == 0x8000000000000001UL)
    80001c8c:	fff00793          	li	a5,-1
    80001c90:	03f79793          	slli	a5,a5,0x3f
    80001c94:	00178793          	addi	a5,a5,1
    80001c98:	16f70c63          	beq	a4,a5,80001e10 <_ZN5Riscv20handleSupervisorTrapEv+0x1bc>
            _thread::dispatch();
            w_sstatus(sstatus);
            w_sepc(sepc);
        }
    }
    else if (scause == 0x8000000000000009UL)
    80001c9c:	fff00793          	li	a5,-1
    80001ca0:	03f79793          	slli	a5,a5,0x3f
    80001ca4:	00978793          	addi	a5,a5,9
    80001ca8:	0cf71a63          	bne	a4,a5,80001d7c <_ZN5Riscv20handleSupervisorTrapEv+0x128>
    {
        // interrupt: yes; cause code: supervisor external interrupt (PLIC; could be keyboard)
        console_handler();
    80001cac:	00002097          	auipc	ra,0x2
    80001cb0:	7a8080e7          	jalr	1960(ra) # 80004454 <console_handler>
    }
    else
    {
        // unexpected trap cause
    }
    80001cb4:	0c80006f          	j	80001d7c <_ZN5Riscv20handleSupervisorTrapEv+0x128>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80001cb8:	141027f3          	csrr	a5,sepc
    80001cbc:	faf43c23          	sd	a5,-72(s0)
    return sepc;
    80001cc0:	fb843783          	ld	a5,-72(s0)
        uint64 volatile sepc = r_sepc() + 4;
    80001cc4:	00478793          	addi	a5,a5,4
    80001cc8:	f8f43423          	sd	a5,-120(s0)
}

inline uint64 Riscv::r_sstatus()
{
    uint64 volatile sstatus;
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80001ccc:	100027f3          	csrr	a5,sstatus
    80001cd0:	faf43823          	sd	a5,-80(s0)
    return sstatus;
    80001cd4:	fb043783          	ld	a5,-80(s0)
        uint64 volatile sstatus = r_sstatus();
    80001cd8:	f8f43823          	sd	a5,-112(s0)
        __asm__ volatile("mv %0, a0" : "=r" (code));
    80001cdc:	00050793          	mv	a5,a0
        if(code == 0x1) {
    80001ce0:	00100713          	li	a4,1
    80001ce4:	06e78a63          	beq	a5,a4,80001d58 <_ZN5Riscv20handleSupervisorTrapEv+0x104>
        }else if(code == 0x02) {
    80001ce8:	00200713          	li	a4,2
    80001cec:	0ae78863          	beq	a5,a4,80001d9c <_ZN5Riscv20handleSupervisorTrapEv+0x148>
        }else if(code == 0x11){
    80001cf0:	01100713          	li	a4,17
    80001cf4:	0ae78e63          	beq	a5,a4,80001db0 <_ZN5Riscv20handleSupervisorTrapEv+0x15c>
        }else if(code == 0x12){
    80001cf8:	01200713          	li	a4,18
    80001cfc:	0ee78c63          	beq	a5,a4,80001df4 <_ZN5Riscv20handleSupervisorTrapEv+0x1a0>
        }else if(code == 0x13){
    80001d00:	01300713          	li	a4,19
    80001d04:	06e78463          	beq	a5,a4,80001d6c <_ZN5Riscv20handleSupervisorTrapEv+0x118>
        }else if(code == 0x21){
    80001d08:	02100713          	li	a4,33
    80001d0c:	06e78063          	beq	a5,a4,80001d6c <_ZN5Riscv20handleSupervisorTrapEv+0x118>
        }else if(code == 0x22){
    80001d10:	02200713          	li	a4,34
    80001d14:	04e78c63          	beq	a5,a4,80001d6c <_ZN5Riscv20handleSupervisorTrapEv+0x118>
        }else if(code == 0x23){
    80001d18:	02300713          	li	a4,35
    80001d1c:	04e78863          	beq	a5,a4,80001d6c <_ZN5Riscv20handleSupervisorTrapEv+0x118>
        }else if(code == 0x24){
    80001d20:	02400713          	li	a4,36
    80001d24:	04e78463          	beq	a5,a4,80001d6c <_ZN5Riscv20handleSupervisorTrapEv+0x118>
        }else if(code == 0x31){
    80001d28:	03100713          	li	a4,49
    80001d2c:	04e78063          	beq	a5,a4,80001d6c <_ZN5Riscv20handleSupervisorTrapEv+0x118>
        }else if(code == 0x41){
    80001d30:	04100713          	li	a4,65
    80001d34:	02e78c63          	beq	a5,a4,80001d6c <_ZN5Riscv20handleSupervisorTrapEv+0x118>
        }else if(code == 0x42){
    80001d38:	04200713          	li	a4,66
    80001d3c:	02e78863          	beq	a5,a4,80001d6c <_ZN5Riscv20handleSupervisorTrapEv+0x118>
            _thread::timeSliceCounter = 0;
    80001d40:	00004797          	auipc	a5,0x4
    80001d44:	c687b783          	ld	a5,-920(a5) # 800059a8 <_GLOBAL_OFFSET_TABLE_+0x40>
    80001d48:	0007b023          	sd	zero,0(a5)
            _thread::dispatch();
    80001d4c:	00000097          	auipc	ra,0x0
    80001d50:	db4080e7          	jalr	-588(ra) # 80001b00 <_ZN7_thread8dispatchEv>
    80001d54:	0180006f          	j	80001d6c <_ZN5Riscv20handleSupervisorTrapEv+0x118>
            __asm__ volatile("mv %0, a1" : "=r" (x));
    80001d58:	00058513          	mv	a0,a1
            void* r = __mem_alloc(x);
    80001d5c:	00651513          	slli	a0,a0,0x6
    80001d60:	00002097          	auipc	ra,0x2
    80001d64:	528080e7          	jalr	1320(ra) # 80004288 <__mem_alloc>
            __asm__ volatile("mv a0, %0" : : "r" (r));
    80001d68:	00050513          	mv	a0,a0
        w_sstatus(sstatus);
    80001d6c:	f9043783          	ld	a5,-112(s0)
}

inline void Riscv::w_sstatus(uint64 sstatus)
{
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80001d70:	10079073          	csrw	sstatus,a5
        w_sepc(sepc);
    80001d74:	f8843783          	ld	a5,-120(s0)
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80001d78:	14179073          	csrw	sepc,a5
    80001d7c:	07813083          	ld	ra,120(sp)
    80001d80:	07013403          	ld	s0,112(sp)
    80001d84:	06813483          	ld	s1,104(sp)
    80001d88:	06013903          	ld	s2,96(sp)
    80001d8c:	05813983          	ld	s3,88(sp)
    80001d90:	05013a03          	ld	s4,80(sp)
    80001d94:	08010113          	addi	sp,sp,128
    80001d98:	00008067          	ret
            __asm__ volatile("mv %0, a1" : "=r" (x));
    80001d9c:	00058513          	mv	a0,a1
            ret = __mem_free((void*)x);
    80001da0:	00002097          	auipc	ra,0x2
    80001da4:	41c080e7          	jalr	1052(ra) # 800041bc <__mem_free>
            __asm__ volatile("mv a0, %0" : : "r" (ret));
    80001da8:	00050513          	mv	a0,a0
    80001dac:	fc1ff06f          	j	80001d6c <_ZN5Riscv20handleSupervisorTrapEv+0x118>
            __asm__ volatile("mv %0, a1" : "=r" (handle));
    80001db0:	00058913          	mv	s2,a1
            __asm__ volatile("mv %0, a2" : "=r" (body));
    80001db4:	00060993          	mv	s3,a2
            __asm__ volatile("ld t2, 104(fp)");
    80001db8:	06843383          	ld	t2,104(s0)
            __asm__ volatile("ld t3, 112(fp)");
    80001dbc:	07043e03          	ld	t3,112(s0)
            __asm__ volatile("mv %0, t2" : "=r" (args));
    80001dc0:	00038a13          	mv	s4,t2
            __asm__ volatile("mv %0, t3" : "=r" (stack));
    80001dc4:	000e0493          	mv	s1,t3
            printInteger((uint64)stack);
    80001dc8:	00048513          	mv	a0,s1
    80001dcc:	00000097          	auipc	ra,0x0
    80001dd0:	274080e7          	jalr	628(ra) # 80002040 <_Z12printIntegerm>
            int ret = _thread::createThread(handle, body, args, stack);
    80001dd4:	00048693          	mv	a3,s1
    80001dd8:	000a0613          	mv	a2,s4
    80001ddc:	00098593          	mv	a1,s3
    80001de0:	00090513          	mv	a0,s2
    80001de4:	00000097          	auipc	ra,0x0
    80001de8:	ba4080e7          	jalr	-1116(ra) # 80001988 <_ZN7_thread12createThreadEPPS_PFvvEPvS4_>
            __asm__ volatile("mv a0, %0" : : "r" (ret));
    80001dec:	00050513          	mv	a0,a0
    80001df0:	f7dff06f          	j	80001d6c <_ZN5Riscv20handleSupervisorTrapEv+0x118>
            int ret = _thread::threadStop();
    80001df4:	00000097          	auipc	ra,0x0
    80001df8:	d74080e7          	jalr	-652(ra) # 80001b68 <_ZN7_thread10threadStopEv>
            if(ret != 0)
    80001dfc:	00050663          	beqz	a0,80001e08 <_ZN5Riscv20handleSupervisorTrapEv+0x1b4>
                __asm__ volatile("mv a0, %0" : : "r" (ret));
    80001e00:	00050513          	mv	a0,a0
    80001e04:	f69ff06f          	j	80001d6c <_ZN5Riscv20handleSupervisorTrapEv+0x118>
                __asm__ volatile("mv a0, zero");
    80001e08:	00000513          	li	a0,0
    80001e0c:	f61ff06f          	j	80001d6c <_ZN5Riscv20handleSupervisorTrapEv+0x118>
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"(mask));
    80001e10:	00200793          	li	a5,2
    80001e14:	1447b073          	csrc	sip,a5
        _thread::timeSliceCounter++;
    80001e18:	00004717          	auipc	a4,0x4
    80001e1c:	b9073703          	ld	a4,-1136(a4) # 800059a8 <_GLOBAL_OFFSET_TABLE_+0x40>
    80001e20:	00073783          	ld	a5,0(a4)
    80001e24:	00178793          	addi	a5,a5,1
    80001e28:	00f73023          	sd	a5,0(a4)
        if (_thread::timeSliceCounter >= _thread::running->getTimeSlice())
    80001e2c:	00004717          	auipc	a4,0x4
    80001e30:	b4473703          	ld	a4,-1212(a4) # 80005970 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001e34:	00073703          	ld	a4,0(a4)
    uint64 getTimeSlice() const { return timeSlice; }
    80001e38:	02073703          	ld	a4,32(a4)
    80001e3c:	f4e7e0e3          	bltu	a5,a4,80001d7c <_ZN5Riscv20handleSupervisorTrapEv+0x128>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80001e40:	141027f3          	csrr	a5,sepc
    80001e44:	fcf43423          	sd	a5,-56(s0)
    return sepc;
    80001e48:	fc843783          	ld	a5,-56(s0)
            uint64 volatile sepc = r_sepc();
    80001e4c:	f8f43c23          	sd	a5,-104(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80001e50:	100027f3          	csrr	a5,sstatus
    80001e54:	fcf43023          	sd	a5,-64(s0)
    return sstatus;
    80001e58:	fc043783          	ld	a5,-64(s0)
            uint64 volatile sstatus = r_sstatus();
    80001e5c:	faf43023          	sd	a5,-96(s0)
            _thread::timeSliceCounter = 0;
    80001e60:	00004797          	auipc	a5,0x4
    80001e64:	b487b783          	ld	a5,-1208(a5) # 800059a8 <_GLOBAL_OFFSET_TABLE_+0x40>
    80001e68:	0007b023          	sd	zero,0(a5)
            _thread::dispatch();
    80001e6c:	00000097          	auipc	ra,0x0
    80001e70:	c94080e7          	jalr	-876(ra) # 80001b00 <_ZN7_thread8dispatchEv>
            w_sstatus(sstatus);
    80001e74:	fa043783          	ld	a5,-96(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80001e78:	10079073          	csrw	sstatus,a5
            w_sepc(sepc);
    80001e7c:	f9843783          	ld	a5,-104(s0)
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80001e80:	14179073          	csrw	sepc,a5
}
    80001e84:	ef9ff06f          	j	80001d7c <_ZN5Riscv20handleSupervisorTrapEv+0x128>

0000000080001e88 <_Z41__static_initialization_and_destruction_0ii>:
}

void Scheduler::put(_thread *ccb)
{
    readyThreadQueue.addLast(ccb);
    80001e88:	ff010113          	addi	sp,sp,-16
    80001e8c:	00813423          	sd	s0,8(sp)
    80001e90:	01010413          	addi	s0,sp,16
    80001e94:	00100793          	li	a5,1
    80001e98:	00f50863          	beq	a0,a5,80001ea8 <_Z41__static_initialization_and_destruction_0ii+0x20>
    80001e9c:	00813403          	ld	s0,8(sp)
    80001ea0:	01010113          	addi	sp,sp,16
    80001ea4:	00008067          	ret
    80001ea8:	000107b7          	lui	a5,0x10
    80001eac:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80001eb0:	fef596e3          	bne	a1,a5,80001e9c <_Z41__static_initialization_and_destruction_0ii+0x14>
    };

    Elem *head, *tail;

public:
    List() : head(0), tail(0) {}
    80001eb4:	00004797          	auipc	a5,0x4
    80001eb8:	b5c78793          	addi	a5,a5,-1188 # 80005a10 <_ZN9Scheduler16readyThreadQueueE>
    80001ebc:	0007b023          	sd	zero,0(a5)
    80001ec0:	0007b423          	sd	zero,8(a5)
    80001ec4:	fd9ff06f          	j	80001e9c <_Z41__static_initialization_and_destruction_0ii+0x14>

0000000080001ec8 <_ZN9Scheduler3getEv>:
{
    80001ec8:	fe010113          	addi	sp,sp,-32
    80001ecc:	00113c23          	sd	ra,24(sp)
    80001ed0:	00813823          	sd	s0,16(sp)
    80001ed4:	00913423          	sd	s1,8(sp)
    80001ed8:	02010413          	addi	s0,sp,32
        }
    }

    T *removeFirst()
    {
        if (!head) { return 0; }
    80001edc:	00004517          	auipc	a0,0x4
    80001ee0:	b3453503          	ld	a0,-1228(a0) # 80005a10 <_ZN9Scheduler16readyThreadQueueE>
    80001ee4:	04050263          	beqz	a0,80001f28 <_ZN9Scheduler3getEv+0x60>

        Elem *elem = head;
        head = head->next;
    80001ee8:	00853783          	ld	a5,8(a0)
    80001eec:	00004717          	auipc	a4,0x4
    80001ef0:	b2f73223          	sd	a5,-1244(a4) # 80005a10 <_ZN9Scheduler16readyThreadQueueE>
        if (!head) { tail = 0; }
    80001ef4:	02078463          	beqz	a5,80001f1c <_ZN9Scheduler3getEv+0x54>

        T *ret = elem->data;
    80001ef8:	00053483          	ld	s1,0(a0)
        delete elem;
    80001efc:	00000097          	auipc	ra,0x0
    80001f00:	ce8080e7          	jalr	-792(ra) # 80001be4 <_ZdlPv>
}
    80001f04:	00048513          	mv	a0,s1
    80001f08:	01813083          	ld	ra,24(sp)
    80001f0c:	01013403          	ld	s0,16(sp)
    80001f10:	00813483          	ld	s1,8(sp)
    80001f14:	02010113          	addi	sp,sp,32
    80001f18:	00008067          	ret
        if (!head) { tail = 0; }
    80001f1c:	00004797          	auipc	a5,0x4
    80001f20:	ae07be23          	sd	zero,-1284(a5) # 80005a18 <_ZN9Scheduler16readyThreadQueueE+0x8>
    80001f24:	fd5ff06f          	j	80001ef8 <_ZN9Scheduler3getEv+0x30>
        if (!head) { return 0; }
    80001f28:	00050493          	mv	s1,a0
    return readyThreadQueue.removeFirst();
    80001f2c:	fd9ff06f          	j	80001f04 <_ZN9Scheduler3getEv+0x3c>

0000000080001f30 <_ZN9Scheduler3putEP7_thread>:
{
    80001f30:	fe010113          	addi	sp,sp,-32
    80001f34:	00113c23          	sd	ra,24(sp)
    80001f38:	00813823          	sd	s0,16(sp)
    80001f3c:	00913423          	sd	s1,8(sp)
    80001f40:	02010413          	addi	s0,sp,32
    80001f44:	00050493          	mv	s1,a0
        Elem *elem = new Elem(data, 0);
    80001f48:	01000513          	li	a0,16
    80001f4c:	00000097          	auipc	ra,0x0
    80001f50:	c48080e7          	jalr	-952(ra) # 80001b94 <_Znwm>
        Elem(T *data, Elem *next) : data(data), next(next) {}
    80001f54:	00953023          	sd	s1,0(a0)
    80001f58:	00053423          	sd	zero,8(a0)
        if (tail)
    80001f5c:	00004797          	auipc	a5,0x4
    80001f60:	abc7b783          	ld	a5,-1348(a5) # 80005a18 <_ZN9Scheduler16readyThreadQueueE+0x8>
    80001f64:	02078263          	beqz	a5,80001f88 <_ZN9Scheduler3putEP7_thread+0x58>
            tail->next = elem;
    80001f68:	00a7b423          	sd	a0,8(a5)
            tail = elem;
    80001f6c:	00004797          	auipc	a5,0x4
    80001f70:	aaa7b623          	sd	a0,-1364(a5) # 80005a18 <_ZN9Scheduler16readyThreadQueueE+0x8>
    80001f74:	01813083          	ld	ra,24(sp)
    80001f78:	01013403          	ld	s0,16(sp)
    80001f7c:	00813483          	ld	s1,8(sp)
    80001f80:	02010113          	addi	sp,sp,32
    80001f84:	00008067          	ret
            head = tail = elem;
    80001f88:	00004797          	auipc	a5,0x4
    80001f8c:	a8878793          	addi	a5,a5,-1400 # 80005a10 <_ZN9Scheduler16readyThreadQueueE>
    80001f90:	00a7b423          	sd	a0,8(a5)
    80001f94:	00a7b023          	sd	a0,0(a5)
    80001f98:	fddff06f          	j	80001f74 <_ZN9Scheduler3putEP7_thread+0x44>

0000000080001f9c <_GLOBAL__sub_I__ZN9Scheduler16readyThreadQueueE>:
    80001f9c:	ff010113          	addi	sp,sp,-16
    80001fa0:	00113423          	sd	ra,8(sp)
    80001fa4:	00813023          	sd	s0,0(sp)
    80001fa8:	01010413          	addi	s0,sp,16
    80001fac:	000105b7          	lui	a1,0x10
    80001fb0:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    80001fb4:	00100513          	li	a0,1
    80001fb8:	00000097          	auipc	ra,0x0
    80001fbc:	ed0080e7          	jalr	-304(ra) # 80001e88 <_Z41__static_initialization_and_destruction_0ii>
    80001fc0:	00813083          	ld	ra,8(sp)
    80001fc4:	00013403          	ld	s0,0(sp)
    80001fc8:	01010113          	addi	sp,sp,16
    80001fcc:	00008067          	ret

0000000080001fd0 <_Z11printStringPKc>:
#include "../h/print.hpp"
#include "../h/riscv.hpp"
#include "../lib/console.h"

void printString(char const *string)
{
    80001fd0:	fd010113          	addi	sp,sp,-48
    80001fd4:	02113423          	sd	ra,40(sp)
    80001fd8:	02813023          	sd	s0,32(sp)
    80001fdc:	00913c23          	sd	s1,24(sp)
    80001fe0:	01213823          	sd	s2,16(sp)
    80001fe4:	03010413          	addi	s0,sp,48
    80001fe8:	00050493          	mv	s1,a0
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80001fec:	100027f3          	csrr	a5,sstatus
    80001ff0:	fcf43c23          	sd	a5,-40(s0)
    return sstatus;
    80001ff4:	fd843903          	ld	s2,-40(s0)
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    80001ff8:	00200793          	li	a5,2
    80001ffc:	1007b073          	csrc	sstatus,a5
    uint64 sstatus = Riscv::r_sstatus();
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    while (*string != '\0')
    80002000:	0004c503          	lbu	a0,0(s1)
    80002004:	00050a63          	beqz	a0,80002018 <_Z11printStringPKc+0x48>
    {
        __putc(*string);
    80002008:	00002097          	auipc	ra,0x2
    8000200c:	3d8080e7          	jalr	984(ra) # 800043e0 <__putc>
        string++;
    80002010:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80002014:	fedff06f          	j	80002000 <_Z11printStringPKc+0x30>
    }
    Riscv::ms_sstatus(sstatus & Riscv::SSTATUS_SIE ? Riscv::SSTATUS_SIE : 0);
    80002018:	0009091b          	sext.w	s2,s2
    8000201c:	00297913          	andi	s2,s2,2
    80002020:	0009091b          	sext.w	s2,s2
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    80002024:	10092073          	csrs	sstatus,s2
}
    80002028:	02813083          	ld	ra,40(sp)
    8000202c:	02013403          	ld	s0,32(sp)
    80002030:	01813483          	ld	s1,24(sp)
    80002034:	01013903          	ld	s2,16(sp)
    80002038:	03010113          	addi	sp,sp,48
    8000203c:	00008067          	ret

0000000080002040 <_Z12printIntegerm>:

void printInteger(uint64 integer)
{
    80002040:	fc010113          	addi	sp,sp,-64
    80002044:	02113c23          	sd	ra,56(sp)
    80002048:	02813823          	sd	s0,48(sp)
    8000204c:	02913423          	sd	s1,40(sp)
    80002050:	03213023          	sd	s2,32(sp)
    80002054:	04010413          	addi	s0,sp,64
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80002058:	100027f3          	csrr	a5,sstatus
    8000205c:	fcf43423          	sd	a5,-56(s0)
    return sstatus;
    80002060:	fc843903          	ld	s2,-56(s0)
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    80002064:	00200793          	li	a5,2
    80002068:	1007b073          	csrc	sstatus,a5
    {
        neg = 1;
        x = -integer;
    } else
    {
        x = integer;
    8000206c:	0005051b          	sext.w	a0,a0
    }

    i = 0;
    80002070:	00000493          	li	s1,0
    do
    {
        buf[i++] = digits[x % 10];
    80002074:	00a00613          	li	a2,10
    80002078:	02c5773b          	remuw	a4,a0,a2
    8000207c:	02071693          	slli	a3,a4,0x20
    80002080:	0206d693          	srli	a3,a3,0x20
    80002084:	00003717          	auipc	a4,0x3
    80002088:	0dc70713          	addi	a4,a4,220 # 80005160 <_ZZ12printIntegermE6digits>
    8000208c:	00d70733          	add	a4,a4,a3
    80002090:	00074703          	lbu	a4,0(a4)
    80002094:	fe040693          	addi	a3,s0,-32
    80002098:	009687b3          	add	a5,a3,s1
    8000209c:	0014849b          	addiw	s1,s1,1
    800020a0:	fee78823          	sb	a4,-16(a5)
    } while ((x /= 10) != 0);
    800020a4:	0005071b          	sext.w	a4,a0
    800020a8:	02c5553b          	divuw	a0,a0,a2
    800020ac:	00900793          	li	a5,9
    800020b0:	fce7e2e3          	bltu	a5,a4,80002074 <_Z12printIntegerm+0x34>
    if (neg)
        buf[i++] = '-';

    while (--i >= 0) { __putc(buf[i]); }
    800020b4:	fff4849b          	addiw	s1,s1,-1
    800020b8:	0004ce63          	bltz	s1,800020d4 <_Z12printIntegerm+0x94>
    800020bc:	fe040793          	addi	a5,s0,-32
    800020c0:	009787b3          	add	a5,a5,s1
    800020c4:	ff07c503          	lbu	a0,-16(a5)
    800020c8:	00002097          	auipc	ra,0x2
    800020cc:	318080e7          	jalr	792(ra) # 800043e0 <__putc>
    800020d0:	fe5ff06f          	j	800020b4 <_Z12printIntegerm+0x74>
    Riscv::ms_sstatus(sstatus & Riscv::SSTATUS_SIE ? Riscv::SSTATUS_SIE : 0);
    800020d4:	0009091b          	sext.w	s2,s2
    800020d8:	00297913          	andi	s2,s2,2
    800020dc:	0009091b          	sext.w	s2,s2
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    800020e0:	10092073          	csrs	sstatus,s2
    800020e4:	03813083          	ld	ra,56(sp)
    800020e8:	03013403          	ld	s0,48(sp)
    800020ec:	02813483          	ld	s1,40(sp)
    800020f0:	02013903          	ld	s2,32(sp)
    800020f4:	04010113          	addi	sp,sp,64
    800020f8:	00008067          	ret

00000000800020fc <start>:
    800020fc:	ff010113          	addi	sp,sp,-16
    80002100:	00813423          	sd	s0,8(sp)
    80002104:	01010413          	addi	s0,sp,16
    80002108:	300027f3          	csrr	a5,mstatus
    8000210c:	ffffe737          	lui	a4,0xffffe
    80002110:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff7b6f>
    80002114:	00e7f7b3          	and	a5,a5,a4
    80002118:	00001737          	lui	a4,0x1
    8000211c:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80002120:	00e7e7b3          	or	a5,a5,a4
    80002124:	30079073          	csrw	mstatus,a5
    80002128:	00000797          	auipc	a5,0x0
    8000212c:	16078793          	addi	a5,a5,352 # 80002288 <system_main>
    80002130:	34179073          	csrw	mepc,a5
    80002134:	00000793          	li	a5,0
    80002138:	18079073          	csrw	satp,a5
    8000213c:	000107b7          	lui	a5,0x10
    80002140:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80002144:	30279073          	csrw	medeleg,a5
    80002148:	30379073          	csrw	mideleg,a5
    8000214c:	104027f3          	csrr	a5,sie
    80002150:	2227e793          	ori	a5,a5,546
    80002154:	10479073          	csrw	sie,a5
    80002158:	fff00793          	li	a5,-1
    8000215c:	00a7d793          	srli	a5,a5,0xa
    80002160:	3b079073          	csrw	pmpaddr0,a5
    80002164:	00f00793          	li	a5,15
    80002168:	3a079073          	csrw	pmpcfg0,a5
    8000216c:	f14027f3          	csrr	a5,mhartid
    80002170:	0200c737          	lui	a4,0x200c
    80002174:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80002178:	0007869b          	sext.w	a3,a5
    8000217c:	00269713          	slli	a4,a3,0x2
    80002180:	000f4637          	lui	a2,0xf4
    80002184:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80002188:	00d70733          	add	a4,a4,a3
    8000218c:	0037979b          	slliw	a5,a5,0x3
    80002190:	020046b7          	lui	a3,0x2004
    80002194:	00d787b3          	add	a5,a5,a3
    80002198:	00c585b3          	add	a1,a1,a2
    8000219c:	00371693          	slli	a3,a4,0x3
    800021a0:	00004717          	auipc	a4,0x4
    800021a4:	88070713          	addi	a4,a4,-1920 # 80005a20 <timer_scratch>
    800021a8:	00b7b023          	sd	a1,0(a5)
    800021ac:	00d70733          	add	a4,a4,a3
    800021b0:	00f73c23          	sd	a5,24(a4)
    800021b4:	02c73023          	sd	a2,32(a4)
    800021b8:	34071073          	csrw	mscratch,a4
    800021bc:	00000797          	auipc	a5,0x0
    800021c0:	6e478793          	addi	a5,a5,1764 # 800028a0 <timervec>
    800021c4:	30579073          	csrw	mtvec,a5
    800021c8:	300027f3          	csrr	a5,mstatus
    800021cc:	0087e793          	ori	a5,a5,8
    800021d0:	30079073          	csrw	mstatus,a5
    800021d4:	304027f3          	csrr	a5,mie
    800021d8:	0807e793          	ori	a5,a5,128
    800021dc:	30479073          	csrw	mie,a5
    800021e0:	f14027f3          	csrr	a5,mhartid
    800021e4:	0007879b          	sext.w	a5,a5
    800021e8:	00078213          	mv	tp,a5
    800021ec:	30200073          	mret
    800021f0:	00813403          	ld	s0,8(sp)
    800021f4:	01010113          	addi	sp,sp,16
    800021f8:	00008067          	ret

00000000800021fc <timerinit>:
    800021fc:	ff010113          	addi	sp,sp,-16
    80002200:	00813423          	sd	s0,8(sp)
    80002204:	01010413          	addi	s0,sp,16
    80002208:	f14027f3          	csrr	a5,mhartid
    8000220c:	0200c737          	lui	a4,0x200c
    80002210:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80002214:	0007869b          	sext.w	a3,a5
    80002218:	00269713          	slli	a4,a3,0x2
    8000221c:	000f4637          	lui	a2,0xf4
    80002220:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80002224:	00d70733          	add	a4,a4,a3
    80002228:	0037979b          	slliw	a5,a5,0x3
    8000222c:	020046b7          	lui	a3,0x2004
    80002230:	00d787b3          	add	a5,a5,a3
    80002234:	00c585b3          	add	a1,a1,a2
    80002238:	00371693          	slli	a3,a4,0x3
    8000223c:	00003717          	auipc	a4,0x3
    80002240:	7e470713          	addi	a4,a4,2020 # 80005a20 <timer_scratch>
    80002244:	00b7b023          	sd	a1,0(a5)
    80002248:	00d70733          	add	a4,a4,a3
    8000224c:	00f73c23          	sd	a5,24(a4)
    80002250:	02c73023          	sd	a2,32(a4)
    80002254:	34071073          	csrw	mscratch,a4
    80002258:	00000797          	auipc	a5,0x0
    8000225c:	64878793          	addi	a5,a5,1608 # 800028a0 <timervec>
    80002260:	30579073          	csrw	mtvec,a5
    80002264:	300027f3          	csrr	a5,mstatus
    80002268:	0087e793          	ori	a5,a5,8
    8000226c:	30079073          	csrw	mstatus,a5
    80002270:	304027f3          	csrr	a5,mie
    80002274:	0807e793          	ori	a5,a5,128
    80002278:	30479073          	csrw	mie,a5
    8000227c:	00813403          	ld	s0,8(sp)
    80002280:	01010113          	addi	sp,sp,16
    80002284:	00008067          	ret

0000000080002288 <system_main>:
    80002288:	fe010113          	addi	sp,sp,-32
    8000228c:	00813823          	sd	s0,16(sp)
    80002290:	00913423          	sd	s1,8(sp)
    80002294:	00113c23          	sd	ra,24(sp)
    80002298:	02010413          	addi	s0,sp,32
    8000229c:	00000097          	auipc	ra,0x0
    800022a0:	0c4080e7          	jalr	196(ra) # 80002360 <cpuid>
    800022a4:	00003497          	auipc	s1,0x3
    800022a8:	72c48493          	addi	s1,s1,1836 # 800059d0 <started>
    800022ac:	02050263          	beqz	a0,800022d0 <system_main+0x48>
    800022b0:	0004a783          	lw	a5,0(s1)
    800022b4:	0007879b          	sext.w	a5,a5
    800022b8:	fe078ce3          	beqz	a5,800022b0 <system_main+0x28>
    800022bc:	0ff0000f          	fence
    800022c0:	00003517          	auipc	a0,0x3
    800022c4:	ee050513          	addi	a0,a0,-288 # 800051a0 <_ZZ12printIntegermE6digits+0x40>
    800022c8:	00001097          	auipc	ra,0x1
    800022cc:	a74080e7          	jalr	-1420(ra) # 80002d3c <panic>
    800022d0:	00001097          	auipc	ra,0x1
    800022d4:	9c8080e7          	jalr	-1592(ra) # 80002c98 <consoleinit>
    800022d8:	00001097          	auipc	ra,0x1
    800022dc:	154080e7          	jalr	340(ra) # 8000342c <printfinit>
    800022e0:	00003517          	auipc	a0,0x3
    800022e4:	e5050513          	addi	a0,a0,-432 # 80005130 <kvmincrease+0xc30>
    800022e8:	00001097          	auipc	ra,0x1
    800022ec:	ab0080e7          	jalr	-1360(ra) # 80002d98 <__printf>
    800022f0:	00003517          	auipc	a0,0x3
    800022f4:	e8050513          	addi	a0,a0,-384 # 80005170 <_ZZ12printIntegermE6digits+0x10>
    800022f8:	00001097          	auipc	ra,0x1
    800022fc:	aa0080e7          	jalr	-1376(ra) # 80002d98 <__printf>
    80002300:	00003517          	auipc	a0,0x3
    80002304:	e3050513          	addi	a0,a0,-464 # 80005130 <kvmincrease+0xc30>
    80002308:	00001097          	auipc	ra,0x1
    8000230c:	a90080e7          	jalr	-1392(ra) # 80002d98 <__printf>
    80002310:	00001097          	auipc	ra,0x1
    80002314:	4a8080e7          	jalr	1192(ra) # 800037b8 <kinit>
    80002318:	00000097          	auipc	ra,0x0
    8000231c:	148080e7          	jalr	328(ra) # 80002460 <trapinit>
    80002320:	00000097          	auipc	ra,0x0
    80002324:	16c080e7          	jalr	364(ra) # 8000248c <trapinithart>
    80002328:	00000097          	auipc	ra,0x0
    8000232c:	5b8080e7          	jalr	1464(ra) # 800028e0 <plicinit>
    80002330:	00000097          	auipc	ra,0x0
    80002334:	5d8080e7          	jalr	1496(ra) # 80002908 <plicinithart>
    80002338:	00000097          	auipc	ra,0x0
    8000233c:	078080e7          	jalr	120(ra) # 800023b0 <userinit>
    80002340:	0ff0000f          	fence
    80002344:	00100793          	li	a5,1
    80002348:	00003517          	auipc	a0,0x3
    8000234c:	e4050513          	addi	a0,a0,-448 # 80005188 <_ZZ12printIntegermE6digits+0x28>
    80002350:	00f4a023          	sw	a5,0(s1)
    80002354:	00001097          	auipc	ra,0x1
    80002358:	a44080e7          	jalr	-1468(ra) # 80002d98 <__printf>
    8000235c:	0000006f          	j	8000235c <system_main+0xd4>

0000000080002360 <cpuid>:
    80002360:	ff010113          	addi	sp,sp,-16
    80002364:	00813423          	sd	s0,8(sp)
    80002368:	01010413          	addi	s0,sp,16
    8000236c:	00020513          	mv	a0,tp
    80002370:	00813403          	ld	s0,8(sp)
    80002374:	0005051b          	sext.w	a0,a0
    80002378:	01010113          	addi	sp,sp,16
    8000237c:	00008067          	ret

0000000080002380 <mycpu>:
    80002380:	ff010113          	addi	sp,sp,-16
    80002384:	00813423          	sd	s0,8(sp)
    80002388:	01010413          	addi	s0,sp,16
    8000238c:	00020793          	mv	a5,tp
    80002390:	00813403          	ld	s0,8(sp)
    80002394:	0007879b          	sext.w	a5,a5
    80002398:	00779793          	slli	a5,a5,0x7
    8000239c:	00004517          	auipc	a0,0x4
    800023a0:	6b450513          	addi	a0,a0,1716 # 80006a50 <cpus>
    800023a4:	00f50533          	add	a0,a0,a5
    800023a8:	01010113          	addi	sp,sp,16
    800023ac:	00008067          	ret

00000000800023b0 <userinit>:
    800023b0:	ff010113          	addi	sp,sp,-16
    800023b4:	00813423          	sd	s0,8(sp)
    800023b8:	01010413          	addi	s0,sp,16
    800023bc:	00813403          	ld	s0,8(sp)
    800023c0:	01010113          	addi	sp,sp,16
    800023c4:	fffff317          	auipc	t1,0xfffff
    800023c8:	34430067          	jr	836(t1) # 80001708 <main>

00000000800023cc <either_copyout>:
    800023cc:	ff010113          	addi	sp,sp,-16
    800023d0:	00813023          	sd	s0,0(sp)
    800023d4:	00113423          	sd	ra,8(sp)
    800023d8:	01010413          	addi	s0,sp,16
    800023dc:	02051663          	bnez	a0,80002408 <either_copyout+0x3c>
    800023e0:	00058513          	mv	a0,a1
    800023e4:	00060593          	mv	a1,a2
    800023e8:	0006861b          	sext.w	a2,a3
    800023ec:	00002097          	auipc	ra,0x2
    800023f0:	c58080e7          	jalr	-936(ra) # 80004044 <__memmove>
    800023f4:	00813083          	ld	ra,8(sp)
    800023f8:	00013403          	ld	s0,0(sp)
    800023fc:	00000513          	li	a0,0
    80002400:	01010113          	addi	sp,sp,16
    80002404:	00008067          	ret
    80002408:	00003517          	auipc	a0,0x3
    8000240c:	dc050513          	addi	a0,a0,-576 # 800051c8 <_ZZ12printIntegermE6digits+0x68>
    80002410:	00001097          	auipc	ra,0x1
    80002414:	92c080e7          	jalr	-1748(ra) # 80002d3c <panic>

0000000080002418 <either_copyin>:
    80002418:	ff010113          	addi	sp,sp,-16
    8000241c:	00813023          	sd	s0,0(sp)
    80002420:	00113423          	sd	ra,8(sp)
    80002424:	01010413          	addi	s0,sp,16
    80002428:	02059463          	bnez	a1,80002450 <either_copyin+0x38>
    8000242c:	00060593          	mv	a1,a2
    80002430:	0006861b          	sext.w	a2,a3
    80002434:	00002097          	auipc	ra,0x2
    80002438:	c10080e7          	jalr	-1008(ra) # 80004044 <__memmove>
    8000243c:	00813083          	ld	ra,8(sp)
    80002440:	00013403          	ld	s0,0(sp)
    80002444:	00000513          	li	a0,0
    80002448:	01010113          	addi	sp,sp,16
    8000244c:	00008067          	ret
    80002450:	00003517          	auipc	a0,0x3
    80002454:	da050513          	addi	a0,a0,-608 # 800051f0 <_ZZ12printIntegermE6digits+0x90>
    80002458:	00001097          	auipc	ra,0x1
    8000245c:	8e4080e7          	jalr	-1820(ra) # 80002d3c <panic>

0000000080002460 <trapinit>:
    80002460:	ff010113          	addi	sp,sp,-16
    80002464:	00813423          	sd	s0,8(sp)
    80002468:	01010413          	addi	s0,sp,16
    8000246c:	00813403          	ld	s0,8(sp)
    80002470:	00003597          	auipc	a1,0x3
    80002474:	da858593          	addi	a1,a1,-600 # 80005218 <_ZZ12printIntegermE6digits+0xb8>
    80002478:	00004517          	auipc	a0,0x4
    8000247c:	65850513          	addi	a0,a0,1624 # 80006ad0 <tickslock>
    80002480:	01010113          	addi	sp,sp,16
    80002484:	00001317          	auipc	t1,0x1
    80002488:	5c430067          	jr	1476(t1) # 80003a48 <initlock>

000000008000248c <trapinithart>:
    8000248c:	ff010113          	addi	sp,sp,-16
    80002490:	00813423          	sd	s0,8(sp)
    80002494:	01010413          	addi	s0,sp,16
    80002498:	00000797          	auipc	a5,0x0
    8000249c:	2f878793          	addi	a5,a5,760 # 80002790 <kernelvec>
    800024a0:	10579073          	csrw	stvec,a5
    800024a4:	00813403          	ld	s0,8(sp)
    800024a8:	01010113          	addi	sp,sp,16
    800024ac:	00008067          	ret

00000000800024b0 <usertrap>:
    800024b0:	ff010113          	addi	sp,sp,-16
    800024b4:	00813423          	sd	s0,8(sp)
    800024b8:	01010413          	addi	s0,sp,16
    800024bc:	00813403          	ld	s0,8(sp)
    800024c0:	01010113          	addi	sp,sp,16
    800024c4:	00008067          	ret

00000000800024c8 <usertrapret>:
    800024c8:	ff010113          	addi	sp,sp,-16
    800024cc:	00813423          	sd	s0,8(sp)
    800024d0:	01010413          	addi	s0,sp,16
    800024d4:	00813403          	ld	s0,8(sp)
    800024d8:	01010113          	addi	sp,sp,16
    800024dc:	00008067          	ret

00000000800024e0 <kerneltrap>:
    800024e0:	fe010113          	addi	sp,sp,-32
    800024e4:	00813823          	sd	s0,16(sp)
    800024e8:	00113c23          	sd	ra,24(sp)
    800024ec:	00913423          	sd	s1,8(sp)
    800024f0:	02010413          	addi	s0,sp,32
    800024f4:	142025f3          	csrr	a1,scause
    800024f8:	100027f3          	csrr	a5,sstatus
    800024fc:	0027f793          	andi	a5,a5,2
    80002500:	10079c63          	bnez	a5,80002618 <kerneltrap+0x138>
    80002504:	142027f3          	csrr	a5,scause
    80002508:	0207ce63          	bltz	a5,80002544 <kerneltrap+0x64>
    8000250c:	00003517          	auipc	a0,0x3
    80002510:	d5450513          	addi	a0,a0,-684 # 80005260 <_ZZ12printIntegermE6digits+0x100>
    80002514:	00001097          	auipc	ra,0x1
    80002518:	884080e7          	jalr	-1916(ra) # 80002d98 <__printf>
    8000251c:	141025f3          	csrr	a1,sepc
    80002520:	14302673          	csrr	a2,stval
    80002524:	00003517          	auipc	a0,0x3
    80002528:	d4c50513          	addi	a0,a0,-692 # 80005270 <_ZZ12printIntegermE6digits+0x110>
    8000252c:	00001097          	auipc	ra,0x1
    80002530:	86c080e7          	jalr	-1940(ra) # 80002d98 <__printf>
    80002534:	00003517          	auipc	a0,0x3
    80002538:	d5450513          	addi	a0,a0,-684 # 80005288 <_ZZ12printIntegermE6digits+0x128>
    8000253c:	00001097          	auipc	ra,0x1
    80002540:	800080e7          	jalr	-2048(ra) # 80002d3c <panic>
    80002544:	0ff7f713          	andi	a4,a5,255
    80002548:	00900693          	li	a3,9
    8000254c:	04d70063          	beq	a4,a3,8000258c <kerneltrap+0xac>
    80002550:	fff00713          	li	a4,-1
    80002554:	03f71713          	slli	a4,a4,0x3f
    80002558:	00170713          	addi	a4,a4,1
    8000255c:	fae798e3          	bne	a5,a4,8000250c <kerneltrap+0x2c>
    80002560:	00000097          	auipc	ra,0x0
    80002564:	e00080e7          	jalr	-512(ra) # 80002360 <cpuid>
    80002568:	06050663          	beqz	a0,800025d4 <kerneltrap+0xf4>
    8000256c:	144027f3          	csrr	a5,sip
    80002570:	ffd7f793          	andi	a5,a5,-3
    80002574:	14479073          	csrw	sip,a5
    80002578:	01813083          	ld	ra,24(sp)
    8000257c:	01013403          	ld	s0,16(sp)
    80002580:	00813483          	ld	s1,8(sp)
    80002584:	02010113          	addi	sp,sp,32
    80002588:	00008067          	ret
    8000258c:	00000097          	auipc	ra,0x0
    80002590:	3c8080e7          	jalr	968(ra) # 80002954 <plic_claim>
    80002594:	00a00793          	li	a5,10
    80002598:	00050493          	mv	s1,a0
    8000259c:	06f50863          	beq	a0,a5,8000260c <kerneltrap+0x12c>
    800025a0:	fc050ce3          	beqz	a0,80002578 <kerneltrap+0x98>
    800025a4:	00050593          	mv	a1,a0
    800025a8:	00003517          	auipc	a0,0x3
    800025ac:	c9850513          	addi	a0,a0,-872 # 80005240 <_ZZ12printIntegermE6digits+0xe0>
    800025b0:	00000097          	auipc	ra,0x0
    800025b4:	7e8080e7          	jalr	2024(ra) # 80002d98 <__printf>
    800025b8:	01013403          	ld	s0,16(sp)
    800025bc:	01813083          	ld	ra,24(sp)
    800025c0:	00048513          	mv	a0,s1
    800025c4:	00813483          	ld	s1,8(sp)
    800025c8:	02010113          	addi	sp,sp,32
    800025cc:	00000317          	auipc	t1,0x0
    800025d0:	3c030067          	jr	960(t1) # 8000298c <plic_complete>
    800025d4:	00004517          	auipc	a0,0x4
    800025d8:	4fc50513          	addi	a0,a0,1276 # 80006ad0 <tickslock>
    800025dc:	00001097          	auipc	ra,0x1
    800025e0:	490080e7          	jalr	1168(ra) # 80003a6c <acquire>
    800025e4:	00003717          	auipc	a4,0x3
    800025e8:	3f070713          	addi	a4,a4,1008 # 800059d4 <ticks>
    800025ec:	00072783          	lw	a5,0(a4)
    800025f0:	00004517          	auipc	a0,0x4
    800025f4:	4e050513          	addi	a0,a0,1248 # 80006ad0 <tickslock>
    800025f8:	0017879b          	addiw	a5,a5,1
    800025fc:	00f72023          	sw	a5,0(a4)
    80002600:	00001097          	auipc	ra,0x1
    80002604:	538080e7          	jalr	1336(ra) # 80003b38 <release>
    80002608:	f65ff06f          	j	8000256c <kerneltrap+0x8c>
    8000260c:	00001097          	auipc	ra,0x1
    80002610:	094080e7          	jalr	148(ra) # 800036a0 <uartintr>
    80002614:	fa5ff06f          	j	800025b8 <kerneltrap+0xd8>
    80002618:	00003517          	auipc	a0,0x3
    8000261c:	c0850513          	addi	a0,a0,-1016 # 80005220 <_ZZ12printIntegermE6digits+0xc0>
    80002620:	00000097          	auipc	ra,0x0
    80002624:	71c080e7          	jalr	1820(ra) # 80002d3c <panic>

0000000080002628 <clockintr>:
    80002628:	fe010113          	addi	sp,sp,-32
    8000262c:	00813823          	sd	s0,16(sp)
    80002630:	00913423          	sd	s1,8(sp)
    80002634:	00113c23          	sd	ra,24(sp)
    80002638:	02010413          	addi	s0,sp,32
    8000263c:	00004497          	auipc	s1,0x4
    80002640:	49448493          	addi	s1,s1,1172 # 80006ad0 <tickslock>
    80002644:	00048513          	mv	a0,s1
    80002648:	00001097          	auipc	ra,0x1
    8000264c:	424080e7          	jalr	1060(ra) # 80003a6c <acquire>
    80002650:	00003717          	auipc	a4,0x3
    80002654:	38470713          	addi	a4,a4,900 # 800059d4 <ticks>
    80002658:	00072783          	lw	a5,0(a4)
    8000265c:	01013403          	ld	s0,16(sp)
    80002660:	01813083          	ld	ra,24(sp)
    80002664:	00048513          	mv	a0,s1
    80002668:	0017879b          	addiw	a5,a5,1
    8000266c:	00813483          	ld	s1,8(sp)
    80002670:	00f72023          	sw	a5,0(a4)
    80002674:	02010113          	addi	sp,sp,32
    80002678:	00001317          	auipc	t1,0x1
    8000267c:	4c030067          	jr	1216(t1) # 80003b38 <release>

0000000080002680 <devintr>:
    80002680:	142027f3          	csrr	a5,scause
    80002684:	00000513          	li	a0,0
    80002688:	0007c463          	bltz	a5,80002690 <devintr+0x10>
    8000268c:	00008067          	ret
    80002690:	fe010113          	addi	sp,sp,-32
    80002694:	00813823          	sd	s0,16(sp)
    80002698:	00113c23          	sd	ra,24(sp)
    8000269c:	00913423          	sd	s1,8(sp)
    800026a0:	02010413          	addi	s0,sp,32
    800026a4:	0ff7f713          	andi	a4,a5,255
    800026a8:	00900693          	li	a3,9
    800026ac:	04d70c63          	beq	a4,a3,80002704 <devintr+0x84>
    800026b0:	fff00713          	li	a4,-1
    800026b4:	03f71713          	slli	a4,a4,0x3f
    800026b8:	00170713          	addi	a4,a4,1
    800026bc:	00e78c63          	beq	a5,a4,800026d4 <devintr+0x54>
    800026c0:	01813083          	ld	ra,24(sp)
    800026c4:	01013403          	ld	s0,16(sp)
    800026c8:	00813483          	ld	s1,8(sp)
    800026cc:	02010113          	addi	sp,sp,32
    800026d0:	00008067          	ret
    800026d4:	00000097          	auipc	ra,0x0
    800026d8:	c8c080e7          	jalr	-884(ra) # 80002360 <cpuid>
    800026dc:	06050663          	beqz	a0,80002748 <devintr+0xc8>
    800026e0:	144027f3          	csrr	a5,sip
    800026e4:	ffd7f793          	andi	a5,a5,-3
    800026e8:	14479073          	csrw	sip,a5
    800026ec:	01813083          	ld	ra,24(sp)
    800026f0:	01013403          	ld	s0,16(sp)
    800026f4:	00813483          	ld	s1,8(sp)
    800026f8:	00200513          	li	a0,2
    800026fc:	02010113          	addi	sp,sp,32
    80002700:	00008067          	ret
    80002704:	00000097          	auipc	ra,0x0
    80002708:	250080e7          	jalr	592(ra) # 80002954 <plic_claim>
    8000270c:	00a00793          	li	a5,10
    80002710:	00050493          	mv	s1,a0
    80002714:	06f50663          	beq	a0,a5,80002780 <devintr+0x100>
    80002718:	00100513          	li	a0,1
    8000271c:	fa0482e3          	beqz	s1,800026c0 <devintr+0x40>
    80002720:	00048593          	mv	a1,s1
    80002724:	00003517          	auipc	a0,0x3
    80002728:	b1c50513          	addi	a0,a0,-1252 # 80005240 <_ZZ12printIntegermE6digits+0xe0>
    8000272c:	00000097          	auipc	ra,0x0
    80002730:	66c080e7          	jalr	1644(ra) # 80002d98 <__printf>
    80002734:	00048513          	mv	a0,s1
    80002738:	00000097          	auipc	ra,0x0
    8000273c:	254080e7          	jalr	596(ra) # 8000298c <plic_complete>
    80002740:	00100513          	li	a0,1
    80002744:	f7dff06f          	j	800026c0 <devintr+0x40>
    80002748:	00004517          	auipc	a0,0x4
    8000274c:	38850513          	addi	a0,a0,904 # 80006ad0 <tickslock>
    80002750:	00001097          	auipc	ra,0x1
    80002754:	31c080e7          	jalr	796(ra) # 80003a6c <acquire>
    80002758:	00003717          	auipc	a4,0x3
    8000275c:	27c70713          	addi	a4,a4,636 # 800059d4 <ticks>
    80002760:	00072783          	lw	a5,0(a4)
    80002764:	00004517          	auipc	a0,0x4
    80002768:	36c50513          	addi	a0,a0,876 # 80006ad0 <tickslock>
    8000276c:	0017879b          	addiw	a5,a5,1
    80002770:	00f72023          	sw	a5,0(a4)
    80002774:	00001097          	auipc	ra,0x1
    80002778:	3c4080e7          	jalr	964(ra) # 80003b38 <release>
    8000277c:	f65ff06f          	j	800026e0 <devintr+0x60>
    80002780:	00001097          	auipc	ra,0x1
    80002784:	f20080e7          	jalr	-224(ra) # 800036a0 <uartintr>
    80002788:	fadff06f          	j	80002734 <devintr+0xb4>
    8000278c:	0000                	unimp
	...

0000000080002790 <kernelvec>:
    80002790:	f0010113          	addi	sp,sp,-256
    80002794:	00113023          	sd	ra,0(sp)
    80002798:	00213423          	sd	sp,8(sp)
    8000279c:	00313823          	sd	gp,16(sp)
    800027a0:	00413c23          	sd	tp,24(sp)
    800027a4:	02513023          	sd	t0,32(sp)
    800027a8:	02613423          	sd	t1,40(sp)
    800027ac:	02713823          	sd	t2,48(sp)
    800027b0:	02813c23          	sd	s0,56(sp)
    800027b4:	04913023          	sd	s1,64(sp)
    800027b8:	04a13423          	sd	a0,72(sp)
    800027bc:	04b13823          	sd	a1,80(sp)
    800027c0:	04c13c23          	sd	a2,88(sp)
    800027c4:	06d13023          	sd	a3,96(sp)
    800027c8:	06e13423          	sd	a4,104(sp)
    800027cc:	06f13823          	sd	a5,112(sp)
    800027d0:	07013c23          	sd	a6,120(sp)
    800027d4:	09113023          	sd	a7,128(sp)
    800027d8:	09213423          	sd	s2,136(sp)
    800027dc:	09313823          	sd	s3,144(sp)
    800027e0:	09413c23          	sd	s4,152(sp)
    800027e4:	0b513023          	sd	s5,160(sp)
    800027e8:	0b613423          	sd	s6,168(sp)
    800027ec:	0b713823          	sd	s7,176(sp)
    800027f0:	0b813c23          	sd	s8,184(sp)
    800027f4:	0d913023          	sd	s9,192(sp)
    800027f8:	0da13423          	sd	s10,200(sp)
    800027fc:	0db13823          	sd	s11,208(sp)
    80002800:	0dc13c23          	sd	t3,216(sp)
    80002804:	0fd13023          	sd	t4,224(sp)
    80002808:	0fe13423          	sd	t5,232(sp)
    8000280c:	0ff13823          	sd	t6,240(sp)
    80002810:	cd1ff0ef          	jal	ra,800024e0 <kerneltrap>
    80002814:	00013083          	ld	ra,0(sp)
    80002818:	00813103          	ld	sp,8(sp)
    8000281c:	01013183          	ld	gp,16(sp)
    80002820:	02013283          	ld	t0,32(sp)
    80002824:	02813303          	ld	t1,40(sp)
    80002828:	03013383          	ld	t2,48(sp)
    8000282c:	03813403          	ld	s0,56(sp)
    80002830:	04013483          	ld	s1,64(sp)
    80002834:	04813503          	ld	a0,72(sp)
    80002838:	05013583          	ld	a1,80(sp)
    8000283c:	05813603          	ld	a2,88(sp)
    80002840:	06013683          	ld	a3,96(sp)
    80002844:	06813703          	ld	a4,104(sp)
    80002848:	07013783          	ld	a5,112(sp)
    8000284c:	07813803          	ld	a6,120(sp)
    80002850:	08013883          	ld	a7,128(sp)
    80002854:	08813903          	ld	s2,136(sp)
    80002858:	09013983          	ld	s3,144(sp)
    8000285c:	09813a03          	ld	s4,152(sp)
    80002860:	0a013a83          	ld	s5,160(sp)
    80002864:	0a813b03          	ld	s6,168(sp)
    80002868:	0b013b83          	ld	s7,176(sp)
    8000286c:	0b813c03          	ld	s8,184(sp)
    80002870:	0c013c83          	ld	s9,192(sp)
    80002874:	0c813d03          	ld	s10,200(sp)
    80002878:	0d013d83          	ld	s11,208(sp)
    8000287c:	0d813e03          	ld	t3,216(sp)
    80002880:	0e013e83          	ld	t4,224(sp)
    80002884:	0e813f03          	ld	t5,232(sp)
    80002888:	0f013f83          	ld	t6,240(sp)
    8000288c:	10010113          	addi	sp,sp,256
    80002890:	10200073          	sret
    80002894:	00000013          	nop
    80002898:	00000013          	nop
    8000289c:	00000013          	nop

00000000800028a0 <timervec>:
    800028a0:	34051573          	csrrw	a0,mscratch,a0
    800028a4:	00b53023          	sd	a1,0(a0)
    800028a8:	00c53423          	sd	a2,8(a0)
    800028ac:	00d53823          	sd	a3,16(a0)
    800028b0:	01853583          	ld	a1,24(a0)
    800028b4:	02053603          	ld	a2,32(a0)
    800028b8:	0005b683          	ld	a3,0(a1)
    800028bc:	00c686b3          	add	a3,a3,a2
    800028c0:	00d5b023          	sd	a3,0(a1)
    800028c4:	00200593          	li	a1,2
    800028c8:	14459073          	csrw	sip,a1
    800028cc:	01053683          	ld	a3,16(a0)
    800028d0:	00853603          	ld	a2,8(a0)
    800028d4:	00053583          	ld	a1,0(a0)
    800028d8:	34051573          	csrrw	a0,mscratch,a0
    800028dc:	30200073          	mret

00000000800028e0 <plicinit>:
    800028e0:	ff010113          	addi	sp,sp,-16
    800028e4:	00813423          	sd	s0,8(sp)
    800028e8:	01010413          	addi	s0,sp,16
    800028ec:	00813403          	ld	s0,8(sp)
    800028f0:	0c0007b7          	lui	a5,0xc000
    800028f4:	00100713          	li	a4,1
    800028f8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    800028fc:	00e7a223          	sw	a4,4(a5)
    80002900:	01010113          	addi	sp,sp,16
    80002904:	00008067          	ret

0000000080002908 <plicinithart>:
    80002908:	ff010113          	addi	sp,sp,-16
    8000290c:	00813023          	sd	s0,0(sp)
    80002910:	00113423          	sd	ra,8(sp)
    80002914:	01010413          	addi	s0,sp,16
    80002918:	00000097          	auipc	ra,0x0
    8000291c:	a48080e7          	jalr	-1464(ra) # 80002360 <cpuid>
    80002920:	0085171b          	slliw	a4,a0,0x8
    80002924:	0c0027b7          	lui	a5,0xc002
    80002928:	00e787b3          	add	a5,a5,a4
    8000292c:	40200713          	li	a4,1026
    80002930:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80002934:	00813083          	ld	ra,8(sp)
    80002938:	00013403          	ld	s0,0(sp)
    8000293c:	00d5151b          	slliw	a0,a0,0xd
    80002940:	0c2017b7          	lui	a5,0xc201
    80002944:	00a78533          	add	a0,a5,a0
    80002948:	00052023          	sw	zero,0(a0)
    8000294c:	01010113          	addi	sp,sp,16
    80002950:	00008067          	ret

0000000080002954 <plic_claim>:
    80002954:	ff010113          	addi	sp,sp,-16
    80002958:	00813023          	sd	s0,0(sp)
    8000295c:	00113423          	sd	ra,8(sp)
    80002960:	01010413          	addi	s0,sp,16
    80002964:	00000097          	auipc	ra,0x0
    80002968:	9fc080e7          	jalr	-1540(ra) # 80002360 <cpuid>
    8000296c:	00813083          	ld	ra,8(sp)
    80002970:	00013403          	ld	s0,0(sp)
    80002974:	00d5151b          	slliw	a0,a0,0xd
    80002978:	0c2017b7          	lui	a5,0xc201
    8000297c:	00a78533          	add	a0,a5,a0
    80002980:	00452503          	lw	a0,4(a0)
    80002984:	01010113          	addi	sp,sp,16
    80002988:	00008067          	ret

000000008000298c <plic_complete>:
    8000298c:	fe010113          	addi	sp,sp,-32
    80002990:	00813823          	sd	s0,16(sp)
    80002994:	00913423          	sd	s1,8(sp)
    80002998:	00113c23          	sd	ra,24(sp)
    8000299c:	02010413          	addi	s0,sp,32
    800029a0:	00050493          	mv	s1,a0
    800029a4:	00000097          	auipc	ra,0x0
    800029a8:	9bc080e7          	jalr	-1604(ra) # 80002360 <cpuid>
    800029ac:	01813083          	ld	ra,24(sp)
    800029b0:	01013403          	ld	s0,16(sp)
    800029b4:	00d5179b          	slliw	a5,a0,0xd
    800029b8:	0c201737          	lui	a4,0xc201
    800029bc:	00f707b3          	add	a5,a4,a5
    800029c0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    800029c4:	00813483          	ld	s1,8(sp)
    800029c8:	02010113          	addi	sp,sp,32
    800029cc:	00008067          	ret

00000000800029d0 <consolewrite>:
    800029d0:	fb010113          	addi	sp,sp,-80
    800029d4:	04813023          	sd	s0,64(sp)
    800029d8:	04113423          	sd	ra,72(sp)
    800029dc:	02913c23          	sd	s1,56(sp)
    800029e0:	03213823          	sd	s2,48(sp)
    800029e4:	03313423          	sd	s3,40(sp)
    800029e8:	03413023          	sd	s4,32(sp)
    800029ec:	01513c23          	sd	s5,24(sp)
    800029f0:	05010413          	addi	s0,sp,80
    800029f4:	06c05c63          	blez	a2,80002a6c <consolewrite+0x9c>
    800029f8:	00060993          	mv	s3,a2
    800029fc:	00050a13          	mv	s4,a0
    80002a00:	00058493          	mv	s1,a1
    80002a04:	00000913          	li	s2,0
    80002a08:	fff00a93          	li	s5,-1
    80002a0c:	01c0006f          	j	80002a28 <consolewrite+0x58>
    80002a10:	fbf44503          	lbu	a0,-65(s0)
    80002a14:	0019091b          	addiw	s2,s2,1
    80002a18:	00148493          	addi	s1,s1,1
    80002a1c:	00001097          	auipc	ra,0x1
    80002a20:	a9c080e7          	jalr	-1380(ra) # 800034b8 <uartputc>
    80002a24:	03298063          	beq	s3,s2,80002a44 <consolewrite+0x74>
    80002a28:	00048613          	mv	a2,s1
    80002a2c:	00100693          	li	a3,1
    80002a30:	000a0593          	mv	a1,s4
    80002a34:	fbf40513          	addi	a0,s0,-65
    80002a38:	00000097          	auipc	ra,0x0
    80002a3c:	9e0080e7          	jalr	-1568(ra) # 80002418 <either_copyin>
    80002a40:	fd5518e3          	bne	a0,s5,80002a10 <consolewrite+0x40>
    80002a44:	04813083          	ld	ra,72(sp)
    80002a48:	04013403          	ld	s0,64(sp)
    80002a4c:	03813483          	ld	s1,56(sp)
    80002a50:	02813983          	ld	s3,40(sp)
    80002a54:	02013a03          	ld	s4,32(sp)
    80002a58:	01813a83          	ld	s5,24(sp)
    80002a5c:	00090513          	mv	a0,s2
    80002a60:	03013903          	ld	s2,48(sp)
    80002a64:	05010113          	addi	sp,sp,80
    80002a68:	00008067          	ret
    80002a6c:	00000913          	li	s2,0
    80002a70:	fd5ff06f          	j	80002a44 <consolewrite+0x74>

0000000080002a74 <consoleread>:
    80002a74:	f9010113          	addi	sp,sp,-112
    80002a78:	06813023          	sd	s0,96(sp)
    80002a7c:	04913c23          	sd	s1,88(sp)
    80002a80:	05213823          	sd	s2,80(sp)
    80002a84:	05313423          	sd	s3,72(sp)
    80002a88:	05413023          	sd	s4,64(sp)
    80002a8c:	03513c23          	sd	s5,56(sp)
    80002a90:	03613823          	sd	s6,48(sp)
    80002a94:	03713423          	sd	s7,40(sp)
    80002a98:	03813023          	sd	s8,32(sp)
    80002a9c:	06113423          	sd	ra,104(sp)
    80002aa0:	01913c23          	sd	s9,24(sp)
    80002aa4:	07010413          	addi	s0,sp,112
    80002aa8:	00060b93          	mv	s7,a2
    80002aac:	00050913          	mv	s2,a0
    80002ab0:	00058c13          	mv	s8,a1
    80002ab4:	00060b1b          	sext.w	s6,a2
    80002ab8:	00004497          	auipc	s1,0x4
    80002abc:	04048493          	addi	s1,s1,64 # 80006af8 <cons>
    80002ac0:	00400993          	li	s3,4
    80002ac4:	fff00a13          	li	s4,-1
    80002ac8:	00a00a93          	li	s5,10
    80002acc:	05705e63          	blez	s7,80002b28 <consoleread+0xb4>
    80002ad0:	09c4a703          	lw	a4,156(s1)
    80002ad4:	0984a783          	lw	a5,152(s1)
    80002ad8:	0007071b          	sext.w	a4,a4
    80002adc:	08e78463          	beq	a5,a4,80002b64 <consoleread+0xf0>
    80002ae0:	07f7f713          	andi	a4,a5,127
    80002ae4:	00e48733          	add	a4,s1,a4
    80002ae8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    80002aec:	0017869b          	addiw	a3,a5,1
    80002af0:	08d4ac23          	sw	a3,152(s1)
    80002af4:	00070c9b          	sext.w	s9,a4
    80002af8:	0b370663          	beq	a4,s3,80002ba4 <consoleread+0x130>
    80002afc:	00100693          	li	a3,1
    80002b00:	f9f40613          	addi	a2,s0,-97
    80002b04:	000c0593          	mv	a1,s8
    80002b08:	00090513          	mv	a0,s2
    80002b0c:	f8e40fa3          	sb	a4,-97(s0)
    80002b10:	00000097          	auipc	ra,0x0
    80002b14:	8bc080e7          	jalr	-1860(ra) # 800023cc <either_copyout>
    80002b18:	01450863          	beq	a0,s4,80002b28 <consoleread+0xb4>
    80002b1c:	001c0c13          	addi	s8,s8,1
    80002b20:	fffb8b9b          	addiw	s7,s7,-1
    80002b24:	fb5c94e3          	bne	s9,s5,80002acc <consoleread+0x58>
    80002b28:	000b851b          	sext.w	a0,s7
    80002b2c:	06813083          	ld	ra,104(sp)
    80002b30:	06013403          	ld	s0,96(sp)
    80002b34:	05813483          	ld	s1,88(sp)
    80002b38:	05013903          	ld	s2,80(sp)
    80002b3c:	04813983          	ld	s3,72(sp)
    80002b40:	04013a03          	ld	s4,64(sp)
    80002b44:	03813a83          	ld	s5,56(sp)
    80002b48:	02813b83          	ld	s7,40(sp)
    80002b4c:	02013c03          	ld	s8,32(sp)
    80002b50:	01813c83          	ld	s9,24(sp)
    80002b54:	40ab053b          	subw	a0,s6,a0
    80002b58:	03013b03          	ld	s6,48(sp)
    80002b5c:	07010113          	addi	sp,sp,112
    80002b60:	00008067          	ret
    80002b64:	00001097          	auipc	ra,0x1
    80002b68:	1d8080e7          	jalr	472(ra) # 80003d3c <push_on>
    80002b6c:	0984a703          	lw	a4,152(s1)
    80002b70:	09c4a783          	lw	a5,156(s1)
    80002b74:	0007879b          	sext.w	a5,a5
    80002b78:	fef70ce3          	beq	a4,a5,80002b70 <consoleread+0xfc>
    80002b7c:	00001097          	auipc	ra,0x1
    80002b80:	234080e7          	jalr	564(ra) # 80003db0 <pop_on>
    80002b84:	0984a783          	lw	a5,152(s1)
    80002b88:	07f7f713          	andi	a4,a5,127
    80002b8c:	00e48733          	add	a4,s1,a4
    80002b90:	01874703          	lbu	a4,24(a4)
    80002b94:	0017869b          	addiw	a3,a5,1
    80002b98:	08d4ac23          	sw	a3,152(s1)
    80002b9c:	00070c9b          	sext.w	s9,a4
    80002ba0:	f5371ee3          	bne	a4,s3,80002afc <consoleread+0x88>
    80002ba4:	000b851b          	sext.w	a0,s7
    80002ba8:	f96bf2e3          	bgeu	s7,s6,80002b2c <consoleread+0xb8>
    80002bac:	08f4ac23          	sw	a5,152(s1)
    80002bb0:	f7dff06f          	j	80002b2c <consoleread+0xb8>

0000000080002bb4 <consputc>:
    80002bb4:	10000793          	li	a5,256
    80002bb8:	00f50663          	beq	a0,a5,80002bc4 <consputc+0x10>
    80002bbc:	00001317          	auipc	t1,0x1
    80002bc0:	9f430067          	jr	-1548(t1) # 800035b0 <uartputc_sync>
    80002bc4:	ff010113          	addi	sp,sp,-16
    80002bc8:	00113423          	sd	ra,8(sp)
    80002bcc:	00813023          	sd	s0,0(sp)
    80002bd0:	01010413          	addi	s0,sp,16
    80002bd4:	00800513          	li	a0,8
    80002bd8:	00001097          	auipc	ra,0x1
    80002bdc:	9d8080e7          	jalr	-1576(ra) # 800035b0 <uartputc_sync>
    80002be0:	02000513          	li	a0,32
    80002be4:	00001097          	auipc	ra,0x1
    80002be8:	9cc080e7          	jalr	-1588(ra) # 800035b0 <uartputc_sync>
    80002bec:	00013403          	ld	s0,0(sp)
    80002bf0:	00813083          	ld	ra,8(sp)
    80002bf4:	00800513          	li	a0,8
    80002bf8:	01010113          	addi	sp,sp,16
    80002bfc:	00001317          	auipc	t1,0x1
    80002c00:	9b430067          	jr	-1612(t1) # 800035b0 <uartputc_sync>

0000000080002c04 <consoleintr>:
    80002c04:	fe010113          	addi	sp,sp,-32
    80002c08:	00813823          	sd	s0,16(sp)
    80002c0c:	00913423          	sd	s1,8(sp)
    80002c10:	01213023          	sd	s2,0(sp)
    80002c14:	00113c23          	sd	ra,24(sp)
    80002c18:	02010413          	addi	s0,sp,32
    80002c1c:	00004917          	auipc	s2,0x4
    80002c20:	edc90913          	addi	s2,s2,-292 # 80006af8 <cons>
    80002c24:	00050493          	mv	s1,a0
    80002c28:	00090513          	mv	a0,s2
    80002c2c:	00001097          	auipc	ra,0x1
    80002c30:	e40080e7          	jalr	-448(ra) # 80003a6c <acquire>
    80002c34:	02048c63          	beqz	s1,80002c6c <consoleintr+0x68>
    80002c38:	0a092783          	lw	a5,160(s2)
    80002c3c:	09892703          	lw	a4,152(s2)
    80002c40:	07f00693          	li	a3,127
    80002c44:	40e7873b          	subw	a4,a5,a4
    80002c48:	02e6e263          	bltu	a3,a4,80002c6c <consoleintr+0x68>
    80002c4c:	00d00713          	li	a4,13
    80002c50:	04e48063          	beq	s1,a4,80002c90 <consoleintr+0x8c>
    80002c54:	07f7f713          	andi	a4,a5,127
    80002c58:	00e90733          	add	a4,s2,a4
    80002c5c:	0017879b          	addiw	a5,a5,1
    80002c60:	0af92023          	sw	a5,160(s2)
    80002c64:	00970c23          	sb	s1,24(a4)
    80002c68:	08f92e23          	sw	a5,156(s2)
    80002c6c:	01013403          	ld	s0,16(sp)
    80002c70:	01813083          	ld	ra,24(sp)
    80002c74:	00813483          	ld	s1,8(sp)
    80002c78:	00013903          	ld	s2,0(sp)
    80002c7c:	00004517          	auipc	a0,0x4
    80002c80:	e7c50513          	addi	a0,a0,-388 # 80006af8 <cons>
    80002c84:	02010113          	addi	sp,sp,32
    80002c88:	00001317          	auipc	t1,0x1
    80002c8c:	eb030067          	jr	-336(t1) # 80003b38 <release>
    80002c90:	00a00493          	li	s1,10
    80002c94:	fc1ff06f          	j	80002c54 <consoleintr+0x50>

0000000080002c98 <consoleinit>:
    80002c98:	fe010113          	addi	sp,sp,-32
    80002c9c:	00113c23          	sd	ra,24(sp)
    80002ca0:	00813823          	sd	s0,16(sp)
    80002ca4:	00913423          	sd	s1,8(sp)
    80002ca8:	02010413          	addi	s0,sp,32
    80002cac:	00004497          	auipc	s1,0x4
    80002cb0:	e4c48493          	addi	s1,s1,-436 # 80006af8 <cons>
    80002cb4:	00048513          	mv	a0,s1
    80002cb8:	00002597          	auipc	a1,0x2
    80002cbc:	5e058593          	addi	a1,a1,1504 # 80005298 <_ZZ12printIntegermE6digits+0x138>
    80002cc0:	00001097          	auipc	ra,0x1
    80002cc4:	d88080e7          	jalr	-632(ra) # 80003a48 <initlock>
    80002cc8:	00000097          	auipc	ra,0x0
    80002ccc:	7ac080e7          	jalr	1964(ra) # 80003474 <uartinit>
    80002cd0:	01813083          	ld	ra,24(sp)
    80002cd4:	01013403          	ld	s0,16(sp)
    80002cd8:	00000797          	auipc	a5,0x0
    80002cdc:	d9c78793          	addi	a5,a5,-612 # 80002a74 <consoleread>
    80002ce0:	0af4bc23          	sd	a5,184(s1)
    80002ce4:	00000797          	auipc	a5,0x0
    80002ce8:	cec78793          	addi	a5,a5,-788 # 800029d0 <consolewrite>
    80002cec:	0cf4b023          	sd	a5,192(s1)
    80002cf0:	00813483          	ld	s1,8(sp)
    80002cf4:	02010113          	addi	sp,sp,32
    80002cf8:	00008067          	ret

0000000080002cfc <console_read>:
    80002cfc:	ff010113          	addi	sp,sp,-16
    80002d00:	00813423          	sd	s0,8(sp)
    80002d04:	01010413          	addi	s0,sp,16
    80002d08:	00813403          	ld	s0,8(sp)
    80002d0c:	00004317          	auipc	t1,0x4
    80002d10:	ea433303          	ld	t1,-348(t1) # 80006bb0 <devsw+0x10>
    80002d14:	01010113          	addi	sp,sp,16
    80002d18:	00030067          	jr	t1

0000000080002d1c <console_write>:
    80002d1c:	ff010113          	addi	sp,sp,-16
    80002d20:	00813423          	sd	s0,8(sp)
    80002d24:	01010413          	addi	s0,sp,16
    80002d28:	00813403          	ld	s0,8(sp)
    80002d2c:	00004317          	auipc	t1,0x4
    80002d30:	e8c33303          	ld	t1,-372(t1) # 80006bb8 <devsw+0x18>
    80002d34:	01010113          	addi	sp,sp,16
    80002d38:	00030067          	jr	t1

0000000080002d3c <panic>:
    80002d3c:	fe010113          	addi	sp,sp,-32
    80002d40:	00113c23          	sd	ra,24(sp)
    80002d44:	00813823          	sd	s0,16(sp)
    80002d48:	00913423          	sd	s1,8(sp)
    80002d4c:	02010413          	addi	s0,sp,32
    80002d50:	00050493          	mv	s1,a0
    80002d54:	00002517          	auipc	a0,0x2
    80002d58:	54c50513          	addi	a0,a0,1356 # 800052a0 <_ZZ12printIntegermE6digits+0x140>
    80002d5c:	00004797          	auipc	a5,0x4
    80002d60:	ee07ae23          	sw	zero,-260(a5) # 80006c58 <pr+0x18>
    80002d64:	00000097          	auipc	ra,0x0
    80002d68:	034080e7          	jalr	52(ra) # 80002d98 <__printf>
    80002d6c:	00048513          	mv	a0,s1
    80002d70:	00000097          	auipc	ra,0x0
    80002d74:	028080e7          	jalr	40(ra) # 80002d98 <__printf>
    80002d78:	00002517          	auipc	a0,0x2
    80002d7c:	3b850513          	addi	a0,a0,952 # 80005130 <kvmincrease+0xc30>
    80002d80:	00000097          	auipc	ra,0x0
    80002d84:	018080e7          	jalr	24(ra) # 80002d98 <__printf>
    80002d88:	00100793          	li	a5,1
    80002d8c:	00003717          	auipc	a4,0x3
    80002d90:	c4f72623          	sw	a5,-948(a4) # 800059d8 <panicked>
    80002d94:	0000006f          	j	80002d94 <panic+0x58>

0000000080002d98 <__printf>:
    80002d98:	f3010113          	addi	sp,sp,-208
    80002d9c:	08813023          	sd	s0,128(sp)
    80002da0:	07313423          	sd	s3,104(sp)
    80002da4:	09010413          	addi	s0,sp,144
    80002da8:	05813023          	sd	s8,64(sp)
    80002dac:	08113423          	sd	ra,136(sp)
    80002db0:	06913c23          	sd	s1,120(sp)
    80002db4:	07213823          	sd	s2,112(sp)
    80002db8:	07413023          	sd	s4,96(sp)
    80002dbc:	05513c23          	sd	s5,88(sp)
    80002dc0:	05613823          	sd	s6,80(sp)
    80002dc4:	05713423          	sd	s7,72(sp)
    80002dc8:	03913c23          	sd	s9,56(sp)
    80002dcc:	03a13823          	sd	s10,48(sp)
    80002dd0:	03b13423          	sd	s11,40(sp)
    80002dd4:	00004317          	auipc	t1,0x4
    80002dd8:	e6c30313          	addi	t1,t1,-404 # 80006c40 <pr>
    80002ddc:	01832c03          	lw	s8,24(t1)
    80002de0:	00b43423          	sd	a1,8(s0)
    80002de4:	00c43823          	sd	a2,16(s0)
    80002de8:	00d43c23          	sd	a3,24(s0)
    80002dec:	02e43023          	sd	a4,32(s0)
    80002df0:	02f43423          	sd	a5,40(s0)
    80002df4:	03043823          	sd	a6,48(s0)
    80002df8:	03143c23          	sd	a7,56(s0)
    80002dfc:	00050993          	mv	s3,a0
    80002e00:	4a0c1663          	bnez	s8,800032ac <__printf+0x514>
    80002e04:	60098c63          	beqz	s3,8000341c <__printf+0x684>
    80002e08:	0009c503          	lbu	a0,0(s3)
    80002e0c:	00840793          	addi	a5,s0,8
    80002e10:	f6f43c23          	sd	a5,-136(s0)
    80002e14:	00000493          	li	s1,0
    80002e18:	22050063          	beqz	a0,80003038 <__printf+0x2a0>
    80002e1c:	00002a37          	lui	s4,0x2
    80002e20:	00018ab7          	lui	s5,0x18
    80002e24:	000f4b37          	lui	s6,0xf4
    80002e28:	00989bb7          	lui	s7,0x989
    80002e2c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80002e30:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80002e34:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80002e38:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80002e3c:	00148c9b          	addiw	s9,s1,1
    80002e40:	02500793          	li	a5,37
    80002e44:	01998933          	add	s2,s3,s9
    80002e48:	38f51263          	bne	a0,a5,800031cc <__printf+0x434>
    80002e4c:	00094783          	lbu	a5,0(s2)
    80002e50:	00078c9b          	sext.w	s9,a5
    80002e54:	1e078263          	beqz	a5,80003038 <__printf+0x2a0>
    80002e58:	0024849b          	addiw	s1,s1,2
    80002e5c:	07000713          	li	a4,112
    80002e60:	00998933          	add	s2,s3,s1
    80002e64:	38e78a63          	beq	a5,a4,800031f8 <__printf+0x460>
    80002e68:	20f76863          	bltu	a4,a5,80003078 <__printf+0x2e0>
    80002e6c:	42a78863          	beq	a5,a0,8000329c <__printf+0x504>
    80002e70:	06400713          	li	a4,100
    80002e74:	40e79663          	bne	a5,a4,80003280 <__printf+0x4e8>
    80002e78:	f7843783          	ld	a5,-136(s0)
    80002e7c:	0007a603          	lw	a2,0(a5)
    80002e80:	00878793          	addi	a5,a5,8
    80002e84:	f6f43c23          	sd	a5,-136(s0)
    80002e88:	42064a63          	bltz	a2,800032bc <__printf+0x524>
    80002e8c:	00a00713          	li	a4,10
    80002e90:	02e677bb          	remuw	a5,a2,a4
    80002e94:	00002d97          	auipc	s11,0x2
    80002e98:	434d8d93          	addi	s11,s11,1076 # 800052c8 <digits>
    80002e9c:	00900593          	li	a1,9
    80002ea0:	0006051b          	sext.w	a0,a2
    80002ea4:	00000c93          	li	s9,0
    80002ea8:	02079793          	slli	a5,a5,0x20
    80002eac:	0207d793          	srli	a5,a5,0x20
    80002eb0:	00fd87b3          	add	a5,s11,a5
    80002eb4:	0007c783          	lbu	a5,0(a5)
    80002eb8:	02e656bb          	divuw	a3,a2,a4
    80002ebc:	f8f40023          	sb	a5,-128(s0)
    80002ec0:	14c5d863          	bge	a1,a2,80003010 <__printf+0x278>
    80002ec4:	06300593          	li	a1,99
    80002ec8:	00100c93          	li	s9,1
    80002ecc:	02e6f7bb          	remuw	a5,a3,a4
    80002ed0:	02079793          	slli	a5,a5,0x20
    80002ed4:	0207d793          	srli	a5,a5,0x20
    80002ed8:	00fd87b3          	add	a5,s11,a5
    80002edc:	0007c783          	lbu	a5,0(a5)
    80002ee0:	02e6d73b          	divuw	a4,a3,a4
    80002ee4:	f8f400a3          	sb	a5,-127(s0)
    80002ee8:	12a5f463          	bgeu	a1,a0,80003010 <__printf+0x278>
    80002eec:	00a00693          	li	a3,10
    80002ef0:	00900593          	li	a1,9
    80002ef4:	02d777bb          	remuw	a5,a4,a3
    80002ef8:	02079793          	slli	a5,a5,0x20
    80002efc:	0207d793          	srli	a5,a5,0x20
    80002f00:	00fd87b3          	add	a5,s11,a5
    80002f04:	0007c503          	lbu	a0,0(a5)
    80002f08:	02d757bb          	divuw	a5,a4,a3
    80002f0c:	f8a40123          	sb	a0,-126(s0)
    80002f10:	48e5f263          	bgeu	a1,a4,80003394 <__printf+0x5fc>
    80002f14:	06300513          	li	a0,99
    80002f18:	02d7f5bb          	remuw	a1,a5,a3
    80002f1c:	02059593          	slli	a1,a1,0x20
    80002f20:	0205d593          	srli	a1,a1,0x20
    80002f24:	00bd85b3          	add	a1,s11,a1
    80002f28:	0005c583          	lbu	a1,0(a1)
    80002f2c:	02d7d7bb          	divuw	a5,a5,a3
    80002f30:	f8b401a3          	sb	a1,-125(s0)
    80002f34:	48e57263          	bgeu	a0,a4,800033b8 <__printf+0x620>
    80002f38:	3e700513          	li	a0,999
    80002f3c:	02d7f5bb          	remuw	a1,a5,a3
    80002f40:	02059593          	slli	a1,a1,0x20
    80002f44:	0205d593          	srli	a1,a1,0x20
    80002f48:	00bd85b3          	add	a1,s11,a1
    80002f4c:	0005c583          	lbu	a1,0(a1)
    80002f50:	02d7d7bb          	divuw	a5,a5,a3
    80002f54:	f8b40223          	sb	a1,-124(s0)
    80002f58:	46e57663          	bgeu	a0,a4,800033c4 <__printf+0x62c>
    80002f5c:	02d7f5bb          	remuw	a1,a5,a3
    80002f60:	02059593          	slli	a1,a1,0x20
    80002f64:	0205d593          	srli	a1,a1,0x20
    80002f68:	00bd85b3          	add	a1,s11,a1
    80002f6c:	0005c583          	lbu	a1,0(a1)
    80002f70:	02d7d7bb          	divuw	a5,a5,a3
    80002f74:	f8b402a3          	sb	a1,-123(s0)
    80002f78:	46ea7863          	bgeu	s4,a4,800033e8 <__printf+0x650>
    80002f7c:	02d7f5bb          	remuw	a1,a5,a3
    80002f80:	02059593          	slli	a1,a1,0x20
    80002f84:	0205d593          	srli	a1,a1,0x20
    80002f88:	00bd85b3          	add	a1,s11,a1
    80002f8c:	0005c583          	lbu	a1,0(a1)
    80002f90:	02d7d7bb          	divuw	a5,a5,a3
    80002f94:	f8b40323          	sb	a1,-122(s0)
    80002f98:	3eeaf863          	bgeu	s5,a4,80003388 <__printf+0x5f0>
    80002f9c:	02d7f5bb          	remuw	a1,a5,a3
    80002fa0:	02059593          	slli	a1,a1,0x20
    80002fa4:	0205d593          	srli	a1,a1,0x20
    80002fa8:	00bd85b3          	add	a1,s11,a1
    80002fac:	0005c583          	lbu	a1,0(a1)
    80002fb0:	02d7d7bb          	divuw	a5,a5,a3
    80002fb4:	f8b403a3          	sb	a1,-121(s0)
    80002fb8:	42eb7e63          	bgeu	s6,a4,800033f4 <__printf+0x65c>
    80002fbc:	02d7f5bb          	remuw	a1,a5,a3
    80002fc0:	02059593          	slli	a1,a1,0x20
    80002fc4:	0205d593          	srli	a1,a1,0x20
    80002fc8:	00bd85b3          	add	a1,s11,a1
    80002fcc:	0005c583          	lbu	a1,0(a1)
    80002fd0:	02d7d7bb          	divuw	a5,a5,a3
    80002fd4:	f8b40423          	sb	a1,-120(s0)
    80002fd8:	42ebfc63          	bgeu	s7,a4,80003410 <__printf+0x678>
    80002fdc:	02079793          	slli	a5,a5,0x20
    80002fe0:	0207d793          	srli	a5,a5,0x20
    80002fe4:	00fd8db3          	add	s11,s11,a5
    80002fe8:	000dc703          	lbu	a4,0(s11)
    80002fec:	00a00793          	li	a5,10
    80002ff0:	00900c93          	li	s9,9
    80002ff4:	f8e404a3          	sb	a4,-119(s0)
    80002ff8:	00065c63          	bgez	a2,80003010 <__printf+0x278>
    80002ffc:	f9040713          	addi	a4,s0,-112
    80003000:	00f70733          	add	a4,a4,a5
    80003004:	02d00693          	li	a3,45
    80003008:	fed70823          	sb	a3,-16(a4)
    8000300c:	00078c93          	mv	s9,a5
    80003010:	f8040793          	addi	a5,s0,-128
    80003014:	01978cb3          	add	s9,a5,s9
    80003018:	f7f40d13          	addi	s10,s0,-129
    8000301c:	000cc503          	lbu	a0,0(s9)
    80003020:	fffc8c93          	addi	s9,s9,-1
    80003024:	00000097          	auipc	ra,0x0
    80003028:	b90080e7          	jalr	-1136(ra) # 80002bb4 <consputc>
    8000302c:	ffac98e3          	bne	s9,s10,8000301c <__printf+0x284>
    80003030:	00094503          	lbu	a0,0(s2)
    80003034:	e00514e3          	bnez	a0,80002e3c <__printf+0xa4>
    80003038:	1a0c1663          	bnez	s8,800031e4 <__printf+0x44c>
    8000303c:	08813083          	ld	ra,136(sp)
    80003040:	08013403          	ld	s0,128(sp)
    80003044:	07813483          	ld	s1,120(sp)
    80003048:	07013903          	ld	s2,112(sp)
    8000304c:	06813983          	ld	s3,104(sp)
    80003050:	06013a03          	ld	s4,96(sp)
    80003054:	05813a83          	ld	s5,88(sp)
    80003058:	05013b03          	ld	s6,80(sp)
    8000305c:	04813b83          	ld	s7,72(sp)
    80003060:	04013c03          	ld	s8,64(sp)
    80003064:	03813c83          	ld	s9,56(sp)
    80003068:	03013d03          	ld	s10,48(sp)
    8000306c:	02813d83          	ld	s11,40(sp)
    80003070:	0d010113          	addi	sp,sp,208
    80003074:	00008067          	ret
    80003078:	07300713          	li	a4,115
    8000307c:	1ce78a63          	beq	a5,a4,80003250 <__printf+0x4b8>
    80003080:	07800713          	li	a4,120
    80003084:	1ee79e63          	bne	a5,a4,80003280 <__printf+0x4e8>
    80003088:	f7843783          	ld	a5,-136(s0)
    8000308c:	0007a703          	lw	a4,0(a5)
    80003090:	00878793          	addi	a5,a5,8
    80003094:	f6f43c23          	sd	a5,-136(s0)
    80003098:	28074263          	bltz	a4,8000331c <__printf+0x584>
    8000309c:	00002d97          	auipc	s11,0x2
    800030a0:	22cd8d93          	addi	s11,s11,556 # 800052c8 <digits>
    800030a4:	00f77793          	andi	a5,a4,15
    800030a8:	00fd87b3          	add	a5,s11,a5
    800030ac:	0007c683          	lbu	a3,0(a5)
    800030b0:	00f00613          	li	a2,15
    800030b4:	0007079b          	sext.w	a5,a4
    800030b8:	f8d40023          	sb	a3,-128(s0)
    800030bc:	0047559b          	srliw	a1,a4,0x4
    800030c0:	0047569b          	srliw	a3,a4,0x4
    800030c4:	00000c93          	li	s9,0
    800030c8:	0ee65063          	bge	a2,a4,800031a8 <__printf+0x410>
    800030cc:	00f6f693          	andi	a3,a3,15
    800030d0:	00dd86b3          	add	a3,s11,a3
    800030d4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    800030d8:	0087d79b          	srliw	a5,a5,0x8
    800030dc:	00100c93          	li	s9,1
    800030e0:	f8d400a3          	sb	a3,-127(s0)
    800030e4:	0cb67263          	bgeu	a2,a1,800031a8 <__printf+0x410>
    800030e8:	00f7f693          	andi	a3,a5,15
    800030ec:	00dd86b3          	add	a3,s11,a3
    800030f0:	0006c583          	lbu	a1,0(a3)
    800030f4:	00f00613          	li	a2,15
    800030f8:	0047d69b          	srliw	a3,a5,0x4
    800030fc:	f8b40123          	sb	a1,-126(s0)
    80003100:	0047d593          	srli	a1,a5,0x4
    80003104:	28f67e63          	bgeu	a2,a5,800033a0 <__printf+0x608>
    80003108:	00f6f693          	andi	a3,a3,15
    8000310c:	00dd86b3          	add	a3,s11,a3
    80003110:	0006c503          	lbu	a0,0(a3)
    80003114:	0087d813          	srli	a6,a5,0x8
    80003118:	0087d69b          	srliw	a3,a5,0x8
    8000311c:	f8a401a3          	sb	a0,-125(s0)
    80003120:	28b67663          	bgeu	a2,a1,800033ac <__printf+0x614>
    80003124:	00f6f693          	andi	a3,a3,15
    80003128:	00dd86b3          	add	a3,s11,a3
    8000312c:	0006c583          	lbu	a1,0(a3)
    80003130:	00c7d513          	srli	a0,a5,0xc
    80003134:	00c7d69b          	srliw	a3,a5,0xc
    80003138:	f8b40223          	sb	a1,-124(s0)
    8000313c:	29067a63          	bgeu	a2,a6,800033d0 <__printf+0x638>
    80003140:	00f6f693          	andi	a3,a3,15
    80003144:	00dd86b3          	add	a3,s11,a3
    80003148:	0006c583          	lbu	a1,0(a3)
    8000314c:	0107d813          	srli	a6,a5,0x10
    80003150:	0107d69b          	srliw	a3,a5,0x10
    80003154:	f8b402a3          	sb	a1,-123(s0)
    80003158:	28a67263          	bgeu	a2,a0,800033dc <__printf+0x644>
    8000315c:	00f6f693          	andi	a3,a3,15
    80003160:	00dd86b3          	add	a3,s11,a3
    80003164:	0006c683          	lbu	a3,0(a3)
    80003168:	0147d79b          	srliw	a5,a5,0x14
    8000316c:	f8d40323          	sb	a3,-122(s0)
    80003170:	21067663          	bgeu	a2,a6,8000337c <__printf+0x5e4>
    80003174:	02079793          	slli	a5,a5,0x20
    80003178:	0207d793          	srli	a5,a5,0x20
    8000317c:	00fd8db3          	add	s11,s11,a5
    80003180:	000dc683          	lbu	a3,0(s11)
    80003184:	00800793          	li	a5,8
    80003188:	00700c93          	li	s9,7
    8000318c:	f8d403a3          	sb	a3,-121(s0)
    80003190:	00075c63          	bgez	a4,800031a8 <__printf+0x410>
    80003194:	f9040713          	addi	a4,s0,-112
    80003198:	00f70733          	add	a4,a4,a5
    8000319c:	02d00693          	li	a3,45
    800031a0:	fed70823          	sb	a3,-16(a4)
    800031a4:	00078c93          	mv	s9,a5
    800031a8:	f8040793          	addi	a5,s0,-128
    800031ac:	01978cb3          	add	s9,a5,s9
    800031b0:	f7f40d13          	addi	s10,s0,-129
    800031b4:	000cc503          	lbu	a0,0(s9)
    800031b8:	fffc8c93          	addi	s9,s9,-1
    800031bc:	00000097          	auipc	ra,0x0
    800031c0:	9f8080e7          	jalr	-1544(ra) # 80002bb4 <consputc>
    800031c4:	ff9d18e3          	bne	s10,s9,800031b4 <__printf+0x41c>
    800031c8:	0100006f          	j	800031d8 <__printf+0x440>
    800031cc:	00000097          	auipc	ra,0x0
    800031d0:	9e8080e7          	jalr	-1560(ra) # 80002bb4 <consputc>
    800031d4:	000c8493          	mv	s1,s9
    800031d8:	00094503          	lbu	a0,0(s2)
    800031dc:	c60510e3          	bnez	a0,80002e3c <__printf+0xa4>
    800031e0:	e40c0ee3          	beqz	s8,8000303c <__printf+0x2a4>
    800031e4:	00004517          	auipc	a0,0x4
    800031e8:	a5c50513          	addi	a0,a0,-1444 # 80006c40 <pr>
    800031ec:	00001097          	auipc	ra,0x1
    800031f0:	94c080e7          	jalr	-1716(ra) # 80003b38 <release>
    800031f4:	e49ff06f          	j	8000303c <__printf+0x2a4>
    800031f8:	f7843783          	ld	a5,-136(s0)
    800031fc:	03000513          	li	a0,48
    80003200:	01000d13          	li	s10,16
    80003204:	00878713          	addi	a4,a5,8
    80003208:	0007bc83          	ld	s9,0(a5)
    8000320c:	f6e43c23          	sd	a4,-136(s0)
    80003210:	00000097          	auipc	ra,0x0
    80003214:	9a4080e7          	jalr	-1628(ra) # 80002bb4 <consputc>
    80003218:	07800513          	li	a0,120
    8000321c:	00000097          	auipc	ra,0x0
    80003220:	998080e7          	jalr	-1640(ra) # 80002bb4 <consputc>
    80003224:	00002d97          	auipc	s11,0x2
    80003228:	0a4d8d93          	addi	s11,s11,164 # 800052c8 <digits>
    8000322c:	03ccd793          	srli	a5,s9,0x3c
    80003230:	00fd87b3          	add	a5,s11,a5
    80003234:	0007c503          	lbu	a0,0(a5)
    80003238:	fffd0d1b          	addiw	s10,s10,-1
    8000323c:	004c9c93          	slli	s9,s9,0x4
    80003240:	00000097          	auipc	ra,0x0
    80003244:	974080e7          	jalr	-1676(ra) # 80002bb4 <consputc>
    80003248:	fe0d12e3          	bnez	s10,8000322c <__printf+0x494>
    8000324c:	f8dff06f          	j	800031d8 <__printf+0x440>
    80003250:	f7843783          	ld	a5,-136(s0)
    80003254:	0007bc83          	ld	s9,0(a5)
    80003258:	00878793          	addi	a5,a5,8
    8000325c:	f6f43c23          	sd	a5,-136(s0)
    80003260:	000c9a63          	bnez	s9,80003274 <__printf+0x4dc>
    80003264:	1080006f          	j	8000336c <__printf+0x5d4>
    80003268:	001c8c93          	addi	s9,s9,1
    8000326c:	00000097          	auipc	ra,0x0
    80003270:	948080e7          	jalr	-1720(ra) # 80002bb4 <consputc>
    80003274:	000cc503          	lbu	a0,0(s9)
    80003278:	fe0518e3          	bnez	a0,80003268 <__printf+0x4d0>
    8000327c:	f5dff06f          	j	800031d8 <__printf+0x440>
    80003280:	02500513          	li	a0,37
    80003284:	00000097          	auipc	ra,0x0
    80003288:	930080e7          	jalr	-1744(ra) # 80002bb4 <consputc>
    8000328c:	000c8513          	mv	a0,s9
    80003290:	00000097          	auipc	ra,0x0
    80003294:	924080e7          	jalr	-1756(ra) # 80002bb4 <consputc>
    80003298:	f41ff06f          	j	800031d8 <__printf+0x440>
    8000329c:	02500513          	li	a0,37
    800032a0:	00000097          	auipc	ra,0x0
    800032a4:	914080e7          	jalr	-1772(ra) # 80002bb4 <consputc>
    800032a8:	f31ff06f          	j	800031d8 <__printf+0x440>
    800032ac:	00030513          	mv	a0,t1
    800032b0:	00000097          	auipc	ra,0x0
    800032b4:	7bc080e7          	jalr	1980(ra) # 80003a6c <acquire>
    800032b8:	b4dff06f          	j	80002e04 <__printf+0x6c>
    800032bc:	40c0053b          	negw	a0,a2
    800032c0:	00a00713          	li	a4,10
    800032c4:	02e576bb          	remuw	a3,a0,a4
    800032c8:	00002d97          	auipc	s11,0x2
    800032cc:	000d8d93          	mv	s11,s11
    800032d0:	ff700593          	li	a1,-9
    800032d4:	02069693          	slli	a3,a3,0x20
    800032d8:	0206d693          	srli	a3,a3,0x20
    800032dc:	00dd86b3          	add	a3,s11,a3
    800032e0:	0006c683          	lbu	a3,0(a3)
    800032e4:	02e557bb          	divuw	a5,a0,a4
    800032e8:	f8d40023          	sb	a3,-128(s0)
    800032ec:	10b65e63          	bge	a2,a1,80003408 <__printf+0x670>
    800032f0:	06300593          	li	a1,99
    800032f4:	02e7f6bb          	remuw	a3,a5,a4
    800032f8:	02069693          	slli	a3,a3,0x20
    800032fc:	0206d693          	srli	a3,a3,0x20
    80003300:	00dd86b3          	add	a3,s11,a3
    80003304:	0006c683          	lbu	a3,0(a3)
    80003308:	02e7d73b          	divuw	a4,a5,a4
    8000330c:	00200793          	li	a5,2
    80003310:	f8d400a3          	sb	a3,-127(s0)
    80003314:	bca5ece3          	bltu	a1,a0,80002eec <__printf+0x154>
    80003318:	ce5ff06f          	j	80002ffc <__printf+0x264>
    8000331c:	40e007bb          	negw	a5,a4
    80003320:	00002d97          	auipc	s11,0x2
    80003324:	fa8d8d93          	addi	s11,s11,-88 # 800052c8 <digits>
    80003328:	00f7f693          	andi	a3,a5,15
    8000332c:	00dd86b3          	add	a3,s11,a3
    80003330:	0006c583          	lbu	a1,0(a3)
    80003334:	ff100613          	li	a2,-15
    80003338:	0047d69b          	srliw	a3,a5,0x4
    8000333c:	f8b40023          	sb	a1,-128(s0)
    80003340:	0047d59b          	srliw	a1,a5,0x4
    80003344:	0ac75e63          	bge	a4,a2,80003400 <__printf+0x668>
    80003348:	00f6f693          	andi	a3,a3,15
    8000334c:	00dd86b3          	add	a3,s11,a3
    80003350:	0006c603          	lbu	a2,0(a3)
    80003354:	00f00693          	li	a3,15
    80003358:	0087d79b          	srliw	a5,a5,0x8
    8000335c:	f8c400a3          	sb	a2,-127(s0)
    80003360:	d8b6e4e3          	bltu	a3,a1,800030e8 <__printf+0x350>
    80003364:	00200793          	li	a5,2
    80003368:	e2dff06f          	j	80003194 <__printf+0x3fc>
    8000336c:	00002c97          	auipc	s9,0x2
    80003370:	f3cc8c93          	addi	s9,s9,-196 # 800052a8 <_ZZ12printIntegermE6digits+0x148>
    80003374:	02800513          	li	a0,40
    80003378:	ef1ff06f          	j	80003268 <__printf+0x4d0>
    8000337c:	00700793          	li	a5,7
    80003380:	00600c93          	li	s9,6
    80003384:	e0dff06f          	j	80003190 <__printf+0x3f8>
    80003388:	00700793          	li	a5,7
    8000338c:	00600c93          	li	s9,6
    80003390:	c69ff06f          	j	80002ff8 <__printf+0x260>
    80003394:	00300793          	li	a5,3
    80003398:	00200c93          	li	s9,2
    8000339c:	c5dff06f          	j	80002ff8 <__printf+0x260>
    800033a0:	00300793          	li	a5,3
    800033a4:	00200c93          	li	s9,2
    800033a8:	de9ff06f          	j	80003190 <__printf+0x3f8>
    800033ac:	00400793          	li	a5,4
    800033b0:	00300c93          	li	s9,3
    800033b4:	dddff06f          	j	80003190 <__printf+0x3f8>
    800033b8:	00400793          	li	a5,4
    800033bc:	00300c93          	li	s9,3
    800033c0:	c39ff06f          	j	80002ff8 <__printf+0x260>
    800033c4:	00500793          	li	a5,5
    800033c8:	00400c93          	li	s9,4
    800033cc:	c2dff06f          	j	80002ff8 <__printf+0x260>
    800033d0:	00500793          	li	a5,5
    800033d4:	00400c93          	li	s9,4
    800033d8:	db9ff06f          	j	80003190 <__printf+0x3f8>
    800033dc:	00600793          	li	a5,6
    800033e0:	00500c93          	li	s9,5
    800033e4:	dadff06f          	j	80003190 <__printf+0x3f8>
    800033e8:	00600793          	li	a5,6
    800033ec:	00500c93          	li	s9,5
    800033f0:	c09ff06f          	j	80002ff8 <__printf+0x260>
    800033f4:	00800793          	li	a5,8
    800033f8:	00700c93          	li	s9,7
    800033fc:	bfdff06f          	j	80002ff8 <__printf+0x260>
    80003400:	00100793          	li	a5,1
    80003404:	d91ff06f          	j	80003194 <__printf+0x3fc>
    80003408:	00100793          	li	a5,1
    8000340c:	bf1ff06f          	j	80002ffc <__printf+0x264>
    80003410:	00900793          	li	a5,9
    80003414:	00800c93          	li	s9,8
    80003418:	be1ff06f          	j	80002ff8 <__printf+0x260>
    8000341c:	00002517          	auipc	a0,0x2
    80003420:	e9450513          	addi	a0,a0,-364 # 800052b0 <_ZZ12printIntegermE6digits+0x150>
    80003424:	00000097          	auipc	ra,0x0
    80003428:	918080e7          	jalr	-1768(ra) # 80002d3c <panic>

000000008000342c <printfinit>:
    8000342c:	fe010113          	addi	sp,sp,-32
    80003430:	00813823          	sd	s0,16(sp)
    80003434:	00913423          	sd	s1,8(sp)
    80003438:	00113c23          	sd	ra,24(sp)
    8000343c:	02010413          	addi	s0,sp,32
    80003440:	00004497          	auipc	s1,0x4
    80003444:	80048493          	addi	s1,s1,-2048 # 80006c40 <pr>
    80003448:	00048513          	mv	a0,s1
    8000344c:	00002597          	auipc	a1,0x2
    80003450:	e7458593          	addi	a1,a1,-396 # 800052c0 <_ZZ12printIntegermE6digits+0x160>
    80003454:	00000097          	auipc	ra,0x0
    80003458:	5f4080e7          	jalr	1524(ra) # 80003a48 <initlock>
    8000345c:	01813083          	ld	ra,24(sp)
    80003460:	01013403          	ld	s0,16(sp)
    80003464:	0004ac23          	sw	zero,24(s1)
    80003468:	00813483          	ld	s1,8(sp)
    8000346c:	02010113          	addi	sp,sp,32
    80003470:	00008067          	ret

0000000080003474 <uartinit>:
    80003474:	ff010113          	addi	sp,sp,-16
    80003478:	00813423          	sd	s0,8(sp)
    8000347c:	01010413          	addi	s0,sp,16
    80003480:	100007b7          	lui	a5,0x10000
    80003484:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80003488:	f8000713          	li	a4,-128
    8000348c:	00e781a3          	sb	a4,3(a5)
    80003490:	00300713          	li	a4,3
    80003494:	00e78023          	sb	a4,0(a5)
    80003498:	000780a3          	sb	zero,1(a5)
    8000349c:	00e781a3          	sb	a4,3(a5)
    800034a0:	00700693          	li	a3,7
    800034a4:	00d78123          	sb	a3,2(a5)
    800034a8:	00e780a3          	sb	a4,1(a5)
    800034ac:	00813403          	ld	s0,8(sp)
    800034b0:	01010113          	addi	sp,sp,16
    800034b4:	00008067          	ret

00000000800034b8 <uartputc>:
    800034b8:	00002797          	auipc	a5,0x2
    800034bc:	5207a783          	lw	a5,1312(a5) # 800059d8 <panicked>
    800034c0:	00078463          	beqz	a5,800034c8 <uartputc+0x10>
    800034c4:	0000006f          	j	800034c4 <uartputc+0xc>
    800034c8:	fd010113          	addi	sp,sp,-48
    800034cc:	02813023          	sd	s0,32(sp)
    800034d0:	00913c23          	sd	s1,24(sp)
    800034d4:	01213823          	sd	s2,16(sp)
    800034d8:	01313423          	sd	s3,8(sp)
    800034dc:	02113423          	sd	ra,40(sp)
    800034e0:	03010413          	addi	s0,sp,48
    800034e4:	00002917          	auipc	s2,0x2
    800034e8:	4fc90913          	addi	s2,s2,1276 # 800059e0 <uart_tx_r>
    800034ec:	00093783          	ld	a5,0(s2)
    800034f0:	00002497          	auipc	s1,0x2
    800034f4:	4f848493          	addi	s1,s1,1272 # 800059e8 <uart_tx_w>
    800034f8:	0004b703          	ld	a4,0(s1)
    800034fc:	02078693          	addi	a3,a5,32
    80003500:	00050993          	mv	s3,a0
    80003504:	02e69c63          	bne	a3,a4,8000353c <uartputc+0x84>
    80003508:	00001097          	auipc	ra,0x1
    8000350c:	834080e7          	jalr	-1996(ra) # 80003d3c <push_on>
    80003510:	00093783          	ld	a5,0(s2)
    80003514:	0004b703          	ld	a4,0(s1)
    80003518:	02078793          	addi	a5,a5,32
    8000351c:	00e79463          	bne	a5,a4,80003524 <uartputc+0x6c>
    80003520:	0000006f          	j	80003520 <uartputc+0x68>
    80003524:	00001097          	auipc	ra,0x1
    80003528:	88c080e7          	jalr	-1908(ra) # 80003db0 <pop_on>
    8000352c:	00093783          	ld	a5,0(s2)
    80003530:	0004b703          	ld	a4,0(s1)
    80003534:	02078693          	addi	a3,a5,32
    80003538:	fce688e3          	beq	a3,a4,80003508 <uartputc+0x50>
    8000353c:	01f77693          	andi	a3,a4,31
    80003540:	00003597          	auipc	a1,0x3
    80003544:	72058593          	addi	a1,a1,1824 # 80006c60 <uart_tx_buf>
    80003548:	00d586b3          	add	a3,a1,a3
    8000354c:	00170713          	addi	a4,a4,1
    80003550:	01368023          	sb	s3,0(a3)
    80003554:	00e4b023          	sd	a4,0(s1)
    80003558:	10000637          	lui	a2,0x10000
    8000355c:	02f71063          	bne	a4,a5,8000357c <uartputc+0xc4>
    80003560:	0340006f          	j	80003594 <uartputc+0xdc>
    80003564:	00074703          	lbu	a4,0(a4)
    80003568:	00f93023          	sd	a5,0(s2)
    8000356c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80003570:	00093783          	ld	a5,0(s2)
    80003574:	0004b703          	ld	a4,0(s1)
    80003578:	00f70e63          	beq	a4,a5,80003594 <uartputc+0xdc>
    8000357c:	00564683          	lbu	a3,5(a2)
    80003580:	01f7f713          	andi	a4,a5,31
    80003584:	00e58733          	add	a4,a1,a4
    80003588:	0206f693          	andi	a3,a3,32
    8000358c:	00178793          	addi	a5,a5,1
    80003590:	fc069ae3          	bnez	a3,80003564 <uartputc+0xac>
    80003594:	02813083          	ld	ra,40(sp)
    80003598:	02013403          	ld	s0,32(sp)
    8000359c:	01813483          	ld	s1,24(sp)
    800035a0:	01013903          	ld	s2,16(sp)
    800035a4:	00813983          	ld	s3,8(sp)
    800035a8:	03010113          	addi	sp,sp,48
    800035ac:	00008067          	ret

00000000800035b0 <uartputc_sync>:
    800035b0:	ff010113          	addi	sp,sp,-16
    800035b4:	00813423          	sd	s0,8(sp)
    800035b8:	01010413          	addi	s0,sp,16
    800035bc:	00002717          	auipc	a4,0x2
    800035c0:	41c72703          	lw	a4,1052(a4) # 800059d8 <panicked>
    800035c4:	02071663          	bnez	a4,800035f0 <uartputc_sync+0x40>
    800035c8:	00050793          	mv	a5,a0
    800035cc:	100006b7          	lui	a3,0x10000
    800035d0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    800035d4:	02077713          	andi	a4,a4,32
    800035d8:	fe070ce3          	beqz	a4,800035d0 <uartputc_sync+0x20>
    800035dc:	0ff7f793          	andi	a5,a5,255
    800035e0:	00f68023          	sb	a5,0(a3)
    800035e4:	00813403          	ld	s0,8(sp)
    800035e8:	01010113          	addi	sp,sp,16
    800035ec:	00008067          	ret
    800035f0:	0000006f          	j	800035f0 <uartputc_sync+0x40>

00000000800035f4 <uartstart>:
    800035f4:	ff010113          	addi	sp,sp,-16
    800035f8:	00813423          	sd	s0,8(sp)
    800035fc:	01010413          	addi	s0,sp,16
    80003600:	00002617          	auipc	a2,0x2
    80003604:	3e060613          	addi	a2,a2,992 # 800059e0 <uart_tx_r>
    80003608:	00002517          	auipc	a0,0x2
    8000360c:	3e050513          	addi	a0,a0,992 # 800059e8 <uart_tx_w>
    80003610:	00063783          	ld	a5,0(a2)
    80003614:	00053703          	ld	a4,0(a0)
    80003618:	04f70263          	beq	a4,a5,8000365c <uartstart+0x68>
    8000361c:	100005b7          	lui	a1,0x10000
    80003620:	00003817          	auipc	a6,0x3
    80003624:	64080813          	addi	a6,a6,1600 # 80006c60 <uart_tx_buf>
    80003628:	01c0006f          	j	80003644 <uartstart+0x50>
    8000362c:	0006c703          	lbu	a4,0(a3)
    80003630:	00f63023          	sd	a5,0(a2)
    80003634:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80003638:	00063783          	ld	a5,0(a2)
    8000363c:	00053703          	ld	a4,0(a0)
    80003640:	00f70e63          	beq	a4,a5,8000365c <uartstart+0x68>
    80003644:	01f7f713          	andi	a4,a5,31
    80003648:	00e806b3          	add	a3,a6,a4
    8000364c:	0055c703          	lbu	a4,5(a1)
    80003650:	00178793          	addi	a5,a5,1
    80003654:	02077713          	andi	a4,a4,32
    80003658:	fc071ae3          	bnez	a4,8000362c <uartstart+0x38>
    8000365c:	00813403          	ld	s0,8(sp)
    80003660:	01010113          	addi	sp,sp,16
    80003664:	00008067          	ret

0000000080003668 <uartgetc>:
    80003668:	ff010113          	addi	sp,sp,-16
    8000366c:	00813423          	sd	s0,8(sp)
    80003670:	01010413          	addi	s0,sp,16
    80003674:	10000737          	lui	a4,0x10000
    80003678:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000367c:	0017f793          	andi	a5,a5,1
    80003680:	00078c63          	beqz	a5,80003698 <uartgetc+0x30>
    80003684:	00074503          	lbu	a0,0(a4)
    80003688:	0ff57513          	andi	a0,a0,255
    8000368c:	00813403          	ld	s0,8(sp)
    80003690:	01010113          	addi	sp,sp,16
    80003694:	00008067          	ret
    80003698:	fff00513          	li	a0,-1
    8000369c:	ff1ff06f          	j	8000368c <uartgetc+0x24>

00000000800036a0 <uartintr>:
    800036a0:	100007b7          	lui	a5,0x10000
    800036a4:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    800036a8:	0017f793          	andi	a5,a5,1
    800036ac:	0a078463          	beqz	a5,80003754 <uartintr+0xb4>
    800036b0:	fe010113          	addi	sp,sp,-32
    800036b4:	00813823          	sd	s0,16(sp)
    800036b8:	00913423          	sd	s1,8(sp)
    800036bc:	00113c23          	sd	ra,24(sp)
    800036c0:	02010413          	addi	s0,sp,32
    800036c4:	100004b7          	lui	s1,0x10000
    800036c8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    800036cc:	0ff57513          	andi	a0,a0,255
    800036d0:	fffff097          	auipc	ra,0xfffff
    800036d4:	534080e7          	jalr	1332(ra) # 80002c04 <consoleintr>
    800036d8:	0054c783          	lbu	a5,5(s1)
    800036dc:	0017f793          	andi	a5,a5,1
    800036e0:	fe0794e3          	bnez	a5,800036c8 <uartintr+0x28>
    800036e4:	00002617          	auipc	a2,0x2
    800036e8:	2fc60613          	addi	a2,a2,764 # 800059e0 <uart_tx_r>
    800036ec:	00002517          	auipc	a0,0x2
    800036f0:	2fc50513          	addi	a0,a0,764 # 800059e8 <uart_tx_w>
    800036f4:	00063783          	ld	a5,0(a2)
    800036f8:	00053703          	ld	a4,0(a0)
    800036fc:	04f70263          	beq	a4,a5,80003740 <uartintr+0xa0>
    80003700:	100005b7          	lui	a1,0x10000
    80003704:	00003817          	auipc	a6,0x3
    80003708:	55c80813          	addi	a6,a6,1372 # 80006c60 <uart_tx_buf>
    8000370c:	01c0006f          	j	80003728 <uartintr+0x88>
    80003710:	0006c703          	lbu	a4,0(a3)
    80003714:	00f63023          	sd	a5,0(a2)
    80003718:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000371c:	00063783          	ld	a5,0(a2)
    80003720:	00053703          	ld	a4,0(a0)
    80003724:	00f70e63          	beq	a4,a5,80003740 <uartintr+0xa0>
    80003728:	01f7f713          	andi	a4,a5,31
    8000372c:	00e806b3          	add	a3,a6,a4
    80003730:	0055c703          	lbu	a4,5(a1)
    80003734:	00178793          	addi	a5,a5,1
    80003738:	02077713          	andi	a4,a4,32
    8000373c:	fc071ae3          	bnez	a4,80003710 <uartintr+0x70>
    80003740:	01813083          	ld	ra,24(sp)
    80003744:	01013403          	ld	s0,16(sp)
    80003748:	00813483          	ld	s1,8(sp)
    8000374c:	02010113          	addi	sp,sp,32
    80003750:	00008067          	ret
    80003754:	00002617          	auipc	a2,0x2
    80003758:	28c60613          	addi	a2,a2,652 # 800059e0 <uart_tx_r>
    8000375c:	00002517          	auipc	a0,0x2
    80003760:	28c50513          	addi	a0,a0,652 # 800059e8 <uart_tx_w>
    80003764:	00063783          	ld	a5,0(a2)
    80003768:	00053703          	ld	a4,0(a0)
    8000376c:	04f70263          	beq	a4,a5,800037b0 <uartintr+0x110>
    80003770:	100005b7          	lui	a1,0x10000
    80003774:	00003817          	auipc	a6,0x3
    80003778:	4ec80813          	addi	a6,a6,1260 # 80006c60 <uart_tx_buf>
    8000377c:	01c0006f          	j	80003798 <uartintr+0xf8>
    80003780:	0006c703          	lbu	a4,0(a3)
    80003784:	00f63023          	sd	a5,0(a2)
    80003788:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000378c:	00063783          	ld	a5,0(a2)
    80003790:	00053703          	ld	a4,0(a0)
    80003794:	02f70063          	beq	a4,a5,800037b4 <uartintr+0x114>
    80003798:	01f7f713          	andi	a4,a5,31
    8000379c:	00e806b3          	add	a3,a6,a4
    800037a0:	0055c703          	lbu	a4,5(a1)
    800037a4:	00178793          	addi	a5,a5,1
    800037a8:	02077713          	andi	a4,a4,32
    800037ac:	fc071ae3          	bnez	a4,80003780 <uartintr+0xe0>
    800037b0:	00008067          	ret
    800037b4:	00008067          	ret

00000000800037b8 <kinit>:
    800037b8:	fc010113          	addi	sp,sp,-64
    800037bc:	02913423          	sd	s1,40(sp)
    800037c0:	fffff7b7          	lui	a5,0xfffff
    800037c4:	00004497          	auipc	s1,0x4
    800037c8:	4cb48493          	addi	s1,s1,1227 # 80007c8f <end+0xfff>
    800037cc:	02813823          	sd	s0,48(sp)
    800037d0:	01313c23          	sd	s3,24(sp)
    800037d4:	00f4f4b3          	and	s1,s1,a5
    800037d8:	02113c23          	sd	ra,56(sp)
    800037dc:	03213023          	sd	s2,32(sp)
    800037e0:	01413823          	sd	s4,16(sp)
    800037e4:	01513423          	sd	s5,8(sp)
    800037e8:	04010413          	addi	s0,sp,64
    800037ec:	000017b7          	lui	a5,0x1
    800037f0:	01100993          	li	s3,17
    800037f4:	00f487b3          	add	a5,s1,a5
    800037f8:	01b99993          	slli	s3,s3,0x1b
    800037fc:	06f9e063          	bltu	s3,a5,8000385c <kinit+0xa4>
    80003800:	00003a97          	auipc	s5,0x3
    80003804:	490a8a93          	addi	s5,s5,1168 # 80006c90 <end>
    80003808:	0754ec63          	bltu	s1,s5,80003880 <kinit+0xc8>
    8000380c:	0734fa63          	bgeu	s1,s3,80003880 <kinit+0xc8>
    80003810:	00088a37          	lui	s4,0x88
    80003814:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80003818:	00002917          	auipc	s2,0x2
    8000381c:	1d890913          	addi	s2,s2,472 # 800059f0 <kmem>
    80003820:	00ca1a13          	slli	s4,s4,0xc
    80003824:	0140006f          	j	80003838 <kinit+0x80>
    80003828:	000017b7          	lui	a5,0x1
    8000382c:	00f484b3          	add	s1,s1,a5
    80003830:	0554e863          	bltu	s1,s5,80003880 <kinit+0xc8>
    80003834:	0534f663          	bgeu	s1,s3,80003880 <kinit+0xc8>
    80003838:	00001637          	lui	a2,0x1
    8000383c:	00100593          	li	a1,1
    80003840:	00048513          	mv	a0,s1
    80003844:	00000097          	auipc	ra,0x0
    80003848:	5e4080e7          	jalr	1508(ra) # 80003e28 <__memset>
    8000384c:	00093783          	ld	a5,0(s2)
    80003850:	00f4b023          	sd	a5,0(s1)
    80003854:	00993023          	sd	s1,0(s2)
    80003858:	fd4498e3          	bne	s1,s4,80003828 <kinit+0x70>
    8000385c:	03813083          	ld	ra,56(sp)
    80003860:	03013403          	ld	s0,48(sp)
    80003864:	02813483          	ld	s1,40(sp)
    80003868:	02013903          	ld	s2,32(sp)
    8000386c:	01813983          	ld	s3,24(sp)
    80003870:	01013a03          	ld	s4,16(sp)
    80003874:	00813a83          	ld	s5,8(sp)
    80003878:	04010113          	addi	sp,sp,64
    8000387c:	00008067          	ret
    80003880:	00002517          	auipc	a0,0x2
    80003884:	a6050513          	addi	a0,a0,-1440 # 800052e0 <digits+0x18>
    80003888:	fffff097          	auipc	ra,0xfffff
    8000388c:	4b4080e7          	jalr	1204(ra) # 80002d3c <panic>

0000000080003890 <freerange>:
    80003890:	fc010113          	addi	sp,sp,-64
    80003894:	000017b7          	lui	a5,0x1
    80003898:	02913423          	sd	s1,40(sp)
    8000389c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    800038a0:	009504b3          	add	s1,a0,s1
    800038a4:	fffff537          	lui	a0,0xfffff
    800038a8:	02813823          	sd	s0,48(sp)
    800038ac:	02113c23          	sd	ra,56(sp)
    800038b0:	03213023          	sd	s2,32(sp)
    800038b4:	01313c23          	sd	s3,24(sp)
    800038b8:	01413823          	sd	s4,16(sp)
    800038bc:	01513423          	sd	s5,8(sp)
    800038c0:	01613023          	sd	s6,0(sp)
    800038c4:	04010413          	addi	s0,sp,64
    800038c8:	00a4f4b3          	and	s1,s1,a0
    800038cc:	00f487b3          	add	a5,s1,a5
    800038d0:	06f5e463          	bltu	a1,a5,80003938 <freerange+0xa8>
    800038d4:	00003a97          	auipc	s5,0x3
    800038d8:	3bca8a93          	addi	s5,s5,956 # 80006c90 <end>
    800038dc:	0954e263          	bltu	s1,s5,80003960 <freerange+0xd0>
    800038e0:	01100993          	li	s3,17
    800038e4:	01b99993          	slli	s3,s3,0x1b
    800038e8:	0734fc63          	bgeu	s1,s3,80003960 <freerange+0xd0>
    800038ec:	00058a13          	mv	s4,a1
    800038f0:	00002917          	auipc	s2,0x2
    800038f4:	10090913          	addi	s2,s2,256 # 800059f0 <kmem>
    800038f8:	00002b37          	lui	s6,0x2
    800038fc:	0140006f          	j	80003910 <freerange+0x80>
    80003900:	000017b7          	lui	a5,0x1
    80003904:	00f484b3          	add	s1,s1,a5
    80003908:	0554ec63          	bltu	s1,s5,80003960 <freerange+0xd0>
    8000390c:	0534fa63          	bgeu	s1,s3,80003960 <freerange+0xd0>
    80003910:	00001637          	lui	a2,0x1
    80003914:	00100593          	li	a1,1
    80003918:	00048513          	mv	a0,s1
    8000391c:	00000097          	auipc	ra,0x0
    80003920:	50c080e7          	jalr	1292(ra) # 80003e28 <__memset>
    80003924:	00093703          	ld	a4,0(s2)
    80003928:	016487b3          	add	a5,s1,s6
    8000392c:	00e4b023          	sd	a4,0(s1)
    80003930:	00993023          	sd	s1,0(s2)
    80003934:	fcfa76e3          	bgeu	s4,a5,80003900 <freerange+0x70>
    80003938:	03813083          	ld	ra,56(sp)
    8000393c:	03013403          	ld	s0,48(sp)
    80003940:	02813483          	ld	s1,40(sp)
    80003944:	02013903          	ld	s2,32(sp)
    80003948:	01813983          	ld	s3,24(sp)
    8000394c:	01013a03          	ld	s4,16(sp)
    80003950:	00813a83          	ld	s5,8(sp)
    80003954:	00013b03          	ld	s6,0(sp)
    80003958:	04010113          	addi	sp,sp,64
    8000395c:	00008067          	ret
    80003960:	00002517          	auipc	a0,0x2
    80003964:	98050513          	addi	a0,a0,-1664 # 800052e0 <digits+0x18>
    80003968:	fffff097          	auipc	ra,0xfffff
    8000396c:	3d4080e7          	jalr	980(ra) # 80002d3c <panic>

0000000080003970 <kfree>:
    80003970:	fe010113          	addi	sp,sp,-32
    80003974:	00813823          	sd	s0,16(sp)
    80003978:	00113c23          	sd	ra,24(sp)
    8000397c:	00913423          	sd	s1,8(sp)
    80003980:	02010413          	addi	s0,sp,32
    80003984:	03451793          	slli	a5,a0,0x34
    80003988:	04079c63          	bnez	a5,800039e0 <kfree+0x70>
    8000398c:	00003797          	auipc	a5,0x3
    80003990:	30478793          	addi	a5,a5,772 # 80006c90 <end>
    80003994:	00050493          	mv	s1,a0
    80003998:	04f56463          	bltu	a0,a5,800039e0 <kfree+0x70>
    8000399c:	01100793          	li	a5,17
    800039a0:	01b79793          	slli	a5,a5,0x1b
    800039a4:	02f57e63          	bgeu	a0,a5,800039e0 <kfree+0x70>
    800039a8:	00001637          	lui	a2,0x1
    800039ac:	00100593          	li	a1,1
    800039b0:	00000097          	auipc	ra,0x0
    800039b4:	478080e7          	jalr	1144(ra) # 80003e28 <__memset>
    800039b8:	00002797          	auipc	a5,0x2
    800039bc:	03878793          	addi	a5,a5,56 # 800059f0 <kmem>
    800039c0:	0007b703          	ld	a4,0(a5)
    800039c4:	01813083          	ld	ra,24(sp)
    800039c8:	01013403          	ld	s0,16(sp)
    800039cc:	00e4b023          	sd	a4,0(s1)
    800039d0:	0097b023          	sd	s1,0(a5)
    800039d4:	00813483          	ld	s1,8(sp)
    800039d8:	02010113          	addi	sp,sp,32
    800039dc:	00008067          	ret
    800039e0:	00002517          	auipc	a0,0x2
    800039e4:	90050513          	addi	a0,a0,-1792 # 800052e0 <digits+0x18>
    800039e8:	fffff097          	auipc	ra,0xfffff
    800039ec:	354080e7          	jalr	852(ra) # 80002d3c <panic>

00000000800039f0 <kalloc>:
    800039f0:	fe010113          	addi	sp,sp,-32
    800039f4:	00813823          	sd	s0,16(sp)
    800039f8:	00913423          	sd	s1,8(sp)
    800039fc:	00113c23          	sd	ra,24(sp)
    80003a00:	02010413          	addi	s0,sp,32
    80003a04:	00002797          	auipc	a5,0x2
    80003a08:	fec78793          	addi	a5,a5,-20 # 800059f0 <kmem>
    80003a0c:	0007b483          	ld	s1,0(a5)
    80003a10:	02048063          	beqz	s1,80003a30 <kalloc+0x40>
    80003a14:	0004b703          	ld	a4,0(s1)
    80003a18:	00001637          	lui	a2,0x1
    80003a1c:	00500593          	li	a1,5
    80003a20:	00048513          	mv	a0,s1
    80003a24:	00e7b023          	sd	a4,0(a5)
    80003a28:	00000097          	auipc	ra,0x0
    80003a2c:	400080e7          	jalr	1024(ra) # 80003e28 <__memset>
    80003a30:	01813083          	ld	ra,24(sp)
    80003a34:	01013403          	ld	s0,16(sp)
    80003a38:	00048513          	mv	a0,s1
    80003a3c:	00813483          	ld	s1,8(sp)
    80003a40:	02010113          	addi	sp,sp,32
    80003a44:	00008067          	ret

0000000080003a48 <initlock>:
    80003a48:	ff010113          	addi	sp,sp,-16
    80003a4c:	00813423          	sd	s0,8(sp)
    80003a50:	01010413          	addi	s0,sp,16
    80003a54:	00813403          	ld	s0,8(sp)
    80003a58:	00b53423          	sd	a1,8(a0)
    80003a5c:	00052023          	sw	zero,0(a0)
    80003a60:	00053823          	sd	zero,16(a0)
    80003a64:	01010113          	addi	sp,sp,16
    80003a68:	00008067          	ret

0000000080003a6c <acquire>:
    80003a6c:	fe010113          	addi	sp,sp,-32
    80003a70:	00813823          	sd	s0,16(sp)
    80003a74:	00913423          	sd	s1,8(sp)
    80003a78:	00113c23          	sd	ra,24(sp)
    80003a7c:	01213023          	sd	s2,0(sp)
    80003a80:	02010413          	addi	s0,sp,32
    80003a84:	00050493          	mv	s1,a0
    80003a88:	10002973          	csrr	s2,sstatus
    80003a8c:	100027f3          	csrr	a5,sstatus
    80003a90:	ffd7f793          	andi	a5,a5,-3
    80003a94:	10079073          	csrw	sstatus,a5
    80003a98:	fffff097          	auipc	ra,0xfffff
    80003a9c:	8e8080e7          	jalr	-1816(ra) # 80002380 <mycpu>
    80003aa0:	07852783          	lw	a5,120(a0)
    80003aa4:	06078e63          	beqz	a5,80003b20 <acquire+0xb4>
    80003aa8:	fffff097          	auipc	ra,0xfffff
    80003aac:	8d8080e7          	jalr	-1832(ra) # 80002380 <mycpu>
    80003ab0:	07852783          	lw	a5,120(a0)
    80003ab4:	0004a703          	lw	a4,0(s1)
    80003ab8:	0017879b          	addiw	a5,a5,1
    80003abc:	06f52c23          	sw	a5,120(a0)
    80003ac0:	04071063          	bnez	a4,80003b00 <acquire+0x94>
    80003ac4:	00100713          	li	a4,1
    80003ac8:	00070793          	mv	a5,a4
    80003acc:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80003ad0:	0007879b          	sext.w	a5,a5
    80003ad4:	fe079ae3          	bnez	a5,80003ac8 <acquire+0x5c>
    80003ad8:	0ff0000f          	fence
    80003adc:	fffff097          	auipc	ra,0xfffff
    80003ae0:	8a4080e7          	jalr	-1884(ra) # 80002380 <mycpu>
    80003ae4:	01813083          	ld	ra,24(sp)
    80003ae8:	01013403          	ld	s0,16(sp)
    80003aec:	00a4b823          	sd	a0,16(s1)
    80003af0:	00013903          	ld	s2,0(sp)
    80003af4:	00813483          	ld	s1,8(sp)
    80003af8:	02010113          	addi	sp,sp,32
    80003afc:	00008067          	ret
    80003b00:	0104b903          	ld	s2,16(s1)
    80003b04:	fffff097          	auipc	ra,0xfffff
    80003b08:	87c080e7          	jalr	-1924(ra) # 80002380 <mycpu>
    80003b0c:	faa91ce3          	bne	s2,a0,80003ac4 <acquire+0x58>
    80003b10:	00001517          	auipc	a0,0x1
    80003b14:	7d850513          	addi	a0,a0,2008 # 800052e8 <digits+0x20>
    80003b18:	fffff097          	auipc	ra,0xfffff
    80003b1c:	224080e7          	jalr	548(ra) # 80002d3c <panic>
    80003b20:	00195913          	srli	s2,s2,0x1
    80003b24:	fffff097          	auipc	ra,0xfffff
    80003b28:	85c080e7          	jalr	-1956(ra) # 80002380 <mycpu>
    80003b2c:	00197913          	andi	s2,s2,1
    80003b30:	07252e23          	sw	s2,124(a0)
    80003b34:	f75ff06f          	j	80003aa8 <acquire+0x3c>

0000000080003b38 <release>:
    80003b38:	fe010113          	addi	sp,sp,-32
    80003b3c:	00813823          	sd	s0,16(sp)
    80003b40:	00113c23          	sd	ra,24(sp)
    80003b44:	00913423          	sd	s1,8(sp)
    80003b48:	01213023          	sd	s2,0(sp)
    80003b4c:	02010413          	addi	s0,sp,32
    80003b50:	00052783          	lw	a5,0(a0)
    80003b54:	00079a63          	bnez	a5,80003b68 <release+0x30>
    80003b58:	00001517          	auipc	a0,0x1
    80003b5c:	79850513          	addi	a0,a0,1944 # 800052f0 <digits+0x28>
    80003b60:	fffff097          	auipc	ra,0xfffff
    80003b64:	1dc080e7          	jalr	476(ra) # 80002d3c <panic>
    80003b68:	01053903          	ld	s2,16(a0)
    80003b6c:	00050493          	mv	s1,a0
    80003b70:	fffff097          	auipc	ra,0xfffff
    80003b74:	810080e7          	jalr	-2032(ra) # 80002380 <mycpu>
    80003b78:	fea910e3          	bne	s2,a0,80003b58 <release+0x20>
    80003b7c:	0004b823          	sd	zero,16(s1)
    80003b80:	0ff0000f          	fence
    80003b84:	0f50000f          	fence	iorw,ow
    80003b88:	0804a02f          	amoswap.w	zero,zero,(s1)
    80003b8c:	ffffe097          	auipc	ra,0xffffe
    80003b90:	7f4080e7          	jalr	2036(ra) # 80002380 <mycpu>
    80003b94:	100027f3          	csrr	a5,sstatus
    80003b98:	0027f793          	andi	a5,a5,2
    80003b9c:	04079a63          	bnez	a5,80003bf0 <release+0xb8>
    80003ba0:	07852783          	lw	a5,120(a0)
    80003ba4:	02f05e63          	blez	a5,80003be0 <release+0xa8>
    80003ba8:	fff7871b          	addiw	a4,a5,-1
    80003bac:	06e52c23          	sw	a4,120(a0)
    80003bb0:	00071c63          	bnez	a4,80003bc8 <release+0x90>
    80003bb4:	07c52783          	lw	a5,124(a0)
    80003bb8:	00078863          	beqz	a5,80003bc8 <release+0x90>
    80003bbc:	100027f3          	csrr	a5,sstatus
    80003bc0:	0027e793          	ori	a5,a5,2
    80003bc4:	10079073          	csrw	sstatus,a5
    80003bc8:	01813083          	ld	ra,24(sp)
    80003bcc:	01013403          	ld	s0,16(sp)
    80003bd0:	00813483          	ld	s1,8(sp)
    80003bd4:	00013903          	ld	s2,0(sp)
    80003bd8:	02010113          	addi	sp,sp,32
    80003bdc:	00008067          	ret
    80003be0:	00001517          	auipc	a0,0x1
    80003be4:	73050513          	addi	a0,a0,1840 # 80005310 <digits+0x48>
    80003be8:	fffff097          	auipc	ra,0xfffff
    80003bec:	154080e7          	jalr	340(ra) # 80002d3c <panic>
    80003bf0:	00001517          	auipc	a0,0x1
    80003bf4:	70850513          	addi	a0,a0,1800 # 800052f8 <digits+0x30>
    80003bf8:	fffff097          	auipc	ra,0xfffff
    80003bfc:	144080e7          	jalr	324(ra) # 80002d3c <panic>

0000000080003c00 <holding>:
    80003c00:	00052783          	lw	a5,0(a0)
    80003c04:	00079663          	bnez	a5,80003c10 <holding+0x10>
    80003c08:	00000513          	li	a0,0
    80003c0c:	00008067          	ret
    80003c10:	fe010113          	addi	sp,sp,-32
    80003c14:	00813823          	sd	s0,16(sp)
    80003c18:	00913423          	sd	s1,8(sp)
    80003c1c:	00113c23          	sd	ra,24(sp)
    80003c20:	02010413          	addi	s0,sp,32
    80003c24:	01053483          	ld	s1,16(a0)
    80003c28:	ffffe097          	auipc	ra,0xffffe
    80003c2c:	758080e7          	jalr	1880(ra) # 80002380 <mycpu>
    80003c30:	01813083          	ld	ra,24(sp)
    80003c34:	01013403          	ld	s0,16(sp)
    80003c38:	40a48533          	sub	a0,s1,a0
    80003c3c:	00153513          	seqz	a0,a0
    80003c40:	00813483          	ld	s1,8(sp)
    80003c44:	02010113          	addi	sp,sp,32
    80003c48:	00008067          	ret

0000000080003c4c <push_off>:
    80003c4c:	fe010113          	addi	sp,sp,-32
    80003c50:	00813823          	sd	s0,16(sp)
    80003c54:	00113c23          	sd	ra,24(sp)
    80003c58:	00913423          	sd	s1,8(sp)
    80003c5c:	02010413          	addi	s0,sp,32
    80003c60:	100024f3          	csrr	s1,sstatus
    80003c64:	100027f3          	csrr	a5,sstatus
    80003c68:	ffd7f793          	andi	a5,a5,-3
    80003c6c:	10079073          	csrw	sstatus,a5
    80003c70:	ffffe097          	auipc	ra,0xffffe
    80003c74:	710080e7          	jalr	1808(ra) # 80002380 <mycpu>
    80003c78:	07852783          	lw	a5,120(a0)
    80003c7c:	02078663          	beqz	a5,80003ca8 <push_off+0x5c>
    80003c80:	ffffe097          	auipc	ra,0xffffe
    80003c84:	700080e7          	jalr	1792(ra) # 80002380 <mycpu>
    80003c88:	07852783          	lw	a5,120(a0)
    80003c8c:	01813083          	ld	ra,24(sp)
    80003c90:	01013403          	ld	s0,16(sp)
    80003c94:	0017879b          	addiw	a5,a5,1
    80003c98:	06f52c23          	sw	a5,120(a0)
    80003c9c:	00813483          	ld	s1,8(sp)
    80003ca0:	02010113          	addi	sp,sp,32
    80003ca4:	00008067          	ret
    80003ca8:	0014d493          	srli	s1,s1,0x1
    80003cac:	ffffe097          	auipc	ra,0xffffe
    80003cb0:	6d4080e7          	jalr	1748(ra) # 80002380 <mycpu>
    80003cb4:	0014f493          	andi	s1,s1,1
    80003cb8:	06952e23          	sw	s1,124(a0)
    80003cbc:	fc5ff06f          	j	80003c80 <push_off+0x34>

0000000080003cc0 <pop_off>:
    80003cc0:	ff010113          	addi	sp,sp,-16
    80003cc4:	00813023          	sd	s0,0(sp)
    80003cc8:	00113423          	sd	ra,8(sp)
    80003ccc:	01010413          	addi	s0,sp,16
    80003cd0:	ffffe097          	auipc	ra,0xffffe
    80003cd4:	6b0080e7          	jalr	1712(ra) # 80002380 <mycpu>
    80003cd8:	100027f3          	csrr	a5,sstatus
    80003cdc:	0027f793          	andi	a5,a5,2
    80003ce0:	04079663          	bnez	a5,80003d2c <pop_off+0x6c>
    80003ce4:	07852783          	lw	a5,120(a0)
    80003ce8:	02f05a63          	blez	a5,80003d1c <pop_off+0x5c>
    80003cec:	fff7871b          	addiw	a4,a5,-1
    80003cf0:	06e52c23          	sw	a4,120(a0)
    80003cf4:	00071c63          	bnez	a4,80003d0c <pop_off+0x4c>
    80003cf8:	07c52783          	lw	a5,124(a0)
    80003cfc:	00078863          	beqz	a5,80003d0c <pop_off+0x4c>
    80003d00:	100027f3          	csrr	a5,sstatus
    80003d04:	0027e793          	ori	a5,a5,2
    80003d08:	10079073          	csrw	sstatus,a5
    80003d0c:	00813083          	ld	ra,8(sp)
    80003d10:	00013403          	ld	s0,0(sp)
    80003d14:	01010113          	addi	sp,sp,16
    80003d18:	00008067          	ret
    80003d1c:	00001517          	auipc	a0,0x1
    80003d20:	5f450513          	addi	a0,a0,1524 # 80005310 <digits+0x48>
    80003d24:	fffff097          	auipc	ra,0xfffff
    80003d28:	018080e7          	jalr	24(ra) # 80002d3c <panic>
    80003d2c:	00001517          	auipc	a0,0x1
    80003d30:	5cc50513          	addi	a0,a0,1484 # 800052f8 <digits+0x30>
    80003d34:	fffff097          	auipc	ra,0xfffff
    80003d38:	008080e7          	jalr	8(ra) # 80002d3c <panic>

0000000080003d3c <push_on>:
    80003d3c:	fe010113          	addi	sp,sp,-32
    80003d40:	00813823          	sd	s0,16(sp)
    80003d44:	00113c23          	sd	ra,24(sp)
    80003d48:	00913423          	sd	s1,8(sp)
    80003d4c:	02010413          	addi	s0,sp,32
    80003d50:	100024f3          	csrr	s1,sstatus
    80003d54:	100027f3          	csrr	a5,sstatus
    80003d58:	0027e793          	ori	a5,a5,2
    80003d5c:	10079073          	csrw	sstatus,a5
    80003d60:	ffffe097          	auipc	ra,0xffffe
    80003d64:	620080e7          	jalr	1568(ra) # 80002380 <mycpu>
    80003d68:	07852783          	lw	a5,120(a0)
    80003d6c:	02078663          	beqz	a5,80003d98 <push_on+0x5c>
    80003d70:	ffffe097          	auipc	ra,0xffffe
    80003d74:	610080e7          	jalr	1552(ra) # 80002380 <mycpu>
    80003d78:	07852783          	lw	a5,120(a0)
    80003d7c:	01813083          	ld	ra,24(sp)
    80003d80:	01013403          	ld	s0,16(sp)
    80003d84:	0017879b          	addiw	a5,a5,1
    80003d88:	06f52c23          	sw	a5,120(a0)
    80003d8c:	00813483          	ld	s1,8(sp)
    80003d90:	02010113          	addi	sp,sp,32
    80003d94:	00008067          	ret
    80003d98:	0014d493          	srli	s1,s1,0x1
    80003d9c:	ffffe097          	auipc	ra,0xffffe
    80003da0:	5e4080e7          	jalr	1508(ra) # 80002380 <mycpu>
    80003da4:	0014f493          	andi	s1,s1,1
    80003da8:	06952e23          	sw	s1,124(a0)
    80003dac:	fc5ff06f          	j	80003d70 <push_on+0x34>

0000000080003db0 <pop_on>:
    80003db0:	ff010113          	addi	sp,sp,-16
    80003db4:	00813023          	sd	s0,0(sp)
    80003db8:	00113423          	sd	ra,8(sp)
    80003dbc:	01010413          	addi	s0,sp,16
    80003dc0:	ffffe097          	auipc	ra,0xffffe
    80003dc4:	5c0080e7          	jalr	1472(ra) # 80002380 <mycpu>
    80003dc8:	100027f3          	csrr	a5,sstatus
    80003dcc:	0027f793          	andi	a5,a5,2
    80003dd0:	04078463          	beqz	a5,80003e18 <pop_on+0x68>
    80003dd4:	07852783          	lw	a5,120(a0)
    80003dd8:	02f05863          	blez	a5,80003e08 <pop_on+0x58>
    80003ddc:	fff7879b          	addiw	a5,a5,-1
    80003de0:	06f52c23          	sw	a5,120(a0)
    80003de4:	07853783          	ld	a5,120(a0)
    80003de8:	00079863          	bnez	a5,80003df8 <pop_on+0x48>
    80003dec:	100027f3          	csrr	a5,sstatus
    80003df0:	ffd7f793          	andi	a5,a5,-3
    80003df4:	10079073          	csrw	sstatus,a5
    80003df8:	00813083          	ld	ra,8(sp)
    80003dfc:	00013403          	ld	s0,0(sp)
    80003e00:	01010113          	addi	sp,sp,16
    80003e04:	00008067          	ret
    80003e08:	00001517          	auipc	a0,0x1
    80003e0c:	53050513          	addi	a0,a0,1328 # 80005338 <digits+0x70>
    80003e10:	fffff097          	auipc	ra,0xfffff
    80003e14:	f2c080e7          	jalr	-212(ra) # 80002d3c <panic>
    80003e18:	00001517          	auipc	a0,0x1
    80003e1c:	50050513          	addi	a0,a0,1280 # 80005318 <digits+0x50>
    80003e20:	fffff097          	auipc	ra,0xfffff
    80003e24:	f1c080e7          	jalr	-228(ra) # 80002d3c <panic>

0000000080003e28 <__memset>:
    80003e28:	ff010113          	addi	sp,sp,-16
    80003e2c:	00813423          	sd	s0,8(sp)
    80003e30:	01010413          	addi	s0,sp,16
    80003e34:	1a060e63          	beqz	a2,80003ff0 <__memset+0x1c8>
    80003e38:	40a007b3          	neg	a5,a0
    80003e3c:	0077f793          	andi	a5,a5,7
    80003e40:	00778693          	addi	a3,a5,7
    80003e44:	00b00813          	li	a6,11
    80003e48:	0ff5f593          	andi	a1,a1,255
    80003e4c:	fff6071b          	addiw	a4,a2,-1
    80003e50:	1b06e663          	bltu	a3,a6,80003ffc <__memset+0x1d4>
    80003e54:	1cd76463          	bltu	a4,a3,8000401c <__memset+0x1f4>
    80003e58:	1a078e63          	beqz	a5,80004014 <__memset+0x1ec>
    80003e5c:	00b50023          	sb	a1,0(a0)
    80003e60:	00100713          	li	a4,1
    80003e64:	1ae78463          	beq	a5,a4,8000400c <__memset+0x1e4>
    80003e68:	00b500a3          	sb	a1,1(a0)
    80003e6c:	00200713          	li	a4,2
    80003e70:	1ae78a63          	beq	a5,a4,80004024 <__memset+0x1fc>
    80003e74:	00b50123          	sb	a1,2(a0)
    80003e78:	00300713          	li	a4,3
    80003e7c:	18e78463          	beq	a5,a4,80004004 <__memset+0x1dc>
    80003e80:	00b501a3          	sb	a1,3(a0)
    80003e84:	00400713          	li	a4,4
    80003e88:	1ae78263          	beq	a5,a4,8000402c <__memset+0x204>
    80003e8c:	00b50223          	sb	a1,4(a0)
    80003e90:	00500713          	li	a4,5
    80003e94:	1ae78063          	beq	a5,a4,80004034 <__memset+0x20c>
    80003e98:	00b502a3          	sb	a1,5(a0)
    80003e9c:	00700713          	li	a4,7
    80003ea0:	18e79e63          	bne	a5,a4,8000403c <__memset+0x214>
    80003ea4:	00b50323          	sb	a1,6(a0)
    80003ea8:	00700e93          	li	t4,7
    80003eac:	00859713          	slli	a4,a1,0x8
    80003eb0:	00e5e733          	or	a4,a1,a4
    80003eb4:	01059e13          	slli	t3,a1,0x10
    80003eb8:	01c76e33          	or	t3,a4,t3
    80003ebc:	01859313          	slli	t1,a1,0x18
    80003ec0:	006e6333          	or	t1,t3,t1
    80003ec4:	02059893          	slli	a7,a1,0x20
    80003ec8:	40f60e3b          	subw	t3,a2,a5
    80003ecc:	011368b3          	or	a7,t1,a7
    80003ed0:	02859813          	slli	a6,a1,0x28
    80003ed4:	0108e833          	or	a6,a7,a6
    80003ed8:	03059693          	slli	a3,a1,0x30
    80003edc:	003e589b          	srliw	a7,t3,0x3
    80003ee0:	00d866b3          	or	a3,a6,a3
    80003ee4:	03859713          	slli	a4,a1,0x38
    80003ee8:	00389813          	slli	a6,a7,0x3
    80003eec:	00f507b3          	add	a5,a0,a5
    80003ef0:	00e6e733          	or	a4,a3,a4
    80003ef4:	000e089b          	sext.w	a7,t3
    80003ef8:	00f806b3          	add	a3,a6,a5
    80003efc:	00e7b023          	sd	a4,0(a5)
    80003f00:	00878793          	addi	a5,a5,8
    80003f04:	fed79ce3          	bne	a5,a3,80003efc <__memset+0xd4>
    80003f08:	ff8e7793          	andi	a5,t3,-8
    80003f0c:	0007871b          	sext.w	a4,a5
    80003f10:	01d787bb          	addw	a5,a5,t4
    80003f14:	0ce88e63          	beq	a7,a4,80003ff0 <__memset+0x1c8>
    80003f18:	00f50733          	add	a4,a0,a5
    80003f1c:	00b70023          	sb	a1,0(a4)
    80003f20:	0017871b          	addiw	a4,a5,1
    80003f24:	0cc77663          	bgeu	a4,a2,80003ff0 <__memset+0x1c8>
    80003f28:	00e50733          	add	a4,a0,a4
    80003f2c:	00b70023          	sb	a1,0(a4)
    80003f30:	0027871b          	addiw	a4,a5,2
    80003f34:	0ac77e63          	bgeu	a4,a2,80003ff0 <__memset+0x1c8>
    80003f38:	00e50733          	add	a4,a0,a4
    80003f3c:	00b70023          	sb	a1,0(a4)
    80003f40:	0037871b          	addiw	a4,a5,3
    80003f44:	0ac77663          	bgeu	a4,a2,80003ff0 <__memset+0x1c8>
    80003f48:	00e50733          	add	a4,a0,a4
    80003f4c:	00b70023          	sb	a1,0(a4)
    80003f50:	0047871b          	addiw	a4,a5,4
    80003f54:	08c77e63          	bgeu	a4,a2,80003ff0 <__memset+0x1c8>
    80003f58:	00e50733          	add	a4,a0,a4
    80003f5c:	00b70023          	sb	a1,0(a4)
    80003f60:	0057871b          	addiw	a4,a5,5
    80003f64:	08c77663          	bgeu	a4,a2,80003ff0 <__memset+0x1c8>
    80003f68:	00e50733          	add	a4,a0,a4
    80003f6c:	00b70023          	sb	a1,0(a4)
    80003f70:	0067871b          	addiw	a4,a5,6
    80003f74:	06c77e63          	bgeu	a4,a2,80003ff0 <__memset+0x1c8>
    80003f78:	00e50733          	add	a4,a0,a4
    80003f7c:	00b70023          	sb	a1,0(a4)
    80003f80:	0077871b          	addiw	a4,a5,7
    80003f84:	06c77663          	bgeu	a4,a2,80003ff0 <__memset+0x1c8>
    80003f88:	00e50733          	add	a4,a0,a4
    80003f8c:	00b70023          	sb	a1,0(a4)
    80003f90:	0087871b          	addiw	a4,a5,8
    80003f94:	04c77e63          	bgeu	a4,a2,80003ff0 <__memset+0x1c8>
    80003f98:	00e50733          	add	a4,a0,a4
    80003f9c:	00b70023          	sb	a1,0(a4)
    80003fa0:	0097871b          	addiw	a4,a5,9
    80003fa4:	04c77663          	bgeu	a4,a2,80003ff0 <__memset+0x1c8>
    80003fa8:	00e50733          	add	a4,a0,a4
    80003fac:	00b70023          	sb	a1,0(a4)
    80003fb0:	00a7871b          	addiw	a4,a5,10
    80003fb4:	02c77e63          	bgeu	a4,a2,80003ff0 <__memset+0x1c8>
    80003fb8:	00e50733          	add	a4,a0,a4
    80003fbc:	00b70023          	sb	a1,0(a4)
    80003fc0:	00b7871b          	addiw	a4,a5,11
    80003fc4:	02c77663          	bgeu	a4,a2,80003ff0 <__memset+0x1c8>
    80003fc8:	00e50733          	add	a4,a0,a4
    80003fcc:	00b70023          	sb	a1,0(a4)
    80003fd0:	00c7871b          	addiw	a4,a5,12
    80003fd4:	00c77e63          	bgeu	a4,a2,80003ff0 <__memset+0x1c8>
    80003fd8:	00e50733          	add	a4,a0,a4
    80003fdc:	00b70023          	sb	a1,0(a4)
    80003fe0:	00d7879b          	addiw	a5,a5,13
    80003fe4:	00c7f663          	bgeu	a5,a2,80003ff0 <__memset+0x1c8>
    80003fe8:	00f507b3          	add	a5,a0,a5
    80003fec:	00b78023          	sb	a1,0(a5)
    80003ff0:	00813403          	ld	s0,8(sp)
    80003ff4:	01010113          	addi	sp,sp,16
    80003ff8:	00008067          	ret
    80003ffc:	00b00693          	li	a3,11
    80004000:	e55ff06f          	j	80003e54 <__memset+0x2c>
    80004004:	00300e93          	li	t4,3
    80004008:	ea5ff06f          	j	80003eac <__memset+0x84>
    8000400c:	00100e93          	li	t4,1
    80004010:	e9dff06f          	j	80003eac <__memset+0x84>
    80004014:	00000e93          	li	t4,0
    80004018:	e95ff06f          	j	80003eac <__memset+0x84>
    8000401c:	00000793          	li	a5,0
    80004020:	ef9ff06f          	j	80003f18 <__memset+0xf0>
    80004024:	00200e93          	li	t4,2
    80004028:	e85ff06f          	j	80003eac <__memset+0x84>
    8000402c:	00400e93          	li	t4,4
    80004030:	e7dff06f          	j	80003eac <__memset+0x84>
    80004034:	00500e93          	li	t4,5
    80004038:	e75ff06f          	j	80003eac <__memset+0x84>
    8000403c:	00600e93          	li	t4,6
    80004040:	e6dff06f          	j	80003eac <__memset+0x84>

0000000080004044 <__memmove>:
    80004044:	ff010113          	addi	sp,sp,-16
    80004048:	00813423          	sd	s0,8(sp)
    8000404c:	01010413          	addi	s0,sp,16
    80004050:	0e060863          	beqz	a2,80004140 <__memmove+0xfc>
    80004054:	fff6069b          	addiw	a3,a2,-1
    80004058:	0006881b          	sext.w	a6,a3
    8000405c:	0ea5e863          	bltu	a1,a0,8000414c <__memmove+0x108>
    80004060:	00758713          	addi	a4,a1,7
    80004064:	00a5e7b3          	or	a5,a1,a0
    80004068:	40a70733          	sub	a4,a4,a0
    8000406c:	0077f793          	andi	a5,a5,7
    80004070:	00f73713          	sltiu	a4,a4,15
    80004074:	00174713          	xori	a4,a4,1
    80004078:	0017b793          	seqz	a5,a5
    8000407c:	00e7f7b3          	and	a5,a5,a4
    80004080:	10078863          	beqz	a5,80004190 <__memmove+0x14c>
    80004084:	00900793          	li	a5,9
    80004088:	1107f463          	bgeu	a5,a6,80004190 <__memmove+0x14c>
    8000408c:	0036581b          	srliw	a6,a2,0x3
    80004090:	fff8081b          	addiw	a6,a6,-1
    80004094:	02081813          	slli	a6,a6,0x20
    80004098:	01d85893          	srli	a7,a6,0x1d
    8000409c:	00858813          	addi	a6,a1,8
    800040a0:	00058793          	mv	a5,a1
    800040a4:	00050713          	mv	a4,a0
    800040a8:	01088833          	add	a6,a7,a6
    800040ac:	0007b883          	ld	a7,0(a5)
    800040b0:	00878793          	addi	a5,a5,8
    800040b4:	00870713          	addi	a4,a4,8
    800040b8:	ff173c23          	sd	a7,-8(a4)
    800040bc:	ff0798e3          	bne	a5,a6,800040ac <__memmove+0x68>
    800040c0:	ff867713          	andi	a4,a2,-8
    800040c4:	02071793          	slli	a5,a4,0x20
    800040c8:	0207d793          	srli	a5,a5,0x20
    800040cc:	00f585b3          	add	a1,a1,a5
    800040d0:	40e686bb          	subw	a3,a3,a4
    800040d4:	00f507b3          	add	a5,a0,a5
    800040d8:	06e60463          	beq	a2,a4,80004140 <__memmove+0xfc>
    800040dc:	0005c703          	lbu	a4,0(a1)
    800040e0:	00e78023          	sb	a4,0(a5)
    800040e4:	04068e63          	beqz	a3,80004140 <__memmove+0xfc>
    800040e8:	0015c603          	lbu	a2,1(a1)
    800040ec:	00100713          	li	a4,1
    800040f0:	00c780a3          	sb	a2,1(a5)
    800040f4:	04e68663          	beq	a3,a4,80004140 <__memmove+0xfc>
    800040f8:	0025c603          	lbu	a2,2(a1)
    800040fc:	00200713          	li	a4,2
    80004100:	00c78123          	sb	a2,2(a5)
    80004104:	02e68e63          	beq	a3,a4,80004140 <__memmove+0xfc>
    80004108:	0035c603          	lbu	a2,3(a1)
    8000410c:	00300713          	li	a4,3
    80004110:	00c781a3          	sb	a2,3(a5)
    80004114:	02e68663          	beq	a3,a4,80004140 <__memmove+0xfc>
    80004118:	0045c603          	lbu	a2,4(a1)
    8000411c:	00400713          	li	a4,4
    80004120:	00c78223          	sb	a2,4(a5)
    80004124:	00e68e63          	beq	a3,a4,80004140 <__memmove+0xfc>
    80004128:	0055c603          	lbu	a2,5(a1)
    8000412c:	00500713          	li	a4,5
    80004130:	00c782a3          	sb	a2,5(a5)
    80004134:	00e68663          	beq	a3,a4,80004140 <__memmove+0xfc>
    80004138:	0065c703          	lbu	a4,6(a1)
    8000413c:	00e78323          	sb	a4,6(a5)
    80004140:	00813403          	ld	s0,8(sp)
    80004144:	01010113          	addi	sp,sp,16
    80004148:	00008067          	ret
    8000414c:	02061713          	slli	a4,a2,0x20
    80004150:	02075713          	srli	a4,a4,0x20
    80004154:	00e587b3          	add	a5,a1,a4
    80004158:	f0f574e3          	bgeu	a0,a5,80004060 <__memmove+0x1c>
    8000415c:	02069613          	slli	a2,a3,0x20
    80004160:	02065613          	srli	a2,a2,0x20
    80004164:	fff64613          	not	a2,a2
    80004168:	00e50733          	add	a4,a0,a4
    8000416c:	00c78633          	add	a2,a5,a2
    80004170:	fff7c683          	lbu	a3,-1(a5)
    80004174:	fff78793          	addi	a5,a5,-1
    80004178:	fff70713          	addi	a4,a4,-1
    8000417c:	00d70023          	sb	a3,0(a4)
    80004180:	fec798e3          	bne	a5,a2,80004170 <__memmove+0x12c>
    80004184:	00813403          	ld	s0,8(sp)
    80004188:	01010113          	addi	sp,sp,16
    8000418c:	00008067          	ret
    80004190:	02069713          	slli	a4,a3,0x20
    80004194:	02075713          	srli	a4,a4,0x20
    80004198:	00170713          	addi	a4,a4,1
    8000419c:	00e50733          	add	a4,a0,a4
    800041a0:	00050793          	mv	a5,a0
    800041a4:	0005c683          	lbu	a3,0(a1)
    800041a8:	00178793          	addi	a5,a5,1
    800041ac:	00158593          	addi	a1,a1,1
    800041b0:	fed78fa3          	sb	a3,-1(a5)
    800041b4:	fee798e3          	bne	a5,a4,800041a4 <__memmove+0x160>
    800041b8:	f89ff06f          	j	80004140 <__memmove+0xfc>

00000000800041bc <__mem_free>:
    800041bc:	ff010113          	addi	sp,sp,-16
    800041c0:	00813423          	sd	s0,8(sp)
    800041c4:	01010413          	addi	s0,sp,16
    800041c8:	00002597          	auipc	a1,0x2
    800041cc:	83058593          	addi	a1,a1,-2000 # 800059f8 <freep>
    800041d0:	0005b783          	ld	a5,0(a1)
    800041d4:	ff050693          	addi	a3,a0,-16
    800041d8:	0007b703          	ld	a4,0(a5)
    800041dc:	00d7fc63          	bgeu	a5,a3,800041f4 <__mem_free+0x38>
    800041e0:	00e6ee63          	bltu	a3,a4,800041fc <__mem_free+0x40>
    800041e4:	00e7fc63          	bgeu	a5,a4,800041fc <__mem_free+0x40>
    800041e8:	00070793          	mv	a5,a4
    800041ec:	0007b703          	ld	a4,0(a5)
    800041f0:	fed7e8e3          	bltu	a5,a3,800041e0 <__mem_free+0x24>
    800041f4:	fee7eae3          	bltu	a5,a4,800041e8 <__mem_free+0x2c>
    800041f8:	fee6f8e3          	bgeu	a3,a4,800041e8 <__mem_free+0x2c>
    800041fc:	ff852803          	lw	a6,-8(a0)
    80004200:	02081613          	slli	a2,a6,0x20
    80004204:	01c65613          	srli	a2,a2,0x1c
    80004208:	00c68633          	add	a2,a3,a2
    8000420c:	02c70a63          	beq	a4,a2,80004240 <__mem_free+0x84>
    80004210:	fee53823          	sd	a4,-16(a0)
    80004214:	0087a503          	lw	a0,8(a5)
    80004218:	02051613          	slli	a2,a0,0x20
    8000421c:	01c65613          	srli	a2,a2,0x1c
    80004220:	00c78633          	add	a2,a5,a2
    80004224:	04c68263          	beq	a3,a2,80004268 <__mem_free+0xac>
    80004228:	00813403          	ld	s0,8(sp)
    8000422c:	00d7b023          	sd	a3,0(a5)
    80004230:	00f5b023          	sd	a5,0(a1)
    80004234:	00000513          	li	a0,0
    80004238:	01010113          	addi	sp,sp,16
    8000423c:	00008067          	ret
    80004240:	00872603          	lw	a2,8(a4)
    80004244:	00073703          	ld	a4,0(a4)
    80004248:	0106083b          	addw	a6,a2,a6
    8000424c:	ff052c23          	sw	a6,-8(a0)
    80004250:	fee53823          	sd	a4,-16(a0)
    80004254:	0087a503          	lw	a0,8(a5)
    80004258:	02051613          	slli	a2,a0,0x20
    8000425c:	01c65613          	srli	a2,a2,0x1c
    80004260:	00c78633          	add	a2,a5,a2
    80004264:	fcc692e3          	bne	a3,a2,80004228 <__mem_free+0x6c>
    80004268:	00813403          	ld	s0,8(sp)
    8000426c:	0105053b          	addw	a0,a0,a6
    80004270:	00a7a423          	sw	a0,8(a5)
    80004274:	00e7b023          	sd	a4,0(a5)
    80004278:	00f5b023          	sd	a5,0(a1)
    8000427c:	00000513          	li	a0,0
    80004280:	01010113          	addi	sp,sp,16
    80004284:	00008067          	ret

0000000080004288 <__mem_alloc>:
    80004288:	fc010113          	addi	sp,sp,-64
    8000428c:	02813823          	sd	s0,48(sp)
    80004290:	02913423          	sd	s1,40(sp)
    80004294:	03213023          	sd	s2,32(sp)
    80004298:	01513423          	sd	s5,8(sp)
    8000429c:	02113c23          	sd	ra,56(sp)
    800042a0:	01313c23          	sd	s3,24(sp)
    800042a4:	01413823          	sd	s4,16(sp)
    800042a8:	01613023          	sd	s6,0(sp)
    800042ac:	04010413          	addi	s0,sp,64
    800042b0:	00001a97          	auipc	s5,0x1
    800042b4:	748a8a93          	addi	s5,s5,1864 # 800059f8 <freep>
    800042b8:	00f50913          	addi	s2,a0,15
    800042bc:	000ab683          	ld	a3,0(s5)
    800042c0:	00495913          	srli	s2,s2,0x4
    800042c4:	0019049b          	addiw	s1,s2,1
    800042c8:	00048913          	mv	s2,s1
    800042cc:	0c068c63          	beqz	a3,800043a4 <__mem_alloc+0x11c>
    800042d0:	0006b503          	ld	a0,0(a3)
    800042d4:	00852703          	lw	a4,8(a0)
    800042d8:	10977063          	bgeu	a4,s1,800043d8 <__mem_alloc+0x150>
    800042dc:	000017b7          	lui	a5,0x1
    800042e0:	0009099b          	sext.w	s3,s2
    800042e4:	0af4e863          	bltu	s1,a5,80004394 <__mem_alloc+0x10c>
    800042e8:	02099a13          	slli	s4,s3,0x20
    800042ec:	01ca5a13          	srli	s4,s4,0x1c
    800042f0:	fff00b13          	li	s6,-1
    800042f4:	0100006f          	j	80004304 <__mem_alloc+0x7c>
    800042f8:	0007b503          	ld	a0,0(a5) # 1000 <_entry-0x7ffff000>
    800042fc:	00852703          	lw	a4,8(a0)
    80004300:	04977463          	bgeu	a4,s1,80004348 <__mem_alloc+0xc0>
    80004304:	00050793          	mv	a5,a0
    80004308:	fea698e3          	bne	a3,a0,800042f8 <__mem_alloc+0x70>
    8000430c:	000a0513          	mv	a0,s4
    80004310:	00000097          	auipc	ra,0x0
    80004314:	1f0080e7          	jalr	496(ra) # 80004500 <kvmincrease>
    80004318:	00050793          	mv	a5,a0
    8000431c:	01050513          	addi	a0,a0,16
    80004320:	07678e63          	beq	a5,s6,8000439c <__mem_alloc+0x114>
    80004324:	0137a423          	sw	s3,8(a5)
    80004328:	00000097          	auipc	ra,0x0
    8000432c:	e94080e7          	jalr	-364(ra) # 800041bc <__mem_free>
    80004330:	000ab783          	ld	a5,0(s5)
    80004334:	06078463          	beqz	a5,8000439c <__mem_alloc+0x114>
    80004338:	0007b503          	ld	a0,0(a5)
    8000433c:	00078693          	mv	a3,a5
    80004340:	00852703          	lw	a4,8(a0)
    80004344:	fc9760e3          	bltu	a4,s1,80004304 <__mem_alloc+0x7c>
    80004348:	08e48263          	beq	s1,a4,800043cc <__mem_alloc+0x144>
    8000434c:	4127073b          	subw	a4,a4,s2
    80004350:	02071693          	slli	a3,a4,0x20
    80004354:	01c6d693          	srli	a3,a3,0x1c
    80004358:	00e52423          	sw	a4,8(a0)
    8000435c:	00d50533          	add	a0,a0,a3
    80004360:	01252423          	sw	s2,8(a0)
    80004364:	00fab023          	sd	a5,0(s5)
    80004368:	01050513          	addi	a0,a0,16
    8000436c:	03813083          	ld	ra,56(sp)
    80004370:	03013403          	ld	s0,48(sp)
    80004374:	02813483          	ld	s1,40(sp)
    80004378:	02013903          	ld	s2,32(sp)
    8000437c:	01813983          	ld	s3,24(sp)
    80004380:	01013a03          	ld	s4,16(sp)
    80004384:	00813a83          	ld	s5,8(sp)
    80004388:	00013b03          	ld	s6,0(sp)
    8000438c:	04010113          	addi	sp,sp,64
    80004390:	00008067          	ret
    80004394:	000019b7          	lui	s3,0x1
    80004398:	f51ff06f          	j	800042e8 <__mem_alloc+0x60>
    8000439c:	00000513          	li	a0,0
    800043a0:	fcdff06f          	j	8000436c <__mem_alloc+0xe4>
    800043a4:	00003797          	auipc	a5,0x3
    800043a8:	8dc78793          	addi	a5,a5,-1828 # 80006c80 <base>
    800043ac:	00078513          	mv	a0,a5
    800043b0:	00fab023          	sd	a5,0(s5)
    800043b4:	00f7b023          	sd	a5,0(a5)
    800043b8:	00000713          	li	a4,0
    800043bc:	00003797          	auipc	a5,0x3
    800043c0:	8c07a623          	sw	zero,-1844(a5) # 80006c88 <base+0x8>
    800043c4:	00050693          	mv	a3,a0
    800043c8:	f11ff06f          	j	800042d8 <__mem_alloc+0x50>
    800043cc:	00053703          	ld	a4,0(a0)
    800043d0:	00e7b023          	sd	a4,0(a5)
    800043d4:	f91ff06f          	j	80004364 <__mem_alloc+0xdc>
    800043d8:	00068793          	mv	a5,a3
    800043dc:	f6dff06f          	j	80004348 <__mem_alloc+0xc0>

00000000800043e0 <__putc>:
    800043e0:	fe010113          	addi	sp,sp,-32
    800043e4:	00813823          	sd	s0,16(sp)
    800043e8:	00113c23          	sd	ra,24(sp)
    800043ec:	02010413          	addi	s0,sp,32
    800043f0:	00050793          	mv	a5,a0
    800043f4:	fef40593          	addi	a1,s0,-17
    800043f8:	00100613          	li	a2,1
    800043fc:	00000513          	li	a0,0
    80004400:	fef407a3          	sb	a5,-17(s0)
    80004404:	fffff097          	auipc	ra,0xfffff
    80004408:	918080e7          	jalr	-1768(ra) # 80002d1c <console_write>
    8000440c:	01813083          	ld	ra,24(sp)
    80004410:	01013403          	ld	s0,16(sp)
    80004414:	02010113          	addi	sp,sp,32
    80004418:	00008067          	ret

000000008000441c <__getc>:
    8000441c:	fe010113          	addi	sp,sp,-32
    80004420:	00813823          	sd	s0,16(sp)
    80004424:	00113c23          	sd	ra,24(sp)
    80004428:	02010413          	addi	s0,sp,32
    8000442c:	fe840593          	addi	a1,s0,-24
    80004430:	00100613          	li	a2,1
    80004434:	00000513          	li	a0,0
    80004438:	fffff097          	auipc	ra,0xfffff
    8000443c:	8c4080e7          	jalr	-1852(ra) # 80002cfc <console_read>
    80004440:	fe844503          	lbu	a0,-24(s0)
    80004444:	01813083          	ld	ra,24(sp)
    80004448:	01013403          	ld	s0,16(sp)
    8000444c:	02010113          	addi	sp,sp,32
    80004450:	00008067          	ret

0000000080004454 <console_handler>:
    80004454:	fe010113          	addi	sp,sp,-32
    80004458:	00813823          	sd	s0,16(sp)
    8000445c:	00113c23          	sd	ra,24(sp)
    80004460:	00913423          	sd	s1,8(sp)
    80004464:	02010413          	addi	s0,sp,32
    80004468:	14202773          	csrr	a4,scause
    8000446c:	100027f3          	csrr	a5,sstatus
    80004470:	0027f793          	andi	a5,a5,2
    80004474:	06079e63          	bnez	a5,800044f0 <console_handler+0x9c>
    80004478:	00074c63          	bltz	a4,80004490 <console_handler+0x3c>
    8000447c:	01813083          	ld	ra,24(sp)
    80004480:	01013403          	ld	s0,16(sp)
    80004484:	00813483          	ld	s1,8(sp)
    80004488:	02010113          	addi	sp,sp,32
    8000448c:	00008067          	ret
    80004490:	0ff77713          	andi	a4,a4,255
    80004494:	00900793          	li	a5,9
    80004498:	fef712e3          	bne	a4,a5,8000447c <console_handler+0x28>
    8000449c:	ffffe097          	auipc	ra,0xffffe
    800044a0:	4b8080e7          	jalr	1208(ra) # 80002954 <plic_claim>
    800044a4:	00a00793          	li	a5,10
    800044a8:	00050493          	mv	s1,a0
    800044ac:	02f50c63          	beq	a0,a5,800044e4 <console_handler+0x90>
    800044b0:	fc0506e3          	beqz	a0,8000447c <console_handler+0x28>
    800044b4:	00050593          	mv	a1,a0
    800044b8:	00001517          	auipc	a0,0x1
    800044bc:	d8850513          	addi	a0,a0,-632 # 80005240 <_ZZ12printIntegermE6digits+0xe0>
    800044c0:	fffff097          	auipc	ra,0xfffff
    800044c4:	8d8080e7          	jalr	-1832(ra) # 80002d98 <__printf>
    800044c8:	01013403          	ld	s0,16(sp)
    800044cc:	01813083          	ld	ra,24(sp)
    800044d0:	00048513          	mv	a0,s1
    800044d4:	00813483          	ld	s1,8(sp)
    800044d8:	02010113          	addi	sp,sp,32
    800044dc:	ffffe317          	auipc	t1,0xffffe
    800044e0:	4b030067          	jr	1200(t1) # 8000298c <plic_complete>
    800044e4:	fffff097          	auipc	ra,0xfffff
    800044e8:	1bc080e7          	jalr	444(ra) # 800036a0 <uartintr>
    800044ec:	fddff06f          	j	800044c8 <console_handler+0x74>
    800044f0:	00001517          	auipc	a0,0x1
    800044f4:	e5050513          	addi	a0,a0,-432 # 80005340 <digits+0x78>
    800044f8:	fffff097          	auipc	ra,0xfffff
    800044fc:	844080e7          	jalr	-1980(ra) # 80002d3c <panic>

0000000080004500 <kvmincrease>:
    80004500:	fe010113          	addi	sp,sp,-32
    80004504:	01213023          	sd	s2,0(sp)
    80004508:	00001937          	lui	s2,0x1
    8000450c:	fff90913          	addi	s2,s2,-1 # fff <_entry-0x7ffff001>
    80004510:	00813823          	sd	s0,16(sp)
    80004514:	00113c23          	sd	ra,24(sp)
    80004518:	00913423          	sd	s1,8(sp)
    8000451c:	02010413          	addi	s0,sp,32
    80004520:	01250933          	add	s2,a0,s2
    80004524:	00c95913          	srli	s2,s2,0xc
    80004528:	02090863          	beqz	s2,80004558 <kvmincrease+0x58>
    8000452c:	00000493          	li	s1,0
    80004530:	00148493          	addi	s1,s1,1
    80004534:	fffff097          	auipc	ra,0xfffff
    80004538:	4bc080e7          	jalr	1212(ra) # 800039f0 <kalloc>
    8000453c:	fe991ae3          	bne	s2,s1,80004530 <kvmincrease+0x30>
    80004540:	01813083          	ld	ra,24(sp)
    80004544:	01013403          	ld	s0,16(sp)
    80004548:	00813483          	ld	s1,8(sp)
    8000454c:	00013903          	ld	s2,0(sp)
    80004550:	02010113          	addi	sp,sp,32
    80004554:	00008067          	ret
    80004558:	01813083          	ld	ra,24(sp)
    8000455c:	01013403          	ld	s0,16(sp)
    80004560:	00813483          	ld	s1,8(sp)
    80004564:	00013903          	ld	s2,0(sp)
    80004568:	00000513          	li	a0,0
    8000456c:	02010113          	addi	sp,sp,32
    80004570:	00008067          	ret
	...
