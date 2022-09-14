
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00006117          	auipc	sp,0x6
    80000004:	d0013103          	ld	sp,-768(sp) # 80005d00 <_GLOBAL_OFFSET_TABLE_+0x38>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	2e5020ef          	jal	ra,80002b00 <start>

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
    80001084:	09c010ef          	jal	ra,80002120 <_ZN5Riscv20handleSupervisorTrapEv>

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
    80001228:	dd4080e7          	jalr	-556(ra) # 80001ff8 <_Znam>
    8000122c:	fca43423          	sd	a0,-56(s0)
    printInteger((uint64)stack);
    80001230:	fc843503          	ld	a0,-56(s0)
    80001234:	00002097          	auipc	ra,0x2
    80001238:	810080e7          	jalr	-2032(ra) # 80002a44 <_Z12printIntegerm>
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

00000000800013b0 <_Z4getcv>:

char getc(){
    800013b0:	ff010113          	addi	sp,sp,-16
    800013b4:	00813423          	sd	s0,8(sp)
    800013b8:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a0, %0" : : "r" (GETC));
    800013bc:	04100793          	li	a5,65
    800013c0:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    800013c4:	00000073          	ecall
    char ret;
    __asm__ volatile("mv %0, a0" : "=r" (ret));
    800013c8:	00050513          	mv	a0,a0
    return ret;
}
    800013cc:	0ff57513          	andi	a0,a0,255
    800013d0:	00813403          	ld	s0,8(sp)
    800013d4:	01010113          	addi	sp,sp,16
    800013d8:	00008067          	ret

00000000800013dc <_Z4putcc>:
void putc(char c){
    800013dc:	ff010113          	addi	sp,sp,-16
    800013e0:	00813423          	sd	s0,8(sp)
    800013e4:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %0" : : "r" (c));
    800013e8:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %0" : : "r" (PUTC));
    800013ec:	04200793          	li	a5,66
    800013f0:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    800013f4:	00000073          	ecall
}
    800013f8:	00813403          	ld	s0,8(sp)
    800013fc:	01010113          	addi	sp,sp,16
    80001400:	00008067          	ret

0000000080001404 <_ZL9fibonaccim>:
        }
    }
}

static uint64 fibonacci(uint64 n)
{
    80001404:	fe010113          	addi	sp,sp,-32
    80001408:	00113c23          	sd	ra,24(sp)
    8000140c:	00813823          	sd	s0,16(sp)
    80001410:	00913423          	sd	s1,8(sp)
    80001414:	01213023          	sd	s2,0(sp)
    80001418:	02010413          	addi	s0,sp,32
    8000141c:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80001420:	00100793          	li	a5,1
    80001424:	02a7f863          	bgeu	a5,a0,80001454 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { _thread::yield(); }
    80001428:	00a00793          	li	a5,10
    8000142c:	02f577b3          	remu	a5,a0,a5
    80001430:	02078e63          	beqz	a5,8000146c <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80001434:	fff48513          	addi	a0,s1,-1
    80001438:	00000097          	auipc	ra,0x0
    8000143c:	fcc080e7          	jalr	-52(ra) # 80001404 <_ZL9fibonaccim>
    80001440:	00050913          	mv	s2,a0
    80001444:	ffe48513          	addi	a0,s1,-2
    80001448:	00000097          	auipc	ra,0x0
    8000144c:	fbc080e7          	jalr	-68(ra) # 80001404 <_ZL9fibonaccim>
    80001450:	00a90533          	add	a0,s2,a0
}
    80001454:	01813083          	ld	ra,24(sp)
    80001458:	01013403          	ld	s0,16(sp)
    8000145c:	00813483          	ld	s1,8(sp)
    80001460:	00013903          	ld	s2,0(sp)
    80001464:	02010113          	addi	sp,sp,32
    80001468:	00008067          	ret
    if (n % 10 == 0) { _thread::yield(); }
    8000146c:	00001097          	auipc	ra,0x1
    80001470:	844080e7          	jalr	-1980(ra) # 80001cb0 <_ZN7_thread5yieldEv>
    80001474:	fc1ff06f          	j	80001434 <_ZL9fibonaccim+0x30>

0000000080001478 <_Z11workerBodyAv>:
{
    80001478:	fe010113          	addi	sp,sp,-32
    8000147c:	00113c23          	sd	ra,24(sp)
    80001480:	00813823          	sd	s0,16(sp)
    80001484:	00913423          	sd	s1,8(sp)
    80001488:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++)
    8000148c:	00000493          	li	s1,0
    80001490:	0500006f          	j	800014e0 <_Z11workerBodyAv+0x68>
            time_sleep(50);
    80001494:	03200513          	li	a0,50
    80001498:	00000097          	auipc	ra,0x0
    8000149c:	ee8080e7          	jalr	-280(ra) # 80001380 <_Z10time_sleepm>
            char c = getc();
    800014a0:	00000097          	auipc	ra,0x0
    800014a4:	f10080e7          	jalr	-240(ra) # 800013b0 <_Z4getcv>
            putc(c);
    800014a8:	00000097          	auipc	ra,0x0
    800014ac:	f34080e7          	jalr	-204(ra) # 800013dc <_Z4putcc>
    800014b0:	0400006f          	j	800014f0 <_Z11workerBodyAv+0x78>
        for (uint64 j = 0; j < 10000; j++)
    800014b4:	00168693          	addi	a3,a3,1
    800014b8:	000027b7          	lui	a5,0x2
    800014bc:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800014c0:	00d7ee63          	bltu	a5,a3,800014dc <_Z11workerBodyAv+0x64>
            for (uint64 k = 0; k < 30000; k++)
    800014c4:	00000713          	li	a4,0
    800014c8:	000077b7          	lui	a5,0x7
    800014cc:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800014d0:	fee7e2e3          	bltu	a5,a4,800014b4 <_Z11workerBodyAv+0x3c>
    800014d4:	00170713          	addi	a4,a4,1
    800014d8:	ff1ff06f          	j	800014c8 <_Z11workerBodyAv+0x50>
    for (uint64 i = 0; i < 10; i++)
    800014dc:	00148493          	addi	s1,s1,1
    800014e0:	00900793          	li	a5,9
    800014e4:	0497e063          	bltu	a5,s1,80001524 <_Z11workerBodyAv+0xac>
        if(i == 5) {
    800014e8:	00500793          	li	a5,5
    800014ec:	faf484e3          	beq	s1,a5,80001494 <_Z11workerBodyAv+0x1c>
        printString("A: i=");
    800014f0:	00004517          	auipc	a0,0x4
    800014f4:	b3050513          	addi	a0,a0,-1232 # 80005020 <CONSOLE_STATUS+0x10>
    800014f8:	00001097          	auipc	ra,0x1
    800014fc:	4dc080e7          	jalr	1244(ra) # 800029d4 <_Z11printStringPKc>
        printInteger(i);
    80001500:	00048513          	mv	a0,s1
    80001504:	00001097          	auipc	ra,0x1
    80001508:	540080e7          	jalr	1344(ra) # 80002a44 <_Z12printIntegerm>
        printString("\n");
    8000150c:	00004517          	auipc	a0,0x4
    80001510:	bbc50513          	addi	a0,a0,-1092 # 800050c8 <CONSOLE_STATUS+0xb8>
    80001514:	00001097          	auipc	ra,0x1
    80001518:	4c0080e7          	jalr	1216(ra) # 800029d4 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++)
    8000151c:	00000693          	li	a3,0
    80001520:	f99ff06f          	j	800014b8 <_Z11workerBodyAv+0x40>
}
    80001524:	01813083          	ld	ra,24(sp)
    80001528:	01013403          	ld	s0,16(sp)
    8000152c:	00813483          	ld	s1,8(sp)
    80001530:	02010113          	addi	sp,sp,32
    80001534:	00008067          	ret

0000000080001538 <_Z11workerBodyBv>:
{
    80001538:	fe010113          	addi	sp,sp,-32
    8000153c:	00113c23          	sd	ra,24(sp)
    80001540:	00813823          	sd	s0,16(sp)
    80001544:	00913423          	sd	s1,8(sp)
    80001548:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++)
    8000154c:	00000493          	li	s1,0
    80001550:	0300006f          	j	80001580 <_Z11workerBodyBv+0x48>
        for (uint64 j = 0; j < 10000; j++)
    80001554:	00168693          	addi	a3,a3,1
    80001558:	000027b7          	lui	a5,0x2
    8000155c:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80001560:	00d7ee63          	bltu	a5,a3,8000157c <_Z11workerBodyBv+0x44>
            for (uint64 k = 0; k < 30000; k++)
    80001564:	00000713          	li	a4,0
    80001568:	000077b7          	lui	a5,0x7
    8000156c:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80001570:	fee7e2e3          	bltu	a5,a4,80001554 <_Z11workerBodyBv+0x1c>
    80001574:	00170713          	addi	a4,a4,1
    80001578:	ff1ff06f          	j	80001568 <_Z11workerBodyBv+0x30>
    for (uint64 i = 0; i < 16; i++)
    8000157c:	00148493          	addi	s1,s1,1
    80001580:	00f00793          	li	a5,15
    80001584:	0297ec63          	bltu	a5,s1,800015bc <_Z11workerBodyBv+0x84>
        printString("B: i=");
    80001588:	00004517          	auipc	a0,0x4
    8000158c:	aa050513          	addi	a0,a0,-1376 # 80005028 <CONSOLE_STATUS+0x18>
    80001590:	00001097          	auipc	ra,0x1
    80001594:	444080e7          	jalr	1092(ra) # 800029d4 <_Z11printStringPKc>
        printInteger(i);
    80001598:	00048513          	mv	a0,s1
    8000159c:	00001097          	auipc	ra,0x1
    800015a0:	4a8080e7          	jalr	1192(ra) # 80002a44 <_Z12printIntegerm>
        printString("\n");
    800015a4:	00004517          	auipc	a0,0x4
    800015a8:	b2450513          	addi	a0,a0,-1244 # 800050c8 <CONSOLE_STATUS+0xb8>
    800015ac:	00001097          	auipc	ra,0x1
    800015b0:	428080e7          	jalr	1064(ra) # 800029d4 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++)
    800015b4:	00000693          	li	a3,0
    800015b8:	fa1ff06f          	j	80001558 <_Z11workerBodyBv+0x20>
}
    800015bc:	01813083          	ld	ra,24(sp)
    800015c0:	01013403          	ld	s0,16(sp)
    800015c4:	00813483          	ld	s1,8(sp)
    800015c8:	02010113          	addi	sp,sp,32
    800015cc:	00008067          	ret

00000000800015d0 <_Z11workerBodyCv>:

void workerBodyC()
{
    800015d0:	fe010113          	addi	sp,sp,-32
    800015d4:	00113c23          	sd	ra,24(sp)
    800015d8:	00813823          	sd	s0,16(sp)
    800015dc:	00913423          	sd	s1,8(sp)
    800015e0:	01213023          	sd	s2,0(sp)
    800015e4:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    800015e8:	00000493          	li	s1,0
    800015ec:	0380006f          	j	80001624 <_Z11workerBodyCv+0x54>
    for (; i < 3; i++)
    {
        printString("C: i=");
    800015f0:	00004517          	auipc	a0,0x4
    800015f4:	a4050513          	addi	a0,a0,-1472 # 80005030 <CONSOLE_STATUS+0x20>
    800015f8:	00001097          	auipc	ra,0x1
    800015fc:	3dc080e7          	jalr	988(ra) # 800029d4 <_Z11printStringPKc>
        printInteger(i);
    80001600:	00048513          	mv	a0,s1
    80001604:	00001097          	auipc	ra,0x1
    80001608:	440080e7          	jalr	1088(ra) # 80002a44 <_Z12printIntegerm>
        printString("\n");
    8000160c:	00004517          	auipc	a0,0x4
    80001610:	abc50513          	addi	a0,a0,-1348 # 800050c8 <CONSOLE_STATUS+0xb8>
    80001614:	00001097          	auipc	ra,0x1
    80001618:	3c0080e7          	jalr	960(ra) # 800029d4 <_Z11printStringPKc>
    for (; i < 3; i++)
    8000161c:	0014849b          	addiw	s1,s1,1
    80001620:	0ff4f493          	andi	s1,s1,255
    80001624:	00200793          	li	a5,2
    80001628:	fc97f4e3          	bgeu	a5,s1,800015f0 <_Z11workerBodyCv+0x20>
    }

    printString("C: yield\n");
    8000162c:	00004517          	auipc	a0,0x4
    80001630:	a0c50513          	addi	a0,a0,-1524 # 80005038 <CONSOLE_STATUS+0x28>
    80001634:	00001097          	auipc	ra,0x1
    80001638:	3a0080e7          	jalr	928(ra) # 800029d4 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    8000163c:	00700313          	li	t1,7
    _thread::yield();
    80001640:	00000097          	auipc	ra,0x0
    80001644:	670080e7          	jalr	1648(ra) # 80001cb0 <_ZN7_thread5yieldEv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80001648:	00030913          	mv	s2,t1

    printString("C: t1=");
    8000164c:	00004517          	auipc	a0,0x4
    80001650:	9fc50513          	addi	a0,a0,-1540 # 80005048 <CONSOLE_STATUS+0x38>
    80001654:	00001097          	auipc	ra,0x1
    80001658:	380080e7          	jalr	896(ra) # 800029d4 <_Z11printStringPKc>
    printInteger(t1);
    8000165c:	00090513          	mv	a0,s2
    80001660:	00001097          	auipc	ra,0x1
    80001664:	3e4080e7          	jalr	996(ra) # 80002a44 <_Z12printIntegerm>
    printString("\n");
    80001668:	00004517          	auipc	a0,0x4
    8000166c:	a6050513          	addi	a0,a0,-1440 # 800050c8 <CONSOLE_STATUS+0xb8>
    80001670:	00001097          	auipc	ra,0x1
    80001674:	364080e7          	jalr	868(ra) # 800029d4 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    80001678:	00c00513          	li	a0,12
    8000167c:	00000097          	auipc	ra,0x0
    80001680:	d88080e7          	jalr	-632(ra) # 80001404 <_ZL9fibonaccim>
    80001684:	00050913          	mv	s2,a0
    printString("C: fibonaci=");
    80001688:	00004517          	auipc	a0,0x4
    8000168c:	9c850513          	addi	a0,a0,-1592 # 80005050 <CONSOLE_STATUS+0x40>
    80001690:	00001097          	auipc	ra,0x1
    80001694:	344080e7          	jalr	836(ra) # 800029d4 <_Z11printStringPKc>
    printInteger(result);
    80001698:	00090513          	mv	a0,s2
    8000169c:	00001097          	auipc	ra,0x1
    800016a0:	3a8080e7          	jalr	936(ra) # 80002a44 <_Z12printIntegerm>
    printString("\n");
    800016a4:	00004517          	auipc	a0,0x4
    800016a8:	a2450513          	addi	a0,a0,-1500 # 800050c8 <CONSOLE_STATUS+0xb8>
    800016ac:	00001097          	auipc	ra,0x1
    800016b0:	328080e7          	jalr	808(ra) # 800029d4 <_Z11printStringPKc>
    800016b4:	0380006f          	j	800016ec <_Z11workerBodyCv+0x11c>

    for (; i < 6; i++)
    {
        printString("C: i=");
    800016b8:	00004517          	auipc	a0,0x4
    800016bc:	97850513          	addi	a0,a0,-1672 # 80005030 <CONSOLE_STATUS+0x20>
    800016c0:	00001097          	auipc	ra,0x1
    800016c4:	314080e7          	jalr	788(ra) # 800029d4 <_Z11printStringPKc>
        printInteger(i);
    800016c8:	00048513          	mv	a0,s1
    800016cc:	00001097          	auipc	ra,0x1
    800016d0:	378080e7          	jalr	888(ra) # 80002a44 <_Z12printIntegerm>
        printString("\n");
    800016d4:	00004517          	auipc	a0,0x4
    800016d8:	9f450513          	addi	a0,a0,-1548 # 800050c8 <CONSOLE_STATUS+0xb8>
    800016dc:	00001097          	auipc	ra,0x1
    800016e0:	2f8080e7          	jalr	760(ra) # 800029d4 <_Z11printStringPKc>
    for (; i < 6; i++)
    800016e4:	0014849b          	addiw	s1,s1,1
    800016e8:	0ff4f493          	andi	s1,s1,255
    800016ec:	00500793          	li	a5,5
    800016f0:	fc97f4e3          	bgeu	a5,s1,800016b8 <_Z11workerBodyCv+0xe8>
    }
//    _thread::yield();
}
    800016f4:	01813083          	ld	ra,24(sp)
    800016f8:	01013403          	ld	s0,16(sp)
    800016fc:	00813483          	ld	s1,8(sp)
    80001700:	00013903          	ld	s2,0(sp)
    80001704:	02010113          	addi	sp,sp,32
    80001708:	00008067          	ret

000000008000170c <_Z11workerBodyDv>:

void workerBodyD()
{
    8000170c:	fe010113          	addi	sp,sp,-32
    80001710:	00113c23          	sd	ra,24(sp)
    80001714:	00813823          	sd	s0,16(sp)
    80001718:	00913423          	sd	s1,8(sp)
    8000171c:	01213023          	sd	s2,0(sp)
    80001720:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80001724:	00a00493          	li	s1,10
    80001728:	0380006f          	j	80001760 <_Z11workerBodyDv+0x54>
    for (; i < 13; i++)
    {
        printString("D: i=");
    8000172c:	00004517          	auipc	a0,0x4
    80001730:	93450513          	addi	a0,a0,-1740 # 80005060 <CONSOLE_STATUS+0x50>
    80001734:	00001097          	auipc	ra,0x1
    80001738:	2a0080e7          	jalr	672(ra) # 800029d4 <_Z11printStringPKc>
        printInteger(i);
    8000173c:	00048513          	mv	a0,s1
    80001740:	00001097          	auipc	ra,0x1
    80001744:	304080e7          	jalr	772(ra) # 80002a44 <_Z12printIntegerm>
        printString("\n");
    80001748:	00004517          	auipc	a0,0x4
    8000174c:	98050513          	addi	a0,a0,-1664 # 800050c8 <CONSOLE_STATUS+0xb8>
    80001750:	00001097          	auipc	ra,0x1
    80001754:	284080e7          	jalr	644(ra) # 800029d4 <_Z11printStringPKc>
    for (; i < 13; i++)
    80001758:	0014849b          	addiw	s1,s1,1
    8000175c:	0ff4f493          	andi	s1,s1,255
    80001760:	00c00793          	li	a5,12
    80001764:	fc97f4e3          	bgeu	a5,s1,8000172c <_Z11workerBodyDv+0x20>
    }

    printString("D: yield\n");
    80001768:	00004517          	auipc	a0,0x4
    8000176c:	90050513          	addi	a0,a0,-1792 # 80005068 <CONSOLE_STATUS+0x58>
    80001770:	00001097          	auipc	ra,0x1
    80001774:	264080e7          	jalr	612(ra) # 800029d4 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80001778:	00500313          	li	t1,5
    _thread::yield();
    8000177c:	00000097          	auipc	ra,0x0
    80001780:	534080e7          	jalr	1332(ra) # 80001cb0 <_ZN7_thread5yieldEv>

    uint64 result = fibonacci(16);
    80001784:	01000513          	li	a0,16
    80001788:	00000097          	auipc	ra,0x0
    8000178c:	c7c080e7          	jalr	-900(ra) # 80001404 <_ZL9fibonaccim>
    80001790:	00050913          	mv	s2,a0
    printString("D: fibonaci=");
    80001794:	00004517          	auipc	a0,0x4
    80001798:	8e450513          	addi	a0,a0,-1820 # 80005078 <CONSOLE_STATUS+0x68>
    8000179c:	00001097          	auipc	ra,0x1
    800017a0:	238080e7          	jalr	568(ra) # 800029d4 <_Z11printStringPKc>
    printInteger(result);
    800017a4:	00090513          	mv	a0,s2
    800017a8:	00001097          	auipc	ra,0x1
    800017ac:	29c080e7          	jalr	668(ra) # 80002a44 <_Z12printIntegerm>
    printString("\n");
    800017b0:	00004517          	auipc	a0,0x4
    800017b4:	91850513          	addi	a0,a0,-1768 # 800050c8 <CONSOLE_STATUS+0xb8>
    800017b8:	00001097          	auipc	ra,0x1
    800017bc:	21c080e7          	jalr	540(ra) # 800029d4 <_Z11printStringPKc>
    800017c0:	0380006f          	j	800017f8 <_Z11workerBodyDv+0xec>

    for (; i < 16; i++)
    {
        printString("D: i=");
    800017c4:	00004517          	auipc	a0,0x4
    800017c8:	89c50513          	addi	a0,a0,-1892 # 80005060 <CONSOLE_STATUS+0x50>
    800017cc:	00001097          	auipc	ra,0x1
    800017d0:	208080e7          	jalr	520(ra) # 800029d4 <_Z11printStringPKc>
        printInteger(i);
    800017d4:	00048513          	mv	a0,s1
    800017d8:	00001097          	auipc	ra,0x1
    800017dc:	26c080e7          	jalr	620(ra) # 80002a44 <_Z12printIntegerm>
        printString("\n");
    800017e0:	00004517          	auipc	a0,0x4
    800017e4:	8e850513          	addi	a0,a0,-1816 # 800050c8 <CONSOLE_STATUS+0xb8>
    800017e8:	00001097          	auipc	ra,0x1
    800017ec:	1ec080e7          	jalr	492(ra) # 800029d4 <_Z11printStringPKc>
    for (; i < 16; i++)
    800017f0:	0014849b          	addiw	s1,s1,1
    800017f4:	0ff4f493          	andi	s1,s1,255
    800017f8:	00f00793          	li	a5,15
    800017fc:	fc97f4e3          	bgeu	a5,s1,800017c4 <_Z11workerBodyDv+0xb8>
    }
//    _thread::yield();
    80001800:	01813083          	ld	ra,24(sp)
    80001804:	01013403          	ld	s0,16(sp)
    80001808:	00813483          	ld	s1,8(sp)
    8000180c:	00013903          	ld	s2,0(sp)
    80001810:	02010113          	addi	sp,sp,32
    80001814:	00008067          	ret

0000000080001818 <_Z15TastaturaWorkerv>:
#include "../h/syscall_c.h"



bool finishedTastatura = false;
void TastaturaWorker() {
    80001818:	fe010113          	addi	sp,sp,-32
    8000181c:	00113c23          	sd	ra,24(sp)
    80001820:	00813823          	sd	s0,16(sp)
    80001824:	00913423          	sd	s1,8(sp)
    80001828:	01213023          	sd	s2,0(sp)
    8000182c:	02010413          	addi	s0,sp,32
//    printString("dosa ovdee2!");
    for (uint64 i = 0; i < 16; i++) {
    80001830:	00000913          	li	s2,0
    80001834:	0380006f          	j	8000186c <_Z15TastaturaWorkerv+0x54>
//        printString("Tastatura: i=");
//        printInteger(i);
//        printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            _thread::yield();
    80001838:	00000097          	auipc	ra,0x0
    8000183c:	478080e7          	jalr	1144(ra) # 80001cb0 <_ZN7_thread5yieldEv>
        for (uint64 j = 0; j < 10000; j++) {
    80001840:	00148493          	addi	s1,s1,1
    80001844:	000027b7          	lui	a5,0x2
    80001848:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    8000184c:	0097ee63          	bltu	a5,s1,80001868 <_Z15TastaturaWorkerv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80001850:	00000713          	li	a4,0
    80001854:	000077b7          	lui	a5,0x7
    80001858:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    8000185c:	fce7eee3          	bltu	a5,a4,80001838 <_Z15TastaturaWorkerv+0x20>
    80001860:	00170713          	addi	a4,a4,1
    80001864:	ff1ff06f          	j	80001854 <_Z15TastaturaWorkerv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80001868:	00190913          	addi	s2,s2,1
    8000186c:	00f00793          	li	a5,15
    80001870:	0127e663          	bltu	a5,s2,8000187c <_Z15TastaturaWorkerv+0x64>
        for (uint64 j = 0; j < 10000; j++) {
    80001874:	00000493          	li	s1,0
    80001878:	fcdff06f          	j	80001844 <_Z15TastaturaWorkerv+0x2c>
        }
    }
//    printString("dosa ovdee!");
    int count = Riscv::buff2.getCount();
    8000187c:	00004797          	auipc	a5,0x4
    80001880:	49c7b783          	ld	a5,1180(a5) # 80005d18 <_GLOBAL_OFFSET_TABLE_+0x50>
    80001884:	1187a483          	lw	s1,280(a5)
    while (count >= 0){
    80001888:	0004ce63          	bltz	s1,800018a4 <_Z15TastaturaWorkerv+0x8c>
        --count;
    8000188c:	fff4849b          	addiw	s1,s1,-1
        char x = getc();
    80001890:	00000097          	auipc	ra,0x0
    80001894:	b20080e7          	jalr	-1248(ra) # 800013b0 <_Z4getcv>
        putc(x);
    80001898:	00000097          	auipc	ra,0x0
    8000189c:	b44080e7          	jalr	-1212(ra) # 800013dc <_Z4putcc>
    while (count >= 0){
    800018a0:	fe9ff06f          	j	80001888 <_Z15TastaturaWorkerv+0x70>
    }
    printString("\nTastatura finished!\n");
    800018a4:	00003517          	auipc	a0,0x3
    800018a8:	7e450513          	addi	a0,a0,2020 # 80005088 <CONSOLE_STATUS+0x78>
    800018ac:	00001097          	auipc	ra,0x1
    800018b0:	128080e7          	jalr	296(ra) # 800029d4 <_Z11printStringPKc>
    finishedTastatura = true;
    800018b4:	00100793          	li	a5,1
    800018b8:	00004717          	auipc	a4,0x4
    800018bc:	4cf70423          	sb	a5,1224(a4) # 80005d80 <finishedTastatura>

}
    800018c0:	01813083          	ld	ra,24(sp)
    800018c4:	01013403          	ld	s0,16(sp)
    800018c8:	00813483          	ld	s1,8(sp)
    800018cc:	00013903          	ld	s2,0(sp)
    800018d0:	02010113          	addi	sp,sp,32
    800018d4:	00008067          	ret

00000000800018d8 <_Z13tastaturaTestv>:
void tastaturaTest(){
    800018d8:	ff010113          	addi	sp,sp,-16
    800018dc:	00113423          	sd	ra,8(sp)
    800018e0:	00813023          	sd	s0,0(sp)
    800018e4:	01010413          	addi	s0,sp,16
    __attribute__((unused)) _thread *Tastatura;
    Tastatura = _thread::createThread(TastaturaWorker);
    800018e8:	00000517          	auipc	a0,0x0
    800018ec:	f3050513          	addi	a0,a0,-208 # 80001818 <_Z15TastaturaWorkerv>
    800018f0:	00000097          	auipc	ra,0x0
    800018f4:	1e8080e7          	jalr	488(ra) # 80001ad8 <_ZN7_thread12createThreadEPFvvE>
    printString("Tastatura created\n");
    800018f8:	00003517          	auipc	a0,0x3
    800018fc:	7a850513          	addi	a0,a0,1960 # 800050a0 <CONSOLE_STATUS+0x90>
    80001900:	00001097          	auipc	ra,0x1
    80001904:	0d4080e7          	jalr	212(ra) # 800029d4 <_Z11printStringPKc>

    while (!finishedTastatura) {
    80001908:	00004797          	auipc	a5,0x4
    8000190c:	4787c783          	lbu	a5,1144(a5) # 80005d80 <finishedTastatura>
    80001910:	00079863          	bnez	a5,80001920 <_Z13tastaturaTestv+0x48>
        _thread::yield();
    80001914:	00000097          	auipc	ra,0x0
    80001918:	39c080e7          	jalr	924(ra) # 80001cb0 <_ZN7_thread5yieldEv>
    while (!finishedTastatura) {
    8000191c:	fedff06f          	j	80001908 <_Z13tastaturaTestv+0x30>
    }
}
    80001920:	00813083          	ld	ra,8(sp)
    80001924:	00013403          	ld	s0,0(sp)
    80001928:	01010113          	addi	sp,sp,16
    8000192c:	00008067          	ret

0000000080001930 <_Z8userMainv>:

void userMain() {
    80001930:	ff010113          	addi	sp,sp,-16
    80001934:	00113423          	sd	ra,8(sp)
    80001938:	00813023          	sd	s0,0(sp)
    8000193c:	01010413          	addi	s0,sp,16
//    Threads_C_API_test(); // zadatak 2., niti C API i sinhrona promena konteksta
//    testSleeping();       // ThreadSleeping test
    tastaturaTest();
    80001940:	00000097          	auipc	ra,0x0
    80001944:	f98080e7          	jalr	-104(ra) # 800018d8 <_Z13tastaturaTestv>
}
    80001948:	00813083          	ld	ra,8(sp)
    8000194c:	00013403          	ld	s0,0(sp)
    80001950:	01010113          	addi	sp,sp,16
    80001954:	00008067          	ret

0000000080001958 <main>:

int main()
{
    80001958:	fb010113          	addi	sp,sp,-80
    8000195c:	04113423          	sd	ra,72(sp)
    80001960:	04813023          	sd	s0,64(sp)
    80001964:	02913c23          	sd	s1,56(sp)
    80001968:	03213823          	sd	s2,48(sp)
    8000196c:	05010413          	addi	s0,sp,80
    Riscv::w_stvec((uint64) &Riscv::supervisorTrap);
    80001970:	00004797          	auipc	a5,0x4
    80001974:	3787b783          	ld	a5,888(a5) # 80005ce8 <_GLOBAL_OFFSET_TABLE_+0x20>
    return stvec;
}

inline void Riscv::w_stvec(uint64 stvec)
{
    __asm__ volatile ("csrw stvec, %[stvec]" : : [stvec] "r"(stvec));
    80001978:	10579073          	csrw	stvec,a5
    _thread *threads[5];

    threads[0] = _thread::createThread(&_thread::consoleWrite);
    8000197c:	00004517          	auipc	a0,0x4
    80001980:	39453503          	ld	a0,916(a0) # 80005d10 <_GLOBAL_OFFSET_TABLE_+0x48>
    80001984:	00000097          	auipc	ra,0x0
    80001988:	154080e7          	jalr	340(ra) # 80001ad8 <_ZN7_thread12createThreadEPFvvE>
    8000198c:	faa43c23          	sd	a0,-72(s0)
    threads[1] = _thread::createThread(nullptr);
    80001990:	00000513          	li	a0,0
    80001994:	00000097          	auipc	ra,0x0
    80001998:	144080e7          	jalr	324(ra) # 80001ad8 <_ZN7_thread12createThreadEPFvvE>
    8000199c:	fca43023          	sd	a0,-64(s0)
    _thread::running = threads[1];
    800019a0:	00004797          	auipc	a5,0x4
    800019a4:	3407b783          	ld	a5,832(a5) # 80005ce0 <_GLOBAL_OFFSET_TABLE_+0x18>
    800019a8:	00a7b023          	sd	a0,0(a5)
    if(Riscv::buff2.itemAvailable == nullptr){
    800019ac:	00004797          	auipc	a5,0x4
    800019b0:	36c7b783          	ld	a5,876(a5) # 80005d18 <_GLOBAL_OFFSET_TABLE_+0x50>
    800019b4:	0007b783          	ld	a5,0(a5)
    800019b8:	02078463          	beqz	a5,800019e0 <main+0x88>
        _sem::createSem(&Riscv::buff2.itemAvailable, 0);
    }
    if(Riscv::buff1.itemAvailable == nullptr){
    800019bc:	00004797          	auipc	a5,0x4
    800019c0:	3347b783          	ld	a5,820(a5) # 80005cf0 <_GLOBAL_OFFSET_TABLE_+0x28>
    800019c4:	0007b783          	ld	a5,0(a5)
    800019c8:	02078863          	beqz	a5,800019f8 <main+0xa0>
    __asm__ volatile ("csrw sip, %[sip]" : : [sip] "r"(sip));
}

inline void Riscv::ms_sstatus(uint64 mask)
{
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    800019cc:	00200793          	li	a5,2
    800019d0:	1007a073          	csrs	sstatus,a5
////    threads[4] = _thread::createThread(workerBodyD);
////    printString("ThreadD created\n");
//

    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);
    userMain();
    800019d4:	00000097          	auipc	ra,0x0
    800019d8:	f5c080e7          	jalr	-164(ra) # 80001930 <_Z8userMainv>
    800019dc:	03c0006f          	j	80001a18 <main+0xc0>
        _sem::createSem(&Riscv::buff2.itemAvailable, 0);
    800019e0:	00000593          	li	a1,0
    800019e4:	00004517          	auipc	a0,0x4
    800019e8:	33453503          	ld	a0,820(a0) # 80005d18 <_GLOBAL_OFFSET_TABLE_+0x50>
    800019ec:	00001097          	auipc	ra,0x1
    800019f0:	b40080e7          	jalr	-1216(ra) # 8000252c <_ZN4_sem9createSemEPPS_m>
    800019f4:	fc9ff06f          	j	800019bc <main+0x64>
        _sem::createSem(&Riscv::buff1.itemAvailable, 0);
    800019f8:	00000593          	li	a1,0
    800019fc:	00004517          	auipc	a0,0x4
    80001a00:	2f453503          	ld	a0,756(a0) # 80005cf0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001a04:	00001097          	auipc	ra,0x1
    80001a08:	b28080e7          	jalr	-1240(ra) # 8000252c <_ZN4_sem9createSemEPPS_m>
    80001a0c:	fc1ff06f          	j	800019cc <main+0x74>
//    {
//        _thread::yield();
//    }
    while (!(threads[1]->isFinished() && threads[2]->isFinished()))
    {
        _thread::yield();
    80001a10:	00000097          	auipc	ra,0x0
    80001a14:	2a0080e7          	jalr	672(ra) # 80001cb0 <_ZN7_thread5yieldEv>
    while (!(threads[1]->isFinished() && threads[2]->isFinished()))
    80001a18:	fc043783          	ld	a5,-64(s0)
class _thread
{
public:
    ~_thread() { delete[] stack; }

    bool isFinished() const { return finished; }
    80001a1c:	0287c783          	lbu	a5,40(a5)
    80001a20:	fe0788e3          	beqz	a5,80001a10 <main+0xb8>
    80001a24:	fc843783          	ld	a5,-56(s0)
    80001a28:	0287c783          	lbu	a5,40(a5)
    80001a2c:	fe0782e3          	beqz	a5,80001a10 <main+0xb8>
    }
    printString("test");
    80001a30:	00003517          	auipc	a0,0x3
    80001a34:	68850513          	addi	a0,a0,1672 # 800050b8 <CONSOLE_STATUS+0xa8>
    80001a38:	00001097          	auipc	ra,0x1
    80001a3c:	f9c080e7          	jalr	-100(ra) # 800029d4 <_Z11printStringPKc>
    //DODATI DELETE I NEW!!!
    for (auto &thread: threads)
    80001a40:	fb840493          	addi	s1,s0,-72
    80001a44:	0140006f          	j	80001a58 <main+0x100>
    {
        delete thread;
    80001a48:	00090513          	mv	a0,s2
    80001a4c:	00000097          	auipc	ra,0x0
    80001a50:	5d4080e7          	jalr	1492(ra) # 80002020 <_ZdlPv>
    for (auto &thread: threads)
    80001a54:	00848493          	addi	s1,s1,8
    80001a58:	fe040793          	addi	a5,s0,-32
    80001a5c:	02f48063          	beq	s1,a5,80001a7c <main+0x124>
        delete thread;
    80001a60:	0004b903          	ld	s2,0(s1)
    80001a64:	fe0908e3          	beqz	s2,80001a54 <main+0xfc>
    ~_thread() { delete[] stack; }
    80001a68:	00893503          	ld	a0,8(s2)
    80001a6c:	fc050ee3          	beqz	a0,80001a48 <main+0xf0>
    80001a70:	00000097          	auipc	ra,0x0
    80001a74:	5d8080e7          	jalr	1496(ra) # 80002048 <_ZdaPv>
    80001a78:	fd1ff06f          	j	80001a48 <main+0xf0>
    }
    printString("Finished\n");
    80001a7c:	00003517          	auipc	a0,0x3
    80001a80:	64450513          	addi	a0,a0,1604 # 800050c0 <CONSOLE_STATUS+0xb0>
    80001a84:	00001097          	auipc	ra,0x1
    80001a88:	f50080e7          	jalr	-176(ra) # 800029d4 <_Z11printStringPKc>

    return 0;
}
    80001a8c:	00000513          	li	a0,0
    80001a90:	04813083          	ld	ra,72(sp)
    80001a94:	04013403          	ld	s0,64(sp)
    80001a98:	03813483          	ld	s1,56(sp)
    80001a9c:	03013903          	ld	s2,48(sp)
    80001aa0:	05010113          	addi	sp,sp,80
    80001aa4:	00008067          	ret

0000000080001aa8 <_ZN7_thread8setSleepEv>:

_thread *_thread::running = nullptr;

uint64 _thread::timeSliceCounter = 0;

void _thread::setSleep(){
    80001aa8:	ff010113          	addi	sp,sp,-16
    80001aac:	00813423          	sd	s0,8(sp)
    80001ab0:	01010413          	addi	s0,sp,16
    if(!_thread::sleeping)
    80001ab4:	03954783          	lbu	a5,57(a0)
    80001ab8:	00079c63          	bnez	a5,80001ad0 <_ZN7_thread8setSleepEv+0x28>
        _thread::sleeping = true;
    80001abc:	00100793          	li	a5,1
    80001ac0:	02f50ca3          	sb	a5,57(a0)
    else
        _thread::sleeping = false;
}
    80001ac4:	00813403          	ld	s0,8(sp)
    80001ac8:	01010113          	addi	sp,sp,16
    80001acc:	00008067          	ret
        _thread::sleeping = false;
    80001ad0:	02050ca3          	sb	zero,57(a0)
}
    80001ad4:	ff1ff06f          	j	80001ac4 <_ZN7_thread8setSleepEv+0x1c>

0000000080001ad8 <_ZN7_thread12createThreadEPFvvE>:

//mickov kod za kreiranje niti
_thread *_thread::createThread(Body body)
{
    80001ad8:	fe010113          	addi	sp,sp,-32
    80001adc:	00113c23          	sd	ra,24(sp)
    80001ae0:	00813823          	sd	s0,16(sp)
    80001ae4:	00913423          	sd	s1,8(sp)
    80001ae8:	01213023          	sd	s2,0(sp)
    80001aec:	02010413          	addi	s0,sp,32
    80001af0:	00050913          	mv	s2,a0
    return new _thread(body, TIME_SLICE);
    80001af4:	04800513          	li	a0,72
    80001af8:	00000097          	auipc	ra,0x0
    80001afc:	4d8080e7          	jalr	1240(ra) # 80001fd0 <_Znwm>
    80001b00:	00050493          	mv	s1,a0
            stack(body != nullptr ? new uint64[STACK_SIZE] : nullptr),
            context({(uint64) &threadWrapper,
                     stack != nullptr ? (uint64) &stack[STACK_SIZE] : 0
                    }),
            timeSlice(timeSlice),
            finished(false)
    80001b04:	01253023          	sd	s2,0(a0)
            stack(body != nullptr ? new uint64[STACK_SIZE] : nullptr),
    80001b08:	00090a63          	beqz	s2,80001b1c <_ZN7_thread12createThreadEPFvvE+0x44>
    80001b0c:	00002537          	lui	a0,0x2
    80001b10:	00000097          	auipc	ra,0x0
    80001b14:	4e8080e7          	jalr	1256(ra) # 80001ff8 <_Znam>
    80001b18:	0080006f          	j	80001b20 <_ZN7_thread12createThreadEPFvvE+0x48>
    80001b1c:	00000513          	li	a0,0
            finished(false)
    80001b20:	00a4b423          	sd	a0,8(s1)
    80001b24:	00000797          	auipc	a5,0x0
    80001b28:	1a878793          	addi	a5,a5,424 # 80001ccc <_ZN7_thread13threadWrapperEv>
    80001b2c:	00f4b823          	sd	a5,16(s1)
                     stack != nullptr ? (uint64) &stack[STACK_SIZE] : 0
    80001b30:	04050063          	beqz	a0,80001b70 <_ZN7_thread12createThreadEPFvvE+0x98>
    80001b34:	000027b7          	lui	a5,0x2
    80001b38:	00f507b3          	add	a5,a0,a5
            finished(false)
    80001b3c:	00f4bc23          	sd	a5,24(s1)
    80001b40:	00200793          	li	a5,2
    80001b44:	02f4b023          	sd	a5,32(s1)
    80001b48:	02048423          	sb	zero,40(s1)
    80001b4c:	0204b823          	sd	zero,48(s1)
    80001b50:	02048c23          	sb	zero,56(s1)
    80001b54:	02048ca3          	sb	zero,57(s1)
    80001b58:	0404b023          	sd	zero,64(s1)
    {
        if (body != nullptr) { Scheduler::put(this);}
    80001b5c:	02090c63          	beqz	s2,80001b94 <_ZN7_thread12createThreadEPFvvE+0xbc>
    80001b60:	00048513          	mv	a0,s1
    80001b64:	00001097          	auipc	ra,0x1
    80001b68:	d14080e7          	jalr	-748(ra) # 80002878 <_ZN9Scheduler3putEP7_thread>
    80001b6c:	0280006f          	j	80001b94 <_ZN7_thread12createThreadEPFvvE+0xbc>
                     stack != nullptr ? (uint64) &stack[STACK_SIZE] : 0
    80001b70:	00000793          	li	a5,0
    80001b74:	fc9ff06f          	j	80001b3c <_ZN7_thread12createThreadEPFvvE+0x64>
    80001b78:	00050913          	mv	s2,a0
    80001b7c:	00048513          	mv	a0,s1
    80001b80:	00000097          	auipc	ra,0x0
    80001b84:	4a0080e7          	jalr	1184(ra) # 80002020 <_ZdlPv>
    80001b88:	00090513          	mv	a0,s2
    80001b8c:	00005097          	auipc	ra,0x5
    80001b90:	53c080e7          	jalr	1340(ra) # 800070c8 <_Unwind_Resume>
}
    80001b94:	00048513          	mv	a0,s1
    80001b98:	01813083          	ld	ra,24(sp)
    80001b9c:	01013403          	ld	s0,16(sp)
    80001ba0:	00813483          	ld	s1,8(sp)
    80001ba4:	00013903          	ld	s2,0(sp)
    80001ba8:	02010113          	addi	sp,sp,32
    80001bac:	00008067          	ret

0000000080001bb0 <_ZN7_thread12createThreadEPPS_PFvvEPvS4_>:
//poziv za projekat
int _thread::createThread(thread_t* handle, Body body, void *args, void *stack)
{
    80001bb0:	fc010113          	addi	sp,sp,-64
    80001bb4:	02113c23          	sd	ra,56(sp)
    80001bb8:	02813823          	sd	s0,48(sp)
    80001bbc:	02913423          	sd	s1,40(sp)
    80001bc0:	03213023          	sd	s2,32(sp)
    80001bc4:	01313c23          	sd	s3,24(sp)
    80001bc8:	01413823          	sd	s4,16(sp)
    80001bcc:	01513423          	sd	s5,8(sp)
    80001bd0:	04010413          	addi	s0,sp,64
    80001bd4:	00050a13          	mv	s4,a0
    80001bd8:	00058993          	mv	s3,a1
    80001bdc:	00060a93          	mv	s5,a2
    80001be0:	00068913          	mv	s2,a3
    *handle = new _thread(body, args, stack);
    80001be4:	04800513          	li	a0,72
    80001be8:	00000097          	auipc	ra,0x0
    80001bec:	3e8080e7          	jalr	1000(ra) # 80001fd0 <_Znwm>
    80001bf0:	00050493          	mv	s1,a0
            context({(uint64) &threadWrapper,
                     stack != nullptr ?  (uint64) &stack[1024] : 0
                    }),
            timeSlice(DEFAULT_TIME_SLICE),
            finished(false),
            args(args)
    80001bf4:	01353023          	sd	s3,0(a0) # 2000 <_entry-0x7fffe000>
            stack(body != nullptr ? (uint64*)stackk : nullptr),
    80001bf8:	04098a63          	beqz	s3,80001c4c <_ZN7_thread12createThreadEPPS_PFvvEPvS4_+0x9c>
            args(args)
    80001bfc:	0124b423          	sd	s2,8(s1)
    80001c00:	00000797          	auipc	a5,0x0
    80001c04:	0cc78793          	addi	a5,a5,204 # 80001ccc <_ZN7_thread13threadWrapperEv>
    80001c08:	00f4b823          	sd	a5,16(s1)
                     stack != nullptr ?  (uint64) &stack[1024] : 0
    80001c0c:	04090463          	beqz	s2,80001c54 <_ZN7_thread12createThreadEPPS_PFvvEPvS4_+0xa4>
    80001c10:	000026b7          	lui	a3,0x2
    80001c14:	00d90933          	add	s2,s2,a3
            args(args)
    80001c18:	0124bc23          	sd	s2,24(s1)
    80001c1c:	00200793          	li	a5,2
    80001c20:	02f4b023          	sd	a5,32(s1)
    80001c24:	02048423          	sb	zero,40(s1)
    80001c28:	0354b823          	sd	s5,48(s1)
    80001c2c:	02048c23          	sb	zero,56(s1)
    80001c30:	02048ca3          	sb	zero,57(s1)
    80001c34:	0404b023          	sd	zero,64(s1)
    {
        if (body != nullptr) {
    80001c38:	02098263          	beqz	s3,80001c5c <_ZN7_thread12createThreadEPPS_PFvvEPvS4_+0xac>
            Scheduler::put(this);
    80001c3c:	00048513          	mv	a0,s1
    80001c40:	00001097          	auipc	ra,0x1
    80001c44:	c38080e7          	jalr	-968(ra) # 80002878 <_ZN9Scheduler3putEP7_thread>
    80001c48:	0140006f          	j	80001c5c <_ZN7_thread12createThreadEPPS_PFvvEPvS4_+0xac>
            stack(body != nullptr ? (uint64*)stackk : nullptr),
    80001c4c:	00000913          	li	s2,0
    80001c50:	fadff06f          	j	80001bfc <_ZN7_thread12createThreadEPPS_PFvvEPvS4_+0x4c>
                     stack != nullptr ?  (uint64) &stack[1024] : 0
    80001c54:	00000913          	li	s2,0
    80001c58:	fc1ff06f          	j	80001c18 <_ZN7_thread12createThreadEPPS_PFvvEPvS4_+0x68>
    80001c5c:	009a3023          	sd	s1,0(s4)
    if(*handle != nullptr)
    80001c60:	02048663          	beqz	s1,80001c8c <_ZN7_thread12createThreadEPPS_PFvvEPvS4_+0xdc>
        return 0;
    80001c64:	00000513          	li	a0,0
    else
        return -2;
}
    80001c68:	03813083          	ld	ra,56(sp)
    80001c6c:	03013403          	ld	s0,48(sp)
    80001c70:	02813483          	ld	s1,40(sp)
    80001c74:	02013903          	ld	s2,32(sp)
    80001c78:	01813983          	ld	s3,24(sp)
    80001c7c:	01013a03          	ld	s4,16(sp)
    80001c80:	00813a83          	ld	s5,8(sp)
    80001c84:	04010113          	addi	sp,sp,64
    80001c88:	00008067          	ret
        return -2;
    80001c8c:	ffe00513          	li	a0,-2
    80001c90:	fd9ff06f          	j	80001c68 <_ZN7_thread12createThreadEPPS_PFvvEPvS4_+0xb8>
    80001c94:	00050913          	mv	s2,a0
    *handle = new _thread(body, args, stack);
    80001c98:	00048513          	mv	a0,s1
    80001c9c:	00000097          	auipc	ra,0x0
    80001ca0:	384080e7          	jalr	900(ra) # 80002020 <_ZdlPv>
    80001ca4:	00090513          	mv	a0,s2
    80001ca8:	00005097          	auipc	ra,0x5
    80001cac:	420080e7          	jalr	1056(ra) # 800070c8 <_Unwind_Resume>

0000000080001cb0 <_ZN7_thread5yieldEv>:

void _thread::yield()
{
    80001cb0:	ff010113          	addi	sp,sp,-16
    80001cb4:	00813423          	sd	s0,8(sp)
    80001cb8:	01010413          	addi	s0,sp,16
    __asm__ volatile ("ecall");
    80001cbc:	00000073          	ecall
}
    80001cc0:	00813403          	ld	s0,8(sp)
    80001cc4:	01010113          	addi	sp,sp,16
    80001cc8:	00008067          	ret

0000000080001ccc <_ZN7_thread13threadWrapperEv>:

    _thread::contextSwitch(&old->context, &running->context);
}

void _thread::threadWrapper()
{
    80001ccc:	fe010113          	addi	sp,sp,-32
    80001cd0:	00113c23          	sd	ra,24(sp)
    80001cd4:	00813823          	sd	s0,16(sp)
    80001cd8:	00913423          	sd	s1,8(sp)
    80001cdc:	02010413          	addi	s0,sp,32
    Riscv::popSppSpie();
    80001ce0:	00000097          	auipc	ra,0x0
    80001ce4:	420080e7          	jalr	1056(ra) # 80002100 <_ZN5Riscv10popSppSpieEv>
    running->body();
    80001ce8:	00004497          	auipc	s1,0x4
    80001cec:	0a048493          	addi	s1,s1,160 # 80005d88 <_ZN7_thread7runningE>
    80001cf0:	0004b783          	ld	a5,0(s1)
    80001cf4:	0007b783          	ld	a5,0(a5)
    80001cf8:	000780e7          	jalr	a5
    running->setFinished(true);
    80001cfc:	0004b783          	ld	a5,0(s1)
    void setFinished(bool value) { finished = value; }
    80001d00:	00100713          	li	a4,1
    80001d04:	02e78423          	sb	a4,40(a5)
    printString("gotova nit");
    80001d08:	00003517          	auipc	a0,0x3
    80001d0c:	3c850513          	addi	a0,a0,968 # 800050d0 <CONSOLE_STATUS+0xc0>
    80001d10:	00001097          	auipc	ra,0x1
    80001d14:	cc4080e7          	jalr	-828(ra) # 800029d4 <_Z11printStringPKc>
    _thread::yield();
    80001d18:	00000097          	auipc	ra,0x0
    80001d1c:	f98080e7          	jalr	-104(ra) # 80001cb0 <_ZN7_thread5yieldEv>
}
    80001d20:	01813083          	ld	ra,24(sp)
    80001d24:	01013403          	ld	s0,16(sp)
    80001d28:	00813483          	ld	s1,8(sp)
    80001d2c:	02010113          	addi	sp,sp,32
    80001d30:	00008067          	ret

0000000080001d34 <_ZN7_thread8dispatchEv>:
{
    80001d34:	fe010113          	addi	sp,sp,-32
    80001d38:	00113c23          	sd	ra,24(sp)
    80001d3c:	00813823          	sd	s0,16(sp)
    80001d40:	00913423          	sd	s1,8(sp)
    80001d44:	01213023          	sd	s2,0(sp)
    80001d48:	02010413          	addi	s0,sp,32
    _thread *old = running;
    80001d4c:	00004497          	auipc	s1,0x4
    80001d50:	03c4b483          	ld	s1,60(s1) # 80005d88 <_ZN7_thread7runningE>
    bool isFinished() const { return finished; }
    80001d54:	0284c783          	lbu	a5,40(s1)
    if (!old->isFinished() && !old->blocked && !old->sleeping) {
    80001d58:	00079a63          	bnez	a5,80001d6c <_ZN7_thread8dispatchEv+0x38>
    80001d5c:	0384c703          	lbu	a4,56(s1)
    80001d60:	00071663          	bnez	a4,80001d6c <_ZN7_thread8dispatchEv+0x38>
    80001d64:	0394c703          	lbu	a4,57(s1)
    80001d68:	04070c63          	beqz	a4,80001dc0 <_ZN7_thread8dispatchEv+0x8c>
    else if(!old->isFinished() && old->blocked && !old->sleeping){
    80001d6c:	06079063          	bnez	a5,80001dcc <_ZN7_thread8dispatchEv+0x98>
    80001d70:	0384c783          	lbu	a5,56(s1)
    80001d74:	04078c63          	beqz	a5,80001dcc <_ZN7_thread8dispatchEv+0x98>
    80001d78:	0394c783          	lbu	a5,57(s1)
    80001d7c:	04079863          	bnez	a5,80001dcc <_ZN7_thread8dispatchEv+0x98>
        if(old->blockedBy != nullptr){
    80001d80:	0404b503          	ld	a0,64(s1)
    80001d84:	04050463          	beqz	a0,80001dcc <_ZN7_thread8dispatchEv+0x98>
            old->blockedBy->blockedList().addLast(old);
    80001d88:	00001097          	auipc	ra,0x1
    80001d8c:	a2c080e7          	jalr	-1492(ra) # 800027b4 <_ZN4_sem11blockedListEv>
    80001d90:	00050913          	mv	s2,a0
        if (!tail) { tail = head; }
    }

    void addLast(T *data)
    {
        Elem *elem = new Elem(data, 0);
    80001d94:	01800513          	li	a0,24
    80001d98:	00000097          	auipc	ra,0x0
    80001d9c:	238080e7          	jalr	568(ra) # 80001fd0 <_Znwm>
        Elem(T *data, Elem *next, int sleepTime = 0) : data(data), next(next), sleepTime(sleepTime) {}
    80001da0:	00953023          	sd	s1,0(a0)
    80001da4:	00053423          	sd	zero,8(a0)
    80001da8:	00052823          	sw	zero,16(a0)
        if (tail)
    80001dac:	00893783          	ld	a5,8(s2)
    80001db0:	04078a63          	beqz	a5,80001e04 <_ZN7_thread8dispatchEv+0xd0>
        {
            tail->next = elem;
    80001db4:	00a7b423          	sd	a0,8(a5)
            tail = elem;
    80001db8:	00a93423          	sd	a0,8(s2)
    80001dbc:	0100006f          	j	80001dcc <_ZN7_thread8dispatchEv+0x98>
        Scheduler::put(old);
    80001dc0:	00048513          	mv	a0,s1
    80001dc4:	00001097          	auipc	ra,0x1
    80001dc8:	ab4080e7          	jalr	-1356(ra) # 80002878 <_ZN9Scheduler3putEP7_thread>
    running = Scheduler::get();
    80001dcc:	00001097          	auipc	ra,0x1
    80001dd0:	a44080e7          	jalr	-1468(ra) # 80002810 <_ZN9Scheduler3getEv>
    80001dd4:	00004797          	auipc	a5,0x4
    80001dd8:	faa7ba23          	sd	a0,-76(a5) # 80005d88 <_ZN7_thread7runningE>
    _thread::contextSwitch(&old->context, &running->context);
    80001ddc:	01050593          	addi	a1,a0,16
    80001de0:	01048513          	addi	a0,s1,16
    80001de4:	fffff097          	auipc	ra,0xfffff
    80001de8:	34c080e7          	jalr	844(ra) # 80001130 <_ZN7_thread13contextSwitchEPNS_7ContextES1_>
}
    80001dec:	01813083          	ld	ra,24(sp)
    80001df0:	01013403          	ld	s0,16(sp)
    80001df4:	00813483          	ld	s1,8(sp)
    80001df8:	00013903          	ld	s2,0(sp)
    80001dfc:	02010113          	addi	sp,sp,32
    80001e00:	00008067          	ret
        } else
        {
            head = tail = elem;
    80001e04:	00a93423          	sd	a0,8(s2)
    80001e08:	00a93023          	sd	a0,0(s2)
        }
    }
    80001e0c:	fc1ff06f          	j	80001dcc <_ZN7_thread8dispatchEv+0x98>

0000000080001e10 <_ZN7_thread10threadStopEv>:

int _thread::threadStop(){
    80001e10:	ff010113          	addi	sp,sp,-16
    80001e14:	00813423          	sd	s0,8(sp)
    80001e18:	01010413          	addi	s0,sp,16
    void setFinished(bool value) { finished = value; }
    80001e1c:	00004797          	auipc	a5,0x4
    80001e20:	f6c7b783          	ld	a5,-148(a5) # 80005d88 <_ZN7_thread7runningE>
    80001e24:	00100713          	li	a4,1
    80001e28:	02e78423          	sb	a4,40(a5)
//    }

//    delete []running->stack;
//    nzm da se brise nit ili se samo zaustavlja
return 0;
}
    80001e2c:	00000513          	li	a0,0
    80001e30:	00813403          	ld	s0,8(sp)
    80001e34:	01010113          	addi	sp,sp,16
    80001e38:	00008067          	ret

0000000080001e3c <_ZN7_thread5dblckEv>:

void _thread::dblck(){
    80001e3c:	ff010113          	addi	sp,sp,-16
    80001e40:	00813423          	sd	s0,8(sp)
    80001e44:	01010413          	addi	s0,sp,16
    _thread::blocked = false;
    80001e48:	02050c23          	sb	zero,56(a0)
    _thread::blockedBy = nullptr;
    80001e4c:	04053023          	sd	zero,64(a0)
}
    80001e50:	00813403          	ld	s0,8(sp)
    80001e54:	01010113          	addi	sp,sp,16
    80001e58:	00008067          	ret

0000000080001e5c <_ZN7_thread5sleepEm>:


int _thread::sleep(time_t time) {
    80001e5c:	fe010113          	addi	sp,sp,-32
    80001e60:	00113c23          	sd	ra,24(sp)
    80001e64:	00813823          	sd	s0,16(sp)
    80001e68:	00913423          	sd	s1,8(sp)
    80001e6c:	01213023          	sd	s2,0(sp)
    80001e70:	02010413          	addi	s0,sp,32
    80001e74:	00050493          	mv	s1,a0
    running->setSleep();
    80001e78:	00004917          	auipc	s2,0x4
    80001e7c:	f1090913          	addi	s2,s2,-240 # 80005d88 <_ZN7_thread7runningE>
    80001e80:	00093503          	ld	a0,0(s2)
    80001e84:	00000097          	auipc	ra,0x0
    80001e88:	c24080e7          	jalr	-988(ra) # 80001aa8 <_ZN7_thread8setSleepEv>
    Riscv::sleepingThreads.addSleepingThread(running, time);
    80001e8c:	00093903          	ld	s2,0(s2)
    80001e90:	0004849b          	sext.w	s1,s1
        if (!tail) { return 0; }
        return tail->data;
    }

    void addSleepingThread(T *data, int time){
        Elem *elem = new Elem(data);
    80001e94:	01800513          	li	a0,24
    80001e98:	00000097          	auipc	ra,0x0
    80001e9c:	138080e7          	jalr	312(ra) # 80001fd0 <_Znwm>
        Elem(T *data) : data(data), next(nullptr), sleepTime(0) {}
    80001ea0:	01253023          	sd	s2,0(a0)
    80001ea4:	00053423          	sd	zero,8(a0)
    80001ea8:	00052823          	sw	zero,16(a0)
        if(!head){
    80001eac:	00004797          	auipc	a5,0x4
    80001eb0:	e5c7b783          	ld	a5,-420(a5) # 80005d08 <_GLOBAL_OFFSET_TABLE_+0x40>
    80001eb4:	0007b783          	ld	a5,0(a5)
    80001eb8:	00078863          	beqz	a5,80001ec8 <_ZN7_thread5sleepEm+0x6c>
            elem->sleepTime = time;
            tail = head;
            return;
        }
        int timeCount = 0;
        Elem *next = head, *prev = nullptr;
    80001ebc:	00000693          	li	a3,0
        int timeCount = 0;
    80001ec0:	00000713          	li	a4,0
    80001ec4:	0200006f          	j	80001ee4 <_ZN7_thread5sleepEm+0x88>
            head = elem;
    80001ec8:	00004797          	auipc	a5,0x4
    80001ecc:	e407b783          	ld	a5,-448(a5) # 80005d08 <_GLOBAL_OFFSET_TABLE_+0x40>
    80001ed0:	00a7b023          	sd	a0,0(a5)
            elem->sleepTime = time;
    80001ed4:	00952823          	sw	s1,16(a0)
            tail = head;
    80001ed8:	00a7b423          	sd	a0,8(a5)
            return;
    80001edc:	0500006f          	j	80001f2c <_ZN7_thread5sleepEm+0xd0>

        while(time >= timeCount + next->sleepTime){
             timeCount += next->sleepTime;
             prev= next;
             next = next->next;
    80001ee0:	00060793          	mv	a5,a2
        while(time >= timeCount + next->sleepTime){
    80001ee4:	0107a603          	lw	a2,16(a5)
    80001ee8:	00070593          	mv	a1,a4
    80001eec:	00e6073b          	addw	a4,a2,a4
    80001ef0:	00e4cc63          	blt	s1,a4,80001f08 <_ZN7_thread5sleepEm+0xac>
             next = next->next;
    80001ef4:	0087b603          	ld	a2,8(a5)
             prev= next;
    80001ef8:	00078693          	mv	a3,a5
             if(next == nullptr)
    80001efc:	fe0612e3          	bnez	a2,80001ee0 <_ZN7_thread5sleepEm+0x84>
             next = next->next;
    80001f00:	00060793          	mv	a5,a2
             timeCount += next->sleepTime;
    80001f04:	00070593          	mv	a1,a4
                 break;
        }
        if(!prev){
    80001f08:	04068463          	beqz	a3,80001f50 <_ZN7_thread5sleepEm+0xf4>
            head = elem;
            head->next = next;
            head->next->sleepTime -=  head->sleepTime;
        }
        else {
            prev->next = elem;
    80001f0c:	00a6b423          	sd	a0,8(a3) # 2008 <_entry-0x7fffdff8>
            elem->next = next;
    80001f10:	00f53423          	sd	a5,8(a0)
            int diff = time - timeCount;
    80001f14:	40b484bb          	subw	s1,s1,a1
            elem->sleepTime = diff;
    80001f18:	00952823          	sw	s1,16(a0)
            if(next != nullptr)
    80001f1c:	00078863          	beqz	a5,80001f2c <_ZN7_thread5sleepEm+0xd0>
                next->sleepTime -= diff;
    80001f20:	0107a703          	lw	a4,16(a5)
    80001f24:	409704bb          	subw	s1,a4,s1
    80001f28:	0097a823          	sw	s1,16(a5)
    dispatch();
    80001f2c:	00000097          	auipc	ra,0x0
    80001f30:	e08080e7          	jalr	-504(ra) # 80001d34 <_ZN7_thread8dispatchEv>
    return 0; //TODO povratna vrednost!!!
}
    80001f34:	00000513          	li	a0,0
    80001f38:	01813083          	ld	ra,24(sp)
    80001f3c:	01013403          	ld	s0,16(sp)
    80001f40:	00813483          	ld	s1,8(sp)
    80001f44:	00013903          	ld	s2,0(sp)
    80001f48:	02010113          	addi	sp,sp,32
    80001f4c:	00008067          	ret
            head = elem;
    80001f50:	00004717          	auipc	a4,0x4
    80001f54:	db873703          	ld	a4,-584(a4) # 80005d08 <_GLOBAL_OFFSET_TABLE_+0x40>
    80001f58:	00a73023          	sd	a0,0(a4)
            head->next = next;
    80001f5c:	00f53423          	sd	a5,8(a0)
            head->next->sleepTime -=  head->sleepTime;
    80001f60:	01052683          	lw	a3,16(a0)
    80001f64:	0107a703          	lw	a4,16(a5)
    80001f68:	40d7073b          	subw	a4,a4,a3
    80001f6c:	00e7a823          	sw	a4,16(a5)
    80001f70:	fbdff06f          	j	80001f2c <_ZN7_thread5sleepEm+0xd0>

0000000080001f74 <_ZN7_thread12consoleWriteEv>:

void _thread::consoleWrite() {
    80001f74:	ff010113          	addi	sp,sp,-16
    80001f78:	00113423          	sd	ra,8(sp)
    80001f7c:	00813023          	sd	s0,0(sp)
    80001f80:	01010413          	addi	s0,sp,16
    {
        while(true){
            char c = Riscv::buff1.take();
    80001f84:	00004517          	auipc	a0,0x4
    80001f88:	d6c53503          	ld	a0,-660(a0) # 80005cf0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001f8c:	00001097          	auipc	ra,0x1
    80001f90:	990080e7          	jalr	-1648(ra) # 8000291c <_ZN14KeyboardBuffer4takeEv>
            if((*((char*)CONSOLE_STATUS) & CONSOLE_TX_STATUS_BIT) && (Riscv::buff1.getCount() > 0)){
    80001f94:	00004797          	auipc	a5,0x4
    80001f98:	d447b783          	ld	a5,-700(a5) # 80005cd8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80001f9c:	0007b783          	ld	a5,0(a5)
    80001fa0:	0007c783          	lbu	a5,0(a5)
    80001fa4:	0207f793          	andi	a5,a5,32
    80001fa8:	fc078ee3          	beqz	a5,80001f84 <_ZN7_thread12consoleWriteEv+0x10>
public:
    KeyboardBuffer() : head(0),tail(0),count(0) { _sem::createSem(&itemAvailable, 0);}
    char take ();
    void append (char c);
    _sem *itemAvailable;
    uint64 getCount() { return count; }
    80001fac:	00004797          	auipc	a5,0x4
    80001fb0:	d447b783          	ld	a5,-700(a5) # 80005cf0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001fb4:	1187b783          	ld	a5,280(a5)
    80001fb8:	fc0786e3          	beqz	a5,80001f84 <_ZN7_thread12consoleWriteEv+0x10>
                *((char*)CONSOLE_TX_DATA) = c;
    80001fbc:	00004797          	auipc	a5,0x4
    80001fc0:	d3c7b783          	ld	a5,-708(a5) # 80005cf8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001fc4:	0007b783          	ld	a5,0(a5)
    80001fc8:	00a78023          	sb	a0,0(a5)
    80001fcc:	fb9ff06f          	j	80001f84 <_ZN7_thread12consoleWriteEv+0x10>

0000000080001fd0 <_Znwm>:
#include "../h/print.hpp"

using size_t = decltype(sizeof(0));

void *operator new(size_t n)
{
    80001fd0:	ff010113          	addi	sp,sp,-16
    80001fd4:	00113423          	sd	ra,8(sp)
    80001fd8:	00813023          	sd	s0,0(sp)
    80001fdc:	01010413          	addi	s0,sp,16
//    printString("new operator");
    return __mem_alloc(n);
    80001fe0:	00003097          	auipc	ra,0x3
    80001fe4:	ca8080e7          	jalr	-856(ra) # 80004c88 <__mem_alloc>
}
    80001fe8:	00813083          	ld	ra,8(sp)
    80001fec:	00013403          	ld	s0,0(sp)
    80001ff0:	01010113          	addi	sp,sp,16
    80001ff4:	00008067          	ret

0000000080001ff8 <_Znam>:

void *operator new[](size_t n)
{
    80001ff8:	ff010113          	addi	sp,sp,-16
    80001ffc:	00113423          	sd	ra,8(sp)
    80002000:	00813023          	sd	s0,0(sp)
    80002004:	01010413          	addi	s0,sp,16
    return __mem_alloc(n);
    80002008:	00003097          	auipc	ra,0x3
    8000200c:	c80080e7          	jalr	-896(ra) # 80004c88 <__mem_alloc>
}
    80002010:	00813083          	ld	ra,8(sp)
    80002014:	00013403          	ld	s0,0(sp)
    80002018:	01010113          	addi	sp,sp,16
    8000201c:	00008067          	ret

0000000080002020 <_ZdlPv>:

void operator delete(void *p) noexcept
{
    80002020:	ff010113          	addi	sp,sp,-16
    80002024:	00113423          	sd	ra,8(sp)
    80002028:	00813023          	sd	s0,0(sp)
    8000202c:	01010413          	addi	s0,sp,16
    __mem_free(p);
    80002030:	00003097          	auipc	ra,0x3
    80002034:	b8c080e7          	jalr	-1140(ra) # 80004bbc <__mem_free>
}
    80002038:	00813083          	ld	ra,8(sp)
    8000203c:	00013403          	ld	s0,0(sp)
    80002040:	01010113          	addi	sp,sp,16
    80002044:	00008067          	ret

0000000080002048 <_ZdaPv>:

void operator delete[](void *p) noexcept
{
    80002048:	ff010113          	addi	sp,sp,-16
    8000204c:	00113423          	sd	ra,8(sp)
    80002050:	00813023          	sd	s0,0(sp)
    80002054:	01010413          	addi	s0,sp,16
    __mem_free(p);
    80002058:	00003097          	auipc	ra,0x3
    8000205c:	b64080e7          	jalr	-1180(ra) # 80004bbc <__mem_free>
    80002060:	00813083          	ld	ra,8(sp)
    80002064:	00013403          	ld	s0,0(sp)
    80002068:	01010113          	addi	sp,sp,16
    8000206c:	00008067          	ret

0000000080002070 <_Z41__static_initialization_and_destruction_0ii>:
    }
        else
    {
        // unexpected trap cause
    }
    80002070:	00100793          	li	a5,1
    80002074:	00f50463          	beq	a0,a5,8000207c <_Z41__static_initialization_and_destruction_0ii+0xc>
    80002078:	00008067          	ret
    8000207c:	000107b7          	lui	a5,0x10
    80002080:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80002084:	fef59ae3          	bne	a1,a5,80002078 <_Z41__static_initialization_and_destruction_0ii+0x8>
    80002088:	fe010113          	addi	sp,sp,-32
    8000208c:	00113c23          	sd	ra,24(sp)
    80002090:	00813823          	sd	s0,16(sp)
    80002094:	00913423          	sd	s1,8(sp)
    80002098:	02010413          	addi	s0,sp,32
    };

    Elem *head, *tail;

public:
    List() : head(0), tail(0) {}
    8000209c:	00004497          	auipc	s1,0x4
    800020a0:	cfc48493          	addi	s1,s1,-772 # 80005d98 <_ZN5Riscv15sleepingThreadsE>
    800020a4:	0004b023          	sd	zero,0(s1)
    800020a8:	0004b423          	sd	zero,8(s1)
    KeyboardBuffer() : head(0),tail(0),count(0) { _sem::createSem(&itemAvailable, 0);}
    800020ac:	1004bc23          	sd	zero,280(s1)
    800020b0:	1204b023          	sd	zero,288(s1)
    800020b4:	1204b423          	sd	zero,296(s1)
    800020b8:	00000593          	li	a1,0
    800020bc:	00004517          	auipc	a0,0x4
    800020c0:	cec50513          	addi	a0,a0,-788 # 80005da8 <_ZN5Riscv5buff1E>
    800020c4:	00000097          	auipc	ra,0x0
    800020c8:	468080e7          	jalr	1128(ra) # 8000252c <_ZN4_sem9createSemEPPS_m>
    800020cc:	2204bc23          	sd	zero,568(s1)
    800020d0:	2404b023          	sd	zero,576(s1)
    800020d4:	2404b423          	sd	zero,584(s1)
    800020d8:	00000593          	li	a1,0
    800020dc:	00004517          	auipc	a0,0x4
    800020e0:	dec50513          	addi	a0,a0,-532 # 80005ec8 <_ZN5Riscv5buff2E>
    800020e4:	00000097          	auipc	ra,0x0
    800020e8:	448080e7          	jalr	1096(ra) # 8000252c <_ZN4_sem9createSemEPPS_m>
    800020ec:	01813083          	ld	ra,24(sp)
    800020f0:	01013403          	ld	s0,16(sp)
    800020f4:	00813483          	ld	s1,8(sp)
    800020f8:	02010113          	addi	sp,sp,32
    800020fc:	00008067          	ret

0000000080002100 <_ZN5Riscv10popSppSpieEv>:
{
    80002100:	ff010113          	addi	sp,sp,-16
    80002104:	00813423          	sd	s0,8(sp)
    80002108:	01010413          	addi	s0,sp,16
    __asm__ volatile("csrw sepc, ra");
    8000210c:	14109073          	csrw	sepc,ra
    __asm__ volatile("sret");
    80002110:	10200073          	sret
}
    80002114:	00813403          	ld	s0,8(sp)
    80002118:	01010113          	addi	sp,sp,16
    8000211c:	00008067          	ret

0000000080002120 <_ZN5Riscv20handleSupervisorTrapEv>:
{
    80002120:	f8010113          	addi	sp,sp,-128
    80002124:	06113c23          	sd	ra,120(sp)
    80002128:	06813823          	sd	s0,112(sp)
    8000212c:	06913423          	sd	s1,104(sp)
    80002130:	07213023          	sd	s2,96(sp)
    80002134:	05313c23          	sd	s3,88(sp)
    80002138:	05413823          	sd	s4,80(sp)
    8000213c:	08010413          	addi	s0,sp,128
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r"(scause));
    80002140:	142027f3          	csrr	a5,scause
    80002144:	faf43423          	sd	a5,-88(s0)
    return scause;
    80002148:	fa843703          	ld	a4,-88(s0)
    if (scause == 0x0000000000000008UL || scause == 0x0000000000000009UL)
    8000214c:	ff870693          	addi	a3,a4,-8
    80002150:	00100793          	li	a5,1
    80002154:	04d7f463          	bgeu	a5,a3,8000219c <_ZN5Riscv20handleSupervisorTrapEv+0x7c>
    else if (scause == 0x8000000000000001UL)
    80002158:	fff00793          	li	a5,-1
    8000215c:	03f79793          	slli	a5,a5,0x3f
    80002160:	00178793          	addi	a5,a5,1
    80002164:	26f70e63          	beq	a4,a5,800023e0 <_ZN5Riscv20handleSupervisorTrapEv+0x2c0>
    else if (scause == 0x8000000000000009UL) {
    80002168:	fff00793          	li	a5,-1
    8000216c:	03f79793          	slli	a5,a5,0x3f
    80002170:	00978793          	addi	a5,a5,9
    80002174:	0ef71c63          	bne	a4,a5,8000226c <_ZN5Riscv20handleSupervisorTrapEv+0x14c>
        int irq = plic_claim();
    80002178:	00001097          	auipc	ra,0x1
    8000217c:	1dc080e7          	jalr	476(ra) # 80003354 <plic_claim>
    80002180:	00050493          	mv	s1,a0
        if (irq == IRQ_CONSOLE)
    80002184:	00a00793          	li	a5,10
    80002188:	32f50863          	beq	a0,a5,800024b8 <_ZN5Riscv20handleSupervisorTrapEv+0x398>
        plic_complete(irq);
    8000218c:	00048513          	mv	a0,s1
    80002190:	00001097          	auipc	ra,0x1
    80002194:	1fc080e7          	jalr	508(ra) # 8000338c <plic_complete>
    80002198:	0d40006f          	j	8000226c <_ZN5Riscv20handleSupervisorTrapEv+0x14c>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    8000219c:	141027f3          	csrr	a5,sepc
    800021a0:	faf43c23          	sd	a5,-72(s0)
    return sepc;
    800021a4:	fb843783          	ld	a5,-72(s0)
        uint64 volatile sepc = r_sepc() + 4;
    800021a8:	00478793          	addi	a5,a5,4
    800021ac:	f8f43423          	sd	a5,-120(s0)
}

inline uint64 Riscv::r_sstatus()
{
    uint64 volatile sstatus;
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    800021b0:	100027f3          	csrr	a5,sstatus
    800021b4:	faf43823          	sd	a5,-80(s0)
    return sstatus;
    800021b8:	fb043783          	ld	a5,-80(s0)
        uint64 volatile sstatus = r_sstatus();
    800021bc:	f8f43823          	sd	a5,-112(s0)
        __asm__ volatile("mv %0, a0" : "=r" (code));
    800021c0:	00050793          	mv	a5,a0
        if(code == 0x1) {
    800021c4:	00100713          	li	a4,1
    800021c8:	06e78c63          	beq	a5,a4,80002240 <_ZN5Riscv20handleSupervisorTrapEv+0x120>
        }else if(code == 0x02) {
    800021cc:	00200713          	li	a4,2
    800021d0:	0ae78e63          	beq	a5,a4,8000228c <_ZN5Riscv20handleSupervisorTrapEv+0x16c>
        }else if(code == 0x11){
    800021d4:	01100713          	li	a4,17
    800021d8:	0ce78663          	beq	a5,a4,800022a4 <_ZN5Riscv20handleSupervisorTrapEv+0x184>
        }else if(code == 0x12){
    800021dc:	01200713          	li	a4,18
    800021e0:	10e78663          	beq	a5,a4,800022ec <_ZN5Riscv20handleSupervisorTrapEv+0x1cc>
        }else if(code == 0x13){
    800021e4:	01300713          	li	a4,19
    800021e8:	1ee78863          	beq	a5,a4,800023d8 <_ZN5Riscv20handleSupervisorTrapEv+0x2b8>
        }else if(code == 0x21){
    800021ec:	02100713          	li	a4,33
    800021f0:	10e78e63          	beq	a5,a4,8000230c <_ZN5Riscv20handleSupervisorTrapEv+0x1ec>
        }else if(code == 0x22){
    800021f4:	02200713          	li	a4,34
    800021f8:	12e78863          	beq	a5,a4,80002328 <_ZN5Riscv20handleSupervisorTrapEv+0x208>
        }else if(code == 0x23){
    800021fc:	02300713          	li	a4,35
    80002200:	14e78c63          	beq	a5,a4,80002358 <_ZN5Riscv20handleSupervisorTrapEv+0x238>
        }else if(code == 0x24){
    80002204:	02400713          	li	a4,36
    80002208:	16e78463          	beq	a5,a4,80002370 <_ZN5Riscv20handleSupervisorTrapEv+0x250>
        }else if(code == 0x31){
    8000220c:	03100713          	li	a4,49
    80002210:	16e78c63          	beq	a5,a4,80002388 <_ZN5Riscv20handleSupervisorTrapEv+0x268>
        }else if(code == 0x41){
    80002214:	04100713          	li	a4,65
    80002218:	18e78463          	beq	a5,a4,800023a0 <_ZN5Riscv20handleSupervisorTrapEv+0x280>
        }else if(code == 0x42){
    8000221c:	04200713          	li	a4,66
    80002220:	18e78c63          	beq	a5,a4,800023b8 <_ZN5Riscv20handleSupervisorTrapEv+0x298>
            _thread::timeSliceCounter = 0;
    80002224:	00004797          	auipc	a5,0x4
    80002228:	afc7b783          	ld	a5,-1284(a5) # 80005d20 <_GLOBAL_OFFSET_TABLE_+0x58>
    8000222c:	0007b023          	sd	zero,0(a5)
            _thread::dispatch();
    80002230:	00000097          	auipc	ra,0x0
    80002234:	b04080e7          	jalr	-1276(ra) # 80001d34 <_ZN7_thread8dispatchEv>
    int ret = 0;
    80002238:	00000513          	li	a0,0
    8000223c:	01c0006f          	j	80002258 <_ZN5Riscv20handleSupervisorTrapEv+0x138>
            __asm__ volatile("mv %0, a1" : "=r" (x));
    80002240:	00058513          	mv	a0,a1
            void* r = __mem_alloc(x);
    80002244:	00651513          	slli	a0,a0,0x6
    80002248:	00003097          	auipc	ra,0x3
    8000224c:	a40080e7          	jalr	-1472(ra) # 80004c88 <__mem_alloc>
            __asm__ volatile("mv a0, %0" : : "r" (r));
    80002250:	00050513          	mv	a0,a0
    int ret = 0;
    80002254:	00000513          	li	a0,0
        w_sstatus(sstatus);
    80002258:	f9043783          	ld	a5,-112(s0)
}

inline void Riscv::w_sstatus(uint64 sstatus)
{
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    8000225c:	10079073          	csrw	sstatus,a5
        w_sepc(sepc);
    80002260:	f8843783          	ld	a5,-120(s0)
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80002264:	14179073          	csrw	sepc,a5
        __asm__ volatile("mv a0, %0" : : "r" (ret));
    80002268:	00050513          	mv	a0,a0
    8000226c:	07813083          	ld	ra,120(sp)
    80002270:	07013403          	ld	s0,112(sp)
    80002274:	06813483          	ld	s1,104(sp)
    80002278:	06013903          	ld	s2,96(sp)
    8000227c:	05813983          	ld	s3,88(sp)
    80002280:	05013a03          	ld	s4,80(sp)
    80002284:	08010113          	addi	sp,sp,128
    80002288:	00008067          	ret
            __asm__ volatile("mv %0, a1" : "=r" (x));
    8000228c:	00058513          	mv	a0,a1
            ret = __mem_free((void*)x);
    80002290:	00003097          	auipc	ra,0x3
    80002294:	92c080e7          	jalr	-1748(ra) # 80004bbc <__mem_free>
            __asm__ volatile("mv a0, %0" : : "r" (ret));
    80002298:	00050513          	mv	a0,a0
    int ret = 0;
    8000229c:	00000513          	li	a0,0
    800022a0:	fb9ff06f          	j	80002258 <_ZN5Riscv20handleSupervisorTrapEv+0x138>
            __asm__ volatile("mv %0, a1" : "=r" (handle));
    800022a4:	00058913          	mv	s2,a1
            __asm__ volatile("mv %0, a2" : "=r" (body));
    800022a8:	00060993          	mv	s3,a2
            __asm__ volatile("ld t2, 104(fp)");
    800022ac:	06843383          	ld	t2,104(s0)
            __asm__ volatile("ld t3, 112(fp)");
    800022b0:	07043e03          	ld	t3,112(s0)
            __asm__ volatile("mv %0, t2" : "=r" (args));
    800022b4:	00038a13          	mv	s4,t2
            __asm__ volatile("mv %0, t3" : "=r" (stack));
    800022b8:	000e0493          	mv	s1,t3
            printInteger((uint64)stack);
    800022bc:	00048513          	mv	a0,s1
    800022c0:	00000097          	auipc	ra,0x0
    800022c4:	784080e7          	jalr	1924(ra) # 80002a44 <_Z12printIntegerm>
            int ret = _thread::createThread(handle, body, args, stack);
    800022c8:	00048693          	mv	a3,s1
    800022cc:	000a0613          	mv	a2,s4
    800022d0:	00098593          	mv	a1,s3
    800022d4:	00090513          	mv	a0,s2
    800022d8:	00000097          	auipc	ra,0x0
    800022dc:	8d8080e7          	jalr	-1832(ra) # 80001bb0 <_ZN7_thread12createThreadEPPS_PFvvEPvS4_>
            __asm__ volatile("mv a0, %0" : : "r" (ret));
    800022e0:	00050513          	mv	a0,a0
    int ret = 0;
    800022e4:	00000513          	li	a0,0
    800022e8:	f71ff06f          	j	80002258 <_ZN5Riscv20handleSupervisorTrapEv+0x138>
            int ret = _thread::threadStop();
    800022ec:	00000097          	auipc	ra,0x0
    800022f0:	b24080e7          	jalr	-1244(ra) # 80001e10 <_ZN7_thread10threadStopEv>
            if(ret != 0)
    800022f4:	00050863          	beqz	a0,80002304 <_ZN5Riscv20handleSupervisorTrapEv+0x1e4>
                __asm__ volatile("mv a0, %0" : : "r" (ret));
    800022f8:	00050513          	mv	a0,a0
    int ret = 0;
    800022fc:	00000513          	li	a0,0
    80002300:	f59ff06f          	j	80002258 <_ZN5Riscv20handleSupervisorTrapEv+0x138>
                __asm__ volatile("mv a0, zero");
    80002304:	00000513          	li	a0,0
    80002308:	f51ff06f          	j	80002258 <_ZN5Riscv20handleSupervisorTrapEv+0x138>
            __asm__ volatile("mv %0, a1" : "=r" (handle));
    8000230c:	00058513          	mv	a0,a1
            __asm__ volatile("mv %0, a2" : "=r" (init));
    80002310:	00060593          	mv	a1,a2
            int ret = _sem::createSem(handle, init);
    80002314:	00000097          	auipc	ra,0x0
    80002318:	218080e7          	jalr	536(ra) # 8000252c <_ZN4_sem9createSemEPPS_m>
            __asm__ volatile("mv a0, %0" : : "r" (ret));
    8000231c:	00050513          	mv	a0,a0
    int ret = 0;
    80002320:	00000513          	li	a0,0
    80002324:	f35ff06f          	j	80002258 <_ZN5Riscv20handleSupervisorTrapEv+0x138>
            __asm__ volatile("mv %0, a1" : "=r" (handle));
    80002328:	00058493          	mv	s1,a1
            delete handle; //TODO ??????????????????????????????????????
    8000232c:	00048e63          	beqz	s1,80002348 <_ZN5Riscv20handleSupervisorTrapEv+0x228>
    80002330:	00048513          	mv	a0,s1
    80002334:	00000097          	auipc	ra,0x0
    80002338:	25c080e7          	jalr	604(ra) # 80002590 <_ZN4_semD1Ev>
    8000233c:	00048513          	mv	a0,s1
    80002340:	00000097          	auipc	ra,0x0
    80002344:	ce0080e7          	jalr	-800(ra) # 80002020 <_ZdlPv>
            __asm__ volatile("mv a0, %0" : : "r" (ret));
    80002348:	00000793          	li	a5,0
    8000234c:	00078513          	mv	a0,a5
    int ret = 0;
    80002350:	00000513          	li	a0,0
    80002354:	f05ff06f          	j	80002258 <_ZN5Riscv20handleSupervisorTrapEv+0x138>
            __asm__ volatile("mv %0, a1" : "=r" (handle));
    80002358:	00058513          	mv	a0,a1
            int ret = handle->wait(); //TODO ?????????;
    8000235c:	00000097          	auipc	ra,0x0
    80002360:	3cc080e7          	jalr	972(ra) # 80002728 <_ZN4_sem4waitEv>
            __asm__ volatile("mv a0, %0" : : "r" (ret));
    80002364:	00050513          	mv	a0,a0
    int ret = 0;
    80002368:	00000513          	li	a0,0
    8000236c:	eedff06f          	j	80002258 <_ZN5Riscv20handleSupervisorTrapEv+0x138>
            __asm__ volatile("mv %0, a1" : "=r" (id));
    80002370:	00058513          	mv	a0,a1
            int ret = id->signal();
    80002374:	00000097          	auipc	ra,0x0
    80002378:	3fc080e7          	jalr	1020(ra) # 80002770 <_ZN4_sem6signalEv>
            __asm__ volatile("mv a0, %0" : : "r" (ret));
    8000237c:	00050513          	mv	a0,a0
    int ret = 0;
    80002380:	00000513          	li	a0,0
    80002384:	ed5ff06f          	j	80002258 <_ZN5Riscv20handleSupervisorTrapEv+0x138>
            __asm__ volatile("mv %0, a1" : "=r" (time));
    80002388:	00058513          	mv	a0,a1
            int ret = _thread::sleep(time);
    8000238c:	00000097          	auipc	ra,0x0
    80002390:	ad0080e7          	jalr	-1328(ra) # 80001e5c <_ZN7_thread5sleepEm>
            __asm__ volatile("mv a0, %0" : : "r" (ret));
    80002394:	00050513          	mv	a0,a0
    int ret = 0;
    80002398:	00000513          	li	a0,0
    8000239c:	ebdff06f          	j	80002258 <_ZN5Riscv20handleSupervisorTrapEv+0x138>
            ret = buff2.take();
    800023a0:	00004517          	auipc	a0,0x4
    800023a4:	b2850513          	addi	a0,a0,-1240 # 80005ec8 <_ZN5Riscv5buff2E>
    800023a8:	00000097          	auipc	ra,0x0
    800023ac:	574080e7          	jalr	1396(ra) # 8000291c <_ZN14KeyboardBuffer4takeEv>
    800023b0:	0005051b          	sext.w	a0,a0
    800023b4:	ea5ff06f          	j	80002258 <_ZN5Riscv20handleSupervisorTrapEv+0x138>
            __asm__ volatile("mv %0, a1" : "=r" (c));
    800023b8:	00058593          	mv	a1,a1
            buff1.append(c);
    800023bc:	0ff5f593          	andi	a1,a1,255
    800023c0:	00004517          	auipc	a0,0x4
    800023c4:	9e850513          	addi	a0,a0,-1560 # 80005da8 <_ZN5Riscv5buff1E>
    800023c8:	00000097          	auipc	ra,0x0
    800023cc:	5b0080e7          	jalr	1456(ra) # 80002978 <_ZN14KeyboardBuffer6appendEc>
    int ret = 0;
    800023d0:	00000513          	li	a0,0
    800023d4:	e85ff06f          	j	80002258 <_ZN5Riscv20handleSupervisorTrapEv+0x138>
    800023d8:	00000513          	li	a0,0
    800023dc:	e7dff06f          	j	80002258 <_ZN5Riscv20handleSupervisorTrapEv+0x138>
//            Scheduler::put(t);
        }
    }

    void sleepControl(){
        if(head != nullptr && --head->sleepTime == 0) //dekrementira vreme i radi proveru
    800023e0:	00004717          	auipc	a4,0x4
    800023e4:	9b873703          	ld	a4,-1608(a4) # 80005d98 <_ZN5Riscv15sleepingThreadsE>
    800023e8:	00070c63          	beqz	a4,80002400 <_ZN5Riscv20handleSupervisorTrapEv+0x2e0>
    800023ec:	01072783          	lw	a5,16(a4)
    800023f0:	fff7879b          	addiw	a5,a5,-1
    800023f4:	0007869b          	sext.w	a3,a5
    800023f8:	00f72823          	sw	a5,16(a4)
    800023fc:	06068e63          	beqz	a3,80002478 <_ZN5Riscv20handleSupervisorTrapEv+0x358>
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"(mask));
    80002400:	00200793          	li	a5,2
    80002404:	1447b073          	csrc	sip,a5
        _thread::timeSliceCounter++;
    80002408:	00004717          	auipc	a4,0x4
    8000240c:	91873703          	ld	a4,-1768(a4) # 80005d20 <_GLOBAL_OFFSET_TABLE_+0x58>
    80002410:	00073783          	ld	a5,0(a4)
    80002414:	00178793          	addi	a5,a5,1
    80002418:	00f73023          	sd	a5,0(a4)
        if (_thread::timeSliceCounter >= _thread::running->getTimeSlice())
    8000241c:	00004717          	auipc	a4,0x4
    80002420:	8c473703          	ld	a4,-1852(a4) # 80005ce0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80002424:	00073703          	ld	a4,0(a4)

    bool isFinished() const { return finished; }

    void setFinished(bool value) { finished = value; }

    uint64 getTimeSlice() const { return timeSlice; }
    80002428:	02073703          	ld	a4,32(a4)
    8000242c:	e4e7e0e3          	bltu	a5,a4,8000226c <_ZN5Riscv20handleSupervisorTrapEv+0x14c>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80002430:	141027f3          	csrr	a5,sepc
    80002434:	fcf43423          	sd	a5,-56(s0)
    return sepc;
    80002438:	fc843783          	ld	a5,-56(s0)
            uint64 volatile sepc = r_sepc();
    8000243c:	f8f43c23          	sd	a5,-104(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80002440:	100027f3          	csrr	a5,sstatus
    80002444:	fcf43023          	sd	a5,-64(s0)
    return sstatus;
    80002448:	fc043783          	ld	a5,-64(s0)
            uint64 volatile sstatus = r_sstatus();
    8000244c:	faf43023          	sd	a5,-96(s0)
            _thread::timeSliceCounter = 0;
    80002450:	00004797          	auipc	a5,0x4
    80002454:	8d07b783          	ld	a5,-1840(a5) # 80005d20 <_GLOBAL_OFFSET_TABLE_+0x58>
    80002458:	0007b023          	sd	zero,0(a5)
            _thread::dispatch();
    8000245c:	00000097          	auipc	ra,0x0
    80002460:	8d8080e7          	jalr	-1832(ra) # 80001d34 <_ZN7_thread8dispatchEv>
            w_sstatus(sstatus);
    80002464:	fa043783          	ld	a5,-96(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80002468:	10079073          	csrw	sstatus,a5
            w_sepc(sepc);
    8000246c:	f9843783          	ld	a5,-104(s0)
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80002470:	14179073          	csrw	sepc,a5
}
    80002474:	df9ff06f          	j	8000226c <_ZN5Riscv20handleSupervisorTrapEv+0x14c>
        while(head && head->sleepTime == 0){
    80002478:	00004797          	auipc	a5,0x4
    8000247c:	9207b783          	ld	a5,-1760(a5) # 80005d98 <_ZN5Riscv15sleepingThreadsE>
    80002480:	f80780e3          	beqz	a5,80002400 <_ZN5Riscv20handleSupervisorTrapEv+0x2e0>
    80002484:	0107a703          	lw	a4,16(a5)
    80002488:	f6071ce3          	bnez	a4,80002400 <_ZN5Riscv20handleSupervisorTrapEv+0x2e0>
            t = head->data;
    8000248c:	0007b483          	ld	s1,0(a5)
            head = head->next;
    80002490:	0087b783          	ld	a5,8(a5)
    80002494:	00004717          	auipc	a4,0x4
    80002498:	90f73223          	sd	a5,-1788(a4) # 80005d98 <_ZN5Riscv15sleepingThreadsE>
            t->setSleep();
    8000249c:	00048513          	mv	a0,s1
    800024a0:	fffff097          	auipc	ra,0xfffff
    800024a4:	608080e7          	jalr	1544(ra) # 80001aa8 <_ZN7_thread8setSleepEv>

    void setSleep();

    void insertScheduler() {
        Scheduler::put(this);
    800024a8:	00048513          	mv	a0,s1
    800024ac:	00000097          	auipc	ra,0x0
    800024b0:	3cc080e7          	jalr	972(ra) # 80002878 <_ZN9Scheduler3putEP7_thread>
    }
    800024b4:	fc5ff06f          	j	80002478 <_ZN5Riscv20handleSupervisorTrapEv+0x358>
            while (*((char*)CONSOLE_STATUS) & CONSOLE_RX_STATUS_BIT){
    800024b8:	00004797          	auipc	a5,0x4
    800024bc:	8207b783          	ld	a5,-2016(a5) # 80005cd8 <_GLOBAL_OFFSET_TABLE_+0x10>
    800024c0:	0007b783          	ld	a5,0(a5)
    800024c4:	0007c783          	lbu	a5,0(a5)
    800024c8:	0017f713          	andi	a4,a5,1
    800024cc:	cc0700e3          	beqz	a4,8000218c <_ZN5Riscv20handleSupervisorTrapEv+0x6c>
                __asm__ volatile("mv a1, %0" : : "r" (*((char*)CONSOLE_STATUS)));
    800024d0:	00078593          	mv	a1,a5
                char c = (*(char*)CONSOLE_RX_DATA);
    800024d4:	00003797          	auipc	a5,0x3
    800024d8:	7fc7b783          	ld	a5,2044(a5) # 80005cd0 <_GLOBAL_OFFSET_TABLE_+0x8>
    800024dc:	0007b783          	ld	a5,0(a5)
                buff2.append(c);
    800024e0:	0007c583          	lbu	a1,0(a5)
    800024e4:	00004517          	auipc	a0,0x4
    800024e8:	9e450513          	addi	a0,a0,-1564 # 80005ec8 <_ZN5Riscv5buff2E>
    800024ec:	00000097          	auipc	ra,0x0
    800024f0:	48c080e7          	jalr	1164(ra) # 80002978 <_ZN14KeyboardBuffer6appendEc>
            while (*((char*)CONSOLE_STATUS) & CONSOLE_RX_STATUS_BIT){
    800024f4:	fc5ff06f          	j	800024b8 <_ZN5Riscv20handleSupervisorTrapEv+0x398>

00000000800024f8 <_GLOBAL__sub_I__ZN5Riscv15sleepingThreadsE>:
    800024f8:	ff010113          	addi	sp,sp,-16
    800024fc:	00113423          	sd	ra,8(sp)
    80002500:	00813023          	sd	s0,0(sp)
    80002504:	01010413          	addi	s0,sp,16
    80002508:	000105b7          	lui	a1,0x10
    8000250c:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    80002510:	00100513          	li	a0,1
    80002514:	00000097          	auipc	ra,0x0
    80002518:	b5c080e7          	jalr	-1188(ra) # 80002070 <_Z41__static_initialization_and_destruction_0ii>
    8000251c:	00813083          	ld	ra,8(sp)
    80002520:	00013403          	ld	s0,0(sp)
    80002524:	01010113          	addi	sp,sp,16
    80002528:	00008067          	ret

000000008000252c <_ZN4_sem9createSemEPPS_m>:
//}
//void unlock(){
//    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);
//}

int _sem::createSem(sem_t *handle, uint64 init){
    8000252c:	fe010113          	addi	sp,sp,-32
    80002530:	00113c23          	sd	ra,24(sp)
    80002534:	00813823          	sd	s0,16(sp)
    80002538:	00913423          	sd	s1,8(sp)
    8000253c:	01213023          	sd	s2,0(sp)
    80002540:	02010413          	addi	s0,sp,32
    80002544:	00050493          	mv	s1,a0
    80002548:	00058913          	mv	s2,a1
    *handle = new _sem(init);
    8000254c:	01800513          	li	a0,24
    80002550:	00000097          	auipc	ra,0x0
    80002554:	a80080e7          	jalr	-1408(ra) # 80001fd0 <_Znwm>
    }
    friend class _thread;
    List<_thread>& blockedList();


    _sem(int val=1) : val(val) {}
    80002558:	01252023          	sw	s2,0(a0)
    List() : head(0), tail(0) {}
    8000255c:	00053423          	sd	zero,8(a0)
    80002560:	00053823          	sd	zero,16(a0)
    80002564:	00a4b023          	sd	a0,0(s1)
    if(*handle  != nullptr)
    80002568:	02050063          	beqz	a0,80002588 <_ZN4_sem9createSemEPPS_m+0x5c>
        return 0;
    8000256c:	00000513          	li	a0,0
    else
        return -2;
}
    80002570:	01813083          	ld	ra,24(sp)
    80002574:	01013403          	ld	s0,16(sp)
    80002578:	00813483          	ld	s1,8(sp)
    8000257c:	00013903          	ld	s2,0(sp)
    80002580:	02010113          	addi	sp,sp,32
    80002584:	00008067          	ret
        return -2;
    80002588:	ffe00513          	li	a0,-2
    8000258c:	fe5ff06f          	j	80002570 <_ZN4_sem9createSemEPPS_m+0x44>

0000000080002590 <_ZN4_semD1Ev>:

_sem::~_sem() {
    80002590:	fe010113          	addi	sp,sp,-32
    80002594:	00113c23          	sd	ra,24(sp)
    80002598:	00813823          	sd	s0,16(sp)
    8000259c:	00913423          	sd	s1,8(sp)
    800025a0:	01213023          	sd	s2,0(sp)
    800025a4:	02010413          	addi	s0,sp,32
//    lock();
    _thread *t;
    t = blockedThreadQueue.removeLast();
    800025a8:	00850913          	addi	s2,a0,8
        if (!head) { return 0; }
    800025ac:	00853483          	ld	s1,8(a0)
    800025b0:	06048863          	beqz	s1,80002620 <_ZN4_semD1Ev+0x90>
    800025b4:	00050693          	mv	a3,a0
        Elem *prev = 0;
    800025b8:	00000713          	li	a4,0
        for (Elem *curr = head; curr && curr != tail; curr = curr->next)
    800025bc:	00048c63          	beqz	s1,800025d4 <_ZN4_semD1Ev+0x44>
    800025c0:	00893783          	ld	a5,8(s2)
    800025c4:	00f48863          	beq	s1,a5,800025d4 <_ZN4_semD1Ev+0x44>
            prev = curr;
    800025c8:	00048713          	mv	a4,s1
        for (Elem *curr = head; curr && curr != tail; curr = curr->next)
    800025cc:	0084b483          	ld	s1,8(s1)
    800025d0:	fedff06f          	j	800025bc <_ZN4_semD1Ev+0x2c>
        Elem *elem = tail;
    800025d4:	00893503          	ld	a0,8(s2)
        if (prev) { prev->next = 0; }
    800025d8:	02070063          	beqz	a4,800025f8 <_ZN4_semD1Ev+0x68>
    800025dc:	00073423          	sd	zero,8(a4)
        tail = prev;
    800025e0:	00e93423          	sd	a4,8(s2)
        T *ret = elem->data;
    800025e4:	00053483          	ld	s1,0(a0)
        delete elem;
    800025e8:	02050c63          	beqz	a0,80002620 <_ZN4_semD1Ev+0x90>
    800025ec:	00000097          	auipc	ra,0x0
    800025f0:	a34080e7          	jalr	-1484(ra) # 80002020 <_ZdlPv>
    800025f4:	02c0006f          	j	80002620 <_ZN4_semD1Ev+0x90>
        else { head = 0; }
    800025f8:	0006b423          	sd	zero,8(a3)
    800025fc:	fe5ff06f          	j	800025e0 <_ZN4_semD1Ev+0x50>
        Elem *elem = tail;
    80002600:	00893503          	ld	a0,8(s2)
        if (prev) { prev->next = 0; }
    80002604:	04078863          	beqz	a5,80002654 <_ZN4_semD1Ev+0xc4>
    80002608:	0007b423          	sd	zero,8(a5)
        tail = prev;
    8000260c:	00f93423          	sd	a5,8(s2)
        T *ret = elem->data;
    80002610:	00053483          	ld	s1,0(a0)
        delete elem;
    80002614:	00050663          	beqz	a0,80002620 <_ZN4_semD1Ev+0x90>
    80002618:	00000097          	auipc	ra,0x0
    8000261c:	a08080e7          	jalr	-1528(ra) # 80002020 <_ZdlPv>
    while(t){
    80002620:	02048e63          	beqz	s1,8000265c <_ZN4_semD1Ev+0xcc>
        Scheduler::put(t);
    80002624:	00048513          	mv	a0,s1
    80002628:	00000097          	auipc	ra,0x0
    8000262c:	250080e7          	jalr	592(ra) # 80002878 <_ZN9Scheduler3putEP7_thread>
        if (!head) { return 0; }
    80002630:	00093483          	ld	s1,0(s2)
    80002634:	fe0486e3          	beqz	s1,80002620 <_ZN4_semD1Ev+0x90>
        Elem *prev = 0;
    80002638:	00000793          	li	a5,0
        for (Elem *curr = head; curr && curr != tail; curr = curr->next)
    8000263c:	fc0482e3          	beqz	s1,80002600 <_ZN4_semD1Ev+0x70>
    80002640:	00893703          	ld	a4,8(s2)
    80002644:	fae48ee3          	beq	s1,a4,80002600 <_ZN4_semD1Ev+0x70>
            prev = curr;
    80002648:	00048793          	mv	a5,s1
        for (Elem *curr = head; curr && curr != tail; curr = curr->next)
    8000264c:	0084b483          	ld	s1,8(s1)
    80002650:	fedff06f          	j	8000263c <_ZN4_semD1Ev+0xac>
        else { head = 0; }
    80002654:	00093023          	sd	zero,0(s2)
    80002658:	fb5ff06f          	j	8000260c <_ZN4_semD1Ev+0x7c>
        t = blockedThreadQueue.removeLast();
    }
//    unlock();
}
    8000265c:	01813083          	ld	ra,24(sp)
    80002660:	01013403          	ld	s0,16(sp)
    80002664:	00813483          	ld	s1,8(sp)
    80002668:	00013903          	ld	s2,0(sp)
    8000266c:	02010113          	addi	sp,sp,32
    80002670:	00008067          	ret

0000000080002674 <_ZN4_sem5blockEv>:

void _sem::block() {
    80002674:	ff010113          	addi	sp,sp,-16
    80002678:	00113423          	sd	ra,8(sp)
    8000267c:	00813023          	sd	s0,0(sp)
    80002680:	01010413          	addi	s0,sp,16

    _thread::running->blocked  = true;
    80002684:	00003797          	auipc	a5,0x3
    80002688:	65c7b783          	ld	a5,1628(a5) # 80005ce0 <_GLOBAL_OFFSET_TABLE_+0x18>
    8000268c:	0007b783          	ld	a5,0(a5)
    80002690:	00100713          	li	a4,1
    80002694:	02e78c23          	sb	a4,56(a5)
    _thread::running->blockedBy = this;
    80002698:	04a7b023          	sd	a0,64(a5)
    _thread::dispatch();
    8000269c:	fffff097          	auipc	ra,0xfffff
    800026a0:	698080e7          	jalr	1688(ra) # 80001d34 <_ZN7_thread8dispatchEv>
    //pozvace se zamena konteksta, ako je blocked = true u dispach()-u ce se ubaciti nit u blocked que
}
    800026a4:	00813083          	ld	ra,8(sp)
    800026a8:	00013403          	ld	s0,0(sp)
    800026ac:	01010113          	addi	sp,sp,16
    800026b0:	00008067          	ret

00000000800026b4 <_ZN4_sem7deblockEv>:

void _sem::deblock(){
    800026b4:	fe010113          	addi	sp,sp,-32
    800026b8:	00113c23          	sd	ra,24(sp)
    800026bc:	00813823          	sd	s0,16(sp)
    800026c0:	00913423          	sd	s1,8(sp)
    800026c4:	02010413          	addi	s0,sp,32
    800026c8:	00050793          	mv	a5,a0
        if (!head) { return 0; }
    800026cc:	00853503          	ld	a0,8(a0)
    800026d0:	04050863          	beqz	a0,80002720 <_ZN4_sem7deblockEv+0x6c>
        head = head->next;
    800026d4:	00853703          	ld	a4,8(a0)
    800026d8:	00e7b423          	sd	a4,8(a5)
        if (!head) { tail = 0; }
    800026dc:	02070e63          	beqz	a4,80002718 <_ZN4_sem7deblockEv+0x64>
        T *ret = elem->data;
    800026e0:	00053483          	ld	s1,0(a0)
        delete elem;
    800026e4:	00000097          	auipc	ra,0x0
    800026e8:	93c080e7          	jalr	-1732(ra) # 80002020 <_ZdlPv>
    _thread *t = blockedThreadQueue.removeFirst();
    t->dblck();
    800026ec:	00048513          	mv	a0,s1
    800026f0:	fffff097          	auipc	ra,0xfffff
    800026f4:	74c080e7          	jalr	1868(ra) # 80001e3c <_ZN7_thread5dblckEv>
    Scheduler::put(t);
    800026f8:	00048513          	mv	a0,s1
    800026fc:	00000097          	auipc	ra,0x0
    80002700:	17c080e7          	jalr	380(ra) # 80002878 <_ZN9Scheduler3putEP7_thread>
}
    80002704:	01813083          	ld	ra,24(sp)
    80002708:	01013403          	ld	s0,16(sp)
    8000270c:	00813483          	ld	s1,8(sp)
    80002710:	02010113          	addi	sp,sp,32
    80002714:	00008067          	ret
        if (!head) { tail = 0; }
    80002718:	0007b823          	sd	zero,16(a5)
    8000271c:	fc5ff06f          	j	800026e0 <_ZN4_sem7deblockEv+0x2c>
        if (!head) { return 0; }
    80002720:	00050493          	mv	s1,a0
    80002724:	fc9ff06f          	j	800026ec <_ZN4_sem7deblockEv+0x38>

0000000080002728 <_ZN4_sem4waitEv>:

int _sem::wait() {
//    lock();
    if(--val < 0)
    80002728:	00052783          	lw	a5,0(a0)
    8000272c:	fff7879b          	addiw	a5,a5,-1
    80002730:	00f52023          	sw	a5,0(a0)
    80002734:	02079713          	slli	a4,a5,0x20
    80002738:	00074663          	bltz	a4,80002744 <_ZN4_sem4waitEv+0x1c>
        block();
//    unlock();
    return 0;
}
    8000273c:	00000513          	li	a0,0
    80002740:	00008067          	ret
int _sem::wait() {
    80002744:	ff010113          	addi	sp,sp,-16
    80002748:	00113423          	sd	ra,8(sp)
    8000274c:	00813023          	sd	s0,0(sp)
    80002750:	01010413          	addi	s0,sp,16
        block();
    80002754:	00000097          	auipc	ra,0x0
    80002758:	f20080e7          	jalr	-224(ra) # 80002674 <_ZN4_sem5blockEv>
}
    8000275c:	00000513          	li	a0,0
    80002760:	00813083          	ld	ra,8(sp)
    80002764:	00013403          	ld	s0,0(sp)
    80002768:	01010113          	addi	sp,sp,16
    8000276c:	00008067          	ret

0000000080002770 <_ZN4_sem6signalEv>:

int _sem::signal() {
//    lock();
    if(val++ < 0)
    80002770:	00052783          	lw	a5,0(a0)
    80002774:	0017871b          	addiw	a4,a5,1
    80002778:	00e52023          	sw	a4,0(a0)
    8000277c:	0007c663          	bltz	a5,80002788 <_ZN4_sem6signalEv+0x18>
        deblock();
//    unlock();
    return 0;
}
    80002780:	00000513          	li	a0,0
    80002784:	00008067          	ret
int _sem::signal() {
    80002788:	ff010113          	addi	sp,sp,-16
    8000278c:	00113423          	sd	ra,8(sp)
    80002790:	00813023          	sd	s0,0(sp)
    80002794:	01010413          	addi	s0,sp,16
        deblock();
    80002798:	00000097          	auipc	ra,0x0
    8000279c:	f1c080e7          	jalr	-228(ra) # 800026b4 <_ZN4_sem7deblockEv>
}
    800027a0:	00000513          	li	a0,0
    800027a4:	00813083          	ld	ra,8(sp)
    800027a8:	00013403          	ld	s0,0(sp)
    800027ac:	01010113          	addi	sp,sp,16
    800027b0:	00008067          	ret

00000000800027b4 <_ZN4_sem11blockedListEv>:

List<_thread>& _sem::blockedList(){
    800027b4:	ff010113          	addi	sp,sp,-16
    800027b8:	00813423          	sd	s0,8(sp)
    800027bc:	01010413          	addi	s0,sp,16
    return _sem::blockedThreadQueue;
}
    800027c0:	00850513          	addi	a0,a0,8
    800027c4:	00813403          	ld	s0,8(sp)
    800027c8:	01010113          	addi	sp,sp,16
    800027cc:	00008067          	ret

00000000800027d0 <_Z41__static_initialization_and_destruction_0ii>:
}

void Scheduler::put(_thread *ccb)
{
    readyThreadQueue.addLast(ccb);
    800027d0:	ff010113          	addi	sp,sp,-16
    800027d4:	00813423          	sd	s0,8(sp)
    800027d8:	01010413          	addi	s0,sp,16
    800027dc:	00100793          	li	a5,1
    800027e0:	00f50863          	beq	a0,a5,800027f0 <_Z41__static_initialization_and_destruction_0ii+0x20>
    800027e4:	00813403          	ld	s0,8(sp)
    800027e8:	01010113          	addi	sp,sp,16
    800027ec:	00008067          	ret
    800027f0:	000107b7          	lui	a5,0x10
    800027f4:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    800027f8:	fef596e3          	bne	a1,a5,800027e4 <_Z41__static_initialization_and_destruction_0ii+0x14>
    List() : head(0), tail(0) {}
    800027fc:	00003797          	auipc	a5,0x3
    80002800:	7f478793          	addi	a5,a5,2036 # 80005ff0 <_ZN9Scheduler16readyThreadQueueE>
    80002804:	0007b023          	sd	zero,0(a5)
    80002808:	0007b423          	sd	zero,8(a5)
    8000280c:	fd9ff06f          	j	800027e4 <_Z41__static_initialization_and_destruction_0ii+0x14>

0000000080002810 <_ZN9Scheduler3getEv>:
{
    80002810:	fe010113          	addi	sp,sp,-32
    80002814:	00113c23          	sd	ra,24(sp)
    80002818:	00813823          	sd	s0,16(sp)
    8000281c:	00913423          	sd	s1,8(sp)
    80002820:	02010413          	addi	s0,sp,32
        if (!head) { return 0; }
    80002824:	00003517          	auipc	a0,0x3
    80002828:	7cc53503          	ld	a0,1996(a0) # 80005ff0 <_ZN9Scheduler16readyThreadQueueE>
    8000282c:	04050263          	beqz	a0,80002870 <_ZN9Scheduler3getEv+0x60>
        head = head->next;
    80002830:	00853783          	ld	a5,8(a0)
    80002834:	00003717          	auipc	a4,0x3
    80002838:	7af73e23          	sd	a5,1980(a4) # 80005ff0 <_ZN9Scheduler16readyThreadQueueE>
        if (!head) { tail = 0; }
    8000283c:	02078463          	beqz	a5,80002864 <_ZN9Scheduler3getEv+0x54>
        T *ret = elem->data;
    80002840:	00053483          	ld	s1,0(a0)
        delete elem;
    80002844:	fffff097          	auipc	ra,0xfffff
    80002848:	7dc080e7          	jalr	2012(ra) # 80002020 <_ZdlPv>
}
    8000284c:	00048513          	mv	a0,s1
    80002850:	01813083          	ld	ra,24(sp)
    80002854:	01013403          	ld	s0,16(sp)
    80002858:	00813483          	ld	s1,8(sp)
    8000285c:	02010113          	addi	sp,sp,32
    80002860:	00008067          	ret
        if (!head) { tail = 0; }
    80002864:	00003797          	auipc	a5,0x3
    80002868:	7807ba23          	sd	zero,1940(a5) # 80005ff8 <_ZN9Scheduler16readyThreadQueueE+0x8>
    8000286c:	fd5ff06f          	j	80002840 <_ZN9Scheduler3getEv+0x30>
        if (!head) { return 0; }
    80002870:	00050493          	mv	s1,a0
    return readyThreadQueue.removeFirst();
    80002874:	fd9ff06f          	j	8000284c <_ZN9Scheduler3getEv+0x3c>

0000000080002878 <_ZN9Scheduler3putEP7_thread>:
{
    80002878:	fe010113          	addi	sp,sp,-32
    8000287c:	00113c23          	sd	ra,24(sp)
    80002880:	00813823          	sd	s0,16(sp)
    80002884:	00913423          	sd	s1,8(sp)
    80002888:	02010413          	addi	s0,sp,32
    8000288c:	00050493          	mv	s1,a0
        Elem *elem = new Elem(data, 0);
    80002890:	01800513          	li	a0,24
    80002894:	fffff097          	auipc	ra,0xfffff
    80002898:	73c080e7          	jalr	1852(ra) # 80001fd0 <_Znwm>
        Elem(T *data, Elem *next, int sleepTime = 0) : data(data), next(next), sleepTime(sleepTime) {}
    8000289c:	00953023          	sd	s1,0(a0)
    800028a0:	00053423          	sd	zero,8(a0)
    800028a4:	00052823          	sw	zero,16(a0)
        if (tail)
    800028a8:	00003797          	auipc	a5,0x3
    800028ac:	7507b783          	ld	a5,1872(a5) # 80005ff8 <_ZN9Scheduler16readyThreadQueueE+0x8>
    800028b0:	02078263          	beqz	a5,800028d4 <_ZN9Scheduler3putEP7_thread+0x5c>
            tail->next = elem;
    800028b4:	00a7b423          	sd	a0,8(a5)
            tail = elem;
    800028b8:	00003797          	auipc	a5,0x3
    800028bc:	74a7b023          	sd	a0,1856(a5) # 80005ff8 <_ZN9Scheduler16readyThreadQueueE+0x8>
    800028c0:	01813083          	ld	ra,24(sp)
    800028c4:	01013403          	ld	s0,16(sp)
    800028c8:	00813483          	ld	s1,8(sp)
    800028cc:	02010113          	addi	sp,sp,32
    800028d0:	00008067          	ret
            head = tail = elem;
    800028d4:	00003797          	auipc	a5,0x3
    800028d8:	71c78793          	addi	a5,a5,1820 # 80005ff0 <_ZN9Scheduler16readyThreadQueueE>
    800028dc:	00a7b423          	sd	a0,8(a5)
    800028e0:	00a7b023          	sd	a0,0(a5)
    800028e4:	fddff06f          	j	800028c0 <_ZN9Scheduler3putEP7_thread+0x48>

00000000800028e8 <_GLOBAL__sub_I__ZN9Scheduler16readyThreadQueueE>:
    800028e8:	ff010113          	addi	sp,sp,-16
    800028ec:	00113423          	sd	ra,8(sp)
    800028f0:	00813023          	sd	s0,0(sp)
    800028f4:	01010413          	addi	s0,sp,16
    800028f8:	000105b7          	lui	a1,0x10
    800028fc:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    80002900:	00100513          	li	a0,1
    80002904:	00000097          	auipc	ra,0x0
    80002908:	ecc080e7          	jalr	-308(ra) # 800027d0 <_Z41__static_initialization_and_destruction_0ii>
    8000290c:	00813083          	ld	ra,8(sp)
    80002910:	00013403          	ld	s0,0(sp)
    80002914:	01010113          	addi	sp,sp,16
    80002918:	00008067          	ret

000000008000291c <_ZN14KeyboardBuffer4takeEv>:
//    static KeyboardBuffer _instance;
//    return &_instance;
//}

//imlementacija uzeta iz zadatka sa klk3
char KeyboardBuffer::take () {
    8000291c:	fe010113          	addi	sp,sp,-32
    80002920:	00113c23          	sd	ra,24(sp)
    80002924:	00813823          	sd	s0,16(sp)
    80002928:	00913423          	sd	s1,8(sp)
    8000292c:	02010413          	addi	s0,sp,32
    80002930:	00050493          	mv	s1,a0
    itemAvailable->wait();
    80002934:	00053503          	ld	a0,0(a0)
    80002938:	00000097          	auipc	ra,0x0
    8000293c:	df0080e7          	jalr	-528(ra) # 80002728 <_ZN4_sem4waitEv>
//    kbint_mask();
    char c = buffer[head];
    80002940:	1084b783          	ld	a5,264(s1)
    80002944:	00f48733          	add	a4,s1,a5
    80002948:	00874503          	lbu	a0,8(a4)
    head = (head+1)%KB_SIZE;
    8000294c:	00178793          	addi	a5,a5,1
    80002950:	0ff7f793          	andi	a5,a5,255
    80002954:	10f4b423          	sd	a5,264(s1)
    count--;
    80002958:	1184b783          	ld	a5,280(s1)
    8000295c:	fff78793          	addi	a5,a5,-1
    80002960:	10f4bc23          	sd	a5,280(s1)
//    kbint_unmask();
    return c;
}
    80002964:	01813083          	ld	ra,24(sp)
    80002968:	01013403          	ld	s0,16(sp)
    8000296c:	00813483          	ld	s1,8(sp)
    80002970:	02010113          	addi	sp,sp,32
    80002974:	00008067          	ret

0000000080002978 <_ZN14KeyboardBuffer6appendEc>:
void KeyboardBuffer::append (char c) {
    if (count<KB_SIZE) {
    80002978:	11853783          	ld	a5,280(a0)
    8000297c:	0ff00713          	li	a4,255
    80002980:	00f77463          	bgeu	a4,a5,80002988 <_ZN14KeyboardBuffer6appendEc+0x10>
    80002984:	00008067          	ret
void KeyboardBuffer::append (char c) {
    80002988:	ff010113          	addi	sp,sp,-16
    8000298c:	00113423          	sd	ra,8(sp)
    80002990:	00813023          	sd	s0,0(sp)
    80002994:	01010413          	addi	s0,sp,16
        buffer[tail] = c;
    80002998:	11053703          	ld	a4,272(a0)
    8000299c:	00e506b3          	add	a3,a0,a4
    800029a0:	00b68423          	sb	a1,8(a3)
        tail = (tail+1)%KB_SIZE;
    800029a4:	00170713          	addi	a4,a4,1
    800029a8:	0ff77713          	andi	a4,a4,255
    800029ac:	10e53823          	sd	a4,272(a0)
        count++;
    800029b0:	00178793          	addi	a5,a5,1
    800029b4:	10f53c23          	sd	a5,280(a0)
        itemAvailable->signal();
    800029b8:	00053503          	ld	a0,0(a0)
    800029bc:	00000097          	auipc	ra,0x0
    800029c0:	db4080e7          	jalr	-588(ra) # 80002770 <_ZN4_sem6signalEv>
    }
    800029c4:	00813083          	ld	ra,8(sp)
    800029c8:	00013403          	ld	s0,0(sp)
    800029cc:	01010113          	addi	sp,sp,16
    800029d0:	00008067          	ret

00000000800029d4 <_Z11printStringPKc>:
#include "../h/print.hpp"
#include "../h/riscv.hpp"
//#include "../lib/console.h"

void printString(char const *string)
{
    800029d4:	fd010113          	addi	sp,sp,-48
    800029d8:	02113423          	sd	ra,40(sp)
    800029dc:	02813023          	sd	s0,32(sp)
    800029e0:	00913c23          	sd	s1,24(sp)
    800029e4:	01213823          	sd	s2,16(sp)
    800029e8:	03010413          	addi	s0,sp,48
    800029ec:	00050493          	mv	s1,a0
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    800029f0:	100027f3          	csrr	a5,sstatus
    800029f4:	fcf43c23          	sd	a5,-40(s0)
    return sstatus;
    800029f8:	fd843903          	ld	s2,-40(s0)
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    800029fc:	00200793          	li	a5,2
    80002a00:	1007b073          	csrc	sstatus,a5
    uint64 sstatus = Riscv::r_sstatus();
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    while (*string != '\0')
    80002a04:	0004c503          	lbu	a0,0(s1)
    80002a08:	00050a63          	beqz	a0,80002a1c <_Z11printStringPKc+0x48>
    {
        putc(*string);
    80002a0c:	fffff097          	auipc	ra,0xfffff
    80002a10:	9d0080e7          	jalr	-1584(ra) # 800013dc <_Z4putcc>
        string++;
    80002a14:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80002a18:	fedff06f          	j	80002a04 <_Z11printStringPKc+0x30>
    }
    Riscv::ms_sstatus(sstatus & Riscv::SSTATUS_SIE ? Riscv::SSTATUS_SIE : 0);
    80002a1c:	0009091b          	sext.w	s2,s2
    80002a20:	00297913          	andi	s2,s2,2
    80002a24:	0009091b          	sext.w	s2,s2
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    80002a28:	10092073          	csrs	sstatus,s2
}
    80002a2c:	02813083          	ld	ra,40(sp)
    80002a30:	02013403          	ld	s0,32(sp)
    80002a34:	01813483          	ld	s1,24(sp)
    80002a38:	01013903          	ld	s2,16(sp)
    80002a3c:	03010113          	addi	sp,sp,48
    80002a40:	00008067          	ret

0000000080002a44 <_Z12printIntegerm>:

void printInteger(uint64 integer)
{
    80002a44:	fc010113          	addi	sp,sp,-64
    80002a48:	02113c23          	sd	ra,56(sp)
    80002a4c:	02813823          	sd	s0,48(sp)
    80002a50:	02913423          	sd	s1,40(sp)
    80002a54:	03213023          	sd	s2,32(sp)
    80002a58:	04010413          	addi	s0,sp,64
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80002a5c:	100027f3          	csrr	a5,sstatus
    80002a60:	fcf43423          	sd	a5,-56(s0)
    return sstatus;
    80002a64:	fc843903          	ld	s2,-56(s0)
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    80002a68:	00200793          	li	a5,2
    80002a6c:	1007b073          	csrc	sstatus,a5
    {
        neg = 1;
        x = -integer;
    } else
    {
        x = integer;
    80002a70:	0005051b          	sext.w	a0,a0
    }

    i = 0;
    80002a74:	00000493          	li	s1,0
    do
    {
        buf[i++] = digits[x % 10];
    80002a78:	00a00613          	li	a2,10
    80002a7c:	02c5773b          	remuw	a4,a0,a2
    80002a80:	02071693          	slli	a3,a4,0x20
    80002a84:	0206d693          	srli	a3,a3,0x20
    80002a88:	00002717          	auipc	a4,0x2
    80002a8c:	65870713          	addi	a4,a4,1624 # 800050e0 <_ZZ12printIntegermE6digits>
    80002a90:	00d70733          	add	a4,a4,a3
    80002a94:	00074703          	lbu	a4,0(a4)
    80002a98:	fe040693          	addi	a3,s0,-32
    80002a9c:	009687b3          	add	a5,a3,s1
    80002aa0:	0014849b          	addiw	s1,s1,1
    80002aa4:	fee78823          	sb	a4,-16(a5)
    } while ((x /= 10) != 0);
    80002aa8:	0005071b          	sext.w	a4,a0
    80002aac:	02c5553b          	divuw	a0,a0,a2
    80002ab0:	00900793          	li	a5,9
    80002ab4:	fce7e2e3          	bltu	a5,a4,80002a78 <_Z12printIntegerm+0x34>
    if (neg)
        buf[i++] = '-';

    while (--i >= 0) { putc(buf[i]); }
    80002ab8:	fff4849b          	addiw	s1,s1,-1
    80002abc:	0004ce63          	bltz	s1,80002ad8 <_Z12printIntegerm+0x94>
    80002ac0:	fe040793          	addi	a5,s0,-32
    80002ac4:	009787b3          	add	a5,a5,s1
    80002ac8:	ff07c503          	lbu	a0,-16(a5)
    80002acc:	fffff097          	auipc	ra,0xfffff
    80002ad0:	910080e7          	jalr	-1776(ra) # 800013dc <_Z4putcc>
    80002ad4:	fe5ff06f          	j	80002ab8 <_Z12printIntegerm+0x74>
    Riscv::ms_sstatus(sstatus & Riscv::SSTATUS_SIE ? Riscv::SSTATUS_SIE : 0);
    80002ad8:	0009091b          	sext.w	s2,s2
    80002adc:	00297913          	andi	s2,s2,2
    80002ae0:	0009091b          	sext.w	s2,s2
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    80002ae4:	10092073          	csrs	sstatus,s2
    80002ae8:	03813083          	ld	ra,56(sp)
    80002aec:	03013403          	ld	s0,48(sp)
    80002af0:	02813483          	ld	s1,40(sp)
    80002af4:	02013903          	ld	s2,32(sp)
    80002af8:	04010113          	addi	sp,sp,64
    80002afc:	00008067          	ret

0000000080002b00 <start>:
    80002b00:	ff010113          	addi	sp,sp,-16
    80002b04:	00813423          	sd	s0,8(sp)
    80002b08:	01010413          	addi	s0,sp,16
    80002b0c:	300027f3          	csrr	a5,mstatus
    80002b10:	ffffe737          	lui	a4,0xffffe
    80002b14:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff758f>
    80002b18:	00e7f7b3          	and	a5,a5,a4
    80002b1c:	00001737          	lui	a4,0x1
    80002b20:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80002b24:	00e7e7b3          	or	a5,a5,a4
    80002b28:	30079073          	csrw	mstatus,a5
    80002b2c:	00000797          	auipc	a5,0x0
    80002b30:	16078793          	addi	a5,a5,352 # 80002c8c <system_main>
    80002b34:	34179073          	csrw	mepc,a5
    80002b38:	00000793          	li	a5,0
    80002b3c:	18079073          	csrw	satp,a5
    80002b40:	000107b7          	lui	a5,0x10
    80002b44:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80002b48:	30279073          	csrw	medeleg,a5
    80002b4c:	30379073          	csrw	mideleg,a5
    80002b50:	104027f3          	csrr	a5,sie
    80002b54:	2227e793          	ori	a5,a5,546
    80002b58:	10479073          	csrw	sie,a5
    80002b5c:	fff00793          	li	a5,-1
    80002b60:	00a7d793          	srli	a5,a5,0xa
    80002b64:	3b079073          	csrw	pmpaddr0,a5
    80002b68:	00f00793          	li	a5,15
    80002b6c:	3a079073          	csrw	pmpcfg0,a5
    80002b70:	f14027f3          	csrr	a5,mhartid
    80002b74:	0200c737          	lui	a4,0x200c
    80002b78:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80002b7c:	0007869b          	sext.w	a3,a5
    80002b80:	00269713          	slli	a4,a3,0x2
    80002b84:	000f4637          	lui	a2,0xf4
    80002b88:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80002b8c:	00d70733          	add	a4,a4,a3
    80002b90:	0037979b          	slliw	a5,a5,0x3
    80002b94:	020046b7          	lui	a3,0x2004
    80002b98:	00d787b3          	add	a5,a5,a3
    80002b9c:	00c585b3          	add	a1,a1,a2
    80002ba0:	00371693          	slli	a3,a4,0x3
    80002ba4:	00003717          	auipc	a4,0x3
    80002ba8:	45c70713          	addi	a4,a4,1116 # 80006000 <timer_scratch>
    80002bac:	00b7b023          	sd	a1,0(a5)
    80002bb0:	00d70733          	add	a4,a4,a3
    80002bb4:	00f73c23          	sd	a5,24(a4)
    80002bb8:	02c73023          	sd	a2,32(a4)
    80002bbc:	34071073          	csrw	mscratch,a4
    80002bc0:	00000797          	auipc	a5,0x0
    80002bc4:	6e078793          	addi	a5,a5,1760 # 800032a0 <timervec>
    80002bc8:	30579073          	csrw	mtvec,a5
    80002bcc:	300027f3          	csrr	a5,mstatus
    80002bd0:	0087e793          	ori	a5,a5,8
    80002bd4:	30079073          	csrw	mstatus,a5
    80002bd8:	304027f3          	csrr	a5,mie
    80002bdc:	0807e793          	ori	a5,a5,128
    80002be0:	30479073          	csrw	mie,a5
    80002be4:	f14027f3          	csrr	a5,mhartid
    80002be8:	0007879b          	sext.w	a5,a5
    80002bec:	00078213          	mv	tp,a5
    80002bf0:	30200073          	mret
    80002bf4:	00813403          	ld	s0,8(sp)
    80002bf8:	01010113          	addi	sp,sp,16
    80002bfc:	00008067          	ret

0000000080002c00 <timerinit>:
    80002c00:	ff010113          	addi	sp,sp,-16
    80002c04:	00813423          	sd	s0,8(sp)
    80002c08:	01010413          	addi	s0,sp,16
    80002c0c:	f14027f3          	csrr	a5,mhartid
    80002c10:	0200c737          	lui	a4,0x200c
    80002c14:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80002c18:	0007869b          	sext.w	a3,a5
    80002c1c:	00269713          	slli	a4,a3,0x2
    80002c20:	000f4637          	lui	a2,0xf4
    80002c24:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80002c28:	00d70733          	add	a4,a4,a3
    80002c2c:	0037979b          	slliw	a5,a5,0x3
    80002c30:	020046b7          	lui	a3,0x2004
    80002c34:	00d787b3          	add	a5,a5,a3
    80002c38:	00c585b3          	add	a1,a1,a2
    80002c3c:	00371693          	slli	a3,a4,0x3
    80002c40:	00003717          	auipc	a4,0x3
    80002c44:	3c070713          	addi	a4,a4,960 # 80006000 <timer_scratch>
    80002c48:	00b7b023          	sd	a1,0(a5)
    80002c4c:	00d70733          	add	a4,a4,a3
    80002c50:	00f73c23          	sd	a5,24(a4)
    80002c54:	02c73023          	sd	a2,32(a4)
    80002c58:	34071073          	csrw	mscratch,a4
    80002c5c:	00000797          	auipc	a5,0x0
    80002c60:	64478793          	addi	a5,a5,1604 # 800032a0 <timervec>
    80002c64:	30579073          	csrw	mtvec,a5
    80002c68:	300027f3          	csrr	a5,mstatus
    80002c6c:	0087e793          	ori	a5,a5,8
    80002c70:	30079073          	csrw	mstatus,a5
    80002c74:	304027f3          	csrr	a5,mie
    80002c78:	0807e793          	ori	a5,a5,128
    80002c7c:	30479073          	csrw	mie,a5
    80002c80:	00813403          	ld	s0,8(sp)
    80002c84:	01010113          	addi	sp,sp,16
    80002c88:	00008067          	ret

0000000080002c8c <system_main>:
    80002c8c:	fe010113          	addi	sp,sp,-32
    80002c90:	00813823          	sd	s0,16(sp)
    80002c94:	00913423          	sd	s1,8(sp)
    80002c98:	00113c23          	sd	ra,24(sp)
    80002c9c:	02010413          	addi	s0,sp,32
    80002ca0:	00000097          	auipc	ra,0x0
    80002ca4:	0c4080e7          	jalr	196(ra) # 80002d64 <cpuid>
    80002ca8:	00003497          	auipc	s1,0x3
    80002cac:	0a848493          	addi	s1,s1,168 # 80005d50 <started>
    80002cb0:	02050263          	beqz	a0,80002cd4 <system_main+0x48>
    80002cb4:	0004a783          	lw	a5,0(s1)
    80002cb8:	0007879b          	sext.w	a5,a5
    80002cbc:	fe078ce3          	beqz	a5,80002cb4 <system_main+0x28>
    80002cc0:	0ff0000f          	fence
    80002cc4:	00002517          	auipc	a0,0x2
    80002cc8:	45c50513          	addi	a0,a0,1116 # 80005120 <_ZZ12printIntegermE6digits+0x40>
    80002ccc:	00001097          	auipc	ra,0x1
    80002cd0:	a70080e7          	jalr	-1424(ra) # 8000373c <panic>
    80002cd4:	00001097          	auipc	ra,0x1
    80002cd8:	9c4080e7          	jalr	-1596(ra) # 80003698 <consoleinit>
    80002cdc:	00001097          	auipc	ra,0x1
    80002ce0:	150080e7          	jalr	336(ra) # 80003e2c <printfinit>
    80002ce4:	00002517          	auipc	a0,0x2
    80002ce8:	3e450513          	addi	a0,a0,996 # 800050c8 <CONSOLE_STATUS+0xb8>
    80002cec:	00001097          	auipc	ra,0x1
    80002cf0:	aac080e7          	jalr	-1364(ra) # 80003798 <__printf>
    80002cf4:	00002517          	auipc	a0,0x2
    80002cf8:	3fc50513          	addi	a0,a0,1020 # 800050f0 <_ZZ12printIntegermE6digits+0x10>
    80002cfc:	00001097          	auipc	ra,0x1
    80002d00:	a9c080e7          	jalr	-1380(ra) # 80003798 <__printf>
    80002d04:	00002517          	auipc	a0,0x2
    80002d08:	3c450513          	addi	a0,a0,964 # 800050c8 <CONSOLE_STATUS+0xb8>
    80002d0c:	00001097          	auipc	ra,0x1
    80002d10:	a8c080e7          	jalr	-1396(ra) # 80003798 <__printf>
    80002d14:	00001097          	auipc	ra,0x1
    80002d18:	4a4080e7          	jalr	1188(ra) # 800041b8 <kinit>
    80002d1c:	00000097          	auipc	ra,0x0
    80002d20:	148080e7          	jalr	328(ra) # 80002e64 <trapinit>
    80002d24:	00000097          	auipc	ra,0x0
    80002d28:	16c080e7          	jalr	364(ra) # 80002e90 <trapinithart>
    80002d2c:	00000097          	auipc	ra,0x0
    80002d30:	5b4080e7          	jalr	1460(ra) # 800032e0 <plicinit>
    80002d34:	00000097          	auipc	ra,0x0
    80002d38:	5d4080e7          	jalr	1492(ra) # 80003308 <plicinithart>
    80002d3c:	00000097          	auipc	ra,0x0
    80002d40:	078080e7          	jalr	120(ra) # 80002db4 <userinit>
    80002d44:	0ff0000f          	fence
    80002d48:	00100793          	li	a5,1
    80002d4c:	00002517          	auipc	a0,0x2
    80002d50:	3bc50513          	addi	a0,a0,956 # 80005108 <_ZZ12printIntegermE6digits+0x28>
    80002d54:	00f4a023          	sw	a5,0(s1)
    80002d58:	00001097          	auipc	ra,0x1
    80002d5c:	a40080e7          	jalr	-1472(ra) # 80003798 <__printf>
    80002d60:	0000006f          	j	80002d60 <system_main+0xd4>

0000000080002d64 <cpuid>:
    80002d64:	ff010113          	addi	sp,sp,-16
    80002d68:	00813423          	sd	s0,8(sp)
    80002d6c:	01010413          	addi	s0,sp,16
    80002d70:	00020513          	mv	a0,tp
    80002d74:	00813403          	ld	s0,8(sp)
    80002d78:	0005051b          	sext.w	a0,a0
    80002d7c:	01010113          	addi	sp,sp,16
    80002d80:	00008067          	ret

0000000080002d84 <mycpu>:
    80002d84:	ff010113          	addi	sp,sp,-16
    80002d88:	00813423          	sd	s0,8(sp)
    80002d8c:	01010413          	addi	s0,sp,16
    80002d90:	00020793          	mv	a5,tp
    80002d94:	00813403          	ld	s0,8(sp)
    80002d98:	0007879b          	sext.w	a5,a5
    80002d9c:	00779793          	slli	a5,a5,0x7
    80002da0:	00004517          	auipc	a0,0x4
    80002da4:	29050513          	addi	a0,a0,656 # 80007030 <cpus>
    80002da8:	00f50533          	add	a0,a0,a5
    80002dac:	01010113          	addi	sp,sp,16
    80002db0:	00008067          	ret

0000000080002db4 <userinit>:
    80002db4:	ff010113          	addi	sp,sp,-16
    80002db8:	00813423          	sd	s0,8(sp)
    80002dbc:	01010413          	addi	s0,sp,16
    80002dc0:	00813403          	ld	s0,8(sp)
    80002dc4:	01010113          	addi	sp,sp,16
    80002dc8:	fffff317          	auipc	t1,0xfffff
    80002dcc:	b9030067          	jr	-1136(t1) # 80001958 <main>

0000000080002dd0 <either_copyout>:
    80002dd0:	ff010113          	addi	sp,sp,-16
    80002dd4:	00813023          	sd	s0,0(sp)
    80002dd8:	00113423          	sd	ra,8(sp)
    80002ddc:	01010413          	addi	s0,sp,16
    80002de0:	02051663          	bnez	a0,80002e0c <either_copyout+0x3c>
    80002de4:	00058513          	mv	a0,a1
    80002de8:	00060593          	mv	a1,a2
    80002dec:	0006861b          	sext.w	a2,a3
    80002df0:	00002097          	auipc	ra,0x2
    80002df4:	c54080e7          	jalr	-940(ra) # 80004a44 <__memmove>
    80002df8:	00813083          	ld	ra,8(sp)
    80002dfc:	00013403          	ld	s0,0(sp)
    80002e00:	00000513          	li	a0,0
    80002e04:	01010113          	addi	sp,sp,16
    80002e08:	00008067          	ret
    80002e0c:	00002517          	auipc	a0,0x2
    80002e10:	33c50513          	addi	a0,a0,828 # 80005148 <_ZZ12printIntegermE6digits+0x68>
    80002e14:	00001097          	auipc	ra,0x1
    80002e18:	928080e7          	jalr	-1752(ra) # 8000373c <panic>

0000000080002e1c <either_copyin>:
    80002e1c:	ff010113          	addi	sp,sp,-16
    80002e20:	00813023          	sd	s0,0(sp)
    80002e24:	00113423          	sd	ra,8(sp)
    80002e28:	01010413          	addi	s0,sp,16
    80002e2c:	02059463          	bnez	a1,80002e54 <either_copyin+0x38>
    80002e30:	00060593          	mv	a1,a2
    80002e34:	0006861b          	sext.w	a2,a3
    80002e38:	00002097          	auipc	ra,0x2
    80002e3c:	c0c080e7          	jalr	-1012(ra) # 80004a44 <__memmove>
    80002e40:	00813083          	ld	ra,8(sp)
    80002e44:	00013403          	ld	s0,0(sp)
    80002e48:	00000513          	li	a0,0
    80002e4c:	01010113          	addi	sp,sp,16
    80002e50:	00008067          	ret
    80002e54:	00002517          	auipc	a0,0x2
    80002e58:	31c50513          	addi	a0,a0,796 # 80005170 <_ZZ12printIntegermE6digits+0x90>
    80002e5c:	00001097          	auipc	ra,0x1
    80002e60:	8e0080e7          	jalr	-1824(ra) # 8000373c <panic>

0000000080002e64 <trapinit>:
    80002e64:	ff010113          	addi	sp,sp,-16
    80002e68:	00813423          	sd	s0,8(sp)
    80002e6c:	01010413          	addi	s0,sp,16
    80002e70:	00813403          	ld	s0,8(sp)
    80002e74:	00002597          	auipc	a1,0x2
    80002e78:	32458593          	addi	a1,a1,804 # 80005198 <_ZZ12printIntegermE6digits+0xb8>
    80002e7c:	00004517          	auipc	a0,0x4
    80002e80:	23450513          	addi	a0,a0,564 # 800070b0 <tickslock>
    80002e84:	01010113          	addi	sp,sp,16
    80002e88:	00001317          	auipc	t1,0x1
    80002e8c:	5c030067          	jr	1472(t1) # 80004448 <initlock>

0000000080002e90 <trapinithart>:
    80002e90:	ff010113          	addi	sp,sp,-16
    80002e94:	00813423          	sd	s0,8(sp)
    80002e98:	01010413          	addi	s0,sp,16
    80002e9c:	00000797          	auipc	a5,0x0
    80002ea0:	2f478793          	addi	a5,a5,756 # 80003190 <kernelvec>
    80002ea4:	10579073          	csrw	stvec,a5
    80002ea8:	00813403          	ld	s0,8(sp)
    80002eac:	01010113          	addi	sp,sp,16
    80002eb0:	00008067          	ret

0000000080002eb4 <usertrap>:
    80002eb4:	ff010113          	addi	sp,sp,-16
    80002eb8:	00813423          	sd	s0,8(sp)
    80002ebc:	01010413          	addi	s0,sp,16
    80002ec0:	00813403          	ld	s0,8(sp)
    80002ec4:	01010113          	addi	sp,sp,16
    80002ec8:	00008067          	ret

0000000080002ecc <usertrapret>:
    80002ecc:	ff010113          	addi	sp,sp,-16
    80002ed0:	00813423          	sd	s0,8(sp)
    80002ed4:	01010413          	addi	s0,sp,16
    80002ed8:	00813403          	ld	s0,8(sp)
    80002edc:	01010113          	addi	sp,sp,16
    80002ee0:	00008067          	ret

0000000080002ee4 <kerneltrap>:
    80002ee4:	fe010113          	addi	sp,sp,-32
    80002ee8:	00813823          	sd	s0,16(sp)
    80002eec:	00113c23          	sd	ra,24(sp)
    80002ef0:	00913423          	sd	s1,8(sp)
    80002ef4:	02010413          	addi	s0,sp,32
    80002ef8:	142025f3          	csrr	a1,scause
    80002efc:	100027f3          	csrr	a5,sstatus
    80002f00:	0027f793          	andi	a5,a5,2
    80002f04:	10079c63          	bnez	a5,8000301c <kerneltrap+0x138>
    80002f08:	142027f3          	csrr	a5,scause
    80002f0c:	0207ce63          	bltz	a5,80002f48 <kerneltrap+0x64>
    80002f10:	00002517          	auipc	a0,0x2
    80002f14:	2d050513          	addi	a0,a0,720 # 800051e0 <_ZZ12printIntegermE6digits+0x100>
    80002f18:	00001097          	auipc	ra,0x1
    80002f1c:	880080e7          	jalr	-1920(ra) # 80003798 <__printf>
    80002f20:	141025f3          	csrr	a1,sepc
    80002f24:	14302673          	csrr	a2,stval
    80002f28:	00002517          	auipc	a0,0x2
    80002f2c:	2c850513          	addi	a0,a0,712 # 800051f0 <_ZZ12printIntegermE6digits+0x110>
    80002f30:	00001097          	auipc	ra,0x1
    80002f34:	868080e7          	jalr	-1944(ra) # 80003798 <__printf>
    80002f38:	00002517          	auipc	a0,0x2
    80002f3c:	2d050513          	addi	a0,a0,720 # 80005208 <_ZZ12printIntegermE6digits+0x128>
    80002f40:	00000097          	auipc	ra,0x0
    80002f44:	7fc080e7          	jalr	2044(ra) # 8000373c <panic>
    80002f48:	0ff7f713          	andi	a4,a5,255
    80002f4c:	00900693          	li	a3,9
    80002f50:	04d70063          	beq	a4,a3,80002f90 <kerneltrap+0xac>
    80002f54:	fff00713          	li	a4,-1
    80002f58:	03f71713          	slli	a4,a4,0x3f
    80002f5c:	00170713          	addi	a4,a4,1
    80002f60:	fae798e3          	bne	a5,a4,80002f10 <kerneltrap+0x2c>
    80002f64:	00000097          	auipc	ra,0x0
    80002f68:	e00080e7          	jalr	-512(ra) # 80002d64 <cpuid>
    80002f6c:	06050663          	beqz	a0,80002fd8 <kerneltrap+0xf4>
    80002f70:	144027f3          	csrr	a5,sip
    80002f74:	ffd7f793          	andi	a5,a5,-3
    80002f78:	14479073          	csrw	sip,a5
    80002f7c:	01813083          	ld	ra,24(sp)
    80002f80:	01013403          	ld	s0,16(sp)
    80002f84:	00813483          	ld	s1,8(sp)
    80002f88:	02010113          	addi	sp,sp,32
    80002f8c:	00008067          	ret
    80002f90:	00000097          	auipc	ra,0x0
    80002f94:	3c4080e7          	jalr	964(ra) # 80003354 <plic_claim>
    80002f98:	00a00793          	li	a5,10
    80002f9c:	00050493          	mv	s1,a0
    80002fa0:	06f50863          	beq	a0,a5,80003010 <kerneltrap+0x12c>
    80002fa4:	fc050ce3          	beqz	a0,80002f7c <kerneltrap+0x98>
    80002fa8:	00050593          	mv	a1,a0
    80002fac:	00002517          	auipc	a0,0x2
    80002fb0:	21450513          	addi	a0,a0,532 # 800051c0 <_ZZ12printIntegermE6digits+0xe0>
    80002fb4:	00000097          	auipc	ra,0x0
    80002fb8:	7e4080e7          	jalr	2020(ra) # 80003798 <__printf>
    80002fbc:	01013403          	ld	s0,16(sp)
    80002fc0:	01813083          	ld	ra,24(sp)
    80002fc4:	00048513          	mv	a0,s1
    80002fc8:	00813483          	ld	s1,8(sp)
    80002fcc:	02010113          	addi	sp,sp,32
    80002fd0:	00000317          	auipc	t1,0x0
    80002fd4:	3bc30067          	jr	956(t1) # 8000338c <plic_complete>
    80002fd8:	00004517          	auipc	a0,0x4
    80002fdc:	0d850513          	addi	a0,a0,216 # 800070b0 <tickslock>
    80002fe0:	00001097          	auipc	ra,0x1
    80002fe4:	48c080e7          	jalr	1164(ra) # 8000446c <acquire>
    80002fe8:	00003717          	auipc	a4,0x3
    80002fec:	d6c70713          	addi	a4,a4,-660 # 80005d54 <ticks>
    80002ff0:	00072783          	lw	a5,0(a4)
    80002ff4:	00004517          	auipc	a0,0x4
    80002ff8:	0bc50513          	addi	a0,a0,188 # 800070b0 <tickslock>
    80002ffc:	0017879b          	addiw	a5,a5,1
    80003000:	00f72023          	sw	a5,0(a4)
    80003004:	00001097          	auipc	ra,0x1
    80003008:	534080e7          	jalr	1332(ra) # 80004538 <release>
    8000300c:	f65ff06f          	j	80002f70 <kerneltrap+0x8c>
    80003010:	00001097          	auipc	ra,0x1
    80003014:	090080e7          	jalr	144(ra) # 800040a0 <uartintr>
    80003018:	fa5ff06f          	j	80002fbc <kerneltrap+0xd8>
    8000301c:	00002517          	auipc	a0,0x2
    80003020:	18450513          	addi	a0,a0,388 # 800051a0 <_ZZ12printIntegermE6digits+0xc0>
    80003024:	00000097          	auipc	ra,0x0
    80003028:	718080e7          	jalr	1816(ra) # 8000373c <panic>

000000008000302c <clockintr>:
    8000302c:	fe010113          	addi	sp,sp,-32
    80003030:	00813823          	sd	s0,16(sp)
    80003034:	00913423          	sd	s1,8(sp)
    80003038:	00113c23          	sd	ra,24(sp)
    8000303c:	02010413          	addi	s0,sp,32
    80003040:	00004497          	auipc	s1,0x4
    80003044:	07048493          	addi	s1,s1,112 # 800070b0 <tickslock>
    80003048:	00048513          	mv	a0,s1
    8000304c:	00001097          	auipc	ra,0x1
    80003050:	420080e7          	jalr	1056(ra) # 8000446c <acquire>
    80003054:	00003717          	auipc	a4,0x3
    80003058:	d0070713          	addi	a4,a4,-768 # 80005d54 <ticks>
    8000305c:	00072783          	lw	a5,0(a4)
    80003060:	01013403          	ld	s0,16(sp)
    80003064:	01813083          	ld	ra,24(sp)
    80003068:	00048513          	mv	a0,s1
    8000306c:	0017879b          	addiw	a5,a5,1
    80003070:	00813483          	ld	s1,8(sp)
    80003074:	00f72023          	sw	a5,0(a4)
    80003078:	02010113          	addi	sp,sp,32
    8000307c:	00001317          	auipc	t1,0x1
    80003080:	4bc30067          	jr	1212(t1) # 80004538 <release>

0000000080003084 <devintr>:
    80003084:	142027f3          	csrr	a5,scause
    80003088:	00000513          	li	a0,0
    8000308c:	0007c463          	bltz	a5,80003094 <devintr+0x10>
    80003090:	00008067          	ret
    80003094:	fe010113          	addi	sp,sp,-32
    80003098:	00813823          	sd	s0,16(sp)
    8000309c:	00113c23          	sd	ra,24(sp)
    800030a0:	00913423          	sd	s1,8(sp)
    800030a4:	02010413          	addi	s0,sp,32
    800030a8:	0ff7f713          	andi	a4,a5,255
    800030ac:	00900693          	li	a3,9
    800030b0:	04d70c63          	beq	a4,a3,80003108 <devintr+0x84>
    800030b4:	fff00713          	li	a4,-1
    800030b8:	03f71713          	slli	a4,a4,0x3f
    800030bc:	00170713          	addi	a4,a4,1
    800030c0:	00e78c63          	beq	a5,a4,800030d8 <devintr+0x54>
    800030c4:	01813083          	ld	ra,24(sp)
    800030c8:	01013403          	ld	s0,16(sp)
    800030cc:	00813483          	ld	s1,8(sp)
    800030d0:	02010113          	addi	sp,sp,32
    800030d4:	00008067          	ret
    800030d8:	00000097          	auipc	ra,0x0
    800030dc:	c8c080e7          	jalr	-884(ra) # 80002d64 <cpuid>
    800030e0:	06050663          	beqz	a0,8000314c <devintr+0xc8>
    800030e4:	144027f3          	csrr	a5,sip
    800030e8:	ffd7f793          	andi	a5,a5,-3
    800030ec:	14479073          	csrw	sip,a5
    800030f0:	01813083          	ld	ra,24(sp)
    800030f4:	01013403          	ld	s0,16(sp)
    800030f8:	00813483          	ld	s1,8(sp)
    800030fc:	00200513          	li	a0,2
    80003100:	02010113          	addi	sp,sp,32
    80003104:	00008067          	ret
    80003108:	00000097          	auipc	ra,0x0
    8000310c:	24c080e7          	jalr	588(ra) # 80003354 <plic_claim>
    80003110:	00a00793          	li	a5,10
    80003114:	00050493          	mv	s1,a0
    80003118:	06f50663          	beq	a0,a5,80003184 <devintr+0x100>
    8000311c:	00100513          	li	a0,1
    80003120:	fa0482e3          	beqz	s1,800030c4 <devintr+0x40>
    80003124:	00048593          	mv	a1,s1
    80003128:	00002517          	auipc	a0,0x2
    8000312c:	09850513          	addi	a0,a0,152 # 800051c0 <_ZZ12printIntegermE6digits+0xe0>
    80003130:	00000097          	auipc	ra,0x0
    80003134:	668080e7          	jalr	1640(ra) # 80003798 <__printf>
    80003138:	00048513          	mv	a0,s1
    8000313c:	00000097          	auipc	ra,0x0
    80003140:	250080e7          	jalr	592(ra) # 8000338c <plic_complete>
    80003144:	00100513          	li	a0,1
    80003148:	f7dff06f          	j	800030c4 <devintr+0x40>
    8000314c:	00004517          	auipc	a0,0x4
    80003150:	f6450513          	addi	a0,a0,-156 # 800070b0 <tickslock>
    80003154:	00001097          	auipc	ra,0x1
    80003158:	318080e7          	jalr	792(ra) # 8000446c <acquire>
    8000315c:	00003717          	auipc	a4,0x3
    80003160:	bf870713          	addi	a4,a4,-1032 # 80005d54 <ticks>
    80003164:	00072783          	lw	a5,0(a4)
    80003168:	00004517          	auipc	a0,0x4
    8000316c:	f4850513          	addi	a0,a0,-184 # 800070b0 <tickslock>
    80003170:	0017879b          	addiw	a5,a5,1
    80003174:	00f72023          	sw	a5,0(a4)
    80003178:	00001097          	auipc	ra,0x1
    8000317c:	3c0080e7          	jalr	960(ra) # 80004538 <release>
    80003180:	f65ff06f          	j	800030e4 <devintr+0x60>
    80003184:	00001097          	auipc	ra,0x1
    80003188:	f1c080e7          	jalr	-228(ra) # 800040a0 <uartintr>
    8000318c:	fadff06f          	j	80003138 <devintr+0xb4>

0000000080003190 <kernelvec>:
    80003190:	f0010113          	addi	sp,sp,-256
    80003194:	00113023          	sd	ra,0(sp)
    80003198:	00213423          	sd	sp,8(sp)
    8000319c:	00313823          	sd	gp,16(sp)
    800031a0:	00413c23          	sd	tp,24(sp)
    800031a4:	02513023          	sd	t0,32(sp)
    800031a8:	02613423          	sd	t1,40(sp)
    800031ac:	02713823          	sd	t2,48(sp)
    800031b0:	02813c23          	sd	s0,56(sp)
    800031b4:	04913023          	sd	s1,64(sp)
    800031b8:	04a13423          	sd	a0,72(sp)
    800031bc:	04b13823          	sd	a1,80(sp)
    800031c0:	04c13c23          	sd	a2,88(sp)
    800031c4:	06d13023          	sd	a3,96(sp)
    800031c8:	06e13423          	sd	a4,104(sp)
    800031cc:	06f13823          	sd	a5,112(sp)
    800031d0:	07013c23          	sd	a6,120(sp)
    800031d4:	09113023          	sd	a7,128(sp)
    800031d8:	09213423          	sd	s2,136(sp)
    800031dc:	09313823          	sd	s3,144(sp)
    800031e0:	09413c23          	sd	s4,152(sp)
    800031e4:	0b513023          	sd	s5,160(sp)
    800031e8:	0b613423          	sd	s6,168(sp)
    800031ec:	0b713823          	sd	s7,176(sp)
    800031f0:	0b813c23          	sd	s8,184(sp)
    800031f4:	0d913023          	sd	s9,192(sp)
    800031f8:	0da13423          	sd	s10,200(sp)
    800031fc:	0db13823          	sd	s11,208(sp)
    80003200:	0dc13c23          	sd	t3,216(sp)
    80003204:	0fd13023          	sd	t4,224(sp)
    80003208:	0fe13423          	sd	t5,232(sp)
    8000320c:	0ff13823          	sd	t6,240(sp)
    80003210:	cd5ff0ef          	jal	ra,80002ee4 <kerneltrap>
    80003214:	00013083          	ld	ra,0(sp)
    80003218:	00813103          	ld	sp,8(sp)
    8000321c:	01013183          	ld	gp,16(sp)
    80003220:	02013283          	ld	t0,32(sp)
    80003224:	02813303          	ld	t1,40(sp)
    80003228:	03013383          	ld	t2,48(sp)
    8000322c:	03813403          	ld	s0,56(sp)
    80003230:	04013483          	ld	s1,64(sp)
    80003234:	04813503          	ld	a0,72(sp)
    80003238:	05013583          	ld	a1,80(sp)
    8000323c:	05813603          	ld	a2,88(sp)
    80003240:	06013683          	ld	a3,96(sp)
    80003244:	06813703          	ld	a4,104(sp)
    80003248:	07013783          	ld	a5,112(sp)
    8000324c:	07813803          	ld	a6,120(sp)
    80003250:	08013883          	ld	a7,128(sp)
    80003254:	08813903          	ld	s2,136(sp)
    80003258:	09013983          	ld	s3,144(sp)
    8000325c:	09813a03          	ld	s4,152(sp)
    80003260:	0a013a83          	ld	s5,160(sp)
    80003264:	0a813b03          	ld	s6,168(sp)
    80003268:	0b013b83          	ld	s7,176(sp)
    8000326c:	0b813c03          	ld	s8,184(sp)
    80003270:	0c013c83          	ld	s9,192(sp)
    80003274:	0c813d03          	ld	s10,200(sp)
    80003278:	0d013d83          	ld	s11,208(sp)
    8000327c:	0d813e03          	ld	t3,216(sp)
    80003280:	0e013e83          	ld	t4,224(sp)
    80003284:	0e813f03          	ld	t5,232(sp)
    80003288:	0f013f83          	ld	t6,240(sp)
    8000328c:	10010113          	addi	sp,sp,256
    80003290:	10200073          	sret
    80003294:	00000013          	nop
    80003298:	00000013          	nop
    8000329c:	00000013          	nop

00000000800032a0 <timervec>:
    800032a0:	34051573          	csrrw	a0,mscratch,a0
    800032a4:	00b53023          	sd	a1,0(a0)
    800032a8:	00c53423          	sd	a2,8(a0)
    800032ac:	00d53823          	sd	a3,16(a0)
    800032b0:	01853583          	ld	a1,24(a0)
    800032b4:	02053603          	ld	a2,32(a0)
    800032b8:	0005b683          	ld	a3,0(a1)
    800032bc:	00c686b3          	add	a3,a3,a2
    800032c0:	00d5b023          	sd	a3,0(a1)
    800032c4:	00200593          	li	a1,2
    800032c8:	14459073          	csrw	sip,a1
    800032cc:	01053683          	ld	a3,16(a0)
    800032d0:	00853603          	ld	a2,8(a0)
    800032d4:	00053583          	ld	a1,0(a0)
    800032d8:	34051573          	csrrw	a0,mscratch,a0
    800032dc:	30200073          	mret

00000000800032e0 <plicinit>:
    800032e0:	ff010113          	addi	sp,sp,-16
    800032e4:	00813423          	sd	s0,8(sp)
    800032e8:	01010413          	addi	s0,sp,16
    800032ec:	00813403          	ld	s0,8(sp)
    800032f0:	0c0007b7          	lui	a5,0xc000
    800032f4:	00100713          	li	a4,1
    800032f8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    800032fc:	00e7a223          	sw	a4,4(a5)
    80003300:	01010113          	addi	sp,sp,16
    80003304:	00008067          	ret

0000000080003308 <plicinithart>:
    80003308:	ff010113          	addi	sp,sp,-16
    8000330c:	00813023          	sd	s0,0(sp)
    80003310:	00113423          	sd	ra,8(sp)
    80003314:	01010413          	addi	s0,sp,16
    80003318:	00000097          	auipc	ra,0x0
    8000331c:	a4c080e7          	jalr	-1460(ra) # 80002d64 <cpuid>
    80003320:	0085171b          	slliw	a4,a0,0x8
    80003324:	0c0027b7          	lui	a5,0xc002
    80003328:	00e787b3          	add	a5,a5,a4
    8000332c:	40200713          	li	a4,1026
    80003330:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80003334:	00813083          	ld	ra,8(sp)
    80003338:	00013403          	ld	s0,0(sp)
    8000333c:	00d5151b          	slliw	a0,a0,0xd
    80003340:	0c2017b7          	lui	a5,0xc201
    80003344:	00a78533          	add	a0,a5,a0
    80003348:	00052023          	sw	zero,0(a0)
    8000334c:	01010113          	addi	sp,sp,16
    80003350:	00008067          	ret

0000000080003354 <plic_claim>:
    80003354:	ff010113          	addi	sp,sp,-16
    80003358:	00813023          	sd	s0,0(sp)
    8000335c:	00113423          	sd	ra,8(sp)
    80003360:	01010413          	addi	s0,sp,16
    80003364:	00000097          	auipc	ra,0x0
    80003368:	a00080e7          	jalr	-1536(ra) # 80002d64 <cpuid>
    8000336c:	00813083          	ld	ra,8(sp)
    80003370:	00013403          	ld	s0,0(sp)
    80003374:	00d5151b          	slliw	a0,a0,0xd
    80003378:	0c2017b7          	lui	a5,0xc201
    8000337c:	00a78533          	add	a0,a5,a0
    80003380:	00452503          	lw	a0,4(a0)
    80003384:	01010113          	addi	sp,sp,16
    80003388:	00008067          	ret

000000008000338c <plic_complete>:
    8000338c:	fe010113          	addi	sp,sp,-32
    80003390:	00813823          	sd	s0,16(sp)
    80003394:	00913423          	sd	s1,8(sp)
    80003398:	00113c23          	sd	ra,24(sp)
    8000339c:	02010413          	addi	s0,sp,32
    800033a0:	00050493          	mv	s1,a0
    800033a4:	00000097          	auipc	ra,0x0
    800033a8:	9c0080e7          	jalr	-1600(ra) # 80002d64 <cpuid>
    800033ac:	01813083          	ld	ra,24(sp)
    800033b0:	01013403          	ld	s0,16(sp)
    800033b4:	00d5179b          	slliw	a5,a0,0xd
    800033b8:	0c201737          	lui	a4,0xc201
    800033bc:	00f707b3          	add	a5,a4,a5
    800033c0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    800033c4:	00813483          	ld	s1,8(sp)
    800033c8:	02010113          	addi	sp,sp,32
    800033cc:	00008067          	ret

00000000800033d0 <consolewrite>:
    800033d0:	fb010113          	addi	sp,sp,-80
    800033d4:	04813023          	sd	s0,64(sp)
    800033d8:	04113423          	sd	ra,72(sp)
    800033dc:	02913c23          	sd	s1,56(sp)
    800033e0:	03213823          	sd	s2,48(sp)
    800033e4:	03313423          	sd	s3,40(sp)
    800033e8:	03413023          	sd	s4,32(sp)
    800033ec:	01513c23          	sd	s5,24(sp)
    800033f0:	05010413          	addi	s0,sp,80
    800033f4:	06c05c63          	blez	a2,8000346c <consolewrite+0x9c>
    800033f8:	00060993          	mv	s3,a2
    800033fc:	00050a13          	mv	s4,a0
    80003400:	00058493          	mv	s1,a1
    80003404:	00000913          	li	s2,0
    80003408:	fff00a93          	li	s5,-1
    8000340c:	01c0006f          	j	80003428 <consolewrite+0x58>
    80003410:	fbf44503          	lbu	a0,-65(s0)
    80003414:	0019091b          	addiw	s2,s2,1
    80003418:	00148493          	addi	s1,s1,1
    8000341c:	00001097          	auipc	ra,0x1
    80003420:	a9c080e7          	jalr	-1380(ra) # 80003eb8 <uartputc>
    80003424:	03298063          	beq	s3,s2,80003444 <consolewrite+0x74>
    80003428:	00048613          	mv	a2,s1
    8000342c:	00100693          	li	a3,1
    80003430:	000a0593          	mv	a1,s4
    80003434:	fbf40513          	addi	a0,s0,-65
    80003438:	00000097          	auipc	ra,0x0
    8000343c:	9e4080e7          	jalr	-1564(ra) # 80002e1c <either_copyin>
    80003440:	fd5518e3          	bne	a0,s5,80003410 <consolewrite+0x40>
    80003444:	04813083          	ld	ra,72(sp)
    80003448:	04013403          	ld	s0,64(sp)
    8000344c:	03813483          	ld	s1,56(sp)
    80003450:	02813983          	ld	s3,40(sp)
    80003454:	02013a03          	ld	s4,32(sp)
    80003458:	01813a83          	ld	s5,24(sp)
    8000345c:	00090513          	mv	a0,s2
    80003460:	03013903          	ld	s2,48(sp)
    80003464:	05010113          	addi	sp,sp,80
    80003468:	00008067          	ret
    8000346c:	00000913          	li	s2,0
    80003470:	fd5ff06f          	j	80003444 <consolewrite+0x74>

0000000080003474 <consoleread>:
    80003474:	f9010113          	addi	sp,sp,-112
    80003478:	06813023          	sd	s0,96(sp)
    8000347c:	04913c23          	sd	s1,88(sp)
    80003480:	05213823          	sd	s2,80(sp)
    80003484:	05313423          	sd	s3,72(sp)
    80003488:	05413023          	sd	s4,64(sp)
    8000348c:	03513c23          	sd	s5,56(sp)
    80003490:	03613823          	sd	s6,48(sp)
    80003494:	03713423          	sd	s7,40(sp)
    80003498:	03813023          	sd	s8,32(sp)
    8000349c:	06113423          	sd	ra,104(sp)
    800034a0:	01913c23          	sd	s9,24(sp)
    800034a4:	07010413          	addi	s0,sp,112
    800034a8:	00060b93          	mv	s7,a2
    800034ac:	00050913          	mv	s2,a0
    800034b0:	00058c13          	mv	s8,a1
    800034b4:	00060b1b          	sext.w	s6,a2
    800034b8:	00004497          	auipc	s1,0x4
    800034bc:	c2048493          	addi	s1,s1,-992 # 800070d8 <cons>
    800034c0:	00400993          	li	s3,4
    800034c4:	fff00a13          	li	s4,-1
    800034c8:	00a00a93          	li	s5,10
    800034cc:	05705e63          	blez	s7,80003528 <consoleread+0xb4>
    800034d0:	09c4a703          	lw	a4,156(s1)
    800034d4:	0984a783          	lw	a5,152(s1)
    800034d8:	0007071b          	sext.w	a4,a4
    800034dc:	08e78463          	beq	a5,a4,80003564 <consoleread+0xf0>
    800034e0:	07f7f713          	andi	a4,a5,127
    800034e4:	00e48733          	add	a4,s1,a4
    800034e8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    800034ec:	0017869b          	addiw	a3,a5,1
    800034f0:	08d4ac23          	sw	a3,152(s1)
    800034f4:	00070c9b          	sext.w	s9,a4
    800034f8:	0b370663          	beq	a4,s3,800035a4 <consoleread+0x130>
    800034fc:	00100693          	li	a3,1
    80003500:	f9f40613          	addi	a2,s0,-97
    80003504:	000c0593          	mv	a1,s8
    80003508:	00090513          	mv	a0,s2
    8000350c:	f8e40fa3          	sb	a4,-97(s0)
    80003510:	00000097          	auipc	ra,0x0
    80003514:	8c0080e7          	jalr	-1856(ra) # 80002dd0 <either_copyout>
    80003518:	01450863          	beq	a0,s4,80003528 <consoleread+0xb4>
    8000351c:	001c0c13          	addi	s8,s8,1
    80003520:	fffb8b9b          	addiw	s7,s7,-1
    80003524:	fb5c94e3          	bne	s9,s5,800034cc <consoleread+0x58>
    80003528:	000b851b          	sext.w	a0,s7
    8000352c:	06813083          	ld	ra,104(sp)
    80003530:	06013403          	ld	s0,96(sp)
    80003534:	05813483          	ld	s1,88(sp)
    80003538:	05013903          	ld	s2,80(sp)
    8000353c:	04813983          	ld	s3,72(sp)
    80003540:	04013a03          	ld	s4,64(sp)
    80003544:	03813a83          	ld	s5,56(sp)
    80003548:	02813b83          	ld	s7,40(sp)
    8000354c:	02013c03          	ld	s8,32(sp)
    80003550:	01813c83          	ld	s9,24(sp)
    80003554:	40ab053b          	subw	a0,s6,a0
    80003558:	03013b03          	ld	s6,48(sp)
    8000355c:	07010113          	addi	sp,sp,112
    80003560:	00008067          	ret
    80003564:	00001097          	auipc	ra,0x1
    80003568:	1d8080e7          	jalr	472(ra) # 8000473c <push_on>
    8000356c:	0984a703          	lw	a4,152(s1)
    80003570:	09c4a783          	lw	a5,156(s1)
    80003574:	0007879b          	sext.w	a5,a5
    80003578:	fef70ce3          	beq	a4,a5,80003570 <consoleread+0xfc>
    8000357c:	00001097          	auipc	ra,0x1
    80003580:	234080e7          	jalr	564(ra) # 800047b0 <pop_on>
    80003584:	0984a783          	lw	a5,152(s1)
    80003588:	07f7f713          	andi	a4,a5,127
    8000358c:	00e48733          	add	a4,s1,a4
    80003590:	01874703          	lbu	a4,24(a4)
    80003594:	0017869b          	addiw	a3,a5,1
    80003598:	08d4ac23          	sw	a3,152(s1)
    8000359c:	00070c9b          	sext.w	s9,a4
    800035a0:	f5371ee3          	bne	a4,s3,800034fc <consoleread+0x88>
    800035a4:	000b851b          	sext.w	a0,s7
    800035a8:	f96bf2e3          	bgeu	s7,s6,8000352c <consoleread+0xb8>
    800035ac:	08f4ac23          	sw	a5,152(s1)
    800035b0:	f7dff06f          	j	8000352c <consoleread+0xb8>

00000000800035b4 <consputc>:
    800035b4:	10000793          	li	a5,256
    800035b8:	00f50663          	beq	a0,a5,800035c4 <consputc+0x10>
    800035bc:	00001317          	auipc	t1,0x1
    800035c0:	9f430067          	jr	-1548(t1) # 80003fb0 <uartputc_sync>
    800035c4:	ff010113          	addi	sp,sp,-16
    800035c8:	00113423          	sd	ra,8(sp)
    800035cc:	00813023          	sd	s0,0(sp)
    800035d0:	01010413          	addi	s0,sp,16
    800035d4:	00800513          	li	a0,8
    800035d8:	00001097          	auipc	ra,0x1
    800035dc:	9d8080e7          	jalr	-1576(ra) # 80003fb0 <uartputc_sync>
    800035e0:	02000513          	li	a0,32
    800035e4:	00001097          	auipc	ra,0x1
    800035e8:	9cc080e7          	jalr	-1588(ra) # 80003fb0 <uartputc_sync>
    800035ec:	00013403          	ld	s0,0(sp)
    800035f0:	00813083          	ld	ra,8(sp)
    800035f4:	00800513          	li	a0,8
    800035f8:	01010113          	addi	sp,sp,16
    800035fc:	00001317          	auipc	t1,0x1
    80003600:	9b430067          	jr	-1612(t1) # 80003fb0 <uartputc_sync>

0000000080003604 <consoleintr>:
    80003604:	fe010113          	addi	sp,sp,-32
    80003608:	00813823          	sd	s0,16(sp)
    8000360c:	00913423          	sd	s1,8(sp)
    80003610:	01213023          	sd	s2,0(sp)
    80003614:	00113c23          	sd	ra,24(sp)
    80003618:	02010413          	addi	s0,sp,32
    8000361c:	00004917          	auipc	s2,0x4
    80003620:	abc90913          	addi	s2,s2,-1348 # 800070d8 <cons>
    80003624:	00050493          	mv	s1,a0
    80003628:	00090513          	mv	a0,s2
    8000362c:	00001097          	auipc	ra,0x1
    80003630:	e40080e7          	jalr	-448(ra) # 8000446c <acquire>
    80003634:	02048c63          	beqz	s1,8000366c <consoleintr+0x68>
    80003638:	0a092783          	lw	a5,160(s2)
    8000363c:	09892703          	lw	a4,152(s2)
    80003640:	07f00693          	li	a3,127
    80003644:	40e7873b          	subw	a4,a5,a4
    80003648:	02e6e263          	bltu	a3,a4,8000366c <consoleintr+0x68>
    8000364c:	00d00713          	li	a4,13
    80003650:	04e48063          	beq	s1,a4,80003690 <consoleintr+0x8c>
    80003654:	07f7f713          	andi	a4,a5,127
    80003658:	00e90733          	add	a4,s2,a4
    8000365c:	0017879b          	addiw	a5,a5,1
    80003660:	0af92023          	sw	a5,160(s2)
    80003664:	00970c23          	sb	s1,24(a4)
    80003668:	08f92e23          	sw	a5,156(s2)
    8000366c:	01013403          	ld	s0,16(sp)
    80003670:	01813083          	ld	ra,24(sp)
    80003674:	00813483          	ld	s1,8(sp)
    80003678:	00013903          	ld	s2,0(sp)
    8000367c:	00004517          	auipc	a0,0x4
    80003680:	a5c50513          	addi	a0,a0,-1444 # 800070d8 <cons>
    80003684:	02010113          	addi	sp,sp,32
    80003688:	00001317          	auipc	t1,0x1
    8000368c:	eb030067          	jr	-336(t1) # 80004538 <release>
    80003690:	00a00493          	li	s1,10
    80003694:	fc1ff06f          	j	80003654 <consoleintr+0x50>

0000000080003698 <consoleinit>:
    80003698:	fe010113          	addi	sp,sp,-32
    8000369c:	00113c23          	sd	ra,24(sp)
    800036a0:	00813823          	sd	s0,16(sp)
    800036a4:	00913423          	sd	s1,8(sp)
    800036a8:	02010413          	addi	s0,sp,32
    800036ac:	00004497          	auipc	s1,0x4
    800036b0:	a2c48493          	addi	s1,s1,-1492 # 800070d8 <cons>
    800036b4:	00048513          	mv	a0,s1
    800036b8:	00002597          	auipc	a1,0x2
    800036bc:	b6058593          	addi	a1,a1,-1184 # 80005218 <_ZZ12printIntegermE6digits+0x138>
    800036c0:	00001097          	auipc	ra,0x1
    800036c4:	d88080e7          	jalr	-632(ra) # 80004448 <initlock>
    800036c8:	00000097          	auipc	ra,0x0
    800036cc:	7ac080e7          	jalr	1964(ra) # 80003e74 <uartinit>
    800036d0:	01813083          	ld	ra,24(sp)
    800036d4:	01013403          	ld	s0,16(sp)
    800036d8:	00000797          	auipc	a5,0x0
    800036dc:	d9c78793          	addi	a5,a5,-612 # 80003474 <consoleread>
    800036e0:	0af4bc23          	sd	a5,184(s1)
    800036e4:	00000797          	auipc	a5,0x0
    800036e8:	cec78793          	addi	a5,a5,-788 # 800033d0 <consolewrite>
    800036ec:	0cf4b023          	sd	a5,192(s1)
    800036f0:	00813483          	ld	s1,8(sp)
    800036f4:	02010113          	addi	sp,sp,32
    800036f8:	00008067          	ret

00000000800036fc <console_read>:
    800036fc:	ff010113          	addi	sp,sp,-16
    80003700:	00813423          	sd	s0,8(sp)
    80003704:	01010413          	addi	s0,sp,16
    80003708:	00813403          	ld	s0,8(sp)
    8000370c:	00004317          	auipc	t1,0x4
    80003710:	a8433303          	ld	t1,-1404(t1) # 80007190 <devsw+0x10>
    80003714:	01010113          	addi	sp,sp,16
    80003718:	00030067          	jr	t1

000000008000371c <console_write>:
    8000371c:	ff010113          	addi	sp,sp,-16
    80003720:	00813423          	sd	s0,8(sp)
    80003724:	01010413          	addi	s0,sp,16
    80003728:	00813403          	ld	s0,8(sp)
    8000372c:	00004317          	auipc	t1,0x4
    80003730:	a6c33303          	ld	t1,-1428(t1) # 80007198 <devsw+0x18>
    80003734:	01010113          	addi	sp,sp,16
    80003738:	00030067          	jr	t1

000000008000373c <panic>:
    8000373c:	fe010113          	addi	sp,sp,-32
    80003740:	00113c23          	sd	ra,24(sp)
    80003744:	00813823          	sd	s0,16(sp)
    80003748:	00913423          	sd	s1,8(sp)
    8000374c:	02010413          	addi	s0,sp,32
    80003750:	00050493          	mv	s1,a0
    80003754:	00002517          	auipc	a0,0x2
    80003758:	acc50513          	addi	a0,a0,-1332 # 80005220 <_ZZ12printIntegermE6digits+0x140>
    8000375c:	00004797          	auipc	a5,0x4
    80003760:	ac07ae23          	sw	zero,-1316(a5) # 80007238 <pr+0x18>
    80003764:	00000097          	auipc	ra,0x0
    80003768:	034080e7          	jalr	52(ra) # 80003798 <__printf>
    8000376c:	00048513          	mv	a0,s1
    80003770:	00000097          	auipc	ra,0x0
    80003774:	028080e7          	jalr	40(ra) # 80003798 <__printf>
    80003778:	00002517          	auipc	a0,0x2
    8000377c:	95050513          	addi	a0,a0,-1712 # 800050c8 <CONSOLE_STATUS+0xb8>
    80003780:	00000097          	auipc	ra,0x0
    80003784:	018080e7          	jalr	24(ra) # 80003798 <__printf>
    80003788:	00100793          	li	a5,1
    8000378c:	00002717          	auipc	a4,0x2
    80003790:	5cf72623          	sw	a5,1484(a4) # 80005d58 <panicked>
    80003794:	0000006f          	j	80003794 <panic+0x58>

0000000080003798 <__printf>:
    80003798:	f3010113          	addi	sp,sp,-208
    8000379c:	08813023          	sd	s0,128(sp)
    800037a0:	07313423          	sd	s3,104(sp)
    800037a4:	09010413          	addi	s0,sp,144
    800037a8:	05813023          	sd	s8,64(sp)
    800037ac:	08113423          	sd	ra,136(sp)
    800037b0:	06913c23          	sd	s1,120(sp)
    800037b4:	07213823          	sd	s2,112(sp)
    800037b8:	07413023          	sd	s4,96(sp)
    800037bc:	05513c23          	sd	s5,88(sp)
    800037c0:	05613823          	sd	s6,80(sp)
    800037c4:	05713423          	sd	s7,72(sp)
    800037c8:	03913c23          	sd	s9,56(sp)
    800037cc:	03a13823          	sd	s10,48(sp)
    800037d0:	03b13423          	sd	s11,40(sp)
    800037d4:	00004317          	auipc	t1,0x4
    800037d8:	a4c30313          	addi	t1,t1,-1460 # 80007220 <pr>
    800037dc:	01832c03          	lw	s8,24(t1)
    800037e0:	00b43423          	sd	a1,8(s0)
    800037e4:	00c43823          	sd	a2,16(s0)
    800037e8:	00d43c23          	sd	a3,24(s0)
    800037ec:	02e43023          	sd	a4,32(s0)
    800037f0:	02f43423          	sd	a5,40(s0)
    800037f4:	03043823          	sd	a6,48(s0)
    800037f8:	03143c23          	sd	a7,56(s0)
    800037fc:	00050993          	mv	s3,a0
    80003800:	4a0c1663          	bnez	s8,80003cac <__printf+0x514>
    80003804:	60098c63          	beqz	s3,80003e1c <__printf+0x684>
    80003808:	0009c503          	lbu	a0,0(s3)
    8000380c:	00840793          	addi	a5,s0,8
    80003810:	f6f43c23          	sd	a5,-136(s0)
    80003814:	00000493          	li	s1,0
    80003818:	22050063          	beqz	a0,80003a38 <__printf+0x2a0>
    8000381c:	00002a37          	lui	s4,0x2
    80003820:	00018ab7          	lui	s5,0x18
    80003824:	000f4b37          	lui	s6,0xf4
    80003828:	00989bb7          	lui	s7,0x989
    8000382c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80003830:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80003834:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80003838:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    8000383c:	00148c9b          	addiw	s9,s1,1
    80003840:	02500793          	li	a5,37
    80003844:	01998933          	add	s2,s3,s9
    80003848:	38f51263          	bne	a0,a5,80003bcc <__printf+0x434>
    8000384c:	00094783          	lbu	a5,0(s2)
    80003850:	00078c9b          	sext.w	s9,a5
    80003854:	1e078263          	beqz	a5,80003a38 <__printf+0x2a0>
    80003858:	0024849b          	addiw	s1,s1,2
    8000385c:	07000713          	li	a4,112
    80003860:	00998933          	add	s2,s3,s1
    80003864:	38e78a63          	beq	a5,a4,80003bf8 <__printf+0x460>
    80003868:	20f76863          	bltu	a4,a5,80003a78 <__printf+0x2e0>
    8000386c:	42a78863          	beq	a5,a0,80003c9c <__printf+0x504>
    80003870:	06400713          	li	a4,100
    80003874:	40e79663          	bne	a5,a4,80003c80 <__printf+0x4e8>
    80003878:	f7843783          	ld	a5,-136(s0)
    8000387c:	0007a603          	lw	a2,0(a5)
    80003880:	00878793          	addi	a5,a5,8
    80003884:	f6f43c23          	sd	a5,-136(s0)
    80003888:	42064a63          	bltz	a2,80003cbc <__printf+0x524>
    8000388c:	00a00713          	li	a4,10
    80003890:	02e677bb          	remuw	a5,a2,a4
    80003894:	00002d97          	auipc	s11,0x2
    80003898:	9b4d8d93          	addi	s11,s11,-1612 # 80005248 <digits>
    8000389c:	00900593          	li	a1,9
    800038a0:	0006051b          	sext.w	a0,a2
    800038a4:	00000c93          	li	s9,0
    800038a8:	02079793          	slli	a5,a5,0x20
    800038ac:	0207d793          	srli	a5,a5,0x20
    800038b0:	00fd87b3          	add	a5,s11,a5
    800038b4:	0007c783          	lbu	a5,0(a5)
    800038b8:	02e656bb          	divuw	a3,a2,a4
    800038bc:	f8f40023          	sb	a5,-128(s0)
    800038c0:	14c5d863          	bge	a1,a2,80003a10 <__printf+0x278>
    800038c4:	06300593          	li	a1,99
    800038c8:	00100c93          	li	s9,1
    800038cc:	02e6f7bb          	remuw	a5,a3,a4
    800038d0:	02079793          	slli	a5,a5,0x20
    800038d4:	0207d793          	srli	a5,a5,0x20
    800038d8:	00fd87b3          	add	a5,s11,a5
    800038dc:	0007c783          	lbu	a5,0(a5)
    800038e0:	02e6d73b          	divuw	a4,a3,a4
    800038e4:	f8f400a3          	sb	a5,-127(s0)
    800038e8:	12a5f463          	bgeu	a1,a0,80003a10 <__printf+0x278>
    800038ec:	00a00693          	li	a3,10
    800038f0:	00900593          	li	a1,9
    800038f4:	02d777bb          	remuw	a5,a4,a3
    800038f8:	02079793          	slli	a5,a5,0x20
    800038fc:	0207d793          	srli	a5,a5,0x20
    80003900:	00fd87b3          	add	a5,s11,a5
    80003904:	0007c503          	lbu	a0,0(a5)
    80003908:	02d757bb          	divuw	a5,a4,a3
    8000390c:	f8a40123          	sb	a0,-126(s0)
    80003910:	48e5f263          	bgeu	a1,a4,80003d94 <__printf+0x5fc>
    80003914:	06300513          	li	a0,99
    80003918:	02d7f5bb          	remuw	a1,a5,a3
    8000391c:	02059593          	slli	a1,a1,0x20
    80003920:	0205d593          	srli	a1,a1,0x20
    80003924:	00bd85b3          	add	a1,s11,a1
    80003928:	0005c583          	lbu	a1,0(a1)
    8000392c:	02d7d7bb          	divuw	a5,a5,a3
    80003930:	f8b401a3          	sb	a1,-125(s0)
    80003934:	48e57263          	bgeu	a0,a4,80003db8 <__printf+0x620>
    80003938:	3e700513          	li	a0,999
    8000393c:	02d7f5bb          	remuw	a1,a5,a3
    80003940:	02059593          	slli	a1,a1,0x20
    80003944:	0205d593          	srli	a1,a1,0x20
    80003948:	00bd85b3          	add	a1,s11,a1
    8000394c:	0005c583          	lbu	a1,0(a1)
    80003950:	02d7d7bb          	divuw	a5,a5,a3
    80003954:	f8b40223          	sb	a1,-124(s0)
    80003958:	46e57663          	bgeu	a0,a4,80003dc4 <__printf+0x62c>
    8000395c:	02d7f5bb          	remuw	a1,a5,a3
    80003960:	02059593          	slli	a1,a1,0x20
    80003964:	0205d593          	srli	a1,a1,0x20
    80003968:	00bd85b3          	add	a1,s11,a1
    8000396c:	0005c583          	lbu	a1,0(a1)
    80003970:	02d7d7bb          	divuw	a5,a5,a3
    80003974:	f8b402a3          	sb	a1,-123(s0)
    80003978:	46ea7863          	bgeu	s4,a4,80003de8 <__printf+0x650>
    8000397c:	02d7f5bb          	remuw	a1,a5,a3
    80003980:	02059593          	slli	a1,a1,0x20
    80003984:	0205d593          	srli	a1,a1,0x20
    80003988:	00bd85b3          	add	a1,s11,a1
    8000398c:	0005c583          	lbu	a1,0(a1)
    80003990:	02d7d7bb          	divuw	a5,a5,a3
    80003994:	f8b40323          	sb	a1,-122(s0)
    80003998:	3eeaf863          	bgeu	s5,a4,80003d88 <__printf+0x5f0>
    8000399c:	02d7f5bb          	remuw	a1,a5,a3
    800039a0:	02059593          	slli	a1,a1,0x20
    800039a4:	0205d593          	srli	a1,a1,0x20
    800039a8:	00bd85b3          	add	a1,s11,a1
    800039ac:	0005c583          	lbu	a1,0(a1)
    800039b0:	02d7d7bb          	divuw	a5,a5,a3
    800039b4:	f8b403a3          	sb	a1,-121(s0)
    800039b8:	42eb7e63          	bgeu	s6,a4,80003df4 <__printf+0x65c>
    800039bc:	02d7f5bb          	remuw	a1,a5,a3
    800039c0:	02059593          	slli	a1,a1,0x20
    800039c4:	0205d593          	srli	a1,a1,0x20
    800039c8:	00bd85b3          	add	a1,s11,a1
    800039cc:	0005c583          	lbu	a1,0(a1)
    800039d0:	02d7d7bb          	divuw	a5,a5,a3
    800039d4:	f8b40423          	sb	a1,-120(s0)
    800039d8:	42ebfc63          	bgeu	s7,a4,80003e10 <__printf+0x678>
    800039dc:	02079793          	slli	a5,a5,0x20
    800039e0:	0207d793          	srli	a5,a5,0x20
    800039e4:	00fd8db3          	add	s11,s11,a5
    800039e8:	000dc703          	lbu	a4,0(s11)
    800039ec:	00a00793          	li	a5,10
    800039f0:	00900c93          	li	s9,9
    800039f4:	f8e404a3          	sb	a4,-119(s0)
    800039f8:	00065c63          	bgez	a2,80003a10 <__printf+0x278>
    800039fc:	f9040713          	addi	a4,s0,-112
    80003a00:	00f70733          	add	a4,a4,a5
    80003a04:	02d00693          	li	a3,45
    80003a08:	fed70823          	sb	a3,-16(a4)
    80003a0c:	00078c93          	mv	s9,a5
    80003a10:	f8040793          	addi	a5,s0,-128
    80003a14:	01978cb3          	add	s9,a5,s9
    80003a18:	f7f40d13          	addi	s10,s0,-129
    80003a1c:	000cc503          	lbu	a0,0(s9)
    80003a20:	fffc8c93          	addi	s9,s9,-1
    80003a24:	00000097          	auipc	ra,0x0
    80003a28:	b90080e7          	jalr	-1136(ra) # 800035b4 <consputc>
    80003a2c:	ffac98e3          	bne	s9,s10,80003a1c <__printf+0x284>
    80003a30:	00094503          	lbu	a0,0(s2)
    80003a34:	e00514e3          	bnez	a0,8000383c <__printf+0xa4>
    80003a38:	1a0c1663          	bnez	s8,80003be4 <__printf+0x44c>
    80003a3c:	08813083          	ld	ra,136(sp)
    80003a40:	08013403          	ld	s0,128(sp)
    80003a44:	07813483          	ld	s1,120(sp)
    80003a48:	07013903          	ld	s2,112(sp)
    80003a4c:	06813983          	ld	s3,104(sp)
    80003a50:	06013a03          	ld	s4,96(sp)
    80003a54:	05813a83          	ld	s5,88(sp)
    80003a58:	05013b03          	ld	s6,80(sp)
    80003a5c:	04813b83          	ld	s7,72(sp)
    80003a60:	04013c03          	ld	s8,64(sp)
    80003a64:	03813c83          	ld	s9,56(sp)
    80003a68:	03013d03          	ld	s10,48(sp)
    80003a6c:	02813d83          	ld	s11,40(sp)
    80003a70:	0d010113          	addi	sp,sp,208
    80003a74:	00008067          	ret
    80003a78:	07300713          	li	a4,115
    80003a7c:	1ce78a63          	beq	a5,a4,80003c50 <__printf+0x4b8>
    80003a80:	07800713          	li	a4,120
    80003a84:	1ee79e63          	bne	a5,a4,80003c80 <__printf+0x4e8>
    80003a88:	f7843783          	ld	a5,-136(s0)
    80003a8c:	0007a703          	lw	a4,0(a5)
    80003a90:	00878793          	addi	a5,a5,8
    80003a94:	f6f43c23          	sd	a5,-136(s0)
    80003a98:	28074263          	bltz	a4,80003d1c <__printf+0x584>
    80003a9c:	00001d97          	auipc	s11,0x1
    80003aa0:	7acd8d93          	addi	s11,s11,1964 # 80005248 <digits>
    80003aa4:	00f77793          	andi	a5,a4,15
    80003aa8:	00fd87b3          	add	a5,s11,a5
    80003aac:	0007c683          	lbu	a3,0(a5)
    80003ab0:	00f00613          	li	a2,15
    80003ab4:	0007079b          	sext.w	a5,a4
    80003ab8:	f8d40023          	sb	a3,-128(s0)
    80003abc:	0047559b          	srliw	a1,a4,0x4
    80003ac0:	0047569b          	srliw	a3,a4,0x4
    80003ac4:	00000c93          	li	s9,0
    80003ac8:	0ee65063          	bge	a2,a4,80003ba8 <__printf+0x410>
    80003acc:	00f6f693          	andi	a3,a3,15
    80003ad0:	00dd86b3          	add	a3,s11,a3
    80003ad4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80003ad8:	0087d79b          	srliw	a5,a5,0x8
    80003adc:	00100c93          	li	s9,1
    80003ae0:	f8d400a3          	sb	a3,-127(s0)
    80003ae4:	0cb67263          	bgeu	a2,a1,80003ba8 <__printf+0x410>
    80003ae8:	00f7f693          	andi	a3,a5,15
    80003aec:	00dd86b3          	add	a3,s11,a3
    80003af0:	0006c583          	lbu	a1,0(a3)
    80003af4:	00f00613          	li	a2,15
    80003af8:	0047d69b          	srliw	a3,a5,0x4
    80003afc:	f8b40123          	sb	a1,-126(s0)
    80003b00:	0047d593          	srli	a1,a5,0x4
    80003b04:	28f67e63          	bgeu	a2,a5,80003da0 <__printf+0x608>
    80003b08:	00f6f693          	andi	a3,a3,15
    80003b0c:	00dd86b3          	add	a3,s11,a3
    80003b10:	0006c503          	lbu	a0,0(a3)
    80003b14:	0087d813          	srli	a6,a5,0x8
    80003b18:	0087d69b          	srliw	a3,a5,0x8
    80003b1c:	f8a401a3          	sb	a0,-125(s0)
    80003b20:	28b67663          	bgeu	a2,a1,80003dac <__printf+0x614>
    80003b24:	00f6f693          	andi	a3,a3,15
    80003b28:	00dd86b3          	add	a3,s11,a3
    80003b2c:	0006c583          	lbu	a1,0(a3)
    80003b30:	00c7d513          	srli	a0,a5,0xc
    80003b34:	00c7d69b          	srliw	a3,a5,0xc
    80003b38:	f8b40223          	sb	a1,-124(s0)
    80003b3c:	29067a63          	bgeu	a2,a6,80003dd0 <__printf+0x638>
    80003b40:	00f6f693          	andi	a3,a3,15
    80003b44:	00dd86b3          	add	a3,s11,a3
    80003b48:	0006c583          	lbu	a1,0(a3)
    80003b4c:	0107d813          	srli	a6,a5,0x10
    80003b50:	0107d69b          	srliw	a3,a5,0x10
    80003b54:	f8b402a3          	sb	a1,-123(s0)
    80003b58:	28a67263          	bgeu	a2,a0,80003ddc <__printf+0x644>
    80003b5c:	00f6f693          	andi	a3,a3,15
    80003b60:	00dd86b3          	add	a3,s11,a3
    80003b64:	0006c683          	lbu	a3,0(a3)
    80003b68:	0147d79b          	srliw	a5,a5,0x14
    80003b6c:	f8d40323          	sb	a3,-122(s0)
    80003b70:	21067663          	bgeu	a2,a6,80003d7c <__printf+0x5e4>
    80003b74:	02079793          	slli	a5,a5,0x20
    80003b78:	0207d793          	srli	a5,a5,0x20
    80003b7c:	00fd8db3          	add	s11,s11,a5
    80003b80:	000dc683          	lbu	a3,0(s11)
    80003b84:	00800793          	li	a5,8
    80003b88:	00700c93          	li	s9,7
    80003b8c:	f8d403a3          	sb	a3,-121(s0)
    80003b90:	00075c63          	bgez	a4,80003ba8 <__printf+0x410>
    80003b94:	f9040713          	addi	a4,s0,-112
    80003b98:	00f70733          	add	a4,a4,a5
    80003b9c:	02d00693          	li	a3,45
    80003ba0:	fed70823          	sb	a3,-16(a4)
    80003ba4:	00078c93          	mv	s9,a5
    80003ba8:	f8040793          	addi	a5,s0,-128
    80003bac:	01978cb3          	add	s9,a5,s9
    80003bb0:	f7f40d13          	addi	s10,s0,-129
    80003bb4:	000cc503          	lbu	a0,0(s9)
    80003bb8:	fffc8c93          	addi	s9,s9,-1
    80003bbc:	00000097          	auipc	ra,0x0
    80003bc0:	9f8080e7          	jalr	-1544(ra) # 800035b4 <consputc>
    80003bc4:	ff9d18e3          	bne	s10,s9,80003bb4 <__printf+0x41c>
    80003bc8:	0100006f          	j	80003bd8 <__printf+0x440>
    80003bcc:	00000097          	auipc	ra,0x0
    80003bd0:	9e8080e7          	jalr	-1560(ra) # 800035b4 <consputc>
    80003bd4:	000c8493          	mv	s1,s9
    80003bd8:	00094503          	lbu	a0,0(s2)
    80003bdc:	c60510e3          	bnez	a0,8000383c <__printf+0xa4>
    80003be0:	e40c0ee3          	beqz	s8,80003a3c <__printf+0x2a4>
    80003be4:	00003517          	auipc	a0,0x3
    80003be8:	63c50513          	addi	a0,a0,1596 # 80007220 <pr>
    80003bec:	00001097          	auipc	ra,0x1
    80003bf0:	94c080e7          	jalr	-1716(ra) # 80004538 <release>
    80003bf4:	e49ff06f          	j	80003a3c <__printf+0x2a4>
    80003bf8:	f7843783          	ld	a5,-136(s0)
    80003bfc:	03000513          	li	a0,48
    80003c00:	01000d13          	li	s10,16
    80003c04:	00878713          	addi	a4,a5,8
    80003c08:	0007bc83          	ld	s9,0(a5)
    80003c0c:	f6e43c23          	sd	a4,-136(s0)
    80003c10:	00000097          	auipc	ra,0x0
    80003c14:	9a4080e7          	jalr	-1628(ra) # 800035b4 <consputc>
    80003c18:	07800513          	li	a0,120
    80003c1c:	00000097          	auipc	ra,0x0
    80003c20:	998080e7          	jalr	-1640(ra) # 800035b4 <consputc>
    80003c24:	00001d97          	auipc	s11,0x1
    80003c28:	624d8d93          	addi	s11,s11,1572 # 80005248 <digits>
    80003c2c:	03ccd793          	srli	a5,s9,0x3c
    80003c30:	00fd87b3          	add	a5,s11,a5
    80003c34:	0007c503          	lbu	a0,0(a5)
    80003c38:	fffd0d1b          	addiw	s10,s10,-1
    80003c3c:	004c9c93          	slli	s9,s9,0x4
    80003c40:	00000097          	auipc	ra,0x0
    80003c44:	974080e7          	jalr	-1676(ra) # 800035b4 <consputc>
    80003c48:	fe0d12e3          	bnez	s10,80003c2c <__printf+0x494>
    80003c4c:	f8dff06f          	j	80003bd8 <__printf+0x440>
    80003c50:	f7843783          	ld	a5,-136(s0)
    80003c54:	0007bc83          	ld	s9,0(a5)
    80003c58:	00878793          	addi	a5,a5,8
    80003c5c:	f6f43c23          	sd	a5,-136(s0)
    80003c60:	000c9a63          	bnez	s9,80003c74 <__printf+0x4dc>
    80003c64:	1080006f          	j	80003d6c <__printf+0x5d4>
    80003c68:	001c8c93          	addi	s9,s9,1
    80003c6c:	00000097          	auipc	ra,0x0
    80003c70:	948080e7          	jalr	-1720(ra) # 800035b4 <consputc>
    80003c74:	000cc503          	lbu	a0,0(s9)
    80003c78:	fe0518e3          	bnez	a0,80003c68 <__printf+0x4d0>
    80003c7c:	f5dff06f          	j	80003bd8 <__printf+0x440>
    80003c80:	02500513          	li	a0,37
    80003c84:	00000097          	auipc	ra,0x0
    80003c88:	930080e7          	jalr	-1744(ra) # 800035b4 <consputc>
    80003c8c:	000c8513          	mv	a0,s9
    80003c90:	00000097          	auipc	ra,0x0
    80003c94:	924080e7          	jalr	-1756(ra) # 800035b4 <consputc>
    80003c98:	f41ff06f          	j	80003bd8 <__printf+0x440>
    80003c9c:	02500513          	li	a0,37
    80003ca0:	00000097          	auipc	ra,0x0
    80003ca4:	914080e7          	jalr	-1772(ra) # 800035b4 <consputc>
    80003ca8:	f31ff06f          	j	80003bd8 <__printf+0x440>
    80003cac:	00030513          	mv	a0,t1
    80003cb0:	00000097          	auipc	ra,0x0
    80003cb4:	7bc080e7          	jalr	1980(ra) # 8000446c <acquire>
    80003cb8:	b4dff06f          	j	80003804 <__printf+0x6c>
    80003cbc:	40c0053b          	negw	a0,a2
    80003cc0:	00a00713          	li	a4,10
    80003cc4:	02e576bb          	remuw	a3,a0,a4
    80003cc8:	00001d97          	auipc	s11,0x1
    80003ccc:	580d8d93          	addi	s11,s11,1408 # 80005248 <digits>
    80003cd0:	ff700593          	li	a1,-9
    80003cd4:	02069693          	slli	a3,a3,0x20
    80003cd8:	0206d693          	srli	a3,a3,0x20
    80003cdc:	00dd86b3          	add	a3,s11,a3
    80003ce0:	0006c683          	lbu	a3,0(a3)
    80003ce4:	02e557bb          	divuw	a5,a0,a4
    80003ce8:	f8d40023          	sb	a3,-128(s0)
    80003cec:	10b65e63          	bge	a2,a1,80003e08 <__printf+0x670>
    80003cf0:	06300593          	li	a1,99
    80003cf4:	02e7f6bb          	remuw	a3,a5,a4
    80003cf8:	02069693          	slli	a3,a3,0x20
    80003cfc:	0206d693          	srli	a3,a3,0x20
    80003d00:	00dd86b3          	add	a3,s11,a3
    80003d04:	0006c683          	lbu	a3,0(a3)
    80003d08:	02e7d73b          	divuw	a4,a5,a4
    80003d0c:	00200793          	li	a5,2
    80003d10:	f8d400a3          	sb	a3,-127(s0)
    80003d14:	bca5ece3          	bltu	a1,a0,800038ec <__printf+0x154>
    80003d18:	ce5ff06f          	j	800039fc <__printf+0x264>
    80003d1c:	40e007bb          	negw	a5,a4
    80003d20:	00001d97          	auipc	s11,0x1
    80003d24:	528d8d93          	addi	s11,s11,1320 # 80005248 <digits>
    80003d28:	00f7f693          	andi	a3,a5,15
    80003d2c:	00dd86b3          	add	a3,s11,a3
    80003d30:	0006c583          	lbu	a1,0(a3)
    80003d34:	ff100613          	li	a2,-15
    80003d38:	0047d69b          	srliw	a3,a5,0x4
    80003d3c:	f8b40023          	sb	a1,-128(s0)
    80003d40:	0047d59b          	srliw	a1,a5,0x4
    80003d44:	0ac75e63          	bge	a4,a2,80003e00 <__printf+0x668>
    80003d48:	00f6f693          	andi	a3,a3,15
    80003d4c:	00dd86b3          	add	a3,s11,a3
    80003d50:	0006c603          	lbu	a2,0(a3)
    80003d54:	00f00693          	li	a3,15
    80003d58:	0087d79b          	srliw	a5,a5,0x8
    80003d5c:	f8c400a3          	sb	a2,-127(s0)
    80003d60:	d8b6e4e3          	bltu	a3,a1,80003ae8 <__printf+0x350>
    80003d64:	00200793          	li	a5,2
    80003d68:	e2dff06f          	j	80003b94 <__printf+0x3fc>
    80003d6c:	00001c97          	auipc	s9,0x1
    80003d70:	4bcc8c93          	addi	s9,s9,1212 # 80005228 <_ZZ12printIntegermE6digits+0x148>
    80003d74:	02800513          	li	a0,40
    80003d78:	ef1ff06f          	j	80003c68 <__printf+0x4d0>
    80003d7c:	00700793          	li	a5,7
    80003d80:	00600c93          	li	s9,6
    80003d84:	e0dff06f          	j	80003b90 <__printf+0x3f8>
    80003d88:	00700793          	li	a5,7
    80003d8c:	00600c93          	li	s9,6
    80003d90:	c69ff06f          	j	800039f8 <__printf+0x260>
    80003d94:	00300793          	li	a5,3
    80003d98:	00200c93          	li	s9,2
    80003d9c:	c5dff06f          	j	800039f8 <__printf+0x260>
    80003da0:	00300793          	li	a5,3
    80003da4:	00200c93          	li	s9,2
    80003da8:	de9ff06f          	j	80003b90 <__printf+0x3f8>
    80003dac:	00400793          	li	a5,4
    80003db0:	00300c93          	li	s9,3
    80003db4:	dddff06f          	j	80003b90 <__printf+0x3f8>
    80003db8:	00400793          	li	a5,4
    80003dbc:	00300c93          	li	s9,3
    80003dc0:	c39ff06f          	j	800039f8 <__printf+0x260>
    80003dc4:	00500793          	li	a5,5
    80003dc8:	00400c93          	li	s9,4
    80003dcc:	c2dff06f          	j	800039f8 <__printf+0x260>
    80003dd0:	00500793          	li	a5,5
    80003dd4:	00400c93          	li	s9,4
    80003dd8:	db9ff06f          	j	80003b90 <__printf+0x3f8>
    80003ddc:	00600793          	li	a5,6
    80003de0:	00500c93          	li	s9,5
    80003de4:	dadff06f          	j	80003b90 <__printf+0x3f8>
    80003de8:	00600793          	li	a5,6
    80003dec:	00500c93          	li	s9,5
    80003df0:	c09ff06f          	j	800039f8 <__printf+0x260>
    80003df4:	00800793          	li	a5,8
    80003df8:	00700c93          	li	s9,7
    80003dfc:	bfdff06f          	j	800039f8 <__printf+0x260>
    80003e00:	00100793          	li	a5,1
    80003e04:	d91ff06f          	j	80003b94 <__printf+0x3fc>
    80003e08:	00100793          	li	a5,1
    80003e0c:	bf1ff06f          	j	800039fc <__printf+0x264>
    80003e10:	00900793          	li	a5,9
    80003e14:	00800c93          	li	s9,8
    80003e18:	be1ff06f          	j	800039f8 <__printf+0x260>
    80003e1c:	00001517          	auipc	a0,0x1
    80003e20:	41450513          	addi	a0,a0,1044 # 80005230 <_ZZ12printIntegermE6digits+0x150>
    80003e24:	00000097          	auipc	ra,0x0
    80003e28:	918080e7          	jalr	-1768(ra) # 8000373c <panic>

0000000080003e2c <printfinit>:
    80003e2c:	fe010113          	addi	sp,sp,-32
    80003e30:	00813823          	sd	s0,16(sp)
    80003e34:	00913423          	sd	s1,8(sp)
    80003e38:	00113c23          	sd	ra,24(sp)
    80003e3c:	02010413          	addi	s0,sp,32
    80003e40:	00003497          	auipc	s1,0x3
    80003e44:	3e048493          	addi	s1,s1,992 # 80007220 <pr>
    80003e48:	00048513          	mv	a0,s1
    80003e4c:	00001597          	auipc	a1,0x1
    80003e50:	3f458593          	addi	a1,a1,1012 # 80005240 <_ZZ12printIntegermE6digits+0x160>
    80003e54:	00000097          	auipc	ra,0x0
    80003e58:	5f4080e7          	jalr	1524(ra) # 80004448 <initlock>
    80003e5c:	01813083          	ld	ra,24(sp)
    80003e60:	01013403          	ld	s0,16(sp)
    80003e64:	0004ac23          	sw	zero,24(s1)
    80003e68:	00813483          	ld	s1,8(sp)
    80003e6c:	02010113          	addi	sp,sp,32
    80003e70:	00008067          	ret

0000000080003e74 <uartinit>:
    80003e74:	ff010113          	addi	sp,sp,-16
    80003e78:	00813423          	sd	s0,8(sp)
    80003e7c:	01010413          	addi	s0,sp,16
    80003e80:	100007b7          	lui	a5,0x10000
    80003e84:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80003e88:	f8000713          	li	a4,-128
    80003e8c:	00e781a3          	sb	a4,3(a5)
    80003e90:	00300713          	li	a4,3
    80003e94:	00e78023          	sb	a4,0(a5)
    80003e98:	000780a3          	sb	zero,1(a5)
    80003e9c:	00e781a3          	sb	a4,3(a5)
    80003ea0:	00700693          	li	a3,7
    80003ea4:	00d78123          	sb	a3,2(a5)
    80003ea8:	00e780a3          	sb	a4,1(a5)
    80003eac:	00813403          	ld	s0,8(sp)
    80003eb0:	01010113          	addi	sp,sp,16
    80003eb4:	00008067          	ret

0000000080003eb8 <uartputc>:
    80003eb8:	00002797          	auipc	a5,0x2
    80003ebc:	ea07a783          	lw	a5,-352(a5) # 80005d58 <panicked>
    80003ec0:	00078463          	beqz	a5,80003ec8 <uartputc+0x10>
    80003ec4:	0000006f          	j	80003ec4 <uartputc+0xc>
    80003ec8:	fd010113          	addi	sp,sp,-48
    80003ecc:	02813023          	sd	s0,32(sp)
    80003ed0:	00913c23          	sd	s1,24(sp)
    80003ed4:	01213823          	sd	s2,16(sp)
    80003ed8:	01313423          	sd	s3,8(sp)
    80003edc:	02113423          	sd	ra,40(sp)
    80003ee0:	03010413          	addi	s0,sp,48
    80003ee4:	00002917          	auipc	s2,0x2
    80003ee8:	e7c90913          	addi	s2,s2,-388 # 80005d60 <uart_tx_r>
    80003eec:	00093783          	ld	a5,0(s2)
    80003ef0:	00002497          	auipc	s1,0x2
    80003ef4:	e7848493          	addi	s1,s1,-392 # 80005d68 <uart_tx_w>
    80003ef8:	0004b703          	ld	a4,0(s1)
    80003efc:	02078693          	addi	a3,a5,32
    80003f00:	00050993          	mv	s3,a0
    80003f04:	02e69c63          	bne	a3,a4,80003f3c <uartputc+0x84>
    80003f08:	00001097          	auipc	ra,0x1
    80003f0c:	834080e7          	jalr	-1996(ra) # 8000473c <push_on>
    80003f10:	00093783          	ld	a5,0(s2)
    80003f14:	0004b703          	ld	a4,0(s1)
    80003f18:	02078793          	addi	a5,a5,32
    80003f1c:	00e79463          	bne	a5,a4,80003f24 <uartputc+0x6c>
    80003f20:	0000006f          	j	80003f20 <uartputc+0x68>
    80003f24:	00001097          	auipc	ra,0x1
    80003f28:	88c080e7          	jalr	-1908(ra) # 800047b0 <pop_on>
    80003f2c:	00093783          	ld	a5,0(s2)
    80003f30:	0004b703          	ld	a4,0(s1)
    80003f34:	02078693          	addi	a3,a5,32
    80003f38:	fce688e3          	beq	a3,a4,80003f08 <uartputc+0x50>
    80003f3c:	01f77693          	andi	a3,a4,31
    80003f40:	00003597          	auipc	a1,0x3
    80003f44:	30058593          	addi	a1,a1,768 # 80007240 <uart_tx_buf>
    80003f48:	00d586b3          	add	a3,a1,a3
    80003f4c:	00170713          	addi	a4,a4,1
    80003f50:	01368023          	sb	s3,0(a3)
    80003f54:	00e4b023          	sd	a4,0(s1)
    80003f58:	10000637          	lui	a2,0x10000
    80003f5c:	02f71063          	bne	a4,a5,80003f7c <uartputc+0xc4>
    80003f60:	0340006f          	j	80003f94 <uartputc+0xdc>
    80003f64:	00074703          	lbu	a4,0(a4)
    80003f68:	00f93023          	sd	a5,0(s2)
    80003f6c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80003f70:	00093783          	ld	a5,0(s2)
    80003f74:	0004b703          	ld	a4,0(s1)
    80003f78:	00f70e63          	beq	a4,a5,80003f94 <uartputc+0xdc>
    80003f7c:	00564683          	lbu	a3,5(a2)
    80003f80:	01f7f713          	andi	a4,a5,31
    80003f84:	00e58733          	add	a4,a1,a4
    80003f88:	0206f693          	andi	a3,a3,32
    80003f8c:	00178793          	addi	a5,a5,1
    80003f90:	fc069ae3          	bnez	a3,80003f64 <uartputc+0xac>
    80003f94:	02813083          	ld	ra,40(sp)
    80003f98:	02013403          	ld	s0,32(sp)
    80003f9c:	01813483          	ld	s1,24(sp)
    80003fa0:	01013903          	ld	s2,16(sp)
    80003fa4:	00813983          	ld	s3,8(sp)
    80003fa8:	03010113          	addi	sp,sp,48
    80003fac:	00008067          	ret

0000000080003fb0 <uartputc_sync>:
    80003fb0:	ff010113          	addi	sp,sp,-16
    80003fb4:	00813423          	sd	s0,8(sp)
    80003fb8:	01010413          	addi	s0,sp,16
    80003fbc:	00002717          	auipc	a4,0x2
    80003fc0:	d9c72703          	lw	a4,-612(a4) # 80005d58 <panicked>
    80003fc4:	02071663          	bnez	a4,80003ff0 <uartputc_sync+0x40>
    80003fc8:	00050793          	mv	a5,a0
    80003fcc:	100006b7          	lui	a3,0x10000
    80003fd0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80003fd4:	02077713          	andi	a4,a4,32
    80003fd8:	fe070ce3          	beqz	a4,80003fd0 <uartputc_sync+0x20>
    80003fdc:	0ff7f793          	andi	a5,a5,255
    80003fe0:	00f68023          	sb	a5,0(a3)
    80003fe4:	00813403          	ld	s0,8(sp)
    80003fe8:	01010113          	addi	sp,sp,16
    80003fec:	00008067          	ret
    80003ff0:	0000006f          	j	80003ff0 <uartputc_sync+0x40>

0000000080003ff4 <uartstart>:
    80003ff4:	ff010113          	addi	sp,sp,-16
    80003ff8:	00813423          	sd	s0,8(sp)
    80003ffc:	01010413          	addi	s0,sp,16
    80004000:	00002617          	auipc	a2,0x2
    80004004:	d6060613          	addi	a2,a2,-672 # 80005d60 <uart_tx_r>
    80004008:	00002517          	auipc	a0,0x2
    8000400c:	d6050513          	addi	a0,a0,-672 # 80005d68 <uart_tx_w>
    80004010:	00063783          	ld	a5,0(a2)
    80004014:	00053703          	ld	a4,0(a0)
    80004018:	04f70263          	beq	a4,a5,8000405c <uartstart+0x68>
    8000401c:	100005b7          	lui	a1,0x10000
    80004020:	00003817          	auipc	a6,0x3
    80004024:	22080813          	addi	a6,a6,544 # 80007240 <uart_tx_buf>
    80004028:	01c0006f          	j	80004044 <uartstart+0x50>
    8000402c:	0006c703          	lbu	a4,0(a3)
    80004030:	00f63023          	sd	a5,0(a2)
    80004034:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80004038:	00063783          	ld	a5,0(a2)
    8000403c:	00053703          	ld	a4,0(a0)
    80004040:	00f70e63          	beq	a4,a5,8000405c <uartstart+0x68>
    80004044:	01f7f713          	andi	a4,a5,31
    80004048:	00e806b3          	add	a3,a6,a4
    8000404c:	0055c703          	lbu	a4,5(a1)
    80004050:	00178793          	addi	a5,a5,1
    80004054:	02077713          	andi	a4,a4,32
    80004058:	fc071ae3          	bnez	a4,8000402c <uartstart+0x38>
    8000405c:	00813403          	ld	s0,8(sp)
    80004060:	01010113          	addi	sp,sp,16
    80004064:	00008067          	ret

0000000080004068 <uartgetc>:
    80004068:	ff010113          	addi	sp,sp,-16
    8000406c:	00813423          	sd	s0,8(sp)
    80004070:	01010413          	addi	s0,sp,16
    80004074:	10000737          	lui	a4,0x10000
    80004078:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000407c:	0017f793          	andi	a5,a5,1
    80004080:	00078c63          	beqz	a5,80004098 <uartgetc+0x30>
    80004084:	00074503          	lbu	a0,0(a4)
    80004088:	0ff57513          	andi	a0,a0,255
    8000408c:	00813403          	ld	s0,8(sp)
    80004090:	01010113          	addi	sp,sp,16
    80004094:	00008067          	ret
    80004098:	fff00513          	li	a0,-1
    8000409c:	ff1ff06f          	j	8000408c <uartgetc+0x24>

00000000800040a0 <uartintr>:
    800040a0:	100007b7          	lui	a5,0x10000
    800040a4:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    800040a8:	0017f793          	andi	a5,a5,1
    800040ac:	0a078463          	beqz	a5,80004154 <uartintr+0xb4>
    800040b0:	fe010113          	addi	sp,sp,-32
    800040b4:	00813823          	sd	s0,16(sp)
    800040b8:	00913423          	sd	s1,8(sp)
    800040bc:	00113c23          	sd	ra,24(sp)
    800040c0:	02010413          	addi	s0,sp,32
    800040c4:	100004b7          	lui	s1,0x10000
    800040c8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    800040cc:	0ff57513          	andi	a0,a0,255
    800040d0:	fffff097          	auipc	ra,0xfffff
    800040d4:	534080e7          	jalr	1332(ra) # 80003604 <consoleintr>
    800040d8:	0054c783          	lbu	a5,5(s1)
    800040dc:	0017f793          	andi	a5,a5,1
    800040e0:	fe0794e3          	bnez	a5,800040c8 <uartintr+0x28>
    800040e4:	00002617          	auipc	a2,0x2
    800040e8:	c7c60613          	addi	a2,a2,-900 # 80005d60 <uart_tx_r>
    800040ec:	00002517          	auipc	a0,0x2
    800040f0:	c7c50513          	addi	a0,a0,-900 # 80005d68 <uart_tx_w>
    800040f4:	00063783          	ld	a5,0(a2)
    800040f8:	00053703          	ld	a4,0(a0)
    800040fc:	04f70263          	beq	a4,a5,80004140 <uartintr+0xa0>
    80004100:	100005b7          	lui	a1,0x10000
    80004104:	00003817          	auipc	a6,0x3
    80004108:	13c80813          	addi	a6,a6,316 # 80007240 <uart_tx_buf>
    8000410c:	01c0006f          	j	80004128 <uartintr+0x88>
    80004110:	0006c703          	lbu	a4,0(a3)
    80004114:	00f63023          	sd	a5,0(a2)
    80004118:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000411c:	00063783          	ld	a5,0(a2)
    80004120:	00053703          	ld	a4,0(a0)
    80004124:	00f70e63          	beq	a4,a5,80004140 <uartintr+0xa0>
    80004128:	01f7f713          	andi	a4,a5,31
    8000412c:	00e806b3          	add	a3,a6,a4
    80004130:	0055c703          	lbu	a4,5(a1)
    80004134:	00178793          	addi	a5,a5,1
    80004138:	02077713          	andi	a4,a4,32
    8000413c:	fc071ae3          	bnez	a4,80004110 <uartintr+0x70>
    80004140:	01813083          	ld	ra,24(sp)
    80004144:	01013403          	ld	s0,16(sp)
    80004148:	00813483          	ld	s1,8(sp)
    8000414c:	02010113          	addi	sp,sp,32
    80004150:	00008067          	ret
    80004154:	00002617          	auipc	a2,0x2
    80004158:	c0c60613          	addi	a2,a2,-1012 # 80005d60 <uart_tx_r>
    8000415c:	00002517          	auipc	a0,0x2
    80004160:	c0c50513          	addi	a0,a0,-1012 # 80005d68 <uart_tx_w>
    80004164:	00063783          	ld	a5,0(a2)
    80004168:	00053703          	ld	a4,0(a0)
    8000416c:	04f70263          	beq	a4,a5,800041b0 <uartintr+0x110>
    80004170:	100005b7          	lui	a1,0x10000
    80004174:	00003817          	auipc	a6,0x3
    80004178:	0cc80813          	addi	a6,a6,204 # 80007240 <uart_tx_buf>
    8000417c:	01c0006f          	j	80004198 <uartintr+0xf8>
    80004180:	0006c703          	lbu	a4,0(a3)
    80004184:	00f63023          	sd	a5,0(a2)
    80004188:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000418c:	00063783          	ld	a5,0(a2)
    80004190:	00053703          	ld	a4,0(a0)
    80004194:	02f70063          	beq	a4,a5,800041b4 <uartintr+0x114>
    80004198:	01f7f713          	andi	a4,a5,31
    8000419c:	00e806b3          	add	a3,a6,a4
    800041a0:	0055c703          	lbu	a4,5(a1)
    800041a4:	00178793          	addi	a5,a5,1
    800041a8:	02077713          	andi	a4,a4,32
    800041ac:	fc071ae3          	bnez	a4,80004180 <uartintr+0xe0>
    800041b0:	00008067          	ret
    800041b4:	00008067          	ret

00000000800041b8 <kinit>:
    800041b8:	fc010113          	addi	sp,sp,-64
    800041bc:	02913423          	sd	s1,40(sp)
    800041c0:	fffff7b7          	lui	a5,0xfffff
    800041c4:	00004497          	auipc	s1,0x4
    800041c8:	0ab48493          	addi	s1,s1,171 # 8000826f <end+0xfff>
    800041cc:	02813823          	sd	s0,48(sp)
    800041d0:	01313c23          	sd	s3,24(sp)
    800041d4:	00f4f4b3          	and	s1,s1,a5
    800041d8:	02113c23          	sd	ra,56(sp)
    800041dc:	03213023          	sd	s2,32(sp)
    800041e0:	01413823          	sd	s4,16(sp)
    800041e4:	01513423          	sd	s5,8(sp)
    800041e8:	04010413          	addi	s0,sp,64
    800041ec:	000017b7          	lui	a5,0x1
    800041f0:	01100993          	li	s3,17
    800041f4:	00f487b3          	add	a5,s1,a5
    800041f8:	01b99993          	slli	s3,s3,0x1b
    800041fc:	06f9e063          	bltu	s3,a5,8000425c <kinit+0xa4>
    80004200:	00003a97          	auipc	s5,0x3
    80004204:	070a8a93          	addi	s5,s5,112 # 80007270 <end>
    80004208:	0754ec63          	bltu	s1,s5,80004280 <kinit+0xc8>
    8000420c:	0734fa63          	bgeu	s1,s3,80004280 <kinit+0xc8>
    80004210:	00088a37          	lui	s4,0x88
    80004214:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80004218:	00002917          	auipc	s2,0x2
    8000421c:	b5890913          	addi	s2,s2,-1192 # 80005d70 <kmem>
    80004220:	00ca1a13          	slli	s4,s4,0xc
    80004224:	0140006f          	j	80004238 <kinit+0x80>
    80004228:	000017b7          	lui	a5,0x1
    8000422c:	00f484b3          	add	s1,s1,a5
    80004230:	0554e863          	bltu	s1,s5,80004280 <kinit+0xc8>
    80004234:	0534f663          	bgeu	s1,s3,80004280 <kinit+0xc8>
    80004238:	00001637          	lui	a2,0x1
    8000423c:	00100593          	li	a1,1
    80004240:	00048513          	mv	a0,s1
    80004244:	00000097          	auipc	ra,0x0
    80004248:	5e4080e7          	jalr	1508(ra) # 80004828 <__memset>
    8000424c:	00093783          	ld	a5,0(s2)
    80004250:	00f4b023          	sd	a5,0(s1)
    80004254:	00993023          	sd	s1,0(s2)
    80004258:	fd4498e3          	bne	s1,s4,80004228 <kinit+0x70>
    8000425c:	03813083          	ld	ra,56(sp)
    80004260:	03013403          	ld	s0,48(sp)
    80004264:	02813483          	ld	s1,40(sp)
    80004268:	02013903          	ld	s2,32(sp)
    8000426c:	01813983          	ld	s3,24(sp)
    80004270:	01013a03          	ld	s4,16(sp)
    80004274:	00813a83          	ld	s5,8(sp)
    80004278:	04010113          	addi	sp,sp,64
    8000427c:	00008067          	ret
    80004280:	00001517          	auipc	a0,0x1
    80004284:	fe050513          	addi	a0,a0,-32 # 80005260 <digits+0x18>
    80004288:	fffff097          	auipc	ra,0xfffff
    8000428c:	4b4080e7          	jalr	1204(ra) # 8000373c <panic>

0000000080004290 <freerange>:
    80004290:	fc010113          	addi	sp,sp,-64
    80004294:	000017b7          	lui	a5,0x1
    80004298:	02913423          	sd	s1,40(sp)
    8000429c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    800042a0:	009504b3          	add	s1,a0,s1
    800042a4:	fffff537          	lui	a0,0xfffff
    800042a8:	02813823          	sd	s0,48(sp)
    800042ac:	02113c23          	sd	ra,56(sp)
    800042b0:	03213023          	sd	s2,32(sp)
    800042b4:	01313c23          	sd	s3,24(sp)
    800042b8:	01413823          	sd	s4,16(sp)
    800042bc:	01513423          	sd	s5,8(sp)
    800042c0:	01613023          	sd	s6,0(sp)
    800042c4:	04010413          	addi	s0,sp,64
    800042c8:	00a4f4b3          	and	s1,s1,a0
    800042cc:	00f487b3          	add	a5,s1,a5
    800042d0:	06f5e463          	bltu	a1,a5,80004338 <freerange+0xa8>
    800042d4:	00003a97          	auipc	s5,0x3
    800042d8:	f9ca8a93          	addi	s5,s5,-100 # 80007270 <end>
    800042dc:	0954e263          	bltu	s1,s5,80004360 <freerange+0xd0>
    800042e0:	01100993          	li	s3,17
    800042e4:	01b99993          	slli	s3,s3,0x1b
    800042e8:	0734fc63          	bgeu	s1,s3,80004360 <freerange+0xd0>
    800042ec:	00058a13          	mv	s4,a1
    800042f0:	00002917          	auipc	s2,0x2
    800042f4:	a8090913          	addi	s2,s2,-1408 # 80005d70 <kmem>
    800042f8:	00002b37          	lui	s6,0x2
    800042fc:	0140006f          	j	80004310 <freerange+0x80>
    80004300:	000017b7          	lui	a5,0x1
    80004304:	00f484b3          	add	s1,s1,a5
    80004308:	0554ec63          	bltu	s1,s5,80004360 <freerange+0xd0>
    8000430c:	0534fa63          	bgeu	s1,s3,80004360 <freerange+0xd0>
    80004310:	00001637          	lui	a2,0x1
    80004314:	00100593          	li	a1,1
    80004318:	00048513          	mv	a0,s1
    8000431c:	00000097          	auipc	ra,0x0
    80004320:	50c080e7          	jalr	1292(ra) # 80004828 <__memset>
    80004324:	00093703          	ld	a4,0(s2)
    80004328:	016487b3          	add	a5,s1,s6
    8000432c:	00e4b023          	sd	a4,0(s1)
    80004330:	00993023          	sd	s1,0(s2)
    80004334:	fcfa76e3          	bgeu	s4,a5,80004300 <freerange+0x70>
    80004338:	03813083          	ld	ra,56(sp)
    8000433c:	03013403          	ld	s0,48(sp)
    80004340:	02813483          	ld	s1,40(sp)
    80004344:	02013903          	ld	s2,32(sp)
    80004348:	01813983          	ld	s3,24(sp)
    8000434c:	01013a03          	ld	s4,16(sp)
    80004350:	00813a83          	ld	s5,8(sp)
    80004354:	00013b03          	ld	s6,0(sp)
    80004358:	04010113          	addi	sp,sp,64
    8000435c:	00008067          	ret
    80004360:	00001517          	auipc	a0,0x1
    80004364:	f0050513          	addi	a0,a0,-256 # 80005260 <digits+0x18>
    80004368:	fffff097          	auipc	ra,0xfffff
    8000436c:	3d4080e7          	jalr	980(ra) # 8000373c <panic>

0000000080004370 <kfree>:
    80004370:	fe010113          	addi	sp,sp,-32
    80004374:	00813823          	sd	s0,16(sp)
    80004378:	00113c23          	sd	ra,24(sp)
    8000437c:	00913423          	sd	s1,8(sp)
    80004380:	02010413          	addi	s0,sp,32
    80004384:	03451793          	slli	a5,a0,0x34
    80004388:	04079c63          	bnez	a5,800043e0 <kfree+0x70>
    8000438c:	00003797          	auipc	a5,0x3
    80004390:	ee478793          	addi	a5,a5,-284 # 80007270 <end>
    80004394:	00050493          	mv	s1,a0
    80004398:	04f56463          	bltu	a0,a5,800043e0 <kfree+0x70>
    8000439c:	01100793          	li	a5,17
    800043a0:	01b79793          	slli	a5,a5,0x1b
    800043a4:	02f57e63          	bgeu	a0,a5,800043e0 <kfree+0x70>
    800043a8:	00001637          	lui	a2,0x1
    800043ac:	00100593          	li	a1,1
    800043b0:	00000097          	auipc	ra,0x0
    800043b4:	478080e7          	jalr	1144(ra) # 80004828 <__memset>
    800043b8:	00002797          	auipc	a5,0x2
    800043bc:	9b878793          	addi	a5,a5,-1608 # 80005d70 <kmem>
    800043c0:	0007b703          	ld	a4,0(a5)
    800043c4:	01813083          	ld	ra,24(sp)
    800043c8:	01013403          	ld	s0,16(sp)
    800043cc:	00e4b023          	sd	a4,0(s1)
    800043d0:	0097b023          	sd	s1,0(a5)
    800043d4:	00813483          	ld	s1,8(sp)
    800043d8:	02010113          	addi	sp,sp,32
    800043dc:	00008067          	ret
    800043e0:	00001517          	auipc	a0,0x1
    800043e4:	e8050513          	addi	a0,a0,-384 # 80005260 <digits+0x18>
    800043e8:	fffff097          	auipc	ra,0xfffff
    800043ec:	354080e7          	jalr	852(ra) # 8000373c <panic>

00000000800043f0 <kalloc>:
    800043f0:	fe010113          	addi	sp,sp,-32
    800043f4:	00813823          	sd	s0,16(sp)
    800043f8:	00913423          	sd	s1,8(sp)
    800043fc:	00113c23          	sd	ra,24(sp)
    80004400:	02010413          	addi	s0,sp,32
    80004404:	00002797          	auipc	a5,0x2
    80004408:	96c78793          	addi	a5,a5,-1684 # 80005d70 <kmem>
    8000440c:	0007b483          	ld	s1,0(a5)
    80004410:	02048063          	beqz	s1,80004430 <kalloc+0x40>
    80004414:	0004b703          	ld	a4,0(s1)
    80004418:	00001637          	lui	a2,0x1
    8000441c:	00500593          	li	a1,5
    80004420:	00048513          	mv	a0,s1
    80004424:	00e7b023          	sd	a4,0(a5)
    80004428:	00000097          	auipc	ra,0x0
    8000442c:	400080e7          	jalr	1024(ra) # 80004828 <__memset>
    80004430:	01813083          	ld	ra,24(sp)
    80004434:	01013403          	ld	s0,16(sp)
    80004438:	00048513          	mv	a0,s1
    8000443c:	00813483          	ld	s1,8(sp)
    80004440:	02010113          	addi	sp,sp,32
    80004444:	00008067          	ret

0000000080004448 <initlock>:
    80004448:	ff010113          	addi	sp,sp,-16
    8000444c:	00813423          	sd	s0,8(sp)
    80004450:	01010413          	addi	s0,sp,16
    80004454:	00813403          	ld	s0,8(sp)
    80004458:	00b53423          	sd	a1,8(a0)
    8000445c:	00052023          	sw	zero,0(a0)
    80004460:	00053823          	sd	zero,16(a0)
    80004464:	01010113          	addi	sp,sp,16
    80004468:	00008067          	ret

000000008000446c <acquire>:
    8000446c:	fe010113          	addi	sp,sp,-32
    80004470:	00813823          	sd	s0,16(sp)
    80004474:	00913423          	sd	s1,8(sp)
    80004478:	00113c23          	sd	ra,24(sp)
    8000447c:	01213023          	sd	s2,0(sp)
    80004480:	02010413          	addi	s0,sp,32
    80004484:	00050493          	mv	s1,a0
    80004488:	10002973          	csrr	s2,sstatus
    8000448c:	100027f3          	csrr	a5,sstatus
    80004490:	ffd7f793          	andi	a5,a5,-3
    80004494:	10079073          	csrw	sstatus,a5
    80004498:	fffff097          	auipc	ra,0xfffff
    8000449c:	8ec080e7          	jalr	-1812(ra) # 80002d84 <mycpu>
    800044a0:	07852783          	lw	a5,120(a0)
    800044a4:	06078e63          	beqz	a5,80004520 <acquire+0xb4>
    800044a8:	fffff097          	auipc	ra,0xfffff
    800044ac:	8dc080e7          	jalr	-1828(ra) # 80002d84 <mycpu>
    800044b0:	07852783          	lw	a5,120(a0)
    800044b4:	0004a703          	lw	a4,0(s1)
    800044b8:	0017879b          	addiw	a5,a5,1
    800044bc:	06f52c23          	sw	a5,120(a0)
    800044c0:	04071063          	bnez	a4,80004500 <acquire+0x94>
    800044c4:	00100713          	li	a4,1
    800044c8:	00070793          	mv	a5,a4
    800044cc:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    800044d0:	0007879b          	sext.w	a5,a5
    800044d4:	fe079ae3          	bnez	a5,800044c8 <acquire+0x5c>
    800044d8:	0ff0000f          	fence
    800044dc:	fffff097          	auipc	ra,0xfffff
    800044e0:	8a8080e7          	jalr	-1880(ra) # 80002d84 <mycpu>
    800044e4:	01813083          	ld	ra,24(sp)
    800044e8:	01013403          	ld	s0,16(sp)
    800044ec:	00a4b823          	sd	a0,16(s1)
    800044f0:	00013903          	ld	s2,0(sp)
    800044f4:	00813483          	ld	s1,8(sp)
    800044f8:	02010113          	addi	sp,sp,32
    800044fc:	00008067          	ret
    80004500:	0104b903          	ld	s2,16(s1)
    80004504:	fffff097          	auipc	ra,0xfffff
    80004508:	880080e7          	jalr	-1920(ra) # 80002d84 <mycpu>
    8000450c:	faa91ce3          	bne	s2,a0,800044c4 <acquire+0x58>
    80004510:	00001517          	auipc	a0,0x1
    80004514:	d5850513          	addi	a0,a0,-680 # 80005268 <digits+0x20>
    80004518:	fffff097          	auipc	ra,0xfffff
    8000451c:	224080e7          	jalr	548(ra) # 8000373c <panic>
    80004520:	00195913          	srli	s2,s2,0x1
    80004524:	fffff097          	auipc	ra,0xfffff
    80004528:	860080e7          	jalr	-1952(ra) # 80002d84 <mycpu>
    8000452c:	00197913          	andi	s2,s2,1
    80004530:	07252e23          	sw	s2,124(a0)
    80004534:	f75ff06f          	j	800044a8 <acquire+0x3c>

0000000080004538 <release>:
    80004538:	fe010113          	addi	sp,sp,-32
    8000453c:	00813823          	sd	s0,16(sp)
    80004540:	00113c23          	sd	ra,24(sp)
    80004544:	00913423          	sd	s1,8(sp)
    80004548:	01213023          	sd	s2,0(sp)
    8000454c:	02010413          	addi	s0,sp,32
    80004550:	00052783          	lw	a5,0(a0)
    80004554:	00079a63          	bnez	a5,80004568 <release+0x30>
    80004558:	00001517          	auipc	a0,0x1
    8000455c:	d1850513          	addi	a0,a0,-744 # 80005270 <digits+0x28>
    80004560:	fffff097          	auipc	ra,0xfffff
    80004564:	1dc080e7          	jalr	476(ra) # 8000373c <panic>
    80004568:	01053903          	ld	s2,16(a0)
    8000456c:	00050493          	mv	s1,a0
    80004570:	fffff097          	auipc	ra,0xfffff
    80004574:	814080e7          	jalr	-2028(ra) # 80002d84 <mycpu>
    80004578:	fea910e3          	bne	s2,a0,80004558 <release+0x20>
    8000457c:	0004b823          	sd	zero,16(s1)
    80004580:	0ff0000f          	fence
    80004584:	0f50000f          	fence	iorw,ow
    80004588:	0804a02f          	amoswap.w	zero,zero,(s1)
    8000458c:	ffffe097          	auipc	ra,0xffffe
    80004590:	7f8080e7          	jalr	2040(ra) # 80002d84 <mycpu>
    80004594:	100027f3          	csrr	a5,sstatus
    80004598:	0027f793          	andi	a5,a5,2
    8000459c:	04079a63          	bnez	a5,800045f0 <release+0xb8>
    800045a0:	07852783          	lw	a5,120(a0)
    800045a4:	02f05e63          	blez	a5,800045e0 <release+0xa8>
    800045a8:	fff7871b          	addiw	a4,a5,-1
    800045ac:	06e52c23          	sw	a4,120(a0)
    800045b0:	00071c63          	bnez	a4,800045c8 <release+0x90>
    800045b4:	07c52783          	lw	a5,124(a0)
    800045b8:	00078863          	beqz	a5,800045c8 <release+0x90>
    800045bc:	100027f3          	csrr	a5,sstatus
    800045c0:	0027e793          	ori	a5,a5,2
    800045c4:	10079073          	csrw	sstatus,a5
    800045c8:	01813083          	ld	ra,24(sp)
    800045cc:	01013403          	ld	s0,16(sp)
    800045d0:	00813483          	ld	s1,8(sp)
    800045d4:	00013903          	ld	s2,0(sp)
    800045d8:	02010113          	addi	sp,sp,32
    800045dc:	00008067          	ret
    800045e0:	00001517          	auipc	a0,0x1
    800045e4:	cb050513          	addi	a0,a0,-848 # 80005290 <digits+0x48>
    800045e8:	fffff097          	auipc	ra,0xfffff
    800045ec:	154080e7          	jalr	340(ra) # 8000373c <panic>
    800045f0:	00001517          	auipc	a0,0x1
    800045f4:	c8850513          	addi	a0,a0,-888 # 80005278 <digits+0x30>
    800045f8:	fffff097          	auipc	ra,0xfffff
    800045fc:	144080e7          	jalr	324(ra) # 8000373c <panic>

0000000080004600 <holding>:
    80004600:	00052783          	lw	a5,0(a0)
    80004604:	00079663          	bnez	a5,80004610 <holding+0x10>
    80004608:	00000513          	li	a0,0
    8000460c:	00008067          	ret
    80004610:	fe010113          	addi	sp,sp,-32
    80004614:	00813823          	sd	s0,16(sp)
    80004618:	00913423          	sd	s1,8(sp)
    8000461c:	00113c23          	sd	ra,24(sp)
    80004620:	02010413          	addi	s0,sp,32
    80004624:	01053483          	ld	s1,16(a0)
    80004628:	ffffe097          	auipc	ra,0xffffe
    8000462c:	75c080e7          	jalr	1884(ra) # 80002d84 <mycpu>
    80004630:	01813083          	ld	ra,24(sp)
    80004634:	01013403          	ld	s0,16(sp)
    80004638:	40a48533          	sub	a0,s1,a0
    8000463c:	00153513          	seqz	a0,a0
    80004640:	00813483          	ld	s1,8(sp)
    80004644:	02010113          	addi	sp,sp,32
    80004648:	00008067          	ret

000000008000464c <push_off>:
    8000464c:	fe010113          	addi	sp,sp,-32
    80004650:	00813823          	sd	s0,16(sp)
    80004654:	00113c23          	sd	ra,24(sp)
    80004658:	00913423          	sd	s1,8(sp)
    8000465c:	02010413          	addi	s0,sp,32
    80004660:	100024f3          	csrr	s1,sstatus
    80004664:	100027f3          	csrr	a5,sstatus
    80004668:	ffd7f793          	andi	a5,a5,-3
    8000466c:	10079073          	csrw	sstatus,a5
    80004670:	ffffe097          	auipc	ra,0xffffe
    80004674:	714080e7          	jalr	1812(ra) # 80002d84 <mycpu>
    80004678:	07852783          	lw	a5,120(a0)
    8000467c:	02078663          	beqz	a5,800046a8 <push_off+0x5c>
    80004680:	ffffe097          	auipc	ra,0xffffe
    80004684:	704080e7          	jalr	1796(ra) # 80002d84 <mycpu>
    80004688:	07852783          	lw	a5,120(a0)
    8000468c:	01813083          	ld	ra,24(sp)
    80004690:	01013403          	ld	s0,16(sp)
    80004694:	0017879b          	addiw	a5,a5,1
    80004698:	06f52c23          	sw	a5,120(a0)
    8000469c:	00813483          	ld	s1,8(sp)
    800046a0:	02010113          	addi	sp,sp,32
    800046a4:	00008067          	ret
    800046a8:	0014d493          	srli	s1,s1,0x1
    800046ac:	ffffe097          	auipc	ra,0xffffe
    800046b0:	6d8080e7          	jalr	1752(ra) # 80002d84 <mycpu>
    800046b4:	0014f493          	andi	s1,s1,1
    800046b8:	06952e23          	sw	s1,124(a0)
    800046bc:	fc5ff06f          	j	80004680 <push_off+0x34>

00000000800046c0 <pop_off>:
    800046c0:	ff010113          	addi	sp,sp,-16
    800046c4:	00813023          	sd	s0,0(sp)
    800046c8:	00113423          	sd	ra,8(sp)
    800046cc:	01010413          	addi	s0,sp,16
    800046d0:	ffffe097          	auipc	ra,0xffffe
    800046d4:	6b4080e7          	jalr	1716(ra) # 80002d84 <mycpu>
    800046d8:	100027f3          	csrr	a5,sstatus
    800046dc:	0027f793          	andi	a5,a5,2
    800046e0:	04079663          	bnez	a5,8000472c <pop_off+0x6c>
    800046e4:	07852783          	lw	a5,120(a0)
    800046e8:	02f05a63          	blez	a5,8000471c <pop_off+0x5c>
    800046ec:	fff7871b          	addiw	a4,a5,-1
    800046f0:	06e52c23          	sw	a4,120(a0)
    800046f4:	00071c63          	bnez	a4,8000470c <pop_off+0x4c>
    800046f8:	07c52783          	lw	a5,124(a0)
    800046fc:	00078863          	beqz	a5,8000470c <pop_off+0x4c>
    80004700:	100027f3          	csrr	a5,sstatus
    80004704:	0027e793          	ori	a5,a5,2
    80004708:	10079073          	csrw	sstatus,a5
    8000470c:	00813083          	ld	ra,8(sp)
    80004710:	00013403          	ld	s0,0(sp)
    80004714:	01010113          	addi	sp,sp,16
    80004718:	00008067          	ret
    8000471c:	00001517          	auipc	a0,0x1
    80004720:	b7450513          	addi	a0,a0,-1164 # 80005290 <digits+0x48>
    80004724:	fffff097          	auipc	ra,0xfffff
    80004728:	018080e7          	jalr	24(ra) # 8000373c <panic>
    8000472c:	00001517          	auipc	a0,0x1
    80004730:	b4c50513          	addi	a0,a0,-1204 # 80005278 <digits+0x30>
    80004734:	fffff097          	auipc	ra,0xfffff
    80004738:	008080e7          	jalr	8(ra) # 8000373c <panic>

000000008000473c <push_on>:
    8000473c:	fe010113          	addi	sp,sp,-32
    80004740:	00813823          	sd	s0,16(sp)
    80004744:	00113c23          	sd	ra,24(sp)
    80004748:	00913423          	sd	s1,8(sp)
    8000474c:	02010413          	addi	s0,sp,32
    80004750:	100024f3          	csrr	s1,sstatus
    80004754:	100027f3          	csrr	a5,sstatus
    80004758:	0027e793          	ori	a5,a5,2
    8000475c:	10079073          	csrw	sstatus,a5
    80004760:	ffffe097          	auipc	ra,0xffffe
    80004764:	624080e7          	jalr	1572(ra) # 80002d84 <mycpu>
    80004768:	07852783          	lw	a5,120(a0)
    8000476c:	02078663          	beqz	a5,80004798 <push_on+0x5c>
    80004770:	ffffe097          	auipc	ra,0xffffe
    80004774:	614080e7          	jalr	1556(ra) # 80002d84 <mycpu>
    80004778:	07852783          	lw	a5,120(a0)
    8000477c:	01813083          	ld	ra,24(sp)
    80004780:	01013403          	ld	s0,16(sp)
    80004784:	0017879b          	addiw	a5,a5,1
    80004788:	06f52c23          	sw	a5,120(a0)
    8000478c:	00813483          	ld	s1,8(sp)
    80004790:	02010113          	addi	sp,sp,32
    80004794:	00008067          	ret
    80004798:	0014d493          	srli	s1,s1,0x1
    8000479c:	ffffe097          	auipc	ra,0xffffe
    800047a0:	5e8080e7          	jalr	1512(ra) # 80002d84 <mycpu>
    800047a4:	0014f493          	andi	s1,s1,1
    800047a8:	06952e23          	sw	s1,124(a0)
    800047ac:	fc5ff06f          	j	80004770 <push_on+0x34>

00000000800047b0 <pop_on>:
    800047b0:	ff010113          	addi	sp,sp,-16
    800047b4:	00813023          	sd	s0,0(sp)
    800047b8:	00113423          	sd	ra,8(sp)
    800047bc:	01010413          	addi	s0,sp,16
    800047c0:	ffffe097          	auipc	ra,0xffffe
    800047c4:	5c4080e7          	jalr	1476(ra) # 80002d84 <mycpu>
    800047c8:	100027f3          	csrr	a5,sstatus
    800047cc:	0027f793          	andi	a5,a5,2
    800047d0:	04078463          	beqz	a5,80004818 <pop_on+0x68>
    800047d4:	07852783          	lw	a5,120(a0)
    800047d8:	02f05863          	blez	a5,80004808 <pop_on+0x58>
    800047dc:	fff7879b          	addiw	a5,a5,-1
    800047e0:	06f52c23          	sw	a5,120(a0)
    800047e4:	07853783          	ld	a5,120(a0)
    800047e8:	00079863          	bnez	a5,800047f8 <pop_on+0x48>
    800047ec:	100027f3          	csrr	a5,sstatus
    800047f0:	ffd7f793          	andi	a5,a5,-3
    800047f4:	10079073          	csrw	sstatus,a5
    800047f8:	00813083          	ld	ra,8(sp)
    800047fc:	00013403          	ld	s0,0(sp)
    80004800:	01010113          	addi	sp,sp,16
    80004804:	00008067          	ret
    80004808:	00001517          	auipc	a0,0x1
    8000480c:	ab050513          	addi	a0,a0,-1360 # 800052b8 <digits+0x70>
    80004810:	fffff097          	auipc	ra,0xfffff
    80004814:	f2c080e7          	jalr	-212(ra) # 8000373c <panic>
    80004818:	00001517          	auipc	a0,0x1
    8000481c:	a8050513          	addi	a0,a0,-1408 # 80005298 <digits+0x50>
    80004820:	fffff097          	auipc	ra,0xfffff
    80004824:	f1c080e7          	jalr	-228(ra) # 8000373c <panic>

0000000080004828 <__memset>:
    80004828:	ff010113          	addi	sp,sp,-16
    8000482c:	00813423          	sd	s0,8(sp)
    80004830:	01010413          	addi	s0,sp,16
    80004834:	1a060e63          	beqz	a2,800049f0 <__memset+0x1c8>
    80004838:	40a007b3          	neg	a5,a0
    8000483c:	0077f793          	andi	a5,a5,7
    80004840:	00778693          	addi	a3,a5,7
    80004844:	00b00813          	li	a6,11
    80004848:	0ff5f593          	andi	a1,a1,255
    8000484c:	fff6071b          	addiw	a4,a2,-1
    80004850:	1b06e663          	bltu	a3,a6,800049fc <__memset+0x1d4>
    80004854:	1cd76463          	bltu	a4,a3,80004a1c <__memset+0x1f4>
    80004858:	1a078e63          	beqz	a5,80004a14 <__memset+0x1ec>
    8000485c:	00b50023          	sb	a1,0(a0)
    80004860:	00100713          	li	a4,1
    80004864:	1ae78463          	beq	a5,a4,80004a0c <__memset+0x1e4>
    80004868:	00b500a3          	sb	a1,1(a0)
    8000486c:	00200713          	li	a4,2
    80004870:	1ae78a63          	beq	a5,a4,80004a24 <__memset+0x1fc>
    80004874:	00b50123          	sb	a1,2(a0)
    80004878:	00300713          	li	a4,3
    8000487c:	18e78463          	beq	a5,a4,80004a04 <__memset+0x1dc>
    80004880:	00b501a3          	sb	a1,3(a0)
    80004884:	00400713          	li	a4,4
    80004888:	1ae78263          	beq	a5,a4,80004a2c <__memset+0x204>
    8000488c:	00b50223          	sb	a1,4(a0)
    80004890:	00500713          	li	a4,5
    80004894:	1ae78063          	beq	a5,a4,80004a34 <__memset+0x20c>
    80004898:	00b502a3          	sb	a1,5(a0)
    8000489c:	00700713          	li	a4,7
    800048a0:	18e79e63          	bne	a5,a4,80004a3c <__memset+0x214>
    800048a4:	00b50323          	sb	a1,6(a0)
    800048a8:	00700e93          	li	t4,7
    800048ac:	00859713          	slli	a4,a1,0x8
    800048b0:	00e5e733          	or	a4,a1,a4
    800048b4:	01059e13          	slli	t3,a1,0x10
    800048b8:	01c76e33          	or	t3,a4,t3
    800048bc:	01859313          	slli	t1,a1,0x18
    800048c0:	006e6333          	or	t1,t3,t1
    800048c4:	02059893          	slli	a7,a1,0x20
    800048c8:	40f60e3b          	subw	t3,a2,a5
    800048cc:	011368b3          	or	a7,t1,a7
    800048d0:	02859813          	slli	a6,a1,0x28
    800048d4:	0108e833          	or	a6,a7,a6
    800048d8:	03059693          	slli	a3,a1,0x30
    800048dc:	003e589b          	srliw	a7,t3,0x3
    800048e0:	00d866b3          	or	a3,a6,a3
    800048e4:	03859713          	slli	a4,a1,0x38
    800048e8:	00389813          	slli	a6,a7,0x3
    800048ec:	00f507b3          	add	a5,a0,a5
    800048f0:	00e6e733          	or	a4,a3,a4
    800048f4:	000e089b          	sext.w	a7,t3
    800048f8:	00f806b3          	add	a3,a6,a5
    800048fc:	00e7b023          	sd	a4,0(a5)
    80004900:	00878793          	addi	a5,a5,8
    80004904:	fed79ce3          	bne	a5,a3,800048fc <__memset+0xd4>
    80004908:	ff8e7793          	andi	a5,t3,-8
    8000490c:	0007871b          	sext.w	a4,a5
    80004910:	01d787bb          	addw	a5,a5,t4
    80004914:	0ce88e63          	beq	a7,a4,800049f0 <__memset+0x1c8>
    80004918:	00f50733          	add	a4,a0,a5
    8000491c:	00b70023          	sb	a1,0(a4)
    80004920:	0017871b          	addiw	a4,a5,1
    80004924:	0cc77663          	bgeu	a4,a2,800049f0 <__memset+0x1c8>
    80004928:	00e50733          	add	a4,a0,a4
    8000492c:	00b70023          	sb	a1,0(a4)
    80004930:	0027871b          	addiw	a4,a5,2
    80004934:	0ac77e63          	bgeu	a4,a2,800049f0 <__memset+0x1c8>
    80004938:	00e50733          	add	a4,a0,a4
    8000493c:	00b70023          	sb	a1,0(a4)
    80004940:	0037871b          	addiw	a4,a5,3
    80004944:	0ac77663          	bgeu	a4,a2,800049f0 <__memset+0x1c8>
    80004948:	00e50733          	add	a4,a0,a4
    8000494c:	00b70023          	sb	a1,0(a4)
    80004950:	0047871b          	addiw	a4,a5,4
    80004954:	08c77e63          	bgeu	a4,a2,800049f0 <__memset+0x1c8>
    80004958:	00e50733          	add	a4,a0,a4
    8000495c:	00b70023          	sb	a1,0(a4)
    80004960:	0057871b          	addiw	a4,a5,5
    80004964:	08c77663          	bgeu	a4,a2,800049f0 <__memset+0x1c8>
    80004968:	00e50733          	add	a4,a0,a4
    8000496c:	00b70023          	sb	a1,0(a4)
    80004970:	0067871b          	addiw	a4,a5,6
    80004974:	06c77e63          	bgeu	a4,a2,800049f0 <__memset+0x1c8>
    80004978:	00e50733          	add	a4,a0,a4
    8000497c:	00b70023          	sb	a1,0(a4)
    80004980:	0077871b          	addiw	a4,a5,7
    80004984:	06c77663          	bgeu	a4,a2,800049f0 <__memset+0x1c8>
    80004988:	00e50733          	add	a4,a0,a4
    8000498c:	00b70023          	sb	a1,0(a4)
    80004990:	0087871b          	addiw	a4,a5,8
    80004994:	04c77e63          	bgeu	a4,a2,800049f0 <__memset+0x1c8>
    80004998:	00e50733          	add	a4,a0,a4
    8000499c:	00b70023          	sb	a1,0(a4)
    800049a0:	0097871b          	addiw	a4,a5,9
    800049a4:	04c77663          	bgeu	a4,a2,800049f0 <__memset+0x1c8>
    800049a8:	00e50733          	add	a4,a0,a4
    800049ac:	00b70023          	sb	a1,0(a4)
    800049b0:	00a7871b          	addiw	a4,a5,10
    800049b4:	02c77e63          	bgeu	a4,a2,800049f0 <__memset+0x1c8>
    800049b8:	00e50733          	add	a4,a0,a4
    800049bc:	00b70023          	sb	a1,0(a4)
    800049c0:	00b7871b          	addiw	a4,a5,11
    800049c4:	02c77663          	bgeu	a4,a2,800049f0 <__memset+0x1c8>
    800049c8:	00e50733          	add	a4,a0,a4
    800049cc:	00b70023          	sb	a1,0(a4)
    800049d0:	00c7871b          	addiw	a4,a5,12
    800049d4:	00c77e63          	bgeu	a4,a2,800049f0 <__memset+0x1c8>
    800049d8:	00e50733          	add	a4,a0,a4
    800049dc:	00b70023          	sb	a1,0(a4)
    800049e0:	00d7879b          	addiw	a5,a5,13
    800049e4:	00c7f663          	bgeu	a5,a2,800049f0 <__memset+0x1c8>
    800049e8:	00f507b3          	add	a5,a0,a5
    800049ec:	00b78023          	sb	a1,0(a5)
    800049f0:	00813403          	ld	s0,8(sp)
    800049f4:	01010113          	addi	sp,sp,16
    800049f8:	00008067          	ret
    800049fc:	00b00693          	li	a3,11
    80004a00:	e55ff06f          	j	80004854 <__memset+0x2c>
    80004a04:	00300e93          	li	t4,3
    80004a08:	ea5ff06f          	j	800048ac <__memset+0x84>
    80004a0c:	00100e93          	li	t4,1
    80004a10:	e9dff06f          	j	800048ac <__memset+0x84>
    80004a14:	00000e93          	li	t4,0
    80004a18:	e95ff06f          	j	800048ac <__memset+0x84>
    80004a1c:	00000793          	li	a5,0
    80004a20:	ef9ff06f          	j	80004918 <__memset+0xf0>
    80004a24:	00200e93          	li	t4,2
    80004a28:	e85ff06f          	j	800048ac <__memset+0x84>
    80004a2c:	00400e93          	li	t4,4
    80004a30:	e7dff06f          	j	800048ac <__memset+0x84>
    80004a34:	00500e93          	li	t4,5
    80004a38:	e75ff06f          	j	800048ac <__memset+0x84>
    80004a3c:	00600e93          	li	t4,6
    80004a40:	e6dff06f          	j	800048ac <__memset+0x84>

0000000080004a44 <__memmove>:
    80004a44:	ff010113          	addi	sp,sp,-16
    80004a48:	00813423          	sd	s0,8(sp)
    80004a4c:	01010413          	addi	s0,sp,16
    80004a50:	0e060863          	beqz	a2,80004b40 <__memmove+0xfc>
    80004a54:	fff6069b          	addiw	a3,a2,-1
    80004a58:	0006881b          	sext.w	a6,a3
    80004a5c:	0ea5e863          	bltu	a1,a0,80004b4c <__memmove+0x108>
    80004a60:	00758713          	addi	a4,a1,7
    80004a64:	00a5e7b3          	or	a5,a1,a0
    80004a68:	40a70733          	sub	a4,a4,a0
    80004a6c:	0077f793          	andi	a5,a5,7
    80004a70:	00f73713          	sltiu	a4,a4,15
    80004a74:	00174713          	xori	a4,a4,1
    80004a78:	0017b793          	seqz	a5,a5
    80004a7c:	00e7f7b3          	and	a5,a5,a4
    80004a80:	10078863          	beqz	a5,80004b90 <__memmove+0x14c>
    80004a84:	00900793          	li	a5,9
    80004a88:	1107f463          	bgeu	a5,a6,80004b90 <__memmove+0x14c>
    80004a8c:	0036581b          	srliw	a6,a2,0x3
    80004a90:	fff8081b          	addiw	a6,a6,-1
    80004a94:	02081813          	slli	a6,a6,0x20
    80004a98:	01d85893          	srli	a7,a6,0x1d
    80004a9c:	00858813          	addi	a6,a1,8
    80004aa0:	00058793          	mv	a5,a1
    80004aa4:	00050713          	mv	a4,a0
    80004aa8:	01088833          	add	a6,a7,a6
    80004aac:	0007b883          	ld	a7,0(a5)
    80004ab0:	00878793          	addi	a5,a5,8
    80004ab4:	00870713          	addi	a4,a4,8
    80004ab8:	ff173c23          	sd	a7,-8(a4)
    80004abc:	ff0798e3          	bne	a5,a6,80004aac <__memmove+0x68>
    80004ac0:	ff867713          	andi	a4,a2,-8
    80004ac4:	02071793          	slli	a5,a4,0x20
    80004ac8:	0207d793          	srli	a5,a5,0x20
    80004acc:	00f585b3          	add	a1,a1,a5
    80004ad0:	40e686bb          	subw	a3,a3,a4
    80004ad4:	00f507b3          	add	a5,a0,a5
    80004ad8:	06e60463          	beq	a2,a4,80004b40 <__memmove+0xfc>
    80004adc:	0005c703          	lbu	a4,0(a1)
    80004ae0:	00e78023          	sb	a4,0(a5)
    80004ae4:	04068e63          	beqz	a3,80004b40 <__memmove+0xfc>
    80004ae8:	0015c603          	lbu	a2,1(a1)
    80004aec:	00100713          	li	a4,1
    80004af0:	00c780a3          	sb	a2,1(a5)
    80004af4:	04e68663          	beq	a3,a4,80004b40 <__memmove+0xfc>
    80004af8:	0025c603          	lbu	a2,2(a1)
    80004afc:	00200713          	li	a4,2
    80004b00:	00c78123          	sb	a2,2(a5)
    80004b04:	02e68e63          	beq	a3,a4,80004b40 <__memmove+0xfc>
    80004b08:	0035c603          	lbu	a2,3(a1)
    80004b0c:	00300713          	li	a4,3
    80004b10:	00c781a3          	sb	a2,3(a5)
    80004b14:	02e68663          	beq	a3,a4,80004b40 <__memmove+0xfc>
    80004b18:	0045c603          	lbu	a2,4(a1)
    80004b1c:	00400713          	li	a4,4
    80004b20:	00c78223          	sb	a2,4(a5)
    80004b24:	00e68e63          	beq	a3,a4,80004b40 <__memmove+0xfc>
    80004b28:	0055c603          	lbu	a2,5(a1)
    80004b2c:	00500713          	li	a4,5
    80004b30:	00c782a3          	sb	a2,5(a5)
    80004b34:	00e68663          	beq	a3,a4,80004b40 <__memmove+0xfc>
    80004b38:	0065c703          	lbu	a4,6(a1)
    80004b3c:	00e78323          	sb	a4,6(a5)
    80004b40:	00813403          	ld	s0,8(sp)
    80004b44:	01010113          	addi	sp,sp,16
    80004b48:	00008067          	ret
    80004b4c:	02061713          	slli	a4,a2,0x20
    80004b50:	02075713          	srli	a4,a4,0x20
    80004b54:	00e587b3          	add	a5,a1,a4
    80004b58:	f0f574e3          	bgeu	a0,a5,80004a60 <__memmove+0x1c>
    80004b5c:	02069613          	slli	a2,a3,0x20
    80004b60:	02065613          	srli	a2,a2,0x20
    80004b64:	fff64613          	not	a2,a2
    80004b68:	00e50733          	add	a4,a0,a4
    80004b6c:	00c78633          	add	a2,a5,a2
    80004b70:	fff7c683          	lbu	a3,-1(a5)
    80004b74:	fff78793          	addi	a5,a5,-1
    80004b78:	fff70713          	addi	a4,a4,-1
    80004b7c:	00d70023          	sb	a3,0(a4)
    80004b80:	fec798e3          	bne	a5,a2,80004b70 <__memmove+0x12c>
    80004b84:	00813403          	ld	s0,8(sp)
    80004b88:	01010113          	addi	sp,sp,16
    80004b8c:	00008067          	ret
    80004b90:	02069713          	slli	a4,a3,0x20
    80004b94:	02075713          	srli	a4,a4,0x20
    80004b98:	00170713          	addi	a4,a4,1
    80004b9c:	00e50733          	add	a4,a0,a4
    80004ba0:	00050793          	mv	a5,a0
    80004ba4:	0005c683          	lbu	a3,0(a1)
    80004ba8:	00178793          	addi	a5,a5,1
    80004bac:	00158593          	addi	a1,a1,1
    80004bb0:	fed78fa3          	sb	a3,-1(a5)
    80004bb4:	fee798e3          	bne	a5,a4,80004ba4 <__memmove+0x160>
    80004bb8:	f89ff06f          	j	80004b40 <__memmove+0xfc>

0000000080004bbc <__mem_free>:
    80004bbc:	ff010113          	addi	sp,sp,-16
    80004bc0:	00813423          	sd	s0,8(sp)
    80004bc4:	01010413          	addi	s0,sp,16
    80004bc8:	00001597          	auipc	a1,0x1
    80004bcc:	1b058593          	addi	a1,a1,432 # 80005d78 <freep>
    80004bd0:	0005b783          	ld	a5,0(a1)
    80004bd4:	ff050693          	addi	a3,a0,-16
    80004bd8:	0007b703          	ld	a4,0(a5)
    80004bdc:	00d7fc63          	bgeu	a5,a3,80004bf4 <__mem_free+0x38>
    80004be0:	00e6ee63          	bltu	a3,a4,80004bfc <__mem_free+0x40>
    80004be4:	00e7fc63          	bgeu	a5,a4,80004bfc <__mem_free+0x40>
    80004be8:	00070793          	mv	a5,a4
    80004bec:	0007b703          	ld	a4,0(a5)
    80004bf0:	fed7e8e3          	bltu	a5,a3,80004be0 <__mem_free+0x24>
    80004bf4:	fee7eae3          	bltu	a5,a4,80004be8 <__mem_free+0x2c>
    80004bf8:	fee6f8e3          	bgeu	a3,a4,80004be8 <__mem_free+0x2c>
    80004bfc:	ff852803          	lw	a6,-8(a0)
    80004c00:	02081613          	slli	a2,a6,0x20
    80004c04:	01c65613          	srli	a2,a2,0x1c
    80004c08:	00c68633          	add	a2,a3,a2
    80004c0c:	02c70a63          	beq	a4,a2,80004c40 <__mem_free+0x84>
    80004c10:	fee53823          	sd	a4,-16(a0)
    80004c14:	0087a503          	lw	a0,8(a5)
    80004c18:	02051613          	slli	a2,a0,0x20
    80004c1c:	01c65613          	srli	a2,a2,0x1c
    80004c20:	00c78633          	add	a2,a5,a2
    80004c24:	04c68263          	beq	a3,a2,80004c68 <__mem_free+0xac>
    80004c28:	00813403          	ld	s0,8(sp)
    80004c2c:	00d7b023          	sd	a3,0(a5)
    80004c30:	00f5b023          	sd	a5,0(a1)
    80004c34:	00000513          	li	a0,0
    80004c38:	01010113          	addi	sp,sp,16
    80004c3c:	00008067          	ret
    80004c40:	00872603          	lw	a2,8(a4)
    80004c44:	00073703          	ld	a4,0(a4)
    80004c48:	0106083b          	addw	a6,a2,a6
    80004c4c:	ff052c23          	sw	a6,-8(a0)
    80004c50:	fee53823          	sd	a4,-16(a0)
    80004c54:	0087a503          	lw	a0,8(a5)
    80004c58:	02051613          	slli	a2,a0,0x20
    80004c5c:	01c65613          	srli	a2,a2,0x1c
    80004c60:	00c78633          	add	a2,a5,a2
    80004c64:	fcc692e3          	bne	a3,a2,80004c28 <__mem_free+0x6c>
    80004c68:	00813403          	ld	s0,8(sp)
    80004c6c:	0105053b          	addw	a0,a0,a6
    80004c70:	00a7a423          	sw	a0,8(a5)
    80004c74:	00e7b023          	sd	a4,0(a5)
    80004c78:	00f5b023          	sd	a5,0(a1)
    80004c7c:	00000513          	li	a0,0
    80004c80:	01010113          	addi	sp,sp,16
    80004c84:	00008067          	ret

0000000080004c88 <__mem_alloc>:
    80004c88:	fc010113          	addi	sp,sp,-64
    80004c8c:	02813823          	sd	s0,48(sp)
    80004c90:	02913423          	sd	s1,40(sp)
    80004c94:	03213023          	sd	s2,32(sp)
    80004c98:	01513423          	sd	s5,8(sp)
    80004c9c:	02113c23          	sd	ra,56(sp)
    80004ca0:	01313c23          	sd	s3,24(sp)
    80004ca4:	01413823          	sd	s4,16(sp)
    80004ca8:	01613023          	sd	s6,0(sp)
    80004cac:	04010413          	addi	s0,sp,64
    80004cb0:	00001a97          	auipc	s5,0x1
    80004cb4:	0c8a8a93          	addi	s5,s5,200 # 80005d78 <freep>
    80004cb8:	00f50913          	addi	s2,a0,15
    80004cbc:	000ab683          	ld	a3,0(s5)
    80004cc0:	00495913          	srli	s2,s2,0x4
    80004cc4:	0019049b          	addiw	s1,s2,1
    80004cc8:	00048913          	mv	s2,s1
    80004ccc:	0c068c63          	beqz	a3,80004da4 <__mem_alloc+0x11c>
    80004cd0:	0006b503          	ld	a0,0(a3)
    80004cd4:	00852703          	lw	a4,8(a0)
    80004cd8:	10977063          	bgeu	a4,s1,80004dd8 <__mem_alloc+0x150>
    80004cdc:	000017b7          	lui	a5,0x1
    80004ce0:	0009099b          	sext.w	s3,s2
    80004ce4:	0af4e863          	bltu	s1,a5,80004d94 <__mem_alloc+0x10c>
    80004ce8:	02099a13          	slli	s4,s3,0x20
    80004cec:	01ca5a13          	srli	s4,s4,0x1c
    80004cf0:	fff00b13          	li	s6,-1
    80004cf4:	0100006f          	j	80004d04 <__mem_alloc+0x7c>
    80004cf8:	0007b503          	ld	a0,0(a5) # 1000 <_entry-0x7ffff000>
    80004cfc:	00852703          	lw	a4,8(a0)
    80004d00:	04977463          	bgeu	a4,s1,80004d48 <__mem_alloc+0xc0>
    80004d04:	00050793          	mv	a5,a0
    80004d08:	fea698e3          	bne	a3,a0,80004cf8 <__mem_alloc+0x70>
    80004d0c:	000a0513          	mv	a0,s4
    80004d10:	00000097          	auipc	ra,0x0
    80004d14:	0d0080e7          	jalr	208(ra) # 80004de0 <kvmincrease>
    80004d18:	00050793          	mv	a5,a0
    80004d1c:	01050513          	addi	a0,a0,16
    80004d20:	07678e63          	beq	a5,s6,80004d9c <__mem_alloc+0x114>
    80004d24:	0137a423          	sw	s3,8(a5)
    80004d28:	00000097          	auipc	ra,0x0
    80004d2c:	e94080e7          	jalr	-364(ra) # 80004bbc <__mem_free>
    80004d30:	000ab783          	ld	a5,0(s5)
    80004d34:	06078463          	beqz	a5,80004d9c <__mem_alloc+0x114>
    80004d38:	0007b503          	ld	a0,0(a5)
    80004d3c:	00078693          	mv	a3,a5
    80004d40:	00852703          	lw	a4,8(a0)
    80004d44:	fc9760e3          	bltu	a4,s1,80004d04 <__mem_alloc+0x7c>
    80004d48:	08e48263          	beq	s1,a4,80004dcc <__mem_alloc+0x144>
    80004d4c:	4127073b          	subw	a4,a4,s2
    80004d50:	02071693          	slli	a3,a4,0x20
    80004d54:	01c6d693          	srli	a3,a3,0x1c
    80004d58:	00e52423          	sw	a4,8(a0)
    80004d5c:	00d50533          	add	a0,a0,a3
    80004d60:	01252423          	sw	s2,8(a0)
    80004d64:	00fab023          	sd	a5,0(s5)
    80004d68:	01050513          	addi	a0,a0,16
    80004d6c:	03813083          	ld	ra,56(sp)
    80004d70:	03013403          	ld	s0,48(sp)
    80004d74:	02813483          	ld	s1,40(sp)
    80004d78:	02013903          	ld	s2,32(sp)
    80004d7c:	01813983          	ld	s3,24(sp)
    80004d80:	01013a03          	ld	s4,16(sp)
    80004d84:	00813a83          	ld	s5,8(sp)
    80004d88:	00013b03          	ld	s6,0(sp)
    80004d8c:	04010113          	addi	sp,sp,64
    80004d90:	00008067          	ret
    80004d94:	000019b7          	lui	s3,0x1
    80004d98:	f51ff06f          	j	80004ce8 <__mem_alloc+0x60>
    80004d9c:	00000513          	li	a0,0
    80004da0:	fcdff06f          	j	80004d6c <__mem_alloc+0xe4>
    80004da4:	00002797          	auipc	a5,0x2
    80004da8:	4bc78793          	addi	a5,a5,1212 # 80007260 <base>
    80004dac:	00078513          	mv	a0,a5
    80004db0:	00fab023          	sd	a5,0(s5)
    80004db4:	00f7b023          	sd	a5,0(a5)
    80004db8:	00000713          	li	a4,0
    80004dbc:	00002797          	auipc	a5,0x2
    80004dc0:	4a07a623          	sw	zero,1196(a5) # 80007268 <base+0x8>
    80004dc4:	00050693          	mv	a3,a0
    80004dc8:	f11ff06f          	j	80004cd8 <__mem_alloc+0x50>
    80004dcc:	00053703          	ld	a4,0(a0)
    80004dd0:	00e7b023          	sd	a4,0(a5)
    80004dd4:	f91ff06f          	j	80004d64 <__mem_alloc+0xdc>
    80004dd8:	00068793          	mv	a5,a3
    80004ddc:	f6dff06f          	j	80004d48 <__mem_alloc+0xc0>

0000000080004de0 <kvmincrease>:
    80004de0:	fe010113          	addi	sp,sp,-32
    80004de4:	01213023          	sd	s2,0(sp)
    80004de8:	00001937          	lui	s2,0x1
    80004dec:	fff90913          	addi	s2,s2,-1 # fff <_entry-0x7ffff001>
    80004df0:	00813823          	sd	s0,16(sp)
    80004df4:	00113c23          	sd	ra,24(sp)
    80004df8:	00913423          	sd	s1,8(sp)
    80004dfc:	02010413          	addi	s0,sp,32
    80004e00:	01250933          	add	s2,a0,s2
    80004e04:	00c95913          	srli	s2,s2,0xc
    80004e08:	02090863          	beqz	s2,80004e38 <kvmincrease+0x58>
    80004e0c:	00000493          	li	s1,0
    80004e10:	00148493          	addi	s1,s1,1
    80004e14:	fffff097          	auipc	ra,0xfffff
    80004e18:	5dc080e7          	jalr	1500(ra) # 800043f0 <kalloc>
    80004e1c:	fe991ae3          	bne	s2,s1,80004e10 <kvmincrease+0x30>
    80004e20:	01813083          	ld	ra,24(sp)
    80004e24:	01013403          	ld	s0,16(sp)
    80004e28:	00813483          	ld	s1,8(sp)
    80004e2c:	00013903          	ld	s2,0(sp)
    80004e30:	02010113          	addi	sp,sp,32
    80004e34:	00008067          	ret
    80004e38:	01813083          	ld	ra,24(sp)
    80004e3c:	01013403          	ld	s0,16(sp)
    80004e40:	00813483          	ld	s1,8(sp)
    80004e44:	00013903          	ld	s2,0(sp)
    80004e48:	00000513          	li	a0,0
    80004e4c:	02010113          	addi	sp,sp,32
    80004e50:	00008067          	ret
	...
