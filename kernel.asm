
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00006117          	auipc	sp,0x6
    80000004:	bf813103          	ld	sp,-1032(sp) # 80005bf8 <_GLOBAL_OFFSET_TABLE_+0x20>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	768020ef          	jal	ra,80002784 <start>

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
    80001084:	60d000ef          	jal	ra,80001e90 <_ZN5Riscv20handleSupervisorTrapEv>

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
    80001228:	b94080e7          	jalr	-1132(ra) # 80001db8 <_Znam>
    8000122c:	fca43423          	sd	a0,-56(s0)
    printInteger((uint64)stack);
    80001230:	fc843503          	ld	a0,-56(s0)
    80001234:	00001097          	auipc	ra,0x1
    80001238:	494080e7          	jalr	1172(ra) # 800026c8 <_Z12printIntegerm>
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

00000000800012bc <_Z8sem_openPP4_semj>:

int sem_open(sem_t *handle, unsigned init){
    800012bc:	ff010113          	addi	sp,sp,-16
    800012c0:	00813423          	sd	s0,8(sp)
    800012c4:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a2, %0" : : "r" (init));
    800012c8:	00058613          	mv	a2,a1
    __asm__ volatile("mv a1, %0" : : "r" (handle));
    800012cc:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %0" : : "r" (SEM_OPEN));
    800012d0:	02100793          	li	a5,33
    800012d4:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    800012d8:	00000073          	ecall
    uint64 ret;
    __asm__ volatile("mv %0, a0" : "=r" (ret));
    800012dc:	00050513          	mv	a0,a0
    return ret;
}
    800012e0:	0005051b          	sext.w	a0,a0
    800012e4:	00813403          	ld	s0,8(sp)
    800012e8:	01010113          	addi	sp,sp,16
    800012ec:	00008067          	ret

00000000800012f0 <_Z9sem_closeP4_sem>:

int sem_close(sem_t handle){
    800012f0:	ff010113          	addi	sp,sp,-16
    800012f4:	00813423          	sd	s0,8(sp)
    800012f8:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %0" : : "r" (handle));
    800012fc:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %0" : : "r" (SEM_CLOSE));
    80001300:	02200793          	li	a5,34
    80001304:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    80001308:	00000073          	ecall
    uint64 ret;
    __asm__ volatile("mv %0, a0" : "=r" (ret));
    8000130c:	00050513          	mv	a0,a0
    return ret;
}
    80001310:	0005051b          	sext.w	a0,a0
    80001314:	00813403          	ld	s0,8(sp)
    80001318:	01010113          	addi	sp,sp,16
    8000131c:	00008067          	ret

0000000080001320 <_Z8sem_waitP4_sem>:

int sem_wait(sem_t id){
    80001320:	ff010113          	addi	sp,sp,-16
    80001324:	00813423          	sd	s0,8(sp)
    80001328:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %0" : : "r" (id));
    8000132c:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %0" : : "r" (SEM_SIGNAL));
    80001330:	02400793          	li	a5,36
    80001334:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    80001338:	00000073          	ecall
    uint64 ret;
    __asm__ volatile("mv %0, a0" : "=r" (ret));
    8000133c:	00050513          	mv	a0,a0
    return ret;
}
    80001340:	0005051b          	sext.w	a0,a0
    80001344:	00813403          	ld	s0,8(sp)
    80001348:	01010113          	addi	sp,sp,16
    8000134c:	00008067          	ret

0000000080001350 <_Z10sem_signalP4_sem>:

int sem_signal(sem_t id){
    80001350:	ff010113          	addi	sp,sp,-16
    80001354:	00813423          	sd	s0,8(sp)
    80001358:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %0" : : "r" (id));
    8000135c:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %0" : : "r" (SEM_SIGNAL));
    80001360:	02400793          	li	a5,36
    80001364:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    80001368:	00000073          	ecall
    uint64 ret;
    __asm__ volatile("mv %0, a0" : "=r" (ret));
    8000136c:	00050513          	mv	a0,a0
    return ret;
}
    80001370:	0005051b          	sext.w	a0,a0
    80001374:	00813403          	ld	s0,8(sp)
    80001378:	01010113          	addi	sp,sp,16
    8000137c:	00008067          	ret

0000000080001380 <_Z10time_sleepm>:

int time_sleep(time_t t){
    80001380:	ff010113          	addi	sp,sp,-16
    80001384:	00813423          	sd	s0,8(sp)
    80001388:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %0" : : "r" (t));
    8000138c:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %0" : : "r" (THREAD_SLEEP));
    80001390:	03100793          	li	a5,49
    80001394:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    80001398:	00000073          	ecall
    uint64 ret;
    __asm__ volatile("mv %0, a0" : "=r" (ret));
    8000139c:	00050513          	mv	a0,a0
    return ret;
}
    800013a0:	0005051b          	sext.w	a0,a0
    800013a4:	00813403          	ld	s0,8(sp)
    800013a8:	01010113          	addi	sp,sp,16
    800013ac:	00008067          	ret

00000000800013b0 <_ZL9fibonaccim>:
        }
    }
}

static uint64 fibonacci(uint64 n)
{
    800013b0:	fe010113          	addi	sp,sp,-32
    800013b4:	00113c23          	sd	ra,24(sp)
    800013b8:	00813823          	sd	s0,16(sp)
    800013bc:	00913423          	sd	s1,8(sp)
    800013c0:	01213023          	sd	s2,0(sp)
    800013c4:	02010413          	addi	s0,sp,32
    800013c8:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    800013cc:	00100793          	li	a5,1
    800013d0:	02a7f863          	bgeu	a5,a0,80001400 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { _thread::yield(); }
    800013d4:	00a00793          	li	a5,10
    800013d8:	02f577b3          	remu	a5,a0,a5
    800013dc:	02078e63          	beqz	a5,80001418 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    800013e0:	fff48513          	addi	a0,s1,-1
    800013e4:	00000097          	auipc	ra,0x0
    800013e8:	fcc080e7          	jalr	-52(ra) # 800013b0 <_ZL9fibonaccim>
    800013ec:	00050913          	mv	s2,a0
    800013f0:	ffe48513          	addi	a0,s1,-2
    800013f4:	00000097          	auipc	ra,0x0
    800013f8:	fbc080e7          	jalr	-68(ra) # 800013b0 <_ZL9fibonaccim>
    800013fc:	00a90533          	add	a0,s2,a0
}
    80001400:	01813083          	ld	ra,24(sp)
    80001404:	01013403          	ld	s0,16(sp)
    80001408:	00813483          	ld	s1,8(sp)
    8000140c:	00013903          	ld	s2,0(sp)
    80001410:	02010113          	addi	sp,sp,32
    80001414:	00008067          	ret
    if (n % 10 == 0) { _thread::yield(); }
    80001418:	00000097          	auipc	ra,0x0
    8000141c:	6b4080e7          	jalr	1716(ra) # 80001acc <_ZN7_thread5yieldEv>
    80001420:	fc1ff06f          	j	800013e0 <_ZL9fibonaccim+0x30>

0000000080001424 <_Z11workerBodyAv>:
{
    80001424:	fe010113          	addi	sp,sp,-32
    80001428:	00113c23          	sd	ra,24(sp)
    8000142c:	00813823          	sd	s0,16(sp)
    80001430:	00913423          	sd	s1,8(sp)
    80001434:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++)
    80001438:	00000493          	li	s1,0
    8000143c:	0400006f          	j	8000147c <_Z11workerBodyAv+0x58>
            time_sleep(50);
    80001440:	03200513          	li	a0,50
    80001444:	00000097          	auipc	ra,0x0
    80001448:	f3c080e7          	jalr	-196(ra) # 80001380 <_Z10time_sleepm>
    8000144c:	0400006f          	j	8000148c <_Z11workerBodyAv+0x68>
        for (uint64 j = 0; j < 10000; j++)
    80001450:	00168693          	addi	a3,a3,1
    80001454:	000027b7          	lui	a5,0x2
    80001458:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    8000145c:	00d7ee63          	bltu	a5,a3,80001478 <_Z11workerBodyAv+0x54>
            for (uint64 k = 0; k < 30000; k++)
    80001460:	00000713          	li	a4,0
    80001464:	000077b7          	lui	a5,0x7
    80001468:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    8000146c:	fee7e2e3          	bltu	a5,a4,80001450 <_Z11workerBodyAv+0x2c>
    80001470:	00170713          	addi	a4,a4,1
    80001474:	ff1ff06f          	j	80001464 <_Z11workerBodyAv+0x40>
    for (uint64 i = 0; i < 10; i++)
    80001478:	00148493          	addi	s1,s1,1
    8000147c:	00900793          	li	a5,9
    80001480:	0497e063          	bltu	a5,s1,800014c0 <_Z11workerBodyAv+0x9c>
        if(i == 5)
    80001484:	00500793          	li	a5,5
    80001488:	faf48ce3          	beq	s1,a5,80001440 <_Z11workerBodyAv+0x1c>
        printString("A: i=");
    8000148c:	00004517          	auipc	a0,0x4
    80001490:	b7450513          	addi	a0,a0,-1164 # 80005000 <kvmincrease+0x470>
    80001494:	00001097          	auipc	ra,0x1
    80001498:	1c4080e7          	jalr	452(ra) # 80002658 <_Z11printStringPKc>
        printInteger(i);
    8000149c:	00048513          	mv	a0,s1
    800014a0:	00001097          	auipc	ra,0x1
    800014a4:	228080e7          	jalr	552(ra) # 800026c8 <_Z12printIntegerm>
        printString("\n");
    800014a8:	00004517          	auipc	a0,0x4
    800014ac:	be850513          	addi	a0,a0,-1048 # 80005090 <kvmincrease+0x500>
    800014b0:	00001097          	auipc	ra,0x1
    800014b4:	1a8080e7          	jalr	424(ra) # 80002658 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++)
    800014b8:	00000693          	li	a3,0
    800014bc:	f99ff06f          	j	80001454 <_Z11workerBodyAv+0x30>
}
    800014c0:	01813083          	ld	ra,24(sp)
    800014c4:	01013403          	ld	s0,16(sp)
    800014c8:	00813483          	ld	s1,8(sp)
    800014cc:	02010113          	addi	sp,sp,32
    800014d0:	00008067          	ret

00000000800014d4 <_Z11workerBodyBv>:
{
    800014d4:	fe010113          	addi	sp,sp,-32
    800014d8:	00113c23          	sd	ra,24(sp)
    800014dc:	00813823          	sd	s0,16(sp)
    800014e0:	00913423          	sd	s1,8(sp)
    800014e4:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++)
    800014e8:	00000493          	li	s1,0
    800014ec:	0300006f          	j	8000151c <_Z11workerBodyBv+0x48>
        for (uint64 j = 0; j < 10000; j++)
    800014f0:	00168693          	addi	a3,a3,1
    800014f4:	000027b7          	lui	a5,0x2
    800014f8:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800014fc:	00d7ee63          	bltu	a5,a3,80001518 <_Z11workerBodyBv+0x44>
            for (uint64 k = 0; k < 30000; k++)
    80001500:	00000713          	li	a4,0
    80001504:	000077b7          	lui	a5,0x7
    80001508:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    8000150c:	fee7e2e3          	bltu	a5,a4,800014f0 <_Z11workerBodyBv+0x1c>
    80001510:	00170713          	addi	a4,a4,1
    80001514:	ff1ff06f          	j	80001504 <_Z11workerBodyBv+0x30>
    for (uint64 i = 0; i < 16; i++)
    80001518:	00148493          	addi	s1,s1,1
    8000151c:	00f00793          	li	a5,15
    80001520:	0297ec63          	bltu	a5,s1,80001558 <_Z11workerBodyBv+0x84>
        printString("B: i=");
    80001524:	00004517          	auipc	a0,0x4
    80001528:	ae450513          	addi	a0,a0,-1308 # 80005008 <kvmincrease+0x478>
    8000152c:	00001097          	auipc	ra,0x1
    80001530:	12c080e7          	jalr	300(ra) # 80002658 <_Z11printStringPKc>
        printInteger(i);
    80001534:	00048513          	mv	a0,s1
    80001538:	00001097          	auipc	ra,0x1
    8000153c:	190080e7          	jalr	400(ra) # 800026c8 <_Z12printIntegerm>
        printString("\n");
    80001540:	00004517          	auipc	a0,0x4
    80001544:	b5050513          	addi	a0,a0,-1200 # 80005090 <kvmincrease+0x500>
    80001548:	00001097          	auipc	ra,0x1
    8000154c:	110080e7          	jalr	272(ra) # 80002658 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++)
    80001550:	00000693          	li	a3,0
    80001554:	fa1ff06f          	j	800014f4 <_Z11workerBodyBv+0x20>
}
    80001558:	01813083          	ld	ra,24(sp)
    8000155c:	01013403          	ld	s0,16(sp)
    80001560:	00813483          	ld	s1,8(sp)
    80001564:	02010113          	addi	sp,sp,32
    80001568:	00008067          	ret

000000008000156c <_Z11workerBodyCv>:

void workerBodyC()
{
    8000156c:	fe010113          	addi	sp,sp,-32
    80001570:	00113c23          	sd	ra,24(sp)
    80001574:	00813823          	sd	s0,16(sp)
    80001578:	00913423          	sd	s1,8(sp)
    8000157c:	01213023          	sd	s2,0(sp)
    80001580:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80001584:	00000493          	li	s1,0
    80001588:	0380006f          	j	800015c0 <_Z11workerBodyCv+0x54>
    for (; i < 3; i++)
    {
        printString("C: i=");
    8000158c:	00004517          	auipc	a0,0x4
    80001590:	a8450513          	addi	a0,a0,-1404 # 80005010 <kvmincrease+0x480>
    80001594:	00001097          	auipc	ra,0x1
    80001598:	0c4080e7          	jalr	196(ra) # 80002658 <_Z11printStringPKc>
        printInteger(i);
    8000159c:	00048513          	mv	a0,s1
    800015a0:	00001097          	auipc	ra,0x1
    800015a4:	128080e7          	jalr	296(ra) # 800026c8 <_Z12printIntegerm>
        printString("\n");
    800015a8:	00004517          	auipc	a0,0x4
    800015ac:	ae850513          	addi	a0,a0,-1304 # 80005090 <kvmincrease+0x500>
    800015b0:	00001097          	auipc	ra,0x1
    800015b4:	0a8080e7          	jalr	168(ra) # 80002658 <_Z11printStringPKc>
    for (; i < 3; i++)
    800015b8:	0014849b          	addiw	s1,s1,1
    800015bc:	0ff4f493          	andi	s1,s1,255
    800015c0:	00200793          	li	a5,2
    800015c4:	fc97f4e3          	bgeu	a5,s1,8000158c <_Z11workerBodyCv+0x20>
    }

    printString("C: yield\n");
    800015c8:	00004517          	auipc	a0,0x4
    800015cc:	a5050513          	addi	a0,a0,-1456 # 80005018 <kvmincrease+0x488>
    800015d0:	00001097          	auipc	ra,0x1
    800015d4:	088080e7          	jalr	136(ra) # 80002658 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    800015d8:	00700313          	li	t1,7
    _thread::yield();
    800015dc:	00000097          	auipc	ra,0x0
    800015e0:	4f0080e7          	jalr	1264(ra) # 80001acc <_ZN7_thread5yieldEv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    800015e4:	00030913          	mv	s2,t1

    printString("C: t1=");
    800015e8:	00004517          	auipc	a0,0x4
    800015ec:	a4050513          	addi	a0,a0,-1472 # 80005028 <kvmincrease+0x498>
    800015f0:	00001097          	auipc	ra,0x1
    800015f4:	068080e7          	jalr	104(ra) # 80002658 <_Z11printStringPKc>
    printInteger(t1);
    800015f8:	00090513          	mv	a0,s2
    800015fc:	00001097          	auipc	ra,0x1
    80001600:	0cc080e7          	jalr	204(ra) # 800026c8 <_Z12printIntegerm>
    printString("\n");
    80001604:	00004517          	auipc	a0,0x4
    80001608:	a8c50513          	addi	a0,a0,-1396 # 80005090 <kvmincrease+0x500>
    8000160c:	00001097          	auipc	ra,0x1
    80001610:	04c080e7          	jalr	76(ra) # 80002658 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    80001614:	00c00513          	li	a0,12
    80001618:	00000097          	auipc	ra,0x0
    8000161c:	d98080e7          	jalr	-616(ra) # 800013b0 <_ZL9fibonaccim>
    80001620:	00050913          	mv	s2,a0
    printString("C: fibonaci=");
    80001624:	00004517          	auipc	a0,0x4
    80001628:	a0c50513          	addi	a0,a0,-1524 # 80005030 <kvmincrease+0x4a0>
    8000162c:	00001097          	auipc	ra,0x1
    80001630:	02c080e7          	jalr	44(ra) # 80002658 <_Z11printStringPKc>
    printInteger(result);
    80001634:	00090513          	mv	a0,s2
    80001638:	00001097          	auipc	ra,0x1
    8000163c:	090080e7          	jalr	144(ra) # 800026c8 <_Z12printIntegerm>
    printString("\n");
    80001640:	00004517          	auipc	a0,0x4
    80001644:	a5050513          	addi	a0,a0,-1456 # 80005090 <kvmincrease+0x500>
    80001648:	00001097          	auipc	ra,0x1
    8000164c:	010080e7          	jalr	16(ra) # 80002658 <_Z11printStringPKc>
    80001650:	0380006f          	j	80001688 <_Z11workerBodyCv+0x11c>

    for (; i < 6; i++)
    {
        printString("C: i=");
    80001654:	00004517          	auipc	a0,0x4
    80001658:	9bc50513          	addi	a0,a0,-1604 # 80005010 <kvmincrease+0x480>
    8000165c:	00001097          	auipc	ra,0x1
    80001660:	ffc080e7          	jalr	-4(ra) # 80002658 <_Z11printStringPKc>
        printInteger(i);
    80001664:	00048513          	mv	a0,s1
    80001668:	00001097          	auipc	ra,0x1
    8000166c:	060080e7          	jalr	96(ra) # 800026c8 <_Z12printIntegerm>
        printString("\n");
    80001670:	00004517          	auipc	a0,0x4
    80001674:	a2050513          	addi	a0,a0,-1504 # 80005090 <kvmincrease+0x500>
    80001678:	00001097          	auipc	ra,0x1
    8000167c:	fe0080e7          	jalr	-32(ra) # 80002658 <_Z11printStringPKc>
    for (; i < 6; i++)
    80001680:	0014849b          	addiw	s1,s1,1
    80001684:	0ff4f493          	andi	s1,s1,255
    80001688:	00500793          	li	a5,5
    8000168c:	fc97f4e3          	bgeu	a5,s1,80001654 <_Z11workerBodyCv+0xe8>
    }
//    _thread::yield();
}
    80001690:	01813083          	ld	ra,24(sp)
    80001694:	01013403          	ld	s0,16(sp)
    80001698:	00813483          	ld	s1,8(sp)
    8000169c:	00013903          	ld	s2,0(sp)
    800016a0:	02010113          	addi	sp,sp,32
    800016a4:	00008067          	ret

00000000800016a8 <_Z11workerBodyDv>:

void workerBodyD()
{
    800016a8:	fe010113          	addi	sp,sp,-32
    800016ac:	00113c23          	sd	ra,24(sp)
    800016b0:	00813823          	sd	s0,16(sp)
    800016b4:	00913423          	sd	s1,8(sp)
    800016b8:	01213023          	sd	s2,0(sp)
    800016bc:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    800016c0:	00a00493          	li	s1,10
    800016c4:	0380006f          	j	800016fc <_Z11workerBodyDv+0x54>
    for (; i < 13; i++)
    {
        printString("D: i=");
    800016c8:	00004517          	auipc	a0,0x4
    800016cc:	97850513          	addi	a0,a0,-1672 # 80005040 <kvmincrease+0x4b0>
    800016d0:	00001097          	auipc	ra,0x1
    800016d4:	f88080e7          	jalr	-120(ra) # 80002658 <_Z11printStringPKc>
        printInteger(i);
    800016d8:	00048513          	mv	a0,s1
    800016dc:	00001097          	auipc	ra,0x1
    800016e0:	fec080e7          	jalr	-20(ra) # 800026c8 <_Z12printIntegerm>
        printString("\n");
    800016e4:	00004517          	auipc	a0,0x4
    800016e8:	9ac50513          	addi	a0,a0,-1620 # 80005090 <kvmincrease+0x500>
    800016ec:	00001097          	auipc	ra,0x1
    800016f0:	f6c080e7          	jalr	-148(ra) # 80002658 <_Z11printStringPKc>
    for (; i < 13; i++)
    800016f4:	0014849b          	addiw	s1,s1,1
    800016f8:	0ff4f493          	andi	s1,s1,255
    800016fc:	00c00793          	li	a5,12
    80001700:	fc97f4e3          	bgeu	a5,s1,800016c8 <_Z11workerBodyDv+0x20>
    }

    printString("D: yield\n");
    80001704:	00004517          	auipc	a0,0x4
    80001708:	94450513          	addi	a0,a0,-1724 # 80005048 <kvmincrease+0x4b8>
    8000170c:	00001097          	auipc	ra,0x1
    80001710:	f4c080e7          	jalr	-180(ra) # 80002658 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80001714:	00500313          	li	t1,5
    _thread::yield();
    80001718:	00000097          	auipc	ra,0x0
    8000171c:	3b4080e7          	jalr	948(ra) # 80001acc <_ZN7_thread5yieldEv>

    uint64 result = fibonacci(16);
    80001720:	01000513          	li	a0,16
    80001724:	00000097          	auipc	ra,0x0
    80001728:	c8c080e7          	jalr	-884(ra) # 800013b0 <_ZL9fibonaccim>
    8000172c:	00050913          	mv	s2,a0
    printString("D: fibonaci=");
    80001730:	00004517          	auipc	a0,0x4
    80001734:	92850513          	addi	a0,a0,-1752 # 80005058 <kvmincrease+0x4c8>
    80001738:	00001097          	auipc	ra,0x1
    8000173c:	f20080e7          	jalr	-224(ra) # 80002658 <_Z11printStringPKc>
    printInteger(result);
    80001740:	00090513          	mv	a0,s2
    80001744:	00001097          	auipc	ra,0x1
    80001748:	f84080e7          	jalr	-124(ra) # 800026c8 <_Z12printIntegerm>
    printString("\n");
    8000174c:	00004517          	auipc	a0,0x4
    80001750:	94450513          	addi	a0,a0,-1724 # 80005090 <kvmincrease+0x500>
    80001754:	00001097          	auipc	ra,0x1
    80001758:	f04080e7          	jalr	-252(ra) # 80002658 <_Z11printStringPKc>
    8000175c:	0380006f          	j	80001794 <_Z11workerBodyDv+0xec>

    for (; i < 16; i++)
    {
        printString("D: i=");
    80001760:	00004517          	auipc	a0,0x4
    80001764:	8e050513          	addi	a0,a0,-1824 # 80005040 <kvmincrease+0x4b0>
    80001768:	00001097          	auipc	ra,0x1
    8000176c:	ef0080e7          	jalr	-272(ra) # 80002658 <_Z11printStringPKc>
        printInteger(i);
    80001770:	00048513          	mv	a0,s1
    80001774:	00001097          	auipc	ra,0x1
    80001778:	f54080e7          	jalr	-172(ra) # 800026c8 <_Z12printIntegerm>
        printString("\n");
    8000177c:	00004517          	auipc	a0,0x4
    80001780:	91450513          	addi	a0,a0,-1772 # 80005090 <kvmincrease+0x500>
    80001784:	00001097          	auipc	ra,0x1
    80001788:	ed4080e7          	jalr	-300(ra) # 80002658 <_Z11printStringPKc>
    for (; i < 16; i++)
    8000178c:	0014849b          	addiw	s1,s1,1
    80001790:	0ff4f493          	andi	s1,s1,255
    80001794:	00f00793          	li	a5,15
    80001798:	fc97f4e3          	bgeu	a5,s1,80001760 <_Z11workerBodyDv+0xb8>
    }
//    _thread::yield();
    8000179c:	01813083          	ld	ra,24(sp)
    800017a0:	01013403          	ld	s0,16(sp)
    800017a4:	00813483          	ld	s1,8(sp)
    800017a8:	00013903          	ld	s2,0(sp)
    800017ac:	02010113          	addi	sp,sp,32
    800017b0:	00008067          	ret

00000000800017b4 <main>:
#include "../h/print.hpp"
#include "../h/riscv.hpp"
#include "../h/syscall_c.h"

int main()
{
    800017b4:	fb010113          	addi	sp,sp,-80
    800017b8:	04113423          	sd	ra,72(sp)
    800017bc:	04813023          	sd	s0,64(sp)
    800017c0:	02913c23          	sd	s1,56(sp)
    800017c4:	03213823          	sd	s2,48(sp)
    800017c8:	05010413          	addi	s0,sp,80
    _thread *threads[5];

    threads[0] = _thread::createThread(nullptr);
    800017cc:	00000513          	li	a0,0
    800017d0:	00000097          	auipc	ra,0x0
    800017d4:	110080e7          	jalr	272(ra) # 800018e0 <_ZN7_thread12createThreadEPFvvE>
    800017d8:	faa43c23          	sd	a0,-72(s0)
    _thread::running = threads[0];
    800017dc:	00004797          	auipc	a5,0x4
    800017e0:	4047b783          	ld	a5,1028(a5) # 80005be0 <_GLOBAL_OFFSET_TABLE_+0x8>
    800017e4:	00a7b023          	sd	a0,0(a5)

    threads[1] = _thread::createThread(workerBodyA);
    800017e8:	00004517          	auipc	a0,0x4
    800017ec:	40853503          	ld	a0,1032(a0) # 80005bf0 <_GLOBAL_OFFSET_TABLE_+0x18>
    800017f0:	00000097          	auipc	ra,0x0
    800017f4:	0f0080e7          	jalr	240(ra) # 800018e0 <_ZN7_thread12createThreadEPFvvE>
    800017f8:	fca43023          	sd	a0,-64(s0)
    printString("ThreadA created\n");
    800017fc:	00004517          	auipc	a0,0x4
    80001800:	86c50513          	addi	a0,a0,-1940 # 80005068 <kvmincrease+0x4d8>
    80001804:	00001097          	auipc	ra,0x1
    80001808:	e54080e7          	jalr	-428(ra) # 80002658 <_Z11printStringPKc>
//    threads[3] = _thread::createThread(workerBodyC);
//    printString("ThreadC created\n");
////    threads[4] = _thread::createThread(workerBodyD);
////    printString("ThreadD created\n");
//
    Riscv::w_stvec((uint64) &Riscv::supervisorTrap);
    8000180c:	00004797          	auipc	a5,0x4
    80001810:	3dc7b783          	ld	a5,988(a5) # 80005be8 <_GLOBAL_OFFSET_TABLE_+0x10>
    return stvec;
}

inline void Riscv::w_stvec(uint64 stvec)
{
    __asm__ volatile ("csrw stvec, %[stvec]" : : [stvec] "r"(stvec));
    80001814:	10579073          	csrw	stvec,a5
    __asm__ volatile ("csrw sip, %[sip]" : : [sip] "r"(sip));
}

inline void Riscv::ms_sstatus(uint64 mask)
{
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    80001818:	00200793          	li	a5,2
    8000181c:	1007a073          	csrs	sstatus,a5
//             threads[3]->isFinished() &&
//             threads[4]->isFinished()))
//    {
//        _thread::yield();
//    }
    while (!(threads[1]->isFinished()))
    80001820:	fc043783          	ld	a5,-64(s0)
class _thread
{
public:
    ~_thread() { delete[] stack; }

    bool isFinished() const { return finished; }
    80001824:	0287c783          	lbu	a5,40(a5)
    80001828:	00079863          	bnez	a5,80001838 <main+0x84>
    {
        _thread::yield();
    8000182c:	00000097          	auipc	ra,0x0
    80001830:	2a0080e7          	jalr	672(ra) # 80001acc <_ZN7_thread5yieldEv>
    80001834:	fedff06f          	j	80001820 <main+0x6c>
    }
    printString("test");
    80001838:	00004517          	auipc	a0,0x4
    8000183c:	84850513          	addi	a0,a0,-1976 # 80005080 <kvmincrease+0x4f0>
    80001840:	00001097          	auipc	ra,0x1
    80001844:	e18080e7          	jalr	-488(ra) # 80002658 <_Z11printStringPKc>
    //DODATI DELETE I NEW!!!
    for (auto &thread: threads)
    80001848:	fb840493          	addi	s1,s0,-72
    8000184c:	0140006f          	j	80001860 <main+0xac>
    {
        delete thread;
    80001850:	00090513          	mv	a0,s2
    80001854:	00000097          	auipc	ra,0x0
    80001858:	58c080e7          	jalr	1420(ra) # 80001de0 <_ZdlPv>
    for (auto &thread: threads)
    8000185c:	00848493          	addi	s1,s1,8
    80001860:	fe040793          	addi	a5,s0,-32
    80001864:	02f48063          	beq	s1,a5,80001884 <main+0xd0>
        delete thread;
    80001868:	0004b903          	ld	s2,0(s1)
    8000186c:	fe0908e3          	beqz	s2,8000185c <main+0xa8>
    ~_thread() { delete[] stack; }
    80001870:	00893503          	ld	a0,8(s2)
    80001874:	fc050ee3          	beqz	a0,80001850 <main+0x9c>
    80001878:	00000097          	auipc	ra,0x0
    8000187c:	590080e7          	jalr	1424(ra) # 80001e08 <_ZdaPv>
    80001880:	fd1ff06f          	j	80001850 <main+0x9c>
    }
    printString("Finished\n");
    80001884:	00004517          	auipc	a0,0x4
    80001888:	80450513          	addi	a0,a0,-2044 # 80005088 <kvmincrease+0x4f8>
    8000188c:	00001097          	auipc	ra,0x1
    80001890:	dcc080e7          	jalr	-564(ra) # 80002658 <_Z11printStringPKc>

    return 0;
}
    80001894:	00000513          	li	a0,0
    80001898:	04813083          	ld	ra,72(sp)
    8000189c:	04013403          	ld	s0,64(sp)
    800018a0:	03813483          	ld	s1,56(sp)
    800018a4:	03013903          	ld	s2,48(sp)
    800018a8:	05010113          	addi	sp,sp,80
    800018ac:	00008067          	ret

00000000800018b0 <_ZN7_thread8setSleepEv>:

_thread *_thread::running = nullptr;

uint64 _thread::timeSliceCounter = 0;

void _thread::setSleep(){
    800018b0:	ff010113          	addi	sp,sp,-16
    800018b4:	00813423          	sd	s0,8(sp)
    800018b8:	01010413          	addi	s0,sp,16
    if(!_thread::sleeping)
    800018bc:	03954783          	lbu	a5,57(a0)
    800018c0:	00079c63          	bnez	a5,800018d8 <_ZN7_thread8setSleepEv+0x28>
        _thread::sleeping = true;
    800018c4:	00100793          	li	a5,1
    800018c8:	02f50ca3          	sb	a5,57(a0)
    else
        _thread::sleeping = false;
}
    800018cc:	00813403          	ld	s0,8(sp)
    800018d0:	01010113          	addi	sp,sp,16
    800018d4:	00008067          	ret
        _thread::sleeping = false;
    800018d8:	02050ca3          	sb	zero,57(a0)
}
    800018dc:	ff1ff06f          	j	800018cc <_ZN7_thread8setSleepEv+0x1c>

00000000800018e0 <_ZN7_thread12createThreadEPFvvE>:

//mickov kod za kreiranje niti
_thread *_thread::createThread(Body body)
{
    800018e0:	fe010113          	addi	sp,sp,-32
    800018e4:	00113c23          	sd	ra,24(sp)
    800018e8:	00813823          	sd	s0,16(sp)
    800018ec:	00913423          	sd	s1,8(sp)
    800018f0:	01213023          	sd	s2,0(sp)
    800018f4:	02010413          	addi	s0,sp,32
    800018f8:	00050913          	mv	s2,a0
    return new _thread(body, TIME_SLICE);
    800018fc:	04800513          	li	a0,72
    80001900:	00000097          	auipc	ra,0x0
    80001904:	490080e7          	jalr	1168(ra) # 80001d90 <_Znwm>
    80001908:	00050493          	mv	s1,a0
            stack(body != nullptr ? new uint64[STACK_SIZE] : nullptr),
            context({(uint64) &threadWrapper,
                     stack != nullptr ? (uint64) &stack[STACK_SIZE] : 0
                    }),
            timeSlice(timeSlice),
            finished(false)
    8000190c:	01253023          	sd	s2,0(a0)
            stack(body != nullptr ? new uint64[STACK_SIZE] : nullptr),
    80001910:	00090a63          	beqz	s2,80001924 <_ZN7_thread12createThreadEPFvvE+0x44>
    80001914:	00002537          	lui	a0,0x2
    80001918:	00000097          	auipc	ra,0x0
    8000191c:	4a0080e7          	jalr	1184(ra) # 80001db8 <_Znam>
    80001920:	0080006f          	j	80001928 <_ZN7_thread12createThreadEPFvvE+0x48>
    80001924:	00000513          	li	a0,0
            finished(false)
    80001928:	00a4b423          	sd	a0,8(s1)
    8000192c:	00000797          	auipc	a5,0x0
    80001930:	1bc78793          	addi	a5,a5,444 # 80001ae8 <_ZN7_thread13threadWrapperEv>
    80001934:	00f4b823          	sd	a5,16(s1)
                     stack != nullptr ? (uint64) &stack[STACK_SIZE] : 0
    80001938:	04050063          	beqz	a0,80001978 <_ZN7_thread12createThreadEPFvvE+0x98>
    8000193c:	000027b7          	lui	a5,0x2
    80001940:	00f507b3          	add	a5,a0,a5
            finished(false)
    80001944:	00f4bc23          	sd	a5,24(s1)
    80001948:	00200793          	li	a5,2
    8000194c:	02f4b023          	sd	a5,32(s1)
    80001950:	02048423          	sb	zero,40(s1)
    80001954:	0204b823          	sd	zero,48(s1)
    80001958:	02048c23          	sb	zero,56(s1)
    8000195c:	02048ca3          	sb	zero,57(s1)
    80001960:	0404b023          	sd	zero,64(s1)
    {
        if (body != nullptr) { Scheduler::put(this); printString("pozvan konstukror");}
    80001964:	04090663          	beqz	s2,800019b0 <_ZN7_thread12createThreadEPFvvE+0xd0>
    80001968:	00048513          	mv	a0,s1
    8000196c:	00001097          	auipc	ra,0x1
    80001970:	c48080e7          	jalr	-952(ra) # 800025b4 <_ZN9Scheduler3putEP7_thread>
    80001974:	00c0006f          	j	80001980 <_ZN7_thread12createThreadEPFvvE+0xa0>
                     stack != nullptr ? (uint64) &stack[STACK_SIZE] : 0
    80001978:	00000793          	li	a5,0
    8000197c:	fc9ff06f          	j	80001944 <_ZN7_thread12createThreadEPFvvE+0x64>
        if (body != nullptr) { Scheduler::put(this); printString("pozvan konstukror");}
    80001980:	00003517          	auipc	a0,0x3
    80001984:	71850513          	addi	a0,a0,1816 # 80005098 <kvmincrease+0x508>
    80001988:	00001097          	auipc	ra,0x1
    8000198c:	cd0080e7          	jalr	-816(ra) # 80002658 <_Z11printStringPKc>
    80001990:	0200006f          	j	800019b0 <_ZN7_thread12createThreadEPFvvE+0xd0>
    80001994:	00050913          	mv	s2,a0
    80001998:	00048513          	mv	a0,s1
    8000199c:	00000097          	auipc	ra,0x0
    800019a0:	444080e7          	jalr	1092(ra) # 80001de0 <_ZdlPv>
    800019a4:	00090513          	mv	a0,s2
    800019a8:	00005097          	auipc	ra,0x5
    800019ac:	3b0080e7          	jalr	944(ra) # 80006d58 <_Unwind_Resume>
}
    800019b0:	00048513          	mv	a0,s1
    800019b4:	01813083          	ld	ra,24(sp)
    800019b8:	01013403          	ld	s0,16(sp)
    800019bc:	00813483          	ld	s1,8(sp)
    800019c0:	00013903          	ld	s2,0(sp)
    800019c4:	02010113          	addi	sp,sp,32
    800019c8:	00008067          	ret

00000000800019cc <_ZN7_thread12createThreadEPPS_PFvvEPvS4_>:
//poziv za projekat
int _thread::createThread(thread_t* handle, Body body, void *args, void *stack)
{
    800019cc:	fc010113          	addi	sp,sp,-64
    800019d0:	02113c23          	sd	ra,56(sp)
    800019d4:	02813823          	sd	s0,48(sp)
    800019d8:	02913423          	sd	s1,40(sp)
    800019dc:	03213023          	sd	s2,32(sp)
    800019e0:	01313c23          	sd	s3,24(sp)
    800019e4:	01413823          	sd	s4,16(sp)
    800019e8:	01513423          	sd	s5,8(sp)
    800019ec:	04010413          	addi	s0,sp,64
    800019f0:	00050a13          	mv	s4,a0
    800019f4:	00058993          	mv	s3,a1
    800019f8:	00060a93          	mv	s5,a2
    800019fc:	00068913          	mv	s2,a3
    *handle = new _thread(body, args, stack);
    80001a00:	04800513          	li	a0,72
    80001a04:	00000097          	auipc	ra,0x0
    80001a08:	38c080e7          	jalr	908(ra) # 80001d90 <_Znwm>
    80001a0c:	00050493          	mv	s1,a0
            context({(uint64) &threadWrapper,
                     stack != nullptr ?  (uint64) &stack[1024] : 0
                    }),
            timeSlice(DEFAULT_TIME_SLICE),
            finished(false),
            args(args)
    80001a10:	01353023          	sd	s3,0(a0)
            stack(body != nullptr ? (uint64*)stackk : nullptr),
    80001a14:	04098a63          	beqz	s3,80001a68 <_ZN7_thread12createThreadEPPS_PFvvEPvS4_+0x9c>
            args(args)
    80001a18:	0124b423          	sd	s2,8(s1)
    80001a1c:	00000797          	auipc	a5,0x0
    80001a20:	0cc78793          	addi	a5,a5,204 # 80001ae8 <_ZN7_thread13threadWrapperEv>
    80001a24:	00f4b823          	sd	a5,16(s1)
                     stack != nullptr ?  (uint64) &stack[1024] : 0
    80001a28:	04090463          	beqz	s2,80001a70 <_ZN7_thread12createThreadEPPS_PFvvEPvS4_+0xa4>
    80001a2c:	000026b7          	lui	a3,0x2
    80001a30:	00d90933          	add	s2,s2,a3
            args(args)
    80001a34:	0124bc23          	sd	s2,24(s1)
    80001a38:	00200793          	li	a5,2
    80001a3c:	02f4b023          	sd	a5,32(s1)
    80001a40:	02048423          	sb	zero,40(s1)
    80001a44:	0354b823          	sd	s5,48(s1)
    80001a48:	02048c23          	sb	zero,56(s1)
    80001a4c:	02048ca3          	sb	zero,57(s1)
    80001a50:	0404b023          	sd	zero,64(s1)
    {
        if (body != nullptr) {
    80001a54:	02098263          	beqz	s3,80001a78 <_ZN7_thread12createThreadEPPS_PFvvEPvS4_+0xac>
            Scheduler::put(this);
    80001a58:	00048513          	mv	a0,s1
    80001a5c:	00001097          	auipc	ra,0x1
    80001a60:	b58080e7          	jalr	-1192(ra) # 800025b4 <_ZN9Scheduler3putEP7_thread>
    80001a64:	0140006f          	j	80001a78 <_ZN7_thread12createThreadEPPS_PFvvEPvS4_+0xac>
            stack(body != nullptr ? (uint64*)stackk : nullptr),
    80001a68:	00000913          	li	s2,0
    80001a6c:	fadff06f          	j	80001a18 <_ZN7_thread12createThreadEPPS_PFvvEPvS4_+0x4c>
                     stack != nullptr ?  (uint64) &stack[1024] : 0
    80001a70:	00000913          	li	s2,0
    80001a74:	fc1ff06f          	j	80001a34 <_ZN7_thread12createThreadEPPS_PFvvEPvS4_+0x68>
    80001a78:	009a3023          	sd	s1,0(s4)
    if(*handle != nullptr)
    80001a7c:	02048663          	beqz	s1,80001aa8 <_ZN7_thread12createThreadEPPS_PFvvEPvS4_+0xdc>
        return 0;
    80001a80:	00000513          	li	a0,0
    else
        return -2;
}
    80001a84:	03813083          	ld	ra,56(sp)
    80001a88:	03013403          	ld	s0,48(sp)
    80001a8c:	02813483          	ld	s1,40(sp)
    80001a90:	02013903          	ld	s2,32(sp)
    80001a94:	01813983          	ld	s3,24(sp)
    80001a98:	01013a03          	ld	s4,16(sp)
    80001a9c:	00813a83          	ld	s5,8(sp)
    80001aa0:	04010113          	addi	sp,sp,64
    80001aa4:	00008067          	ret
        return -2;
    80001aa8:	ffe00513          	li	a0,-2
    80001aac:	fd9ff06f          	j	80001a84 <_ZN7_thread12createThreadEPPS_PFvvEPvS4_+0xb8>
    80001ab0:	00050913          	mv	s2,a0
    *handle = new _thread(body, args, stack);
    80001ab4:	00048513          	mv	a0,s1
    80001ab8:	00000097          	auipc	ra,0x0
    80001abc:	328080e7          	jalr	808(ra) # 80001de0 <_ZdlPv>
    80001ac0:	00090513          	mv	a0,s2
    80001ac4:	00005097          	auipc	ra,0x5
    80001ac8:	294080e7          	jalr	660(ra) # 80006d58 <_Unwind_Resume>

0000000080001acc <_ZN7_thread5yieldEv>:

void _thread::yield()
{
    80001acc:	ff010113          	addi	sp,sp,-16
    80001ad0:	00813423          	sd	s0,8(sp)
    80001ad4:	01010413          	addi	s0,sp,16
    __asm__ volatile ("ecall");
    80001ad8:	00000073          	ecall
}
    80001adc:	00813403          	ld	s0,8(sp)
    80001ae0:	01010113          	addi	sp,sp,16
    80001ae4:	00008067          	ret

0000000080001ae8 <_ZN7_thread13threadWrapperEv>:

    _thread::contextSwitch(&old->context, &running->context);
}

void _thread::threadWrapper()
{
    80001ae8:	fe010113          	addi	sp,sp,-32
    80001aec:	00113c23          	sd	ra,24(sp)
    80001af0:	00813823          	sd	s0,16(sp)
    80001af4:	00913423          	sd	s1,8(sp)
    80001af8:	02010413          	addi	s0,sp,32
    Riscv::popSppSpie();
    80001afc:	00000097          	auipc	ra,0x0
    80001b00:	374080e7          	jalr	884(ra) # 80001e70 <_ZN5Riscv10popSppSpieEv>
    running->body();
    80001b04:	00004497          	auipc	s1,0x4
    80001b08:	15c48493          	addi	s1,s1,348 # 80005c60 <_ZN7_thread7runningE>
    80001b0c:	0004b783          	ld	a5,0(s1)
    80001b10:	0007b783          	ld	a5,0(a5)
    80001b14:	000780e7          	jalr	a5
    running->setFinished(true);
    80001b18:	0004b783          	ld	a5,0(s1)
    void setFinished(bool value) { finished = value; }
    80001b1c:	00100713          	li	a4,1
    80001b20:	02e78423          	sb	a4,40(a5)
    printString("gotova nit");
    80001b24:	00003517          	auipc	a0,0x3
    80001b28:	58c50513          	addi	a0,a0,1420 # 800050b0 <kvmincrease+0x520>
    80001b2c:	00001097          	auipc	ra,0x1
    80001b30:	b2c080e7          	jalr	-1236(ra) # 80002658 <_Z11printStringPKc>
    _thread::yield();
    80001b34:	00000097          	auipc	ra,0x0
    80001b38:	f98080e7          	jalr	-104(ra) # 80001acc <_ZN7_thread5yieldEv>
}
    80001b3c:	01813083          	ld	ra,24(sp)
    80001b40:	01013403          	ld	s0,16(sp)
    80001b44:	00813483          	ld	s1,8(sp)
    80001b48:	02010113          	addi	sp,sp,32
    80001b4c:	00008067          	ret

0000000080001b50 <_ZN7_thread8dispatchEv>:
{
    80001b50:	fe010113          	addi	sp,sp,-32
    80001b54:	00113c23          	sd	ra,24(sp)
    80001b58:	00813823          	sd	s0,16(sp)
    80001b5c:	00913423          	sd	s1,8(sp)
    80001b60:	01213023          	sd	s2,0(sp)
    80001b64:	02010413          	addi	s0,sp,32
    _thread *old = running;
    80001b68:	00004497          	auipc	s1,0x4
    80001b6c:	0f84b483          	ld	s1,248(s1) # 80005c60 <_ZN7_thread7runningE>
    bool isFinished() const { return finished; }
    80001b70:	0284c783          	lbu	a5,40(s1)
    if (!old->isFinished() && !old->blocked && !old->sleeping) {
    80001b74:	00079a63          	bnez	a5,80001b88 <_ZN7_thread8dispatchEv+0x38>
    80001b78:	0384c703          	lbu	a4,56(s1)
    80001b7c:	00071663          	bnez	a4,80001b88 <_ZN7_thread8dispatchEv+0x38>
    80001b80:	0394c703          	lbu	a4,57(s1)
    80001b84:	04070c63          	beqz	a4,80001bdc <_ZN7_thread8dispatchEv+0x8c>
    else if(!old->isFinished() && old->blocked && !old->sleeping){
    80001b88:	06079063          	bnez	a5,80001be8 <_ZN7_thread8dispatchEv+0x98>
    80001b8c:	0384c783          	lbu	a5,56(s1)
    80001b90:	04078c63          	beqz	a5,80001be8 <_ZN7_thread8dispatchEv+0x98>
    80001b94:	0394c783          	lbu	a5,57(s1)
    80001b98:	04079863          	bnez	a5,80001be8 <_ZN7_thread8dispatchEv+0x98>
        if(old->blockedBy != nullptr){
    80001b9c:	0404b503          	ld	a0,64(s1)
    80001ba0:	04050463          	beqz	a0,80001be8 <_ZN7_thread8dispatchEv+0x98>
            old->blockedBy->blockedList().addLast(old);
    80001ba4:	00001097          	auipc	ra,0x1
    80001ba8:	94c080e7          	jalr	-1716(ra) # 800024f0 <_ZN4_sem11blockedListEv>
    80001bac:	00050913          	mv	s2,a0
        if (!tail) { tail = head; }
    }

    void addLast(T *data)
    {
        Elem *elem = new Elem(data, 0);
    80001bb0:	01800513          	li	a0,24
    80001bb4:	00000097          	auipc	ra,0x0
    80001bb8:	1dc080e7          	jalr	476(ra) # 80001d90 <_Znwm>
        Elem(T *data, Elem *next, int sleepTime = 0) : data(data), next(next), sleepTime(sleepTime) {}
    80001bbc:	00953023          	sd	s1,0(a0)
    80001bc0:	00053423          	sd	zero,8(a0)
    80001bc4:	00052823          	sw	zero,16(a0)
        if (tail)
    80001bc8:	00893783          	ld	a5,8(s2)
    80001bcc:	04078a63          	beqz	a5,80001c20 <_ZN7_thread8dispatchEv+0xd0>
        {
            tail->next = elem;
    80001bd0:	00a7b423          	sd	a0,8(a5)
            tail = elem;
    80001bd4:	00a93423          	sd	a0,8(s2)
    80001bd8:	0100006f          	j	80001be8 <_ZN7_thread8dispatchEv+0x98>
        Scheduler::put(old);
    80001bdc:	00048513          	mv	a0,s1
    80001be0:	00001097          	auipc	ra,0x1
    80001be4:	9d4080e7          	jalr	-1580(ra) # 800025b4 <_ZN9Scheduler3putEP7_thread>
    running = Scheduler::get();
    80001be8:	00001097          	auipc	ra,0x1
    80001bec:	964080e7          	jalr	-1692(ra) # 8000254c <_ZN9Scheduler3getEv>
    80001bf0:	00004797          	auipc	a5,0x4
    80001bf4:	06a7b823          	sd	a0,112(a5) # 80005c60 <_ZN7_thread7runningE>
    _thread::contextSwitch(&old->context, &running->context);
    80001bf8:	01050593          	addi	a1,a0,16
    80001bfc:	01048513          	addi	a0,s1,16
    80001c00:	fffff097          	auipc	ra,0xfffff
    80001c04:	530080e7          	jalr	1328(ra) # 80001130 <_ZN7_thread13contextSwitchEPNS_7ContextES1_>
}
    80001c08:	01813083          	ld	ra,24(sp)
    80001c0c:	01013403          	ld	s0,16(sp)
    80001c10:	00813483          	ld	s1,8(sp)
    80001c14:	00013903          	ld	s2,0(sp)
    80001c18:	02010113          	addi	sp,sp,32
    80001c1c:	00008067          	ret
        } else
        {
            head = tail = elem;
    80001c20:	00a93423          	sd	a0,8(s2)
    80001c24:	00a93023          	sd	a0,0(s2)
        }
    }
    80001c28:	fc1ff06f          	j	80001be8 <_ZN7_thread8dispatchEv+0x98>

0000000080001c2c <_ZN7_thread10threadStopEv>:

int _thread::threadStop(){
    80001c2c:	ff010113          	addi	sp,sp,-16
    80001c30:	00813423          	sd	s0,8(sp)
    80001c34:	01010413          	addi	s0,sp,16
    void setFinished(bool value) { finished = value; }
    80001c38:	00004797          	auipc	a5,0x4
    80001c3c:	0287b783          	ld	a5,40(a5) # 80005c60 <_ZN7_thread7runningE>
    80001c40:	00100713          	li	a4,1
    80001c44:	02e78423          	sb	a4,40(a5)
//    }

//    delete []running->stack;
//    nzm da se brise nit ili se samo zaustavlja
return 0;
}
    80001c48:	00000513          	li	a0,0
    80001c4c:	00813403          	ld	s0,8(sp)
    80001c50:	01010113          	addi	sp,sp,16
    80001c54:	00008067          	ret

0000000080001c58 <_ZN7_thread5dblckEv>:

void _thread::dblck(){
    80001c58:	ff010113          	addi	sp,sp,-16
    80001c5c:	00813423          	sd	s0,8(sp)
    80001c60:	01010413          	addi	s0,sp,16
    _thread::blocked = false;
    80001c64:	02050c23          	sb	zero,56(a0)
    _thread::blockedBy = nullptr;
    80001c68:	04053023          	sd	zero,64(a0)
}
    80001c6c:	00813403          	ld	s0,8(sp)
    80001c70:	01010113          	addi	sp,sp,16
    80001c74:	00008067          	ret

0000000080001c78 <_ZN7_thread5sleepEm>:


int _thread::sleep(time_t time) {
    80001c78:	fe010113          	addi	sp,sp,-32
    80001c7c:	00113c23          	sd	ra,24(sp)
    80001c80:	00813823          	sd	s0,16(sp)
    80001c84:	00913423          	sd	s1,8(sp)
    80001c88:	01213023          	sd	s2,0(sp)
    80001c8c:	02010413          	addi	s0,sp,32
    80001c90:	00050493          	mv	s1,a0
    running->setSleep();
    80001c94:	00004917          	auipc	s2,0x4
    80001c98:	fcc90913          	addi	s2,s2,-52 # 80005c60 <_ZN7_thread7runningE>
    80001c9c:	00093503          	ld	a0,0(s2)
    80001ca0:	00000097          	auipc	ra,0x0
    80001ca4:	c10080e7          	jalr	-1008(ra) # 800018b0 <_ZN7_thread8setSleepEv>
    Riscv::sleepingThreads.addSleepingThread(running, time);
    80001ca8:	00093903          	ld	s2,0(s2)
    80001cac:	0004849b          	sext.w	s1,s1
        if (!tail) { return 0; }
        return tail->data;
    }

    void addSleepingThread(T *data, int time){
        Elem *elem = new Elem(data);
    80001cb0:	01800513          	li	a0,24
    80001cb4:	00000097          	auipc	ra,0x0
    80001cb8:	0dc080e7          	jalr	220(ra) # 80001d90 <_Znwm>
        Elem(T *data) : data(data), next(nullptr), sleepTime(0) {}
    80001cbc:	01253023          	sd	s2,0(a0)
    80001cc0:	00053423          	sd	zero,8(a0)
    80001cc4:	00052823          	sw	zero,16(a0)
        if(!head){
    80001cc8:	00004797          	auipc	a5,0x4
    80001ccc:	f387b783          	ld	a5,-200(a5) # 80005c00 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001cd0:	0007b783          	ld	a5,0(a5)
    80001cd4:	00078863          	beqz	a5,80001ce4 <_ZN7_thread5sleepEm+0x6c>
            elem->sleepTime = time;
            tail = head;
            return;
        }
        int timeCount = 0;
        Elem *next = head, *prev = nullptr;
    80001cd8:	00000693          	li	a3,0
        int timeCount = 0;
    80001cdc:	00000713          	li	a4,0
    80001ce0:	0200006f          	j	80001d00 <_ZN7_thread5sleepEm+0x88>
            head = elem;
    80001ce4:	00004797          	auipc	a5,0x4
    80001ce8:	f1c7b783          	ld	a5,-228(a5) # 80005c00 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001cec:	00a7b023          	sd	a0,0(a5)
            elem->sleepTime = time;
    80001cf0:	00952823          	sw	s1,16(a0)
            tail = head;
    80001cf4:	00a7b423          	sd	a0,8(a5)
            return;
    80001cf8:	0500006f          	j	80001d48 <_ZN7_thread5sleepEm+0xd0>

        while(time >= timeCount + next->sleepTime){
             timeCount += next->sleepTime;
             prev= next;
             next = next->next;
    80001cfc:	00060793          	mv	a5,a2
        while(time >= timeCount + next->sleepTime){
    80001d00:	0107a603          	lw	a2,16(a5)
    80001d04:	00070593          	mv	a1,a4
    80001d08:	00e6073b          	addw	a4,a2,a4
    80001d0c:	00e4cc63          	blt	s1,a4,80001d24 <_ZN7_thread5sleepEm+0xac>
             next = next->next;
    80001d10:	0087b603          	ld	a2,8(a5)
             prev= next;
    80001d14:	00078693          	mv	a3,a5
             if(next == nullptr)
    80001d18:	fe0612e3          	bnez	a2,80001cfc <_ZN7_thread5sleepEm+0x84>
             next = next->next;
    80001d1c:	00060793          	mv	a5,a2
             timeCount += next->sleepTime;
    80001d20:	00070593          	mv	a1,a4
                 break;
        }
        if(!prev){
    80001d24:	04068463          	beqz	a3,80001d6c <_ZN7_thread5sleepEm+0xf4>
            head = elem;
            head->next = next;
            head->next->sleepTime -=  head->sleepTime;
        }
        else {
            prev->next = elem;
    80001d28:	00a6b423          	sd	a0,8(a3) # 2008 <_entry-0x7fffdff8>
            elem->next = next;
    80001d2c:	00f53423          	sd	a5,8(a0)
            int diff = time - timeCount;
    80001d30:	40b484bb          	subw	s1,s1,a1
            elem->sleepTime = diff;
    80001d34:	00952823          	sw	s1,16(a0)
            if(next != nullptr)
    80001d38:	00078863          	beqz	a5,80001d48 <_ZN7_thread5sleepEm+0xd0>
                next->sleepTime -= diff;
    80001d3c:	0107a703          	lw	a4,16(a5)
    80001d40:	409704bb          	subw	s1,a4,s1
    80001d44:	0097a823          	sw	s1,16(a5)
    dispatch();
    80001d48:	00000097          	auipc	ra,0x0
    80001d4c:	e08080e7          	jalr	-504(ra) # 80001b50 <_ZN7_thread8dispatchEv>
    return 0; //TODO povratna vrednost!!!
}
    80001d50:	00000513          	li	a0,0
    80001d54:	01813083          	ld	ra,24(sp)
    80001d58:	01013403          	ld	s0,16(sp)
    80001d5c:	00813483          	ld	s1,8(sp)
    80001d60:	00013903          	ld	s2,0(sp)
    80001d64:	02010113          	addi	sp,sp,32
    80001d68:	00008067          	ret
            head = elem;
    80001d6c:	00004717          	auipc	a4,0x4
    80001d70:	e9473703          	ld	a4,-364(a4) # 80005c00 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001d74:	00a73023          	sd	a0,0(a4)
            head->next = next;
    80001d78:	00f53423          	sd	a5,8(a0)
            head->next->sleepTime -=  head->sleepTime;
    80001d7c:	01052683          	lw	a3,16(a0)
    80001d80:	0107a703          	lw	a4,16(a5)
    80001d84:	40d7073b          	subw	a4,a4,a3
    80001d88:	00e7a823          	sw	a4,16(a5)
    80001d8c:	fbdff06f          	j	80001d48 <_ZN7_thread5sleepEm+0xd0>

0000000080001d90 <_Znwm>:
#include "../h/print.hpp"

using size_t = decltype(sizeof(0));

void *operator new(size_t n)
{
    80001d90:	ff010113          	addi	sp,sp,-16
    80001d94:	00113423          	sd	ra,8(sp)
    80001d98:	00813023          	sd	s0,0(sp)
    80001d9c:	01010413          	addi	s0,sp,16
//    printString("new operator");
    return __mem_alloc(n);
    80001da0:	00003097          	auipc	ra,0x3
    80001da4:	b78080e7          	jalr	-1160(ra) # 80004918 <__mem_alloc>
}
    80001da8:	00813083          	ld	ra,8(sp)
    80001dac:	00013403          	ld	s0,0(sp)
    80001db0:	01010113          	addi	sp,sp,16
    80001db4:	00008067          	ret

0000000080001db8 <_Znam>:

void *operator new[](size_t n)
{
    80001db8:	ff010113          	addi	sp,sp,-16
    80001dbc:	00113423          	sd	ra,8(sp)
    80001dc0:	00813023          	sd	s0,0(sp)
    80001dc4:	01010413          	addi	s0,sp,16
    return __mem_alloc(n);
    80001dc8:	00003097          	auipc	ra,0x3
    80001dcc:	b50080e7          	jalr	-1200(ra) # 80004918 <__mem_alloc>
}
    80001dd0:	00813083          	ld	ra,8(sp)
    80001dd4:	00013403          	ld	s0,0(sp)
    80001dd8:	01010113          	addi	sp,sp,16
    80001ddc:	00008067          	ret

0000000080001de0 <_ZdlPv>:

void operator delete(void *p) noexcept
{
    80001de0:	ff010113          	addi	sp,sp,-16
    80001de4:	00113423          	sd	ra,8(sp)
    80001de8:	00813023          	sd	s0,0(sp)
    80001dec:	01010413          	addi	s0,sp,16
    __mem_free(p);
    80001df0:	00003097          	auipc	ra,0x3
    80001df4:	a5c080e7          	jalr	-1444(ra) # 8000484c <__mem_free>
}
    80001df8:	00813083          	ld	ra,8(sp)
    80001dfc:	00013403          	ld	s0,0(sp)
    80001e00:	01010113          	addi	sp,sp,16
    80001e04:	00008067          	ret

0000000080001e08 <_ZdaPv>:

void operator delete[](void *p) noexcept
{
    80001e08:	ff010113          	addi	sp,sp,-16
    80001e0c:	00113423          	sd	ra,8(sp)
    80001e10:	00813023          	sd	s0,0(sp)
    80001e14:	01010413          	addi	s0,sp,16
    __mem_free(p);
    80001e18:	00003097          	auipc	ra,0x3
    80001e1c:	a34080e7          	jalr	-1484(ra) # 8000484c <__mem_free>
    80001e20:	00813083          	ld	ra,8(sp)
    80001e24:	00013403          	ld	s0,0(sp)
    80001e28:	01010113          	addi	sp,sp,16
    80001e2c:	00008067          	ret

0000000080001e30 <_Z41__static_initialization_and_destruction_0ii>:
    }
    else
    {
        // unexpected trap cause
    }
    80001e30:	ff010113          	addi	sp,sp,-16
    80001e34:	00813423          	sd	s0,8(sp)
    80001e38:	01010413          	addi	s0,sp,16
    80001e3c:	00100793          	li	a5,1
    80001e40:	00f50863          	beq	a0,a5,80001e50 <_Z41__static_initialization_and_destruction_0ii+0x20>
    80001e44:	00813403          	ld	s0,8(sp)
    80001e48:	01010113          	addi	sp,sp,16
    80001e4c:	00008067          	ret
    80001e50:	000107b7          	lui	a5,0x10
    80001e54:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80001e58:	fef596e3          	bne	a1,a5,80001e44 <_Z41__static_initialization_and_destruction_0ii+0x14>
    };

    Elem *head, *tail;

public:
    List() : head(0), tail(0) {}
    80001e5c:	00004797          	auipc	a5,0x4
    80001e60:	e1478793          	addi	a5,a5,-492 # 80005c70 <_ZN5Riscv15sleepingThreadsE>
    80001e64:	0007b023          	sd	zero,0(a5)
    80001e68:	0007b423          	sd	zero,8(a5)
    80001e6c:	fd9ff06f          	j	80001e44 <_Z41__static_initialization_and_destruction_0ii+0x14>

0000000080001e70 <_ZN5Riscv10popSppSpieEv>:
{
    80001e70:	ff010113          	addi	sp,sp,-16
    80001e74:	00813423          	sd	s0,8(sp)
    80001e78:	01010413          	addi	s0,sp,16
    __asm__ volatile("csrw sepc, ra");
    80001e7c:	14109073          	csrw	sepc,ra
    __asm__ volatile("sret");
    80001e80:	10200073          	sret
}
    80001e84:	00813403          	ld	s0,8(sp)
    80001e88:	01010113          	addi	sp,sp,16
    80001e8c:	00008067          	ret

0000000080001e90 <_ZN5Riscv20handleSupervisorTrapEv>:
{
    80001e90:	f8010113          	addi	sp,sp,-128
    80001e94:	06113c23          	sd	ra,120(sp)
    80001e98:	06813823          	sd	s0,112(sp)
    80001e9c:	06913423          	sd	s1,104(sp)
    80001ea0:	07213023          	sd	s2,96(sp)
    80001ea4:	05313c23          	sd	s3,88(sp)
    80001ea8:	05413823          	sd	s4,80(sp)
    80001eac:	08010413          	addi	s0,sp,128
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r"(scause));
    80001eb0:	142027f3          	csrr	a5,scause
    80001eb4:	faf43423          	sd	a5,-88(s0)
    return scause;
    80001eb8:	fa843703          	ld	a4,-88(s0)
    if (scause == 0x0000000000000008UL || scause == 0x0000000000000009UL)
    80001ebc:	ff870693          	addi	a3,a4,-8
    80001ec0:	00100793          	li	a5,1
    80001ec4:	02d7f863          	bgeu	a5,a3,80001ef4 <_ZN5Riscv20handleSupervisorTrapEv+0x64>
    else if (scause == 0x8000000000000001UL)
    80001ec8:	fff00793          	li	a5,-1
    80001ecc:	03f79793          	slli	a5,a5,0x3f
    80001ed0:	00178793          	addi	a5,a5,1
    80001ed4:	1ef70c63          	beq	a4,a5,800020cc <_ZN5Riscv20handleSupervisorTrapEv+0x23c>
    else if (scause == 0x8000000000000009UL)
    80001ed8:	fff00793          	li	a5,-1
    80001edc:	03f79793          	slli	a5,a5,0x3f
    80001ee0:	00978793          	addi	a5,a5,9
    80001ee4:	0cf71a63          	bne	a4,a5,80001fb8 <_ZN5Riscv20handleSupervisorTrapEv+0x128>
        console_handler();
    80001ee8:	00003097          	auipc	ra,0x3
    80001eec:	bfc080e7          	jalr	-1028(ra) # 80004ae4 <console_handler>
    80001ef0:	0c80006f          	j	80001fb8 <_ZN5Riscv20handleSupervisorTrapEv+0x128>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80001ef4:	141027f3          	csrr	a5,sepc
    80001ef8:	faf43c23          	sd	a5,-72(s0)
    return sepc;
    80001efc:	fb843783          	ld	a5,-72(s0)
        uint64 volatile sepc = r_sepc() + 4;
    80001f00:	00478793          	addi	a5,a5,4
    80001f04:	f8f43423          	sd	a5,-120(s0)
}

inline uint64 Riscv::r_sstatus()
{
    uint64 volatile sstatus;
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80001f08:	100027f3          	csrr	a5,sstatus
    80001f0c:	faf43823          	sd	a5,-80(s0)
    return sstatus;
    80001f10:	fb043783          	ld	a5,-80(s0)
        uint64 volatile sstatus = r_sstatus();
    80001f14:	f8f43823          	sd	a5,-112(s0)
        __asm__ volatile("mv %0, a0" : "=r" (code));
    80001f18:	00050793          	mv	a5,a0
        if(code == 0x1) {
    80001f1c:	00100713          	li	a4,1
    80001f20:	06e78a63          	beq	a5,a4,80001f94 <_ZN5Riscv20handleSupervisorTrapEv+0x104>
        }else if(code == 0x02) {
    80001f24:	00200713          	li	a4,2
    80001f28:	0ae78863          	beq	a5,a4,80001fd8 <_ZN5Riscv20handleSupervisorTrapEv+0x148>
        }else if(code == 0x11){
    80001f2c:	01100713          	li	a4,17
    80001f30:	0ae78e63          	beq	a5,a4,80001fec <_ZN5Riscv20handleSupervisorTrapEv+0x15c>
        }else if(code == 0x12){
    80001f34:	01200713          	li	a4,18
    80001f38:	0ee78c63          	beq	a5,a4,80002030 <_ZN5Riscv20handleSupervisorTrapEv+0x1a0>
        }else if(code == 0x13){
    80001f3c:	01300713          	li	a4,19
    80001f40:	06e78463          	beq	a5,a4,80001fa8 <_ZN5Riscv20handleSupervisorTrapEv+0x118>
        }else if(code == 0x21){
    80001f44:	02100713          	li	a4,33
    80001f48:	10e78263          	beq	a5,a4,8000204c <_ZN5Riscv20handleSupervisorTrapEv+0x1bc>
        }else if(code == 0x22){
    80001f4c:	02200713          	li	a4,34
    80001f50:	10e78a63          	beq	a5,a4,80002064 <_ZN5Riscv20handleSupervisorTrapEv+0x1d4>
        }else if(code == 0x23){
    80001f54:	02300713          	li	a4,35
    80001f58:	12e78c63          	beq	a5,a4,80002090 <_ZN5Riscv20handleSupervisorTrapEv+0x200>
        }else if(code == 0x24){
    80001f5c:	02400713          	li	a4,36
    80001f60:	14e78263          	beq	a5,a4,800020a4 <_ZN5Riscv20handleSupervisorTrapEv+0x214>
        }else if(code == 0x31){
    80001f64:	03100713          	li	a4,49
    80001f68:	14e78863          	beq	a5,a4,800020b8 <_ZN5Riscv20handleSupervisorTrapEv+0x228>
        }else if(code == 0x41){
    80001f6c:	04100713          	li	a4,65
    80001f70:	02e78c63          	beq	a5,a4,80001fa8 <_ZN5Riscv20handleSupervisorTrapEv+0x118>
        }else if(code == 0x42){
    80001f74:	04200713          	li	a4,66
    80001f78:	02e78863          	beq	a5,a4,80001fa8 <_ZN5Riscv20handleSupervisorTrapEv+0x118>
            _thread::timeSliceCounter = 0;
    80001f7c:	00004797          	auipc	a5,0x4
    80001f80:	c8c7b783          	ld	a5,-884(a5) # 80005c08 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001f84:	0007b023          	sd	zero,0(a5)
            _thread::dispatch();
    80001f88:	00000097          	auipc	ra,0x0
    80001f8c:	bc8080e7          	jalr	-1080(ra) # 80001b50 <_ZN7_thread8dispatchEv>
    80001f90:	0180006f          	j	80001fa8 <_ZN5Riscv20handleSupervisorTrapEv+0x118>
            __asm__ volatile("mv %0, a1" : "=r" (x));
    80001f94:	00058513          	mv	a0,a1
            void* r = __mem_alloc(x);
    80001f98:	00651513          	slli	a0,a0,0x6
    80001f9c:	00003097          	auipc	ra,0x3
    80001fa0:	97c080e7          	jalr	-1668(ra) # 80004918 <__mem_alloc>
            __asm__ volatile("mv a0, %0" : : "r" (r));
    80001fa4:	00050513          	mv	a0,a0
        w_sstatus(sstatus);
    80001fa8:	f9043783          	ld	a5,-112(s0)
}

inline void Riscv::w_sstatus(uint64 sstatus)
{
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80001fac:	10079073          	csrw	sstatus,a5
        w_sepc(sepc);
    80001fb0:	f8843783          	ld	a5,-120(s0)
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80001fb4:	14179073          	csrw	sepc,a5
    80001fb8:	07813083          	ld	ra,120(sp)
    80001fbc:	07013403          	ld	s0,112(sp)
    80001fc0:	06813483          	ld	s1,104(sp)
    80001fc4:	06013903          	ld	s2,96(sp)
    80001fc8:	05813983          	ld	s3,88(sp)
    80001fcc:	05013a03          	ld	s4,80(sp)
    80001fd0:	08010113          	addi	sp,sp,128
    80001fd4:	00008067          	ret
            __asm__ volatile("mv %0, a1" : "=r" (x));
    80001fd8:	00058513          	mv	a0,a1
            ret = __mem_free((void*)x);
    80001fdc:	00003097          	auipc	ra,0x3
    80001fe0:	870080e7          	jalr	-1936(ra) # 8000484c <__mem_free>
            __asm__ volatile("mv a0, %0" : : "r" (ret));
    80001fe4:	00050513          	mv	a0,a0
    80001fe8:	fc1ff06f          	j	80001fa8 <_ZN5Riscv20handleSupervisorTrapEv+0x118>
            __asm__ volatile("mv %0, a1" : "=r" (handle));
    80001fec:	00058913          	mv	s2,a1
            __asm__ volatile("mv %0, a2" : "=r" (body));
    80001ff0:	00060993          	mv	s3,a2
            __asm__ volatile("ld t2, 104(fp)");
    80001ff4:	06843383          	ld	t2,104(s0)
            __asm__ volatile("ld t3, 112(fp)");
    80001ff8:	07043e03          	ld	t3,112(s0)
            __asm__ volatile("mv %0, t2" : "=r" (args));
    80001ffc:	00038a13          	mv	s4,t2
            __asm__ volatile("mv %0, t3" : "=r" (stack));
    80002000:	000e0493          	mv	s1,t3
            printInteger((uint64)stack);
    80002004:	00048513          	mv	a0,s1
    80002008:	00000097          	auipc	ra,0x0
    8000200c:	6c0080e7          	jalr	1728(ra) # 800026c8 <_Z12printIntegerm>
            int ret = _thread::createThread(handle, body, args, stack);
    80002010:	00048693          	mv	a3,s1
    80002014:	000a0613          	mv	a2,s4
    80002018:	00098593          	mv	a1,s3
    8000201c:	00090513          	mv	a0,s2
    80002020:	00000097          	auipc	ra,0x0
    80002024:	9ac080e7          	jalr	-1620(ra) # 800019cc <_ZN7_thread12createThreadEPPS_PFvvEPvS4_>
            __asm__ volatile("mv a0, %0" : : "r" (ret));
    80002028:	00050513          	mv	a0,a0
    8000202c:	f7dff06f          	j	80001fa8 <_ZN5Riscv20handleSupervisorTrapEv+0x118>
            int ret = _thread::threadStop();
    80002030:	00000097          	auipc	ra,0x0
    80002034:	bfc080e7          	jalr	-1028(ra) # 80001c2c <_ZN7_thread10threadStopEv>
            if(ret != 0)
    80002038:	00050663          	beqz	a0,80002044 <_ZN5Riscv20handleSupervisorTrapEv+0x1b4>
                __asm__ volatile("mv a0, %0" : : "r" (ret));
    8000203c:	00050513          	mv	a0,a0
    80002040:	f69ff06f          	j	80001fa8 <_ZN5Riscv20handleSupervisorTrapEv+0x118>
                __asm__ volatile("mv a0, zero");
    80002044:	00000513          	li	a0,0
    80002048:	f61ff06f          	j	80001fa8 <_ZN5Riscv20handleSupervisorTrapEv+0x118>
            __asm__ volatile("mv %0, a1" : "=r" (handle));
    8000204c:	00058513          	mv	a0,a1
            __asm__ volatile("mv %0, a2" : "=r" (init));
    80002050:	00060593          	mv	a1,a2
            int ret = _sem::createSem(handle, init);
    80002054:	00000097          	auipc	ra,0x0
    80002058:	1c4080e7          	jalr	452(ra) # 80002218 <_ZN4_sem9createSemEPPS_m>
            __asm__ volatile("mv a0, %0" : : "r" (ret));
    8000205c:	00050513          	mv	a0,a0
    80002060:	f49ff06f          	j	80001fa8 <_ZN5Riscv20handleSupervisorTrapEv+0x118>
            __asm__ volatile("mv %0, a1" : "=r" (handle));
    80002064:	00058493          	mv	s1,a1
            delete handle; //TODO ??????????????????????????????????????
    80002068:	00048e63          	beqz	s1,80002084 <_ZN5Riscv20handleSupervisorTrapEv+0x1f4>
    8000206c:	00048513          	mv	a0,s1
    80002070:	00000097          	auipc	ra,0x0
    80002074:	20c080e7          	jalr	524(ra) # 8000227c <_ZN4_semD1Ev>
    80002078:	00048513          	mv	a0,s1
    8000207c:	00000097          	auipc	ra,0x0
    80002080:	d64080e7          	jalr	-668(ra) # 80001de0 <_ZdlPv>
            __asm__ volatile("mv a0, %0" : : "r" (ret));
    80002084:	00000793          	li	a5,0
    80002088:	00078513          	mv	a0,a5
    8000208c:	f1dff06f          	j	80001fa8 <_ZN5Riscv20handleSupervisorTrapEv+0x118>
            __asm__ volatile("mv %0, a1" : "=r" (handle));
    80002090:	00058513          	mv	a0,a1
            int ret = handle->wait(); //TODO ?????????;
    80002094:	00000097          	auipc	ra,0x0
    80002098:	398080e7          	jalr	920(ra) # 8000242c <_ZN4_sem4waitEv>
            __asm__ volatile("mv a0, %0" : : "r" (ret));
    8000209c:	00050513          	mv	a0,a0
    800020a0:	f09ff06f          	j	80001fa8 <_ZN5Riscv20handleSupervisorTrapEv+0x118>
            __asm__ volatile("mv %0, a1" : "=r" (id));
    800020a4:	00058513          	mv	a0,a1
            int ret = id->signal();
    800020a8:	00000097          	auipc	ra,0x0
    800020ac:	3e8080e7          	jalr	1000(ra) # 80002490 <_ZN4_sem6signalEv>
            __asm__ volatile("mv a0, %0" : : "r" (ret));
    800020b0:	00050513          	mv	a0,a0
    800020b4:	ef5ff06f          	j	80001fa8 <_ZN5Riscv20handleSupervisorTrapEv+0x118>
            __asm__ volatile("mv %0, a1" : "=r" (time));
    800020b8:	00058513          	mv	a0,a1
            int ret = _thread::sleep(time);
    800020bc:	00000097          	auipc	ra,0x0
    800020c0:	bbc080e7          	jalr	-1092(ra) # 80001c78 <_ZN7_thread5sleepEm>
            __asm__ volatile("mv a0, %0" : : "r" (ret));
    800020c4:	00050513          	mv	a0,a0
    800020c8:	ee1ff06f          	j	80001fa8 <_ZN5Riscv20handleSupervisorTrapEv+0x118>
//            Scheduler::put(t);
        }
    }

    void sleepControl(){
        if(head != nullptr && --head->sleepTime == 0) //dekrementira vreme i radi proveru
    800020cc:	00004717          	auipc	a4,0x4
    800020d0:	ba473703          	ld	a4,-1116(a4) # 80005c70 <_ZN5Riscv15sleepingThreadsE>
    800020d4:	00070c63          	beqz	a4,800020ec <_ZN5Riscv20handleSupervisorTrapEv+0x25c>
    800020d8:	01072783          	lw	a5,16(a4)
    800020dc:	fff7879b          	addiw	a5,a5,-1
    800020e0:	0007869b          	sext.w	a3,a5
    800020e4:	00f72823          	sw	a5,16(a4)
    800020e8:	06068e63          	beqz	a3,80002164 <_ZN5Riscv20handleSupervisorTrapEv+0x2d4>
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"(mask));
    800020ec:	00200793          	li	a5,2
    800020f0:	1447b073          	csrc	sip,a5
        _thread::timeSliceCounter++;
    800020f4:	00004717          	auipc	a4,0x4
    800020f8:	b1473703          	ld	a4,-1260(a4) # 80005c08 <_GLOBAL_OFFSET_TABLE_+0x30>
    800020fc:	00073783          	ld	a5,0(a4)
    80002100:	00178793          	addi	a5,a5,1
    80002104:	00f73023          	sd	a5,0(a4)
        if (_thread::timeSliceCounter >= _thread::running->getTimeSlice())
    80002108:	00004717          	auipc	a4,0x4
    8000210c:	ad873703          	ld	a4,-1320(a4) # 80005be0 <_GLOBAL_OFFSET_TABLE_+0x8>
    80002110:	00073703          	ld	a4,0(a4)

    bool isFinished() const { return finished; }

    void setFinished(bool value) { finished = value; }

    uint64 getTimeSlice() const { return timeSlice; }
    80002114:	02073703          	ld	a4,32(a4)
    80002118:	eae7e0e3          	bltu	a5,a4,80001fb8 <_ZN5Riscv20handleSupervisorTrapEv+0x128>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    8000211c:	141027f3          	csrr	a5,sepc
    80002120:	fcf43423          	sd	a5,-56(s0)
    return sepc;
    80002124:	fc843783          	ld	a5,-56(s0)
            uint64 volatile sepc = r_sepc();
    80002128:	f8f43c23          	sd	a5,-104(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    8000212c:	100027f3          	csrr	a5,sstatus
    80002130:	fcf43023          	sd	a5,-64(s0)
    return sstatus;
    80002134:	fc043783          	ld	a5,-64(s0)
            uint64 volatile sstatus = r_sstatus();
    80002138:	faf43023          	sd	a5,-96(s0)
            _thread::timeSliceCounter = 0;
    8000213c:	00004797          	auipc	a5,0x4
    80002140:	acc7b783          	ld	a5,-1332(a5) # 80005c08 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002144:	0007b023          	sd	zero,0(a5)
            _thread::dispatch();
    80002148:	00000097          	auipc	ra,0x0
    8000214c:	a08080e7          	jalr	-1528(ra) # 80001b50 <_ZN7_thread8dispatchEv>
            w_sstatus(sstatus);
    80002150:	fa043783          	ld	a5,-96(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80002154:	10079073          	csrw	sstatus,a5
            w_sepc(sepc);
    80002158:	f9843783          	ld	a5,-104(s0)
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    8000215c:	14179073          	csrw	sepc,a5
}
    80002160:	e59ff06f          	j	80001fb8 <_ZN5Riscv20handleSupervisorTrapEv+0x128>
        while(head && head->sleepTime == 0){
    80002164:	00004797          	auipc	a5,0x4
    80002168:	b0c7b783          	ld	a5,-1268(a5) # 80005c70 <_ZN5Riscv15sleepingThreadsE>
    8000216c:	f80780e3          	beqz	a5,800020ec <_ZN5Riscv20handleSupervisorTrapEv+0x25c>
    80002170:	0107a703          	lw	a4,16(a5)
    80002174:	f6071ce3          	bnez	a4,800020ec <_ZN5Riscv20handleSupervisorTrapEv+0x25c>
            t = head->data;
    80002178:	0007b483          	ld	s1,0(a5)
            head = head->next;
    8000217c:	0087b783          	ld	a5,8(a5)
    80002180:	00004717          	auipc	a4,0x4
    80002184:	aef73823          	sd	a5,-1296(a4) # 80005c70 <_ZN5Riscv15sleepingThreadsE>
            t->setSleep();
    80002188:	00048513          	mv	a0,s1
    8000218c:	fffff097          	auipc	ra,0xfffff
    80002190:	724080e7          	jalr	1828(ra) # 800018b0 <_ZN7_thread8setSleepEv>

    void setSleep();

    void insertScheduler() {
        Scheduler::put(this);
    80002194:	00048513          	mv	a0,s1
    80002198:	00000097          	auipc	ra,0x0
    8000219c:	41c080e7          	jalr	1052(ra) # 800025b4 <_ZN9Scheduler3putEP7_thread>
    }
    800021a0:	fc5ff06f          	j	80002164 <_ZN5Riscv20handleSupervisorTrapEv+0x2d4>

00000000800021a4 <_GLOBAL__sub_I__ZN5Riscv15sleepingThreadsE>:
    800021a4:	ff010113          	addi	sp,sp,-16
    800021a8:	00113423          	sd	ra,8(sp)
    800021ac:	00813023          	sd	s0,0(sp)
    800021b0:	01010413          	addi	s0,sp,16
    800021b4:	000105b7          	lui	a1,0x10
    800021b8:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    800021bc:	00100513          	li	a0,1
    800021c0:	00000097          	auipc	ra,0x0
    800021c4:	c70080e7          	jalr	-912(ra) # 80001e30 <_Z41__static_initialization_and_destruction_0ii>
    800021c8:	00813083          	ld	ra,8(sp)
    800021cc:	00013403          	ld	s0,0(sp)
    800021d0:	01010113          	addi	sp,sp,16
    800021d4:	00008067          	ret

00000000800021d8 <_Z4lockv>:
// Created by os on 8/30/22.
//

#include "../h/_sem.hpp"

void lock(){
    800021d8:	ff010113          	addi	sp,sp,-16
    800021dc:	00813423          	sd	s0,8(sp)
    800021e0:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    800021e4:	00200793          	li	a5,2
    800021e8:	1007b073          	csrc	sstatus,a5
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
}
    800021ec:	00813403          	ld	s0,8(sp)
    800021f0:	01010113          	addi	sp,sp,16
    800021f4:	00008067          	ret

00000000800021f8 <_Z6unlockv>:
void unlock(){
    800021f8:	ff010113          	addi	sp,sp,-16
    800021fc:	00813423          	sd	s0,8(sp)
    80002200:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    80002204:	00200793          	li	a5,2
    80002208:	1007a073          	csrs	sstatus,a5
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);
}
    8000220c:	00813403          	ld	s0,8(sp)
    80002210:	01010113          	addi	sp,sp,16
    80002214:	00008067          	ret

0000000080002218 <_ZN4_sem9createSemEPPS_m>:

int _sem::createSem(sem_t *handle, uint64 init){
    80002218:	fe010113          	addi	sp,sp,-32
    8000221c:	00113c23          	sd	ra,24(sp)
    80002220:	00813823          	sd	s0,16(sp)
    80002224:	00913423          	sd	s1,8(sp)
    80002228:	01213023          	sd	s2,0(sp)
    8000222c:	02010413          	addi	s0,sp,32
    80002230:	00050493          	mv	s1,a0
    80002234:	00058913          	mv	s2,a1
    *handle = new _sem(init);
    80002238:	01800513          	li	a0,24
    8000223c:	00000097          	auipc	ra,0x0
    80002240:	b54080e7          	jalr	-1196(ra) # 80001d90 <_Znwm>
    friend class _thread;
    List<_thread>& blockedList();


private:
    _sem(int val=1) : val(val) {}
    80002244:	01252023          	sw	s2,0(a0)
    List() : head(0), tail(0) {}
    80002248:	00053423          	sd	zero,8(a0)
    8000224c:	00053823          	sd	zero,16(a0)
    80002250:	00a4b023          	sd	a0,0(s1)
    if(*handle  != nullptr)
    80002254:	02050063          	beqz	a0,80002274 <_ZN4_sem9createSemEPPS_m+0x5c>
        return 0;
    80002258:	00000513          	li	a0,0
    else
        return -2;
}
    8000225c:	01813083          	ld	ra,24(sp)
    80002260:	01013403          	ld	s0,16(sp)
    80002264:	00813483          	ld	s1,8(sp)
    80002268:	00013903          	ld	s2,0(sp)
    8000226c:	02010113          	addi	sp,sp,32
    80002270:	00008067          	ret
        return -2;
    80002274:	ffe00513          	li	a0,-2
    80002278:	fe5ff06f          	j	8000225c <_ZN4_sem9createSemEPPS_m+0x44>

000000008000227c <_ZN4_semD1Ev>:

_sem::~_sem() {
    8000227c:	fd010113          	addi	sp,sp,-48
    80002280:	02113423          	sd	ra,40(sp)
    80002284:	02813023          	sd	s0,32(sp)
    80002288:	00913c23          	sd	s1,24(sp)
    8000228c:	01213823          	sd	s2,16(sp)
    80002290:	01313423          	sd	s3,8(sp)
    80002294:	03010413          	addi	s0,sp,48
    80002298:	00050993          	mv	s3,a0
    lock();
    8000229c:	00000097          	auipc	ra,0x0
    800022a0:	f3c080e7          	jalr	-196(ra) # 800021d8 <_Z4lockv>
    _thread *t;
    t = blockedThreadQueue.removeLast();
    800022a4:	00898913          	addi	s2,s3,8
        if (!head) { return 0; }
    800022a8:	0089b483          	ld	s1,8(s3)
    800022ac:	06048663          	beqz	s1,80002318 <_ZN4_semD1Ev+0x9c>
        Elem *prev = 0;
    800022b0:	00000713          	li	a4,0
        for (Elem *curr = head; curr && curr != tail; curr = curr->next)
    800022b4:	00048c63          	beqz	s1,800022cc <_ZN4_semD1Ev+0x50>
    800022b8:	00893783          	ld	a5,8(s2)
    800022bc:	00f48863          	beq	s1,a5,800022cc <_ZN4_semD1Ev+0x50>
            prev = curr;
    800022c0:	00048713          	mv	a4,s1
        for (Elem *curr = head; curr && curr != tail; curr = curr->next)
    800022c4:	0084b483          	ld	s1,8(s1)
    800022c8:	fedff06f          	j	800022b4 <_ZN4_semD1Ev+0x38>
        Elem *elem = tail;
    800022cc:	00893503          	ld	a0,8(s2)
        if (prev) { prev->next = 0; }
    800022d0:	02070063          	beqz	a4,800022f0 <_ZN4_semD1Ev+0x74>
    800022d4:	00073423          	sd	zero,8(a4)
        tail = prev;
    800022d8:	00e93423          	sd	a4,8(s2)
        T *ret = elem->data;
    800022dc:	00053483          	ld	s1,0(a0)
        delete elem;
    800022e0:	02050c63          	beqz	a0,80002318 <_ZN4_semD1Ev+0x9c>
    800022e4:	00000097          	auipc	ra,0x0
    800022e8:	afc080e7          	jalr	-1284(ra) # 80001de0 <_ZdlPv>
    800022ec:	02c0006f          	j	80002318 <_ZN4_semD1Ev+0x9c>
        else { head = 0; }
    800022f0:	0009b423          	sd	zero,8(s3)
    800022f4:	fe5ff06f          	j	800022d8 <_ZN4_semD1Ev+0x5c>
        Elem *elem = tail;
    800022f8:	00893503          	ld	a0,8(s2)
        if (prev) { prev->next = 0; }
    800022fc:	04078863          	beqz	a5,8000234c <_ZN4_semD1Ev+0xd0>
    80002300:	0007b423          	sd	zero,8(a5)
        tail = prev;
    80002304:	00f93423          	sd	a5,8(s2)
        T *ret = elem->data;
    80002308:	00053483          	ld	s1,0(a0)
        delete elem;
    8000230c:	00050663          	beqz	a0,80002318 <_ZN4_semD1Ev+0x9c>
    80002310:	00000097          	auipc	ra,0x0
    80002314:	ad0080e7          	jalr	-1328(ra) # 80001de0 <_ZdlPv>
    while(t){
    80002318:	02048e63          	beqz	s1,80002354 <_ZN4_semD1Ev+0xd8>
        Scheduler::put(t);
    8000231c:	00048513          	mv	a0,s1
    80002320:	00000097          	auipc	ra,0x0
    80002324:	294080e7          	jalr	660(ra) # 800025b4 <_ZN9Scheduler3putEP7_thread>
        if (!head) { return 0; }
    80002328:	00093483          	ld	s1,0(s2)
    8000232c:	fe0486e3          	beqz	s1,80002318 <_ZN4_semD1Ev+0x9c>
        Elem *prev = 0;
    80002330:	00000793          	li	a5,0
        for (Elem *curr = head; curr && curr != tail; curr = curr->next)
    80002334:	fc0482e3          	beqz	s1,800022f8 <_ZN4_semD1Ev+0x7c>
    80002338:	00893703          	ld	a4,8(s2)
    8000233c:	fae48ee3          	beq	s1,a4,800022f8 <_ZN4_semD1Ev+0x7c>
            prev = curr;
    80002340:	00048793          	mv	a5,s1
        for (Elem *curr = head; curr && curr != tail; curr = curr->next)
    80002344:	0084b483          	ld	s1,8(s1)
    80002348:	fedff06f          	j	80002334 <_ZN4_semD1Ev+0xb8>
        else { head = 0; }
    8000234c:	00093023          	sd	zero,0(s2)
    80002350:	fb5ff06f          	j	80002304 <_ZN4_semD1Ev+0x88>
        t = blockedThreadQueue.removeLast();
    }
    unlock();
    80002354:	00000097          	auipc	ra,0x0
    80002358:	ea4080e7          	jalr	-348(ra) # 800021f8 <_Z6unlockv>
}
    8000235c:	02813083          	ld	ra,40(sp)
    80002360:	02013403          	ld	s0,32(sp)
    80002364:	01813483          	ld	s1,24(sp)
    80002368:	01013903          	ld	s2,16(sp)
    8000236c:	00813983          	ld	s3,8(sp)
    80002370:	03010113          	addi	sp,sp,48
    80002374:	00008067          	ret

0000000080002378 <_ZN4_sem5blockEv>:

void _sem::block() {
    80002378:	ff010113          	addi	sp,sp,-16
    8000237c:	00113423          	sd	ra,8(sp)
    80002380:	00813023          	sd	s0,0(sp)
    80002384:	01010413          	addi	s0,sp,16

    _thread::running->blocked  = true;
    80002388:	00004797          	auipc	a5,0x4
    8000238c:	8587b783          	ld	a5,-1960(a5) # 80005be0 <_GLOBAL_OFFSET_TABLE_+0x8>
    80002390:	0007b783          	ld	a5,0(a5)
    80002394:	00100713          	li	a4,1
    80002398:	02e78c23          	sb	a4,56(a5)
    _thread::running->blockedBy = this;
    8000239c:	04a7b023          	sd	a0,64(a5)
    _thread::dispatch();
    800023a0:	fffff097          	auipc	ra,0xfffff
    800023a4:	7b0080e7          	jalr	1968(ra) # 80001b50 <_ZN7_thread8dispatchEv>
    //pozvace se zamena konteksta, ako je blocked = true u dispach()-u ce se ubaciti nit u blocked que
}
    800023a8:	00813083          	ld	ra,8(sp)
    800023ac:	00013403          	ld	s0,0(sp)
    800023b0:	01010113          	addi	sp,sp,16
    800023b4:	00008067          	ret

00000000800023b8 <_ZN4_sem7deblockEv>:

void _sem::deblock(){
    800023b8:	fe010113          	addi	sp,sp,-32
    800023bc:	00113c23          	sd	ra,24(sp)
    800023c0:	00813823          	sd	s0,16(sp)
    800023c4:	00913423          	sd	s1,8(sp)
    800023c8:	02010413          	addi	s0,sp,32
    800023cc:	00050793          	mv	a5,a0
        if (!head) { return 0; }
    800023d0:	00853503          	ld	a0,8(a0)
    800023d4:	04050863          	beqz	a0,80002424 <_ZN4_sem7deblockEv+0x6c>
        head = head->next;
    800023d8:	00853703          	ld	a4,8(a0)
    800023dc:	00e7b423          	sd	a4,8(a5)
        if (!head) { tail = 0; }
    800023e0:	02070e63          	beqz	a4,8000241c <_ZN4_sem7deblockEv+0x64>
        T *ret = elem->data;
    800023e4:	00053483          	ld	s1,0(a0)
        delete elem;
    800023e8:	00000097          	auipc	ra,0x0
    800023ec:	9f8080e7          	jalr	-1544(ra) # 80001de0 <_ZdlPv>
    _thread *t = blockedThreadQueue.removeFirst();
    t->dblck();
    800023f0:	00048513          	mv	a0,s1
    800023f4:	00000097          	auipc	ra,0x0
    800023f8:	864080e7          	jalr	-1948(ra) # 80001c58 <_ZN7_thread5dblckEv>
    Scheduler::put(t);
    800023fc:	00048513          	mv	a0,s1
    80002400:	00000097          	auipc	ra,0x0
    80002404:	1b4080e7          	jalr	436(ra) # 800025b4 <_ZN9Scheduler3putEP7_thread>
}
    80002408:	01813083          	ld	ra,24(sp)
    8000240c:	01013403          	ld	s0,16(sp)
    80002410:	00813483          	ld	s1,8(sp)
    80002414:	02010113          	addi	sp,sp,32
    80002418:	00008067          	ret
        if (!head) { tail = 0; }
    8000241c:	0007b823          	sd	zero,16(a5)
    80002420:	fc5ff06f          	j	800023e4 <_ZN4_sem7deblockEv+0x2c>
        if (!head) { return 0; }
    80002424:	00050493          	mv	s1,a0
    80002428:	fc9ff06f          	j	800023f0 <_ZN4_sem7deblockEv+0x38>

000000008000242c <_ZN4_sem4waitEv>:

int _sem::wait() {
    8000242c:	fe010113          	addi	sp,sp,-32
    80002430:	00113c23          	sd	ra,24(sp)
    80002434:	00813823          	sd	s0,16(sp)
    80002438:	00913423          	sd	s1,8(sp)
    8000243c:	02010413          	addi	s0,sp,32
    80002440:	00050493          	mv	s1,a0
    lock();
    80002444:	00000097          	auipc	ra,0x0
    80002448:	d94080e7          	jalr	-620(ra) # 800021d8 <_Z4lockv>
    if(--val < 0)
    8000244c:	0004a783          	lw	a5,0(s1)
    80002450:	fff7879b          	addiw	a5,a5,-1
    80002454:	00f4a023          	sw	a5,0(s1)
    80002458:	02079713          	slli	a4,a5,0x20
    8000245c:	02074263          	bltz	a4,80002480 <_ZN4_sem4waitEv+0x54>
        block();
    unlock();
    80002460:	00000097          	auipc	ra,0x0
    80002464:	d98080e7          	jalr	-616(ra) # 800021f8 <_Z6unlockv>
    return 0;
}
    80002468:	00000513          	li	a0,0
    8000246c:	01813083          	ld	ra,24(sp)
    80002470:	01013403          	ld	s0,16(sp)
    80002474:	00813483          	ld	s1,8(sp)
    80002478:	02010113          	addi	sp,sp,32
    8000247c:	00008067          	ret
        block();
    80002480:	00048513          	mv	a0,s1
    80002484:	00000097          	auipc	ra,0x0
    80002488:	ef4080e7          	jalr	-268(ra) # 80002378 <_ZN4_sem5blockEv>
    8000248c:	fd5ff06f          	j	80002460 <_ZN4_sem4waitEv+0x34>

0000000080002490 <_ZN4_sem6signalEv>:

int _sem::signal() {
    80002490:	fe010113          	addi	sp,sp,-32
    80002494:	00113c23          	sd	ra,24(sp)
    80002498:	00813823          	sd	s0,16(sp)
    8000249c:	00913423          	sd	s1,8(sp)
    800024a0:	02010413          	addi	s0,sp,32
    800024a4:	00050493          	mv	s1,a0
    lock();
    800024a8:	00000097          	auipc	ra,0x0
    800024ac:	d30080e7          	jalr	-720(ra) # 800021d8 <_Z4lockv>
    if(val++ < 0)
    800024b0:	0004a783          	lw	a5,0(s1)
    800024b4:	0017871b          	addiw	a4,a5,1
    800024b8:	00e4a023          	sw	a4,0(s1)
    800024bc:	0207c263          	bltz	a5,800024e0 <_ZN4_sem6signalEv+0x50>
        deblock();
    unlock();
    800024c0:	00000097          	auipc	ra,0x0
    800024c4:	d38080e7          	jalr	-712(ra) # 800021f8 <_Z6unlockv>
    return 0;
}
    800024c8:	00000513          	li	a0,0
    800024cc:	01813083          	ld	ra,24(sp)
    800024d0:	01013403          	ld	s0,16(sp)
    800024d4:	00813483          	ld	s1,8(sp)
    800024d8:	02010113          	addi	sp,sp,32
    800024dc:	00008067          	ret
        deblock();
    800024e0:	00048513          	mv	a0,s1
    800024e4:	00000097          	auipc	ra,0x0
    800024e8:	ed4080e7          	jalr	-300(ra) # 800023b8 <_ZN4_sem7deblockEv>
    800024ec:	fd5ff06f          	j	800024c0 <_ZN4_sem6signalEv+0x30>

00000000800024f0 <_ZN4_sem11blockedListEv>:

List<_thread>& _sem::blockedList(){
    800024f0:	ff010113          	addi	sp,sp,-16
    800024f4:	00813423          	sd	s0,8(sp)
    800024f8:	01010413          	addi	s0,sp,16
    return _sem::blockedThreadQueue;
}
    800024fc:	00850513          	addi	a0,a0,8
    80002500:	00813403          	ld	s0,8(sp)
    80002504:	01010113          	addi	sp,sp,16
    80002508:	00008067          	ret

000000008000250c <_Z41__static_initialization_and_destruction_0ii>:
}

void Scheduler::put(_thread *ccb)
{
    readyThreadQueue.addLast(ccb);
    8000250c:	ff010113          	addi	sp,sp,-16
    80002510:	00813423          	sd	s0,8(sp)
    80002514:	01010413          	addi	s0,sp,16
    80002518:	00100793          	li	a5,1
    8000251c:	00f50863          	beq	a0,a5,8000252c <_Z41__static_initialization_and_destruction_0ii+0x20>
    80002520:	00813403          	ld	s0,8(sp)
    80002524:	01010113          	addi	sp,sp,16
    80002528:	00008067          	ret
    8000252c:	000107b7          	lui	a5,0x10
    80002530:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80002534:	fef596e3          	bne	a1,a5,80002520 <_Z41__static_initialization_and_destruction_0ii+0x14>
    List() : head(0), tail(0) {}
    80002538:	00003797          	auipc	a5,0x3
    8000253c:	74878793          	addi	a5,a5,1864 # 80005c80 <_ZN9Scheduler16readyThreadQueueE>
    80002540:	0007b023          	sd	zero,0(a5)
    80002544:	0007b423          	sd	zero,8(a5)
    80002548:	fd9ff06f          	j	80002520 <_Z41__static_initialization_and_destruction_0ii+0x14>

000000008000254c <_ZN9Scheduler3getEv>:
{
    8000254c:	fe010113          	addi	sp,sp,-32
    80002550:	00113c23          	sd	ra,24(sp)
    80002554:	00813823          	sd	s0,16(sp)
    80002558:	00913423          	sd	s1,8(sp)
    8000255c:	02010413          	addi	s0,sp,32
        if (!head) { return 0; }
    80002560:	00003517          	auipc	a0,0x3
    80002564:	72053503          	ld	a0,1824(a0) # 80005c80 <_ZN9Scheduler16readyThreadQueueE>
    80002568:	04050263          	beqz	a0,800025ac <_ZN9Scheduler3getEv+0x60>
        head = head->next;
    8000256c:	00853783          	ld	a5,8(a0)
    80002570:	00003717          	auipc	a4,0x3
    80002574:	70f73823          	sd	a5,1808(a4) # 80005c80 <_ZN9Scheduler16readyThreadQueueE>
        if (!head) { tail = 0; }
    80002578:	02078463          	beqz	a5,800025a0 <_ZN9Scheduler3getEv+0x54>
        T *ret = elem->data;
    8000257c:	00053483          	ld	s1,0(a0)
        delete elem;
    80002580:	00000097          	auipc	ra,0x0
    80002584:	860080e7          	jalr	-1952(ra) # 80001de0 <_ZdlPv>
}
    80002588:	00048513          	mv	a0,s1
    8000258c:	01813083          	ld	ra,24(sp)
    80002590:	01013403          	ld	s0,16(sp)
    80002594:	00813483          	ld	s1,8(sp)
    80002598:	02010113          	addi	sp,sp,32
    8000259c:	00008067          	ret
        if (!head) { tail = 0; }
    800025a0:	00003797          	auipc	a5,0x3
    800025a4:	6e07b423          	sd	zero,1768(a5) # 80005c88 <_ZN9Scheduler16readyThreadQueueE+0x8>
    800025a8:	fd5ff06f          	j	8000257c <_ZN9Scheduler3getEv+0x30>
        if (!head) { return 0; }
    800025ac:	00050493          	mv	s1,a0
    return readyThreadQueue.removeFirst();
    800025b0:	fd9ff06f          	j	80002588 <_ZN9Scheduler3getEv+0x3c>

00000000800025b4 <_ZN9Scheduler3putEP7_thread>:
{
    800025b4:	fe010113          	addi	sp,sp,-32
    800025b8:	00113c23          	sd	ra,24(sp)
    800025bc:	00813823          	sd	s0,16(sp)
    800025c0:	00913423          	sd	s1,8(sp)
    800025c4:	02010413          	addi	s0,sp,32
    800025c8:	00050493          	mv	s1,a0
        Elem *elem = new Elem(data, 0);
    800025cc:	01800513          	li	a0,24
    800025d0:	fffff097          	auipc	ra,0xfffff
    800025d4:	7c0080e7          	jalr	1984(ra) # 80001d90 <_Znwm>
        Elem(T *data, Elem *next, int sleepTime = 0) : data(data), next(next), sleepTime(sleepTime) {}
    800025d8:	00953023          	sd	s1,0(a0)
    800025dc:	00053423          	sd	zero,8(a0)
    800025e0:	00052823          	sw	zero,16(a0)
        if (tail)
    800025e4:	00003797          	auipc	a5,0x3
    800025e8:	6a47b783          	ld	a5,1700(a5) # 80005c88 <_ZN9Scheduler16readyThreadQueueE+0x8>
    800025ec:	02078263          	beqz	a5,80002610 <_ZN9Scheduler3putEP7_thread+0x5c>
            tail->next = elem;
    800025f0:	00a7b423          	sd	a0,8(a5)
            tail = elem;
    800025f4:	00003797          	auipc	a5,0x3
    800025f8:	68a7ba23          	sd	a0,1684(a5) # 80005c88 <_ZN9Scheduler16readyThreadQueueE+0x8>
    800025fc:	01813083          	ld	ra,24(sp)
    80002600:	01013403          	ld	s0,16(sp)
    80002604:	00813483          	ld	s1,8(sp)
    80002608:	02010113          	addi	sp,sp,32
    8000260c:	00008067          	ret
            head = tail = elem;
    80002610:	00003797          	auipc	a5,0x3
    80002614:	67078793          	addi	a5,a5,1648 # 80005c80 <_ZN9Scheduler16readyThreadQueueE>
    80002618:	00a7b423          	sd	a0,8(a5)
    8000261c:	00a7b023          	sd	a0,0(a5)
    80002620:	fddff06f          	j	800025fc <_ZN9Scheduler3putEP7_thread+0x48>

0000000080002624 <_GLOBAL__sub_I__ZN9Scheduler16readyThreadQueueE>:
    80002624:	ff010113          	addi	sp,sp,-16
    80002628:	00113423          	sd	ra,8(sp)
    8000262c:	00813023          	sd	s0,0(sp)
    80002630:	01010413          	addi	s0,sp,16
    80002634:	000105b7          	lui	a1,0x10
    80002638:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    8000263c:	00100513          	li	a0,1
    80002640:	00000097          	auipc	ra,0x0
    80002644:	ecc080e7          	jalr	-308(ra) # 8000250c <_Z41__static_initialization_and_destruction_0ii>
    80002648:	00813083          	ld	ra,8(sp)
    8000264c:	00013403          	ld	s0,0(sp)
    80002650:	01010113          	addi	sp,sp,16
    80002654:	00008067          	ret

0000000080002658 <_Z11printStringPKc>:
#include "../h/print.hpp"
#include "../h/riscv.hpp"
#include "../lib/console.h"

void printString(char const *string)
{
    80002658:	fd010113          	addi	sp,sp,-48
    8000265c:	02113423          	sd	ra,40(sp)
    80002660:	02813023          	sd	s0,32(sp)
    80002664:	00913c23          	sd	s1,24(sp)
    80002668:	01213823          	sd	s2,16(sp)
    8000266c:	03010413          	addi	s0,sp,48
    80002670:	00050493          	mv	s1,a0
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80002674:	100027f3          	csrr	a5,sstatus
    80002678:	fcf43c23          	sd	a5,-40(s0)
    return sstatus;
    8000267c:	fd843903          	ld	s2,-40(s0)
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    80002680:	00200793          	li	a5,2
    80002684:	1007b073          	csrc	sstatus,a5
    uint64 sstatus = Riscv::r_sstatus();
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    while (*string != '\0')
    80002688:	0004c503          	lbu	a0,0(s1)
    8000268c:	00050a63          	beqz	a0,800026a0 <_Z11printStringPKc+0x48>
    {
        __putc(*string);
    80002690:	00002097          	auipc	ra,0x2
    80002694:	3e0080e7          	jalr	992(ra) # 80004a70 <__putc>
        string++;
    80002698:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    8000269c:	fedff06f          	j	80002688 <_Z11printStringPKc+0x30>
    }
    Riscv::ms_sstatus(sstatus & Riscv::SSTATUS_SIE ? Riscv::SSTATUS_SIE : 0);
    800026a0:	0009091b          	sext.w	s2,s2
    800026a4:	00297913          	andi	s2,s2,2
    800026a8:	0009091b          	sext.w	s2,s2
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    800026ac:	10092073          	csrs	sstatus,s2
}
    800026b0:	02813083          	ld	ra,40(sp)
    800026b4:	02013403          	ld	s0,32(sp)
    800026b8:	01813483          	ld	s1,24(sp)
    800026bc:	01013903          	ld	s2,16(sp)
    800026c0:	03010113          	addi	sp,sp,48
    800026c4:	00008067          	ret

00000000800026c8 <_Z12printIntegerm>:

void printInteger(uint64 integer)
{
    800026c8:	fc010113          	addi	sp,sp,-64
    800026cc:	02113c23          	sd	ra,56(sp)
    800026d0:	02813823          	sd	s0,48(sp)
    800026d4:	02913423          	sd	s1,40(sp)
    800026d8:	03213023          	sd	s2,32(sp)
    800026dc:	04010413          	addi	s0,sp,64
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    800026e0:	100027f3          	csrr	a5,sstatus
    800026e4:	fcf43423          	sd	a5,-56(s0)
    return sstatus;
    800026e8:	fc843903          	ld	s2,-56(s0)
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    800026ec:	00200793          	li	a5,2
    800026f0:	1007b073          	csrc	sstatus,a5
    {
        neg = 1;
        x = -integer;
    } else
    {
        x = integer;
    800026f4:	0005051b          	sext.w	a0,a0
    }

    i = 0;
    800026f8:	00000493          	li	s1,0
    do
    {
        buf[i++] = digits[x % 10];
    800026fc:	00a00613          	li	a2,10
    80002700:	02c5773b          	remuw	a4,a0,a2
    80002704:	02071693          	slli	a3,a4,0x20
    80002708:	0206d693          	srli	a3,a3,0x20
    8000270c:	00003717          	auipc	a4,0x3
    80002710:	9b470713          	addi	a4,a4,-1612 # 800050c0 <_ZZ12printIntegermE6digits>
    80002714:	00d70733          	add	a4,a4,a3
    80002718:	00074703          	lbu	a4,0(a4)
    8000271c:	fe040693          	addi	a3,s0,-32
    80002720:	009687b3          	add	a5,a3,s1
    80002724:	0014849b          	addiw	s1,s1,1
    80002728:	fee78823          	sb	a4,-16(a5)
    } while ((x /= 10) != 0);
    8000272c:	0005071b          	sext.w	a4,a0
    80002730:	02c5553b          	divuw	a0,a0,a2
    80002734:	00900793          	li	a5,9
    80002738:	fce7e2e3          	bltu	a5,a4,800026fc <_Z12printIntegerm+0x34>
    if (neg)
        buf[i++] = '-';

    while (--i >= 0) { __putc(buf[i]); }
    8000273c:	fff4849b          	addiw	s1,s1,-1
    80002740:	0004ce63          	bltz	s1,8000275c <_Z12printIntegerm+0x94>
    80002744:	fe040793          	addi	a5,s0,-32
    80002748:	009787b3          	add	a5,a5,s1
    8000274c:	ff07c503          	lbu	a0,-16(a5)
    80002750:	00002097          	auipc	ra,0x2
    80002754:	320080e7          	jalr	800(ra) # 80004a70 <__putc>
    80002758:	fe5ff06f          	j	8000273c <_Z12printIntegerm+0x74>
    Riscv::ms_sstatus(sstatus & Riscv::SSTATUS_SIE ? Riscv::SSTATUS_SIE : 0);
    8000275c:	0009091b          	sext.w	s2,s2
    80002760:	00297913          	andi	s2,s2,2
    80002764:	0009091b          	sext.w	s2,s2
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    80002768:	10092073          	csrs	sstatus,s2
    8000276c:	03813083          	ld	ra,56(sp)
    80002770:	03013403          	ld	s0,48(sp)
    80002774:	02813483          	ld	s1,40(sp)
    80002778:	02013903          	ld	s2,32(sp)
    8000277c:	04010113          	addi	sp,sp,64
    80002780:	00008067          	ret

0000000080002784 <start>:
    80002784:	ff010113          	addi	sp,sp,-16
    80002788:	00813423          	sd	s0,8(sp)
    8000278c:	01010413          	addi	s0,sp,16
    80002790:	300027f3          	csrr	a5,mstatus
    80002794:	ffffe737          	lui	a4,0xffffe
    80002798:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff78ff>
    8000279c:	00e7f7b3          	and	a5,a5,a4
    800027a0:	00001737          	lui	a4,0x1
    800027a4:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    800027a8:	00e7e7b3          	or	a5,a5,a4
    800027ac:	30079073          	csrw	mstatus,a5
    800027b0:	00000797          	auipc	a5,0x0
    800027b4:	16078793          	addi	a5,a5,352 # 80002910 <system_main>
    800027b8:	34179073          	csrw	mepc,a5
    800027bc:	00000793          	li	a5,0
    800027c0:	18079073          	csrw	satp,a5
    800027c4:	000107b7          	lui	a5,0x10
    800027c8:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    800027cc:	30279073          	csrw	medeleg,a5
    800027d0:	30379073          	csrw	mideleg,a5
    800027d4:	104027f3          	csrr	a5,sie
    800027d8:	2227e793          	ori	a5,a5,546
    800027dc:	10479073          	csrw	sie,a5
    800027e0:	fff00793          	li	a5,-1
    800027e4:	00a7d793          	srli	a5,a5,0xa
    800027e8:	3b079073          	csrw	pmpaddr0,a5
    800027ec:	00f00793          	li	a5,15
    800027f0:	3a079073          	csrw	pmpcfg0,a5
    800027f4:	f14027f3          	csrr	a5,mhartid
    800027f8:	0200c737          	lui	a4,0x200c
    800027fc:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80002800:	0007869b          	sext.w	a3,a5
    80002804:	00269713          	slli	a4,a3,0x2
    80002808:	000f4637          	lui	a2,0xf4
    8000280c:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80002810:	00d70733          	add	a4,a4,a3
    80002814:	0037979b          	slliw	a5,a5,0x3
    80002818:	020046b7          	lui	a3,0x2004
    8000281c:	00d787b3          	add	a5,a5,a3
    80002820:	00c585b3          	add	a1,a1,a2
    80002824:	00371693          	slli	a3,a4,0x3
    80002828:	00003717          	auipc	a4,0x3
    8000282c:	46870713          	addi	a4,a4,1128 # 80005c90 <timer_scratch>
    80002830:	00b7b023          	sd	a1,0(a5)
    80002834:	00d70733          	add	a4,a4,a3
    80002838:	00f73c23          	sd	a5,24(a4)
    8000283c:	02c73023          	sd	a2,32(a4)
    80002840:	34071073          	csrw	mscratch,a4
    80002844:	00000797          	auipc	a5,0x0
    80002848:	6ec78793          	addi	a5,a5,1772 # 80002f30 <timervec>
    8000284c:	30579073          	csrw	mtvec,a5
    80002850:	300027f3          	csrr	a5,mstatus
    80002854:	0087e793          	ori	a5,a5,8
    80002858:	30079073          	csrw	mstatus,a5
    8000285c:	304027f3          	csrr	a5,mie
    80002860:	0807e793          	ori	a5,a5,128
    80002864:	30479073          	csrw	mie,a5
    80002868:	f14027f3          	csrr	a5,mhartid
    8000286c:	0007879b          	sext.w	a5,a5
    80002870:	00078213          	mv	tp,a5
    80002874:	30200073          	mret
    80002878:	00813403          	ld	s0,8(sp)
    8000287c:	01010113          	addi	sp,sp,16
    80002880:	00008067          	ret

0000000080002884 <timerinit>:
    80002884:	ff010113          	addi	sp,sp,-16
    80002888:	00813423          	sd	s0,8(sp)
    8000288c:	01010413          	addi	s0,sp,16
    80002890:	f14027f3          	csrr	a5,mhartid
    80002894:	0200c737          	lui	a4,0x200c
    80002898:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    8000289c:	0007869b          	sext.w	a3,a5
    800028a0:	00269713          	slli	a4,a3,0x2
    800028a4:	000f4637          	lui	a2,0xf4
    800028a8:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800028ac:	00d70733          	add	a4,a4,a3
    800028b0:	0037979b          	slliw	a5,a5,0x3
    800028b4:	020046b7          	lui	a3,0x2004
    800028b8:	00d787b3          	add	a5,a5,a3
    800028bc:	00c585b3          	add	a1,a1,a2
    800028c0:	00371693          	slli	a3,a4,0x3
    800028c4:	00003717          	auipc	a4,0x3
    800028c8:	3cc70713          	addi	a4,a4,972 # 80005c90 <timer_scratch>
    800028cc:	00b7b023          	sd	a1,0(a5)
    800028d0:	00d70733          	add	a4,a4,a3
    800028d4:	00f73c23          	sd	a5,24(a4)
    800028d8:	02c73023          	sd	a2,32(a4)
    800028dc:	34071073          	csrw	mscratch,a4
    800028e0:	00000797          	auipc	a5,0x0
    800028e4:	65078793          	addi	a5,a5,1616 # 80002f30 <timervec>
    800028e8:	30579073          	csrw	mtvec,a5
    800028ec:	300027f3          	csrr	a5,mstatus
    800028f0:	0087e793          	ori	a5,a5,8
    800028f4:	30079073          	csrw	mstatus,a5
    800028f8:	304027f3          	csrr	a5,mie
    800028fc:	0807e793          	ori	a5,a5,128
    80002900:	30479073          	csrw	mie,a5
    80002904:	00813403          	ld	s0,8(sp)
    80002908:	01010113          	addi	sp,sp,16
    8000290c:	00008067          	ret

0000000080002910 <system_main>:
    80002910:	fe010113          	addi	sp,sp,-32
    80002914:	00813823          	sd	s0,16(sp)
    80002918:	00913423          	sd	s1,8(sp)
    8000291c:	00113c23          	sd	ra,24(sp)
    80002920:	02010413          	addi	s0,sp,32
    80002924:	00000097          	auipc	ra,0x0
    80002928:	0c4080e7          	jalr	196(ra) # 800029e8 <cpuid>
    8000292c:	00003497          	auipc	s1,0x3
    80002930:	30448493          	addi	s1,s1,772 # 80005c30 <started>
    80002934:	02050263          	beqz	a0,80002958 <system_main+0x48>
    80002938:	0004a783          	lw	a5,0(s1)
    8000293c:	0007879b          	sext.w	a5,a5
    80002940:	fe078ce3          	beqz	a5,80002938 <system_main+0x28>
    80002944:	0ff0000f          	fence
    80002948:	00002517          	auipc	a0,0x2
    8000294c:	7b850513          	addi	a0,a0,1976 # 80005100 <_ZZ12printIntegermE6digits+0x40>
    80002950:	00001097          	auipc	ra,0x1
    80002954:	a7c080e7          	jalr	-1412(ra) # 800033cc <panic>
    80002958:	00001097          	auipc	ra,0x1
    8000295c:	9d0080e7          	jalr	-1584(ra) # 80003328 <consoleinit>
    80002960:	00001097          	auipc	ra,0x1
    80002964:	15c080e7          	jalr	348(ra) # 80003abc <printfinit>
    80002968:	00002517          	auipc	a0,0x2
    8000296c:	72850513          	addi	a0,a0,1832 # 80005090 <kvmincrease+0x500>
    80002970:	00001097          	auipc	ra,0x1
    80002974:	ab8080e7          	jalr	-1352(ra) # 80003428 <__printf>
    80002978:	00002517          	auipc	a0,0x2
    8000297c:	75850513          	addi	a0,a0,1880 # 800050d0 <_ZZ12printIntegermE6digits+0x10>
    80002980:	00001097          	auipc	ra,0x1
    80002984:	aa8080e7          	jalr	-1368(ra) # 80003428 <__printf>
    80002988:	00002517          	auipc	a0,0x2
    8000298c:	70850513          	addi	a0,a0,1800 # 80005090 <kvmincrease+0x500>
    80002990:	00001097          	auipc	ra,0x1
    80002994:	a98080e7          	jalr	-1384(ra) # 80003428 <__printf>
    80002998:	00001097          	auipc	ra,0x1
    8000299c:	4b0080e7          	jalr	1200(ra) # 80003e48 <kinit>
    800029a0:	00000097          	auipc	ra,0x0
    800029a4:	148080e7          	jalr	328(ra) # 80002ae8 <trapinit>
    800029a8:	00000097          	auipc	ra,0x0
    800029ac:	16c080e7          	jalr	364(ra) # 80002b14 <trapinithart>
    800029b0:	00000097          	auipc	ra,0x0
    800029b4:	5c0080e7          	jalr	1472(ra) # 80002f70 <plicinit>
    800029b8:	00000097          	auipc	ra,0x0
    800029bc:	5e0080e7          	jalr	1504(ra) # 80002f98 <plicinithart>
    800029c0:	00000097          	auipc	ra,0x0
    800029c4:	078080e7          	jalr	120(ra) # 80002a38 <userinit>
    800029c8:	0ff0000f          	fence
    800029cc:	00100793          	li	a5,1
    800029d0:	00002517          	auipc	a0,0x2
    800029d4:	71850513          	addi	a0,a0,1816 # 800050e8 <_ZZ12printIntegermE6digits+0x28>
    800029d8:	00f4a023          	sw	a5,0(s1)
    800029dc:	00001097          	auipc	ra,0x1
    800029e0:	a4c080e7          	jalr	-1460(ra) # 80003428 <__printf>
    800029e4:	0000006f          	j	800029e4 <system_main+0xd4>

00000000800029e8 <cpuid>:
    800029e8:	ff010113          	addi	sp,sp,-16
    800029ec:	00813423          	sd	s0,8(sp)
    800029f0:	01010413          	addi	s0,sp,16
    800029f4:	00020513          	mv	a0,tp
    800029f8:	00813403          	ld	s0,8(sp)
    800029fc:	0005051b          	sext.w	a0,a0
    80002a00:	01010113          	addi	sp,sp,16
    80002a04:	00008067          	ret

0000000080002a08 <mycpu>:
    80002a08:	ff010113          	addi	sp,sp,-16
    80002a0c:	00813423          	sd	s0,8(sp)
    80002a10:	01010413          	addi	s0,sp,16
    80002a14:	00020793          	mv	a5,tp
    80002a18:	00813403          	ld	s0,8(sp)
    80002a1c:	0007879b          	sext.w	a5,a5
    80002a20:	00779793          	slli	a5,a5,0x7
    80002a24:	00004517          	auipc	a0,0x4
    80002a28:	29c50513          	addi	a0,a0,668 # 80006cc0 <cpus>
    80002a2c:	00f50533          	add	a0,a0,a5
    80002a30:	01010113          	addi	sp,sp,16
    80002a34:	00008067          	ret

0000000080002a38 <userinit>:
    80002a38:	ff010113          	addi	sp,sp,-16
    80002a3c:	00813423          	sd	s0,8(sp)
    80002a40:	01010413          	addi	s0,sp,16
    80002a44:	00813403          	ld	s0,8(sp)
    80002a48:	01010113          	addi	sp,sp,16
    80002a4c:	fffff317          	auipc	t1,0xfffff
    80002a50:	d6830067          	jr	-664(t1) # 800017b4 <main>

0000000080002a54 <either_copyout>:
    80002a54:	ff010113          	addi	sp,sp,-16
    80002a58:	00813023          	sd	s0,0(sp)
    80002a5c:	00113423          	sd	ra,8(sp)
    80002a60:	01010413          	addi	s0,sp,16
    80002a64:	02051663          	bnez	a0,80002a90 <either_copyout+0x3c>
    80002a68:	00058513          	mv	a0,a1
    80002a6c:	00060593          	mv	a1,a2
    80002a70:	0006861b          	sext.w	a2,a3
    80002a74:	00002097          	auipc	ra,0x2
    80002a78:	c60080e7          	jalr	-928(ra) # 800046d4 <__memmove>
    80002a7c:	00813083          	ld	ra,8(sp)
    80002a80:	00013403          	ld	s0,0(sp)
    80002a84:	00000513          	li	a0,0
    80002a88:	01010113          	addi	sp,sp,16
    80002a8c:	00008067          	ret
    80002a90:	00002517          	auipc	a0,0x2
    80002a94:	69850513          	addi	a0,a0,1688 # 80005128 <_ZZ12printIntegermE6digits+0x68>
    80002a98:	00001097          	auipc	ra,0x1
    80002a9c:	934080e7          	jalr	-1740(ra) # 800033cc <panic>

0000000080002aa0 <either_copyin>:
    80002aa0:	ff010113          	addi	sp,sp,-16
    80002aa4:	00813023          	sd	s0,0(sp)
    80002aa8:	00113423          	sd	ra,8(sp)
    80002aac:	01010413          	addi	s0,sp,16
    80002ab0:	02059463          	bnez	a1,80002ad8 <either_copyin+0x38>
    80002ab4:	00060593          	mv	a1,a2
    80002ab8:	0006861b          	sext.w	a2,a3
    80002abc:	00002097          	auipc	ra,0x2
    80002ac0:	c18080e7          	jalr	-1000(ra) # 800046d4 <__memmove>
    80002ac4:	00813083          	ld	ra,8(sp)
    80002ac8:	00013403          	ld	s0,0(sp)
    80002acc:	00000513          	li	a0,0
    80002ad0:	01010113          	addi	sp,sp,16
    80002ad4:	00008067          	ret
    80002ad8:	00002517          	auipc	a0,0x2
    80002adc:	67850513          	addi	a0,a0,1656 # 80005150 <_ZZ12printIntegermE6digits+0x90>
    80002ae0:	00001097          	auipc	ra,0x1
    80002ae4:	8ec080e7          	jalr	-1812(ra) # 800033cc <panic>

0000000080002ae8 <trapinit>:
    80002ae8:	ff010113          	addi	sp,sp,-16
    80002aec:	00813423          	sd	s0,8(sp)
    80002af0:	01010413          	addi	s0,sp,16
    80002af4:	00813403          	ld	s0,8(sp)
    80002af8:	00002597          	auipc	a1,0x2
    80002afc:	68058593          	addi	a1,a1,1664 # 80005178 <_ZZ12printIntegermE6digits+0xb8>
    80002b00:	00004517          	auipc	a0,0x4
    80002b04:	24050513          	addi	a0,a0,576 # 80006d40 <tickslock>
    80002b08:	01010113          	addi	sp,sp,16
    80002b0c:	00001317          	auipc	t1,0x1
    80002b10:	5cc30067          	jr	1484(t1) # 800040d8 <initlock>

0000000080002b14 <trapinithart>:
    80002b14:	ff010113          	addi	sp,sp,-16
    80002b18:	00813423          	sd	s0,8(sp)
    80002b1c:	01010413          	addi	s0,sp,16
    80002b20:	00000797          	auipc	a5,0x0
    80002b24:	30078793          	addi	a5,a5,768 # 80002e20 <kernelvec>
    80002b28:	10579073          	csrw	stvec,a5
    80002b2c:	00813403          	ld	s0,8(sp)
    80002b30:	01010113          	addi	sp,sp,16
    80002b34:	00008067          	ret

0000000080002b38 <usertrap>:
    80002b38:	ff010113          	addi	sp,sp,-16
    80002b3c:	00813423          	sd	s0,8(sp)
    80002b40:	01010413          	addi	s0,sp,16
    80002b44:	00813403          	ld	s0,8(sp)
    80002b48:	01010113          	addi	sp,sp,16
    80002b4c:	00008067          	ret

0000000080002b50 <usertrapret>:
    80002b50:	ff010113          	addi	sp,sp,-16
    80002b54:	00813423          	sd	s0,8(sp)
    80002b58:	01010413          	addi	s0,sp,16
    80002b5c:	00813403          	ld	s0,8(sp)
    80002b60:	01010113          	addi	sp,sp,16
    80002b64:	00008067          	ret

0000000080002b68 <kerneltrap>:
    80002b68:	fe010113          	addi	sp,sp,-32
    80002b6c:	00813823          	sd	s0,16(sp)
    80002b70:	00113c23          	sd	ra,24(sp)
    80002b74:	00913423          	sd	s1,8(sp)
    80002b78:	02010413          	addi	s0,sp,32
    80002b7c:	142025f3          	csrr	a1,scause
    80002b80:	100027f3          	csrr	a5,sstatus
    80002b84:	0027f793          	andi	a5,a5,2
    80002b88:	10079c63          	bnez	a5,80002ca0 <kerneltrap+0x138>
    80002b8c:	142027f3          	csrr	a5,scause
    80002b90:	0207ce63          	bltz	a5,80002bcc <kerneltrap+0x64>
    80002b94:	00002517          	auipc	a0,0x2
    80002b98:	62c50513          	addi	a0,a0,1580 # 800051c0 <_ZZ12printIntegermE6digits+0x100>
    80002b9c:	00001097          	auipc	ra,0x1
    80002ba0:	88c080e7          	jalr	-1908(ra) # 80003428 <__printf>
    80002ba4:	141025f3          	csrr	a1,sepc
    80002ba8:	14302673          	csrr	a2,stval
    80002bac:	00002517          	auipc	a0,0x2
    80002bb0:	62450513          	addi	a0,a0,1572 # 800051d0 <_ZZ12printIntegermE6digits+0x110>
    80002bb4:	00001097          	auipc	ra,0x1
    80002bb8:	874080e7          	jalr	-1932(ra) # 80003428 <__printf>
    80002bbc:	00002517          	auipc	a0,0x2
    80002bc0:	62c50513          	addi	a0,a0,1580 # 800051e8 <_ZZ12printIntegermE6digits+0x128>
    80002bc4:	00001097          	auipc	ra,0x1
    80002bc8:	808080e7          	jalr	-2040(ra) # 800033cc <panic>
    80002bcc:	0ff7f713          	andi	a4,a5,255
    80002bd0:	00900693          	li	a3,9
    80002bd4:	04d70063          	beq	a4,a3,80002c14 <kerneltrap+0xac>
    80002bd8:	fff00713          	li	a4,-1
    80002bdc:	03f71713          	slli	a4,a4,0x3f
    80002be0:	00170713          	addi	a4,a4,1
    80002be4:	fae798e3          	bne	a5,a4,80002b94 <kerneltrap+0x2c>
    80002be8:	00000097          	auipc	ra,0x0
    80002bec:	e00080e7          	jalr	-512(ra) # 800029e8 <cpuid>
    80002bf0:	06050663          	beqz	a0,80002c5c <kerneltrap+0xf4>
    80002bf4:	144027f3          	csrr	a5,sip
    80002bf8:	ffd7f793          	andi	a5,a5,-3
    80002bfc:	14479073          	csrw	sip,a5
    80002c00:	01813083          	ld	ra,24(sp)
    80002c04:	01013403          	ld	s0,16(sp)
    80002c08:	00813483          	ld	s1,8(sp)
    80002c0c:	02010113          	addi	sp,sp,32
    80002c10:	00008067          	ret
    80002c14:	00000097          	auipc	ra,0x0
    80002c18:	3d0080e7          	jalr	976(ra) # 80002fe4 <plic_claim>
    80002c1c:	00a00793          	li	a5,10
    80002c20:	00050493          	mv	s1,a0
    80002c24:	06f50863          	beq	a0,a5,80002c94 <kerneltrap+0x12c>
    80002c28:	fc050ce3          	beqz	a0,80002c00 <kerneltrap+0x98>
    80002c2c:	00050593          	mv	a1,a0
    80002c30:	00002517          	auipc	a0,0x2
    80002c34:	57050513          	addi	a0,a0,1392 # 800051a0 <_ZZ12printIntegermE6digits+0xe0>
    80002c38:	00000097          	auipc	ra,0x0
    80002c3c:	7f0080e7          	jalr	2032(ra) # 80003428 <__printf>
    80002c40:	01013403          	ld	s0,16(sp)
    80002c44:	01813083          	ld	ra,24(sp)
    80002c48:	00048513          	mv	a0,s1
    80002c4c:	00813483          	ld	s1,8(sp)
    80002c50:	02010113          	addi	sp,sp,32
    80002c54:	00000317          	auipc	t1,0x0
    80002c58:	3c830067          	jr	968(t1) # 8000301c <plic_complete>
    80002c5c:	00004517          	auipc	a0,0x4
    80002c60:	0e450513          	addi	a0,a0,228 # 80006d40 <tickslock>
    80002c64:	00001097          	auipc	ra,0x1
    80002c68:	498080e7          	jalr	1176(ra) # 800040fc <acquire>
    80002c6c:	00003717          	auipc	a4,0x3
    80002c70:	fc870713          	addi	a4,a4,-56 # 80005c34 <ticks>
    80002c74:	00072783          	lw	a5,0(a4)
    80002c78:	00004517          	auipc	a0,0x4
    80002c7c:	0c850513          	addi	a0,a0,200 # 80006d40 <tickslock>
    80002c80:	0017879b          	addiw	a5,a5,1
    80002c84:	00f72023          	sw	a5,0(a4)
    80002c88:	00001097          	auipc	ra,0x1
    80002c8c:	540080e7          	jalr	1344(ra) # 800041c8 <release>
    80002c90:	f65ff06f          	j	80002bf4 <kerneltrap+0x8c>
    80002c94:	00001097          	auipc	ra,0x1
    80002c98:	09c080e7          	jalr	156(ra) # 80003d30 <uartintr>
    80002c9c:	fa5ff06f          	j	80002c40 <kerneltrap+0xd8>
    80002ca0:	00002517          	auipc	a0,0x2
    80002ca4:	4e050513          	addi	a0,a0,1248 # 80005180 <_ZZ12printIntegermE6digits+0xc0>
    80002ca8:	00000097          	auipc	ra,0x0
    80002cac:	724080e7          	jalr	1828(ra) # 800033cc <panic>

0000000080002cb0 <clockintr>:
    80002cb0:	fe010113          	addi	sp,sp,-32
    80002cb4:	00813823          	sd	s0,16(sp)
    80002cb8:	00913423          	sd	s1,8(sp)
    80002cbc:	00113c23          	sd	ra,24(sp)
    80002cc0:	02010413          	addi	s0,sp,32
    80002cc4:	00004497          	auipc	s1,0x4
    80002cc8:	07c48493          	addi	s1,s1,124 # 80006d40 <tickslock>
    80002ccc:	00048513          	mv	a0,s1
    80002cd0:	00001097          	auipc	ra,0x1
    80002cd4:	42c080e7          	jalr	1068(ra) # 800040fc <acquire>
    80002cd8:	00003717          	auipc	a4,0x3
    80002cdc:	f5c70713          	addi	a4,a4,-164 # 80005c34 <ticks>
    80002ce0:	00072783          	lw	a5,0(a4)
    80002ce4:	01013403          	ld	s0,16(sp)
    80002ce8:	01813083          	ld	ra,24(sp)
    80002cec:	00048513          	mv	a0,s1
    80002cf0:	0017879b          	addiw	a5,a5,1
    80002cf4:	00813483          	ld	s1,8(sp)
    80002cf8:	00f72023          	sw	a5,0(a4)
    80002cfc:	02010113          	addi	sp,sp,32
    80002d00:	00001317          	auipc	t1,0x1
    80002d04:	4c830067          	jr	1224(t1) # 800041c8 <release>

0000000080002d08 <devintr>:
    80002d08:	142027f3          	csrr	a5,scause
    80002d0c:	00000513          	li	a0,0
    80002d10:	0007c463          	bltz	a5,80002d18 <devintr+0x10>
    80002d14:	00008067          	ret
    80002d18:	fe010113          	addi	sp,sp,-32
    80002d1c:	00813823          	sd	s0,16(sp)
    80002d20:	00113c23          	sd	ra,24(sp)
    80002d24:	00913423          	sd	s1,8(sp)
    80002d28:	02010413          	addi	s0,sp,32
    80002d2c:	0ff7f713          	andi	a4,a5,255
    80002d30:	00900693          	li	a3,9
    80002d34:	04d70c63          	beq	a4,a3,80002d8c <devintr+0x84>
    80002d38:	fff00713          	li	a4,-1
    80002d3c:	03f71713          	slli	a4,a4,0x3f
    80002d40:	00170713          	addi	a4,a4,1
    80002d44:	00e78c63          	beq	a5,a4,80002d5c <devintr+0x54>
    80002d48:	01813083          	ld	ra,24(sp)
    80002d4c:	01013403          	ld	s0,16(sp)
    80002d50:	00813483          	ld	s1,8(sp)
    80002d54:	02010113          	addi	sp,sp,32
    80002d58:	00008067          	ret
    80002d5c:	00000097          	auipc	ra,0x0
    80002d60:	c8c080e7          	jalr	-884(ra) # 800029e8 <cpuid>
    80002d64:	06050663          	beqz	a0,80002dd0 <devintr+0xc8>
    80002d68:	144027f3          	csrr	a5,sip
    80002d6c:	ffd7f793          	andi	a5,a5,-3
    80002d70:	14479073          	csrw	sip,a5
    80002d74:	01813083          	ld	ra,24(sp)
    80002d78:	01013403          	ld	s0,16(sp)
    80002d7c:	00813483          	ld	s1,8(sp)
    80002d80:	00200513          	li	a0,2
    80002d84:	02010113          	addi	sp,sp,32
    80002d88:	00008067          	ret
    80002d8c:	00000097          	auipc	ra,0x0
    80002d90:	258080e7          	jalr	600(ra) # 80002fe4 <plic_claim>
    80002d94:	00a00793          	li	a5,10
    80002d98:	00050493          	mv	s1,a0
    80002d9c:	06f50663          	beq	a0,a5,80002e08 <devintr+0x100>
    80002da0:	00100513          	li	a0,1
    80002da4:	fa0482e3          	beqz	s1,80002d48 <devintr+0x40>
    80002da8:	00048593          	mv	a1,s1
    80002dac:	00002517          	auipc	a0,0x2
    80002db0:	3f450513          	addi	a0,a0,1012 # 800051a0 <_ZZ12printIntegermE6digits+0xe0>
    80002db4:	00000097          	auipc	ra,0x0
    80002db8:	674080e7          	jalr	1652(ra) # 80003428 <__printf>
    80002dbc:	00048513          	mv	a0,s1
    80002dc0:	00000097          	auipc	ra,0x0
    80002dc4:	25c080e7          	jalr	604(ra) # 8000301c <plic_complete>
    80002dc8:	00100513          	li	a0,1
    80002dcc:	f7dff06f          	j	80002d48 <devintr+0x40>
    80002dd0:	00004517          	auipc	a0,0x4
    80002dd4:	f7050513          	addi	a0,a0,-144 # 80006d40 <tickslock>
    80002dd8:	00001097          	auipc	ra,0x1
    80002ddc:	324080e7          	jalr	804(ra) # 800040fc <acquire>
    80002de0:	00003717          	auipc	a4,0x3
    80002de4:	e5470713          	addi	a4,a4,-428 # 80005c34 <ticks>
    80002de8:	00072783          	lw	a5,0(a4)
    80002dec:	00004517          	auipc	a0,0x4
    80002df0:	f5450513          	addi	a0,a0,-172 # 80006d40 <tickslock>
    80002df4:	0017879b          	addiw	a5,a5,1
    80002df8:	00f72023          	sw	a5,0(a4)
    80002dfc:	00001097          	auipc	ra,0x1
    80002e00:	3cc080e7          	jalr	972(ra) # 800041c8 <release>
    80002e04:	f65ff06f          	j	80002d68 <devintr+0x60>
    80002e08:	00001097          	auipc	ra,0x1
    80002e0c:	f28080e7          	jalr	-216(ra) # 80003d30 <uartintr>
    80002e10:	fadff06f          	j	80002dbc <devintr+0xb4>
	...

0000000080002e20 <kernelvec>:
    80002e20:	f0010113          	addi	sp,sp,-256
    80002e24:	00113023          	sd	ra,0(sp)
    80002e28:	00213423          	sd	sp,8(sp)
    80002e2c:	00313823          	sd	gp,16(sp)
    80002e30:	00413c23          	sd	tp,24(sp)
    80002e34:	02513023          	sd	t0,32(sp)
    80002e38:	02613423          	sd	t1,40(sp)
    80002e3c:	02713823          	sd	t2,48(sp)
    80002e40:	02813c23          	sd	s0,56(sp)
    80002e44:	04913023          	sd	s1,64(sp)
    80002e48:	04a13423          	sd	a0,72(sp)
    80002e4c:	04b13823          	sd	a1,80(sp)
    80002e50:	04c13c23          	sd	a2,88(sp)
    80002e54:	06d13023          	sd	a3,96(sp)
    80002e58:	06e13423          	sd	a4,104(sp)
    80002e5c:	06f13823          	sd	a5,112(sp)
    80002e60:	07013c23          	sd	a6,120(sp)
    80002e64:	09113023          	sd	a7,128(sp)
    80002e68:	09213423          	sd	s2,136(sp)
    80002e6c:	09313823          	sd	s3,144(sp)
    80002e70:	09413c23          	sd	s4,152(sp)
    80002e74:	0b513023          	sd	s5,160(sp)
    80002e78:	0b613423          	sd	s6,168(sp)
    80002e7c:	0b713823          	sd	s7,176(sp)
    80002e80:	0b813c23          	sd	s8,184(sp)
    80002e84:	0d913023          	sd	s9,192(sp)
    80002e88:	0da13423          	sd	s10,200(sp)
    80002e8c:	0db13823          	sd	s11,208(sp)
    80002e90:	0dc13c23          	sd	t3,216(sp)
    80002e94:	0fd13023          	sd	t4,224(sp)
    80002e98:	0fe13423          	sd	t5,232(sp)
    80002e9c:	0ff13823          	sd	t6,240(sp)
    80002ea0:	cc9ff0ef          	jal	ra,80002b68 <kerneltrap>
    80002ea4:	00013083          	ld	ra,0(sp)
    80002ea8:	00813103          	ld	sp,8(sp)
    80002eac:	01013183          	ld	gp,16(sp)
    80002eb0:	02013283          	ld	t0,32(sp)
    80002eb4:	02813303          	ld	t1,40(sp)
    80002eb8:	03013383          	ld	t2,48(sp)
    80002ebc:	03813403          	ld	s0,56(sp)
    80002ec0:	04013483          	ld	s1,64(sp)
    80002ec4:	04813503          	ld	a0,72(sp)
    80002ec8:	05013583          	ld	a1,80(sp)
    80002ecc:	05813603          	ld	a2,88(sp)
    80002ed0:	06013683          	ld	a3,96(sp)
    80002ed4:	06813703          	ld	a4,104(sp)
    80002ed8:	07013783          	ld	a5,112(sp)
    80002edc:	07813803          	ld	a6,120(sp)
    80002ee0:	08013883          	ld	a7,128(sp)
    80002ee4:	08813903          	ld	s2,136(sp)
    80002ee8:	09013983          	ld	s3,144(sp)
    80002eec:	09813a03          	ld	s4,152(sp)
    80002ef0:	0a013a83          	ld	s5,160(sp)
    80002ef4:	0a813b03          	ld	s6,168(sp)
    80002ef8:	0b013b83          	ld	s7,176(sp)
    80002efc:	0b813c03          	ld	s8,184(sp)
    80002f00:	0c013c83          	ld	s9,192(sp)
    80002f04:	0c813d03          	ld	s10,200(sp)
    80002f08:	0d013d83          	ld	s11,208(sp)
    80002f0c:	0d813e03          	ld	t3,216(sp)
    80002f10:	0e013e83          	ld	t4,224(sp)
    80002f14:	0e813f03          	ld	t5,232(sp)
    80002f18:	0f013f83          	ld	t6,240(sp)
    80002f1c:	10010113          	addi	sp,sp,256
    80002f20:	10200073          	sret
    80002f24:	00000013          	nop
    80002f28:	00000013          	nop
    80002f2c:	00000013          	nop

0000000080002f30 <timervec>:
    80002f30:	34051573          	csrrw	a0,mscratch,a0
    80002f34:	00b53023          	sd	a1,0(a0)
    80002f38:	00c53423          	sd	a2,8(a0)
    80002f3c:	00d53823          	sd	a3,16(a0)
    80002f40:	01853583          	ld	a1,24(a0)
    80002f44:	02053603          	ld	a2,32(a0)
    80002f48:	0005b683          	ld	a3,0(a1)
    80002f4c:	00c686b3          	add	a3,a3,a2
    80002f50:	00d5b023          	sd	a3,0(a1)
    80002f54:	00200593          	li	a1,2
    80002f58:	14459073          	csrw	sip,a1
    80002f5c:	01053683          	ld	a3,16(a0)
    80002f60:	00853603          	ld	a2,8(a0)
    80002f64:	00053583          	ld	a1,0(a0)
    80002f68:	34051573          	csrrw	a0,mscratch,a0
    80002f6c:	30200073          	mret

0000000080002f70 <plicinit>:
    80002f70:	ff010113          	addi	sp,sp,-16
    80002f74:	00813423          	sd	s0,8(sp)
    80002f78:	01010413          	addi	s0,sp,16
    80002f7c:	00813403          	ld	s0,8(sp)
    80002f80:	0c0007b7          	lui	a5,0xc000
    80002f84:	00100713          	li	a4,1
    80002f88:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    80002f8c:	00e7a223          	sw	a4,4(a5)
    80002f90:	01010113          	addi	sp,sp,16
    80002f94:	00008067          	ret

0000000080002f98 <plicinithart>:
    80002f98:	ff010113          	addi	sp,sp,-16
    80002f9c:	00813023          	sd	s0,0(sp)
    80002fa0:	00113423          	sd	ra,8(sp)
    80002fa4:	01010413          	addi	s0,sp,16
    80002fa8:	00000097          	auipc	ra,0x0
    80002fac:	a40080e7          	jalr	-1472(ra) # 800029e8 <cpuid>
    80002fb0:	0085171b          	slliw	a4,a0,0x8
    80002fb4:	0c0027b7          	lui	a5,0xc002
    80002fb8:	00e787b3          	add	a5,a5,a4
    80002fbc:	40200713          	li	a4,1026
    80002fc0:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80002fc4:	00813083          	ld	ra,8(sp)
    80002fc8:	00013403          	ld	s0,0(sp)
    80002fcc:	00d5151b          	slliw	a0,a0,0xd
    80002fd0:	0c2017b7          	lui	a5,0xc201
    80002fd4:	00a78533          	add	a0,a5,a0
    80002fd8:	00052023          	sw	zero,0(a0)
    80002fdc:	01010113          	addi	sp,sp,16
    80002fe0:	00008067          	ret

0000000080002fe4 <plic_claim>:
    80002fe4:	ff010113          	addi	sp,sp,-16
    80002fe8:	00813023          	sd	s0,0(sp)
    80002fec:	00113423          	sd	ra,8(sp)
    80002ff0:	01010413          	addi	s0,sp,16
    80002ff4:	00000097          	auipc	ra,0x0
    80002ff8:	9f4080e7          	jalr	-1548(ra) # 800029e8 <cpuid>
    80002ffc:	00813083          	ld	ra,8(sp)
    80003000:	00013403          	ld	s0,0(sp)
    80003004:	00d5151b          	slliw	a0,a0,0xd
    80003008:	0c2017b7          	lui	a5,0xc201
    8000300c:	00a78533          	add	a0,a5,a0
    80003010:	00452503          	lw	a0,4(a0)
    80003014:	01010113          	addi	sp,sp,16
    80003018:	00008067          	ret

000000008000301c <plic_complete>:
    8000301c:	fe010113          	addi	sp,sp,-32
    80003020:	00813823          	sd	s0,16(sp)
    80003024:	00913423          	sd	s1,8(sp)
    80003028:	00113c23          	sd	ra,24(sp)
    8000302c:	02010413          	addi	s0,sp,32
    80003030:	00050493          	mv	s1,a0
    80003034:	00000097          	auipc	ra,0x0
    80003038:	9b4080e7          	jalr	-1612(ra) # 800029e8 <cpuid>
    8000303c:	01813083          	ld	ra,24(sp)
    80003040:	01013403          	ld	s0,16(sp)
    80003044:	00d5179b          	slliw	a5,a0,0xd
    80003048:	0c201737          	lui	a4,0xc201
    8000304c:	00f707b3          	add	a5,a4,a5
    80003050:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80003054:	00813483          	ld	s1,8(sp)
    80003058:	02010113          	addi	sp,sp,32
    8000305c:	00008067          	ret

0000000080003060 <consolewrite>:
    80003060:	fb010113          	addi	sp,sp,-80
    80003064:	04813023          	sd	s0,64(sp)
    80003068:	04113423          	sd	ra,72(sp)
    8000306c:	02913c23          	sd	s1,56(sp)
    80003070:	03213823          	sd	s2,48(sp)
    80003074:	03313423          	sd	s3,40(sp)
    80003078:	03413023          	sd	s4,32(sp)
    8000307c:	01513c23          	sd	s5,24(sp)
    80003080:	05010413          	addi	s0,sp,80
    80003084:	06c05c63          	blez	a2,800030fc <consolewrite+0x9c>
    80003088:	00060993          	mv	s3,a2
    8000308c:	00050a13          	mv	s4,a0
    80003090:	00058493          	mv	s1,a1
    80003094:	00000913          	li	s2,0
    80003098:	fff00a93          	li	s5,-1
    8000309c:	01c0006f          	j	800030b8 <consolewrite+0x58>
    800030a0:	fbf44503          	lbu	a0,-65(s0)
    800030a4:	0019091b          	addiw	s2,s2,1
    800030a8:	00148493          	addi	s1,s1,1
    800030ac:	00001097          	auipc	ra,0x1
    800030b0:	a9c080e7          	jalr	-1380(ra) # 80003b48 <uartputc>
    800030b4:	03298063          	beq	s3,s2,800030d4 <consolewrite+0x74>
    800030b8:	00048613          	mv	a2,s1
    800030bc:	00100693          	li	a3,1
    800030c0:	000a0593          	mv	a1,s4
    800030c4:	fbf40513          	addi	a0,s0,-65
    800030c8:	00000097          	auipc	ra,0x0
    800030cc:	9d8080e7          	jalr	-1576(ra) # 80002aa0 <either_copyin>
    800030d0:	fd5518e3          	bne	a0,s5,800030a0 <consolewrite+0x40>
    800030d4:	04813083          	ld	ra,72(sp)
    800030d8:	04013403          	ld	s0,64(sp)
    800030dc:	03813483          	ld	s1,56(sp)
    800030e0:	02813983          	ld	s3,40(sp)
    800030e4:	02013a03          	ld	s4,32(sp)
    800030e8:	01813a83          	ld	s5,24(sp)
    800030ec:	00090513          	mv	a0,s2
    800030f0:	03013903          	ld	s2,48(sp)
    800030f4:	05010113          	addi	sp,sp,80
    800030f8:	00008067          	ret
    800030fc:	00000913          	li	s2,0
    80003100:	fd5ff06f          	j	800030d4 <consolewrite+0x74>

0000000080003104 <consoleread>:
    80003104:	f9010113          	addi	sp,sp,-112
    80003108:	06813023          	sd	s0,96(sp)
    8000310c:	04913c23          	sd	s1,88(sp)
    80003110:	05213823          	sd	s2,80(sp)
    80003114:	05313423          	sd	s3,72(sp)
    80003118:	05413023          	sd	s4,64(sp)
    8000311c:	03513c23          	sd	s5,56(sp)
    80003120:	03613823          	sd	s6,48(sp)
    80003124:	03713423          	sd	s7,40(sp)
    80003128:	03813023          	sd	s8,32(sp)
    8000312c:	06113423          	sd	ra,104(sp)
    80003130:	01913c23          	sd	s9,24(sp)
    80003134:	07010413          	addi	s0,sp,112
    80003138:	00060b93          	mv	s7,a2
    8000313c:	00050913          	mv	s2,a0
    80003140:	00058c13          	mv	s8,a1
    80003144:	00060b1b          	sext.w	s6,a2
    80003148:	00004497          	auipc	s1,0x4
    8000314c:	c2048493          	addi	s1,s1,-992 # 80006d68 <cons>
    80003150:	00400993          	li	s3,4
    80003154:	fff00a13          	li	s4,-1
    80003158:	00a00a93          	li	s5,10
    8000315c:	05705e63          	blez	s7,800031b8 <consoleread+0xb4>
    80003160:	09c4a703          	lw	a4,156(s1)
    80003164:	0984a783          	lw	a5,152(s1)
    80003168:	0007071b          	sext.w	a4,a4
    8000316c:	08e78463          	beq	a5,a4,800031f4 <consoleread+0xf0>
    80003170:	07f7f713          	andi	a4,a5,127
    80003174:	00e48733          	add	a4,s1,a4
    80003178:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    8000317c:	0017869b          	addiw	a3,a5,1
    80003180:	08d4ac23          	sw	a3,152(s1)
    80003184:	00070c9b          	sext.w	s9,a4
    80003188:	0b370663          	beq	a4,s3,80003234 <consoleread+0x130>
    8000318c:	00100693          	li	a3,1
    80003190:	f9f40613          	addi	a2,s0,-97
    80003194:	000c0593          	mv	a1,s8
    80003198:	00090513          	mv	a0,s2
    8000319c:	f8e40fa3          	sb	a4,-97(s0)
    800031a0:	00000097          	auipc	ra,0x0
    800031a4:	8b4080e7          	jalr	-1868(ra) # 80002a54 <either_copyout>
    800031a8:	01450863          	beq	a0,s4,800031b8 <consoleread+0xb4>
    800031ac:	001c0c13          	addi	s8,s8,1
    800031b0:	fffb8b9b          	addiw	s7,s7,-1
    800031b4:	fb5c94e3          	bne	s9,s5,8000315c <consoleread+0x58>
    800031b8:	000b851b          	sext.w	a0,s7
    800031bc:	06813083          	ld	ra,104(sp)
    800031c0:	06013403          	ld	s0,96(sp)
    800031c4:	05813483          	ld	s1,88(sp)
    800031c8:	05013903          	ld	s2,80(sp)
    800031cc:	04813983          	ld	s3,72(sp)
    800031d0:	04013a03          	ld	s4,64(sp)
    800031d4:	03813a83          	ld	s5,56(sp)
    800031d8:	02813b83          	ld	s7,40(sp)
    800031dc:	02013c03          	ld	s8,32(sp)
    800031e0:	01813c83          	ld	s9,24(sp)
    800031e4:	40ab053b          	subw	a0,s6,a0
    800031e8:	03013b03          	ld	s6,48(sp)
    800031ec:	07010113          	addi	sp,sp,112
    800031f0:	00008067          	ret
    800031f4:	00001097          	auipc	ra,0x1
    800031f8:	1d8080e7          	jalr	472(ra) # 800043cc <push_on>
    800031fc:	0984a703          	lw	a4,152(s1)
    80003200:	09c4a783          	lw	a5,156(s1)
    80003204:	0007879b          	sext.w	a5,a5
    80003208:	fef70ce3          	beq	a4,a5,80003200 <consoleread+0xfc>
    8000320c:	00001097          	auipc	ra,0x1
    80003210:	234080e7          	jalr	564(ra) # 80004440 <pop_on>
    80003214:	0984a783          	lw	a5,152(s1)
    80003218:	07f7f713          	andi	a4,a5,127
    8000321c:	00e48733          	add	a4,s1,a4
    80003220:	01874703          	lbu	a4,24(a4)
    80003224:	0017869b          	addiw	a3,a5,1
    80003228:	08d4ac23          	sw	a3,152(s1)
    8000322c:	00070c9b          	sext.w	s9,a4
    80003230:	f5371ee3          	bne	a4,s3,8000318c <consoleread+0x88>
    80003234:	000b851b          	sext.w	a0,s7
    80003238:	f96bf2e3          	bgeu	s7,s6,800031bc <consoleread+0xb8>
    8000323c:	08f4ac23          	sw	a5,152(s1)
    80003240:	f7dff06f          	j	800031bc <consoleread+0xb8>

0000000080003244 <consputc>:
    80003244:	10000793          	li	a5,256
    80003248:	00f50663          	beq	a0,a5,80003254 <consputc+0x10>
    8000324c:	00001317          	auipc	t1,0x1
    80003250:	9f430067          	jr	-1548(t1) # 80003c40 <uartputc_sync>
    80003254:	ff010113          	addi	sp,sp,-16
    80003258:	00113423          	sd	ra,8(sp)
    8000325c:	00813023          	sd	s0,0(sp)
    80003260:	01010413          	addi	s0,sp,16
    80003264:	00800513          	li	a0,8
    80003268:	00001097          	auipc	ra,0x1
    8000326c:	9d8080e7          	jalr	-1576(ra) # 80003c40 <uartputc_sync>
    80003270:	02000513          	li	a0,32
    80003274:	00001097          	auipc	ra,0x1
    80003278:	9cc080e7          	jalr	-1588(ra) # 80003c40 <uartputc_sync>
    8000327c:	00013403          	ld	s0,0(sp)
    80003280:	00813083          	ld	ra,8(sp)
    80003284:	00800513          	li	a0,8
    80003288:	01010113          	addi	sp,sp,16
    8000328c:	00001317          	auipc	t1,0x1
    80003290:	9b430067          	jr	-1612(t1) # 80003c40 <uartputc_sync>

0000000080003294 <consoleintr>:
    80003294:	fe010113          	addi	sp,sp,-32
    80003298:	00813823          	sd	s0,16(sp)
    8000329c:	00913423          	sd	s1,8(sp)
    800032a0:	01213023          	sd	s2,0(sp)
    800032a4:	00113c23          	sd	ra,24(sp)
    800032a8:	02010413          	addi	s0,sp,32
    800032ac:	00004917          	auipc	s2,0x4
    800032b0:	abc90913          	addi	s2,s2,-1348 # 80006d68 <cons>
    800032b4:	00050493          	mv	s1,a0
    800032b8:	00090513          	mv	a0,s2
    800032bc:	00001097          	auipc	ra,0x1
    800032c0:	e40080e7          	jalr	-448(ra) # 800040fc <acquire>
    800032c4:	02048c63          	beqz	s1,800032fc <consoleintr+0x68>
    800032c8:	0a092783          	lw	a5,160(s2)
    800032cc:	09892703          	lw	a4,152(s2)
    800032d0:	07f00693          	li	a3,127
    800032d4:	40e7873b          	subw	a4,a5,a4
    800032d8:	02e6e263          	bltu	a3,a4,800032fc <consoleintr+0x68>
    800032dc:	00d00713          	li	a4,13
    800032e0:	04e48063          	beq	s1,a4,80003320 <consoleintr+0x8c>
    800032e4:	07f7f713          	andi	a4,a5,127
    800032e8:	00e90733          	add	a4,s2,a4
    800032ec:	0017879b          	addiw	a5,a5,1
    800032f0:	0af92023          	sw	a5,160(s2)
    800032f4:	00970c23          	sb	s1,24(a4)
    800032f8:	08f92e23          	sw	a5,156(s2)
    800032fc:	01013403          	ld	s0,16(sp)
    80003300:	01813083          	ld	ra,24(sp)
    80003304:	00813483          	ld	s1,8(sp)
    80003308:	00013903          	ld	s2,0(sp)
    8000330c:	00004517          	auipc	a0,0x4
    80003310:	a5c50513          	addi	a0,a0,-1444 # 80006d68 <cons>
    80003314:	02010113          	addi	sp,sp,32
    80003318:	00001317          	auipc	t1,0x1
    8000331c:	eb030067          	jr	-336(t1) # 800041c8 <release>
    80003320:	00a00493          	li	s1,10
    80003324:	fc1ff06f          	j	800032e4 <consoleintr+0x50>

0000000080003328 <consoleinit>:
    80003328:	fe010113          	addi	sp,sp,-32
    8000332c:	00113c23          	sd	ra,24(sp)
    80003330:	00813823          	sd	s0,16(sp)
    80003334:	00913423          	sd	s1,8(sp)
    80003338:	02010413          	addi	s0,sp,32
    8000333c:	00004497          	auipc	s1,0x4
    80003340:	a2c48493          	addi	s1,s1,-1492 # 80006d68 <cons>
    80003344:	00048513          	mv	a0,s1
    80003348:	00002597          	auipc	a1,0x2
    8000334c:	eb058593          	addi	a1,a1,-336 # 800051f8 <_ZZ12printIntegermE6digits+0x138>
    80003350:	00001097          	auipc	ra,0x1
    80003354:	d88080e7          	jalr	-632(ra) # 800040d8 <initlock>
    80003358:	00000097          	auipc	ra,0x0
    8000335c:	7ac080e7          	jalr	1964(ra) # 80003b04 <uartinit>
    80003360:	01813083          	ld	ra,24(sp)
    80003364:	01013403          	ld	s0,16(sp)
    80003368:	00000797          	auipc	a5,0x0
    8000336c:	d9c78793          	addi	a5,a5,-612 # 80003104 <consoleread>
    80003370:	0af4bc23          	sd	a5,184(s1)
    80003374:	00000797          	auipc	a5,0x0
    80003378:	cec78793          	addi	a5,a5,-788 # 80003060 <consolewrite>
    8000337c:	0cf4b023          	sd	a5,192(s1)
    80003380:	00813483          	ld	s1,8(sp)
    80003384:	02010113          	addi	sp,sp,32
    80003388:	00008067          	ret

000000008000338c <console_read>:
    8000338c:	ff010113          	addi	sp,sp,-16
    80003390:	00813423          	sd	s0,8(sp)
    80003394:	01010413          	addi	s0,sp,16
    80003398:	00813403          	ld	s0,8(sp)
    8000339c:	00004317          	auipc	t1,0x4
    800033a0:	a8433303          	ld	t1,-1404(t1) # 80006e20 <devsw+0x10>
    800033a4:	01010113          	addi	sp,sp,16
    800033a8:	00030067          	jr	t1

00000000800033ac <console_write>:
    800033ac:	ff010113          	addi	sp,sp,-16
    800033b0:	00813423          	sd	s0,8(sp)
    800033b4:	01010413          	addi	s0,sp,16
    800033b8:	00813403          	ld	s0,8(sp)
    800033bc:	00004317          	auipc	t1,0x4
    800033c0:	a6c33303          	ld	t1,-1428(t1) # 80006e28 <devsw+0x18>
    800033c4:	01010113          	addi	sp,sp,16
    800033c8:	00030067          	jr	t1

00000000800033cc <panic>:
    800033cc:	fe010113          	addi	sp,sp,-32
    800033d0:	00113c23          	sd	ra,24(sp)
    800033d4:	00813823          	sd	s0,16(sp)
    800033d8:	00913423          	sd	s1,8(sp)
    800033dc:	02010413          	addi	s0,sp,32
    800033e0:	00050493          	mv	s1,a0
    800033e4:	00002517          	auipc	a0,0x2
    800033e8:	e1c50513          	addi	a0,a0,-484 # 80005200 <_ZZ12printIntegermE6digits+0x140>
    800033ec:	00004797          	auipc	a5,0x4
    800033f0:	ac07ae23          	sw	zero,-1316(a5) # 80006ec8 <pr+0x18>
    800033f4:	00000097          	auipc	ra,0x0
    800033f8:	034080e7          	jalr	52(ra) # 80003428 <__printf>
    800033fc:	00048513          	mv	a0,s1
    80003400:	00000097          	auipc	ra,0x0
    80003404:	028080e7          	jalr	40(ra) # 80003428 <__printf>
    80003408:	00002517          	auipc	a0,0x2
    8000340c:	c8850513          	addi	a0,a0,-888 # 80005090 <kvmincrease+0x500>
    80003410:	00000097          	auipc	ra,0x0
    80003414:	018080e7          	jalr	24(ra) # 80003428 <__printf>
    80003418:	00100793          	li	a5,1
    8000341c:	00003717          	auipc	a4,0x3
    80003420:	80f72e23          	sw	a5,-2020(a4) # 80005c38 <panicked>
    80003424:	0000006f          	j	80003424 <panic+0x58>

0000000080003428 <__printf>:
    80003428:	f3010113          	addi	sp,sp,-208
    8000342c:	08813023          	sd	s0,128(sp)
    80003430:	07313423          	sd	s3,104(sp)
    80003434:	09010413          	addi	s0,sp,144
    80003438:	05813023          	sd	s8,64(sp)
    8000343c:	08113423          	sd	ra,136(sp)
    80003440:	06913c23          	sd	s1,120(sp)
    80003444:	07213823          	sd	s2,112(sp)
    80003448:	07413023          	sd	s4,96(sp)
    8000344c:	05513c23          	sd	s5,88(sp)
    80003450:	05613823          	sd	s6,80(sp)
    80003454:	05713423          	sd	s7,72(sp)
    80003458:	03913c23          	sd	s9,56(sp)
    8000345c:	03a13823          	sd	s10,48(sp)
    80003460:	03b13423          	sd	s11,40(sp)
    80003464:	00004317          	auipc	t1,0x4
    80003468:	a4c30313          	addi	t1,t1,-1460 # 80006eb0 <pr>
    8000346c:	01832c03          	lw	s8,24(t1)
    80003470:	00b43423          	sd	a1,8(s0)
    80003474:	00c43823          	sd	a2,16(s0)
    80003478:	00d43c23          	sd	a3,24(s0)
    8000347c:	02e43023          	sd	a4,32(s0)
    80003480:	02f43423          	sd	a5,40(s0)
    80003484:	03043823          	sd	a6,48(s0)
    80003488:	03143c23          	sd	a7,56(s0)
    8000348c:	00050993          	mv	s3,a0
    80003490:	4a0c1663          	bnez	s8,8000393c <__printf+0x514>
    80003494:	60098c63          	beqz	s3,80003aac <__printf+0x684>
    80003498:	0009c503          	lbu	a0,0(s3)
    8000349c:	00840793          	addi	a5,s0,8
    800034a0:	f6f43c23          	sd	a5,-136(s0)
    800034a4:	00000493          	li	s1,0
    800034a8:	22050063          	beqz	a0,800036c8 <__printf+0x2a0>
    800034ac:	00002a37          	lui	s4,0x2
    800034b0:	00018ab7          	lui	s5,0x18
    800034b4:	000f4b37          	lui	s6,0xf4
    800034b8:	00989bb7          	lui	s7,0x989
    800034bc:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    800034c0:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    800034c4:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    800034c8:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    800034cc:	00148c9b          	addiw	s9,s1,1
    800034d0:	02500793          	li	a5,37
    800034d4:	01998933          	add	s2,s3,s9
    800034d8:	38f51263          	bne	a0,a5,8000385c <__printf+0x434>
    800034dc:	00094783          	lbu	a5,0(s2)
    800034e0:	00078c9b          	sext.w	s9,a5
    800034e4:	1e078263          	beqz	a5,800036c8 <__printf+0x2a0>
    800034e8:	0024849b          	addiw	s1,s1,2
    800034ec:	07000713          	li	a4,112
    800034f0:	00998933          	add	s2,s3,s1
    800034f4:	38e78a63          	beq	a5,a4,80003888 <__printf+0x460>
    800034f8:	20f76863          	bltu	a4,a5,80003708 <__printf+0x2e0>
    800034fc:	42a78863          	beq	a5,a0,8000392c <__printf+0x504>
    80003500:	06400713          	li	a4,100
    80003504:	40e79663          	bne	a5,a4,80003910 <__printf+0x4e8>
    80003508:	f7843783          	ld	a5,-136(s0)
    8000350c:	0007a603          	lw	a2,0(a5)
    80003510:	00878793          	addi	a5,a5,8
    80003514:	f6f43c23          	sd	a5,-136(s0)
    80003518:	42064a63          	bltz	a2,8000394c <__printf+0x524>
    8000351c:	00a00713          	li	a4,10
    80003520:	02e677bb          	remuw	a5,a2,a4
    80003524:	00002d97          	auipc	s11,0x2
    80003528:	d04d8d93          	addi	s11,s11,-764 # 80005228 <digits>
    8000352c:	00900593          	li	a1,9
    80003530:	0006051b          	sext.w	a0,a2
    80003534:	00000c93          	li	s9,0
    80003538:	02079793          	slli	a5,a5,0x20
    8000353c:	0207d793          	srli	a5,a5,0x20
    80003540:	00fd87b3          	add	a5,s11,a5
    80003544:	0007c783          	lbu	a5,0(a5)
    80003548:	02e656bb          	divuw	a3,a2,a4
    8000354c:	f8f40023          	sb	a5,-128(s0)
    80003550:	14c5d863          	bge	a1,a2,800036a0 <__printf+0x278>
    80003554:	06300593          	li	a1,99
    80003558:	00100c93          	li	s9,1
    8000355c:	02e6f7bb          	remuw	a5,a3,a4
    80003560:	02079793          	slli	a5,a5,0x20
    80003564:	0207d793          	srli	a5,a5,0x20
    80003568:	00fd87b3          	add	a5,s11,a5
    8000356c:	0007c783          	lbu	a5,0(a5)
    80003570:	02e6d73b          	divuw	a4,a3,a4
    80003574:	f8f400a3          	sb	a5,-127(s0)
    80003578:	12a5f463          	bgeu	a1,a0,800036a0 <__printf+0x278>
    8000357c:	00a00693          	li	a3,10
    80003580:	00900593          	li	a1,9
    80003584:	02d777bb          	remuw	a5,a4,a3
    80003588:	02079793          	slli	a5,a5,0x20
    8000358c:	0207d793          	srli	a5,a5,0x20
    80003590:	00fd87b3          	add	a5,s11,a5
    80003594:	0007c503          	lbu	a0,0(a5)
    80003598:	02d757bb          	divuw	a5,a4,a3
    8000359c:	f8a40123          	sb	a0,-126(s0)
    800035a0:	48e5f263          	bgeu	a1,a4,80003a24 <__printf+0x5fc>
    800035a4:	06300513          	li	a0,99
    800035a8:	02d7f5bb          	remuw	a1,a5,a3
    800035ac:	02059593          	slli	a1,a1,0x20
    800035b0:	0205d593          	srli	a1,a1,0x20
    800035b4:	00bd85b3          	add	a1,s11,a1
    800035b8:	0005c583          	lbu	a1,0(a1)
    800035bc:	02d7d7bb          	divuw	a5,a5,a3
    800035c0:	f8b401a3          	sb	a1,-125(s0)
    800035c4:	48e57263          	bgeu	a0,a4,80003a48 <__printf+0x620>
    800035c8:	3e700513          	li	a0,999
    800035cc:	02d7f5bb          	remuw	a1,a5,a3
    800035d0:	02059593          	slli	a1,a1,0x20
    800035d4:	0205d593          	srli	a1,a1,0x20
    800035d8:	00bd85b3          	add	a1,s11,a1
    800035dc:	0005c583          	lbu	a1,0(a1)
    800035e0:	02d7d7bb          	divuw	a5,a5,a3
    800035e4:	f8b40223          	sb	a1,-124(s0)
    800035e8:	46e57663          	bgeu	a0,a4,80003a54 <__printf+0x62c>
    800035ec:	02d7f5bb          	remuw	a1,a5,a3
    800035f0:	02059593          	slli	a1,a1,0x20
    800035f4:	0205d593          	srli	a1,a1,0x20
    800035f8:	00bd85b3          	add	a1,s11,a1
    800035fc:	0005c583          	lbu	a1,0(a1)
    80003600:	02d7d7bb          	divuw	a5,a5,a3
    80003604:	f8b402a3          	sb	a1,-123(s0)
    80003608:	46ea7863          	bgeu	s4,a4,80003a78 <__printf+0x650>
    8000360c:	02d7f5bb          	remuw	a1,a5,a3
    80003610:	02059593          	slli	a1,a1,0x20
    80003614:	0205d593          	srli	a1,a1,0x20
    80003618:	00bd85b3          	add	a1,s11,a1
    8000361c:	0005c583          	lbu	a1,0(a1)
    80003620:	02d7d7bb          	divuw	a5,a5,a3
    80003624:	f8b40323          	sb	a1,-122(s0)
    80003628:	3eeaf863          	bgeu	s5,a4,80003a18 <__printf+0x5f0>
    8000362c:	02d7f5bb          	remuw	a1,a5,a3
    80003630:	02059593          	slli	a1,a1,0x20
    80003634:	0205d593          	srli	a1,a1,0x20
    80003638:	00bd85b3          	add	a1,s11,a1
    8000363c:	0005c583          	lbu	a1,0(a1)
    80003640:	02d7d7bb          	divuw	a5,a5,a3
    80003644:	f8b403a3          	sb	a1,-121(s0)
    80003648:	42eb7e63          	bgeu	s6,a4,80003a84 <__printf+0x65c>
    8000364c:	02d7f5bb          	remuw	a1,a5,a3
    80003650:	02059593          	slli	a1,a1,0x20
    80003654:	0205d593          	srli	a1,a1,0x20
    80003658:	00bd85b3          	add	a1,s11,a1
    8000365c:	0005c583          	lbu	a1,0(a1)
    80003660:	02d7d7bb          	divuw	a5,a5,a3
    80003664:	f8b40423          	sb	a1,-120(s0)
    80003668:	42ebfc63          	bgeu	s7,a4,80003aa0 <__printf+0x678>
    8000366c:	02079793          	slli	a5,a5,0x20
    80003670:	0207d793          	srli	a5,a5,0x20
    80003674:	00fd8db3          	add	s11,s11,a5
    80003678:	000dc703          	lbu	a4,0(s11)
    8000367c:	00a00793          	li	a5,10
    80003680:	00900c93          	li	s9,9
    80003684:	f8e404a3          	sb	a4,-119(s0)
    80003688:	00065c63          	bgez	a2,800036a0 <__printf+0x278>
    8000368c:	f9040713          	addi	a4,s0,-112
    80003690:	00f70733          	add	a4,a4,a5
    80003694:	02d00693          	li	a3,45
    80003698:	fed70823          	sb	a3,-16(a4)
    8000369c:	00078c93          	mv	s9,a5
    800036a0:	f8040793          	addi	a5,s0,-128
    800036a4:	01978cb3          	add	s9,a5,s9
    800036a8:	f7f40d13          	addi	s10,s0,-129
    800036ac:	000cc503          	lbu	a0,0(s9)
    800036b0:	fffc8c93          	addi	s9,s9,-1
    800036b4:	00000097          	auipc	ra,0x0
    800036b8:	b90080e7          	jalr	-1136(ra) # 80003244 <consputc>
    800036bc:	ffac98e3          	bne	s9,s10,800036ac <__printf+0x284>
    800036c0:	00094503          	lbu	a0,0(s2)
    800036c4:	e00514e3          	bnez	a0,800034cc <__printf+0xa4>
    800036c8:	1a0c1663          	bnez	s8,80003874 <__printf+0x44c>
    800036cc:	08813083          	ld	ra,136(sp)
    800036d0:	08013403          	ld	s0,128(sp)
    800036d4:	07813483          	ld	s1,120(sp)
    800036d8:	07013903          	ld	s2,112(sp)
    800036dc:	06813983          	ld	s3,104(sp)
    800036e0:	06013a03          	ld	s4,96(sp)
    800036e4:	05813a83          	ld	s5,88(sp)
    800036e8:	05013b03          	ld	s6,80(sp)
    800036ec:	04813b83          	ld	s7,72(sp)
    800036f0:	04013c03          	ld	s8,64(sp)
    800036f4:	03813c83          	ld	s9,56(sp)
    800036f8:	03013d03          	ld	s10,48(sp)
    800036fc:	02813d83          	ld	s11,40(sp)
    80003700:	0d010113          	addi	sp,sp,208
    80003704:	00008067          	ret
    80003708:	07300713          	li	a4,115
    8000370c:	1ce78a63          	beq	a5,a4,800038e0 <__printf+0x4b8>
    80003710:	07800713          	li	a4,120
    80003714:	1ee79e63          	bne	a5,a4,80003910 <__printf+0x4e8>
    80003718:	f7843783          	ld	a5,-136(s0)
    8000371c:	0007a703          	lw	a4,0(a5)
    80003720:	00878793          	addi	a5,a5,8
    80003724:	f6f43c23          	sd	a5,-136(s0)
    80003728:	28074263          	bltz	a4,800039ac <__printf+0x584>
    8000372c:	00002d97          	auipc	s11,0x2
    80003730:	afcd8d93          	addi	s11,s11,-1284 # 80005228 <digits>
    80003734:	00f77793          	andi	a5,a4,15
    80003738:	00fd87b3          	add	a5,s11,a5
    8000373c:	0007c683          	lbu	a3,0(a5)
    80003740:	00f00613          	li	a2,15
    80003744:	0007079b          	sext.w	a5,a4
    80003748:	f8d40023          	sb	a3,-128(s0)
    8000374c:	0047559b          	srliw	a1,a4,0x4
    80003750:	0047569b          	srliw	a3,a4,0x4
    80003754:	00000c93          	li	s9,0
    80003758:	0ee65063          	bge	a2,a4,80003838 <__printf+0x410>
    8000375c:	00f6f693          	andi	a3,a3,15
    80003760:	00dd86b3          	add	a3,s11,a3
    80003764:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80003768:	0087d79b          	srliw	a5,a5,0x8
    8000376c:	00100c93          	li	s9,1
    80003770:	f8d400a3          	sb	a3,-127(s0)
    80003774:	0cb67263          	bgeu	a2,a1,80003838 <__printf+0x410>
    80003778:	00f7f693          	andi	a3,a5,15
    8000377c:	00dd86b3          	add	a3,s11,a3
    80003780:	0006c583          	lbu	a1,0(a3)
    80003784:	00f00613          	li	a2,15
    80003788:	0047d69b          	srliw	a3,a5,0x4
    8000378c:	f8b40123          	sb	a1,-126(s0)
    80003790:	0047d593          	srli	a1,a5,0x4
    80003794:	28f67e63          	bgeu	a2,a5,80003a30 <__printf+0x608>
    80003798:	00f6f693          	andi	a3,a3,15
    8000379c:	00dd86b3          	add	a3,s11,a3
    800037a0:	0006c503          	lbu	a0,0(a3)
    800037a4:	0087d813          	srli	a6,a5,0x8
    800037a8:	0087d69b          	srliw	a3,a5,0x8
    800037ac:	f8a401a3          	sb	a0,-125(s0)
    800037b0:	28b67663          	bgeu	a2,a1,80003a3c <__printf+0x614>
    800037b4:	00f6f693          	andi	a3,a3,15
    800037b8:	00dd86b3          	add	a3,s11,a3
    800037bc:	0006c583          	lbu	a1,0(a3)
    800037c0:	00c7d513          	srli	a0,a5,0xc
    800037c4:	00c7d69b          	srliw	a3,a5,0xc
    800037c8:	f8b40223          	sb	a1,-124(s0)
    800037cc:	29067a63          	bgeu	a2,a6,80003a60 <__printf+0x638>
    800037d0:	00f6f693          	andi	a3,a3,15
    800037d4:	00dd86b3          	add	a3,s11,a3
    800037d8:	0006c583          	lbu	a1,0(a3)
    800037dc:	0107d813          	srli	a6,a5,0x10
    800037e0:	0107d69b          	srliw	a3,a5,0x10
    800037e4:	f8b402a3          	sb	a1,-123(s0)
    800037e8:	28a67263          	bgeu	a2,a0,80003a6c <__printf+0x644>
    800037ec:	00f6f693          	andi	a3,a3,15
    800037f0:	00dd86b3          	add	a3,s11,a3
    800037f4:	0006c683          	lbu	a3,0(a3)
    800037f8:	0147d79b          	srliw	a5,a5,0x14
    800037fc:	f8d40323          	sb	a3,-122(s0)
    80003800:	21067663          	bgeu	a2,a6,80003a0c <__printf+0x5e4>
    80003804:	02079793          	slli	a5,a5,0x20
    80003808:	0207d793          	srli	a5,a5,0x20
    8000380c:	00fd8db3          	add	s11,s11,a5
    80003810:	000dc683          	lbu	a3,0(s11)
    80003814:	00800793          	li	a5,8
    80003818:	00700c93          	li	s9,7
    8000381c:	f8d403a3          	sb	a3,-121(s0)
    80003820:	00075c63          	bgez	a4,80003838 <__printf+0x410>
    80003824:	f9040713          	addi	a4,s0,-112
    80003828:	00f70733          	add	a4,a4,a5
    8000382c:	02d00693          	li	a3,45
    80003830:	fed70823          	sb	a3,-16(a4)
    80003834:	00078c93          	mv	s9,a5
    80003838:	f8040793          	addi	a5,s0,-128
    8000383c:	01978cb3          	add	s9,a5,s9
    80003840:	f7f40d13          	addi	s10,s0,-129
    80003844:	000cc503          	lbu	a0,0(s9)
    80003848:	fffc8c93          	addi	s9,s9,-1
    8000384c:	00000097          	auipc	ra,0x0
    80003850:	9f8080e7          	jalr	-1544(ra) # 80003244 <consputc>
    80003854:	ff9d18e3          	bne	s10,s9,80003844 <__printf+0x41c>
    80003858:	0100006f          	j	80003868 <__printf+0x440>
    8000385c:	00000097          	auipc	ra,0x0
    80003860:	9e8080e7          	jalr	-1560(ra) # 80003244 <consputc>
    80003864:	000c8493          	mv	s1,s9
    80003868:	00094503          	lbu	a0,0(s2)
    8000386c:	c60510e3          	bnez	a0,800034cc <__printf+0xa4>
    80003870:	e40c0ee3          	beqz	s8,800036cc <__printf+0x2a4>
    80003874:	00003517          	auipc	a0,0x3
    80003878:	63c50513          	addi	a0,a0,1596 # 80006eb0 <pr>
    8000387c:	00001097          	auipc	ra,0x1
    80003880:	94c080e7          	jalr	-1716(ra) # 800041c8 <release>
    80003884:	e49ff06f          	j	800036cc <__printf+0x2a4>
    80003888:	f7843783          	ld	a5,-136(s0)
    8000388c:	03000513          	li	a0,48
    80003890:	01000d13          	li	s10,16
    80003894:	00878713          	addi	a4,a5,8
    80003898:	0007bc83          	ld	s9,0(a5)
    8000389c:	f6e43c23          	sd	a4,-136(s0)
    800038a0:	00000097          	auipc	ra,0x0
    800038a4:	9a4080e7          	jalr	-1628(ra) # 80003244 <consputc>
    800038a8:	07800513          	li	a0,120
    800038ac:	00000097          	auipc	ra,0x0
    800038b0:	998080e7          	jalr	-1640(ra) # 80003244 <consputc>
    800038b4:	00002d97          	auipc	s11,0x2
    800038b8:	974d8d93          	addi	s11,s11,-1676 # 80005228 <digits>
    800038bc:	03ccd793          	srli	a5,s9,0x3c
    800038c0:	00fd87b3          	add	a5,s11,a5
    800038c4:	0007c503          	lbu	a0,0(a5)
    800038c8:	fffd0d1b          	addiw	s10,s10,-1
    800038cc:	004c9c93          	slli	s9,s9,0x4
    800038d0:	00000097          	auipc	ra,0x0
    800038d4:	974080e7          	jalr	-1676(ra) # 80003244 <consputc>
    800038d8:	fe0d12e3          	bnez	s10,800038bc <__printf+0x494>
    800038dc:	f8dff06f          	j	80003868 <__printf+0x440>
    800038e0:	f7843783          	ld	a5,-136(s0)
    800038e4:	0007bc83          	ld	s9,0(a5)
    800038e8:	00878793          	addi	a5,a5,8
    800038ec:	f6f43c23          	sd	a5,-136(s0)
    800038f0:	000c9a63          	bnez	s9,80003904 <__printf+0x4dc>
    800038f4:	1080006f          	j	800039fc <__printf+0x5d4>
    800038f8:	001c8c93          	addi	s9,s9,1
    800038fc:	00000097          	auipc	ra,0x0
    80003900:	948080e7          	jalr	-1720(ra) # 80003244 <consputc>
    80003904:	000cc503          	lbu	a0,0(s9)
    80003908:	fe0518e3          	bnez	a0,800038f8 <__printf+0x4d0>
    8000390c:	f5dff06f          	j	80003868 <__printf+0x440>
    80003910:	02500513          	li	a0,37
    80003914:	00000097          	auipc	ra,0x0
    80003918:	930080e7          	jalr	-1744(ra) # 80003244 <consputc>
    8000391c:	000c8513          	mv	a0,s9
    80003920:	00000097          	auipc	ra,0x0
    80003924:	924080e7          	jalr	-1756(ra) # 80003244 <consputc>
    80003928:	f41ff06f          	j	80003868 <__printf+0x440>
    8000392c:	02500513          	li	a0,37
    80003930:	00000097          	auipc	ra,0x0
    80003934:	914080e7          	jalr	-1772(ra) # 80003244 <consputc>
    80003938:	f31ff06f          	j	80003868 <__printf+0x440>
    8000393c:	00030513          	mv	a0,t1
    80003940:	00000097          	auipc	ra,0x0
    80003944:	7bc080e7          	jalr	1980(ra) # 800040fc <acquire>
    80003948:	b4dff06f          	j	80003494 <__printf+0x6c>
    8000394c:	40c0053b          	negw	a0,a2
    80003950:	00a00713          	li	a4,10
    80003954:	02e576bb          	remuw	a3,a0,a4
    80003958:	00002d97          	auipc	s11,0x2
    8000395c:	8d0d8d93          	addi	s11,s11,-1840 # 80005228 <digits>
    80003960:	ff700593          	li	a1,-9
    80003964:	02069693          	slli	a3,a3,0x20
    80003968:	0206d693          	srli	a3,a3,0x20
    8000396c:	00dd86b3          	add	a3,s11,a3
    80003970:	0006c683          	lbu	a3,0(a3)
    80003974:	02e557bb          	divuw	a5,a0,a4
    80003978:	f8d40023          	sb	a3,-128(s0)
    8000397c:	10b65e63          	bge	a2,a1,80003a98 <__printf+0x670>
    80003980:	06300593          	li	a1,99
    80003984:	02e7f6bb          	remuw	a3,a5,a4
    80003988:	02069693          	slli	a3,a3,0x20
    8000398c:	0206d693          	srli	a3,a3,0x20
    80003990:	00dd86b3          	add	a3,s11,a3
    80003994:	0006c683          	lbu	a3,0(a3)
    80003998:	02e7d73b          	divuw	a4,a5,a4
    8000399c:	00200793          	li	a5,2
    800039a0:	f8d400a3          	sb	a3,-127(s0)
    800039a4:	bca5ece3          	bltu	a1,a0,8000357c <__printf+0x154>
    800039a8:	ce5ff06f          	j	8000368c <__printf+0x264>
    800039ac:	40e007bb          	negw	a5,a4
    800039b0:	00002d97          	auipc	s11,0x2
    800039b4:	878d8d93          	addi	s11,s11,-1928 # 80005228 <digits>
    800039b8:	00f7f693          	andi	a3,a5,15
    800039bc:	00dd86b3          	add	a3,s11,a3
    800039c0:	0006c583          	lbu	a1,0(a3)
    800039c4:	ff100613          	li	a2,-15
    800039c8:	0047d69b          	srliw	a3,a5,0x4
    800039cc:	f8b40023          	sb	a1,-128(s0)
    800039d0:	0047d59b          	srliw	a1,a5,0x4
    800039d4:	0ac75e63          	bge	a4,a2,80003a90 <__printf+0x668>
    800039d8:	00f6f693          	andi	a3,a3,15
    800039dc:	00dd86b3          	add	a3,s11,a3
    800039e0:	0006c603          	lbu	a2,0(a3)
    800039e4:	00f00693          	li	a3,15
    800039e8:	0087d79b          	srliw	a5,a5,0x8
    800039ec:	f8c400a3          	sb	a2,-127(s0)
    800039f0:	d8b6e4e3          	bltu	a3,a1,80003778 <__printf+0x350>
    800039f4:	00200793          	li	a5,2
    800039f8:	e2dff06f          	j	80003824 <__printf+0x3fc>
    800039fc:	00002c97          	auipc	s9,0x2
    80003a00:	80cc8c93          	addi	s9,s9,-2036 # 80005208 <_ZZ12printIntegermE6digits+0x148>
    80003a04:	02800513          	li	a0,40
    80003a08:	ef1ff06f          	j	800038f8 <__printf+0x4d0>
    80003a0c:	00700793          	li	a5,7
    80003a10:	00600c93          	li	s9,6
    80003a14:	e0dff06f          	j	80003820 <__printf+0x3f8>
    80003a18:	00700793          	li	a5,7
    80003a1c:	00600c93          	li	s9,6
    80003a20:	c69ff06f          	j	80003688 <__printf+0x260>
    80003a24:	00300793          	li	a5,3
    80003a28:	00200c93          	li	s9,2
    80003a2c:	c5dff06f          	j	80003688 <__printf+0x260>
    80003a30:	00300793          	li	a5,3
    80003a34:	00200c93          	li	s9,2
    80003a38:	de9ff06f          	j	80003820 <__printf+0x3f8>
    80003a3c:	00400793          	li	a5,4
    80003a40:	00300c93          	li	s9,3
    80003a44:	dddff06f          	j	80003820 <__printf+0x3f8>
    80003a48:	00400793          	li	a5,4
    80003a4c:	00300c93          	li	s9,3
    80003a50:	c39ff06f          	j	80003688 <__printf+0x260>
    80003a54:	00500793          	li	a5,5
    80003a58:	00400c93          	li	s9,4
    80003a5c:	c2dff06f          	j	80003688 <__printf+0x260>
    80003a60:	00500793          	li	a5,5
    80003a64:	00400c93          	li	s9,4
    80003a68:	db9ff06f          	j	80003820 <__printf+0x3f8>
    80003a6c:	00600793          	li	a5,6
    80003a70:	00500c93          	li	s9,5
    80003a74:	dadff06f          	j	80003820 <__printf+0x3f8>
    80003a78:	00600793          	li	a5,6
    80003a7c:	00500c93          	li	s9,5
    80003a80:	c09ff06f          	j	80003688 <__printf+0x260>
    80003a84:	00800793          	li	a5,8
    80003a88:	00700c93          	li	s9,7
    80003a8c:	bfdff06f          	j	80003688 <__printf+0x260>
    80003a90:	00100793          	li	a5,1
    80003a94:	d91ff06f          	j	80003824 <__printf+0x3fc>
    80003a98:	00100793          	li	a5,1
    80003a9c:	bf1ff06f          	j	8000368c <__printf+0x264>
    80003aa0:	00900793          	li	a5,9
    80003aa4:	00800c93          	li	s9,8
    80003aa8:	be1ff06f          	j	80003688 <__printf+0x260>
    80003aac:	00001517          	auipc	a0,0x1
    80003ab0:	76450513          	addi	a0,a0,1892 # 80005210 <_ZZ12printIntegermE6digits+0x150>
    80003ab4:	00000097          	auipc	ra,0x0
    80003ab8:	918080e7          	jalr	-1768(ra) # 800033cc <panic>

0000000080003abc <printfinit>:
    80003abc:	fe010113          	addi	sp,sp,-32
    80003ac0:	00813823          	sd	s0,16(sp)
    80003ac4:	00913423          	sd	s1,8(sp)
    80003ac8:	00113c23          	sd	ra,24(sp)
    80003acc:	02010413          	addi	s0,sp,32
    80003ad0:	00003497          	auipc	s1,0x3
    80003ad4:	3e048493          	addi	s1,s1,992 # 80006eb0 <pr>
    80003ad8:	00048513          	mv	a0,s1
    80003adc:	00001597          	auipc	a1,0x1
    80003ae0:	74458593          	addi	a1,a1,1860 # 80005220 <_ZZ12printIntegermE6digits+0x160>
    80003ae4:	00000097          	auipc	ra,0x0
    80003ae8:	5f4080e7          	jalr	1524(ra) # 800040d8 <initlock>
    80003aec:	01813083          	ld	ra,24(sp)
    80003af0:	01013403          	ld	s0,16(sp)
    80003af4:	0004ac23          	sw	zero,24(s1)
    80003af8:	00813483          	ld	s1,8(sp)
    80003afc:	02010113          	addi	sp,sp,32
    80003b00:	00008067          	ret

0000000080003b04 <uartinit>:
    80003b04:	ff010113          	addi	sp,sp,-16
    80003b08:	00813423          	sd	s0,8(sp)
    80003b0c:	01010413          	addi	s0,sp,16
    80003b10:	100007b7          	lui	a5,0x10000
    80003b14:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80003b18:	f8000713          	li	a4,-128
    80003b1c:	00e781a3          	sb	a4,3(a5)
    80003b20:	00300713          	li	a4,3
    80003b24:	00e78023          	sb	a4,0(a5)
    80003b28:	000780a3          	sb	zero,1(a5)
    80003b2c:	00e781a3          	sb	a4,3(a5)
    80003b30:	00700693          	li	a3,7
    80003b34:	00d78123          	sb	a3,2(a5)
    80003b38:	00e780a3          	sb	a4,1(a5)
    80003b3c:	00813403          	ld	s0,8(sp)
    80003b40:	01010113          	addi	sp,sp,16
    80003b44:	00008067          	ret

0000000080003b48 <uartputc>:
    80003b48:	00002797          	auipc	a5,0x2
    80003b4c:	0f07a783          	lw	a5,240(a5) # 80005c38 <panicked>
    80003b50:	00078463          	beqz	a5,80003b58 <uartputc+0x10>
    80003b54:	0000006f          	j	80003b54 <uartputc+0xc>
    80003b58:	fd010113          	addi	sp,sp,-48
    80003b5c:	02813023          	sd	s0,32(sp)
    80003b60:	00913c23          	sd	s1,24(sp)
    80003b64:	01213823          	sd	s2,16(sp)
    80003b68:	01313423          	sd	s3,8(sp)
    80003b6c:	02113423          	sd	ra,40(sp)
    80003b70:	03010413          	addi	s0,sp,48
    80003b74:	00002917          	auipc	s2,0x2
    80003b78:	0cc90913          	addi	s2,s2,204 # 80005c40 <uart_tx_r>
    80003b7c:	00093783          	ld	a5,0(s2)
    80003b80:	00002497          	auipc	s1,0x2
    80003b84:	0c848493          	addi	s1,s1,200 # 80005c48 <uart_tx_w>
    80003b88:	0004b703          	ld	a4,0(s1)
    80003b8c:	02078693          	addi	a3,a5,32
    80003b90:	00050993          	mv	s3,a0
    80003b94:	02e69c63          	bne	a3,a4,80003bcc <uartputc+0x84>
    80003b98:	00001097          	auipc	ra,0x1
    80003b9c:	834080e7          	jalr	-1996(ra) # 800043cc <push_on>
    80003ba0:	00093783          	ld	a5,0(s2)
    80003ba4:	0004b703          	ld	a4,0(s1)
    80003ba8:	02078793          	addi	a5,a5,32
    80003bac:	00e79463          	bne	a5,a4,80003bb4 <uartputc+0x6c>
    80003bb0:	0000006f          	j	80003bb0 <uartputc+0x68>
    80003bb4:	00001097          	auipc	ra,0x1
    80003bb8:	88c080e7          	jalr	-1908(ra) # 80004440 <pop_on>
    80003bbc:	00093783          	ld	a5,0(s2)
    80003bc0:	0004b703          	ld	a4,0(s1)
    80003bc4:	02078693          	addi	a3,a5,32
    80003bc8:	fce688e3          	beq	a3,a4,80003b98 <uartputc+0x50>
    80003bcc:	01f77693          	andi	a3,a4,31
    80003bd0:	00003597          	auipc	a1,0x3
    80003bd4:	30058593          	addi	a1,a1,768 # 80006ed0 <uart_tx_buf>
    80003bd8:	00d586b3          	add	a3,a1,a3
    80003bdc:	00170713          	addi	a4,a4,1
    80003be0:	01368023          	sb	s3,0(a3)
    80003be4:	00e4b023          	sd	a4,0(s1)
    80003be8:	10000637          	lui	a2,0x10000
    80003bec:	02f71063          	bne	a4,a5,80003c0c <uartputc+0xc4>
    80003bf0:	0340006f          	j	80003c24 <uartputc+0xdc>
    80003bf4:	00074703          	lbu	a4,0(a4)
    80003bf8:	00f93023          	sd	a5,0(s2)
    80003bfc:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80003c00:	00093783          	ld	a5,0(s2)
    80003c04:	0004b703          	ld	a4,0(s1)
    80003c08:	00f70e63          	beq	a4,a5,80003c24 <uartputc+0xdc>
    80003c0c:	00564683          	lbu	a3,5(a2)
    80003c10:	01f7f713          	andi	a4,a5,31
    80003c14:	00e58733          	add	a4,a1,a4
    80003c18:	0206f693          	andi	a3,a3,32
    80003c1c:	00178793          	addi	a5,a5,1
    80003c20:	fc069ae3          	bnez	a3,80003bf4 <uartputc+0xac>
    80003c24:	02813083          	ld	ra,40(sp)
    80003c28:	02013403          	ld	s0,32(sp)
    80003c2c:	01813483          	ld	s1,24(sp)
    80003c30:	01013903          	ld	s2,16(sp)
    80003c34:	00813983          	ld	s3,8(sp)
    80003c38:	03010113          	addi	sp,sp,48
    80003c3c:	00008067          	ret

0000000080003c40 <uartputc_sync>:
    80003c40:	ff010113          	addi	sp,sp,-16
    80003c44:	00813423          	sd	s0,8(sp)
    80003c48:	01010413          	addi	s0,sp,16
    80003c4c:	00002717          	auipc	a4,0x2
    80003c50:	fec72703          	lw	a4,-20(a4) # 80005c38 <panicked>
    80003c54:	02071663          	bnez	a4,80003c80 <uartputc_sync+0x40>
    80003c58:	00050793          	mv	a5,a0
    80003c5c:	100006b7          	lui	a3,0x10000
    80003c60:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80003c64:	02077713          	andi	a4,a4,32
    80003c68:	fe070ce3          	beqz	a4,80003c60 <uartputc_sync+0x20>
    80003c6c:	0ff7f793          	andi	a5,a5,255
    80003c70:	00f68023          	sb	a5,0(a3)
    80003c74:	00813403          	ld	s0,8(sp)
    80003c78:	01010113          	addi	sp,sp,16
    80003c7c:	00008067          	ret
    80003c80:	0000006f          	j	80003c80 <uartputc_sync+0x40>

0000000080003c84 <uartstart>:
    80003c84:	ff010113          	addi	sp,sp,-16
    80003c88:	00813423          	sd	s0,8(sp)
    80003c8c:	01010413          	addi	s0,sp,16
    80003c90:	00002617          	auipc	a2,0x2
    80003c94:	fb060613          	addi	a2,a2,-80 # 80005c40 <uart_tx_r>
    80003c98:	00002517          	auipc	a0,0x2
    80003c9c:	fb050513          	addi	a0,a0,-80 # 80005c48 <uart_tx_w>
    80003ca0:	00063783          	ld	a5,0(a2)
    80003ca4:	00053703          	ld	a4,0(a0)
    80003ca8:	04f70263          	beq	a4,a5,80003cec <uartstart+0x68>
    80003cac:	100005b7          	lui	a1,0x10000
    80003cb0:	00003817          	auipc	a6,0x3
    80003cb4:	22080813          	addi	a6,a6,544 # 80006ed0 <uart_tx_buf>
    80003cb8:	01c0006f          	j	80003cd4 <uartstart+0x50>
    80003cbc:	0006c703          	lbu	a4,0(a3)
    80003cc0:	00f63023          	sd	a5,0(a2)
    80003cc4:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80003cc8:	00063783          	ld	a5,0(a2)
    80003ccc:	00053703          	ld	a4,0(a0)
    80003cd0:	00f70e63          	beq	a4,a5,80003cec <uartstart+0x68>
    80003cd4:	01f7f713          	andi	a4,a5,31
    80003cd8:	00e806b3          	add	a3,a6,a4
    80003cdc:	0055c703          	lbu	a4,5(a1)
    80003ce0:	00178793          	addi	a5,a5,1
    80003ce4:	02077713          	andi	a4,a4,32
    80003ce8:	fc071ae3          	bnez	a4,80003cbc <uartstart+0x38>
    80003cec:	00813403          	ld	s0,8(sp)
    80003cf0:	01010113          	addi	sp,sp,16
    80003cf4:	00008067          	ret

0000000080003cf8 <uartgetc>:
    80003cf8:	ff010113          	addi	sp,sp,-16
    80003cfc:	00813423          	sd	s0,8(sp)
    80003d00:	01010413          	addi	s0,sp,16
    80003d04:	10000737          	lui	a4,0x10000
    80003d08:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80003d0c:	0017f793          	andi	a5,a5,1
    80003d10:	00078c63          	beqz	a5,80003d28 <uartgetc+0x30>
    80003d14:	00074503          	lbu	a0,0(a4)
    80003d18:	0ff57513          	andi	a0,a0,255
    80003d1c:	00813403          	ld	s0,8(sp)
    80003d20:	01010113          	addi	sp,sp,16
    80003d24:	00008067          	ret
    80003d28:	fff00513          	li	a0,-1
    80003d2c:	ff1ff06f          	j	80003d1c <uartgetc+0x24>

0000000080003d30 <uartintr>:
    80003d30:	100007b7          	lui	a5,0x10000
    80003d34:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80003d38:	0017f793          	andi	a5,a5,1
    80003d3c:	0a078463          	beqz	a5,80003de4 <uartintr+0xb4>
    80003d40:	fe010113          	addi	sp,sp,-32
    80003d44:	00813823          	sd	s0,16(sp)
    80003d48:	00913423          	sd	s1,8(sp)
    80003d4c:	00113c23          	sd	ra,24(sp)
    80003d50:	02010413          	addi	s0,sp,32
    80003d54:	100004b7          	lui	s1,0x10000
    80003d58:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    80003d5c:	0ff57513          	andi	a0,a0,255
    80003d60:	fffff097          	auipc	ra,0xfffff
    80003d64:	534080e7          	jalr	1332(ra) # 80003294 <consoleintr>
    80003d68:	0054c783          	lbu	a5,5(s1)
    80003d6c:	0017f793          	andi	a5,a5,1
    80003d70:	fe0794e3          	bnez	a5,80003d58 <uartintr+0x28>
    80003d74:	00002617          	auipc	a2,0x2
    80003d78:	ecc60613          	addi	a2,a2,-308 # 80005c40 <uart_tx_r>
    80003d7c:	00002517          	auipc	a0,0x2
    80003d80:	ecc50513          	addi	a0,a0,-308 # 80005c48 <uart_tx_w>
    80003d84:	00063783          	ld	a5,0(a2)
    80003d88:	00053703          	ld	a4,0(a0)
    80003d8c:	04f70263          	beq	a4,a5,80003dd0 <uartintr+0xa0>
    80003d90:	100005b7          	lui	a1,0x10000
    80003d94:	00003817          	auipc	a6,0x3
    80003d98:	13c80813          	addi	a6,a6,316 # 80006ed0 <uart_tx_buf>
    80003d9c:	01c0006f          	j	80003db8 <uartintr+0x88>
    80003da0:	0006c703          	lbu	a4,0(a3)
    80003da4:	00f63023          	sd	a5,0(a2)
    80003da8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80003dac:	00063783          	ld	a5,0(a2)
    80003db0:	00053703          	ld	a4,0(a0)
    80003db4:	00f70e63          	beq	a4,a5,80003dd0 <uartintr+0xa0>
    80003db8:	01f7f713          	andi	a4,a5,31
    80003dbc:	00e806b3          	add	a3,a6,a4
    80003dc0:	0055c703          	lbu	a4,5(a1)
    80003dc4:	00178793          	addi	a5,a5,1
    80003dc8:	02077713          	andi	a4,a4,32
    80003dcc:	fc071ae3          	bnez	a4,80003da0 <uartintr+0x70>
    80003dd0:	01813083          	ld	ra,24(sp)
    80003dd4:	01013403          	ld	s0,16(sp)
    80003dd8:	00813483          	ld	s1,8(sp)
    80003ddc:	02010113          	addi	sp,sp,32
    80003de0:	00008067          	ret
    80003de4:	00002617          	auipc	a2,0x2
    80003de8:	e5c60613          	addi	a2,a2,-420 # 80005c40 <uart_tx_r>
    80003dec:	00002517          	auipc	a0,0x2
    80003df0:	e5c50513          	addi	a0,a0,-420 # 80005c48 <uart_tx_w>
    80003df4:	00063783          	ld	a5,0(a2)
    80003df8:	00053703          	ld	a4,0(a0)
    80003dfc:	04f70263          	beq	a4,a5,80003e40 <uartintr+0x110>
    80003e00:	100005b7          	lui	a1,0x10000
    80003e04:	00003817          	auipc	a6,0x3
    80003e08:	0cc80813          	addi	a6,a6,204 # 80006ed0 <uart_tx_buf>
    80003e0c:	01c0006f          	j	80003e28 <uartintr+0xf8>
    80003e10:	0006c703          	lbu	a4,0(a3)
    80003e14:	00f63023          	sd	a5,0(a2)
    80003e18:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80003e1c:	00063783          	ld	a5,0(a2)
    80003e20:	00053703          	ld	a4,0(a0)
    80003e24:	02f70063          	beq	a4,a5,80003e44 <uartintr+0x114>
    80003e28:	01f7f713          	andi	a4,a5,31
    80003e2c:	00e806b3          	add	a3,a6,a4
    80003e30:	0055c703          	lbu	a4,5(a1)
    80003e34:	00178793          	addi	a5,a5,1
    80003e38:	02077713          	andi	a4,a4,32
    80003e3c:	fc071ae3          	bnez	a4,80003e10 <uartintr+0xe0>
    80003e40:	00008067          	ret
    80003e44:	00008067          	ret

0000000080003e48 <kinit>:
    80003e48:	fc010113          	addi	sp,sp,-64
    80003e4c:	02913423          	sd	s1,40(sp)
    80003e50:	fffff7b7          	lui	a5,0xfffff
    80003e54:	00004497          	auipc	s1,0x4
    80003e58:	0ab48493          	addi	s1,s1,171 # 80007eff <end+0xfff>
    80003e5c:	02813823          	sd	s0,48(sp)
    80003e60:	01313c23          	sd	s3,24(sp)
    80003e64:	00f4f4b3          	and	s1,s1,a5
    80003e68:	02113c23          	sd	ra,56(sp)
    80003e6c:	03213023          	sd	s2,32(sp)
    80003e70:	01413823          	sd	s4,16(sp)
    80003e74:	01513423          	sd	s5,8(sp)
    80003e78:	04010413          	addi	s0,sp,64
    80003e7c:	000017b7          	lui	a5,0x1
    80003e80:	01100993          	li	s3,17
    80003e84:	00f487b3          	add	a5,s1,a5
    80003e88:	01b99993          	slli	s3,s3,0x1b
    80003e8c:	06f9e063          	bltu	s3,a5,80003eec <kinit+0xa4>
    80003e90:	00003a97          	auipc	s5,0x3
    80003e94:	070a8a93          	addi	s5,s5,112 # 80006f00 <end>
    80003e98:	0754ec63          	bltu	s1,s5,80003f10 <kinit+0xc8>
    80003e9c:	0734fa63          	bgeu	s1,s3,80003f10 <kinit+0xc8>
    80003ea0:	00088a37          	lui	s4,0x88
    80003ea4:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80003ea8:	00002917          	auipc	s2,0x2
    80003eac:	da890913          	addi	s2,s2,-600 # 80005c50 <kmem>
    80003eb0:	00ca1a13          	slli	s4,s4,0xc
    80003eb4:	0140006f          	j	80003ec8 <kinit+0x80>
    80003eb8:	000017b7          	lui	a5,0x1
    80003ebc:	00f484b3          	add	s1,s1,a5
    80003ec0:	0554e863          	bltu	s1,s5,80003f10 <kinit+0xc8>
    80003ec4:	0534f663          	bgeu	s1,s3,80003f10 <kinit+0xc8>
    80003ec8:	00001637          	lui	a2,0x1
    80003ecc:	00100593          	li	a1,1
    80003ed0:	00048513          	mv	a0,s1
    80003ed4:	00000097          	auipc	ra,0x0
    80003ed8:	5e4080e7          	jalr	1508(ra) # 800044b8 <__memset>
    80003edc:	00093783          	ld	a5,0(s2)
    80003ee0:	00f4b023          	sd	a5,0(s1)
    80003ee4:	00993023          	sd	s1,0(s2)
    80003ee8:	fd4498e3          	bne	s1,s4,80003eb8 <kinit+0x70>
    80003eec:	03813083          	ld	ra,56(sp)
    80003ef0:	03013403          	ld	s0,48(sp)
    80003ef4:	02813483          	ld	s1,40(sp)
    80003ef8:	02013903          	ld	s2,32(sp)
    80003efc:	01813983          	ld	s3,24(sp)
    80003f00:	01013a03          	ld	s4,16(sp)
    80003f04:	00813a83          	ld	s5,8(sp)
    80003f08:	04010113          	addi	sp,sp,64
    80003f0c:	00008067          	ret
    80003f10:	00001517          	auipc	a0,0x1
    80003f14:	33050513          	addi	a0,a0,816 # 80005240 <digits+0x18>
    80003f18:	fffff097          	auipc	ra,0xfffff
    80003f1c:	4b4080e7          	jalr	1204(ra) # 800033cc <panic>

0000000080003f20 <freerange>:
    80003f20:	fc010113          	addi	sp,sp,-64
    80003f24:	000017b7          	lui	a5,0x1
    80003f28:	02913423          	sd	s1,40(sp)
    80003f2c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80003f30:	009504b3          	add	s1,a0,s1
    80003f34:	fffff537          	lui	a0,0xfffff
    80003f38:	02813823          	sd	s0,48(sp)
    80003f3c:	02113c23          	sd	ra,56(sp)
    80003f40:	03213023          	sd	s2,32(sp)
    80003f44:	01313c23          	sd	s3,24(sp)
    80003f48:	01413823          	sd	s4,16(sp)
    80003f4c:	01513423          	sd	s5,8(sp)
    80003f50:	01613023          	sd	s6,0(sp)
    80003f54:	04010413          	addi	s0,sp,64
    80003f58:	00a4f4b3          	and	s1,s1,a0
    80003f5c:	00f487b3          	add	a5,s1,a5
    80003f60:	06f5e463          	bltu	a1,a5,80003fc8 <freerange+0xa8>
    80003f64:	00003a97          	auipc	s5,0x3
    80003f68:	f9ca8a93          	addi	s5,s5,-100 # 80006f00 <end>
    80003f6c:	0954e263          	bltu	s1,s5,80003ff0 <freerange+0xd0>
    80003f70:	01100993          	li	s3,17
    80003f74:	01b99993          	slli	s3,s3,0x1b
    80003f78:	0734fc63          	bgeu	s1,s3,80003ff0 <freerange+0xd0>
    80003f7c:	00058a13          	mv	s4,a1
    80003f80:	00002917          	auipc	s2,0x2
    80003f84:	cd090913          	addi	s2,s2,-816 # 80005c50 <kmem>
    80003f88:	00002b37          	lui	s6,0x2
    80003f8c:	0140006f          	j	80003fa0 <freerange+0x80>
    80003f90:	000017b7          	lui	a5,0x1
    80003f94:	00f484b3          	add	s1,s1,a5
    80003f98:	0554ec63          	bltu	s1,s5,80003ff0 <freerange+0xd0>
    80003f9c:	0534fa63          	bgeu	s1,s3,80003ff0 <freerange+0xd0>
    80003fa0:	00001637          	lui	a2,0x1
    80003fa4:	00100593          	li	a1,1
    80003fa8:	00048513          	mv	a0,s1
    80003fac:	00000097          	auipc	ra,0x0
    80003fb0:	50c080e7          	jalr	1292(ra) # 800044b8 <__memset>
    80003fb4:	00093703          	ld	a4,0(s2)
    80003fb8:	016487b3          	add	a5,s1,s6
    80003fbc:	00e4b023          	sd	a4,0(s1)
    80003fc0:	00993023          	sd	s1,0(s2)
    80003fc4:	fcfa76e3          	bgeu	s4,a5,80003f90 <freerange+0x70>
    80003fc8:	03813083          	ld	ra,56(sp)
    80003fcc:	03013403          	ld	s0,48(sp)
    80003fd0:	02813483          	ld	s1,40(sp)
    80003fd4:	02013903          	ld	s2,32(sp)
    80003fd8:	01813983          	ld	s3,24(sp)
    80003fdc:	01013a03          	ld	s4,16(sp)
    80003fe0:	00813a83          	ld	s5,8(sp)
    80003fe4:	00013b03          	ld	s6,0(sp)
    80003fe8:	04010113          	addi	sp,sp,64
    80003fec:	00008067          	ret
    80003ff0:	00001517          	auipc	a0,0x1
    80003ff4:	25050513          	addi	a0,a0,592 # 80005240 <digits+0x18>
    80003ff8:	fffff097          	auipc	ra,0xfffff
    80003ffc:	3d4080e7          	jalr	980(ra) # 800033cc <panic>

0000000080004000 <kfree>:
    80004000:	fe010113          	addi	sp,sp,-32
    80004004:	00813823          	sd	s0,16(sp)
    80004008:	00113c23          	sd	ra,24(sp)
    8000400c:	00913423          	sd	s1,8(sp)
    80004010:	02010413          	addi	s0,sp,32
    80004014:	03451793          	slli	a5,a0,0x34
    80004018:	04079c63          	bnez	a5,80004070 <kfree+0x70>
    8000401c:	00003797          	auipc	a5,0x3
    80004020:	ee478793          	addi	a5,a5,-284 # 80006f00 <end>
    80004024:	00050493          	mv	s1,a0
    80004028:	04f56463          	bltu	a0,a5,80004070 <kfree+0x70>
    8000402c:	01100793          	li	a5,17
    80004030:	01b79793          	slli	a5,a5,0x1b
    80004034:	02f57e63          	bgeu	a0,a5,80004070 <kfree+0x70>
    80004038:	00001637          	lui	a2,0x1
    8000403c:	00100593          	li	a1,1
    80004040:	00000097          	auipc	ra,0x0
    80004044:	478080e7          	jalr	1144(ra) # 800044b8 <__memset>
    80004048:	00002797          	auipc	a5,0x2
    8000404c:	c0878793          	addi	a5,a5,-1016 # 80005c50 <kmem>
    80004050:	0007b703          	ld	a4,0(a5)
    80004054:	01813083          	ld	ra,24(sp)
    80004058:	01013403          	ld	s0,16(sp)
    8000405c:	00e4b023          	sd	a4,0(s1)
    80004060:	0097b023          	sd	s1,0(a5)
    80004064:	00813483          	ld	s1,8(sp)
    80004068:	02010113          	addi	sp,sp,32
    8000406c:	00008067          	ret
    80004070:	00001517          	auipc	a0,0x1
    80004074:	1d050513          	addi	a0,a0,464 # 80005240 <digits+0x18>
    80004078:	fffff097          	auipc	ra,0xfffff
    8000407c:	354080e7          	jalr	852(ra) # 800033cc <panic>

0000000080004080 <kalloc>:
    80004080:	fe010113          	addi	sp,sp,-32
    80004084:	00813823          	sd	s0,16(sp)
    80004088:	00913423          	sd	s1,8(sp)
    8000408c:	00113c23          	sd	ra,24(sp)
    80004090:	02010413          	addi	s0,sp,32
    80004094:	00002797          	auipc	a5,0x2
    80004098:	bbc78793          	addi	a5,a5,-1092 # 80005c50 <kmem>
    8000409c:	0007b483          	ld	s1,0(a5)
    800040a0:	02048063          	beqz	s1,800040c0 <kalloc+0x40>
    800040a4:	0004b703          	ld	a4,0(s1)
    800040a8:	00001637          	lui	a2,0x1
    800040ac:	00500593          	li	a1,5
    800040b0:	00048513          	mv	a0,s1
    800040b4:	00e7b023          	sd	a4,0(a5)
    800040b8:	00000097          	auipc	ra,0x0
    800040bc:	400080e7          	jalr	1024(ra) # 800044b8 <__memset>
    800040c0:	01813083          	ld	ra,24(sp)
    800040c4:	01013403          	ld	s0,16(sp)
    800040c8:	00048513          	mv	a0,s1
    800040cc:	00813483          	ld	s1,8(sp)
    800040d0:	02010113          	addi	sp,sp,32
    800040d4:	00008067          	ret

00000000800040d8 <initlock>:
    800040d8:	ff010113          	addi	sp,sp,-16
    800040dc:	00813423          	sd	s0,8(sp)
    800040e0:	01010413          	addi	s0,sp,16
    800040e4:	00813403          	ld	s0,8(sp)
    800040e8:	00b53423          	sd	a1,8(a0)
    800040ec:	00052023          	sw	zero,0(a0)
    800040f0:	00053823          	sd	zero,16(a0)
    800040f4:	01010113          	addi	sp,sp,16
    800040f8:	00008067          	ret

00000000800040fc <acquire>:
    800040fc:	fe010113          	addi	sp,sp,-32
    80004100:	00813823          	sd	s0,16(sp)
    80004104:	00913423          	sd	s1,8(sp)
    80004108:	00113c23          	sd	ra,24(sp)
    8000410c:	01213023          	sd	s2,0(sp)
    80004110:	02010413          	addi	s0,sp,32
    80004114:	00050493          	mv	s1,a0
    80004118:	10002973          	csrr	s2,sstatus
    8000411c:	100027f3          	csrr	a5,sstatus
    80004120:	ffd7f793          	andi	a5,a5,-3
    80004124:	10079073          	csrw	sstatus,a5
    80004128:	fffff097          	auipc	ra,0xfffff
    8000412c:	8e0080e7          	jalr	-1824(ra) # 80002a08 <mycpu>
    80004130:	07852783          	lw	a5,120(a0)
    80004134:	06078e63          	beqz	a5,800041b0 <acquire+0xb4>
    80004138:	fffff097          	auipc	ra,0xfffff
    8000413c:	8d0080e7          	jalr	-1840(ra) # 80002a08 <mycpu>
    80004140:	07852783          	lw	a5,120(a0)
    80004144:	0004a703          	lw	a4,0(s1)
    80004148:	0017879b          	addiw	a5,a5,1
    8000414c:	06f52c23          	sw	a5,120(a0)
    80004150:	04071063          	bnez	a4,80004190 <acquire+0x94>
    80004154:	00100713          	li	a4,1
    80004158:	00070793          	mv	a5,a4
    8000415c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80004160:	0007879b          	sext.w	a5,a5
    80004164:	fe079ae3          	bnez	a5,80004158 <acquire+0x5c>
    80004168:	0ff0000f          	fence
    8000416c:	fffff097          	auipc	ra,0xfffff
    80004170:	89c080e7          	jalr	-1892(ra) # 80002a08 <mycpu>
    80004174:	01813083          	ld	ra,24(sp)
    80004178:	01013403          	ld	s0,16(sp)
    8000417c:	00a4b823          	sd	a0,16(s1)
    80004180:	00013903          	ld	s2,0(sp)
    80004184:	00813483          	ld	s1,8(sp)
    80004188:	02010113          	addi	sp,sp,32
    8000418c:	00008067          	ret
    80004190:	0104b903          	ld	s2,16(s1)
    80004194:	fffff097          	auipc	ra,0xfffff
    80004198:	874080e7          	jalr	-1932(ra) # 80002a08 <mycpu>
    8000419c:	faa91ce3          	bne	s2,a0,80004154 <acquire+0x58>
    800041a0:	00001517          	auipc	a0,0x1
    800041a4:	0a850513          	addi	a0,a0,168 # 80005248 <digits+0x20>
    800041a8:	fffff097          	auipc	ra,0xfffff
    800041ac:	224080e7          	jalr	548(ra) # 800033cc <panic>
    800041b0:	00195913          	srli	s2,s2,0x1
    800041b4:	fffff097          	auipc	ra,0xfffff
    800041b8:	854080e7          	jalr	-1964(ra) # 80002a08 <mycpu>
    800041bc:	00197913          	andi	s2,s2,1
    800041c0:	07252e23          	sw	s2,124(a0)
    800041c4:	f75ff06f          	j	80004138 <acquire+0x3c>

00000000800041c8 <release>:
    800041c8:	fe010113          	addi	sp,sp,-32
    800041cc:	00813823          	sd	s0,16(sp)
    800041d0:	00113c23          	sd	ra,24(sp)
    800041d4:	00913423          	sd	s1,8(sp)
    800041d8:	01213023          	sd	s2,0(sp)
    800041dc:	02010413          	addi	s0,sp,32
    800041e0:	00052783          	lw	a5,0(a0)
    800041e4:	00079a63          	bnez	a5,800041f8 <release+0x30>
    800041e8:	00001517          	auipc	a0,0x1
    800041ec:	06850513          	addi	a0,a0,104 # 80005250 <digits+0x28>
    800041f0:	fffff097          	auipc	ra,0xfffff
    800041f4:	1dc080e7          	jalr	476(ra) # 800033cc <panic>
    800041f8:	01053903          	ld	s2,16(a0)
    800041fc:	00050493          	mv	s1,a0
    80004200:	fffff097          	auipc	ra,0xfffff
    80004204:	808080e7          	jalr	-2040(ra) # 80002a08 <mycpu>
    80004208:	fea910e3          	bne	s2,a0,800041e8 <release+0x20>
    8000420c:	0004b823          	sd	zero,16(s1)
    80004210:	0ff0000f          	fence
    80004214:	0f50000f          	fence	iorw,ow
    80004218:	0804a02f          	amoswap.w	zero,zero,(s1)
    8000421c:	ffffe097          	auipc	ra,0xffffe
    80004220:	7ec080e7          	jalr	2028(ra) # 80002a08 <mycpu>
    80004224:	100027f3          	csrr	a5,sstatus
    80004228:	0027f793          	andi	a5,a5,2
    8000422c:	04079a63          	bnez	a5,80004280 <release+0xb8>
    80004230:	07852783          	lw	a5,120(a0)
    80004234:	02f05e63          	blez	a5,80004270 <release+0xa8>
    80004238:	fff7871b          	addiw	a4,a5,-1
    8000423c:	06e52c23          	sw	a4,120(a0)
    80004240:	00071c63          	bnez	a4,80004258 <release+0x90>
    80004244:	07c52783          	lw	a5,124(a0)
    80004248:	00078863          	beqz	a5,80004258 <release+0x90>
    8000424c:	100027f3          	csrr	a5,sstatus
    80004250:	0027e793          	ori	a5,a5,2
    80004254:	10079073          	csrw	sstatus,a5
    80004258:	01813083          	ld	ra,24(sp)
    8000425c:	01013403          	ld	s0,16(sp)
    80004260:	00813483          	ld	s1,8(sp)
    80004264:	00013903          	ld	s2,0(sp)
    80004268:	02010113          	addi	sp,sp,32
    8000426c:	00008067          	ret
    80004270:	00001517          	auipc	a0,0x1
    80004274:	00050513          	mv	a0,a0
    80004278:	fffff097          	auipc	ra,0xfffff
    8000427c:	154080e7          	jalr	340(ra) # 800033cc <panic>
    80004280:	00001517          	auipc	a0,0x1
    80004284:	fd850513          	addi	a0,a0,-40 # 80005258 <digits+0x30>
    80004288:	fffff097          	auipc	ra,0xfffff
    8000428c:	144080e7          	jalr	324(ra) # 800033cc <panic>

0000000080004290 <holding>:
    80004290:	00052783          	lw	a5,0(a0)
    80004294:	00079663          	bnez	a5,800042a0 <holding+0x10>
    80004298:	00000513          	li	a0,0
    8000429c:	00008067          	ret
    800042a0:	fe010113          	addi	sp,sp,-32
    800042a4:	00813823          	sd	s0,16(sp)
    800042a8:	00913423          	sd	s1,8(sp)
    800042ac:	00113c23          	sd	ra,24(sp)
    800042b0:	02010413          	addi	s0,sp,32
    800042b4:	01053483          	ld	s1,16(a0)
    800042b8:	ffffe097          	auipc	ra,0xffffe
    800042bc:	750080e7          	jalr	1872(ra) # 80002a08 <mycpu>
    800042c0:	01813083          	ld	ra,24(sp)
    800042c4:	01013403          	ld	s0,16(sp)
    800042c8:	40a48533          	sub	a0,s1,a0
    800042cc:	00153513          	seqz	a0,a0
    800042d0:	00813483          	ld	s1,8(sp)
    800042d4:	02010113          	addi	sp,sp,32
    800042d8:	00008067          	ret

00000000800042dc <push_off>:
    800042dc:	fe010113          	addi	sp,sp,-32
    800042e0:	00813823          	sd	s0,16(sp)
    800042e4:	00113c23          	sd	ra,24(sp)
    800042e8:	00913423          	sd	s1,8(sp)
    800042ec:	02010413          	addi	s0,sp,32
    800042f0:	100024f3          	csrr	s1,sstatus
    800042f4:	100027f3          	csrr	a5,sstatus
    800042f8:	ffd7f793          	andi	a5,a5,-3
    800042fc:	10079073          	csrw	sstatus,a5
    80004300:	ffffe097          	auipc	ra,0xffffe
    80004304:	708080e7          	jalr	1800(ra) # 80002a08 <mycpu>
    80004308:	07852783          	lw	a5,120(a0)
    8000430c:	02078663          	beqz	a5,80004338 <push_off+0x5c>
    80004310:	ffffe097          	auipc	ra,0xffffe
    80004314:	6f8080e7          	jalr	1784(ra) # 80002a08 <mycpu>
    80004318:	07852783          	lw	a5,120(a0)
    8000431c:	01813083          	ld	ra,24(sp)
    80004320:	01013403          	ld	s0,16(sp)
    80004324:	0017879b          	addiw	a5,a5,1
    80004328:	06f52c23          	sw	a5,120(a0)
    8000432c:	00813483          	ld	s1,8(sp)
    80004330:	02010113          	addi	sp,sp,32
    80004334:	00008067          	ret
    80004338:	0014d493          	srli	s1,s1,0x1
    8000433c:	ffffe097          	auipc	ra,0xffffe
    80004340:	6cc080e7          	jalr	1740(ra) # 80002a08 <mycpu>
    80004344:	0014f493          	andi	s1,s1,1
    80004348:	06952e23          	sw	s1,124(a0)
    8000434c:	fc5ff06f          	j	80004310 <push_off+0x34>

0000000080004350 <pop_off>:
    80004350:	ff010113          	addi	sp,sp,-16
    80004354:	00813023          	sd	s0,0(sp)
    80004358:	00113423          	sd	ra,8(sp)
    8000435c:	01010413          	addi	s0,sp,16
    80004360:	ffffe097          	auipc	ra,0xffffe
    80004364:	6a8080e7          	jalr	1704(ra) # 80002a08 <mycpu>
    80004368:	100027f3          	csrr	a5,sstatus
    8000436c:	0027f793          	andi	a5,a5,2
    80004370:	04079663          	bnez	a5,800043bc <pop_off+0x6c>
    80004374:	07852783          	lw	a5,120(a0)
    80004378:	02f05a63          	blez	a5,800043ac <pop_off+0x5c>
    8000437c:	fff7871b          	addiw	a4,a5,-1
    80004380:	06e52c23          	sw	a4,120(a0)
    80004384:	00071c63          	bnez	a4,8000439c <pop_off+0x4c>
    80004388:	07c52783          	lw	a5,124(a0)
    8000438c:	00078863          	beqz	a5,8000439c <pop_off+0x4c>
    80004390:	100027f3          	csrr	a5,sstatus
    80004394:	0027e793          	ori	a5,a5,2
    80004398:	10079073          	csrw	sstatus,a5
    8000439c:	00813083          	ld	ra,8(sp)
    800043a0:	00013403          	ld	s0,0(sp)
    800043a4:	01010113          	addi	sp,sp,16
    800043a8:	00008067          	ret
    800043ac:	00001517          	auipc	a0,0x1
    800043b0:	ec450513          	addi	a0,a0,-316 # 80005270 <digits+0x48>
    800043b4:	fffff097          	auipc	ra,0xfffff
    800043b8:	018080e7          	jalr	24(ra) # 800033cc <panic>
    800043bc:	00001517          	auipc	a0,0x1
    800043c0:	e9c50513          	addi	a0,a0,-356 # 80005258 <digits+0x30>
    800043c4:	fffff097          	auipc	ra,0xfffff
    800043c8:	008080e7          	jalr	8(ra) # 800033cc <panic>

00000000800043cc <push_on>:
    800043cc:	fe010113          	addi	sp,sp,-32
    800043d0:	00813823          	sd	s0,16(sp)
    800043d4:	00113c23          	sd	ra,24(sp)
    800043d8:	00913423          	sd	s1,8(sp)
    800043dc:	02010413          	addi	s0,sp,32
    800043e0:	100024f3          	csrr	s1,sstatus
    800043e4:	100027f3          	csrr	a5,sstatus
    800043e8:	0027e793          	ori	a5,a5,2
    800043ec:	10079073          	csrw	sstatus,a5
    800043f0:	ffffe097          	auipc	ra,0xffffe
    800043f4:	618080e7          	jalr	1560(ra) # 80002a08 <mycpu>
    800043f8:	07852783          	lw	a5,120(a0)
    800043fc:	02078663          	beqz	a5,80004428 <push_on+0x5c>
    80004400:	ffffe097          	auipc	ra,0xffffe
    80004404:	608080e7          	jalr	1544(ra) # 80002a08 <mycpu>
    80004408:	07852783          	lw	a5,120(a0)
    8000440c:	01813083          	ld	ra,24(sp)
    80004410:	01013403          	ld	s0,16(sp)
    80004414:	0017879b          	addiw	a5,a5,1
    80004418:	06f52c23          	sw	a5,120(a0)
    8000441c:	00813483          	ld	s1,8(sp)
    80004420:	02010113          	addi	sp,sp,32
    80004424:	00008067          	ret
    80004428:	0014d493          	srli	s1,s1,0x1
    8000442c:	ffffe097          	auipc	ra,0xffffe
    80004430:	5dc080e7          	jalr	1500(ra) # 80002a08 <mycpu>
    80004434:	0014f493          	andi	s1,s1,1
    80004438:	06952e23          	sw	s1,124(a0)
    8000443c:	fc5ff06f          	j	80004400 <push_on+0x34>

0000000080004440 <pop_on>:
    80004440:	ff010113          	addi	sp,sp,-16
    80004444:	00813023          	sd	s0,0(sp)
    80004448:	00113423          	sd	ra,8(sp)
    8000444c:	01010413          	addi	s0,sp,16
    80004450:	ffffe097          	auipc	ra,0xffffe
    80004454:	5b8080e7          	jalr	1464(ra) # 80002a08 <mycpu>
    80004458:	100027f3          	csrr	a5,sstatus
    8000445c:	0027f793          	andi	a5,a5,2
    80004460:	04078463          	beqz	a5,800044a8 <pop_on+0x68>
    80004464:	07852783          	lw	a5,120(a0)
    80004468:	02f05863          	blez	a5,80004498 <pop_on+0x58>
    8000446c:	fff7879b          	addiw	a5,a5,-1
    80004470:	06f52c23          	sw	a5,120(a0)
    80004474:	07853783          	ld	a5,120(a0)
    80004478:	00079863          	bnez	a5,80004488 <pop_on+0x48>
    8000447c:	100027f3          	csrr	a5,sstatus
    80004480:	ffd7f793          	andi	a5,a5,-3
    80004484:	10079073          	csrw	sstatus,a5
    80004488:	00813083          	ld	ra,8(sp)
    8000448c:	00013403          	ld	s0,0(sp)
    80004490:	01010113          	addi	sp,sp,16
    80004494:	00008067          	ret
    80004498:	00001517          	auipc	a0,0x1
    8000449c:	e0050513          	addi	a0,a0,-512 # 80005298 <digits+0x70>
    800044a0:	fffff097          	auipc	ra,0xfffff
    800044a4:	f2c080e7          	jalr	-212(ra) # 800033cc <panic>
    800044a8:	00001517          	auipc	a0,0x1
    800044ac:	dd050513          	addi	a0,a0,-560 # 80005278 <digits+0x50>
    800044b0:	fffff097          	auipc	ra,0xfffff
    800044b4:	f1c080e7          	jalr	-228(ra) # 800033cc <panic>

00000000800044b8 <__memset>:
    800044b8:	ff010113          	addi	sp,sp,-16
    800044bc:	00813423          	sd	s0,8(sp)
    800044c0:	01010413          	addi	s0,sp,16
    800044c4:	1a060e63          	beqz	a2,80004680 <__memset+0x1c8>
    800044c8:	40a007b3          	neg	a5,a0
    800044cc:	0077f793          	andi	a5,a5,7
    800044d0:	00778693          	addi	a3,a5,7
    800044d4:	00b00813          	li	a6,11
    800044d8:	0ff5f593          	andi	a1,a1,255
    800044dc:	fff6071b          	addiw	a4,a2,-1
    800044e0:	1b06e663          	bltu	a3,a6,8000468c <__memset+0x1d4>
    800044e4:	1cd76463          	bltu	a4,a3,800046ac <__memset+0x1f4>
    800044e8:	1a078e63          	beqz	a5,800046a4 <__memset+0x1ec>
    800044ec:	00b50023          	sb	a1,0(a0)
    800044f0:	00100713          	li	a4,1
    800044f4:	1ae78463          	beq	a5,a4,8000469c <__memset+0x1e4>
    800044f8:	00b500a3          	sb	a1,1(a0)
    800044fc:	00200713          	li	a4,2
    80004500:	1ae78a63          	beq	a5,a4,800046b4 <__memset+0x1fc>
    80004504:	00b50123          	sb	a1,2(a0)
    80004508:	00300713          	li	a4,3
    8000450c:	18e78463          	beq	a5,a4,80004694 <__memset+0x1dc>
    80004510:	00b501a3          	sb	a1,3(a0)
    80004514:	00400713          	li	a4,4
    80004518:	1ae78263          	beq	a5,a4,800046bc <__memset+0x204>
    8000451c:	00b50223          	sb	a1,4(a0)
    80004520:	00500713          	li	a4,5
    80004524:	1ae78063          	beq	a5,a4,800046c4 <__memset+0x20c>
    80004528:	00b502a3          	sb	a1,5(a0)
    8000452c:	00700713          	li	a4,7
    80004530:	18e79e63          	bne	a5,a4,800046cc <__memset+0x214>
    80004534:	00b50323          	sb	a1,6(a0)
    80004538:	00700e93          	li	t4,7
    8000453c:	00859713          	slli	a4,a1,0x8
    80004540:	00e5e733          	or	a4,a1,a4
    80004544:	01059e13          	slli	t3,a1,0x10
    80004548:	01c76e33          	or	t3,a4,t3
    8000454c:	01859313          	slli	t1,a1,0x18
    80004550:	006e6333          	or	t1,t3,t1
    80004554:	02059893          	slli	a7,a1,0x20
    80004558:	40f60e3b          	subw	t3,a2,a5
    8000455c:	011368b3          	or	a7,t1,a7
    80004560:	02859813          	slli	a6,a1,0x28
    80004564:	0108e833          	or	a6,a7,a6
    80004568:	03059693          	slli	a3,a1,0x30
    8000456c:	003e589b          	srliw	a7,t3,0x3
    80004570:	00d866b3          	or	a3,a6,a3
    80004574:	03859713          	slli	a4,a1,0x38
    80004578:	00389813          	slli	a6,a7,0x3
    8000457c:	00f507b3          	add	a5,a0,a5
    80004580:	00e6e733          	or	a4,a3,a4
    80004584:	000e089b          	sext.w	a7,t3
    80004588:	00f806b3          	add	a3,a6,a5
    8000458c:	00e7b023          	sd	a4,0(a5)
    80004590:	00878793          	addi	a5,a5,8
    80004594:	fed79ce3          	bne	a5,a3,8000458c <__memset+0xd4>
    80004598:	ff8e7793          	andi	a5,t3,-8
    8000459c:	0007871b          	sext.w	a4,a5
    800045a0:	01d787bb          	addw	a5,a5,t4
    800045a4:	0ce88e63          	beq	a7,a4,80004680 <__memset+0x1c8>
    800045a8:	00f50733          	add	a4,a0,a5
    800045ac:	00b70023          	sb	a1,0(a4)
    800045b0:	0017871b          	addiw	a4,a5,1
    800045b4:	0cc77663          	bgeu	a4,a2,80004680 <__memset+0x1c8>
    800045b8:	00e50733          	add	a4,a0,a4
    800045bc:	00b70023          	sb	a1,0(a4)
    800045c0:	0027871b          	addiw	a4,a5,2
    800045c4:	0ac77e63          	bgeu	a4,a2,80004680 <__memset+0x1c8>
    800045c8:	00e50733          	add	a4,a0,a4
    800045cc:	00b70023          	sb	a1,0(a4)
    800045d0:	0037871b          	addiw	a4,a5,3
    800045d4:	0ac77663          	bgeu	a4,a2,80004680 <__memset+0x1c8>
    800045d8:	00e50733          	add	a4,a0,a4
    800045dc:	00b70023          	sb	a1,0(a4)
    800045e0:	0047871b          	addiw	a4,a5,4
    800045e4:	08c77e63          	bgeu	a4,a2,80004680 <__memset+0x1c8>
    800045e8:	00e50733          	add	a4,a0,a4
    800045ec:	00b70023          	sb	a1,0(a4)
    800045f0:	0057871b          	addiw	a4,a5,5
    800045f4:	08c77663          	bgeu	a4,a2,80004680 <__memset+0x1c8>
    800045f8:	00e50733          	add	a4,a0,a4
    800045fc:	00b70023          	sb	a1,0(a4)
    80004600:	0067871b          	addiw	a4,a5,6
    80004604:	06c77e63          	bgeu	a4,a2,80004680 <__memset+0x1c8>
    80004608:	00e50733          	add	a4,a0,a4
    8000460c:	00b70023          	sb	a1,0(a4)
    80004610:	0077871b          	addiw	a4,a5,7
    80004614:	06c77663          	bgeu	a4,a2,80004680 <__memset+0x1c8>
    80004618:	00e50733          	add	a4,a0,a4
    8000461c:	00b70023          	sb	a1,0(a4)
    80004620:	0087871b          	addiw	a4,a5,8
    80004624:	04c77e63          	bgeu	a4,a2,80004680 <__memset+0x1c8>
    80004628:	00e50733          	add	a4,a0,a4
    8000462c:	00b70023          	sb	a1,0(a4)
    80004630:	0097871b          	addiw	a4,a5,9
    80004634:	04c77663          	bgeu	a4,a2,80004680 <__memset+0x1c8>
    80004638:	00e50733          	add	a4,a0,a4
    8000463c:	00b70023          	sb	a1,0(a4)
    80004640:	00a7871b          	addiw	a4,a5,10
    80004644:	02c77e63          	bgeu	a4,a2,80004680 <__memset+0x1c8>
    80004648:	00e50733          	add	a4,a0,a4
    8000464c:	00b70023          	sb	a1,0(a4)
    80004650:	00b7871b          	addiw	a4,a5,11
    80004654:	02c77663          	bgeu	a4,a2,80004680 <__memset+0x1c8>
    80004658:	00e50733          	add	a4,a0,a4
    8000465c:	00b70023          	sb	a1,0(a4)
    80004660:	00c7871b          	addiw	a4,a5,12
    80004664:	00c77e63          	bgeu	a4,a2,80004680 <__memset+0x1c8>
    80004668:	00e50733          	add	a4,a0,a4
    8000466c:	00b70023          	sb	a1,0(a4)
    80004670:	00d7879b          	addiw	a5,a5,13
    80004674:	00c7f663          	bgeu	a5,a2,80004680 <__memset+0x1c8>
    80004678:	00f507b3          	add	a5,a0,a5
    8000467c:	00b78023          	sb	a1,0(a5)
    80004680:	00813403          	ld	s0,8(sp)
    80004684:	01010113          	addi	sp,sp,16
    80004688:	00008067          	ret
    8000468c:	00b00693          	li	a3,11
    80004690:	e55ff06f          	j	800044e4 <__memset+0x2c>
    80004694:	00300e93          	li	t4,3
    80004698:	ea5ff06f          	j	8000453c <__memset+0x84>
    8000469c:	00100e93          	li	t4,1
    800046a0:	e9dff06f          	j	8000453c <__memset+0x84>
    800046a4:	00000e93          	li	t4,0
    800046a8:	e95ff06f          	j	8000453c <__memset+0x84>
    800046ac:	00000793          	li	a5,0
    800046b0:	ef9ff06f          	j	800045a8 <__memset+0xf0>
    800046b4:	00200e93          	li	t4,2
    800046b8:	e85ff06f          	j	8000453c <__memset+0x84>
    800046bc:	00400e93          	li	t4,4
    800046c0:	e7dff06f          	j	8000453c <__memset+0x84>
    800046c4:	00500e93          	li	t4,5
    800046c8:	e75ff06f          	j	8000453c <__memset+0x84>
    800046cc:	00600e93          	li	t4,6
    800046d0:	e6dff06f          	j	8000453c <__memset+0x84>

00000000800046d4 <__memmove>:
    800046d4:	ff010113          	addi	sp,sp,-16
    800046d8:	00813423          	sd	s0,8(sp)
    800046dc:	01010413          	addi	s0,sp,16
    800046e0:	0e060863          	beqz	a2,800047d0 <__memmove+0xfc>
    800046e4:	fff6069b          	addiw	a3,a2,-1
    800046e8:	0006881b          	sext.w	a6,a3
    800046ec:	0ea5e863          	bltu	a1,a0,800047dc <__memmove+0x108>
    800046f0:	00758713          	addi	a4,a1,7
    800046f4:	00a5e7b3          	or	a5,a1,a0
    800046f8:	40a70733          	sub	a4,a4,a0
    800046fc:	0077f793          	andi	a5,a5,7
    80004700:	00f73713          	sltiu	a4,a4,15
    80004704:	00174713          	xori	a4,a4,1
    80004708:	0017b793          	seqz	a5,a5
    8000470c:	00e7f7b3          	and	a5,a5,a4
    80004710:	10078863          	beqz	a5,80004820 <__memmove+0x14c>
    80004714:	00900793          	li	a5,9
    80004718:	1107f463          	bgeu	a5,a6,80004820 <__memmove+0x14c>
    8000471c:	0036581b          	srliw	a6,a2,0x3
    80004720:	fff8081b          	addiw	a6,a6,-1
    80004724:	02081813          	slli	a6,a6,0x20
    80004728:	01d85893          	srli	a7,a6,0x1d
    8000472c:	00858813          	addi	a6,a1,8
    80004730:	00058793          	mv	a5,a1
    80004734:	00050713          	mv	a4,a0
    80004738:	01088833          	add	a6,a7,a6
    8000473c:	0007b883          	ld	a7,0(a5)
    80004740:	00878793          	addi	a5,a5,8
    80004744:	00870713          	addi	a4,a4,8
    80004748:	ff173c23          	sd	a7,-8(a4)
    8000474c:	ff0798e3          	bne	a5,a6,8000473c <__memmove+0x68>
    80004750:	ff867713          	andi	a4,a2,-8
    80004754:	02071793          	slli	a5,a4,0x20
    80004758:	0207d793          	srli	a5,a5,0x20
    8000475c:	00f585b3          	add	a1,a1,a5
    80004760:	40e686bb          	subw	a3,a3,a4
    80004764:	00f507b3          	add	a5,a0,a5
    80004768:	06e60463          	beq	a2,a4,800047d0 <__memmove+0xfc>
    8000476c:	0005c703          	lbu	a4,0(a1)
    80004770:	00e78023          	sb	a4,0(a5)
    80004774:	04068e63          	beqz	a3,800047d0 <__memmove+0xfc>
    80004778:	0015c603          	lbu	a2,1(a1)
    8000477c:	00100713          	li	a4,1
    80004780:	00c780a3          	sb	a2,1(a5)
    80004784:	04e68663          	beq	a3,a4,800047d0 <__memmove+0xfc>
    80004788:	0025c603          	lbu	a2,2(a1)
    8000478c:	00200713          	li	a4,2
    80004790:	00c78123          	sb	a2,2(a5)
    80004794:	02e68e63          	beq	a3,a4,800047d0 <__memmove+0xfc>
    80004798:	0035c603          	lbu	a2,3(a1)
    8000479c:	00300713          	li	a4,3
    800047a0:	00c781a3          	sb	a2,3(a5)
    800047a4:	02e68663          	beq	a3,a4,800047d0 <__memmove+0xfc>
    800047a8:	0045c603          	lbu	a2,4(a1)
    800047ac:	00400713          	li	a4,4
    800047b0:	00c78223          	sb	a2,4(a5)
    800047b4:	00e68e63          	beq	a3,a4,800047d0 <__memmove+0xfc>
    800047b8:	0055c603          	lbu	a2,5(a1)
    800047bc:	00500713          	li	a4,5
    800047c0:	00c782a3          	sb	a2,5(a5)
    800047c4:	00e68663          	beq	a3,a4,800047d0 <__memmove+0xfc>
    800047c8:	0065c703          	lbu	a4,6(a1)
    800047cc:	00e78323          	sb	a4,6(a5)
    800047d0:	00813403          	ld	s0,8(sp)
    800047d4:	01010113          	addi	sp,sp,16
    800047d8:	00008067          	ret
    800047dc:	02061713          	slli	a4,a2,0x20
    800047e0:	02075713          	srli	a4,a4,0x20
    800047e4:	00e587b3          	add	a5,a1,a4
    800047e8:	f0f574e3          	bgeu	a0,a5,800046f0 <__memmove+0x1c>
    800047ec:	02069613          	slli	a2,a3,0x20
    800047f0:	02065613          	srli	a2,a2,0x20
    800047f4:	fff64613          	not	a2,a2
    800047f8:	00e50733          	add	a4,a0,a4
    800047fc:	00c78633          	add	a2,a5,a2
    80004800:	fff7c683          	lbu	a3,-1(a5)
    80004804:	fff78793          	addi	a5,a5,-1
    80004808:	fff70713          	addi	a4,a4,-1
    8000480c:	00d70023          	sb	a3,0(a4)
    80004810:	fec798e3          	bne	a5,a2,80004800 <__memmove+0x12c>
    80004814:	00813403          	ld	s0,8(sp)
    80004818:	01010113          	addi	sp,sp,16
    8000481c:	00008067          	ret
    80004820:	02069713          	slli	a4,a3,0x20
    80004824:	02075713          	srli	a4,a4,0x20
    80004828:	00170713          	addi	a4,a4,1
    8000482c:	00e50733          	add	a4,a0,a4
    80004830:	00050793          	mv	a5,a0
    80004834:	0005c683          	lbu	a3,0(a1)
    80004838:	00178793          	addi	a5,a5,1
    8000483c:	00158593          	addi	a1,a1,1
    80004840:	fed78fa3          	sb	a3,-1(a5)
    80004844:	fee798e3          	bne	a5,a4,80004834 <__memmove+0x160>
    80004848:	f89ff06f          	j	800047d0 <__memmove+0xfc>

000000008000484c <__mem_free>:
    8000484c:	ff010113          	addi	sp,sp,-16
    80004850:	00813423          	sd	s0,8(sp)
    80004854:	01010413          	addi	s0,sp,16
    80004858:	00001597          	auipc	a1,0x1
    8000485c:	40058593          	addi	a1,a1,1024 # 80005c58 <freep>
    80004860:	0005b783          	ld	a5,0(a1)
    80004864:	ff050693          	addi	a3,a0,-16
    80004868:	0007b703          	ld	a4,0(a5)
    8000486c:	00d7fc63          	bgeu	a5,a3,80004884 <__mem_free+0x38>
    80004870:	00e6ee63          	bltu	a3,a4,8000488c <__mem_free+0x40>
    80004874:	00e7fc63          	bgeu	a5,a4,8000488c <__mem_free+0x40>
    80004878:	00070793          	mv	a5,a4
    8000487c:	0007b703          	ld	a4,0(a5)
    80004880:	fed7e8e3          	bltu	a5,a3,80004870 <__mem_free+0x24>
    80004884:	fee7eae3          	bltu	a5,a4,80004878 <__mem_free+0x2c>
    80004888:	fee6f8e3          	bgeu	a3,a4,80004878 <__mem_free+0x2c>
    8000488c:	ff852803          	lw	a6,-8(a0)
    80004890:	02081613          	slli	a2,a6,0x20
    80004894:	01c65613          	srli	a2,a2,0x1c
    80004898:	00c68633          	add	a2,a3,a2
    8000489c:	02c70a63          	beq	a4,a2,800048d0 <__mem_free+0x84>
    800048a0:	fee53823          	sd	a4,-16(a0)
    800048a4:	0087a503          	lw	a0,8(a5)
    800048a8:	02051613          	slli	a2,a0,0x20
    800048ac:	01c65613          	srli	a2,a2,0x1c
    800048b0:	00c78633          	add	a2,a5,a2
    800048b4:	04c68263          	beq	a3,a2,800048f8 <__mem_free+0xac>
    800048b8:	00813403          	ld	s0,8(sp)
    800048bc:	00d7b023          	sd	a3,0(a5)
    800048c0:	00f5b023          	sd	a5,0(a1)
    800048c4:	00000513          	li	a0,0
    800048c8:	01010113          	addi	sp,sp,16
    800048cc:	00008067          	ret
    800048d0:	00872603          	lw	a2,8(a4)
    800048d4:	00073703          	ld	a4,0(a4)
    800048d8:	0106083b          	addw	a6,a2,a6
    800048dc:	ff052c23          	sw	a6,-8(a0)
    800048e0:	fee53823          	sd	a4,-16(a0)
    800048e4:	0087a503          	lw	a0,8(a5)
    800048e8:	02051613          	slli	a2,a0,0x20
    800048ec:	01c65613          	srli	a2,a2,0x1c
    800048f0:	00c78633          	add	a2,a5,a2
    800048f4:	fcc692e3          	bne	a3,a2,800048b8 <__mem_free+0x6c>
    800048f8:	00813403          	ld	s0,8(sp)
    800048fc:	0105053b          	addw	a0,a0,a6
    80004900:	00a7a423          	sw	a0,8(a5)
    80004904:	00e7b023          	sd	a4,0(a5)
    80004908:	00f5b023          	sd	a5,0(a1)
    8000490c:	00000513          	li	a0,0
    80004910:	01010113          	addi	sp,sp,16
    80004914:	00008067          	ret

0000000080004918 <__mem_alloc>:
    80004918:	fc010113          	addi	sp,sp,-64
    8000491c:	02813823          	sd	s0,48(sp)
    80004920:	02913423          	sd	s1,40(sp)
    80004924:	03213023          	sd	s2,32(sp)
    80004928:	01513423          	sd	s5,8(sp)
    8000492c:	02113c23          	sd	ra,56(sp)
    80004930:	01313c23          	sd	s3,24(sp)
    80004934:	01413823          	sd	s4,16(sp)
    80004938:	01613023          	sd	s6,0(sp)
    8000493c:	04010413          	addi	s0,sp,64
    80004940:	00001a97          	auipc	s5,0x1
    80004944:	318a8a93          	addi	s5,s5,792 # 80005c58 <freep>
    80004948:	00f50913          	addi	s2,a0,15
    8000494c:	000ab683          	ld	a3,0(s5)
    80004950:	00495913          	srli	s2,s2,0x4
    80004954:	0019049b          	addiw	s1,s2,1
    80004958:	00048913          	mv	s2,s1
    8000495c:	0c068c63          	beqz	a3,80004a34 <__mem_alloc+0x11c>
    80004960:	0006b503          	ld	a0,0(a3)
    80004964:	00852703          	lw	a4,8(a0)
    80004968:	10977063          	bgeu	a4,s1,80004a68 <__mem_alloc+0x150>
    8000496c:	000017b7          	lui	a5,0x1
    80004970:	0009099b          	sext.w	s3,s2
    80004974:	0af4e863          	bltu	s1,a5,80004a24 <__mem_alloc+0x10c>
    80004978:	02099a13          	slli	s4,s3,0x20
    8000497c:	01ca5a13          	srli	s4,s4,0x1c
    80004980:	fff00b13          	li	s6,-1
    80004984:	0100006f          	j	80004994 <__mem_alloc+0x7c>
    80004988:	0007b503          	ld	a0,0(a5) # 1000 <_entry-0x7ffff000>
    8000498c:	00852703          	lw	a4,8(a0)
    80004990:	04977463          	bgeu	a4,s1,800049d8 <__mem_alloc+0xc0>
    80004994:	00050793          	mv	a5,a0
    80004998:	fea698e3          	bne	a3,a0,80004988 <__mem_alloc+0x70>
    8000499c:	000a0513          	mv	a0,s4
    800049a0:	00000097          	auipc	ra,0x0
    800049a4:	1f0080e7          	jalr	496(ra) # 80004b90 <kvmincrease>
    800049a8:	00050793          	mv	a5,a0
    800049ac:	01050513          	addi	a0,a0,16
    800049b0:	07678e63          	beq	a5,s6,80004a2c <__mem_alloc+0x114>
    800049b4:	0137a423          	sw	s3,8(a5)
    800049b8:	00000097          	auipc	ra,0x0
    800049bc:	e94080e7          	jalr	-364(ra) # 8000484c <__mem_free>
    800049c0:	000ab783          	ld	a5,0(s5)
    800049c4:	06078463          	beqz	a5,80004a2c <__mem_alloc+0x114>
    800049c8:	0007b503          	ld	a0,0(a5)
    800049cc:	00078693          	mv	a3,a5
    800049d0:	00852703          	lw	a4,8(a0)
    800049d4:	fc9760e3          	bltu	a4,s1,80004994 <__mem_alloc+0x7c>
    800049d8:	08e48263          	beq	s1,a4,80004a5c <__mem_alloc+0x144>
    800049dc:	4127073b          	subw	a4,a4,s2
    800049e0:	02071693          	slli	a3,a4,0x20
    800049e4:	01c6d693          	srli	a3,a3,0x1c
    800049e8:	00e52423          	sw	a4,8(a0)
    800049ec:	00d50533          	add	a0,a0,a3
    800049f0:	01252423          	sw	s2,8(a0)
    800049f4:	00fab023          	sd	a5,0(s5)
    800049f8:	01050513          	addi	a0,a0,16
    800049fc:	03813083          	ld	ra,56(sp)
    80004a00:	03013403          	ld	s0,48(sp)
    80004a04:	02813483          	ld	s1,40(sp)
    80004a08:	02013903          	ld	s2,32(sp)
    80004a0c:	01813983          	ld	s3,24(sp)
    80004a10:	01013a03          	ld	s4,16(sp)
    80004a14:	00813a83          	ld	s5,8(sp)
    80004a18:	00013b03          	ld	s6,0(sp)
    80004a1c:	04010113          	addi	sp,sp,64
    80004a20:	00008067          	ret
    80004a24:	000019b7          	lui	s3,0x1
    80004a28:	f51ff06f          	j	80004978 <__mem_alloc+0x60>
    80004a2c:	00000513          	li	a0,0
    80004a30:	fcdff06f          	j	800049fc <__mem_alloc+0xe4>
    80004a34:	00002797          	auipc	a5,0x2
    80004a38:	4bc78793          	addi	a5,a5,1212 # 80006ef0 <base>
    80004a3c:	00078513          	mv	a0,a5
    80004a40:	00fab023          	sd	a5,0(s5)
    80004a44:	00f7b023          	sd	a5,0(a5)
    80004a48:	00000713          	li	a4,0
    80004a4c:	00002797          	auipc	a5,0x2
    80004a50:	4a07a623          	sw	zero,1196(a5) # 80006ef8 <base+0x8>
    80004a54:	00050693          	mv	a3,a0
    80004a58:	f11ff06f          	j	80004968 <__mem_alloc+0x50>
    80004a5c:	00053703          	ld	a4,0(a0)
    80004a60:	00e7b023          	sd	a4,0(a5)
    80004a64:	f91ff06f          	j	800049f4 <__mem_alloc+0xdc>
    80004a68:	00068793          	mv	a5,a3
    80004a6c:	f6dff06f          	j	800049d8 <__mem_alloc+0xc0>

0000000080004a70 <__putc>:
    80004a70:	fe010113          	addi	sp,sp,-32
    80004a74:	00813823          	sd	s0,16(sp)
    80004a78:	00113c23          	sd	ra,24(sp)
    80004a7c:	02010413          	addi	s0,sp,32
    80004a80:	00050793          	mv	a5,a0
    80004a84:	fef40593          	addi	a1,s0,-17
    80004a88:	00100613          	li	a2,1
    80004a8c:	00000513          	li	a0,0
    80004a90:	fef407a3          	sb	a5,-17(s0)
    80004a94:	fffff097          	auipc	ra,0xfffff
    80004a98:	918080e7          	jalr	-1768(ra) # 800033ac <console_write>
    80004a9c:	01813083          	ld	ra,24(sp)
    80004aa0:	01013403          	ld	s0,16(sp)
    80004aa4:	02010113          	addi	sp,sp,32
    80004aa8:	00008067          	ret

0000000080004aac <__getc>:
    80004aac:	fe010113          	addi	sp,sp,-32
    80004ab0:	00813823          	sd	s0,16(sp)
    80004ab4:	00113c23          	sd	ra,24(sp)
    80004ab8:	02010413          	addi	s0,sp,32
    80004abc:	fe840593          	addi	a1,s0,-24
    80004ac0:	00100613          	li	a2,1
    80004ac4:	00000513          	li	a0,0
    80004ac8:	fffff097          	auipc	ra,0xfffff
    80004acc:	8c4080e7          	jalr	-1852(ra) # 8000338c <console_read>
    80004ad0:	fe844503          	lbu	a0,-24(s0)
    80004ad4:	01813083          	ld	ra,24(sp)
    80004ad8:	01013403          	ld	s0,16(sp)
    80004adc:	02010113          	addi	sp,sp,32
    80004ae0:	00008067          	ret

0000000080004ae4 <console_handler>:
    80004ae4:	fe010113          	addi	sp,sp,-32
    80004ae8:	00813823          	sd	s0,16(sp)
    80004aec:	00113c23          	sd	ra,24(sp)
    80004af0:	00913423          	sd	s1,8(sp)
    80004af4:	02010413          	addi	s0,sp,32
    80004af8:	14202773          	csrr	a4,scause
    80004afc:	100027f3          	csrr	a5,sstatus
    80004b00:	0027f793          	andi	a5,a5,2
    80004b04:	06079e63          	bnez	a5,80004b80 <console_handler+0x9c>
    80004b08:	00074c63          	bltz	a4,80004b20 <console_handler+0x3c>
    80004b0c:	01813083          	ld	ra,24(sp)
    80004b10:	01013403          	ld	s0,16(sp)
    80004b14:	00813483          	ld	s1,8(sp)
    80004b18:	02010113          	addi	sp,sp,32
    80004b1c:	00008067          	ret
    80004b20:	0ff77713          	andi	a4,a4,255
    80004b24:	00900793          	li	a5,9
    80004b28:	fef712e3          	bne	a4,a5,80004b0c <console_handler+0x28>
    80004b2c:	ffffe097          	auipc	ra,0xffffe
    80004b30:	4b8080e7          	jalr	1208(ra) # 80002fe4 <plic_claim>
    80004b34:	00a00793          	li	a5,10
    80004b38:	00050493          	mv	s1,a0
    80004b3c:	02f50c63          	beq	a0,a5,80004b74 <console_handler+0x90>
    80004b40:	fc0506e3          	beqz	a0,80004b0c <console_handler+0x28>
    80004b44:	00050593          	mv	a1,a0
    80004b48:	00000517          	auipc	a0,0x0
    80004b4c:	65850513          	addi	a0,a0,1624 # 800051a0 <_ZZ12printIntegermE6digits+0xe0>
    80004b50:	fffff097          	auipc	ra,0xfffff
    80004b54:	8d8080e7          	jalr	-1832(ra) # 80003428 <__printf>
    80004b58:	01013403          	ld	s0,16(sp)
    80004b5c:	01813083          	ld	ra,24(sp)
    80004b60:	00048513          	mv	a0,s1
    80004b64:	00813483          	ld	s1,8(sp)
    80004b68:	02010113          	addi	sp,sp,32
    80004b6c:	ffffe317          	auipc	t1,0xffffe
    80004b70:	4b030067          	jr	1200(t1) # 8000301c <plic_complete>
    80004b74:	fffff097          	auipc	ra,0xfffff
    80004b78:	1bc080e7          	jalr	444(ra) # 80003d30 <uartintr>
    80004b7c:	fddff06f          	j	80004b58 <console_handler+0x74>
    80004b80:	00000517          	auipc	a0,0x0
    80004b84:	72050513          	addi	a0,a0,1824 # 800052a0 <digits+0x78>
    80004b88:	fffff097          	auipc	ra,0xfffff
    80004b8c:	844080e7          	jalr	-1980(ra) # 800033cc <panic>

0000000080004b90 <kvmincrease>:
    80004b90:	fe010113          	addi	sp,sp,-32
    80004b94:	01213023          	sd	s2,0(sp)
    80004b98:	00001937          	lui	s2,0x1
    80004b9c:	fff90913          	addi	s2,s2,-1 # fff <_entry-0x7ffff001>
    80004ba0:	00813823          	sd	s0,16(sp)
    80004ba4:	00113c23          	sd	ra,24(sp)
    80004ba8:	00913423          	sd	s1,8(sp)
    80004bac:	02010413          	addi	s0,sp,32
    80004bb0:	01250933          	add	s2,a0,s2
    80004bb4:	00c95913          	srli	s2,s2,0xc
    80004bb8:	02090863          	beqz	s2,80004be8 <kvmincrease+0x58>
    80004bbc:	00000493          	li	s1,0
    80004bc0:	00148493          	addi	s1,s1,1
    80004bc4:	fffff097          	auipc	ra,0xfffff
    80004bc8:	4bc080e7          	jalr	1212(ra) # 80004080 <kalloc>
    80004bcc:	fe991ae3          	bne	s2,s1,80004bc0 <kvmincrease+0x30>
    80004bd0:	01813083          	ld	ra,24(sp)
    80004bd4:	01013403          	ld	s0,16(sp)
    80004bd8:	00813483          	ld	s1,8(sp)
    80004bdc:	00013903          	ld	s2,0(sp)
    80004be0:	02010113          	addi	sp,sp,32
    80004be4:	00008067          	ret
    80004be8:	01813083          	ld	ra,24(sp)
    80004bec:	01013403          	ld	s0,16(sp)
    80004bf0:	00813483          	ld	s1,8(sp)
    80004bf4:	00013903          	ld	s2,0(sp)
    80004bf8:	00000513          	li	a0,0
    80004bfc:	02010113          	addi	sp,sp,32
    80004c00:	00008067          	ret
	...
