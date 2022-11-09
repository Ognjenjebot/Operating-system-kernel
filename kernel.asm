
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00008117          	auipc	sp,0x8
    80000004:	65813103          	ld	sp,1624(sp) # 80008658 <_GLOBAL_OFFSET_TABLE_+0x40>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	659030ef          	jal	ra,80003e74 <start>

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
    80001084:	4fc010ef          	jal	ra,80002580 <_ZN5Riscv20handleSupervisorTrapEv>

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

0000000080001144 <copy_and_swap>:
# a1 holds expected value
# a2 holds desired value
# a0 holds return value, 0 if successful, !0 otherwise
.global copy_and_swap
copy_and_swap:
    lr.w t0, (a0)          # Load original value.
    80001144:	100522af          	lr.w	t0,(a0)
    bne t0, a1, fail       # Doesn’t match, so fail.
    80001148:	00b29a63          	bne	t0,a1,8000115c <fail>
    sc.w t0, a2, (a0)      # Try to update.
    8000114c:	18c522af          	sc.w	t0,a2,(a0)
    bnez t0, copy_and_swap # Retry if store-conditional failed.
    80001150:	fe029ae3          	bnez	t0,80001144 <copy_and_swap>
    li a0, 0               # Set return to success.
    80001154:	00000513          	li	a0,0
    jr ra                  # Return.
    80001158:	00008067          	ret

000000008000115c <fail>:
    fail:
    li a0, 1               # Set return to failure.
    8000115c:	00100513          	li	a0,1
    80001160:	00008067          	ret

0000000080001164 <_Z7syscallv>:
#include "../h/syscall_c.h"
#include "../h/syscall_codes.h"
#include "../h/print.hpp"
#include "../h/tcb.hpp"

void syscall(){
    80001164:	ff010113          	addi	sp,sp,-16
    80001168:	00813423          	sd	s0,8(sp)
    8000116c:	01010413          	addi	s0,sp,16
    __asm__ volatile("ecall");
    80001170:	00000073          	ecall
}
    80001174:	00813403          	ld	s0,8(sp)
    80001178:	01010113          	addi	sp,sp,16
    8000117c:	00008067          	ret

0000000080001180 <_Z7setArgsv>:

void setArgs(){
    80001180:	ff010113          	addi	sp,sp,-16
    80001184:	00813423          	sd	s0,8(sp)
    80001188:	01010413          	addi	s0,sp,16

}
    8000118c:	00813403          	ld	s0,8(sp)
    80001190:	01010113          	addi	sp,sp,16
    80001194:	00008067          	ret

0000000080001198 <_Z9mem_allocm>:

//pakovanje poziva sa argumentima

void* mem_alloc(size_t size){
    80001198:	fe010113          	addi	sp,sp,-32
    8000119c:	00813c23          	sd	s0,24(sp)
    800011a0:	02010413          	addi	s0,sp,32
    uint64 volatile blocksNum;
    if(size % MEM_BLOCK_SIZE != 0) {
    800011a4:	03f57793          	andi	a5,a0,63
    800011a8:	02078a63          	beqz	a5,800011dc <_Z9mem_allocm+0x44>
        blocksNum = size / MEM_BLOCK_SIZE + 1;
    800011ac:	00655513          	srli	a0,a0,0x6
    800011b0:	00150513          	addi	a0,a0,1
    800011b4:	fea43423          	sd	a0,-24(s0)
    }
    else {
        blocksNum = size / MEM_BLOCK_SIZE;
    }
    __asm__ volatile("mv a0, %0" : : "r" (MEM_ALLOC));
    800011b8:	00100793          	li	a5,1
    800011bc:	00078513          	mv	a0,a5
    __asm__ volatile("mv a1, %0" : : "r" (blocksNum));
    800011c0:	fe843783          	ld	a5,-24(s0)
    800011c4:	00078593          	mv	a1,a5
    __asm__ volatile("ecall");
    800011c8:	00000073          	ecall
    //poziv za blockNum
    void* ret;
    __asm__ volatile("mv %0, a0" : "=r" (ret));
    800011cc:	00050513          	mv	a0,a0
//    printString("povratak iz prekidne rutine\n");
//    printInteger((uint64)ret);
    return (void*)ret;
}
    800011d0:	01813403          	ld	s0,24(sp)
    800011d4:	02010113          	addi	sp,sp,32
    800011d8:	00008067          	ret
        blocksNum = size / MEM_BLOCK_SIZE;
    800011dc:	00655513          	srli	a0,a0,0x6
    800011e0:	fea43423          	sd	a0,-24(s0)
    800011e4:	fd5ff06f          	j	800011b8 <_Z9mem_allocm+0x20>

00000000800011e8 <_Z8mem_freePv>:

int mem_free(void *p){
    800011e8:	ff010113          	addi	sp,sp,-16
    800011ec:	00813423          	sd	s0,8(sp)
    800011f0:	01010413          	addi	s0,sp,16
    //prvo cu upisati p u a1, jer ako stavim prvo da se upise vrednost u a0 promenicu i argumen p
    //jer je preko njega poslat argument f-je
    __asm__ volatile("mv a1, %0" : : "r" (p));
    800011f4:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %0" : : "r" (MEM_FREE));
    800011f8:	00200793          	li	a5,2
    800011fc:	00078513          	mv	a0,a5

    __asm__ volatile("ecall");
    80001200:	00000073          	ecall
    uint64 ret;
    __asm__ volatile("mv %0, a0" : "=r" (ret));
    80001204:	00050513          	mv	a0,a0
    return ret;
}
    80001208:	0005051b          	sext.w	a0,a0
    8000120c:	00813403          	ld	s0,8(sp)
    80001210:	01010113          	addi	sp,sp,16
    80001214:	00008067          	ret

0000000080001218 <_Z13thread_createPP7_threadPFvPvES2_>:

int thread_create( thread_t* handle,
                   void(*start_routine)(void*),
                   void *arg
                   ){
    80001218:	fc010113          	addi	sp,sp,-64
    8000121c:	02113c23          	sd	ra,56(sp)
    80001220:	02813823          	sd	s0,48(sp)
    80001224:	02913423          	sd	s1,40(sp)
    80001228:	03213023          	sd	s2,32(sp)
    8000122c:	01313c23          	sd	s3,24(sp)
    80001230:	04010413          	addi	s0,sp,64
    80001234:	00050993          	mv	s3,a0
    80001238:	00058913          	mv	s2,a1
    8000123c:	00060493          	mv	s1,a2
    //za ABI poziv mora se dodati i argument za stek

    void* volatile stack = new uint64[DEFAULT_STACK_SIZE];
    80001240:	00008537          	lui	a0,0x8
    80001244:	00001097          	auipc	ra,0x1
    80001248:	0f0080e7          	jalr	240(ra) # 80002334 <_Znam>
    8000124c:	fca43423          	sd	a0,-56(s0)
//    printInteger((uint64)stack);
    if(stack != nullptr) {
    80001250:	fc843783          	ld	a5,-56(s0)
    80001254:	04078463          	beqz	a5,8000129c <_Z13thread_createPP7_threadPFvPvES2_+0x84>
        __asm__ volatile("mv a0, %0" : : "r" (THREAD_CREATE));
    80001258:	01100793          	li	a5,17
    8000125c:	00078513          	mv	a0,a5
        __asm__ volatile("mv a1, %0" : : "r" (handle));
    80001260:	00098593          	mv	a1,s3
        __asm__ volatile("mv a2, %0" : : "r" (start_routine));
    80001264:	00090613          	mv	a2,s2
        __asm__ volatile("mv a3, %0" : : "r" (arg));
    80001268:	00048693          	mv	a3,s1
        __asm__ volatile("mv a4, %0" : : "r" (stack));
    8000126c:	fc843783          	ld	a5,-56(s0)
    80001270:	00078713          	mv	a4,a5
        __asm__ volatile("ecall");
    80001274:	00000073          	ecall

        uint64 ret;
        __asm__ volatile("mv %0, a0" : "=r" (ret));
    80001278:	00050513          	mv	a0,a0
        return ret;
    8000127c:	0005051b          	sext.w	a0,a0

    } else{
        return -2;
    }
}
    80001280:	03813083          	ld	ra,56(sp)
    80001284:	03013403          	ld	s0,48(sp)
    80001288:	02813483          	ld	s1,40(sp)
    8000128c:	02013903          	ld	s2,32(sp)
    80001290:	01813983          	ld	s3,24(sp)
    80001294:	04010113          	addi	sp,sp,64
    80001298:	00008067          	ret
        return -2;
    8000129c:	ffe00513          	li	a0,-2
    800012a0:	fe1ff06f          	j	80001280 <_Z13thread_createPP7_threadPFvPvES2_+0x68>

00000000800012a4 <_Z11thread_exitv>:

int thread_exit(){
    800012a4:	ff010113          	addi	sp,sp,-16
    800012a8:	00813423          	sd	s0,8(sp)
    800012ac:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a0, %0" : : "r" (THREAD_EXIT));
    800012b0:	01200793          	li	a5,18
    800012b4:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    800012b8:	00000073          	ecall
    uint64 ret;
    __asm__ volatile("mv %0, a0" : "=r" (ret));
    800012bc:	00050513          	mv	a0,a0
    return ret;
}
    800012c0:	0005051b          	sext.w	a0,a0
    800012c4:	00813403          	ld	s0,8(sp)
    800012c8:	01010113          	addi	sp,sp,16
    800012cc:	00008067          	ret

00000000800012d0 <_Z15thread_dispatchv>:

void thread_dispatch(){
    800012d0:	ff010113          	addi	sp,sp,-16
    800012d4:	00813423          	sd	s0,8(sp)
    800012d8:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a0, %0" : : "r" (THREAD_DISPACH));
    800012dc:	01300793          	li	a5,19
    800012e0:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    800012e4:	00000073          	ecall
}
    800012e8:	00813403          	ld	s0,8(sp)
    800012ec:	01010113          	addi	sp,sp,16
    800012f0:	00008067          	ret

00000000800012f4 <_Z21thread_initializationPP7_threadPFvPvES2_>:

void thread_initialization(
        thread_t *handle,
        void(*start_routine)(void*),
        void *arg) {
    800012f4:	fc010113          	addi	sp,sp,-64
    800012f8:	02113c23          	sd	ra,56(sp)
    800012fc:	02813823          	sd	s0,48(sp)
    80001300:	02913423          	sd	s1,40(sp)
    80001304:	03213023          	sd	s2,32(sp)
    80001308:	01313c23          	sd	s3,24(sp)
    8000130c:	04010413          	addi	s0,sp,64
    80001310:	00050993          	mv	s3,a0
    80001314:	00058913          	mv	s2,a1
    80001318:	00060493          	mv	s1,a2
    void* volatile stack = new uint64[DEFAULT_STACK_SIZE];
    8000131c:	00008537          	lui	a0,0x8
    80001320:	00001097          	auipc	ra,0x1
    80001324:	014080e7          	jalr	20(ra) # 80002334 <_Znam>
    80001328:	fca43423          	sd	a0,-56(s0)
    if (stack != nullptr) {
    8000132c:	fc843783          	ld	a5,-56(s0)
    80001330:	02078263          	beqz	a5,80001354 <_Z21thread_initializationPP7_threadPFvPvES2_+0x60>
        __asm__ volatile("mv a0, %0" : : "r" (THREAD_INIT));
    80001334:	04300793          	li	a5,67
    80001338:	00078513          	mv	a0,a5
        __asm__ volatile("mv a1, %0" : : "r" (handle));
    8000133c:	00098593          	mv	a1,s3
        __asm__ volatile("mv a2, %0" : : "r" (start_routine));
    80001340:	00090613          	mv	a2,s2
        __asm__ volatile("mv a3, %0" : : "r" (arg));
    80001344:	00048693          	mv	a3,s1
        __asm__ volatile("mv a4, %0" : : "r" (stack));
    80001348:	fc843783          	ld	a5,-56(s0)
    8000134c:	00078713          	mv	a4,a5
        __asm__ volatile("ecall");
    80001350:	00000073          	ecall
    }
}
    80001354:	03813083          	ld	ra,56(sp)
    80001358:	03013403          	ld	s0,48(sp)
    8000135c:	02813483          	ld	s1,40(sp)
    80001360:	02013903          	ld	s2,32(sp)
    80001364:	01813983          	ld	s3,24(sp)
    80001368:	04010113          	addi	sp,sp,64
    8000136c:	00008067          	ret

0000000080001370 <_Z12thread_startP7_thread>:

void thread_start(thread_t t){
    80001370:	ff010113          	addi	sp,sp,-16
    80001374:	00813423          	sd	s0,8(sp)
    80001378:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %0" : : "r" (t));
    8000137c:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %0" : : "r" (THREAD_START));
    80001380:	04400793          	li	a5,68
    80001384:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    80001388:	00000073          	ecall
}
    8000138c:	00813403          	ld	s0,8(sp)
    80001390:	01010113          	addi	sp,sp,16
    80001394:	00008067          	ret

0000000080001398 <_Z8sem_openPP4_semj>:


int sem_open(sem_t *handle, unsigned init){
    80001398:	ff010113          	addi	sp,sp,-16
    8000139c:	00813423          	sd	s0,8(sp)
    800013a0:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a2, %0" : : "r" (init));
    800013a4:	00058613          	mv	a2,a1
    __asm__ volatile("mv a1, %0" : : "r" (handle));
    800013a8:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %0" : : "r" (SEM_OPEN));
    800013ac:	02100793          	li	a5,33
    800013b0:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    800013b4:	00000073          	ecall
    uint64 ret;
    __asm__ volatile("mv %0, a0" : "=r" (ret));
    800013b8:	00050513          	mv	a0,a0
    return ret;
}
    800013bc:	0005051b          	sext.w	a0,a0
    800013c0:	00813403          	ld	s0,8(sp)
    800013c4:	01010113          	addi	sp,sp,16
    800013c8:	00008067          	ret

00000000800013cc <_Z9sem_closeP4_sem>:

int sem_close(sem_t handle){
    800013cc:	ff010113          	addi	sp,sp,-16
    800013d0:	00813423          	sd	s0,8(sp)
    800013d4:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %0" : : "r" (handle));
    800013d8:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %0" : : "r" (SEM_CLOSE));
    800013dc:	02200793          	li	a5,34
    800013e0:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    800013e4:	00000073          	ecall
    uint64 ret;
    __asm__ volatile("mv %0, a0" : "=r" (ret));
    800013e8:	00050513          	mv	a0,a0
    return ret;
}
    800013ec:	0005051b          	sext.w	a0,a0
    800013f0:	00813403          	ld	s0,8(sp)
    800013f4:	01010113          	addi	sp,sp,16
    800013f8:	00008067          	ret

00000000800013fc <_Z8sem_waitP4_sem>:

int sem_wait(sem_t id){
    800013fc:	ff010113          	addi	sp,sp,-16
    80001400:	00813423          	sd	s0,8(sp)
    80001404:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %0" : : "r" (id));
    80001408:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %0" : : "r" (SEM_WAIT));
    8000140c:	02300793          	li	a5,35
    80001410:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    80001414:	00000073          	ecall
    uint64 ret;
    __asm__ volatile("mv %0, a0" : "=r" (ret));
    80001418:	00050513          	mv	a0,a0
    return ret;
}
    8000141c:	0005051b          	sext.w	a0,a0
    80001420:	00813403          	ld	s0,8(sp)
    80001424:	01010113          	addi	sp,sp,16
    80001428:	00008067          	ret

000000008000142c <_Z10sem_signalP4_sem>:

int sem_signal(sem_t id){
    8000142c:	ff010113          	addi	sp,sp,-16
    80001430:	00813423          	sd	s0,8(sp)
    80001434:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %0" : : "r" (id));
    80001438:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %0" : : "r" (SEM_SIGNAL));
    8000143c:	02400793          	li	a5,36
    80001440:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    80001444:	00000073          	ecall
    uint64 ret;
    __asm__ volatile("mv %0, a0" : "=r" (ret));
    80001448:	00050513          	mv	a0,a0
    return ret;
}
    8000144c:	0005051b          	sext.w	a0,a0
    80001450:	00813403          	ld	s0,8(sp)
    80001454:	01010113          	addi	sp,sp,16
    80001458:	00008067          	ret

000000008000145c <_Z10time_sleepm>:

int time_sleep(time_t t){
    8000145c:	ff010113          	addi	sp,sp,-16
    80001460:	00813423          	sd	s0,8(sp)
    80001464:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %0" : : "r" (t));
    80001468:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %0" : : "r" (THREAD_SLEEP));
    8000146c:	03100793          	li	a5,49
    80001470:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    80001474:	00000073          	ecall
    uint64 ret;
    __asm__ volatile("mv %0, a0" : "=r" (ret));
    80001478:	00050513          	mv	a0,a0
    return ret;
}
    8000147c:	0005051b          	sext.w	a0,a0
    80001480:	00813403          	ld	s0,8(sp)
    80001484:	01010113          	addi	sp,sp,16
    80001488:	00008067          	ret

000000008000148c <_Z4getcv>:

char getc(){
    8000148c:	ff010113          	addi	sp,sp,-16
    80001490:	00813423          	sd	s0,8(sp)
    80001494:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a0, %0" : : "r" (GETC));
    80001498:	04100793          	li	a5,65
    8000149c:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    800014a0:	00000073          	ecall
    char ret;
    __asm__ volatile("mv %0, a0" : "=r" (ret));
    800014a4:	00050513          	mv	a0,a0
    return ret;
}
    800014a8:	0ff57513          	andi	a0,a0,255
    800014ac:	00813403          	ld	s0,8(sp)
    800014b0:	01010113          	addi	sp,sp,16
    800014b4:	00008067          	ret

00000000800014b8 <_Z4putcc>:
void putc(char c){
    800014b8:	ff010113          	addi	sp,sp,-16
    800014bc:	00813423          	sd	s0,8(sp)
    800014c0:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %0" : : "r" (c));
    800014c4:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %0" : : "r" (PUTC));
    800014c8:	04200793          	li	a5,66
    800014cc:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    800014d0:	00000073          	ecall
}
    800014d4:	00813403          	ld	s0,8(sp)
    800014d8:	01010113          	addi	sp,sp,16
    800014dc:	00008067          	ret

00000000800014e0 <_ZL9fibonaccim>:
        }
    }
}

static uint64 fibonacci(uint64 n)
{
    800014e0:	fe010113          	addi	sp,sp,-32
    800014e4:	00113c23          	sd	ra,24(sp)
    800014e8:	00813823          	sd	s0,16(sp)
    800014ec:	00913423          	sd	s1,8(sp)
    800014f0:	01213023          	sd	s2,0(sp)
    800014f4:	02010413          	addi	s0,sp,32
    800014f8:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    800014fc:	00100793          	li	a5,1
    80001500:	02a7f863          	bgeu	a5,a0,80001530 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { _thread::yield(); }
    80001504:	00a00793          	li	a5,10
    80001508:	02f577b3          	remu	a5,a0,a5
    8000150c:	02078e63          	beqz	a5,80001548 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80001510:	fff48513          	addi	a0,s1,-1
    80001514:	00000097          	auipc	ra,0x0
    80001518:	fcc080e7          	jalr	-52(ra) # 800014e0 <_ZL9fibonaccim>
    8000151c:	00050913          	mv	s2,a0
    80001520:	ffe48513          	addi	a0,s1,-2
    80001524:	00000097          	auipc	ra,0x0
    80001528:	fbc080e7          	jalr	-68(ra) # 800014e0 <_ZL9fibonaccim>
    8000152c:	00a90533          	add	a0,s2,a0
}
    80001530:	01813083          	ld	ra,24(sp)
    80001534:	01013403          	ld	s0,16(sp)
    80001538:	00813483          	ld	s1,8(sp)
    8000153c:	00013903          	ld	s2,0(sp)
    80001540:	02010113          	addi	sp,sp,32
    80001544:	00008067          	ret
    if (n % 10 == 0) { _thread::yield(); }
    80001548:	00001097          	auipc	ra,0x1
    8000154c:	a08080e7          	jalr	-1528(ra) # 80001f50 <_ZN7_thread5yieldEv>
    80001550:	fc1ff06f          	j	80001510 <_ZL9fibonaccim+0x30>

0000000080001554 <_Z12workerBodyAAPv>:
{
    80001554:	fe010113          	addi	sp,sp,-32
    80001558:	00113c23          	sd	ra,24(sp)
    8000155c:	00813823          	sd	s0,16(sp)
    80001560:	00913423          	sd	s1,8(sp)
    80001564:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++)
    80001568:	00000493          	li	s1,0
    8000156c:	0500006f          	j	800015bc <_Z12workerBodyAAPv+0x68>
            time_sleep(50);
    80001570:	03200513          	li	a0,50
    80001574:	00000097          	auipc	ra,0x0
    80001578:	ee8080e7          	jalr	-280(ra) # 8000145c <_Z10time_sleepm>
            char c = getc();
    8000157c:	00000097          	auipc	ra,0x0
    80001580:	f10080e7          	jalr	-240(ra) # 8000148c <_Z4getcv>
            putc(c);
    80001584:	00000097          	auipc	ra,0x0
    80001588:	f34080e7          	jalr	-204(ra) # 800014b8 <_Z4putcc>
    8000158c:	0400006f          	j	800015cc <_Z12workerBodyAAPv+0x78>
        for (uint64 j = 0; j < 10000; j++)
    80001590:	00168693          	addi	a3,a3,1
    80001594:	000027b7          	lui	a5,0x2
    80001598:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    8000159c:	00d7ee63          	bltu	a5,a3,800015b8 <_Z12workerBodyAAPv+0x64>
            for (uint64 k = 0; k < 30000; k++)
    800015a0:	00000713          	li	a4,0
    800015a4:	000077b7          	lui	a5,0x7
    800015a8:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800015ac:	fee7e2e3          	bltu	a5,a4,80001590 <_Z12workerBodyAAPv+0x3c>
    800015b0:	00170713          	addi	a4,a4,1
    800015b4:	ff1ff06f          	j	800015a4 <_Z12workerBodyAAPv+0x50>
    for (uint64 i = 0; i < 10; i++)
    800015b8:	00148493          	addi	s1,s1,1
    800015bc:	00900793          	li	a5,9
    800015c0:	0497e063          	bltu	a5,s1,80001600 <_Z12workerBodyAAPv+0xac>
        if(i == 5) {
    800015c4:	00500793          	li	a5,5
    800015c8:	faf484e3          	beq	s1,a5,80001570 <_Z12workerBodyAAPv+0x1c>
        printStringO("A: i=");
    800015cc:	00006517          	auipc	a0,0x6
    800015d0:	a5450513          	addi	a0,a0,-1452 # 80007020 <CONSOLE_STATUS+0x10>
    800015d4:	00002097          	auipc	ra,0x2
    800015d8:	894080e7          	jalr	-1900(ra) # 80002e68 <_Z12printStringOPKc>
        printInteger(i);
    800015dc:	00048513          	mv	a0,s1
    800015e0:	00002097          	auipc	ra,0x2
    800015e4:	8f8080e7          	jalr	-1800(ra) # 80002ed8 <_Z12printIntegerm>
        printStringO("\n");
    800015e8:	00006517          	auipc	a0,0x6
    800015ec:	b2050513          	addi	a0,a0,-1248 # 80007108 <_ZZ12printIntegermE6digits+0x60>
    800015f0:	00002097          	auipc	ra,0x2
    800015f4:	878080e7          	jalr	-1928(ra) # 80002e68 <_Z12printStringOPKc>
        for (uint64 j = 0; j < 10000; j++)
    800015f8:	00000693          	li	a3,0
    800015fc:	f99ff06f          	j	80001594 <_Z12workerBodyAAPv+0x40>
}
    80001600:	01813083          	ld	ra,24(sp)
    80001604:	01013403          	ld	s0,16(sp)
    80001608:	00813483          	ld	s1,8(sp)
    8000160c:	02010113          	addi	sp,sp,32
    80001610:	00008067          	ret

0000000080001614 <_Z12workerBodyBBPv>:
{
    80001614:	fe010113          	addi	sp,sp,-32
    80001618:	00113c23          	sd	ra,24(sp)
    8000161c:	00813823          	sd	s0,16(sp)
    80001620:	00913423          	sd	s1,8(sp)
    80001624:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++)
    80001628:	00000493          	li	s1,0
    8000162c:	0300006f          	j	8000165c <_Z12workerBodyBBPv+0x48>
        for (uint64 j = 0; j < 10000; j++)
    80001630:	00168693          	addi	a3,a3,1
    80001634:	000027b7          	lui	a5,0x2
    80001638:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    8000163c:	00d7ee63          	bltu	a5,a3,80001658 <_Z12workerBodyBBPv+0x44>
            for (uint64 k = 0; k < 30000; k++)
    80001640:	00000713          	li	a4,0
    80001644:	000077b7          	lui	a5,0x7
    80001648:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    8000164c:	fee7e2e3          	bltu	a5,a4,80001630 <_Z12workerBodyBBPv+0x1c>
    80001650:	00170713          	addi	a4,a4,1
    80001654:	ff1ff06f          	j	80001644 <_Z12workerBodyBBPv+0x30>
    for (uint64 i = 0; i < 16; i++)
    80001658:	00148493          	addi	s1,s1,1
    8000165c:	00f00793          	li	a5,15
    80001660:	0297ec63          	bltu	a5,s1,80001698 <_Z12workerBodyBBPv+0x84>
        printStringO("B: i=");
    80001664:	00006517          	auipc	a0,0x6
    80001668:	9c450513          	addi	a0,a0,-1596 # 80007028 <CONSOLE_STATUS+0x18>
    8000166c:	00001097          	auipc	ra,0x1
    80001670:	7fc080e7          	jalr	2044(ra) # 80002e68 <_Z12printStringOPKc>
        printInteger(i);
    80001674:	00048513          	mv	a0,s1
    80001678:	00002097          	auipc	ra,0x2
    8000167c:	860080e7          	jalr	-1952(ra) # 80002ed8 <_Z12printIntegerm>
        printStringO("\n");
    80001680:	00006517          	auipc	a0,0x6
    80001684:	a8850513          	addi	a0,a0,-1400 # 80007108 <_ZZ12printIntegermE6digits+0x60>
    80001688:	00001097          	auipc	ra,0x1
    8000168c:	7e0080e7          	jalr	2016(ra) # 80002e68 <_Z12printStringOPKc>
        for (uint64 j = 0; j < 10000; j++)
    80001690:	00000693          	li	a3,0
    80001694:	fa1ff06f          	j	80001634 <_Z12workerBodyBBPv+0x20>
}
    80001698:	01813083          	ld	ra,24(sp)
    8000169c:	01013403          	ld	s0,16(sp)
    800016a0:	00813483          	ld	s1,8(sp)
    800016a4:	02010113          	addi	sp,sp,32
    800016a8:	00008067          	ret

00000000800016ac <_Z12workerBodyCCPv>:

void workerBodyCC(void*)
{
    800016ac:	fe010113          	addi	sp,sp,-32
    800016b0:	00113c23          	sd	ra,24(sp)
    800016b4:	00813823          	sd	s0,16(sp)
    800016b8:	00913423          	sd	s1,8(sp)
    800016bc:	01213023          	sd	s2,0(sp)
    800016c0:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    800016c4:	00000493          	li	s1,0
    800016c8:	0380006f          	j	80001700 <_Z12workerBodyCCPv+0x54>
    for (; i < 3; i++)
    {
        printStringO("C: i=");
    800016cc:	00006517          	auipc	a0,0x6
    800016d0:	96450513          	addi	a0,a0,-1692 # 80007030 <CONSOLE_STATUS+0x20>
    800016d4:	00001097          	auipc	ra,0x1
    800016d8:	794080e7          	jalr	1940(ra) # 80002e68 <_Z12printStringOPKc>
        printInteger(i);
    800016dc:	00048513          	mv	a0,s1
    800016e0:	00001097          	auipc	ra,0x1
    800016e4:	7f8080e7          	jalr	2040(ra) # 80002ed8 <_Z12printIntegerm>
        printStringO("\n");
    800016e8:	00006517          	auipc	a0,0x6
    800016ec:	a2050513          	addi	a0,a0,-1504 # 80007108 <_ZZ12printIntegermE6digits+0x60>
    800016f0:	00001097          	auipc	ra,0x1
    800016f4:	778080e7          	jalr	1912(ra) # 80002e68 <_Z12printStringOPKc>
    for (; i < 3; i++)
    800016f8:	0014849b          	addiw	s1,s1,1
    800016fc:	0ff4f493          	andi	s1,s1,255
    80001700:	00200793          	li	a5,2
    80001704:	fc97f4e3          	bgeu	a5,s1,800016cc <_Z12workerBodyCCPv+0x20>
    }

    printStringO("C: yield\n");
    80001708:	00006517          	auipc	a0,0x6
    8000170c:	93050513          	addi	a0,a0,-1744 # 80007038 <CONSOLE_STATUS+0x28>
    80001710:	00001097          	auipc	ra,0x1
    80001714:	758080e7          	jalr	1880(ra) # 80002e68 <_Z12printStringOPKc>
    __asm__ ("li t1, 7");
    80001718:	00700313          	li	t1,7
    _thread::yield();
    8000171c:	00001097          	auipc	ra,0x1
    80001720:	834080e7          	jalr	-1996(ra) # 80001f50 <_ZN7_thread5yieldEv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80001724:	00030913          	mv	s2,t1

    printStringO("C: t1=");
    80001728:	00006517          	auipc	a0,0x6
    8000172c:	92050513          	addi	a0,a0,-1760 # 80007048 <CONSOLE_STATUS+0x38>
    80001730:	00001097          	auipc	ra,0x1
    80001734:	738080e7          	jalr	1848(ra) # 80002e68 <_Z12printStringOPKc>
    printInteger(t1);
    80001738:	00090513          	mv	a0,s2
    8000173c:	00001097          	auipc	ra,0x1
    80001740:	79c080e7          	jalr	1948(ra) # 80002ed8 <_Z12printIntegerm>
    printStringO("\n");
    80001744:	00006517          	auipc	a0,0x6
    80001748:	9c450513          	addi	a0,a0,-1596 # 80007108 <_ZZ12printIntegermE6digits+0x60>
    8000174c:	00001097          	auipc	ra,0x1
    80001750:	71c080e7          	jalr	1820(ra) # 80002e68 <_Z12printStringOPKc>

    uint64 result = fibonacci(12);
    80001754:	00c00513          	li	a0,12
    80001758:	00000097          	auipc	ra,0x0
    8000175c:	d88080e7          	jalr	-632(ra) # 800014e0 <_ZL9fibonaccim>
    80001760:	00050913          	mv	s2,a0
    printStringO("C: fibonaci=");
    80001764:	00006517          	auipc	a0,0x6
    80001768:	8ec50513          	addi	a0,a0,-1812 # 80007050 <CONSOLE_STATUS+0x40>
    8000176c:	00001097          	auipc	ra,0x1
    80001770:	6fc080e7          	jalr	1788(ra) # 80002e68 <_Z12printStringOPKc>
    printInteger(result);
    80001774:	00090513          	mv	a0,s2
    80001778:	00001097          	auipc	ra,0x1
    8000177c:	760080e7          	jalr	1888(ra) # 80002ed8 <_Z12printIntegerm>
    printStringO("\n");
    80001780:	00006517          	auipc	a0,0x6
    80001784:	98850513          	addi	a0,a0,-1656 # 80007108 <_ZZ12printIntegermE6digits+0x60>
    80001788:	00001097          	auipc	ra,0x1
    8000178c:	6e0080e7          	jalr	1760(ra) # 80002e68 <_Z12printStringOPKc>
    80001790:	0380006f          	j	800017c8 <_Z12workerBodyCCPv+0x11c>

    for (; i < 6; i++)
    {
        printStringO("C: i=");
    80001794:	00006517          	auipc	a0,0x6
    80001798:	89c50513          	addi	a0,a0,-1892 # 80007030 <CONSOLE_STATUS+0x20>
    8000179c:	00001097          	auipc	ra,0x1
    800017a0:	6cc080e7          	jalr	1740(ra) # 80002e68 <_Z12printStringOPKc>
        printInteger(i);
    800017a4:	00048513          	mv	a0,s1
    800017a8:	00001097          	auipc	ra,0x1
    800017ac:	730080e7          	jalr	1840(ra) # 80002ed8 <_Z12printIntegerm>
        printStringO("\n");
    800017b0:	00006517          	auipc	a0,0x6
    800017b4:	95850513          	addi	a0,a0,-1704 # 80007108 <_ZZ12printIntegermE6digits+0x60>
    800017b8:	00001097          	auipc	ra,0x1
    800017bc:	6b0080e7          	jalr	1712(ra) # 80002e68 <_Z12printStringOPKc>
    for (; i < 6; i++)
    800017c0:	0014849b          	addiw	s1,s1,1
    800017c4:	0ff4f493          	andi	s1,s1,255
    800017c8:	00500793          	li	a5,5
    800017cc:	fc97f4e3          	bgeu	a5,s1,80001794 <_Z12workerBodyCCPv+0xe8>
    }
//    _thread::yield();
}
    800017d0:	01813083          	ld	ra,24(sp)
    800017d4:	01013403          	ld	s0,16(sp)
    800017d8:	00813483          	ld	s1,8(sp)
    800017dc:	00013903          	ld	s2,0(sp)
    800017e0:	02010113          	addi	sp,sp,32
    800017e4:	00008067          	ret

00000000800017e8 <_Z12workerBodyDDPv>:

void workerBodyDD(void*)
{
    800017e8:	fe010113          	addi	sp,sp,-32
    800017ec:	00113c23          	sd	ra,24(sp)
    800017f0:	00813823          	sd	s0,16(sp)
    800017f4:	00913423          	sd	s1,8(sp)
    800017f8:	01213023          	sd	s2,0(sp)
    800017fc:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80001800:	00a00493          	li	s1,10
    80001804:	0380006f          	j	8000183c <_Z12workerBodyDDPv+0x54>
    for (; i < 13; i++)
    {
        printStringO("D: i=");
    80001808:	00006517          	auipc	a0,0x6
    8000180c:	85850513          	addi	a0,a0,-1960 # 80007060 <CONSOLE_STATUS+0x50>
    80001810:	00001097          	auipc	ra,0x1
    80001814:	658080e7          	jalr	1624(ra) # 80002e68 <_Z12printStringOPKc>
        printInteger(i);
    80001818:	00048513          	mv	a0,s1
    8000181c:	00001097          	auipc	ra,0x1
    80001820:	6bc080e7          	jalr	1724(ra) # 80002ed8 <_Z12printIntegerm>
        printStringO("\n");
    80001824:	00006517          	auipc	a0,0x6
    80001828:	8e450513          	addi	a0,a0,-1820 # 80007108 <_ZZ12printIntegermE6digits+0x60>
    8000182c:	00001097          	auipc	ra,0x1
    80001830:	63c080e7          	jalr	1596(ra) # 80002e68 <_Z12printStringOPKc>
    for (; i < 13; i++)
    80001834:	0014849b          	addiw	s1,s1,1
    80001838:	0ff4f493          	andi	s1,s1,255
    8000183c:	00c00793          	li	a5,12
    80001840:	fc97f4e3          	bgeu	a5,s1,80001808 <_Z12workerBodyDDPv+0x20>
    }

    printStringO("D: yield\n");
    80001844:	00006517          	auipc	a0,0x6
    80001848:	82450513          	addi	a0,a0,-2012 # 80007068 <CONSOLE_STATUS+0x58>
    8000184c:	00001097          	auipc	ra,0x1
    80001850:	61c080e7          	jalr	1564(ra) # 80002e68 <_Z12printStringOPKc>
    __asm__ ("li t1, 5");
    80001854:	00500313          	li	t1,5
    _thread::yield();
    80001858:	00000097          	auipc	ra,0x0
    8000185c:	6f8080e7          	jalr	1784(ra) # 80001f50 <_ZN7_thread5yieldEv>

    uint64 result = fibonacci(16);
    80001860:	01000513          	li	a0,16
    80001864:	00000097          	auipc	ra,0x0
    80001868:	c7c080e7          	jalr	-900(ra) # 800014e0 <_ZL9fibonaccim>
    8000186c:	00050913          	mv	s2,a0
    printStringO("D: fibonaci=");
    80001870:	00006517          	auipc	a0,0x6
    80001874:	80850513          	addi	a0,a0,-2040 # 80007078 <CONSOLE_STATUS+0x68>
    80001878:	00001097          	auipc	ra,0x1
    8000187c:	5f0080e7          	jalr	1520(ra) # 80002e68 <_Z12printStringOPKc>
    printInteger(result);
    80001880:	00090513          	mv	a0,s2
    80001884:	00001097          	auipc	ra,0x1
    80001888:	654080e7          	jalr	1620(ra) # 80002ed8 <_Z12printIntegerm>
    printStringO("\n");
    8000188c:	00006517          	auipc	a0,0x6
    80001890:	87c50513          	addi	a0,a0,-1924 # 80007108 <_ZZ12printIntegermE6digits+0x60>
    80001894:	00001097          	auipc	ra,0x1
    80001898:	5d4080e7          	jalr	1492(ra) # 80002e68 <_Z12printStringOPKc>
    8000189c:	0380006f          	j	800018d4 <_Z12workerBodyDDPv+0xec>

    for (; i < 16; i++)
    {
        printStringO("D: i=");
    800018a0:	00005517          	auipc	a0,0x5
    800018a4:	7c050513          	addi	a0,a0,1984 # 80007060 <CONSOLE_STATUS+0x50>
    800018a8:	00001097          	auipc	ra,0x1
    800018ac:	5c0080e7          	jalr	1472(ra) # 80002e68 <_Z12printStringOPKc>
        printInteger(i);
    800018b0:	00048513          	mv	a0,s1
    800018b4:	00001097          	auipc	ra,0x1
    800018b8:	624080e7          	jalr	1572(ra) # 80002ed8 <_Z12printIntegerm>
        printStringO("\n");
    800018bc:	00006517          	auipc	a0,0x6
    800018c0:	84c50513          	addi	a0,a0,-1972 # 80007108 <_ZZ12printIntegermE6digits+0x60>
    800018c4:	00001097          	auipc	ra,0x1
    800018c8:	5a4080e7          	jalr	1444(ra) # 80002e68 <_Z12printStringOPKc>
    for (; i < 16; i++)
    800018cc:	0014849b          	addiw	s1,s1,1
    800018d0:	0ff4f493          	andi	s1,s1,255
    800018d4:	00f00793          	li	a5,15
    800018d8:	fc97f4e3          	bgeu	a5,s1,800018a0 <_Z12workerBodyDDPv+0xb8>
    }
//    _thread::yield();
    800018dc:	01813083          	ld	ra,24(sp)
    800018e0:	01013403          	ld	s0,16(sp)
    800018e4:	00813483          	ld	s1,8(sp)
    800018e8:	00013903          	ld	s2,0(sp)
    800018ec:	02010113          	addi	sp,sp,32
    800018f0:	00008067          	ret

00000000800018f4 <_ZN9SemaphoreD1Ev>:

Semaphore::Semaphore(unsigned int init) {
    sem_open(&myHandle, init);
}

Semaphore::~Semaphore() {
    800018f4:	ff010113          	addi	sp,sp,-16
    800018f8:	00113423          	sd	ra,8(sp)
    800018fc:	00813023          	sd	s0,0(sp)
    80001900:	01010413          	addi	s0,sp,16
    80001904:	00007797          	auipc	a5,0x7
    80001908:	c8c78793          	addi	a5,a5,-884 # 80008590 <_ZTV9Semaphore+0x10>
    8000190c:	00f53023          	sd	a5,0(a0)
    sem_close(myHandle);
    80001910:	00853503          	ld	a0,8(a0)
    80001914:	00000097          	auipc	ra,0x0
    80001918:	ab8080e7          	jalr	-1352(ra) # 800013cc <_Z9sem_closeP4_sem>
}
    8000191c:	00813083          	ld	ra,8(sp)
    80001920:	00013403          	ld	s0,0(sp)
    80001924:	01010113          	addi	sp,sp,16
    80001928:	00008067          	ret

000000008000192c <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    8000192c:	fe010113          	addi	sp,sp,-32
    80001930:	00113c23          	sd	ra,24(sp)
    80001934:	00813823          	sd	s0,16(sp)
    80001938:	00913423          	sd	s1,8(sp)
    8000193c:	02010413          	addi	s0,sp,32
    80001940:	00050493          	mv	s1,a0
}
    80001944:	00000097          	auipc	ra,0x0
    80001948:	fb0080e7          	jalr	-80(ra) # 800018f4 <_ZN9SemaphoreD1Ev>
    8000194c:	00048513          	mv	a0,s1
    80001950:	00001097          	auipc	ra,0x1
    80001954:	a0c080e7          	jalr	-1524(ra) # 8000235c <_ZdlPv>
    80001958:	01813083          	ld	ra,24(sp)
    8000195c:	01013403          	ld	s0,16(sp)
    80001960:	00813483          	ld	s1,8(sp)
    80001964:	02010113          	addi	sp,sp,32
    80001968:	00008067          	ret

000000008000196c <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    8000196c:	ff010113          	addi	sp,sp,-16
    80001970:	00113423          	sd	ra,8(sp)
    80001974:	00813023          	sd	s0,0(sp)
    80001978:	01010413          	addi	s0,sp,16
    8000197c:	00007797          	auipc	a5,0x7
    80001980:	c1478793          	addi	a5,a5,-1004 # 80008590 <_ZTV9Semaphore+0x10>
    80001984:	00f53023          	sd	a5,0(a0)
    sem_open(&myHandle, init);
    80001988:	00850513          	addi	a0,a0,8
    8000198c:	00000097          	auipc	ra,0x0
    80001990:	a0c080e7          	jalr	-1524(ra) # 80001398 <_Z8sem_openPP4_semj>
}
    80001994:	00813083          	ld	ra,8(sp)
    80001998:	00013403          	ld	s0,0(sp)
    8000199c:	01010113          	addi	sp,sp,16
    800019a0:	00008067          	ret

00000000800019a4 <_ZN9Semaphore4waitEv>:

int Semaphore::wait() {
    800019a4:	ff010113          	addi	sp,sp,-16
    800019a8:	00113423          	sd	ra,8(sp)
    800019ac:	00813023          	sd	s0,0(sp)
    800019b0:	01010413          	addi	s0,sp,16
    return sem_wait(myHandle);
    800019b4:	00853503          	ld	a0,8(a0)
    800019b8:	00000097          	auipc	ra,0x0
    800019bc:	a44080e7          	jalr	-1468(ra) # 800013fc <_Z8sem_waitP4_sem>
}
    800019c0:	00813083          	ld	ra,8(sp)
    800019c4:	00013403          	ld	s0,0(sp)
    800019c8:	01010113          	addi	sp,sp,16
    800019cc:	00008067          	ret

00000000800019d0 <_ZN9Semaphore6signalEv>:

int Semaphore::signal() {
    800019d0:	ff010113          	addi	sp,sp,-16
    800019d4:	00113423          	sd	ra,8(sp)
    800019d8:	00813023          	sd	s0,0(sp)
    800019dc:	01010413          	addi	s0,sp,16
    return sem_signal(myHandle);
    800019e0:	00853503          	ld	a0,8(a0)
    800019e4:	00000097          	auipc	ra,0x0
    800019e8:	a48080e7          	jalr	-1464(ra) # 8000142c <_Z10sem_signalP4_sem>
}
    800019ec:	00813083          	ld	ra,8(sp)
    800019f0:	00013403          	ld	s0,0(sp)
    800019f4:	01010113          	addi	sp,sp,16
    800019f8:	00008067          	ret

00000000800019fc <_ZN6Thread7wrapperEPv>:
}

//kao na vezbama, agumenti se poklapaju za vec postojeci body, a mora da se posalje this u konstruktoru
//jer je wrapper staticka metoda
void Thread::wrapper(void *thread)
{
    800019fc:	ff010113          	addi	sp,sp,-16
    80001a00:	00113423          	sd	ra,8(sp)
    80001a04:	00813023          	sd	s0,0(sp)
    80001a08:	01010413          	addi	s0,sp,16
    ((Thread*)thread)->run();
    80001a0c:	00053783          	ld	a5,0(a0)
    80001a10:	0107b783          	ld	a5,16(a5)
    80001a14:	000780e7          	jalr	a5
}
    80001a18:	00813083          	ld	ra,8(sp)
    80001a1c:	00013403          	ld	s0,0(sp)
    80001a20:	01010113          	addi	sp,sp,16
    80001a24:	00008067          	ret

0000000080001a28 <_ZN6ThreadD1Ev>:
Thread::~Thread(){
    80001a28:	ff010113          	addi	sp,sp,-16
    80001a2c:	00113423          	sd	ra,8(sp)
    80001a30:	00813023          	sd	s0,0(sp)
    80001a34:	01010413          	addi	s0,sp,16
    80001a38:	00007797          	auipc	a5,0x7
    80001a3c:	b8078793          	addi	a5,a5,-1152 # 800085b8 <_ZTV6Thread+0x10>
    80001a40:	00f53023          	sd	a5,0(a0)
    thread_exit();
    80001a44:	00000097          	auipc	ra,0x0
    80001a48:	860080e7          	jalr	-1952(ra) # 800012a4 <_Z11thread_exitv>
}
    80001a4c:	00813083          	ld	ra,8(sp)
    80001a50:	00013403          	ld	s0,0(sp)
    80001a54:	01010113          	addi	sp,sp,16
    80001a58:	00008067          	ret

0000000080001a5c <_ZN6ThreadD0Ev>:
Thread::~Thread(){
    80001a5c:	fe010113          	addi	sp,sp,-32
    80001a60:	00113c23          	sd	ra,24(sp)
    80001a64:	00813823          	sd	s0,16(sp)
    80001a68:	00913423          	sd	s1,8(sp)
    80001a6c:	02010413          	addi	s0,sp,32
    80001a70:	00050493          	mv	s1,a0
}
    80001a74:	00000097          	auipc	ra,0x0
    80001a78:	fb4080e7          	jalr	-76(ra) # 80001a28 <_ZN6ThreadD1Ev>
    80001a7c:	00048513          	mv	a0,s1
    80001a80:	00001097          	auipc	ra,0x1
    80001a84:	8dc080e7          	jalr	-1828(ra) # 8000235c <_ZdlPv>
    80001a88:	01813083          	ld	ra,24(sp)
    80001a8c:	01013403          	ld	s0,16(sp)
    80001a90:	00813483          	ld	s1,8(sp)
    80001a94:	02010113          	addi	sp,sp,32
    80001a98:	00008067          	ret

0000000080001a9c <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (*body)(void *), void *arg) {
    80001a9c:	ff010113          	addi	sp,sp,-16
    80001aa0:	00113423          	sd	ra,8(sp)
    80001aa4:	00813023          	sd	s0,0(sp)
    80001aa8:	01010413          	addi	s0,sp,16
    80001aac:	00007797          	auipc	a5,0x7
    80001ab0:	b0c78793          	addi	a5,a5,-1268 # 800085b8 <_ZTV6Thread+0x10>
    80001ab4:	00f53023          	sd	a5,0(a0)
    thread_initialization(&myHandle, body, arg);
    80001ab8:	00850513          	addi	a0,a0,8
    80001abc:	00000097          	auipc	ra,0x0
    80001ac0:	838080e7          	jalr	-1992(ra) # 800012f4 <_Z21thread_initializationPP7_threadPFvPvES2_>
}
    80001ac4:	00813083          	ld	ra,8(sp)
    80001ac8:	00013403          	ld	s0,0(sp)
    80001acc:	01010113          	addi	sp,sp,16
    80001ad0:	00008067          	ret

0000000080001ad4 <_ZN6ThreadC1Ev>:
Thread::Thread() {
    80001ad4:	ff010113          	addi	sp,sp,-16
    80001ad8:	00113423          	sd	ra,8(sp)
    80001adc:	00813023          	sd	s0,0(sp)
    80001ae0:	01010413          	addi	s0,sp,16
    80001ae4:	00007797          	auipc	a5,0x7
    80001ae8:	ad478793          	addi	a5,a5,-1324 # 800085b8 <_ZTV6Thread+0x10>
    80001aec:	00f53023          	sd	a5,0(a0)
    thread_initialization(&myHandle, wrapper, this);
    80001af0:	00050613          	mv	a2,a0
    80001af4:	00000597          	auipc	a1,0x0
    80001af8:	f0858593          	addi	a1,a1,-248 # 800019fc <_ZN6Thread7wrapperEPv>
    80001afc:	00850513          	addi	a0,a0,8
    80001b00:	fffff097          	auipc	ra,0xfffff
    80001b04:	7f4080e7          	jalr	2036(ra) # 800012f4 <_Z21thread_initializationPP7_threadPFvPvES2_>
}
    80001b08:	00813083          	ld	ra,8(sp)
    80001b0c:	00013403          	ld	s0,0(sp)
    80001b10:	01010113          	addi	sp,sp,16
    80001b14:	00008067          	ret

0000000080001b18 <_ZN6Thread5startEv>:
int Thread::start(){
    80001b18:	ff010113          	addi	sp,sp,-16
    80001b1c:	00113423          	sd	ra,8(sp)
    80001b20:	00813023          	sd	s0,0(sp)
    80001b24:	01010413          	addi	s0,sp,16
    thread_start(myHandle);
    80001b28:	00853503          	ld	a0,8(a0)
    80001b2c:	00000097          	auipc	ra,0x0
    80001b30:	844080e7          	jalr	-1980(ra) # 80001370 <_Z12thread_startP7_thread>
}
    80001b34:	00000513          	li	a0,0
    80001b38:	00813083          	ld	ra,8(sp)
    80001b3c:	00013403          	ld	s0,0(sp)
    80001b40:	01010113          	addi	sp,sp,16
    80001b44:	00008067          	ret

0000000080001b48 <_ZN6Thread8dispatchEv>:
void Thread::dispatch(){
    80001b48:	ff010113          	addi	sp,sp,-16
    80001b4c:	00113423          	sd	ra,8(sp)
    80001b50:	00813023          	sd	s0,0(sp)
    80001b54:	01010413          	addi	s0,sp,16
    thread_dispatch();
    80001b58:	fffff097          	auipc	ra,0xfffff
    80001b5c:	778080e7          	jalr	1912(ra) # 800012d0 <_Z15thread_dispatchv>
}
    80001b60:	00813083          	ld	ra,8(sp)
    80001b64:	00013403          	ld	s0,0(sp)
    80001b68:	01010113          	addi	sp,sp,16
    80001b6c:	00008067          	ret

0000000080001b70 <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t t){
    80001b70:	ff010113          	addi	sp,sp,-16
    80001b74:	00113423          	sd	ra,8(sp)
    80001b78:	00813023          	sd	s0,0(sp)
    80001b7c:	01010413          	addi	s0,sp,16
    return time_sleep(t);
    80001b80:	00000097          	auipc	ra,0x0
    80001b84:	8dc080e7          	jalr	-1828(ra) # 8000145c <_Z10time_sleepm>
}
    80001b88:	00813083          	ld	ra,8(sp)
    80001b8c:	00013403          	ld	s0,0(sp)
    80001b90:	01010113          	addi	sp,sp,16
    80001b94:	00008067          	ret

0000000080001b98 <_ZN6Thread3runEv>:
    static void dispatch ();
    static int sleep (time_t);
    static void wrapper(void*);
protected:
    Thread ();
    virtual void run () {}
    80001b98:	ff010113          	addi	sp,sp,-16
    80001b9c:	00813423          	sd	s0,8(sp)
    80001ba0:	01010413          	addi	s0,sp,16
    80001ba4:	00813403          	ld	s0,8(sp)
    80001ba8:	01010113          	addi	sp,sp,16
    80001bac:	00008067          	ret

0000000080001bb0 <_ZN7Console4getcEv>:
// Created by os on 9/14/22.
//

#include "../h/syscall_cpp.hpp"

char Console::getc(){
    80001bb0:	ff010113          	addi	sp,sp,-16
    80001bb4:	00113423          	sd	ra,8(sp)
    80001bb8:	00813023          	sd	s0,0(sp)
    80001bbc:	01010413          	addi	s0,sp,16
    return ::getc();
    80001bc0:	00000097          	auipc	ra,0x0
    80001bc4:	8cc080e7          	jalr	-1844(ra) # 8000148c <_Z4getcv>
}
    80001bc8:	00813083          	ld	ra,8(sp)
    80001bcc:	00013403          	ld	s0,0(sp)
    80001bd0:	01010113          	addi	sp,sp,16
    80001bd4:	00008067          	ret

0000000080001bd8 <_ZN7Console4putcEc>:
void Console::putc(char c){
    80001bd8:	ff010113          	addi	sp,sp,-16
    80001bdc:	00113423          	sd	ra,8(sp)
    80001be0:	00813023          	sd	s0,0(sp)
    80001be4:	01010413          	addi	s0,sp,16
    return ::putc(c);
    80001be8:	00000097          	auipc	ra,0x0
    80001bec:	8d0080e7          	jalr	-1840(ra) # 800014b8 <_Z4putcc>
    80001bf0:	00813083          	ld	ra,8(sp)
    80001bf4:	00013403          	ld	s0,0(sp)
    80001bf8:	01010113          	addi	sp,sp,16
    80001bfc:	00008067          	ret

0000000080001c00 <_Z3wrpPv>:
#include "../h/syscall_c.h"

bool finishedd = false;
extern void userMain();

void wrp(void *t){
    80001c00:	ff010113          	addi	sp,sp,-16
    80001c04:	00113423          	sd	ra,8(sp)
    80001c08:	00813023          	sd	s0,0(sp)
    80001c0c:	01010413          	addi	s0,sp,16
//    printStringO("userMain()");
    userMain();
    80001c10:	00002097          	auipc	ra,0x2
    80001c14:	f1c080e7          	jalr	-228(ra) # 80003b2c <_Z8userMainv>
//    printStringO("gotovo");
    finishedd = true;
    80001c18:	00100793          	li	a5,1
    80001c1c:	00007717          	auipc	a4,0x7
    80001c20:	aaf70a23          	sb	a5,-1356(a4) # 800086d0 <finishedd>
}
    80001c24:	00813083          	ld	ra,8(sp)
    80001c28:	00013403          	ld	s0,0(sp)
    80001c2c:	01010113          	addi	sp,sp,16
    80001c30:	00008067          	ret

0000000080001c34 <main>:

int main()
{
    80001c34:	fd010113          	addi	sp,sp,-48
    80001c38:	02113423          	sd	ra,40(sp)
    80001c3c:	02813023          	sd	s0,32(sp)
    80001c40:	03010413          	addi	s0,sp,48
    Riscv::w_stvec((uint64) &Riscv::supervisorTrap);
    80001c44:	00007797          	auipc	a5,0x7
    80001c48:	9f47b783          	ld	a5,-1548(a5) # 80008638 <_GLOBAL_OFFSET_TABLE_+0x20>
    return stvec;
}

inline void Riscv::w_stvec(uint64 stvec)
{
    __asm__ volatile ("csrw stvec, %[stvec]" : : [stvec] "r"(stvec));
    80001c4c:	10579073          	csrw	stvec,a5

//    thread_t main, console, user;
    _thread *threads[3];
    thread_create(&threads[1], &_thread::consoleWrite, nullptr);
    80001c50:	00000613          	li	a2,0
    80001c54:	00007597          	auipc	a1,0x7
    80001c58:	9f45b583          	ld	a1,-1548(a1) # 80008648 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001c5c:	fe040513          	addi	a0,s0,-32
    80001c60:	fffff097          	auipc	ra,0xfffff
    80001c64:	5b8080e7          	jalr	1464(ra) # 80001218 <_Z13thread_createPP7_threadPFvPvES2_>
    thread_create(&threads[0], nullptr, nullptr);
    80001c68:	00000613          	li	a2,0
    80001c6c:	00000593          	li	a1,0
    80001c70:	fd840513          	addi	a0,s0,-40
    80001c74:	fffff097          	auipc	ra,0xfffff
    80001c78:	5a4080e7          	jalr	1444(ra) # 80001218 <_Z13thread_createPP7_threadPFvPvES2_>
    _thread::running = threads[0];
    80001c7c:	fd843703          	ld	a4,-40(s0)
    80001c80:	00007797          	auipc	a5,0x7
    80001c84:	9b07b783          	ld	a5,-1616(a5) # 80008630 <_GLOBAL_OFFSET_TABLE_+0x18>
    80001c88:	00e7b023          	sd	a4,0(a5)

    if(Riscv::buff2.itemAvailable == nullptr){
    80001c8c:	00007797          	auipc	a5,0x7
    80001c90:	9e47b783          	ld	a5,-1564(a5) # 80008670 <_GLOBAL_OFFSET_TABLE_+0x58>
    80001c94:	0007b783          	ld	a5,0(a5)
    80001c98:	04078663          	beqz	a5,80001ce4 <main+0xb0>
        _sem::createSem(&Riscv::buff2.itemAvailable, 0);
    }
    if(Riscv::buff1.itemAvailable == nullptr){
    80001c9c:	00007797          	auipc	a5,0x7
    80001ca0:	9a47b783          	ld	a5,-1628(a5) # 80008640 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001ca4:	0007b783          	ld	a5,0(a5)
    80001ca8:	04078a63          	beqz	a5,80001cfc <main+0xc8>
//    thread_create(&user, wrp, nullptr);




    thread_create(&threads[2], wrp, nullptr);
    80001cac:	00000613          	li	a2,0
    80001cb0:	00000597          	auipc	a1,0x0
    80001cb4:	f5058593          	addi	a1,a1,-176 # 80001c00 <_Z3wrpPv>
    80001cb8:	fe840513          	addi	a0,s0,-24
    80001cbc:	fffff097          	auipc	ra,0xfffff
    80001cc0:	55c080e7          	jalr	1372(ra) # 80001218 <_Z13thread_createPP7_threadPFvPvES2_>
    __asm__ volatile ("csrw sip, %[sip]" : : [sip] "r"(sip));
}

inline void Riscv::ms_sstatus(uint64 mask)
{
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    80001cc4:	00200793          	li	a5,2
    80001cc8:	1007a073          	csrs	sstatus,a5


    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    while (!finishedd)
    80001ccc:	00007797          	auipc	a5,0x7
    80001cd0:	a047c783          	lbu	a5,-1532(a5) # 800086d0 <finishedd>
    80001cd4:	04079063          	bnez	a5,80001d14 <main+0xe0>
    {
        thread_dispatch();
    80001cd8:	fffff097          	auipc	ra,0xfffff
    80001cdc:	5f8080e7          	jalr	1528(ra) # 800012d0 <_Z15thread_dispatchv>
    80001ce0:	fedff06f          	j	80001ccc <main+0x98>
        _sem::createSem(&Riscv::buff2.itemAvailable, 0);
    80001ce4:	00000593          	li	a1,0
    80001ce8:	00007517          	auipc	a0,0x7
    80001cec:	98853503          	ld	a0,-1656(a0) # 80008670 <_GLOBAL_OFFSET_TABLE_+0x58>
    80001cf0:	00001097          	auipc	ra,0x1
    80001cf4:	cc8080e7          	jalr	-824(ra) # 800029b8 <_ZN4_sem9createSemEPPS_m>
    80001cf8:	fa5ff06f          	j	80001c9c <main+0x68>
        _sem::createSem(&Riscv::buff1.itemAvailable, 0);
    80001cfc:	00000593          	li	a1,0
    80001d00:	00007517          	auipc	a0,0x7
    80001d04:	94053503          	ld	a0,-1728(a0) # 80008640 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001d08:	00001097          	auipc	ra,0x1
    80001d0c:	cb0080e7          	jalr	-848(ra) # 800029b8 <_ZN4_sem9createSemEPPS_m>
    80001d10:	f9dff06f          	j	80001cac <main+0x78>
    }

    printStringO("Finished\n");
    80001d14:	00005517          	auipc	a0,0x5
    80001d18:	37450513          	addi	a0,a0,884 # 80007088 <CONSOLE_STATUS+0x78>
    80001d1c:	00001097          	auipc	ra,0x1
    80001d20:	14c080e7          	jalr	332(ra) # 80002e68 <_Z12printStringOPKc>

    return 0;
}
    80001d24:	00000513          	li	a0,0
    80001d28:	02813083          	ld	ra,40(sp)
    80001d2c:	02013403          	ld	s0,32(sp)
    80001d30:	03010113          	addi	sp,sp,48
    80001d34:	00008067          	ret

0000000080001d38 <_ZN7_thread8setSleepEv>:

_thread *_thread::running = nullptr;

uint64 _thread::timeSliceCounter = 0;

void _thread::setSleep(){
    80001d38:	ff010113          	addi	sp,sp,-16
    80001d3c:	00813423          	sd	s0,8(sp)
    80001d40:	01010413          	addi	s0,sp,16
    if(!_thread::sleeping)
    80001d44:	03954783          	lbu	a5,57(a0)
    80001d48:	00079c63          	bnez	a5,80001d60 <_ZN7_thread8setSleepEv+0x28>
        _thread::sleeping = true;
    80001d4c:	00100793          	li	a5,1
    80001d50:	02f50ca3          	sb	a5,57(a0)
    else
        _thread::sleeping = false;
}
    80001d54:	00813403          	ld	s0,8(sp)
    80001d58:	01010113          	addi	sp,sp,16
    80001d5c:	00008067          	ret
        _thread::sleeping = false;
    80001d60:	02050ca3          	sb	zero,57(a0)
}
    80001d64:	ff1ff06f          	j	80001d54 <_ZN7_thread8setSleepEv+0x1c>

0000000080001d68 <_ZN7_thread12createThreadEPFvPvE>:

//mickov kod za kreiranje niti
_thread *_thread::createThread(Body body)
{
    80001d68:	fe010113          	addi	sp,sp,-32
    80001d6c:	00113c23          	sd	ra,24(sp)
    80001d70:	00813823          	sd	s0,16(sp)
    80001d74:	00913423          	sd	s1,8(sp)
    80001d78:	01213023          	sd	s2,0(sp)
    80001d7c:	02010413          	addi	s0,sp,32
    80001d80:	00050913          	mv	s2,a0
    return new _thread(body, TIME_SLICE);
    80001d84:	04800513          	li	a0,72
    80001d88:	00000097          	auipc	ra,0x0
    80001d8c:	584080e7          	jalr	1412(ra) # 8000230c <_Znwm>
    80001d90:	00050493          	mv	s1,a0
            stack(body != nullptr ? new uint64[STACK_SIZE] : nullptr),
            context({(uint64) &threadWrapper,
                     stack != nullptr ? (uint64) &stack[STACK_SIZE] : 0
                    }),
            timeSlice(timeSlice),
            finished(false)
    80001d94:	01253023          	sd	s2,0(a0)
            stack(body != nullptr ? new uint64[STACK_SIZE] : nullptr),
    80001d98:	00090a63          	beqz	s2,80001dac <_ZN7_thread12createThreadEPFvPvE+0x44>
    80001d9c:	00002537          	lui	a0,0x2
    80001da0:	00000097          	auipc	ra,0x0
    80001da4:	594080e7          	jalr	1428(ra) # 80002334 <_Znam>
    80001da8:	0080006f          	j	80001db0 <_ZN7_thread12createThreadEPFvPvE+0x48>
    80001dac:	00000513          	li	a0,0
            finished(false)
    80001db0:	00a4b423          	sd	a0,8(s1)
    80001db4:	00000797          	auipc	a5,0x0
    80001db8:	1b878793          	addi	a5,a5,440 # 80001f6c <_ZN7_thread13threadWrapperEv>
    80001dbc:	00f4b823          	sd	a5,16(s1)
                     stack != nullptr ? (uint64) &stack[STACK_SIZE] : 0
    80001dc0:	04050063          	beqz	a0,80001e00 <_ZN7_thread12createThreadEPFvPvE+0x98>
    80001dc4:	000027b7          	lui	a5,0x2
    80001dc8:	00f507b3          	add	a5,a0,a5
            finished(false)
    80001dcc:	00f4bc23          	sd	a5,24(s1)
    80001dd0:	00200793          	li	a5,2
    80001dd4:	02f4b023          	sd	a5,32(s1)
    80001dd8:	02048423          	sb	zero,40(s1)
    80001ddc:	0204b823          	sd	zero,48(s1)
    80001de0:	02048c23          	sb	zero,56(s1)
    80001de4:	02048ca3          	sb	zero,57(s1)
    80001de8:	0404b023          	sd	zero,64(s1)
    {
        if (body != nullptr) { Scheduler::put(this);}
    80001dec:	02090c63          	beqz	s2,80001e24 <_ZN7_thread12createThreadEPFvPvE+0xbc>
    80001df0:	00048513          	mv	a0,s1
    80001df4:	00001097          	auipc	ra,0x1
    80001df8:	f18080e7          	jalr	-232(ra) # 80002d0c <_ZN9Scheduler3putEP7_thread>
    80001dfc:	0280006f          	j	80001e24 <_ZN7_thread12createThreadEPFvPvE+0xbc>
                     stack != nullptr ? (uint64) &stack[STACK_SIZE] : 0
    80001e00:	00000793          	li	a5,0
    80001e04:	fc9ff06f          	j	80001dcc <_ZN7_thread12createThreadEPFvPvE+0x64>
    80001e08:	00050913          	mv	s2,a0
    80001e0c:	00048513          	mv	a0,s1
    80001e10:	00000097          	auipc	ra,0x0
    80001e14:	54c080e7          	jalr	1356(ra) # 8000235c <_ZdlPv>
    80001e18:	00090513          	mv	a0,s2
    80001e1c:	00008097          	auipc	ra,0x8
    80001e20:	c2c080e7          	jalr	-980(ra) # 80009a48 <_Unwind_Resume>
}
    80001e24:	00048513          	mv	a0,s1
    80001e28:	01813083          	ld	ra,24(sp)
    80001e2c:	01013403          	ld	s0,16(sp)
    80001e30:	00813483          	ld	s1,8(sp)
    80001e34:	00013903          	ld	s2,0(sp)
    80001e38:	02010113          	addi	sp,sp,32
    80001e3c:	00008067          	ret

0000000080001e40 <_ZN7_thread12createThreadEPPS_PFvPvES2_S2_b>:
//poziv za projekat
int _thread::createThread(thread_t* handle, Body body, void *args, void *stack, bool t)
{
    80001e40:	fc010113          	addi	sp,sp,-64
    80001e44:	02113c23          	sd	ra,56(sp)
    80001e48:	02813823          	sd	s0,48(sp)
    80001e4c:	02913423          	sd	s1,40(sp)
    80001e50:	03213023          	sd	s2,32(sp)
    80001e54:	01313c23          	sd	s3,24(sp)
    80001e58:	01413823          	sd	s4,16(sp)
    80001e5c:	01513423          	sd	s5,8(sp)
    80001e60:	01613023          	sd	s6,0(sp)
    80001e64:	04010413          	addi	s0,sp,64
    80001e68:	00050a13          	mv	s4,a0
    80001e6c:	00058993          	mv	s3,a1
    80001e70:	00060a93          	mv	s5,a2
    80001e74:	00068913          	mv	s2,a3
    80001e78:	00070b13          	mv	s6,a4
    *handle = new _thread(body, args, stack, t);
    80001e7c:	04800513          	li	a0,72
    80001e80:	00000097          	auipc	ra,0x0
    80001e84:	48c080e7          	jalr	1164(ra) # 8000230c <_Znwm>
    80001e88:	00050493          	mv	s1,a0
            context({(uint64) &threadWrapper,
                     stack != nullptr ?  (uint64) &stack[DEFAULT_STACK_SIZE] : 0
                    }),
            timeSlice(DEFAULT_TIME_SLICE),
            finished(false),
            args(args)
    80001e8c:	01353023          	sd	s3,0(a0) # 2000 <_entry-0x7fffe000>
            stack(body != nullptr ? (uint64*)stackk : nullptr),
    80001e90:	06098e63          	beqz	s3,80001f0c <_ZN7_thread12createThreadEPPS_PFvPvES2_S2_b+0xcc>
            args(args)
    80001e94:	0124b423          	sd	s2,8(s1)
    80001e98:	00000797          	auipc	a5,0x0
    80001e9c:	0d478793          	addi	a5,a5,212 # 80001f6c <_ZN7_thread13threadWrapperEv>
    80001ea0:	00f4b823          	sd	a5,16(s1)
                     stack != nullptr ?  (uint64) &stack[DEFAULT_STACK_SIZE] : 0
    80001ea4:	06090863          	beqz	s2,80001f14 <_ZN7_thread12createThreadEPPS_PFvPvES2_S2_b+0xd4>
    80001ea8:	000086b7          	lui	a3,0x8
    80001eac:	00d90933          	add	s2,s2,a3
            args(args)
    80001eb0:	0124bc23          	sd	s2,24(s1)
    80001eb4:	00200793          	li	a5,2
    80001eb8:	02f4b023          	sd	a5,32(s1)
    80001ebc:	02048423          	sb	zero,40(s1)
    80001ec0:	0354b823          	sd	s5,48(s1)
    80001ec4:	02048c23          	sb	zero,56(s1)
    80001ec8:	02048ca3          	sb	zero,57(s1)
    80001ecc:	0404b023          	sd	zero,64(s1)
    {
        if (body != nullptr) {
    80001ed0:	00098463          	beqz	s3,80001ed8 <_ZN7_thread12createThreadEPPS_PFvPvES2_S2_b+0x98>
            if(t)
    80001ed4:	040b1463          	bnez	s6,80001f1c <_ZN7_thread12createThreadEPPS_PFvPvES2_S2_b+0xdc>
    80001ed8:	009a3023          	sd	s1,0(s4)
    if(*handle != nullptr)
    80001edc:	04048863          	beqz	s1,80001f2c <_ZN7_thread12createThreadEPPS_PFvPvES2_S2_b+0xec>
        return 0;
    80001ee0:	00000513          	li	a0,0
    else
        return -2;
}
    80001ee4:	03813083          	ld	ra,56(sp)
    80001ee8:	03013403          	ld	s0,48(sp)
    80001eec:	02813483          	ld	s1,40(sp)
    80001ef0:	02013903          	ld	s2,32(sp)
    80001ef4:	01813983          	ld	s3,24(sp)
    80001ef8:	01013a03          	ld	s4,16(sp)
    80001efc:	00813a83          	ld	s5,8(sp)
    80001f00:	00013b03          	ld	s6,0(sp)
    80001f04:	04010113          	addi	sp,sp,64
    80001f08:	00008067          	ret
            stack(body != nullptr ? (uint64*)stackk : nullptr),
    80001f0c:	00000913          	li	s2,0
    80001f10:	f85ff06f          	j	80001e94 <_ZN7_thread12createThreadEPPS_PFvPvES2_S2_b+0x54>
                     stack != nullptr ?  (uint64) &stack[DEFAULT_STACK_SIZE] : 0
    80001f14:	00000913          	li	s2,0
    80001f18:	f99ff06f          	j	80001eb0 <_ZN7_thread12createThreadEPPS_PFvPvES2_S2_b+0x70>
                Scheduler::put(this);
    80001f1c:	00048513          	mv	a0,s1
    80001f20:	00001097          	auipc	ra,0x1
    80001f24:	dec080e7          	jalr	-532(ra) # 80002d0c <_ZN9Scheduler3putEP7_thread>
    80001f28:	fb1ff06f          	j	80001ed8 <_ZN7_thread12createThreadEPPS_PFvPvES2_S2_b+0x98>
        return -2;
    80001f2c:	ffe00513          	li	a0,-2
    80001f30:	fb5ff06f          	j	80001ee4 <_ZN7_thread12createThreadEPPS_PFvPvES2_S2_b+0xa4>
    80001f34:	00050913          	mv	s2,a0
    *handle = new _thread(body, args, stack, t);
    80001f38:	00048513          	mv	a0,s1
    80001f3c:	00000097          	auipc	ra,0x0
    80001f40:	420080e7          	jalr	1056(ra) # 8000235c <_ZdlPv>
    80001f44:	00090513          	mv	a0,s2
    80001f48:	00008097          	auipc	ra,0x8
    80001f4c:	b00080e7          	jalr	-1280(ra) # 80009a48 <_Unwind_Resume>

0000000080001f50 <_ZN7_thread5yieldEv>:

void _thread::yield()
{
    80001f50:	ff010113          	addi	sp,sp,-16
    80001f54:	00813423          	sd	s0,8(sp)
    80001f58:	01010413          	addi	s0,sp,16
    __asm__ volatile ("ecall");
    80001f5c:	00000073          	ecall
}
    80001f60:	00813403          	ld	s0,8(sp)
    80001f64:	01010113          	addi	sp,sp,16
    80001f68:	00008067          	ret

0000000080001f6c <_ZN7_thread13threadWrapperEv>:

    _thread::contextSwitch(&old->context, &running->context);
}

void _thread::threadWrapper()
{
    80001f6c:	fe010113          	addi	sp,sp,-32
    80001f70:	00113c23          	sd	ra,24(sp)
    80001f74:	00813823          	sd	s0,16(sp)
    80001f78:	00913423          	sd	s1,8(sp)
    80001f7c:	02010413          	addi	s0,sp,32
    Riscv::popSppSpie();
    80001f80:	00000097          	auipc	ra,0x0
    80001f84:	5e0080e7          	jalr	1504(ra) # 80002560 <_ZN5Riscv10popSppSpieEv>
    running->body(_thread::running->args);
    80001f88:	00006497          	auipc	s1,0x6
    80001f8c:	75048493          	addi	s1,s1,1872 # 800086d8 <_ZN7_thread7runningE>
    80001f90:	0004b783          	ld	a5,0(s1)
    80001f94:	0007b703          	ld	a4,0(a5)
    80001f98:	0307b503          	ld	a0,48(a5)
    80001f9c:	000700e7          	jalr	a4
    running->setFinished(true);
    80001fa0:	0004b783          	ld	a5,0(s1)
    void setFinished(bool value) { finished = value; }
    80001fa4:	00100713          	li	a4,1
    80001fa8:	02e78423          	sb	a4,40(a5)
    printStringO("gotova nit");
    80001fac:	00005517          	auipc	a0,0x5
    80001fb0:	0ec50513          	addi	a0,a0,236 # 80007098 <CONSOLE_STATUS+0x88>
    80001fb4:	00001097          	auipc	ra,0x1
    80001fb8:	eb4080e7          	jalr	-332(ra) # 80002e68 <_Z12printStringOPKc>
    _thread::yield();
    80001fbc:	00000097          	auipc	ra,0x0
    80001fc0:	f94080e7          	jalr	-108(ra) # 80001f50 <_ZN7_thread5yieldEv>
}
    80001fc4:	01813083          	ld	ra,24(sp)
    80001fc8:	01013403          	ld	s0,16(sp)
    80001fcc:	00813483          	ld	s1,8(sp)
    80001fd0:	02010113          	addi	sp,sp,32
    80001fd4:	00008067          	ret

0000000080001fd8 <_ZN7_thread8dispatchEv>:
{
    80001fd8:	fe010113          	addi	sp,sp,-32
    80001fdc:	00113c23          	sd	ra,24(sp)
    80001fe0:	00813823          	sd	s0,16(sp)
    80001fe4:	00913423          	sd	s1,8(sp)
    80001fe8:	01213023          	sd	s2,0(sp)
    80001fec:	02010413          	addi	s0,sp,32
    _thread *old = running;
    80001ff0:	00006497          	auipc	s1,0x6
    80001ff4:	6e84b483          	ld	s1,1768(s1) # 800086d8 <_ZN7_thread7runningE>
    bool isFinished() const { return finished; }
    80001ff8:	0284c783          	lbu	a5,40(s1)
    if (!old->isFinished() && !old->blocked && !old->sleeping) {
    80001ffc:	00079a63          	bnez	a5,80002010 <_ZN7_thread8dispatchEv+0x38>
    80002000:	0384c703          	lbu	a4,56(s1)
    80002004:	00071663          	bnez	a4,80002010 <_ZN7_thread8dispatchEv+0x38>
    80002008:	0394c703          	lbu	a4,57(s1)
    8000200c:	04070c63          	beqz	a4,80002064 <_ZN7_thread8dispatchEv+0x8c>
    else if(!old->isFinished() && old->blocked && !old->sleeping){
    80002010:	06079063          	bnez	a5,80002070 <_ZN7_thread8dispatchEv+0x98>
    80002014:	0384c783          	lbu	a5,56(s1)
    80002018:	04078c63          	beqz	a5,80002070 <_ZN7_thread8dispatchEv+0x98>
    8000201c:	0394c783          	lbu	a5,57(s1)
    80002020:	04079863          	bnez	a5,80002070 <_ZN7_thread8dispatchEv+0x98>
        if(old->blockedBy != nullptr){
    80002024:	0404b503          	ld	a0,64(s1)
    80002028:	04050463          	beqz	a0,80002070 <_ZN7_thread8dispatchEv+0x98>
            old->blockedBy->blockedList().addLast(old);
    8000202c:	00001097          	auipc	ra,0x1
    80002030:	c18080e7          	jalr	-1000(ra) # 80002c44 <_ZN4_sem11blockedListEv>
    80002034:	00050913          	mv	s2,a0
        if (!tail) { tail = head; }
    }

    void addLast(T *data)
    {
        Elem *elem = new Elem(data, 0);
    80002038:	01800513          	li	a0,24
    8000203c:	00000097          	auipc	ra,0x0
    80002040:	2d0080e7          	jalr	720(ra) # 8000230c <_Znwm>
        Elem(T *data, Elem *next, int sleepTime = 0) : data(data), next(next), sleepTime(sleepTime) {}
    80002044:	00953023          	sd	s1,0(a0)
    80002048:	00053423          	sd	zero,8(a0)
    8000204c:	00052823          	sw	zero,16(a0)
        if (tail)
    80002050:	00893783          	ld	a5,8(s2)
    80002054:	04078a63          	beqz	a5,800020a8 <_ZN7_thread8dispatchEv+0xd0>
        {
            tail->next = elem;
    80002058:	00a7b423          	sd	a0,8(a5)
            tail = elem;
    8000205c:	00a93423          	sd	a0,8(s2)
    80002060:	0100006f          	j	80002070 <_ZN7_thread8dispatchEv+0x98>
        Scheduler::put(old);
    80002064:	00048513          	mv	a0,s1
    80002068:	00001097          	auipc	ra,0x1
    8000206c:	ca4080e7          	jalr	-860(ra) # 80002d0c <_ZN9Scheduler3putEP7_thread>
    running = Scheduler::get();
    80002070:	00001097          	auipc	ra,0x1
    80002074:	c34080e7          	jalr	-972(ra) # 80002ca4 <_ZN9Scheduler3getEv>
    80002078:	00006797          	auipc	a5,0x6
    8000207c:	66a7b023          	sd	a0,1632(a5) # 800086d8 <_ZN7_thread7runningE>
    _thread::contextSwitch(&old->context, &running->context);
    80002080:	01050593          	addi	a1,a0,16
    80002084:	01048513          	addi	a0,s1,16
    80002088:	fffff097          	auipc	ra,0xfffff
    8000208c:	0a8080e7          	jalr	168(ra) # 80001130 <_ZN7_thread13contextSwitchEPNS_7ContextES1_>
}
    80002090:	01813083          	ld	ra,24(sp)
    80002094:	01013403          	ld	s0,16(sp)
    80002098:	00813483          	ld	s1,8(sp)
    8000209c:	00013903          	ld	s2,0(sp)
    800020a0:	02010113          	addi	sp,sp,32
    800020a4:	00008067          	ret
        } else
        {
            head = tail = elem;
    800020a8:	00a93423          	sd	a0,8(s2)
    800020ac:	00a93023          	sd	a0,0(s2)
        }
    }
    800020b0:	fc1ff06f          	j	80002070 <_ZN7_thread8dispatchEv+0x98>

00000000800020b4 <_ZN7_thread10threadStopEv>:

int _thread::threadStop(){
    800020b4:	ff010113          	addi	sp,sp,-16
    800020b8:	00113423          	sd	ra,8(sp)
    800020bc:	00813023          	sd	s0,0(sp)
    800020c0:	01010413          	addi	s0,sp,16
    void setFinished(bool value) { finished = value; }
    800020c4:	00006797          	auipc	a5,0x6
    800020c8:	6147b783          	ld	a5,1556(a5) # 800086d8 <_ZN7_thread7runningE>
    800020cc:	00100713          	li	a4,1
    800020d0:	02e78423          	sb	a4,40(a5)
    running->setFinished(true);
    dispatch();
    800020d4:	00000097          	auipc	ra,0x0
    800020d8:	f04080e7          	jalr	-252(ra) # 80001fd8 <_ZN7_thread8dispatchEv>
//        return 0;
//    }
//    delete []running->stack;
//    nzm da se brise nit ili se samo zaustavlja
return 0;
}
    800020dc:	00000513          	li	a0,0
    800020e0:	00813083          	ld	ra,8(sp)
    800020e4:	00013403          	ld	s0,0(sp)
    800020e8:	01010113          	addi	sp,sp,16
    800020ec:	00008067          	ret

00000000800020f0 <_ZN7_thread5dblckEv>:

void _thread::dblck(){
    800020f0:	ff010113          	addi	sp,sp,-16
    800020f4:	00813423          	sd	s0,8(sp)
    800020f8:	01010413          	addi	s0,sp,16
    _thread::blocked = false;
    800020fc:	02050c23          	sb	zero,56(a0)
    _thread::blockedBy = nullptr;
    80002100:	04053023          	sd	zero,64(a0)
}
    80002104:	00813403          	ld	s0,8(sp)
    80002108:	01010113          	addi	sp,sp,16
    8000210c:	00008067          	ret

0000000080002110 <_ZN7_thread5sleepEm>:


int _thread::sleep(time_t time) {
    80002110:	fe010113          	addi	sp,sp,-32
    80002114:	00113c23          	sd	ra,24(sp)
    80002118:	00813823          	sd	s0,16(sp)
    8000211c:	00913423          	sd	s1,8(sp)
    80002120:	01213023          	sd	s2,0(sp)
    80002124:	02010413          	addi	s0,sp,32
    80002128:	00050493          	mv	s1,a0
    running->setSleep();
    8000212c:	00006917          	auipc	s2,0x6
    80002130:	5ac90913          	addi	s2,s2,1452 # 800086d8 <_ZN7_thread7runningE>
    80002134:	00093503          	ld	a0,0(s2)
    80002138:	00000097          	auipc	ra,0x0
    8000213c:	c00080e7          	jalr	-1024(ra) # 80001d38 <_ZN7_thread8setSleepEv>
    Riscv::sleepingThreads.addSleepingThread(running, time);
    80002140:	00093903          	ld	s2,0(s2)
    80002144:	0004849b          	sext.w	s1,s1
    {
        if (!tail) { return 0; }
        return tail->data;
    }
void addSleepingThread(T *data, int time){
        Elem *elem = new Elem(data);
    80002148:	01800513          	li	a0,24
    8000214c:	00000097          	auipc	ra,0x0
    80002150:	1c0080e7          	jalr	448(ra) # 8000230c <_Znwm>
        Elem(T *data) : data(data), next(nullptr), sleepTime(0) {}
    80002154:	01253023          	sd	s2,0(a0)
    80002158:	00053423          	sd	zero,8(a0)
    8000215c:	00052823          	sw	zero,16(a0)
        if(!head){
    80002160:	00006797          	auipc	a5,0x6
    80002164:	5087b783          	ld	a5,1288(a5) # 80008668 <_GLOBAL_OFFSET_TABLE_+0x50>
    80002168:	0007b783          	ld	a5,0(a5)
    8000216c:	00078863          	beqz	a5,8000217c <_ZN7_thread5sleepEm+0x6c>
            elem->sleepTime = time;
            tail = head;
            return;
        }
        int timeCount = 0;
        Elem *next = head, *prev = nullptr;
    80002170:	00000693          	li	a3,0
        int timeCount = 0;
    80002174:	00000713          	li	a4,0
    80002178:	0200006f          	j	80002198 <_ZN7_thread5sleepEm+0x88>
            head = elem;
    8000217c:	00006797          	auipc	a5,0x6
    80002180:	4ec7b783          	ld	a5,1260(a5) # 80008668 <_GLOBAL_OFFSET_TABLE_+0x50>
    80002184:	00a7b023          	sd	a0,0(a5)
            elem->sleepTime = time;
    80002188:	00952823          	sw	s1,16(a0)
            tail = head;
    8000218c:	00a7b423          	sd	a0,8(a5)
            return;
    80002190:	0500006f          	j	800021e0 <_ZN7_thread5sleepEm+0xd0>

        while(time >= timeCount + next->sleepTime){
             timeCount += next->sleepTime;
             prev= next;
             next = next->next;
    80002194:	00060793          	mv	a5,a2
        while(time >= timeCount + next->sleepTime){
    80002198:	0107a603          	lw	a2,16(a5)
    8000219c:	00070593          	mv	a1,a4
    800021a0:	00e6073b          	addw	a4,a2,a4
    800021a4:	00e4cc63          	blt	s1,a4,800021bc <_ZN7_thread5sleepEm+0xac>
             next = next->next;
    800021a8:	0087b603          	ld	a2,8(a5)
             prev= next;
    800021ac:	00078693          	mv	a3,a5
             if(next == nullptr)
    800021b0:	fe0612e3          	bnez	a2,80002194 <_ZN7_thread5sleepEm+0x84>
             next = next->next;
    800021b4:	00060793          	mv	a5,a2
             timeCount += next->sleepTime;
    800021b8:	00070593          	mv	a1,a4
                 break;
        }
        if(!prev){
    800021bc:	04068463          	beqz	a3,80002204 <_ZN7_thread5sleepEm+0xf4>
            head->next = next;
            head->sleepTime = time;
            head->next->sleepTime -=  head->sleepTime;
        }
        else {
            prev->next = elem;
    800021c0:	00a6b423          	sd	a0,8(a3) # 8008 <_entry-0x7fff7ff8>
            elem->next = next;
    800021c4:	00f53423          	sd	a5,8(a0)
            int diff = time - timeCount;
    800021c8:	40b484bb          	subw	s1,s1,a1
            elem->sleepTime = diff;
    800021cc:	00952823          	sw	s1,16(a0)
            if(next != nullptr)
    800021d0:	00078863          	beqz	a5,800021e0 <_ZN7_thread5sleepEm+0xd0>
                next->sleepTime -= diff;
    800021d4:	0107a703          	lw	a4,16(a5)
    800021d8:	409704bb          	subw	s1,a4,s1
    800021dc:	0097a823          	sw	s1,16(a5)
    dispatch();
    800021e0:	00000097          	auipc	ra,0x0
    800021e4:	df8080e7          	jalr	-520(ra) # 80001fd8 <_ZN7_thread8dispatchEv>
    return 0; //TODO povratna vrednost!!!
}
    800021e8:	00000513          	li	a0,0
    800021ec:	01813083          	ld	ra,24(sp)
    800021f0:	01013403          	ld	s0,16(sp)
    800021f4:	00813483          	ld	s1,8(sp)
    800021f8:	00013903          	ld	s2,0(sp)
    800021fc:	02010113          	addi	sp,sp,32
    80002200:	00008067          	ret
            head = elem;
    80002204:	00006717          	auipc	a4,0x6
    80002208:	46473703          	ld	a4,1124(a4) # 80008668 <_GLOBAL_OFFSET_TABLE_+0x50>
    8000220c:	00a73023          	sd	a0,0(a4)
            head->next = next;
    80002210:	00f53423          	sd	a5,8(a0)
            head->sleepTime = time;
    80002214:	00952823          	sw	s1,16(a0)
            head->next->sleepTime -=  head->sleepTime;
    80002218:	0107a703          	lw	a4,16(a5)
    8000221c:	409704bb          	subw	s1,a4,s1
    80002220:	0097a823          	sw	s1,16(a5)
    80002224:	fbdff06f          	j	800021e0 <_ZN7_thread5sleepEm+0xd0>

0000000080002228 <_ZN7_thread12consoleWriteEPv>:

void _thread::consoleWrite(void* t) {
    80002228:	ff010113          	addi	sp,sp,-16
    8000222c:	00113423          	sd	ra,8(sp)
    80002230:	00813023          	sd	s0,0(sp)
    80002234:	01010413          	addi	s0,sp,16
    {
        while(true){
            char c = Riscv::buff1.take();
    80002238:	00006517          	auipc	a0,0x6
    8000223c:	40853503          	ld	a0,1032(a0) # 80008640 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002240:	00001097          	auipc	ra,0x1
    80002244:	b70080e7          	jalr	-1168(ra) # 80002db0 <_ZN14KeyboardBuffer4takeEv>
            if((*((char*)CONSOLE_STATUS) & CONSOLE_TX_STATUS_BIT) && (Riscv::buff1.getCount() > 0)){
    80002248:	00006797          	auipc	a5,0x6
    8000224c:	3e07b783          	ld	a5,992(a5) # 80008628 <_GLOBAL_OFFSET_TABLE_+0x10>
    80002250:	0007b783          	ld	a5,0(a5)
    80002254:	0007c783          	lbu	a5,0(a5)
    80002258:	0207f793          	andi	a5,a5,32
    8000225c:	fc078ee3          	beqz	a5,80002238 <_ZN7_thread12consoleWriteEPv+0x10>
public:
    KeyboardBuffer() : head(0),tail(0),count(0) { _sem::createSem(&itemAvailable, 0);}
    char take ();
    void append (char c);
    _sem *itemAvailable;
    uint64 getCount() { return count; }
    80002260:	00006797          	auipc	a5,0x6
    80002264:	3e07b783          	ld	a5,992(a5) # 80008640 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002268:	1187b783          	ld	a5,280(a5)
    8000226c:	fc0786e3          	beqz	a5,80002238 <_ZN7_thread12consoleWriteEPv+0x10>
                *((char*)CONSOLE_TX_DATA) = c;
    80002270:	00006797          	auipc	a5,0x6
    80002274:	3e07b783          	ld	a5,992(a5) # 80008650 <_GLOBAL_OFFSET_TABLE_+0x38>
    80002278:	0007b783          	ld	a5,0(a5)
    8000227c:	00a78023          	sb	a0,0(a5)
    80002280:	fb9ff06f          	j	80002238 <_ZN7_thread12consoleWriteEPv+0x10>

0000000080002284 <_ZN7_thread12idleDeletionEv>:
        }

    }
}

void _thread::idleDeletion() {
    80002284:	fe010113          	addi	sp,sp,-32
    80002288:	00113c23          	sd	ra,24(sp)
    8000228c:	00813823          	sd	s0,16(sp)
    80002290:	00913423          	sd	s1,8(sp)
    80002294:	02010413          	addi	s0,sp,32
    80002298:	0340006f          	j	800022cc <_ZN7_thread12idleDeletionEv+0x48>
            pom = head;
    8000229c:	00006797          	auipc	a5,0x6
    800022a0:	3c47b783          	ld	a5,964(a5) # 80008660 <_GLOBAL_OFFSET_TABLE_+0x48>
    800022a4:	0007b703          	ld	a4,0(a5)
    800022a8:	00e7b823          	sd	a4,16(a5)
    800022ac:	0300006f          	j	800022dc <_ZN7_thread12idleDeletionEv+0x58>
    ~_thread() { delete[] stack; }
    800022b0:	00000097          	auipc	ra,0x0
    800022b4:	0d4080e7          	jalr	212(ra) # 80002384 <_ZdaPv>
    while(true){
        _thread *t = Scheduler::readyThreadQueue.traverseList();
        if(t->isFinished())
            delete t;
    800022b8:	00048513          	mv	a0,s1
    800022bc:	00000097          	auipc	ra,0x0
    800022c0:	0a0080e7          	jalr	160(ra) # 8000235c <_ZdlPv>
        dispatch();
    800022c4:	00000097          	auipc	ra,0x0
    800022c8:	d14080e7          	jalr	-748(ra) # 80001fd8 <_ZN7_thread8dispatchEv>
        if(pom == nullptr){
    800022cc:	00006797          	auipc	a5,0x6
    800022d0:	3947b783          	ld	a5,916(a5) # 80008660 <_GLOBAL_OFFSET_TABLE_+0x48>
    800022d4:	0107b783          	ld	a5,16(a5)
    800022d8:	fc0782e3          	beqz	a5,8000229c <_ZN7_thread12idleDeletionEv+0x18>
        Elem *t = pom;
    800022dc:	00006717          	auipc	a4,0x6
    800022e0:	38473703          	ld	a4,900(a4) # 80008660 <_GLOBAL_OFFSET_TABLE_+0x48>
    800022e4:	01073783          	ld	a5,16(a4)
        pom = pom->next;
    800022e8:	0087b683          	ld	a3,8(a5)
    800022ec:	00d73823          	sd	a3,16(a4)
        return t->data;
    800022f0:	0007b483          	ld	s1,0(a5)
    bool isFinished() const { return finished; }
    800022f4:	0284c783          	lbu	a5,40(s1)
        if(t->isFinished())
    800022f8:	fc0786e3          	beqz	a5,800022c4 <_ZN7_thread12idleDeletionEv+0x40>
            delete t;
    800022fc:	fc0484e3          	beqz	s1,800022c4 <_ZN7_thread12idleDeletionEv+0x40>
    ~_thread() { delete[] stack; }
    80002300:	0084b503          	ld	a0,8(s1)
    80002304:	fa0516e3          	bnez	a0,800022b0 <_ZN7_thread12idleDeletionEv+0x2c>
    80002308:	fb1ff06f          	j	800022b8 <_ZN7_thread12idleDeletionEv+0x34>

000000008000230c <_Znwm>:
#include "../h/print.hpp"

using size_t = decltype(sizeof(0));

void *operator new(size_t n)
{
    8000230c:	ff010113          	addi	sp,sp,-16
    80002310:	00113423          	sd	ra,8(sp)
    80002314:	00813023          	sd	s0,0(sp)
    80002318:	01010413          	addi	s0,sp,16
//    printString("new operator");
    return __mem_alloc(n);
    8000231c:	00004097          	auipc	ra,0x4
    80002320:	cec080e7          	jalr	-788(ra) # 80006008 <__mem_alloc>
}
    80002324:	00813083          	ld	ra,8(sp)
    80002328:	00013403          	ld	s0,0(sp)
    8000232c:	01010113          	addi	sp,sp,16
    80002330:	00008067          	ret

0000000080002334 <_Znam>:

void *operator new[](size_t n)
{
    80002334:	ff010113          	addi	sp,sp,-16
    80002338:	00113423          	sd	ra,8(sp)
    8000233c:	00813023          	sd	s0,0(sp)
    80002340:	01010413          	addi	s0,sp,16
    return __mem_alloc(n);
    80002344:	00004097          	auipc	ra,0x4
    80002348:	cc4080e7          	jalr	-828(ra) # 80006008 <__mem_alloc>
}
    8000234c:	00813083          	ld	ra,8(sp)
    80002350:	00013403          	ld	s0,0(sp)
    80002354:	01010113          	addi	sp,sp,16
    80002358:	00008067          	ret

000000008000235c <_ZdlPv>:

void operator delete(void *p) noexcept
{
    8000235c:	ff010113          	addi	sp,sp,-16
    80002360:	00113423          	sd	ra,8(sp)
    80002364:	00813023          	sd	s0,0(sp)
    80002368:	01010413          	addi	s0,sp,16
    __mem_free(p);
    8000236c:	00004097          	auipc	ra,0x4
    80002370:	bd0080e7          	jalr	-1072(ra) # 80005f3c <__mem_free>
}
    80002374:	00813083          	ld	ra,8(sp)
    80002378:	00013403          	ld	s0,0(sp)
    8000237c:	01010113          	addi	sp,sp,16
    80002380:	00008067          	ret

0000000080002384 <_ZdaPv>:

void operator delete[](void *p) noexcept
{
    80002384:	ff010113          	addi	sp,sp,-16
    80002388:	00113423          	sd	ra,8(sp)
    8000238c:	00813023          	sd	s0,0(sp)
    80002390:	01010413          	addi	s0,sp,16
    __mem_free(p);
    80002394:	00004097          	auipc	ra,0x4
    80002398:	ba8080e7          	jalr	-1112(ra) # 80005f3c <__mem_free>
    8000239c:	00813083          	ld	ra,8(sp)
    800023a0:	00013403          	ld	s0,0(sp)
    800023a4:	01010113          	addi	sp,sp,16
    800023a8:	00008067          	ret

00000000800023ac <_ZN14PeriodicThreadC1Em>:
// Created by os on 9/15/22.
//
//
#include "../h/syscall_cpp.hpp"

PeriodicThread::PeriodicThread(time_t period) : Thread(){
    800023ac:	fe010113          	addi	sp,sp,-32
    800023b0:	00113c23          	sd	ra,24(sp)
    800023b4:	00813823          	sd	s0,16(sp)
    800023b8:	00913423          	sd	s1,8(sp)
    800023bc:	01213023          	sd	s2,0(sp)
    800023c0:	02010413          	addi	s0,sp,32
    800023c4:	00050493          	mv	s1,a0
    800023c8:	00058913          	mv	s2,a1
    800023cc:	fffff097          	auipc	ra,0xfffff
    800023d0:	708080e7          	jalr	1800(ra) # 80001ad4 <_ZN6ThreadC1Ev>
    800023d4:	00006797          	auipc	a5,0x6
    800023d8:	20c78793          	addi	a5,a5,524 # 800085e0 <_ZTV14PeriodicThread+0x10>
    800023dc:	00f4b023          	sd	a5,0(s1)

    this->period = period;
    800023e0:	0124b823          	sd	s2,16(s1)
}
    800023e4:	01813083          	ld	ra,24(sp)
    800023e8:	01013403          	ld	s0,16(sp)
    800023ec:	00813483          	ld	s1,8(sp)
    800023f0:	00013903          	ld	s2,0(sp)
    800023f4:	02010113          	addi	sp,sp,32
    800023f8:	00008067          	ret

00000000800023fc <_ZN14PeriodicThread18periodicActivationEv>:
class PeriodicThread : public Thread {
private:
    time_t  period;
protected:
    PeriodicThread (time_t period);
    virtual void periodicActivation () {}
    800023fc:	ff010113          	addi	sp,sp,-16
    80002400:	00813423          	sd	s0,8(sp)
    80002404:	01010413          	addi	s0,sp,16
    80002408:	00813403          	ld	s0,8(sp)
    8000240c:	01010113          	addi	sp,sp,16
    80002410:	00008067          	ret

0000000080002414 <_ZN14PeriodicThread3runEv>:
    void run() override {
    80002414:	fe010113          	addi	sp,sp,-32
    80002418:	00113c23          	sd	ra,24(sp)
    8000241c:	00813823          	sd	s0,16(sp)
    80002420:	00913423          	sd	s1,8(sp)
    80002424:	02010413          	addi	s0,sp,32
    80002428:	00050493          	mv	s1,a0
        while (true) {
            periodicActivation();
    8000242c:	0004b783          	ld	a5,0(s1)
    80002430:	0187b783          	ld	a5,24(a5)
    80002434:	00048513          	mv	a0,s1
    80002438:	000780e7          	jalr	a5
            time_sleep(this->period);
    8000243c:	0104b503          	ld	a0,16(s1)
    80002440:	fffff097          	auipc	ra,0xfffff
    80002444:	01c080e7          	jalr	28(ra) # 8000145c <_Z10time_sleepm>
        while (true) {
    80002448:	fe5ff06f          	j	8000242c <_ZN14PeriodicThread3runEv+0x18>

000000008000244c <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    8000244c:	ff010113          	addi	sp,sp,-16
    80002450:	00113423          	sd	ra,8(sp)
    80002454:	00813023          	sd	s0,0(sp)
    80002458:	01010413          	addi	s0,sp,16
    8000245c:	00006797          	auipc	a5,0x6
    80002460:	18478793          	addi	a5,a5,388 # 800085e0 <_ZTV14PeriodicThread+0x10>
    80002464:	00f53023          	sd	a5,0(a0)
    80002468:	fffff097          	auipc	ra,0xfffff
    8000246c:	5c0080e7          	jalr	1472(ra) # 80001a28 <_ZN6ThreadD1Ev>
    80002470:	00813083          	ld	ra,8(sp)
    80002474:	00013403          	ld	s0,0(sp)
    80002478:	01010113          	addi	sp,sp,16
    8000247c:	00008067          	ret

0000000080002480 <_ZN14PeriodicThreadD0Ev>:
    80002480:	fe010113          	addi	sp,sp,-32
    80002484:	00113c23          	sd	ra,24(sp)
    80002488:	00813823          	sd	s0,16(sp)
    8000248c:	00913423          	sd	s1,8(sp)
    80002490:	02010413          	addi	s0,sp,32
    80002494:	00050493          	mv	s1,a0
    80002498:	00006797          	auipc	a5,0x6
    8000249c:	14878793          	addi	a5,a5,328 # 800085e0 <_ZTV14PeriodicThread+0x10>
    800024a0:	00f53023          	sd	a5,0(a0)
    800024a4:	fffff097          	auipc	ra,0xfffff
    800024a8:	584080e7          	jalr	1412(ra) # 80001a28 <_ZN6ThreadD1Ev>
    800024ac:	00048513          	mv	a0,s1
    800024b0:	00000097          	auipc	ra,0x0
    800024b4:	eac080e7          	jalr	-340(ra) # 8000235c <_ZdlPv>
    800024b8:	01813083          	ld	ra,24(sp)
    800024bc:	01013403          	ld	s0,16(sp)
    800024c0:	00813483          	ld	s1,8(sp)
    800024c4:	02010113          	addi	sp,sp,32
    800024c8:	00008067          	ret

00000000800024cc <_Z41__static_initialization_and_destruction_0ii>:
    }
        else
    {
        // unexpected trap cause
    }
    800024cc:	00100793          	li	a5,1
    800024d0:	00f50463          	beq	a0,a5,800024d8 <_Z41__static_initialization_and_destruction_0ii+0xc>
    800024d4:	00008067          	ret
    800024d8:	000107b7          	lui	a5,0x10
    800024dc:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    800024e0:	fef59ae3          	bne	a1,a5,800024d4 <_Z41__static_initialization_and_destruction_0ii+0x8>
    800024e4:	fe010113          	addi	sp,sp,-32
    800024e8:	00113c23          	sd	ra,24(sp)
    800024ec:	00813823          	sd	s0,16(sp)
    800024f0:	00913423          	sd	s1,8(sp)
    800024f4:	02010413          	addi	s0,sp,32
    };

    Elem *head, *tail, *pom = nullptr;

public:
    List() : head(0), tail(0) {}
    800024f8:	00006497          	auipc	s1,0x6
    800024fc:	1f048493          	addi	s1,s1,496 # 800086e8 <_ZN5Riscv15sleepingThreadsE>
    80002500:	0004b023          	sd	zero,0(s1)
    80002504:	0004b423          	sd	zero,8(s1)
    80002508:	0004b823          	sd	zero,16(s1)
    KeyboardBuffer() : head(0),tail(0),count(0) { _sem::createSem(&itemAvailable, 0);}
    8000250c:	1204b023          	sd	zero,288(s1)
    80002510:	1204b423          	sd	zero,296(s1)
    80002514:	1204b823          	sd	zero,304(s1)
    80002518:	00000593          	li	a1,0
    8000251c:	00006517          	auipc	a0,0x6
    80002520:	1e450513          	addi	a0,a0,484 # 80008700 <_ZN5Riscv5buff1E>
    80002524:	00000097          	auipc	ra,0x0
    80002528:	494080e7          	jalr	1172(ra) # 800029b8 <_ZN4_sem9createSemEPPS_m>
    8000252c:	2404b023          	sd	zero,576(s1)
    80002530:	2404b423          	sd	zero,584(s1)
    80002534:	2404b823          	sd	zero,592(s1)
    80002538:	00000593          	li	a1,0
    8000253c:	00006517          	auipc	a0,0x6
    80002540:	2e450513          	addi	a0,a0,740 # 80008820 <_ZN5Riscv5buff2E>
    80002544:	00000097          	auipc	ra,0x0
    80002548:	474080e7          	jalr	1140(ra) # 800029b8 <_ZN4_sem9createSemEPPS_m>
    8000254c:	01813083          	ld	ra,24(sp)
    80002550:	01013403          	ld	s0,16(sp)
    80002554:	00813483          	ld	s1,8(sp)
    80002558:	02010113          	addi	sp,sp,32
    8000255c:	00008067          	ret

0000000080002560 <_ZN5Riscv10popSppSpieEv>:
{
    80002560:	ff010113          	addi	sp,sp,-16
    80002564:	00813423          	sd	s0,8(sp)
    80002568:	01010413          	addi	s0,sp,16
    __asm__ volatile("csrw sepc, ra");
    8000256c:	14109073          	csrw	sepc,ra
    __asm__ volatile("sret");
    80002570:	10200073          	sret
}
    80002574:	00813403          	ld	s0,8(sp)
    80002578:	01010113          	addi	sp,sp,16
    8000257c:	00008067          	ret

0000000080002580 <_ZN5Riscv20handleSupervisorTrapEv>:
{
    80002580:	f9010113          	addi	sp,sp,-112
    80002584:	06113423          	sd	ra,104(sp)
    80002588:	06813023          	sd	s0,96(sp)
    8000258c:	04913c23          	sd	s1,88(sp)
    80002590:	07010413          	addi	s0,sp,112
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r"(scause));
    80002594:	142027f3          	csrr	a5,scause
    80002598:	faf43c23          	sd	a5,-72(s0)
    return scause;
    8000259c:	fb843703          	ld	a4,-72(s0)
    if (scause == 0x0000000000000008UL || scause == 0x0000000000000009UL)
    800025a0:	ff870693          	addi	a3,a4,-8
    800025a4:	00100793          	li	a5,1
    800025a8:	04d7f463          	bgeu	a5,a3,800025f0 <_ZN5Riscv20handleSupervisorTrapEv+0x70>
    else if (scause == 0x8000000000000001UL)
    800025ac:	fff00793          	li	a5,-1
    800025b0:	03f79793          	slli	a5,a5,0x3f
    800025b4:	00178793          	addi	a5,a5,1
    800025b8:	2af70a63          	beq	a4,a5,8000286c <_ZN5Riscv20handleSupervisorTrapEv+0x2ec>
    else if (scause == 0x8000000000000009UL) {
    800025bc:	fff00793          	li	a5,-1
    800025c0:	03f79793          	slli	a5,a5,0x3f
    800025c4:	00978793          	addi	a5,a5,9
    800025c8:	10f71463          	bne	a4,a5,800026d0 <_ZN5Riscv20handleSupervisorTrapEv+0x150>
        int irq = plic_claim();
    800025cc:	00002097          	auipc	ra,0x2
    800025d0:	108080e7          	jalr	264(ra) # 800046d4 <plic_claim>
    800025d4:	00050493          	mv	s1,a0
        if (irq == IRQ_CONSOLE)
    800025d8:	00a00793          	li	a5,10
    800025dc:	36f50463          	beq	a0,a5,80002944 <_ZN5Riscv20handleSupervisorTrapEv+0x3c4>
        plic_complete(irq);
    800025e0:	00048513          	mv	a0,s1
    800025e4:	00002097          	auipc	ra,0x2
    800025e8:	128080e7          	jalr	296(ra) # 8000470c <plic_complete>
    800025ec:	0e40006f          	j	800026d0 <_ZN5Riscv20handleSupervisorTrapEv+0x150>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    800025f0:	141027f3          	csrr	a5,sepc
    800025f4:	fcf43423          	sd	a5,-56(s0)
    return sepc;
    800025f8:	fc843783          	ld	a5,-56(s0)
        uint64 volatile sepc = r_sepc() + 4;
    800025fc:	00478793          	addi	a5,a5,4
    80002600:	f8f43c23          	sd	a5,-104(s0)
}

inline uint64 Riscv::r_sstatus()
{
    uint64 volatile sstatus;
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80002604:	100027f3          	csrr	a5,sstatus
    80002608:	fcf43023          	sd	a5,-64(s0)
    return sstatus;
    8000260c:	fc043783          	ld	a5,-64(s0)
        uint64 volatile sstatus = r_sstatus();
    80002610:	faf43023          	sd	a5,-96(s0)
        __asm__ volatile("mv %0, a0" : "=r" (code));
    80002614:	00050793          	mv	a5,a0
        if(code == 0x1) {
    80002618:	00100713          	li	a4,1
    8000261c:	08e78463          	beq	a5,a4,800026a4 <_ZN5Riscv20handleSupervisorTrapEv+0x124>
        }else if(code == 0x02) {
    80002620:	00200713          	li	a4,2
    80002624:	0ce78063          	beq	a5,a4,800026e4 <_ZN5Riscv20handleSupervisorTrapEv+0x164>
        }else if(code == 0x11){
    80002628:	01100713          	li	a4,17
    8000262c:	0ce78863          	beq	a5,a4,800026fc <_ZN5Riscv20handleSupervisorTrapEv+0x17c>
        }else if(code == 0x12){
    80002630:	01200713          	li	a4,18
    80002634:	0ee78c63          	beq	a5,a4,8000272c <_ZN5Riscv20handleSupervisorTrapEv+0x1ac>
        }else if(code == 0x13){
    80002638:	01300713          	li	a4,19
    8000263c:	10e78863          	beq	a5,a4,8000274c <_ZN5Riscv20handleSupervisorTrapEv+0x1cc>
        }else if(code == 0x21){
    80002640:	02100713          	li	a4,33
    80002644:	10e78c63          	beq	a5,a4,8000275c <_ZN5Riscv20handleSupervisorTrapEv+0x1dc>
        }else if(code == 0x22){
    80002648:	02200713          	li	a4,34
    8000264c:	12e78663          	beq	a5,a4,80002778 <_ZN5Riscv20handleSupervisorTrapEv+0x1f8>
        }else if(code == 0x23){
    80002650:	02300713          	li	a4,35
    80002654:	14e78a63          	beq	a5,a4,800027a8 <_ZN5Riscv20handleSupervisorTrapEv+0x228>
        }else if(code == 0x24){
    80002658:	02400713          	li	a4,36
    8000265c:	16e78263          	beq	a5,a4,800027c0 <_ZN5Riscv20handleSupervisorTrapEv+0x240>
        }else if(code == 0x31){
    80002660:	03100713          	li	a4,49
    80002664:	16e78a63          	beq	a5,a4,800027d8 <_ZN5Riscv20handleSupervisorTrapEv+0x258>
        }else if(code == 0x41){
    80002668:	04100713          	li	a4,65
    8000266c:	18e78263          	beq	a5,a4,800027f0 <_ZN5Riscv20handleSupervisorTrapEv+0x270>
        }else if(code == 0x42){
    80002670:	04200713          	li	a4,66
    80002674:	18e78a63          	beq	a5,a4,80002808 <_ZN5Riscv20handleSupervisorTrapEv+0x288>
        }else if(code == 0x43){
    80002678:	04300713          	li	a4,67
    8000267c:	1ae78663          	beq	a5,a4,80002828 <_ZN5Riscv20handleSupervisorTrapEv+0x2a8>
        }else if(code == 0x44){
    80002680:	04400713          	li	a4,68
    80002684:	1ce78a63          	beq	a5,a4,80002858 <_ZN5Riscv20handleSupervisorTrapEv+0x2d8>
            _thread::timeSliceCounter = 0;
    80002688:	00006797          	auipc	a5,0x6
    8000268c:	ff07b783          	ld	a5,-16(a5) # 80008678 <_GLOBAL_OFFSET_TABLE_+0x60>
    80002690:	0007b023          	sd	zero,0(a5)
            _thread::dispatch();
    80002694:	00000097          	auipc	ra,0x0
    80002698:	944080e7          	jalr	-1724(ra) # 80001fd8 <_ZN7_thread8dispatchEv>
    int ret = 0;
    8000269c:	00000513          	li	a0,0
    800026a0:	01c0006f          	j	800026bc <_ZN5Riscv20handleSupervisorTrapEv+0x13c>
            __asm__ volatile("mv %0, a1" : "=r" (x));
    800026a4:	00058513          	mv	a0,a1
            void* r = __mem_alloc(x);
    800026a8:	00651513          	slli	a0,a0,0x6
    800026ac:	00004097          	auipc	ra,0x4
    800026b0:	95c080e7          	jalr	-1700(ra) # 80006008 <__mem_alloc>
            __asm__ volatile("mv a0, %0" : : "r" (r));
    800026b4:	00050513          	mv	a0,a0
    int ret = 0;
    800026b8:	00000513          	li	a0,0
        w_sstatus(sstatus);
    800026bc:	fa043783          	ld	a5,-96(s0)
}

inline void Riscv::w_sstatus(uint64 sstatus)
{
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    800026c0:	10079073          	csrw	sstatus,a5
        w_sepc(sepc);
    800026c4:	f9843783          	ld	a5,-104(s0)
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    800026c8:	14179073          	csrw	sepc,a5
        __asm__ volatile("mv a0, %0" : : "r" (ret));
    800026cc:	00050513          	mv	a0,a0
    800026d0:	06813083          	ld	ra,104(sp)
    800026d4:	06013403          	ld	s0,96(sp)
    800026d8:	05813483          	ld	s1,88(sp)
    800026dc:	07010113          	addi	sp,sp,112
    800026e0:	00008067          	ret
            __asm__ volatile("mv %0, a1" : "=r" (x));
    800026e4:	00058513          	mv	a0,a1
            ret = __mem_free((void*)x);
    800026e8:	00004097          	auipc	ra,0x4
    800026ec:	854080e7          	jalr	-1964(ra) # 80005f3c <__mem_free>
            __asm__ volatile("mv a0, %0" : : "r" (ret));
    800026f0:	00050513          	mv	a0,a0
    int ret = 0;
    800026f4:	00000513          	li	a0,0
    800026f8:	fc5ff06f          	j	800026bc <_ZN5Riscv20handleSupervisorTrapEv+0x13c>
            __asm__ volatile("mv %0, a1" : "=r" (handle));
    800026fc:	00058513          	mv	a0,a1
            __asm__ volatile("mv %0, a2" : "=r" (body));
    80002700:	00060593          	mv	a1,a2
            __asm__ volatile("ld t2, 104(fp)");
    80002704:	06843383          	ld	t2,104(s0)
            __asm__ volatile("ld t3, 112(fp)");
    80002708:	07043e03          	ld	t3,112(s0)
            __asm__ volatile("mv %0, t2" : "=r" (args));
    8000270c:	00038613          	mv	a2,t2
            __asm__ volatile("mv %0, t3" : "=r" (stack));
    80002710:	000e0693          	mv	a3,t3
            int ret = _thread::createThread(handle, body, args, stack, true);
    80002714:	00100713          	li	a4,1
    80002718:	fffff097          	auipc	ra,0xfffff
    8000271c:	728080e7          	jalr	1832(ra) # 80001e40 <_ZN7_thread12createThreadEPPS_PFvPvES2_S2_b>
            __asm__ volatile("mv a0, %0" : : "r" (ret));
    80002720:	00050513          	mv	a0,a0
    int ret = 0;
    80002724:	00000513          	li	a0,0
    80002728:	f95ff06f          	j	800026bc <_ZN5Riscv20handleSupervisorTrapEv+0x13c>
            int ret = _thread::threadStop();
    8000272c:	00000097          	auipc	ra,0x0
    80002730:	988080e7          	jalr	-1656(ra) # 800020b4 <_ZN7_thread10threadStopEv>
            if(ret != 0)
    80002734:	00050863          	beqz	a0,80002744 <_ZN5Riscv20handleSupervisorTrapEv+0x1c4>
                __asm__ volatile("mv a0, %0" : : "r" (ret));
    80002738:	00050513          	mv	a0,a0
    int ret = 0;
    8000273c:	00000513          	li	a0,0
    80002740:	f7dff06f          	j	800026bc <_ZN5Riscv20handleSupervisorTrapEv+0x13c>
                __asm__ volatile("mv a0, zero");
    80002744:	00000513          	li	a0,0
    80002748:	f75ff06f          	j	800026bc <_ZN5Riscv20handleSupervisorTrapEv+0x13c>
            _thread::dispatch();
    8000274c:	00000097          	auipc	ra,0x0
    80002750:	88c080e7          	jalr	-1908(ra) # 80001fd8 <_ZN7_thread8dispatchEv>
    int ret = 0;
    80002754:	00000513          	li	a0,0
    80002758:	f65ff06f          	j	800026bc <_ZN5Riscv20handleSupervisorTrapEv+0x13c>
            __asm__ volatile("mv %0, a1" : "=r" (handle));
    8000275c:	00058513          	mv	a0,a1
            __asm__ volatile("mv %0, a2" : "=r" (init));
    80002760:	00060593          	mv	a1,a2
            int ret = _sem::createSem(handle, init);
    80002764:	00000097          	auipc	ra,0x0
    80002768:	254080e7          	jalr	596(ra) # 800029b8 <_ZN4_sem9createSemEPPS_m>
            __asm__ volatile("mv a0, %0" : : "r" (ret));
    8000276c:	00050513          	mv	a0,a0
    int ret = 0;
    80002770:	00000513          	li	a0,0
    80002774:	f49ff06f          	j	800026bc <_ZN5Riscv20handleSupervisorTrapEv+0x13c>
            __asm__ volatile("mv %0, a1" : "=r" (handle));
    80002778:	00058493          	mv	s1,a1
            delete handle; //TODO ??????????????????????????????????????
    8000277c:	00048e63          	beqz	s1,80002798 <_ZN5Riscv20handleSupervisorTrapEv+0x218>
    80002780:	00048513          	mv	a0,s1
    80002784:	00000097          	auipc	ra,0x0
    80002788:	29c080e7          	jalr	668(ra) # 80002a20 <_ZN4_semD1Ev>
    8000278c:	00048513          	mv	a0,s1
    80002790:	00000097          	auipc	ra,0x0
    80002794:	bcc080e7          	jalr	-1076(ra) # 8000235c <_ZdlPv>
            __asm__ volatile("mv a0, %0" : : "r" (ret));
    80002798:	00000793          	li	a5,0
    8000279c:	00078513          	mv	a0,a5
    int ret = 0;
    800027a0:	00000513          	li	a0,0
    800027a4:	f19ff06f          	j	800026bc <_ZN5Riscv20handleSupervisorTrapEv+0x13c>
            __asm__ volatile("mv %0, a1" : "=r" (handle));
    800027a8:	00058513          	mv	a0,a1
            int ret = handle->wait(); //TODO ?????????;
    800027ac:	00000097          	auipc	ra,0x0
    800027b0:	40c080e7          	jalr	1036(ra) # 80002bb8 <_ZN4_sem4waitEv>
            __asm__ volatile("mv a0, %0" : : "r" (ret));
    800027b4:	00050513          	mv	a0,a0
    int ret = 0;
    800027b8:	00000513          	li	a0,0
    800027bc:	f01ff06f          	j	800026bc <_ZN5Riscv20handleSupervisorTrapEv+0x13c>
            __asm__ volatile("mv %0, a1" : "=r" (id));
    800027c0:	00058513          	mv	a0,a1
            int ret = id->signal();
    800027c4:	00000097          	auipc	ra,0x0
    800027c8:	43c080e7          	jalr	1084(ra) # 80002c00 <_ZN4_sem6signalEv>
            __asm__ volatile("mv a0, %0" : : "r" (ret));
    800027cc:	00050513          	mv	a0,a0
    int ret = 0;
    800027d0:	00000513          	li	a0,0
    800027d4:	ee9ff06f          	j	800026bc <_ZN5Riscv20handleSupervisorTrapEv+0x13c>
            __asm__ volatile("mv %0, a1" : "=r" (time));
    800027d8:	00058513          	mv	a0,a1
            int ret = _thread::sleep(time);
    800027dc:	00000097          	auipc	ra,0x0
    800027e0:	934080e7          	jalr	-1740(ra) # 80002110 <_ZN7_thread5sleepEm>
            __asm__ volatile("mv a0, %0" : : "r" (ret));
    800027e4:	00050513          	mv	a0,a0
    int ret = 0;
    800027e8:	00000513          	li	a0,0
    800027ec:	ed1ff06f          	j	800026bc <_ZN5Riscv20handleSupervisorTrapEv+0x13c>
            ret = buff2.take();
    800027f0:	00006517          	auipc	a0,0x6
    800027f4:	03050513          	addi	a0,a0,48 # 80008820 <_ZN5Riscv5buff2E>
    800027f8:	00000097          	auipc	ra,0x0
    800027fc:	5b8080e7          	jalr	1464(ra) # 80002db0 <_ZN14KeyboardBuffer4takeEv>
    80002800:	0005051b          	sext.w	a0,a0
    80002804:	eb9ff06f          	j	800026bc <_ZN5Riscv20handleSupervisorTrapEv+0x13c>
            __asm__ volatile("mv %0, a1" : "=r" (c));
    80002808:	00058593          	mv	a1,a1
            buff1.append(c);
    8000280c:	0ff5f593          	andi	a1,a1,255
    80002810:	00006517          	auipc	a0,0x6
    80002814:	ef050513          	addi	a0,a0,-272 # 80008700 <_ZN5Riscv5buff1E>
    80002818:	00000097          	auipc	ra,0x0
    8000281c:	5f4080e7          	jalr	1524(ra) # 80002e0c <_ZN14KeyboardBuffer6appendEc>
    int ret = 0;
    80002820:	00000513          	li	a0,0
    80002824:	e99ff06f          	j	800026bc <_ZN5Riscv20handleSupervisorTrapEv+0x13c>
            __asm__ volatile("mv %0, a1" : "=r" (handle));
    80002828:	00058513          	mv	a0,a1
            __asm__ volatile("mv %0, a2" : "=r" (body));
    8000282c:	00060593          	mv	a1,a2
            __asm__ volatile("ld t2, 104(fp)");
    80002830:	06843383          	ld	t2,104(s0)
            __asm__ volatile("ld t3, 112(fp)");
    80002834:	07043e03          	ld	t3,112(s0)
            __asm__ volatile("mv %0, t2" : "=r" (args));
    80002838:	00038613          	mv	a2,t2
            __asm__ volatile("mv %0, t3" : "=r" (stack));
    8000283c:	000e0693          	mv	a3,t3
            int ret = _thread::createThread(handle, body, args, stack, false);
    80002840:	00000713          	li	a4,0
    80002844:	fffff097          	auipc	ra,0xfffff
    80002848:	5fc080e7          	jalr	1532(ra) # 80001e40 <_ZN7_thread12createThreadEPPS_PFvPvES2_S2_b>
            __asm__ volatile("mv a0, %0" : : "r" (ret));
    8000284c:	00050513          	mv	a0,a0
    int ret = 0;
    80002850:	00000513          	li	a0,0
    80002854:	e69ff06f          	j	800026bc <_ZN5Riscv20handleSupervisorTrapEv+0x13c>
            __asm__ volatile("mv %0, a1" : "=r" (handle));
    80002858:	00058513          	mv	a0,a1
        Scheduler::put(this);
    }

    void dblck();

    void start() { Scheduler::put(this); }
    8000285c:	00000097          	auipc	ra,0x0
    80002860:	4b0080e7          	jalr	1200(ra) # 80002d0c <_ZN9Scheduler3putEP7_thread>
    int ret = 0;
    80002864:	00000513          	li	a0,0
    80002868:	e55ff06f          	j	800026bc <_ZN5Riscv20handleSupervisorTrapEv+0x13c>
//            Scheduler::put(t);
        }
    }

    void sleepControl(){
        if(head != nullptr && --head->sleepTime == 0) //dekrementira vreme i radi proveru
    8000286c:	00006717          	auipc	a4,0x6
    80002870:	e7c73703          	ld	a4,-388(a4) # 800086e8 <_ZN5Riscv15sleepingThreadsE>
    80002874:	00070c63          	beqz	a4,8000288c <_ZN5Riscv20handleSupervisorTrapEv+0x30c>
    80002878:	01072783          	lw	a5,16(a4)
    8000287c:	fff7879b          	addiw	a5,a5,-1
    80002880:	0007869b          	sext.w	a3,a5
    80002884:	00f72823          	sw	a5,16(a4)
    80002888:	06068e63          	beqz	a3,80002904 <_ZN5Riscv20handleSupervisorTrapEv+0x384>
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"(mask));
    8000288c:	00200793          	li	a5,2
    80002890:	1447b073          	csrc	sip,a5
        _thread::timeSliceCounter++;
    80002894:	00006717          	auipc	a4,0x6
    80002898:	de473703          	ld	a4,-540(a4) # 80008678 <_GLOBAL_OFFSET_TABLE_+0x60>
    8000289c:	00073783          	ld	a5,0(a4)
    800028a0:	00178793          	addi	a5,a5,1
    800028a4:	00f73023          	sd	a5,0(a4)
        if (_thread::timeSliceCounter >= _thread::running->getTimeSlice())
    800028a8:	00006717          	auipc	a4,0x6
    800028ac:	d8873703          	ld	a4,-632(a4) # 80008630 <_GLOBAL_OFFSET_TABLE_+0x18>
    800028b0:	00073703          	ld	a4,0(a4)
    uint64 getTimeSlice() const { return timeSlice; }
    800028b4:	02073703          	ld	a4,32(a4)
    800028b8:	e0e7ece3          	bltu	a5,a4,800026d0 <_ZN5Riscv20handleSupervisorTrapEv+0x150>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    800028bc:	141027f3          	csrr	a5,sepc
    800028c0:	fcf43c23          	sd	a5,-40(s0)
    return sepc;
    800028c4:	fd843783          	ld	a5,-40(s0)
            uint64 volatile sepc = r_sepc();
    800028c8:	faf43423          	sd	a5,-88(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    800028cc:	100027f3          	csrr	a5,sstatus
    800028d0:	fcf43823          	sd	a5,-48(s0)
    return sstatus;
    800028d4:	fd043783          	ld	a5,-48(s0)
            uint64 volatile sstatus = r_sstatus();
    800028d8:	faf43823          	sd	a5,-80(s0)
            _thread::timeSliceCounter = 0;
    800028dc:	00006797          	auipc	a5,0x6
    800028e0:	d9c7b783          	ld	a5,-612(a5) # 80008678 <_GLOBAL_OFFSET_TABLE_+0x60>
    800028e4:	0007b023          	sd	zero,0(a5)
            _thread::dispatch();
    800028e8:	fffff097          	auipc	ra,0xfffff
    800028ec:	6f0080e7          	jalr	1776(ra) # 80001fd8 <_ZN7_thread8dispatchEv>
            w_sstatus(sstatus);
    800028f0:	fb043783          	ld	a5,-80(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    800028f4:	10079073          	csrw	sstatus,a5
            w_sepc(sepc);
    800028f8:	fa843783          	ld	a5,-88(s0)
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    800028fc:	14179073          	csrw	sepc,a5
}
    80002900:	dd1ff06f          	j	800026d0 <_ZN5Riscv20handleSupervisorTrapEv+0x150>
        while(head && head->sleepTime == 0){
    80002904:	00006797          	auipc	a5,0x6
    80002908:	de47b783          	ld	a5,-540(a5) # 800086e8 <_ZN5Riscv15sleepingThreadsE>
    8000290c:	f80780e3          	beqz	a5,8000288c <_ZN5Riscv20handleSupervisorTrapEv+0x30c>
    80002910:	0107a703          	lw	a4,16(a5)
    80002914:	f6071ce3          	bnez	a4,8000288c <_ZN5Riscv20handleSupervisorTrapEv+0x30c>
            t = head->data;
    80002918:	0007b483          	ld	s1,0(a5)
            head = head->next;
    8000291c:	0087b783          	ld	a5,8(a5)
    80002920:	00006717          	auipc	a4,0x6
    80002924:	dcf73423          	sd	a5,-568(a4) # 800086e8 <_ZN5Riscv15sleepingThreadsE>
            t->setSleep();
    80002928:	00048513          	mv	a0,s1
    8000292c:	fffff097          	auipc	ra,0xfffff
    80002930:	40c080e7          	jalr	1036(ra) # 80001d38 <_ZN7_thread8setSleepEv>
        Scheduler::put(this);
    80002934:	00048513          	mv	a0,s1
    80002938:	00000097          	auipc	ra,0x0
    8000293c:	3d4080e7          	jalr	980(ra) # 80002d0c <_ZN9Scheduler3putEP7_thread>
    }
    80002940:	fc5ff06f          	j	80002904 <_ZN5Riscv20handleSupervisorTrapEv+0x384>
            while (*((char*)CONSOLE_STATUS) & CONSOLE_RX_STATUS_BIT){
    80002944:	00006797          	auipc	a5,0x6
    80002948:	ce47b783          	ld	a5,-796(a5) # 80008628 <_GLOBAL_OFFSET_TABLE_+0x10>
    8000294c:	0007b783          	ld	a5,0(a5)
    80002950:	0007c783          	lbu	a5,0(a5)
    80002954:	0017f713          	andi	a4,a5,1
    80002958:	c80704e3          	beqz	a4,800025e0 <_ZN5Riscv20handleSupervisorTrapEv+0x60>
                __asm__ volatile("mv a1, %0" : : "r" (*((char*)CONSOLE_STATUS)));
    8000295c:	00078593          	mv	a1,a5
                char c = (*(char*)CONSOLE_RX_DATA);
    80002960:	00006797          	auipc	a5,0x6
    80002964:	cc07b783          	ld	a5,-832(a5) # 80008620 <_GLOBAL_OFFSET_TABLE_+0x8>
    80002968:	0007b783          	ld	a5,0(a5)
                buff2.append(c);
    8000296c:	0007c583          	lbu	a1,0(a5)
    80002970:	00006517          	auipc	a0,0x6
    80002974:	eb050513          	addi	a0,a0,-336 # 80008820 <_ZN5Riscv5buff2E>
    80002978:	00000097          	auipc	ra,0x0
    8000297c:	494080e7          	jalr	1172(ra) # 80002e0c <_ZN14KeyboardBuffer6appendEc>
            while (*((char*)CONSOLE_STATUS) & CONSOLE_RX_STATUS_BIT){
    80002980:	fc5ff06f          	j	80002944 <_ZN5Riscv20handleSupervisorTrapEv+0x3c4>

0000000080002984 <_GLOBAL__sub_I__ZN5Riscv15sleepingThreadsE>:
    80002984:	ff010113          	addi	sp,sp,-16
    80002988:	00113423          	sd	ra,8(sp)
    8000298c:	00813023          	sd	s0,0(sp)
    80002990:	01010413          	addi	s0,sp,16
    80002994:	000105b7          	lui	a1,0x10
    80002998:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    8000299c:	00100513          	li	a0,1
    800029a0:	00000097          	auipc	ra,0x0
    800029a4:	b2c080e7          	jalr	-1236(ra) # 800024cc <_Z41__static_initialization_and_destruction_0ii>
    800029a8:	00813083          	ld	ra,8(sp)
    800029ac:	00013403          	ld	s0,0(sp)
    800029b0:	01010113          	addi	sp,sp,16
    800029b4:	00008067          	ret

00000000800029b8 <_ZN4_sem9createSemEPPS_m>:
//}
//void unlock(){
//    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);
//}

int _sem::createSem(sem_t *handle, uint64 init){
    800029b8:	fe010113          	addi	sp,sp,-32
    800029bc:	00113c23          	sd	ra,24(sp)
    800029c0:	00813823          	sd	s0,16(sp)
    800029c4:	00913423          	sd	s1,8(sp)
    800029c8:	01213023          	sd	s2,0(sp)
    800029cc:	02010413          	addi	s0,sp,32
    800029d0:	00050493          	mv	s1,a0
    800029d4:	00058913          	mv	s2,a1
    *handle = new _sem(init);
    800029d8:	02000513          	li	a0,32
    800029dc:	00000097          	auipc	ra,0x0
    800029e0:	930080e7          	jalr	-1744(ra) # 8000230c <_Znwm>
    }
    friend class _thread;
    List<_thread>& blockedList();


    _sem(int val=1) : val(val) {}
    800029e4:	01252023          	sw	s2,0(a0)
    List() : head(0), tail(0) {}
    800029e8:	00053423          	sd	zero,8(a0)
    800029ec:	00053823          	sd	zero,16(a0)
    800029f0:	00053c23          	sd	zero,24(a0)
    800029f4:	00a4b023          	sd	a0,0(s1)
    if(*handle  != nullptr)
    800029f8:	02050063          	beqz	a0,80002a18 <_ZN4_sem9createSemEPPS_m+0x60>
        return 0;
    800029fc:	00000513          	li	a0,0
    else
        return -2;
}
    80002a00:	01813083          	ld	ra,24(sp)
    80002a04:	01013403          	ld	s0,16(sp)
    80002a08:	00813483          	ld	s1,8(sp)
    80002a0c:	00013903          	ld	s2,0(sp)
    80002a10:	02010113          	addi	sp,sp,32
    80002a14:	00008067          	ret
        return -2;
    80002a18:	ffe00513          	li	a0,-2
    80002a1c:	fe5ff06f          	j	80002a00 <_ZN4_sem9createSemEPPS_m+0x48>

0000000080002a20 <_ZN4_semD1Ev>:

_sem::~_sem() {
    80002a20:	fe010113          	addi	sp,sp,-32
    80002a24:	00113c23          	sd	ra,24(sp)
    80002a28:	00813823          	sd	s0,16(sp)
    80002a2c:	00913423          	sd	s1,8(sp)
    80002a30:	01213023          	sd	s2,0(sp)
    80002a34:	02010413          	addi	s0,sp,32
//    lock();
    _thread *t;
    t = blockedThreadQueue.removeLast();
    80002a38:	00850913          	addi	s2,a0,8
        if (!head) { return 0; }
    80002a3c:	00853483          	ld	s1,8(a0)
    80002a40:	06048863          	beqz	s1,80002ab0 <_ZN4_semD1Ev+0x90>
    80002a44:	00050693          	mv	a3,a0
        Elem *prev = 0;
    80002a48:	00000713          	li	a4,0
        for (Elem *curr = head; curr && curr != tail; curr = curr->next)
    80002a4c:	00048c63          	beqz	s1,80002a64 <_ZN4_semD1Ev+0x44>
    80002a50:	00893783          	ld	a5,8(s2)
    80002a54:	00f48863          	beq	s1,a5,80002a64 <_ZN4_semD1Ev+0x44>
            prev = curr;
    80002a58:	00048713          	mv	a4,s1
        for (Elem *curr = head; curr && curr != tail; curr = curr->next)
    80002a5c:	0084b483          	ld	s1,8(s1)
    80002a60:	fedff06f          	j	80002a4c <_ZN4_semD1Ev+0x2c>
        Elem *elem = tail;
    80002a64:	00893503          	ld	a0,8(s2)
        if (prev) { prev->next = 0; }
    80002a68:	02070063          	beqz	a4,80002a88 <_ZN4_semD1Ev+0x68>
    80002a6c:	00073423          	sd	zero,8(a4)
        tail = prev;
    80002a70:	00e93423          	sd	a4,8(s2)
        T *ret = elem->data;
    80002a74:	00053483          	ld	s1,0(a0)
        delete elem;
    80002a78:	02050c63          	beqz	a0,80002ab0 <_ZN4_semD1Ev+0x90>
    80002a7c:	00000097          	auipc	ra,0x0
    80002a80:	8e0080e7          	jalr	-1824(ra) # 8000235c <_ZdlPv>
    80002a84:	02c0006f          	j	80002ab0 <_ZN4_semD1Ev+0x90>
        else { head = 0; }
    80002a88:	0006b423          	sd	zero,8(a3)
    80002a8c:	fe5ff06f          	j	80002a70 <_ZN4_semD1Ev+0x50>
        Elem *elem = tail;
    80002a90:	00893503          	ld	a0,8(s2)
        if (prev) { prev->next = 0; }
    80002a94:	04078863          	beqz	a5,80002ae4 <_ZN4_semD1Ev+0xc4>
    80002a98:	0007b423          	sd	zero,8(a5)
        tail = prev;
    80002a9c:	00f93423          	sd	a5,8(s2)
        T *ret = elem->data;
    80002aa0:	00053483          	ld	s1,0(a0)
        delete elem;
    80002aa4:	00050663          	beqz	a0,80002ab0 <_ZN4_semD1Ev+0x90>
    80002aa8:	00000097          	auipc	ra,0x0
    80002aac:	8b4080e7          	jalr	-1868(ra) # 8000235c <_ZdlPv>
    while(t){
    80002ab0:	02048e63          	beqz	s1,80002aec <_ZN4_semD1Ev+0xcc>
        Scheduler::put(t);
    80002ab4:	00048513          	mv	a0,s1
    80002ab8:	00000097          	auipc	ra,0x0
    80002abc:	254080e7          	jalr	596(ra) # 80002d0c <_ZN9Scheduler3putEP7_thread>
        if (!head) { return 0; }
    80002ac0:	00093483          	ld	s1,0(s2)
    80002ac4:	fe0486e3          	beqz	s1,80002ab0 <_ZN4_semD1Ev+0x90>
        Elem *prev = 0;
    80002ac8:	00000793          	li	a5,0
        for (Elem *curr = head; curr && curr != tail; curr = curr->next)
    80002acc:	fc0482e3          	beqz	s1,80002a90 <_ZN4_semD1Ev+0x70>
    80002ad0:	00893703          	ld	a4,8(s2)
    80002ad4:	fae48ee3          	beq	s1,a4,80002a90 <_ZN4_semD1Ev+0x70>
            prev = curr;
    80002ad8:	00048793          	mv	a5,s1
        for (Elem *curr = head; curr && curr != tail; curr = curr->next)
    80002adc:	0084b483          	ld	s1,8(s1)
    80002ae0:	fedff06f          	j	80002acc <_ZN4_semD1Ev+0xac>
        else { head = 0; }
    80002ae4:	00093023          	sd	zero,0(s2)
    80002ae8:	fb5ff06f          	j	80002a9c <_ZN4_semD1Ev+0x7c>
        t = blockedThreadQueue.removeLast();
    }
//    unlock();
}
    80002aec:	01813083          	ld	ra,24(sp)
    80002af0:	01013403          	ld	s0,16(sp)
    80002af4:	00813483          	ld	s1,8(sp)
    80002af8:	00013903          	ld	s2,0(sp)
    80002afc:	02010113          	addi	sp,sp,32
    80002b00:	00008067          	ret

0000000080002b04 <_ZN4_sem5blockEv>:

void _sem::block() {
    80002b04:	ff010113          	addi	sp,sp,-16
    80002b08:	00113423          	sd	ra,8(sp)
    80002b0c:	00813023          	sd	s0,0(sp)
    80002b10:	01010413          	addi	s0,sp,16

    _thread::running->blocked  = true;
    80002b14:	00006797          	auipc	a5,0x6
    80002b18:	b1c7b783          	ld	a5,-1252(a5) # 80008630 <_GLOBAL_OFFSET_TABLE_+0x18>
    80002b1c:	0007b783          	ld	a5,0(a5)
    80002b20:	00100713          	li	a4,1
    80002b24:	02e78c23          	sb	a4,56(a5)
    _thread::running->blockedBy = this;
    80002b28:	04a7b023          	sd	a0,64(a5)
//    _thread::dispatch();
    thread_dispatch();
    80002b2c:	ffffe097          	auipc	ra,0xffffe
    80002b30:	7a4080e7          	jalr	1956(ra) # 800012d0 <_Z15thread_dispatchv>
    //pozvace se zamena konteksta, ako je blocked = true u dispach()-u ce se ubaciti nit u blocked que
}
    80002b34:	00813083          	ld	ra,8(sp)
    80002b38:	00013403          	ld	s0,0(sp)
    80002b3c:	01010113          	addi	sp,sp,16
    80002b40:	00008067          	ret

0000000080002b44 <_ZN4_sem7deblockEv>:

void _sem::deblock(){
    80002b44:	fe010113          	addi	sp,sp,-32
    80002b48:	00113c23          	sd	ra,24(sp)
    80002b4c:	00813823          	sd	s0,16(sp)
    80002b50:	00913423          	sd	s1,8(sp)
    80002b54:	02010413          	addi	s0,sp,32
    80002b58:	00050793          	mv	a5,a0
        if (!head) { return 0; }
    80002b5c:	00853503          	ld	a0,8(a0)
    80002b60:	04050863          	beqz	a0,80002bb0 <_ZN4_sem7deblockEv+0x6c>
        head = head->next;
    80002b64:	00853703          	ld	a4,8(a0)
    80002b68:	00e7b423          	sd	a4,8(a5)
        if (!head) { tail = 0; }
    80002b6c:	02070e63          	beqz	a4,80002ba8 <_ZN4_sem7deblockEv+0x64>
        T *ret = elem->data;
    80002b70:	00053483          	ld	s1,0(a0)
        delete elem;
    80002b74:	fffff097          	auipc	ra,0xfffff
    80002b78:	7e8080e7          	jalr	2024(ra) # 8000235c <_ZdlPv>
    _thread *t = blockedThreadQueue.removeFirst();
    t->dblck();
    80002b7c:	00048513          	mv	a0,s1
    80002b80:	fffff097          	auipc	ra,0xfffff
    80002b84:	570080e7          	jalr	1392(ra) # 800020f0 <_ZN7_thread5dblckEv>
    Scheduler::put(t);
    80002b88:	00048513          	mv	a0,s1
    80002b8c:	00000097          	auipc	ra,0x0
    80002b90:	180080e7          	jalr	384(ra) # 80002d0c <_ZN9Scheduler3putEP7_thread>
}
    80002b94:	01813083          	ld	ra,24(sp)
    80002b98:	01013403          	ld	s0,16(sp)
    80002b9c:	00813483          	ld	s1,8(sp)
    80002ba0:	02010113          	addi	sp,sp,32
    80002ba4:	00008067          	ret
        if (!head) { tail = 0; }
    80002ba8:	0007b823          	sd	zero,16(a5)
    80002bac:	fc5ff06f          	j	80002b70 <_ZN4_sem7deblockEv+0x2c>
        if (!head) { return 0; }
    80002bb0:	00050493          	mv	s1,a0
    80002bb4:	fc9ff06f          	j	80002b7c <_ZN4_sem7deblockEv+0x38>

0000000080002bb8 <_ZN4_sem4waitEv>:

int _sem::wait() {
//    lock();
    if(--val < 0)
    80002bb8:	00052783          	lw	a5,0(a0)
    80002bbc:	fff7879b          	addiw	a5,a5,-1
    80002bc0:	00f52023          	sw	a5,0(a0)
    80002bc4:	02079713          	slli	a4,a5,0x20
    80002bc8:	00074663          	bltz	a4,80002bd4 <_ZN4_sem4waitEv+0x1c>
        block();
//    unlock();
    return 0;
}
    80002bcc:	00000513          	li	a0,0
    80002bd0:	00008067          	ret
int _sem::wait() {
    80002bd4:	ff010113          	addi	sp,sp,-16
    80002bd8:	00113423          	sd	ra,8(sp)
    80002bdc:	00813023          	sd	s0,0(sp)
    80002be0:	01010413          	addi	s0,sp,16
        block();
    80002be4:	00000097          	auipc	ra,0x0
    80002be8:	f20080e7          	jalr	-224(ra) # 80002b04 <_ZN4_sem5blockEv>
}
    80002bec:	00000513          	li	a0,0
    80002bf0:	00813083          	ld	ra,8(sp)
    80002bf4:	00013403          	ld	s0,0(sp)
    80002bf8:	01010113          	addi	sp,sp,16
    80002bfc:	00008067          	ret

0000000080002c00 <_ZN4_sem6signalEv>:

int _sem::signal() {
//    lock();
    if(val++ < 0)
    80002c00:	00052783          	lw	a5,0(a0)
    80002c04:	0017871b          	addiw	a4,a5,1
    80002c08:	00e52023          	sw	a4,0(a0)
    80002c0c:	0007c663          	bltz	a5,80002c18 <_ZN4_sem6signalEv+0x18>
        deblock();
//    unlock();
    return 0;
}
    80002c10:	00000513          	li	a0,0
    80002c14:	00008067          	ret
int _sem::signal() {
    80002c18:	ff010113          	addi	sp,sp,-16
    80002c1c:	00113423          	sd	ra,8(sp)
    80002c20:	00813023          	sd	s0,0(sp)
    80002c24:	01010413          	addi	s0,sp,16
        deblock();
    80002c28:	00000097          	auipc	ra,0x0
    80002c2c:	f1c080e7          	jalr	-228(ra) # 80002b44 <_ZN4_sem7deblockEv>
}
    80002c30:	00000513          	li	a0,0
    80002c34:	00813083          	ld	ra,8(sp)
    80002c38:	00013403          	ld	s0,0(sp)
    80002c3c:	01010113          	addi	sp,sp,16
    80002c40:	00008067          	ret

0000000080002c44 <_ZN4_sem11blockedListEv>:

List<_thread>& _sem::blockedList(){
    80002c44:	ff010113          	addi	sp,sp,-16
    80002c48:	00813423          	sd	s0,8(sp)
    80002c4c:	01010413          	addi	s0,sp,16
    return _sem::blockedThreadQueue;
}
    80002c50:	00850513          	addi	a0,a0,8
    80002c54:	00813403          	ld	s0,8(sp)
    80002c58:	01010113          	addi	sp,sp,16
    80002c5c:	00008067          	ret

0000000080002c60 <_Z41__static_initialization_and_destruction_0ii>:
}

void Scheduler::put(_thread *ccb)
{
    readyThreadQueue.addLast(ccb);
    80002c60:	ff010113          	addi	sp,sp,-16
    80002c64:	00813423          	sd	s0,8(sp)
    80002c68:	01010413          	addi	s0,sp,16
    80002c6c:	00100793          	li	a5,1
    80002c70:	00f50863          	beq	a0,a5,80002c80 <_Z41__static_initialization_and_destruction_0ii+0x20>
    80002c74:	00813403          	ld	s0,8(sp)
    80002c78:	01010113          	addi	sp,sp,16
    80002c7c:	00008067          	ret
    80002c80:	000107b7          	lui	a5,0x10
    80002c84:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80002c88:	fef596e3          	bne	a1,a5,80002c74 <_Z41__static_initialization_and_destruction_0ii+0x14>
    List() : head(0), tail(0) {}
    80002c8c:	00006797          	auipc	a5,0x6
    80002c90:	cbc78793          	addi	a5,a5,-836 # 80008948 <_ZN9Scheduler16readyThreadQueueE>
    80002c94:	0007b023          	sd	zero,0(a5)
    80002c98:	0007b423          	sd	zero,8(a5)
    80002c9c:	0007b823          	sd	zero,16(a5)
    80002ca0:	fd5ff06f          	j	80002c74 <_Z41__static_initialization_and_destruction_0ii+0x14>

0000000080002ca4 <_ZN9Scheduler3getEv>:
{
    80002ca4:	fe010113          	addi	sp,sp,-32
    80002ca8:	00113c23          	sd	ra,24(sp)
    80002cac:	00813823          	sd	s0,16(sp)
    80002cb0:	00913423          	sd	s1,8(sp)
    80002cb4:	02010413          	addi	s0,sp,32
        if (!head) { return 0; }
    80002cb8:	00006517          	auipc	a0,0x6
    80002cbc:	c9053503          	ld	a0,-880(a0) # 80008948 <_ZN9Scheduler16readyThreadQueueE>
    80002cc0:	04050263          	beqz	a0,80002d04 <_ZN9Scheduler3getEv+0x60>
        head = head->next;
    80002cc4:	00853783          	ld	a5,8(a0)
    80002cc8:	00006717          	auipc	a4,0x6
    80002ccc:	c8f73023          	sd	a5,-896(a4) # 80008948 <_ZN9Scheduler16readyThreadQueueE>
        if (!head) { tail = 0; }
    80002cd0:	02078463          	beqz	a5,80002cf8 <_ZN9Scheduler3getEv+0x54>
        T *ret = elem->data;
    80002cd4:	00053483          	ld	s1,0(a0)
        delete elem;
    80002cd8:	fffff097          	auipc	ra,0xfffff
    80002cdc:	684080e7          	jalr	1668(ra) # 8000235c <_ZdlPv>
}
    80002ce0:	00048513          	mv	a0,s1
    80002ce4:	01813083          	ld	ra,24(sp)
    80002ce8:	01013403          	ld	s0,16(sp)
    80002cec:	00813483          	ld	s1,8(sp)
    80002cf0:	02010113          	addi	sp,sp,32
    80002cf4:	00008067          	ret
        if (!head) { tail = 0; }
    80002cf8:	00006797          	auipc	a5,0x6
    80002cfc:	c407bc23          	sd	zero,-936(a5) # 80008950 <_ZN9Scheduler16readyThreadQueueE+0x8>
    80002d00:	fd5ff06f          	j	80002cd4 <_ZN9Scheduler3getEv+0x30>
        if (!head) { return 0; }
    80002d04:	00050493          	mv	s1,a0
    return readyThreadQueue.removeFirst();
    80002d08:	fd9ff06f          	j	80002ce0 <_ZN9Scheduler3getEv+0x3c>

0000000080002d0c <_ZN9Scheduler3putEP7_thread>:
{
    80002d0c:	fe010113          	addi	sp,sp,-32
    80002d10:	00113c23          	sd	ra,24(sp)
    80002d14:	00813823          	sd	s0,16(sp)
    80002d18:	00913423          	sd	s1,8(sp)
    80002d1c:	02010413          	addi	s0,sp,32
    80002d20:	00050493          	mv	s1,a0
        Elem *elem = new Elem(data, 0);
    80002d24:	01800513          	li	a0,24
    80002d28:	fffff097          	auipc	ra,0xfffff
    80002d2c:	5e4080e7          	jalr	1508(ra) # 8000230c <_Znwm>
        Elem(T *data, Elem *next, int sleepTime = 0) : data(data), next(next), sleepTime(sleepTime) {}
    80002d30:	00953023          	sd	s1,0(a0)
    80002d34:	00053423          	sd	zero,8(a0)
    80002d38:	00052823          	sw	zero,16(a0)
        if (tail)
    80002d3c:	00006797          	auipc	a5,0x6
    80002d40:	c147b783          	ld	a5,-1004(a5) # 80008950 <_ZN9Scheduler16readyThreadQueueE+0x8>
    80002d44:	02078263          	beqz	a5,80002d68 <_ZN9Scheduler3putEP7_thread+0x5c>
            tail->next = elem;
    80002d48:	00a7b423          	sd	a0,8(a5)
            tail = elem;
    80002d4c:	00006797          	auipc	a5,0x6
    80002d50:	c0a7b223          	sd	a0,-1020(a5) # 80008950 <_ZN9Scheduler16readyThreadQueueE+0x8>
    80002d54:	01813083          	ld	ra,24(sp)
    80002d58:	01013403          	ld	s0,16(sp)
    80002d5c:	00813483          	ld	s1,8(sp)
    80002d60:	02010113          	addi	sp,sp,32
    80002d64:	00008067          	ret
            head = tail = elem;
    80002d68:	00006797          	auipc	a5,0x6
    80002d6c:	be078793          	addi	a5,a5,-1056 # 80008948 <_ZN9Scheduler16readyThreadQueueE>
    80002d70:	00a7b423          	sd	a0,8(a5)
    80002d74:	00a7b023          	sd	a0,0(a5)
    80002d78:	fddff06f          	j	80002d54 <_ZN9Scheduler3putEP7_thread+0x48>

0000000080002d7c <_GLOBAL__sub_I__ZN9Scheduler16readyThreadQueueE>:
    80002d7c:	ff010113          	addi	sp,sp,-16
    80002d80:	00113423          	sd	ra,8(sp)
    80002d84:	00813023          	sd	s0,0(sp)
    80002d88:	01010413          	addi	s0,sp,16
    80002d8c:	000105b7          	lui	a1,0x10
    80002d90:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    80002d94:	00100513          	li	a0,1
    80002d98:	00000097          	auipc	ra,0x0
    80002d9c:	ec8080e7          	jalr	-312(ra) # 80002c60 <_Z41__static_initialization_and_destruction_0ii>
    80002da0:	00813083          	ld	ra,8(sp)
    80002da4:	00013403          	ld	s0,0(sp)
    80002da8:	01010113          	addi	sp,sp,16
    80002dac:	00008067          	ret

0000000080002db0 <_ZN14KeyboardBuffer4takeEv>:
//    static KeyboardBuffer _instance;
//    return &_instance;
//}

//imlementacija uzeta iz zadatka sa klk3
char KeyboardBuffer::take () {
    80002db0:	fe010113          	addi	sp,sp,-32
    80002db4:	00113c23          	sd	ra,24(sp)
    80002db8:	00813823          	sd	s0,16(sp)
    80002dbc:	00913423          	sd	s1,8(sp)
    80002dc0:	02010413          	addi	s0,sp,32
    80002dc4:	00050493          	mv	s1,a0
    itemAvailable->wait();
    80002dc8:	00053503          	ld	a0,0(a0)
    80002dcc:	00000097          	auipc	ra,0x0
    80002dd0:	dec080e7          	jalr	-532(ra) # 80002bb8 <_ZN4_sem4waitEv>
//    kbint_mask();
    char c = buffer[head];
    80002dd4:	1084b783          	ld	a5,264(s1)
    80002dd8:	00f48733          	add	a4,s1,a5
    80002ddc:	00874503          	lbu	a0,8(a4)
    head = (head+1)%KB_SIZE;
    80002de0:	00178793          	addi	a5,a5,1
    80002de4:	0ff7f793          	andi	a5,a5,255
    80002de8:	10f4b423          	sd	a5,264(s1)
    count--;
    80002dec:	1184b783          	ld	a5,280(s1)
    80002df0:	fff78793          	addi	a5,a5,-1
    80002df4:	10f4bc23          	sd	a5,280(s1)
//    kbint_unmask();
    return c;
}
    80002df8:	01813083          	ld	ra,24(sp)
    80002dfc:	01013403          	ld	s0,16(sp)
    80002e00:	00813483          	ld	s1,8(sp)
    80002e04:	02010113          	addi	sp,sp,32
    80002e08:	00008067          	ret

0000000080002e0c <_ZN14KeyboardBuffer6appendEc>:
void KeyboardBuffer::append (char c) {
    if (count<KB_SIZE) {
    80002e0c:	11853783          	ld	a5,280(a0)
    80002e10:	0ff00713          	li	a4,255
    80002e14:	00f77463          	bgeu	a4,a5,80002e1c <_ZN14KeyboardBuffer6appendEc+0x10>
    80002e18:	00008067          	ret
void KeyboardBuffer::append (char c) {
    80002e1c:	ff010113          	addi	sp,sp,-16
    80002e20:	00113423          	sd	ra,8(sp)
    80002e24:	00813023          	sd	s0,0(sp)
    80002e28:	01010413          	addi	s0,sp,16
        buffer[tail] = c;
    80002e2c:	11053703          	ld	a4,272(a0)
    80002e30:	00e506b3          	add	a3,a0,a4
    80002e34:	00b68423          	sb	a1,8(a3)
        tail = (tail+1)%KB_SIZE;
    80002e38:	00170713          	addi	a4,a4,1
    80002e3c:	0ff77713          	andi	a4,a4,255
    80002e40:	10e53823          	sd	a4,272(a0)
        count++;
    80002e44:	00178793          	addi	a5,a5,1
    80002e48:	10f53c23          	sd	a5,280(a0)
        itemAvailable->signal();
    80002e4c:	00053503          	ld	a0,0(a0)
    80002e50:	00000097          	auipc	ra,0x0
    80002e54:	db0080e7          	jalr	-592(ra) # 80002c00 <_ZN4_sem6signalEv>
    }
    80002e58:	00813083          	ld	ra,8(sp)
    80002e5c:	00013403          	ld	s0,0(sp)
    80002e60:	01010113          	addi	sp,sp,16
    80002e64:	00008067          	ret

0000000080002e68 <_Z12printStringOPKc>:
#include "../h/print.hpp"
#include "../h/riscv.hpp"
//#include "../lib/console.h"

void printStringO(char const *string)
{
    80002e68:	fd010113          	addi	sp,sp,-48
    80002e6c:	02113423          	sd	ra,40(sp)
    80002e70:	02813023          	sd	s0,32(sp)
    80002e74:	00913c23          	sd	s1,24(sp)
    80002e78:	01213823          	sd	s2,16(sp)
    80002e7c:	03010413          	addi	s0,sp,48
    80002e80:	00050493          	mv	s1,a0
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80002e84:	100027f3          	csrr	a5,sstatus
    80002e88:	fcf43c23          	sd	a5,-40(s0)
    return sstatus;
    80002e8c:	fd843903          	ld	s2,-40(s0)
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    80002e90:	00200793          	li	a5,2
    80002e94:	1007b073          	csrc	sstatus,a5
    uint64 sstatus = Riscv::r_sstatus();
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    while (*string != '\0')
    80002e98:	0004c503          	lbu	a0,0(s1)
    80002e9c:	00050a63          	beqz	a0,80002eb0 <_Z12printStringOPKc+0x48>
    {
        putc(*string);
    80002ea0:	ffffe097          	auipc	ra,0xffffe
    80002ea4:	618080e7          	jalr	1560(ra) # 800014b8 <_Z4putcc>
        string++;
    80002ea8:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80002eac:	fedff06f          	j	80002e98 <_Z12printStringOPKc+0x30>
    }
    Riscv::ms_sstatus(sstatus & Riscv::SSTATUS_SIE ? Riscv::SSTATUS_SIE : 0);
    80002eb0:	0009091b          	sext.w	s2,s2
    80002eb4:	00297913          	andi	s2,s2,2
    80002eb8:	0009091b          	sext.w	s2,s2
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    80002ebc:	10092073          	csrs	sstatus,s2
}
    80002ec0:	02813083          	ld	ra,40(sp)
    80002ec4:	02013403          	ld	s0,32(sp)
    80002ec8:	01813483          	ld	s1,24(sp)
    80002ecc:	01013903          	ld	s2,16(sp)
    80002ed0:	03010113          	addi	sp,sp,48
    80002ed4:	00008067          	ret

0000000080002ed8 <_Z12printIntegerm>:

void printInteger(uint64 integer)
{
    80002ed8:	fc010113          	addi	sp,sp,-64
    80002edc:	02113c23          	sd	ra,56(sp)
    80002ee0:	02813823          	sd	s0,48(sp)
    80002ee4:	02913423          	sd	s1,40(sp)
    80002ee8:	03213023          	sd	s2,32(sp)
    80002eec:	04010413          	addi	s0,sp,64
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80002ef0:	100027f3          	csrr	a5,sstatus
    80002ef4:	fcf43423          	sd	a5,-56(s0)
    return sstatus;
    80002ef8:	fc843903          	ld	s2,-56(s0)
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    80002efc:	00200793          	li	a5,2
    80002f00:	1007b073          	csrc	sstatus,a5
    {
        neg = 1;
        x = -integer;
    } else
    {
        x = integer;
    80002f04:	0005051b          	sext.w	a0,a0
    }

    i = 0;
    80002f08:	00000493          	li	s1,0
    do
    {
        buf[i++] = digits[x % 10];
    80002f0c:	00a00613          	li	a2,10
    80002f10:	02c5773b          	remuw	a4,a0,a2
    80002f14:	02071693          	slli	a3,a4,0x20
    80002f18:	0206d693          	srli	a3,a3,0x20
    80002f1c:	00004717          	auipc	a4,0x4
    80002f20:	18c70713          	addi	a4,a4,396 # 800070a8 <_ZZ12printIntegermE6digits>
    80002f24:	00d70733          	add	a4,a4,a3
    80002f28:	00074703          	lbu	a4,0(a4)
    80002f2c:	fe040693          	addi	a3,s0,-32
    80002f30:	009687b3          	add	a5,a3,s1
    80002f34:	0014849b          	addiw	s1,s1,1
    80002f38:	fee78823          	sb	a4,-16(a5)
    } while ((x /= 10) != 0);
    80002f3c:	0005071b          	sext.w	a4,a0
    80002f40:	02c5553b          	divuw	a0,a0,a2
    80002f44:	00900793          	li	a5,9
    80002f48:	fce7e2e3          	bltu	a5,a4,80002f0c <_Z12printIntegerm+0x34>
    if (neg)
        buf[i++] = '-';

    while (--i >= 0) { putc(buf[i]); }
    80002f4c:	fff4849b          	addiw	s1,s1,-1
    80002f50:	0004ce63          	bltz	s1,80002f6c <_Z12printIntegerm+0x94>
    80002f54:	fe040793          	addi	a5,s0,-32
    80002f58:	009787b3          	add	a5,a5,s1
    80002f5c:	ff07c503          	lbu	a0,-16(a5)
    80002f60:	ffffe097          	auipc	ra,0xffffe
    80002f64:	558080e7          	jalr	1368(ra) # 800014b8 <_Z4putcc>
    80002f68:	fe5ff06f          	j	80002f4c <_Z12printIntegerm+0x74>
    Riscv::ms_sstatus(sstatus & Riscv::SSTATUS_SIE ? Riscv::SSTATUS_SIE : 0);
    80002f6c:	0009091b          	sext.w	s2,s2
    80002f70:	00297913          	andi	s2,s2,2
    80002f74:	0009091b          	sext.w	s2,s2
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    80002f78:	10092073          	csrs	sstatus,s2
    80002f7c:	03813083          	ld	ra,56(sp)
    80002f80:	03013403          	ld	s0,48(sp)
    80002f84:	02813483          	ld	s1,40(sp)
    80002f88:	02013903          	ld	s2,32(sp)
    80002f8c:	04010113          	addi	sp,sp,64
    80002f90:	00008067          	ret

0000000080002f94 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1))
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    80002f94:	fe010113          	addi	sp,sp,-32
    80002f98:	00113c23          	sd	ra,24(sp)
    80002f9c:	00813823          	sd	s0,16(sp)
    80002fa0:	00913423          	sd	s1,8(sp)
    80002fa4:	02010413          	addi	s0,sp,32
    80002fa8:	00050493          	mv	s1,a0
    LOCK();
    80002fac:	00100613          	li	a2,1
    80002fb0:	00000593          	li	a1,0
    80002fb4:	00006517          	auipc	a0,0x6
    80002fb8:	9ac50513          	addi	a0,a0,-1620 # 80008960 <lockPrint>
    80002fbc:	ffffe097          	auipc	ra,0xffffe
    80002fc0:	188080e7          	jalr	392(ra) # 80001144 <copy_and_swap>
    80002fc4:	fe0514e3          	bnez	a0,80002fac <_Z11printStringPKc+0x18>
    while (*string != '\0')
    80002fc8:	0004c503          	lbu	a0,0(s1)
    80002fcc:	00050a63          	beqz	a0,80002fe0 <_Z11printStringPKc+0x4c>
    {
        putc(*string);
    80002fd0:	ffffe097          	auipc	ra,0xffffe
    80002fd4:	4e8080e7          	jalr	1256(ra) # 800014b8 <_Z4putcc>
        string++;
    80002fd8:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80002fdc:	fedff06f          	j	80002fc8 <_Z11printStringPKc+0x34>
    }
    UNLOCK();
    80002fe0:	00000613          	li	a2,0
    80002fe4:	00100593          	li	a1,1
    80002fe8:	00006517          	auipc	a0,0x6
    80002fec:	97850513          	addi	a0,a0,-1672 # 80008960 <lockPrint>
    80002ff0:	ffffe097          	auipc	ra,0xffffe
    80002ff4:	154080e7          	jalr	340(ra) # 80001144 <copy_and_swap>
    80002ff8:	fe0514e3          	bnez	a0,80002fe0 <_Z11printStringPKc+0x4c>
}
    80002ffc:	01813083          	ld	ra,24(sp)
    80003000:	01013403          	ld	s0,16(sp)
    80003004:	00813483          	ld	s1,8(sp)
    80003008:	02010113          	addi	sp,sp,32
    8000300c:	00008067          	ret

0000000080003010 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80003010:	fd010113          	addi	sp,sp,-48
    80003014:	02113423          	sd	ra,40(sp)
    80003018:	02813023          	sd	s0,32(sp)
    8000301c:	00913c23          	sd	s1,24(sp)
    80003020:	01213823          	sd	s2,16(sp)
    80003024:	01313423          	sd	s3,8(sp)
    80003028:	01413023          	sd	s4,0(sp)
    8000302c:	03010413          	addi	s0,sp,48
    80003030:	00050993          	mv	s3,a0
    80003034:	00058a13          	mv	s4,a1
    LOCK();
    80003038:	00100613          	li	a2,1
    8000303c:	00000593          	li	a1,0
    80003040:	00006517          	auipc	a0,0x6
    80003044:	92050513          	addi	a0,a0,-1760 # 80008960 <lockPrint>
    80003048:	ffffe097          	auipc	ra,0xffffe
    8000304c:	0fc080e7          	jalr	252(ra) # 80001144 <copy_and_swap>
    80003050:	fe0514e3          	bnez	a0,80003038 <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80003054:	00000913          	li	s2,0
    80003058:	00090493          	mv	s1,s2
    8000305c:	0019091b          	addiw	s2,s2,1
    80003060:	03495a63          	bge	s2,s4,80003094 <_Z9getStringPci+0x84>
        cc = getc();
    80003064:	ffffe097          	auipc	ra,0xffffe
    80003068:	428080e7          	jalr	1064(ra) # 8000148c <_Z4getcv>
        if(cc < 1)
    8000306c:	02050463          	beqz	a0,80003094 <_Z9getStringPci+0x84>
            break;
        c = cc;
        buf[i++] = c;
    80003070:	009984b3          	add	s1,s3,s1
    80003074:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80003078:	00a00793          	li	a5,10
    8000307c:	00f50a63          	beq	a0,a5,80003090 <_Z9getStringPci+0x80>
    80003080:	00d00793          	li	a5,13
    80003084:	fcf51ae3          	bne	a0,a5,80003058 <_Z9getStringPci+0x48>
        buf[i++] = c;
    80003088:	00090493          	mv	s1,s2
    8000308c:	0080006f          	j	80003094 <_Z9getStringPci+0x84>
    80003090:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    80003094:	009984b3          	add	s1,s3,s1
    80003098:	00048023          	sb	zero,0(s1)

    UNLOCK();
    8000309c:	00000613          	li	a2,0
    800030a0:	00100593          	li	a1,1
    800030a4:	00006517          	auipc	a0,0x6
    800030a8:	8bc50513          	addi	a0,a0,-1860 # 80008960 <lockPrint>
    800030ac:	ffffe097          	auipc	ra,0xffffe
    800030b0:	098080e7          	jalr	152(ra) # 80001144 <copy_and_swap>
    800030b4:	fe0514e3          	bnez	a0,8000309c <_Z9getStringPci+0x8c>
    return buf;
}
    800030b8:	00098513          	mv	a0,s3
    800030bc:	02813083          	ld	ra,40(sp)
    800030c0:	02013403          	ld	s0,32(sp)
    800030c4:	01813483          	ld	s1,24(sp)
    800030c8:	01013903          	ld	s2,16(sp)
    800030cc:	00813983          	ld	s3,8(sp)
    800030d0:	00013a03          	ld	s4,0(sp)
    800030d4:	03010113          	addi	sp,sp,48
    800030d8:	00008067          	ret

00000000800030dc <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    800030dc:	ff010113          	addi	sp,sp,-16
    800030e0:	00813423          	sd	s0,8(sp)
    800030e4:	01010413          	addi	s0,sp,16
    800030e8:	00050693          	mv	a3,a0
    int n;

    n = 0;
    800030ec:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    800030f0:	0006c603          	lbu	a2,0(a3)
    800030f4:	fd06071b          	addiw	a4,a2,-48
    800030f8:	0ff77713          	andi	a4,a4,255
    800030fc:	00900793          	li	a5,9
    80003100:	02e7e063          	bltu	a5,a4,80003120 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80003104:	0025179b          	slliw	a5,a0,0x2
    80003108:	00a787bb          	addw	a5,a5,a0
    8000310c:	0017979b          	slliw	a5,a5,0x1
    80003110:	00168693          	addi	a3,a3,1
    80003114:	00c787bb          	addw	a5,a5,a2
    80003118:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    8000311c:	fd5ff06f          	j	800030f0 <_Z11stringToIntPKc+0x14>
    return n;
}
    80003120:	00813403          	ld	s0,8(sp)
    80003124:	01010113          	addi	sp,sp,16
    80003128:	00008067          	ret

000000008000312c <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    8000312c:	fc010113          	addi	sp,sp,-64
    80003130:	02113c23          	sd	ra,56(sp)
    80003134:	02813823          	sd	s0,48(sp)
    80003138:	02913423          	sd	s1,40(sp)
    8000313c:	03213023          	sd	s2,32(sp)
    80003140:	01313c23          	sd	s3,24(sp)
    80003144:	04010413          	addi	s0,sp,64
    80003148:	00050493          	mv	s1,a0
    8000314c:	00058913          	mv	s2,a1
    80003150:	00060993          	mv	s3,a2
    LOCK();
    80003154:	00100613          	li	a2,1
    80003158:	00000593          	li	a1,0
    8000315c:	00006517          	auipc	a0,0x6
    80003160:	80450513          	addi	a0,a0,-2044 # 80008960 <lockPrint>
    80003164:	ffffe097          	auipc	ra,0xffffe
    80003168:	fe0080e7          	jalr	-32(ra) # 80001144 <copy_and_swap>
    8000316c:	fe0514e3          	bnez	a0,80003154 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    80003170:	00098463          	beqz	s3,80003178 <_Z8printIntiii+0x4c>
    80003174:	0804c463          	bltz	s1,800031fc <_Z8printIntiii+0xd0>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80003178:	0004851b          	sext.w	a0,s1
    neg = 0;
    8000317c:	00000593          	li	a1,0
    }

    i = 0;
    80003180:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    80003184:	0009079b          	sext.w	a5,s2
    80003188:	0325773b          	remuw	a4,a0,s2
    8000318c:	00048613          	mv	a2,s1
    80003190:	0014849b          	addiw	s1,s1,1
    80003194:	02071693          	slli	a3,a4,0x20
    80003198:	0206d693          	srli	a3,a3,0x20
    8000319c:	00005717          	auipc	a4,0x5
    800031a0:	46470713          	addi	a4,a4,1124 # 80008600 <digits>
    800031a4:	00d70733          	add	a4,a4,a3
    800031a8:	00074683          	lbu	a3,0(a4)
    800031ac:	fd040713          	addi	a4,s0,-48
    800031b0:	00c70733          	add	a4,a4,a2
    800031b4:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    800031b8:	0005071b          	sext.w	a4,a0
    800031bc:	0325553b          	divuw	a0,a0,s2
    800031c0:	fcf772e3          	bgeu	a4,a5,80003184 <_Z8printIntiii+0x58>
    if(neg)
    800031c4:	00058c63          	beqz	a1,800031dc <_Z8printIntiii+0xb0>
        buf[i++] = '-';
    800031c8:	fd040793          	addi	a5,s0,-48
    800031cc:	009784b3          	add	s1,a5,s1
    800031d0:	02d00793          	li	a5,45
    800031d4:	fef48823          	sb	a5,-16(s1)
    800031d8:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    800031dc:	fff4849b          	addiw	s1,s1,-1
    800031e0:	0204c463          	bltz	s1,80003208 <_Z8printIntiii+0xdc>
        putc(buf[i]);
    800031e4:	fd040793          	addi	a5,s0,-48
    800031e8:	009787b3          	add	a5,a5,s1
    800031ec:	ff07c503          	lbu	a0,-16(a5)
    800031f0:	ffffe097          	auipc	ra,0xffffe
    800031f4:	2c8080e7          	jalr	712(ra) # 800014b8 <_Z4putcc>
    800031f8:	fe5ff06f          	j	800031dc <_Z8printIntiii+0xb0>
        x = -xx;
    800031fc:	4090053b          	negw	a0,s1
        neg = 1;
    80003200:	00100593          	li	a1,1
        x = -xx;
    80003204:	f7dff06f          	j	80003180 <_Z8printIntiii+0x54>

    UNLOCK();
    80003208:	00000613          	li	a2,0
    8000320c:	00100593          	li	a1,1
    80003210:	00005517          	auipc	a0,0x5
    80003214:	75050513          	addi	a0,a0,1872 # 80008960 <lockPrint>
    80003218:	ffffe097          	auipc	ra,0xffffe
    8000321c:	f2c080e7          	jalr	-212(ra) # 80001144 <copy_and_swap>
    80003220:	fe0514e3          	bnez	a0,80003208 <_Z8printIntiii+0xdc>
    80003224:	03813083          	ld	ra,56(sp)
    80003228:	03013403          	ld	s0,48(sp)
    8000322c:	02813483          	ld	s1,40(sp)
    80003230:	02013903          	ld	s2,32(sp)
    80003234:	01813983          	ld	s3,24(sp)
    80003238:	04010113          	addi	sp,sp,64
    8000323c:	00008067          	ret

0000000080003240 <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80003240:	fd010113          	addi	sp,sp,-48
    80003244:	02113423          	sd	ra,40(sp)
    80003248:	02813023          	sd	s0,32(sp)
    8000324c:	00913c23          	sd	s1,24(sp)
    80003250:	01213823          	sd	s2,16(sp)
    80003254:	01313423          	sd	s3,8(sp)
    80003258:	03010413          	addi	s0,sp,48
    8000325c:	00050493          	mv	s1,a0
    80003260:	00058913          	mv	s2,a1
    80003264:	0015879b          	addiw	a5,a1,1
    80003268:	0007851b          	sext.w	a0,a5
    8000326c:	00f4a023          	sw	a5,0(s1)
    80003270:	0004a823          	sw	zero,16(s1)
    80003274:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80003278:	00251513          	slli	a0,a0,0x2
    8000327c:	ffffe097          	auipc	ra,0xffffe
    80003280:	f1c080e7          	jalr	-228(ra) # 80001198 <_Z9mem_allocm>
    80003284:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    80003288:	01000513          	li	a0,16
    8000328c:	fffff097          	auipc	ra,0xfffff
    80003290:	080080e7          	jalr	128(ra) # 8000230c <_Znwm>
    80003294:	00050993          	mv	s3,a0
    80003298:	00000593          	li	a1,0
    8000329c:	ffffe097          	auipc	ra,0xffffe
    800032a0:	6d0080e7          	jalr	1744(ra) # 8000196c <_ZN9SemaphoreC1Ej>
    800032a4:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    800032a8:	01000513          	li	a0,16
    800032ac:	fffff097          	auipc	ra,0xfffff
    800032b0:	060080e7          	jalr	96(ra) # 8000230c <_Znwm>
    800032b4:	00050993          	mv	s3,a0
    800032b8:	00090593          	mv	a1,s2
    800032bc:	ffffe097          	auipc	ra,0xffffe
    800032c0:	6b0080e7          	jalr	1712(ra) # 8000196c <_ZN9SemaphoreC1Ej>
    800032c4:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    800032c8:	01000513          	li	a0,16
    800032cc:	fffff097          	auipc	ra,0xfffff
    800032d0:	040080e7          	jalr	64(ra) # 8000230c <_Znwm>
    800032d4:	00050913          	mv	s2,a0
    800032d8:	00100593          	li	a1,1
    800032dc:	ffffe097          	auipc	ra,0xffffe
    800032e0:	690080e7          	jalr	1680(ra) # 8000196c <_ZN9SemaphoreC1Ej>
    800032e4:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    800032e8:	01000513          	li	a0,16
    800032ec:	fffff097          	auipc	ra,0xfffff
    800032f0:	020080e7          	jalr	32(ra) # 8000230c <_Znwm>
    800032f4:	00050913          	mv	s2,a0
    800032f8:	00100593          	li	a1,1
    800032fc:	ffffe097          	auipc	ra,0xffffe
    80003300:	670080e7          	jalr	1648(ra) # 8000196c <_ZN9SemaphoreC1Ej>
    80003304:	0324b823          	sd	s2,48(s1)
}
    80003308:	02813083          	ld	ra,40(sp)
    8000330c:	02013403          	ld	s0,32(sp)
    80003310:	01813483          	ld	s1,24(sp)
    80003314:	01013903          	ld	s2,16(sp)
    80003318:	00813983          	ld	s3,8(sp)
    8000331c:	03010113          	addi	sp,sp,48
    80003320:	00008067          	ret
    80003324:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    80003328:	00098513          	mv	a0,s3
    8000332c:	fffff097          	auipc	ra,0xfffff
    80003330:	030080e7          	jalr	48(ra) # 8000235c <_ZdlPv>
    80003334:	00048513          	mv	a0,s1
    80003338:	00006097          	auipc	ra,0x6
    8000333c:	710080e7          	jalr	1808(ra) # 80009a48 <_Unwind_Resume>
    80003340:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    80003344:	00098513          	mv	a0,s3
    80003348:	fffff097          	auipc	ra,0xfffff
    8000334c:	014080e7          	jalr	20(ra) # 8000235c <_ZdlPv>
    80003350:	00048513          	mv	a0,s1
    80003354:	00006097          	auipc	ra,0x6
    80003358:	6f4080e7          	jalr	1780(ra) # 80009a48 <_Unwind_Resume>
    8000335c:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    80003360:	00090513          	mv	a0,s2
    80003364:	fffff097          	auipc	ra,0xfffff
    80003368:	ff8080e7          	jalr	-8(ra) # 8000235c <_ZdlPv>
    8000336c:	00048513          	mv	a0,s1
    80003370:	00006097          	auipc	ra,0x6
    80003374:	6d8080e7          	jalr	1752(ra) # 80009a48 <_Unwind_Resume>
    80003378:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    8000337c:	00090513          	mv	a0,s2
    80003380:	fffff097          	auipc	ra,0xfffff
    80003384:	fdc080e7          	jalr	-36(ra) # 8000235c <_ZdlPv>
    80003388:	00048513          	mv	a0,s1
    8000338c:	00006097          	auipc	ra,0x6
    80003390:	6bc080e7          	jalr	1724(ra) # 80009a48 <_Unwind_Resume>

0000000080003394 <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    80003394:	fe010113          	addi	sp,sp,-32
    80003398:	00113c23          	sd	ra,24(sp)
    8000339c:	00813823          	sd	s0,16(sp)
    800033a0:	00913423          	sd	s1,8(sp)
    800033a4:	01213023          	sd	s2,0(sp)
    800033a8:	02010413          	addi	s0,sp,32
    800033ac:	00050493          	mv	s1,a0
    800033b0:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    800033b4:	01853503          	ld	a0,24(a0)
    800033b8:	ffffe097          	auipc	ra,0xffffe
    800033bc:	5ec080e7          	jalr	1516(ra) # 800019a4 <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    800033c0:	0304b503          	ld	a0,48(s1)
    800033c4:	ffffe097          	auipc	ra,0xffffe
    800033c8:	5e0080e7          	jalr	1504(ra) # 800019a4 <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    800033cc:	0084b783          	ld	a5,8(s1)
    800033d0:	0144a703          	lw	a4,20(s1)
    800033d4:	00271713          	slli	a4,a4,0x2
    800033d8:	00e787b3          	add	a5,a5,a4
    800033dc:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    800033e0:	0144a783          	lw	a5,20(s1)
    800033e4:	0017879b          	addiw	a5,a5,1
    800033e8:	0004a703          	lw	a4,0(s1)
    800033ec:	02e7e7bb          	remw	a5,a5,a4
    800033f0:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    800033f4:	0304b503          	ld	a0,48(s1)
    800033f8:	ffffe097          	auipc	ra,0xffffe
    800033fc:	5d8080e7          	jalr	1496(ra) # 800019d0 <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    80003400:	0204b503          	ld	a0,32(s1)
    80003404:	ffffe097          	auipc	ra,0xffffe
    80003408:	5cc080e7          	jalr	1484(ra) # 800019d0 <_ZN9Semaphore6signalEv>

}
    8000340c:	01813083          	ld	ra,24(sp)
    80003410:	01013403          	ld	s0,16(sp)
    80003414:	00813483          	ld	s1,8(sp)
    80003418:	00013903          	ld	s2,0(sp)
    8000341c:	02010113          	addi	sp,sp,32
    80003420:	00008067          	ret

0000000080003424 <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    80003424:	fe010113          	addi	sp,sp,-32
    80003428:	00113c23          	sd	ra,24(sp)
    8000342c:	00813823          	sd	s0,16(sp)
    80003430:	00913423          	sd	s1,8(sp)
    80003434:	01213023          	sd	s2,0(sp)
    80003438:	02010413          	addi	s0,sp,32
    8000343c:	00050493          	mv	s1,a0
    itemAvailable->wait();
    80003440:	02053503          	ld	a0,32(a0)
    80003444:	ffffe097          	auipc	ra,0xffffe
    80003448:	560080e7          	jalr	1376(ra) # 800019a4 <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    8000344c:	0284b503          	ld	a0,40(s1)
    80003450:	ffffe097          	auipc	ra,0xffffe
    80003454:	554080e7          	jalr	1364(ra) # 800019a4 <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    80003458:	0084b703          	ld	a4,8(s1)
    8000345c:	0104a783          	lw	a5,16(s1)
    80003460:	00279693          	slli	a3,a5,0x2
    80003464:	00d70733          	add	a4,a4,a3
    80003468:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    8000346c:	0017879b          	addiw	a5,a5,1
    80003470:	0004a703          	lw	a4,0(s1)
    80003474:	02e7e7bb          	remw	a5,a5,a4
    80003478:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    8000347c:	0284b503          	ld	a0,40(s1)
    80003480:	ffffe097          	auipc	ra,0xffffe
    80003484:	550080e7          	jalr	1360(ra) # 800019d0 <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    80003488:	0184b503          	ld	a0,24(s1)
    8000348c:	ffffe097          	auipc	ra,0xffffe
    80003490:	544080e7          	jalr	1348(ra) # 800019d0 <_ZN9Semaphore6signalEv>

    return ret;
}
    80003494:	00090513          	mv	a0,s2
    80003498:	01813083          	ld	ra,24(sp)
    8000349c:	01013403          	ld	s0,16(sp)
    800034a0:	00813483          	ld	s1,8(sp)
    800034a4:	00013903          	ld	s2,0(sp)
    800034a8:	02010113          	addi	sp,sp,32
    800034ac:	00008067          	ret

00000000800034b0 <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    800034b0:	fe010113          	addi	sp,sp,-32
    800034b4:	00113c23          	sd	ra,24(sp)
    800034b8:	00813823          	sd	s0,16(sp)
    800034bc:	00913423          	sd	s1,8(sp)
    800034c0:	01213023          	sd	s2,0(sp)
    800034c4:	02010413          	addi	s0,sp,32
    800034c8:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    800034cc:	02853503          	ld	a0,40(a0)
    800034d0:	ffffe097          	auipc	ra,0xffffe
    800034d4:	4d4080e7          	jalr	1236(ra) # 800019a4 <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    800034d8:	0304b503          	ld	a0,48(s1)
    800034dc:	ffffe097          	auipc	ra,0xffffe
    800034e0:	4c8080e7          	jalr	1224(ra) # 800019a4 <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    800034e4:	0144a783          	lw	a5,20(s1)
    800034e8:	0104a903          	lw	s2,16(s1)
    800034ec:	0327ce63          	blt	a5,s2,80003528 <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    800034f0:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    800034f4:	0304b503          	ld	a0,48(s1)
    800034f8:	ffffe097          	auipc	ra,0xffffe
    800034fc:	4d8080e7          	jalr	1240(ra) # 800019d0 <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    80003500:	0284b503          	ld	a0,40(s1)
    80003504:	ffffe097          	auipc	ra,0xffffe
    80003508:	4cc080e7          	jalr	1228(ra) # 800019d0 <_ZN9Semaphore6signalEv>

    return ret;
}
    8000350c:	00090513          	mv	a0,s2
    80003510:	01813083          	ld	ra,24(sp)
    80003514:	01013403          	ld	s0,16(sp)
    80003518:	00813483          	ld	s1,8(sp)
    8000351c:	00013903          	ld	s2,0(sp)
    80003520:	02010113          	addi	sp,sp,32
    80003524:	00008067          	ret
        ret = cap - head + tail;
    80003528:	0004a703          	lw	a4,0(s1)
    8000352c:	4127093b          	subw	s2,a4,s2
    80003530:	00f9093b          	addw	s2,s2,a5
    80003534:	fc1ff06f          	j	800034f4 <_ZN9BufferCPP6getCntEv+0x44>

0000000080003538 <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    80003538:	fe010113          	addi	sp,sp,-32
    8000353c:	00113c23          	sd	ra,24(sp)
    80003540:	00813823          	sd	s0,16(sp)
    80003544:	00913423          	sd	s1,8(sp)
    80003548:	02010413          	addi	s0,sp,32
    8000354c:	00050493          	mv	s1,a0
    Console::putc('\n');
    80003550:	00a00513          	li	a0,10
    80003554:	ffffe097          	auipc	ra,0xffffe
    80003558:	684080e7          	jalr	1668(ra) # 80001bd8 <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    8000355c:	00004517          	auipc	a0,0x4
    80003560:	b5c50513          	addi	a0,a0,-1188 # 800070b8 <_ZZ12printIntegermE6digits+0x10>
    80003564:	00000097          	auipc	ra,0x0
    80003568:	a30080e7          	jalr	-1488(ra) # 80002f94 <_Z11printStringPKc>
    while (getCnt()) {
    8000356c:	00048513          	mv	a0,s1
    80003570:	00000097          	auipc	ra,0x0
    80003574:	f40080e7          	jalr	-192(ra) # 800034b0 <_ZN9BufferCPP6getCntEv>
    80003578:	02050c63          	beqz	a0,800035b0 <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    8000357c:	0084b783          	ld	a5,8(s1)
    80003580:	0104a703          	lw	a4,16(s1)
    80003584:	00271713          	slli	a4,a4,0x2
    80003588:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    8000358c:	0007c503          	lbu	a0,0(a5)
    80003590:	ffffe097          	auipc	ra,0xffffe
    80003594:	648080e7          	jalr	1608(ra) # 80001bd8 <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    80003598:	0104a783          	lw	a5,16(s1)
    8000359c:	0017879b          	addiw	a5,a5,1
    800035a0:	0004a703          	lw	a4,0(s1)
    800035a4:	02e7e7bb          	remw	a5,a5,a4
    800035a8:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    800035ac:	fc1ff06f          	j	8000356c <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    800035b0:	02100513          	li	a0,33
    800035b4:	ffffe097          	auipc	ra,0xffffe
    800035b8:	624080e7          	jalr	1572(ra) # 80001bd8 <_ZN7Console4putcEc>
    Console::putc('\n');
    800035bc:	00a00513          	li	a0,10
    800035c0:	ffffe097          	auipc	ra,0xffffe
    800035c4:	618080e7          	jalr	1560(ra) # 80001bd8 <_ZN7Console4putcEc>
    mem_free(buffer);
    800035c8:	0084b503          	ld	a0,8(s1)
    800035cc:	ffffe097          	auipc	ra,0xffffe
    800035d0:	c1c080e7          	jalr	-996(ra) # 800011e8 <_Z8mem_freePv>
    delete itemAvailable;
    800035d4:	0204b503          	ld	a0,32(s1)
    800035d8:	00050863          	beqz	a0,800035e8 <_ZN9BufferCPPD1Ev+0xb0>
    800035dc:	00053783          	ld	a5,0(a0)
    800035e0:	0087b783          	ld	a5,8(a5)
    800035e4:	000780e7          	jalr	a5
    delete spaceAvailable;
    800035e8:	0184b503          	ld	a0,24(s1)
    800035ec:	00050863          	beqz	a0,800035fc <_ZN9BufferCPPD1Ev+0xc4>
    800035f0:	00053783          	ld	a5,0(a0)
    800035f4:	0087b783          	ld	a5,8(a5)
    800035f8:	000780e7          	jalr	a5
    delete mutexTail;
    800035fc:	0304b503          	ld	a0,48(s1)
    80003600:	00050863          	beqz	a0,80003610 <_ZN9BufferCPPD1Ev+0xd8>
    80003604:	00053783          	ld	a5,0(a0)
    80003608:	0087b783          	ld	a5,8(a5)
    8000360c:	000780e7          	jalr	a5
    delete mutexHead;
    80003610:	0284b503          	ld	a0,40(s1)
    80003614:	00050863          	beqz	a0,80003624 <_ZN9BufferCPPD1Ev+0xec>
    80003618:	00053783          	ld	a5,0(a0)
    8000361c:	0087b783          	ld	a5,8(a5)
    80003620:	000780e7          	jalr	a5
}
    80003624:	01813083          	ld	ra,24(sp)
    80003628:	01013403          	ld	s0,16(sp)
    8000362c:	00813483          	ld	s1,8(sp)
    80003630:	02010113          	addi	sp,sp,32
    80003634:	00008067          	ret

0000000080003638 <_Z16producerKeyboardPv>:
    sem_t wait;
};

volatile int threadEnd = 0;

void producerKeyboard(void *arg) {
    80003638:	fe010113          	addi	sp,sp,-32
    8000363c:	00113c23          	sd	ra,24(sp)
    80003640:	00813823          	sd	s0,16(sp)
    80003644:	00913423          	sd	s1,8(sp)
    80003648:	01213023          	sd	s2,0(sp)
    8000364c:	02010413          	addi	s0,sp,32
    80003650:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80003654:	00000913          	li	s2,0
    80003658:	00c0006f          	j	80003664 <_Z16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    8000365c:	ffffe097          	auipc	ra,0xffffe
    80003660:	c74080e7          	jalr	-908(ra) # 800012d0 <_Z15thread_dispatchv>
    while ((key = getc()) != 0x1b) {
    80003664:	ffffe097          	auipc	ra,0xffffe
    80003668:	e28080e7          	jalr	-472(ra) # 8000148c <_Z4getcv>
    8000366c:	0005059b          	sext.w	a1,a0
    80003670:	01b00793          	li	a5,27
    80003674:	02f58a63          	beq	a1,a5,800036a8 <_Z16producerKeyboardPv+0x70>
        data->buffer->put(key);
    80003678:	0084b503          	ld	a0,8(s1)
    8000367c:	00000097          	auipc	ra,0x0
    80003680:	574080e7          	jalr	1396(ra) # 80003bf0 <_ZN6Buffer3putEi>
        i++;
    80003684:	0019071b          	addiw	a4,s2,1
    80003688:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    8000368c:	0004a683          	lw	a3,0(s1)
    80003690:	0026979b          	slliw	a5,a3,0x2
    80003694:	00d787bb          	addw	a5,a5,a3
    80003698:	0017979b          	slliw	a5,a5,0x1
    8000369c:	02f767bb          	remw	a5,a4,a5
    800036a0:	fc0792e3          	bnez	a5,80003664 <_Z16producerKeyboardPv+0x2c>
    800036a4:	fb9ff06f          	j	8000365c <_Z16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    800036a8:	00100793          	li	a5,1
    800036ac:	00005717          	auipc	a4,0x5
    800036b0:	2af72e23          	sw	a5,700(a4) # 80008968 <threadEnd>
    data->buffer->put('!');
    800036b4:	02100593          	li	a1,33
    800036b8:	0084b503          	ld	a0,8(s1)
    800036bc:	00000097          	auipc	ra,0x0
    800036c0:	534080e7          	jalr	1332(ra) # 80003bf0 <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    800036c4:	0104b503          	ld	a0,16(s1)
    800036c8:	ffffe097          	auipc	ra,0xffffe
    800036cc:	d64080e7          	jalr	-668(ra) # 8000142c <_Z10sem_signalP4_sem>
}
    800036d0:	01813083          	ld	ra,24(sp)
    800036d4:	01013403          	ld	s0,16(sp)
    800036d8:	00813483          	ld	s1,8(sp)
    800036dc:	00013903          	ld	s2,0(sp)
    800036e0:	02010113          	addi	sp,sp,32
    800036e4:	00008067          	ret

00000000800036e8 <_Z8producerPv>:

void producer(void *arg) {
    800036e8:	fe010113          	addi	sp,sp,-32
    800036ec:	00113c23          	sd	ra,24(sp)
    800036f0:	00813823          	sd	s0,16(sp)
    800036f4:	00913423          	sd	s1,8(sp)
    800036f8:	01213023          	sd	s2,0(sp)
    800036fc:	02010413          	addi	s0,sp,32
    80003700:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80003704:	00000913          	li	s2,0
    80003708:	00c0006f          	j	80003714 <_Z8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    8000370c:	ffffe097          	auipc	ra,0xffffe
    80003710:	bc4080e7          	jalr	-1084(ra) # 800012d0 <_Z15thread_dispatchv>
    while (!threadEnd) {
    80003714:	00005797          	auipc	a5,0x5
    80003718:	2547a783          	lw	a5,596(a5) # 80008968 <threadEnd>
    8000371c:	02079e63          	bnez	a5,80003758 <_Z8producerPv+0x70>
        data->buffer->put(data->id + '0');
    80003720:	0004a583          	lw	a1,0(s1)
    80003724:	0305859b          	addiw	a1,a1,48
    80003728:	0084b503          	ld	a0,8(s1)
    8000372c:	00000097          	auipc	ra,0x0
    80003730:	4c4080e7          	jalr	1220(ra) # 80003bf0 <_ZN6Buffer3putEi>
        i++;
    80003734:	0019071b          	addiw	a4,s2,1
    80003738:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    8000373c:	0004a683          	lw	a3,0(s1)
    80003740:	0026979b          	slliw	a5,a3,0x2
    80003744:	00d787bb          	addw	a5,a5,a3
    80003748:	0017979b          	slliw	a5,a5,0x1
    8000374c:	02f767bb          	remw	a5,a4,a5
    80003750:	fc0792e3          	bnez	a5,80003714 <_Z8producerPv+0x2c>
    80003754:	fb9ff06f          	j	8000370c <_Z8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    80003758:	0104b503          	ld	a0,16(s1)
    8000375c:	ffffe097          	auipc	ra,0xffffe
    80003760:	cd0080e7          	jalr	-816(ra) # 8000142c <_Z10sem_signalP4_sem>
}
    80003764:	01813083          	ld	ra,24(sp)
    80003768:	01013403          	ld	s0,16(sp)
    8000376c:	00813483          	ld	s1,8(sp)
    80003770:	00013903          	ld	s2,0(sp)
    80003774:	02010113          	addi	sp,sp,32
    80003778:	00008067          	ret

000000008000377c <_Z8consumerPv>:

void consumer(void *arg) {
    8000377c:	fd010113          	addi	sp,sp,-48
    80003780:	02113423          	sd	ra,40(sp)
    80003784:	02813023          	sd	s0,32(sp)
    80003788:	00913c23          	sd	s1,24(sp)
    8000378c:	01213823          	sd	s2,16(sp)
    80003790:	01313423          	sd	s3,8(sp)
    80003794:	03010413          	addi	s0,sp,48
    80003798:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    8000379c:	00000993          	li	s3,0
    800037a0:	01c0006f          	j	800037bc <_Z8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    800037a4:	ffffe097          	auipc	ra,0xffffe
    800037a8:	b2c080e7          	jalr	-1236(ra) # 800012d0 <_Z15thread_dispatchv>
    800037ac:	0500006f          	j	800037fc <_Z8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    800037b0:	00a00513          	li	a0,10
    800037b4:	ffffe097          	auipc	ra,0xffffe
    800037b8:	d04080e7          	jalr	-764(ra) # 800014b8 <_Z4putcc>
    while (!threadEnd) {
    800037bc:	00005797          	auipc	a5,0x5
    800037c0:	1ac7a783          	lw	a5,428(a5) # 80008968 <threadEnd>
    800037c4:	06079063          	bnez	a5,80003824 <_Z8consumerPv+0xa8>
        int key = data->buffer->get();
    800037c8:	00893503          	ld	a0,8(s2)
    800037cc:	00000097          	auipc	ra,0x0
    800037d0:	4b4080e7          	jalr	1204(ra) # 80003c80 <_ZN6Buffer3getEv>
        i++;
    800037d4:	0019849b          	addiw	s1,s3,1
    800037d8:	0004899b          	sext.w	s3,s1
        putc(key);
    800037dc:	0ff57513          	andi	a0,a0,255
    800037e0:	ffffe097          	auipc	ra,0xffffe
    800037e4:	cd8080e7          	jalr	-808(ra) # 800014b8 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    800037e8:	00092703          	lw	a4,0(s2)
    800037ec:	0027179b          	slliw	a5,a4,0x2
    800037f0:	00e787bb          	addw	a5,a5,a4
    800037f4:	02f4e7bb          	remw	a5,s1,a5
    800037f8:	fa0786e3          	beqz	a5,800037a4 <_Z8consumerPv+0x28>
        if (i % 80 == 0) {
    800037fc:	05000793          	li	a5,80
    80003800:	02f4e4bb          	remw	s1,s1,a5
    80003804:	fa049ce3          	bnez	s1,800037bc <_Z8consumerPv+0x40>
    80003808:	fa9ff06f          	j	800037b0 <_Z8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    8000380c:	00893503          	ld	a0,8(s2)
    80003810:	00000097          	auipc	ra,0x0
    80003814:	470080e7          	jalr	1136(ra) # 80003c80 <_ZN6Buffer3getEv>
        putc(key);
    80003818:	0ff57513          	andi	a0,a0,255
    8000381c:	ffffe097          	auipc	ra,0xffffe
    80003820:	c9c080e7          	jalr	-868(ra) # 800014b8 <_Z4putcc>
    while (data->buffer->getCnt() > 0) {
    80003824:	00893503          	ld	a0,8(s2)
    80003828:	00000097          	auipc	ra,0x0
    8000382c:	4e4080e7          	jalr	1252(ra) # 80003d0c <_ZN6Buffer6getCntEv>
    80003830:	fca04ee3          	bgtz	a0,8000380c <_Z8consumerPv+0x90>
    }

    sem_signal(data->wait);
    80003834:	01093503          	ld	a0,16(s2)
    80003838:	ffffe097          	auipc	ra,0xffffe
    8000383c:	bf4080e7          	jalr	-1036(ra) # 8000142c <_Z10sem_signalP4_sem>
}
    80003840:	02813083          	ld	ra,40(sp)
    80003844:	02013403          	ld	s0,32(sp)
    80003848:	01813483          	ld	s1,24(sp)
    8000384c:	01013903          	ld	s2,16(sp)
    80003850:	00813983          	ld	s3,8(sp)
    80003854:	03010113          	addi	sp,sp,48
    80003858:	00008067          	ret

000000008000385c <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    8000385c:	f9010113          	addi	sp,sp,-112
    80003860:	06113423          	sd	ra,104(sp)
    80003864:	06813023          	sd	s0,96(sp)
    80003868:	04913c23          	sd	s1,88(sp)
    8000386c:	05213823          	sd	s2,80(sp)
    80003870:	05313423          	sd	s3,72(sp)
    80003874:	05413023          	sd	s4,64(sp)
    80003878:	03513c23          	sd	s5,56(sp)
    8000387c:	03613823          	sd	s6,48(sp)
    80003880:	07010413          	addi	s0,sp,112
    for (int i = 0; i <= threadNum; i++) {
        sem_wait(waitForAll);
    }

    sem_close(waitForAll);

    80003884:	00010b13          	mv	s6,sp
    printString("Unesite broj proizvodjaca?\n");
    80003888:	00004517          	auipc	a0,0x4
    8000388c:	84850513          	addi	a0,a0,-1976 # 800070d0 <_ZZ12printIntegermE6digits+0x28>
    80003890:	fffff097          	auipc	ra,0xfffff
    80003894:	704080e7          	jalr	1796(ra) # 80002f94 <_Z11printStringPKc>
    getString(input, 30);
    80003898:	01e00593          	li	a1,30
    8000389c:	fa040493          	addi	s1,s0,-96
    800038a0:	00048513          	mv	a0,s1
    800038a4:	fffff097          	auipc	ra,0xfffff
    800038a8:	76c080e7          	jalr	1900(ra) # 80003010 <_Z9getStringPci>
    threadNum = stringToInt(input);
    800038ac:	00048513          	mv	a0,s1
    800038b0:	00000097          	auipc	ra,0x0
    800038b4:	82c080e7          	jalr	-2004(ra) # 800030dc <_Z11stringToIntPKc>
    800038b8:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    800038bc:	00004517          	auipc	a0,0x4
    800038c0:	83450513          	addi	a0,a0,-1996 # 800070f0 <_ZZ12printIntegermE6digits+0x48>
    800038c4:	fffff097          	auipc	ra,0xfffff
    800038c8:	6d0080e7          	jalr	1744(ra) # 80002f94 <_Z11printStringPKc>
    getString(input, 30);
    800038cc:	01e00593          	li	a1,30
    800038d0:	00048513          	mv	a0,s1
    800038d4:	fffff097          	auipc	ra,0xfffff
    800038d8:	73c080e7          	jalr	1852(ra) # 80003010 <_Z9getStringPci>
    n = stringToInt(input);
    800038dc:	00048513          	mv	a0,s1
    800038e0:	fffff097          	auipc	ra,0xfffff
    800038e4:	7fc080e7          	jalr	2044(ra) # 800030dc <_Z11stringToIntPKc>
    800038e8:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    800038ec:	00004517          	auipc	a0,0x4
    800038f0:	82450513          	addi	a0,a0,-2012 # 80007110 <_ZZ12printIntegermE6digits+0x68>
    800038f4:	fffff097          	auipc	ra,0xfffff
    800038f8:	6a0080e7          	jalr	1696(ra) # 80002f94 <_Z11printStringPKc>
    800038fc:	00000613          	li	a2,0
    80003900:	00a00593          	li	a1,10
    80003904:	00090513          	mv	a0,s2
    80003908:	00000097          	auipc	ra,0x0
    8000390c:	824080e7          	jalr	-2012(ra) # 8000312c <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80003910:	00004517          	auipc	a0,0x4
    80003914:	81850513          	addi	a0,a0,-2024 # 80007128 <_ZZ12printIntegermE6digits+0x80>
    80003918:	fffff097          	auipc	ra,0xfffff
    8000391c:	67c080e7          	jalr	1660(ra) # 80002f94 <_Z11printStringPKc>
    80003920:	00000613          	li	a2,0
    80003924:	00a00593          	li	a1,10
    80003928:	00048513          	mv	a0,s1
    8000392c:	00000097          	auipc	ra,0x0
    80003930:	800080e7          	jalr	-2048(ra) # 8000312c <_Z8printIntiii>
    printString(".\n");
    80003934:	00004517          	auipc	a0,0x4
    80003938:	80c50513          	addi	a0,a0,-2036 # 80007140 <_ZZ12printIntegermE6digits+0x98>
    8000393c:	fffff097          	auipc	ra,0xfffff
    80003940:	658080e7          	jalr	1624(ra) # 80002f94 <_Z11printStringPKc>
    if(threadNum > n) {
    80003944:	0324c463          	blt	s1,s2,8000396c <_Z22producerConsumer_C_APIv+0x110>
    } else if (threadNum < 1) {
    80003948:	03205c63          	blez	s2,80003980 <_Z22producerConsumer_C_APIv+0x124>
    Buffer *buffer = new Buffer(n);
    8000394c:	03800513          	li	a0,56
    80003950:	fffff097          	auipc	ra,0xfffff
    80003954:	9bc080e7          	jalr	-1604(ra) # 8000230c <_Znwm>
    80003958:	00050a13          	mv	s4,a0
    8000395c:	00048593          	mv	a1,s1
    80003960:	00000097          	auipc	ra,0x0
    80003964:	1f4080e7          	jalr	500(ra) # 80003b54 <_ZN6BufferC1Ei>
    80003968:	0300006f          	j	80003998 <_Z22producerConsumer_C_APIv+0x13c>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    8000396c:	00003517          	auipc	a0,0x3
    80003970:	7dc50513          	addi	a0,a0,2012 # 80007148 <_ZZ12printIntegermE6digits+0xa0>
    80003974:	fffff097          	auipc	ra,0xfffff
    80003978:	620080e7          	jalr	1568(ra) # 80002f94 <_Z11printStringPKc>
        return;
    8000397c:	0140006f          	j	80003990 <_Z22producerConsumer_C_APIv+0x134>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80003980:	00004517          	auipc	a0,0x4
    80003984:	80850513          	addi	a0,a0,-2040 # 80007188 <_ZZ12printIntegermE6digits+0xe0>
    80003988:	fffff097          	auipc	ra,0xfffff
    8000398c:	60c080e7          	jalr	1548(ra) # 80002f94 <_Z11printStringPKc>
        return;
    80003990:	000b0113          	mv	sp,s6
    80003994:	1500006f          	j	80003ae4 <_Z22producerConsumer_C_APIv+0x288>
//    sem_open(&waitForAll, 0);
    80003998:	00000593          	li	a1,0
    8000399c:	00005517          	auipc	a0,0x5
    800039a0:	fd450513          	addi	a0,a0,-44 # 80008970 <waitForAll>
    800039a4:	ffffe097          	auipc	ra,0xffffe
    800039a8:	9f4080e7          	jalr	-1548(ra) # 80001398 <_Z8sem_openPP4_semj>

    800039ac:	00391793          	slli	a5,s2,0x3
    800039b0:	00f78793          	addi	a5,a5,15
    800039b4:	ff07f793          	andi	a5,a5,-16
    800039b8:	40f10133          	sub	sp,sp,a5
    800039bc:	00010a93          	mv	s5,sp

    800039c0:	0019071b          	addiw	a4,s2,1
    800039c4:	00171793          	slli	a5,a4,0x1
    800039c8:	00e787b3          	add	a5,a5,a4
    800039cc:	00379793          	slli	a5,a5,0x3
    800039d0:	00f78793          	addi	a5,a5,15
    800039d4:	ff07f793          	andi	a5,a5,-16
    800039d8:	40f10133          	sub	sp,sp,a5
    800039dc:	00010993          	mv	s3,sp

    800039e0:	00191613          	slli	a2,s2,0x1
    800039e4:	012607b3          	add	a5,a2,s2
    800039e8:	00379793          	slli	a5,a5,0x3
    800039ec:	00f987b3          	add	a5,s3,a5
    800039f0:	0127a023          	sw	s2,0(a5)
    data[threadNum].id = threadNum;
    800039f4:	0147b423          	sd	s4,8(a5)
    data[threadNum].buffer = buffer;
    800039f8:	00005717          	auipc	a4,0x5
    800039fc:	f7873703          	ld	a4,-136(a4) # 80008970 <waitForAll>
    80003a00:	00e7b823          	sd	a4,16(a5)
    data[threadNum].wait = waitForAll;
    80003a04:	00078613          	mv	a2,a5
    80003a08:	00000597          	auipc	a1,0x0
    80003a0c:	d7458593          	addi	a1,a1,-652 # 8000377c <_Z8consumerPv>
    80003a10:	f9840513          	addi	a0,s0,-104
    80003a14:	ffffe097          	auipc	ra,0xffffe
    80003a18:	804080e7          	jalr	-2044(ra) # 80001218 <_Z13thread_createPP7_threadPFvPvES2_>

    80003a1c:	00000493          	li	s1,0
    80003a20:	0280006f          	j	80003a48 <_Z22producerConsumer_C_APIv+0x1ec>

    80003a24:	00000597          	auipc	a1,0x0
    80003a28:	c1458593          	addi	a1,a1,-1004 # 80003638 <_Z16producerKeyboardPv>
                      i > 0 ? producer : producerKeyboard,
    80003a2c:	00179613          	slli	a2,a5,0x1
    80003a30:	00f60633          	add	a2,a2,a5
    80003a34:	00361613          	slli	a2,a2,0x3

    80003a38:	00c98633          	add	a2,s3,a2
    80003a3c:	ffffd097          	auipc	ra,0xffffd
    80003a40:	7dc080e7          	jalr	2012(ra) # 80001218 <_Z13thread_createPP7_threadPFvPvES2_>

    80003a44:	0014849b          	addiw	s1,s1,1
    80003a48:	0524d263          	bge	s1,s2,80003a8c <_Z22producerConsumer_C_APIv+0x230>
    for (int i = 0; i < threadNum; i++) {
    80003a4c:	00149793          	slli	a5,s1,0x1
    80003a50:	009787b3          	add	a5,a5,s1
    80003a54:	00379793          	slli	a5,a5,0x3
    80003a58:	00f987b3          	add	a5,s3,a5
    80003a5c:	0097a023          	sw	s1,0(a5)
        data[i].id = i;
    80003a60:	0147b423          	sd	s4,8(a5)
        data[i].buffer = buffer;
    80003a64:	00005717          	auipc	a4,0x5
    80003a68:	f0c73703          	ld	a4,-244(a4) # 80008970 <waitForAll>
    80003a6c:	00e7b823          	sd	a4,16(a5)

    80003a70:	00048793          	mv	a5,s1
    80003a74:	00349513          	slli	a0,s1,0x3
    80003a78:	00aa8533          	add	a0,s5,a0
    80003a7c:	fa9054e3          	blez	s1,80003a24 <_Z22producerConsumer_C_APIv+0x1c8>
    80003a80:	00000597          	auipc	a1,0x0
    80003a84:	c6858593          	addi	a1,a1,-920 # 800036e8 <_Z8producerPv>
    80003a88:	fa5ff06f          	j	80003a2c <_Z22producerConsumer_C_APIv+0x1d0>

    80003a8c:	ffffe097          	auipc	ra,0xffffe
    80003a90:	844080e7          	jalr	-1980(ra) # 800012d0 <_Z15thread_dispatchv>

    80003a94:	00000493          	li	s1,0
    80003a98:	00994e63          	blt	s2,s1,80003ab4 <_Z22producerConsumer_C_APIv+0x258>
    for (int i = 0; i <= threadNum; i++) {
    80003a9c:	00005517          	auipc	a0,0x5
    80003aa0:	ed453503          	ld	a0,-300(a0) # 80008970 <waitForAll>
    80003aa4:	ffffe097          	auipc	ra,0xffffe
    80003aa8:	958080e7          	jalr	-1704(ra) # 800013fc <_Z8sem_waitP4_sem>

    80003aac:	0014849b          	addiw	s1,s1,1
    80003ab0:	fe9ff06f          	j	80003a98 <_Z22producerConsumer_C_APIv+0x23c>

    80003ab4:	00005517          	auipc	a0,0x5
    80003ab8:	ebc53503          	ld	a0,-324(a0) # 80008970 <waitForAll>
    80003abc:	ffffe097          	auipc	ra,0xffffe
    80003ac0:	910080e7          	jalr	-1776(ra) # 800013cc <_Z9sem_closeP4_sem>

    80003ac4:	000a0e63          	beqz	s4,80003ae0 <_Z22producerConsumer_C_APIv+0x284>
    80003ac8:	000a0513          	mv	a0,s4
    80003acc:	00000097          	auipc	ra,0x0
    80003ad0:	2c8080e7          	jalr	712(ra) # 80003d94 <_ZN6BufferD1Ev>
    80003ad4:	000a0513          	mv	a0,s4
    80003ad8:	fffff097          	auipc	ra,0xfffff
    80003adc:	884080e7          	jalr	-1916(ra) # 8000235c <_ZdlPv>
    80003ae0:	000b0113          	mv	sp,s6
    delete buffer;

    80003ae4:	f9040113          	addi	sp,s0,-112
    80003ae8:	06813083          	ld	ra,104(sp)
    80003aec:	06013403          	ld	s0,96(sp)
    80003af0:	05813483          	ld	s1,88(sp)
    80003af4:	05013903          	ld	s2,80(sp)
    80003af8:	04813983          	ld	s3,72(sp)
    80003afc:	04013a03          	ld	s4,64(sp)
    80003b00:	03813a83          	ld	s5,56(sp)
    80003b04:	03013b03          	ld	s6,48(sp)
    80003b08:	07010113          	addi	sp,sp,112
    80003b0c:	00008067          	ret
    80003b10:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    80003b14:	000a0513          	mv	a0,s4
    80003b18:	fffff097          	auipc	ra,0xfffff
    80003b1c:	844080e7          	jalr	-1980(ra) # 8000235c <_ZdlPv>
    80003b20:	00048513          	mv	a0,s1
    80003b24:	00006097          	auipc	ra,0x6
    80003b28:	f24080e7          	jalr	-220(ra) # 80009a48 <_Unwind_Resume>

0000000080003b2c <_Z8userMainv>:
//#include "../test/ConsumerProducer_CPP_Sync_API_test.hpp" // zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta

//#include "../test/ThreadSleep_C_API_test.hpp" // thread_sleep test C API
//#include "../test/ConsumerProducer_CPP_API_test.hpp" // zadatak 4. CPP API i asinhrona promena konteksta

void userMain() {
    80003b2c:	ff010113          	addi	sp,sp,-16
    80003b30:	00113423          	sd	ra,8(sp)
    80003b34:	00813023          	sd	s0,0(sp)
    80003b38:	01010413          	addi	s0,sp,16
//    Threads_C_API_test(); // zadatak 2., niti C API i sinhrona promena konteksta
//    Threads_CPP_API_test(); // zadatak 2., niti CPP API i sinhrona promena konteksta

    producerConsumer_C_API(); // zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta
    80003b3c:	00000097          	auipc	ra,0x0
    80003b40:	d20080e7          	jalr	-736(ra) # 8000385c <_Z22producerConsumer_C_APIv>
    //producerConsumer_CPP_Sync_API(); // zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta

//    testSleeping(); // thread_sleep test C API
//    ConsumerProducerCPP::testConsumerProducer(); // zadatak 4. CPP API i asinhrona promena konteksta, kompletan test svega

    80003b44:	00813083          	ld	ra,8(sp)
    80003b48:	00013403          	ld	s0,0(sp)
    80003b4c:	01010113          	addi	sp,sp,16
    80003b50:	00008067          	ret

0000000080003b54 <_ZN6BufferC1Ei>:
#include "buffer.hpp"
#include "../h/_sem.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80003b54:	fe010113          	addi	sp,sp,-32
    80003b58:	00113c23          	sd	ra,24(sp)
    80003b5c:	00813823          	sd	s0,16(sp)
    80003b60:	00913423          	sd	s1,8(sp)
    80003b64:	01213023          	sd	s2,0(sp)
    80003b68:	02010413          	addi	s0,sp,32
    80003b6c:	00050493          	mv	s1,a0
    80003b70:	00058913          	mv	s2,a1
    80003b74:	0015879b          	addiw	a5,a1,1
    80003b78:	0007851b          	sext.w	a0,a5
    80003b7c:	00f4a023          	sw	a5,0(s1)
    80003b80:	0004a823          	sw	zero,16(s1)
    80003b84:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80003b88:	00251513          	slli	a0,a0,0x2
    80003b8c:	ffffd097          	auipc	ra,0xffffd
    80003b90:	60c080e7          	jalr	1548(ra) # 80001198 <_Z9mem_allocm>
    80003b94:	00a4b423          	sd	a0,8(s1)
//    sem_open(&itemAvailable, 0);
//    sem_open(&spaceAvailable, _cap);
//    sem_open(&mutexHead, 1);
//    sem_open(&mutexTail, 1);
    _sem::createSem(&itemAvailable, 0);
    80003b98:	00000593          	li	a1,0
    80003b9c:	02048513          	addi	a0,s1,32
    80003ba0:	fffff097          	auipc	ra,0xfffff
    80003ba4:	e18080e7          	jalr	-488(ra) # 800029b8 <_ZN4_sem9createSemEPPS_m>
    _sem::createSem(&spaceAvailable, _cap);
    80003ba8:	00090593          	mv	a1,s2
    80003bac:	01848513          	addi	a0,s1,24
    80003bb0:	fffff097          	auipc	ra,0xfffff
    80003bb4:	e08080e7          	jalr	-504(ra) # 800029b8 <_ZN4_sem9createSemEPPS_m>
    _sem::createSem(&mutexHead, 1);
    80003bb8:	00100593          	li	a1,1
    80003bbc:	02848513          	addi	a0,s1,40
    80003bc0:	fffff097          	auipc	ra,0xfffff
    80003bc4:	df8080e7          	jalr	-520(ra) # 800029b8 <_ZN4_sem9createSemEPPS_m>
    _sem::createSem(&mutexTail, 1);
    80003bc8:	00100593          	li	a1,1
    80003bcc:	03048513          	addi	a0,s1,48
    80003bd0:	fffff097          	auipc	ra,0xfffff
    80003bd4:	de8080e7          	jalr	-536(ra) # 800029b8 <_ZN4_sem9createSemEPPS_m>
}
    80003bd8:	01813083          	ld	ra,24(sp)
    80003bdc:	01013403          	ld	s0,16(sp)
    80003be0:	00813483          	ld	s1,8(sp)
    80003be4:	00013903          	ld	s2,0(sp)
    80003be8:	02010113          	addi	sp,sp,32
    80003bec:	00008067          	ret

0000000080003bf0 <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    80003bf0:	fe010113          	addi	sp,sp,-32
    80003bf4:	00113c23          	sd	ra,24(sp)
    80003bf8:	00813823          	sd	s0,16(sp)
    80003bfc:	00913423          	sd	s1,8(sp)
    80003c00:	01213023          	sd	s2,0(sp)
    80003c04:	02010413          	addi	s0,sp,32
    80003c08:	00050493          	mv	s1,a0
    80003c0c:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    80003c10:	01853503          	ld	a0,24(a0)
    80003c14:	ffffd097          	auipc	ra,0xffffd
    80003c18:	7e8080e7          	jalr	2024(ra) # 800013fc <_Z8sem_waitP4_sem>

    sem_wait(mutexTail);
    80003c1c:	0304b503          	ld	a0,48(s1)
    80003c20:	ffffd097          	auipc	ra,0xffffd
    80003c24:	7dc080e7          	jalr	2012(ra) # 800013fc <_Z8sem_waitP4_sem>
    buffer[tail] = val;
    80003c28:	0084b783          	ld	a5,8(s1)
    80003c2c:	0144a703          	lw	a4,20(s1)
    80003c30:	00271713          	slli	a4,a4,0x2
    80003c34:	00e787b3          	add	a5,a5,a4
    80003c38:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80003c3c:	0144a783          	lw	a5,20(s1)
    80003c40:	0017879b          	addiw	a5,a5,1
    80003c44:	0004a703          	lw	a4,0(s1)
    80003c48:	02e7e7bb          	remw	a5,a5,a4
    80003c4c:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    80003c50:	0304b503          	ld	a0,48(s1)
    80003c54:	ffffd097          	auipc	ra,0xffffd
    80003c58:	7d8080e7          	jalr	2008(ra) # 8000142c <_Z10sem_signalP4_sem>

    sem_signal(itemAvailable);
    80003c5c:	0204b503          	ld	a0,32(s1)
    80003c60:	ffffd097          	auipc	ra,0xffffd
    80003c64:	7cc080e7          	jalr	1996(ra) # 8000142c <_Z10sem_signalP4_sem>

}
    80003c68:	01813083          	ld	ra,24(sp)
    80003c6c:	01013403          	ld	s0,16(sp)
    80003c70:	00813483          	ld	s1,8(sp)
    80003c74:	00013903          	ld	s2,0(sp)
    80003c78:	02010113          	addi	sp,sp,32
    80003c7c:	00008067          	ret

0000000080003c80 <_ZN6Buffer3getEv>:

int Buffer::get() {
    80003c80:	fe010113          	addi	sp,sp,-32
    80003c84:	00113c23          	sd	ra,24(sp)
    80003c88:	00813823          	sd	s0,16(sp)
    80003c8c:	00913423          	sd	s1,8(sp)
    80003c90:	01213023          	sd	s2,0(sp)
    80003c94:	02010413          	addi	s0,sp,32
    80003c98:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    80003c9c:	02053503          	ld	a0,32(a0)
    80003ca0:	ffffd097          	auipc	ra,0xffffd
    80003ca4:	75c080e7          	jalr	1884(ra) # 800013fc <_Z8sem_waitP4_sem>

    sem_wait(mutexHead);
    80003ca8:	0284b503          	ld	a0,40(s1)
    80003cac:	ffffd097          	auipc	ra,0xffffd
    80003cb0:	750080e7          	jalr	1872(ra) # 800013fc <_Z8sem_waitP4_sem>

    int ret = buffer[head];
    80003cb4:	0084b703          	ld	a4,8(s1)
    80003cb8:	0104a783          	lw	a5,16(s1)
    80003cbc:	00279693          	slli	a3,a5,0x2
    80003cc0:	00d70733          	add	a4,a4,a3
    80003cc4:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80003cc8:	0017879b          	addiw	a5,a5,1
    80003ccc:	0004a703          	lw	a4,0(s1)
    80003cd0:	02e7e7bb          	remw	a5,a5,a4
    80003cd4:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    80003cd8:	0284b503          	ld	a0,40(s1)
    80003cdc:	ffffd097          	auipc	ra,0xffffd
    80003ce0:	750080e7          	jalr	1872(ra) # 8000142c <_Z10sem_signalP4_sem>

    sem_signal(spaceAvailable);
    80003ce4:	0184b503          	ld	a0,24(s1)
    80003ce8:	ffffd097          	auipc	ra,0xffffd
    80003cec:	744080e7          	jalr	1860(ra) # 8000142c <_Z10sem_signalP4_sem>

    return ret;
}
    80003cf0:	00090513          	mv	a0,s2
    80003cf4:	01813083          	ld	ra,24(sp)
    80003cf8:	01013403          	ld	s0,16(sp)
    80003cfc:	00813483          	ld	s1,8(sp)
    80003d00:	00013903          	ld	s2,0(sp)
    80003d04:	02010113          	addi	sp,sp,32
    80003d08:	00008067          	ret

0000000080003d0c <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    80003d0c:	fe010113          	addi	sp,sp,-32
    80003d10:	00113c23          	sd	ra,24(sp)
    80003d14:	00813823          	sd	s0,16(sp)
    80003d18:	00913423          	sd	s1,8(sp)
    80003d1c:	01213023          	sd	s2,0(sp)
    80003d20:	02010413          	addi	s0,sp,32
    80003d24:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    80003d28:	02853503          	ld	a0,40(a0)
    80003d2c:	ffffd097          	auipc	ra,0xffffd
    80003d30:	6d0080e7          	jalr	1744(ra) # 800013fc <_Z8sem_waitP4_sem>
    sem_wait(mutexTail);
    80003d34:	0304b503          	ld	a0,48(s1)
    80003d38:	ffffd097          	auipc	ra,0xffffd
    80003d3c:	6c4080e7          	jalr	1732(ra) # 800013fc <_Z8sem_waitP4_sem>

    if (tail >= head) {
    80003d40:	0144a783          	lw	a5,20(s1)
    80003d44:	0104a903          	lw	s2,16(s1)
    80003d48:	0327ce63          	blt	a5,s2,80003d84 <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    80003d4c:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    80003d50:	0304b503          	ld	a0,48(s1)
    80003d54:	ffffd097          	auipc	ra,0xffffd
    80003d58:	6d8080e7          	jalr	1752(ra) # 8000142c <_Z10sem_signalP4_sem>
    sem_signal(mutexHead);
    80003d5c:	0284b503          	ld	a0,40(s1)
    80003d60:	ffffd097          	auipc	ra,0xffffd
    80003d64:	6cc080e7          	jalr	1740(ra) # 8000142c <_Z10sem_signalP4_sem>

    return ret;
}
    80003d68:	00090513          	mv	a0,s2
    80003d6c:	01813083          	ld	ra,24(sp)
    80003d70:	01013403          	ld	s0,16(sp)
    80003d74:	00813483          	ld	s1,8(sp)
    80003d78:	00013903          	ld	s2,0(sp)
    80003d7c:	02010113          	addi	sp,sp,32
    80003d80:	00008067          	ret
        ret = cap - head + tail;
    80003d84:	0004a703          	lw	a4,0(s1)
    80003d88:	4127093b          	subw	s2,a4,s2
    80003d8c:	00f9093b          	addw	s2,s2,a5
    80003d90:	fc1ff06f          	j	80003d50 <_ZN6Buffer6getCntEv+0x44>

0000000080003d94 <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    80003d94:	fe010113          	addi	sp,sp,-32
    80003d98:	00113c23          	sd	ra,24(sp)
    80003d9c:	00813823          	sd	s0,16(sp)
    80003da0:	00913423          	sd	s1,8(sp)
    80003da4:	02010413          	addi	s0,sp,32
    80003da8:	00050493          	mv	s1,a0
    putc('\n');
    80003dac:	00a00513          	li	a0,10
    80003db0:	ffffd097          	auipc	ra,0xffffd
    80003db4:	708080e7          	jalr	1800(ra) # 800014b8 <_Z4putcc>
    printString("Buffer deleted!\n");
    80003db8:	00003517          	auipc	a0,0x3
    80003dbc:	30050513          	addi	a0,a0,768 # 800070b8 <_ZZ12printIntegermE6digits+0x10>
    80003dc0:	fffff097          	auipc	ra,0xfffff
    80003dc4:	1d4080e7          	jalr	468(ra) # 80002f94 <_Z11printStringPKc>
    while (getCnt() > 0) {
    80003dc8:	00048513          	mv	a0,s1
    80003dcc:	00000097          	auipc	ra,0x0
    80003dd0:	f40080e7          	jalr	-192(ra) # 80003d0c <_ZN6Buffer6getCntEv>
    80003dd4:	02a05c63          	blez	a0,80003e0c <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    80003dd8:	0084b783          	ld	a5,8(s1)
    80003ddc:	0104a703          	lw	a4,16(s1)
    80003de0:	00271713          	slli	a4,a4,0x2
    80003de4:	00e787b3          	add	a5,a5,a4
        putc(ch);
    80003de8:	0007c503          	lbu	a0,0(a5)
    80003dec:	ffffd097          	auipc	ra,0xffffd
    80003df0:	6cc080e7          	jalr	1740(ra) # 800014b8 <_Z4putcc>
        head = (head + 1) % cap;
    80003df4:	0104a783          	lw	a5,16(s1)
    80003df8:	0017879b          	addiw	a5,a5,1
    80003dfc:	0004a703          	lw	a4,0(s1)
    80003e00:	02e7e7bb          	remw	a5,a5,a4
    80003e04:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    80003e08:	fc1ff06f          	j	80003dc8 <_ZN6BufferD1Ev+0x34>
    putc('!');
    80003e0c:	02100513          	li	a0,33
    80003e10:	ffffd097          	auipc	ra,0xffffd
    80003e14:	6a8080e7          	jalr	1704(ra) # 800014b8 <_Z4putcc>
    putc('\n');
    80003e18:	00a00513          	li	a0,10
    80003e1c:	ffffd097          	auipc	ra,0xffffd
    80003e20:	69c080e7          	jalr	1692(ra) # 800014b8 <_Z4putcc>
    mem_free(buffer);
    80003e24:	0084b503          	ld	a0,8(s1)
    80003e28:	ffffd097          	auipc	ra,0xffffd
    80003e2c:	3c0080e7          	jalr	960(ra) # 800011e8 <_Z8mem_freePv>
    sem_close(itemAvailable);
    80003e30:	0204b503          	ld	a0,32(s1)
    80003e34:	ffffd097          	auipc	ra,0xffffd
    80003e38:	598080e7          	jalr	1432(ra) # 800013cc <_Z9sem_closeP4_sem>
    sem_close(spaceAvailable);
    80003e3c:	0184b503          	ld	a0,24(s1)
    80003e40:	ffffd097          	auipc	ra,0xffffd
    80003e44:	58c080e7          	jalr	1420(ra) # 800013cc <_Z9sem_closeP4_sem>
    sem_close(mutexTail);
    80003e48:	0304b503          	ld	a0,48(s1)
    80003e4c:	ffffd097          	auipc	ra,0xffffd
    80003e50:	580080e7          	jalr	1408(ra) # 800013cc <_Z9sem_closeP4_sem>
    sem_close(mutexHead);
    80003e54:	0284b503          	ld	a0,40(s1)
    80003e58:	ffffd097          	auipc	ra,0xffffd
    80003e5c:	574080e7          	jalr	1396(ra) # 800013cc <_Z9sem_closeP4_sem>
}
    80003e60:	01813083          	ld	ra,24(sp)
    80003e64:	01013403          	ld	s0,16(sp)
    80003e68:	00813483          	ld	s1,8(sp)
    80003e6c:	02010113          	addi	sp,sp,32
    80003e70:	00008067          	ret

0000000080003e74 <start>:
    80003e74:	ff010113          	addi	sp,sp,-16
    80003e78:	00813423          	sd	s0,8(sp)
    80003e7c:	01010413          	addi	s0,sp,16
    80003e80:	300027f3          	csrr	a5,mstatus
    80003e84:	ffffe737          	lui	a4,0xffffe
    80003e88:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff4c0f>
    80003e8c:	00e7f7b3          	and	a5,a5,a4
    80003e90:	00001737          	lui	a4,0x1
    80003e94:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80003e98:	00e7e7b3          	or	a5,a5,a4
    80003e9c:	30079073          	csrw	mstatus,a5
    80003ea0:	00000797          	auipc	a5,0x0
    80003ea4:	16078793          	addi	a5,a5,352 # 80004000 <system_main>
    80003ea8:	34179073          	csrw	mepc,a5
    80003eac:	00000793          	li	a5,0
    80003eb0:	18079073          	csrw	satp,a5
    80003eb4:	000107b7          	lui	a5,0x10
    80003eb8:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80003ebc:	30279073          	csrw	medeleg,a5
    80003ec0:	30379073          	csrw	mideleg,a5
    80003ec4:	104027f3          	csrr	a5,sie
    80003ec8:	2227e793          	ori	a5,a5,546
    80003ecc:	10479073          	csrw	sie,a5
    80003ed0:	fff00793          	li	a5,-1
    80003ed4:	00a7d793          	srli	a5,a5,0xa
    80003ed8:	3b079073          	csrw	pmpaddr0,a5
    80003edc:	00f00793          	li	a5,15
    80003ee0:	3a079073          	csrw	pmpcfg0,a5
    80003ee4:	f14027f3          	csrr	a5,mhartid
    80003ee8:	0200c737          	lui	a4,0x200c
    80003eec:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80003ef0:	0007869b          	sext.w	a3,a5
    80003ef4:	00269713          	slli	a4,a3,0x2
    80003ef8:	000f4637          	lui	a2,0xf4
    80003efc:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80003f00:	00d70733          	add	a4,a4,a3
    80003f04:	0037979b          	slliw	a5,a5,0x3
    80003f08:	020046b7          	lui	a3,0x2004
    80003f0c:	00d787b3          	add	a5,a5,a3
    80003f10:	00c585b3          	add	a1,a1,a2
    80003f14:	00371693          	slli	a3,a4,0x3
    80003f18:	00005717          	auipc	a4,0x5
    80003f1c:	a6870713          	addi	a4,a4,-1432 # 80008980 <timer_scratch>
    80003f20:	00b7b023          	sd	a1,0(a5)
    80003f24:	00d70733          	add	a4,a4,a3
    80003f28:	00f73c23          	sd	a5,24(a4)
    80003f2c:	02c73023          	sd	a2,32(a4)
    80003f30:	34071073          	csrw	mscratch,a4
    80003f34:	00000797          	auipc	a5,0x0
    80003f38:	6ec78793          	addi	a5,a5,1772 # 80004620 <timervec>
    80003f3c:	30579073          	csrw	mtvec,a5
    80003f40:	300027f3          	csrr	a5,mstatus
    80003f44:	0087e793          	ori	a5,a5,8
    80003f48:	30079073          	csrw	mstatus,a5
    80003f4c:	304027f3          	csrr	a5,mie
    80003f50:	0807e793          	ori	a5,a5,128
    80003f54:	30479073          	csrw	mie,a5
    80003f58:	f14027f3          	csrr	a5,mhartid
    80003f5c:	0007879b          	sext.w	a5,a5
    80003f60:	00078213          	mv	tp,a5
    80003f64:	30200073          	mret
    80003f68:	00813403          	ld	s0,8(sp)
    80003f6c:	01010113          	addi	sp,sp,16
    80003f70:	00008067          	ret

0000000080003f74 <timerinit>:
    80003f74:	ff010113          	addi	sp,sp,-16
    80003f78:	00813423          	sd	s0,8(sp)
    80003f7c:	01010413          	addi	s0,sp,16
    80003f80:	f14027f3          	csrr	a5,mhartid
    80003f84:	0200c737          	lui	a4,0x200c
    80003f88:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80003f8c:	0007869b          	sext.w	a3,a5
    80003f90:	00269713          	slli	a4,a3,0x2
    80003f94:	000f4637          	lui	a2,0xf4
    80003f98:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80003f9c:	00d70733          	add	a4,a4,a3
    80003fa0:	0037979b          	slliw	a5,a5,0x3
    80003fa4:	020046b7          	lui	a3,0x2004
    80003fa8:	00d787b3          	add	a5,a5,a3
    80003fac:	00c585b3          	add	a1,a1,a2
    80003fb0:	00371693          	slli	a3,a4,0x3
    80003fb4:	00005717          	auipc	a4,0x5
    80003fb8:	9cc70713          	addi	a4,a4,-1588 # 80008980 <timer_scratch>
    80003fbc:	00b7b023          	sd	a1,0(a5)
    80003fc0:	00d70733          	add	a4,a4,a3
    80003fc4:	00f73c23          	sd	a5,24(a4)
    80003fc8:	02c73023          	sd	a2,32(a4)
    80003fcc:	34071073          	csrw	mscratch,a4
    80003fd0:	00000797          	auipc	a5,0x0
    80003fd4:	65078793          	addi	a5,a5,1616 # 80004620 <timervec>
    80003fd8:	30579073          	csrw	mtvec,a5
    80003fdc:	300027f3          	csrr	a5,mstatus
    80003fe0:	0087e793          	ori	a5,a5,8
    80003fe4:	30079073          	csrw	mstatus,a5
    80003fe8:	304027f3          	csrr	a5,mie
    80003fec:	0807e793          	ori	a5,a5,128
    80003ff0:	30479073          	csrw	mie,a5
    80003ff4:	00813403          	ld	s0,8(sp)
    80003ff8:	01010113          	addi	sp,sp,16
    80003ffc:	00008067          	ret

0000000080004000 <system_main>:
    80004000:	fe010113          	addi	sp,sp,-32
    80004004:	00813823          	sd	s0,16(sp)
    80004008:	00913423          	sd	s1,8(sp)
    8000400c:	00113c23          	sd	ra,24(sp)
    80004010:	02010413          	addi	s0,sp,32
    80004014:	00000097          	auipc	ra,0x0
    80004018:	0c4080e7          	jalr	196(ra) # 800040d8 <cpuid>
    8000401c:	00004497          	auipc	s1,0x4
    80004020:	68448493          	addi	s1,s1,1668 # 800086a0 <started>
    80004024:	02050263          	beqz	a0,80004048 <system_main+0x48>
    80004028:	0004a783          	lw	a5,0(s1)
    8000402c:	0007879b          	sext.w	a5,a5
    80004030:	fe078ce3          	beqz	a5,80004028 <system_main+0x28>
    80004034:	0ff0000f          	fence
    80004038:	00003517          	auipc	a0,0x3
    8000403c:	1b050513          	addi	a0,a0,432 # 800071e8 <_ZZ12printIntegermE6digits+0x140>
    80004040:	00001097          	auipc	ra,0x1
    80004044:	a7c080e7          	jalr	-1412(ra) # 80004abc <panic>
    80004048:	00001097          	auipc	ra,0x1
    8000404c:	9d0080e7          	jalr	-1584(ra) # 80004a18 <consoleinit>
    80004050:	00001097          	auipc	ra,0x1
    80004054:	15c080e7          	jalr	348(ra) # 800051ac <printfinit>
    80004058:	00003517          	auipc	a0,0x3
    8000405c:	0b050513          	addi	a0,a0,176 # 80007108 <_ZZ12printIntegermE6digits+0x60>
    80004060:	00001097          	auipc	ra,0x1
    80004064:	ab8080e7          	jalr	-1352(ra) # 80004b18 <__printf>
    80004068:	00003517          	auipc	a0,0x3
    8000406c:	15050513          	addi	a0,a0,336 # 800071b8 <_ZZ12printIntegermE6digits+0x110>
    80004070:	00001097          	auipc	ra,0x1
    80004074:	aa8080e7          	jalr	-1368(ra) # 80004b18 <__printf>
    80004078:	00003517          	auipc	a0,0x3
    8000407c:	09050513          	addi	a0,a0,144 # 80007108 <_ZZ12printIntegermE6digits+0x60>
    80004080:	00001097          	auipc	ra,0x1
    80004084:	a98080e7          	jalr	-1384(ra) # 80004b18 <__printf>
    80004088:	00001097          	auipc	ra,0x1
    8000408c:	4b0080e7          	jalr	1200(ra) # 80005538 <kinit>
    80004090:	00000097          	auipc	ra,0x0
    80004094:	148080e7          	jalr	328(ra) # 800041d8 <trapinit>
    80004098:	00000097          	auipc	ra,0x0
    8000409c:	16c080e7          	jalr	364(ra) # 80004204 <trapinithart>
    800040a0:	00000097          	auipc	ra,0x0
    800040a4:	5c0080e7          	jalr	1472(ra) # 80004660 <plicinit>
    800040a8:	00000097          	auipc	ra,0x0
    800040ac:	5e0080e7          	jalr	1504(ra) # 80004688 <plicinithart>
    800040b0:	00000097          	auipc	ra,0x0
    800040b4:	078080e7          	jalr	120(ra) # 80004128 <userinit>
    800040b8:	0ff0000f          	fence
    800040bc:	00100793          	li	a5,1
    800040c0:	00003517          	auipc	a0,0x3
    800040c4:	11050513          	addi	a0,a0,272 # 800071d0 <_ZZ12printIntegermE6digits+0x128>
    800040c8:	00f4a023          	sw	a5,0(s1)
    800040cc:	00001097          	auipc	ra,0x1
    800040d0:	a4c080e7          	jalr	-1460(ra) # 80004b18 <__printf>
    800040d4:	0000006f          	j	800040d4 <system_main+0xd4>

00000000800040d8 <cpuid>:
    800040d8:	ff010113          	addi	sp,sp,-16
    800040dc:	00813423          	sd	s0,8(sp)
    800040e0:	01010413          	addi	s0,sp,16
    800040e4:	00020513          	mv	a0,tp
    800040e8:	00813403          	ld	s0,8(sp)
    800040ec:	0005051b          	sext.w	a0,a0
    800040f0:	01010113          	addi	sp,sp,16
    800040f4:	00008067          	ret

00000000800040f8 <mycpu>:
    800040f8:	ff010113          	addi	sp,sp,-16
    800040fc:	00813423          	sd	s0,8(sp)
    80004100:	01010413          	addi	s0,sp,16
    80004104:	00020793          	mv	a5,tp
    80004108:	00813403          	ld	s0,8(sp)
    8000410c:	0007879b          	sext.w	a5,a5
    80004110:	00779793          	slli	a5,a5,0x7
    80004114:	00006517          	auipc	a0,0x6
    80004118:	89c50513          	addi	a0,a0,-1892 # 800099b0 <cpus>
    8000411c:	00f50533          	add	a0,a0,a5
    80004120:	01010113          	addi	sp,sp,16
    80004124:	00008067          	ret

0000000080004128 <userinit>:
    80004128:	ff010113          	addi	sp,sp,-16
    8000412c:	00813423          	sd	s0,8(sp)
    80004130:	01010413          	addi	s0,sp,16
    80004134:	00813403          	ld	s0,8(sp)
    80004138:	01010113          	addi	sp,sp,16
    8000413c:	ffffe317          	auipc	t1,0xffffe
    80004140:	af830067          	jr	-1288(t1) # 80001c34 <main>

0000000080004144 <either_copyout>:
    80004144:	ff010113          	addi	sp,sp,-16
    80004148:	00813023          	sd	s0,0(sp)
    8000414c:	00113423          	sd	ra,8(sp)
    80004150:	01010413          	addi	s0,sp,16
    80004154:	02051663          	bnez	a0,80004180 <either_copyout+0x3c>
    80004158:	00058513          	mv	a0,a1
    8000415c:	00060593          	mv	a1,a2
    80004160:	0006861b          	sext.w	a2,a3
    80004164:	00002097          	auipc	ra,0x2
    80004168:	c60080e7          	jalr	-928(ra) # 80005dc4 <__memmove>
    8000416c:	00813083          	ld	ra,8(sp)
    80004170:	00013403          	ld	s0,0(sp)
    80004174:	00000513          	li	a0,0
    80004178:	01010113          	addi	sp,sp,16
    8000417c:	00008067          	ret
    80004180:	00003517          	auipc	a0,0x3
    80004184:	09050513          	addi	a0,a0,144 # 80007210 <_ZZ12printIntegermE6digits+0x168>
    80004188:	00001097          	auipc	ra,0x1
    8000418c:	934080e7          	jalr	-1740(ra) # 80004abc <panic>

0000000080004190 <either_copyin>:
    80004190:	ff010113          	addi	sp,sp,-16
    80004194:	00813023          	sd	s0,0(sp)
    80004198:	00113423          	sd	ra,8(sp)
    8000419c:	01010413          	addi	s0,sp,16
    800041a0:	02059463          	bnez	a1,800041c8 <either_copyin+0x38>
    800041a4:	00060593          	mv	a1,a2
    800041a8:	0006861b          	sext.w	a2,a3
    800041ac:	00002097          	auipc	ra,0x2
    800041b0:	c18080e7          	jalr	-1000(ra) # 80005dc4 <__memmove>
    800041b4:	00813083          	ld	ra,8(sp)
    800041b8:	00013403          	ld	s0,0(sp)
    800041bc:	00000513          	li	a0,0
    800041c0:	01010113          	addi	sp,sp,16
    800041c4:	00008067          	ret
    800041c8:	00003517          	auipc	a0,0x3
    800041cc:	07050513          	addi	a0,a0,112 # 80007238 <_ZZ12printIntegermE6digits+0x190>
    800041d0:	00001097          	auipc	ra,0x1
    800041d4:	8ec080e7          	jalr	-1812(ra) # 80004abc <panic>

00000000800041d8 <trapinit>:
    800041d8:	ff010113          	addi	sp,sp,-16
    800041dc:	00813423          	sd	s0,8(sp)
    800041e0:	01010413          	addi	s0,sp,16
    800041e4:	00813403          	ld	s0,8(sp)
    800041e8:	00003597          	auipc	a1,0x3
    800041ec:	07858593          	addi	a1,a1,120 # 80007260 <_ZZ12printIntegermE6digits+0x1b8>
    800041f0:	00006517          	auipc	a0,0x6
    800041f4:	84050513          	addi	a0,a0,-1984 # 80009a30 <tickslock>
    800041f8:	01010113          	addi	sp,sp,16
    800041fc:	00001317          	auipc	t1,0x1
    80004200:	5cc30067          	jr	1484(t1) # 800057c8 <initlock>

0000000080004204 <trapinithart>:
    80004204:	ff010113          	addi	sp,sp,-16
    80004208:	00813423          	sd	s0,8(sp)
    8000420c:	01010413          	addi	s0,sp,16
    80004210:	00000797          	auipc	a5,0x0
    80004214:	30078793          	addi	a5,a5,768 # 80004510 <kernelvec>
    80004218:	10579073          	csrw	stvec,a5
    8000421c:	00813403          	ld	s0,8(sp)
    80004220:	01010113          	addi	sp,sp,16
    80004224:	00008067          	ret

0000000080004228 <usertrap>:
    80004228:	ff010113          	addi	sp,sp,-16
    8000422c:	00813423          	sd	s0,8(sp)
    80004230:	01010413          	addi	s0,sp,16
    80004234:	00813403          	ld	s0,8(sp)
    80004238:	01010113          	addi	sp,sp,16
    8000423c:	00008067          	ret

0000000080004240 <usertrapret>:
    80004240:	ff010113          	addi	sp,sp,-16
    80004244:	00813423          	sd	s0,8(sp)
    80004248:	01010413          	addi	s0,sp,16
    8000424c:	00813403          	ld	s0,8(sp)
    80004250:	01010113          	addi	sp,sp,16
    80004254:	00008067          	ret

0000000080004258 <kerneltrap>:
    80004258:	fe010113          	addi	sp,sp,-32
    8000425c:	00813823          	sd	s0,16(sp)
    80004260:	00113c23          	sd	ra,24(sp)
    80004264:	00913423          	sd	s1,8(sp)
    80004268:	02010413          	addi	s0,sp,32
    8000426c:	142025f3          	csrr	a1,scause
    80004270:	100027f3          	csrr	a5,sstatus
    80004274:	0027f793          	andi	a5,a5,2
    80004278:	10079c63          	bnez	a5,80004390 <kerneltrap+0x138>
    8000427c:	142027f3          	csrr	a5,scause
    80004280:	0207ce63          	bltz	a5,800042bc <kerneltrap+0x64>
    80004284:	00003517          	auipc	a0,0x3
    80004288:	02450513          	addi	a0,a0,36 # 800072a8 <_ZZ12printIntegermE6digits+0x200>
    8000428c:	00001097          	auipc	ra,0x1
    80004290:	88c080e7          	jalr	-1908(ra) # 80004b18 <__printf>
    80004294:	141025f3          	csrr	a1,sepc
    80004298:	14302673          	csrr	a2,stval
    8000429c:	00003517          	auipc	a0,0x3
    800042a0:	01c50513          	addi	a0,a0,28 # 800072b8 <_ZZ12printIntegermE6digits+0x210>
    800042a4:	00001097          	auipc	ra,0x1
    800042a8:	874080e7          	jalr	-1932(ra) # 80004b18 <__printf>
    800042ac:	00003517          	auipc	a0,0x3
    800042b0:	02450513          	addi	a0,a0,36 # 800072d0 <_ZZ12printIntegermE6digits+0x228>
    800042b4:	00001097          	auipc	ra,0x1
    800042b8:	808080e7          	jalr	-2040(ra) # 80004abc <panic>
    800042bc:	0ff7f713          	andi	a4,a5,255
    800042c0:	00900693          	li	a3,9
    800042c4:	04d70063          	beq	a4,a3,80004304 <kerneltrap+0xac>
    800042c8:	fff00713          	li	a4,-1
    800042cc:	03f71713          	slli	a4,a4,0x3f
    800042d0:	00170713          	addi	a4,a4,1
    800042d4:	fae798e3          	bne	a5,a4,80004284 <kerneltrap+0x2c>
    800042d8:	00000097          	auipc	ra,0x0
    800042dc:	e00080e7          	jalr	-512(ra) # 800040d8 <cpuid>
    800042e0:	06050663          	beqz	a0,8000434c <kerneltrap+0xf4>
    800042e4:	144027f3          	csrr	a5,sip
    800042e8:	ffd7f793          	andi	a5,a5,-3
    800042ec:	14479073          	csrw	sip,a5
    800042f0:	01813083          	ld	ra,24(sp)
    800042f4:	01013403          	ld	s0,16(sp)
    800042f8:	00813483          	ld	s1,8(sp)
    800042fc:	02010113          	addi	sp,sp,32
    80004300:	00008067          	ret
    80004304:	00000097          	auipc	ra,0x0
    80004308:	3d0080e7          	jalr	976(ra) # 800046d4 <plic_claim>
    8000430c:	00a00793          	li	a5,10
    80004310:	00050493          	mv	s1,a0
    80004314:	06f50863          	beq	a0,a5,80004384 <kerneltrap+0x12c>
    80004318:	fc050ce3          	beqz	a0,800042f0 <kerneltrap+0x98>
    8000431c:	00050593          	mv	a1,a0
    80004320:	00003517          	auipc	a0,0x3
    80004324:	f6850513          	addi	a0,a0,-152 # 80007288 <_ZZ12printIntegermE6digits+0x1e0>
    80004328:	00000097          	auipc	ra,0x0
    8000432c:	7f0080e7          	jalr	2032(ra) # 80004b18 <__printf>
    80004330:	01013403          	ld	s0,16(sp)
    80004334:	01813083          	ld	ra,24(sp)
    80004338:	00048513          	mv	a0,s1
    8000433c:	00813483          	ld	s1,8(sp)
    80004340:	02010113          	addi	sp,sp,32
    80004344:	00000317          	auipc	t1,0x0
    80004348:	3c830067          	jr	968(t1) # 8000470c <plic_complete>
    8000434c:	00005517          	auipc	a0,0x5
    80004350:	6e450513          	addi	a0,a0,1764 # 80009a30 <tickslock>
    80004354:	00001097          	auipc	ra,0x1
    80004358:	498080e7          	jalr	1176(ra) # 800057ec <acquire>
    8000435c:	00004717          	auipc	a4,0x4
    80004360:	34870713          	addi	a4,a4,840 # 800086a4 <ticks>
    80004364:	00072783          	lw	a5,0(a4)
    80004368:	00005517          	auipc	a0,0x5
    8000436c:	6c850513          	addi	a0,a0,1736 # 80009a30 <tickslock>
    80004370:	0017879b          	addiw	a5,a5,1
    80004374:	00f72023          	sw	a5,0(a4)
    80004378:	00001097          	auipc	ra,0x1
    8000437c:	540080e7          	jalr	1344(ra) # 800058b8 <release>
    80004380:	f65ff06f          	j	800042e4 <kerneltrap+0x8c>
    80004384:	00001097          	auipc	ra,0x1
    80004388:	09c080e7          	jalr	156(ra) # 80005420 <uartintr>
    8000438c:	fa5ff06f          	j	80004330 <kerneltrap+0xd8>
    80004390:	00003517          	auipc	a0,0x3
    80004394:	ed850513          	addi	a0,a0,-296 # 80007268 <_ZZ12printIntegermE6digits+0x1c0>
    80004398:	00000097          	auipc	ra,0x0
    8000439c:	724080e7          	jalr	1828(ra) # 80004abc <panic>

00000000800043a0 <clockintr>:
    800043a0:	fe010113          	addi	sp,sp,-32
    800043a4:	00813823          	sd	s0,16(sp)
    800043a8:	00913423          	sd	s1,8(sp)
    800043ac:	00113c23          	sd	ra,24(sp)
    800043b0:	02010413          	addi	s0,sp,32
    800043b4:	00005497          	auipc	s1,0x5
    800043b8:	67c48493          	addi	s1,s1,1660 # 80009a30 <tickslock>
    800043bc:	00048513          	mv	a0,s1
    800043c0:	00001097          	auipc	ra,0x1
    800043c4:	42c080e7          	jalr	1068(ra) # 800057ec <acquire>
    800043c8:	00004717          	auipc	a4,0x4
    800043cc:	2dc70713          	addi	a4,a4,732 # 800086a4 <ticks>
    800043d0:	00072783          	lw	a5,0(a4)
    800043d4:	01013403          	ld	s0,16(sp)
    800043d8:	01813083          	ld	ra,24(sp)
    800043dc:	00048513          	mv	a0,s1
    800043e0:	0017879b          	addiw	a5,a5,1
    800043e4:	00813483          	ld	s1,8(sp)
    800043e8:	00f72023          	sw	a5,0(a4)
    800043ec:	02010113          	addi	sp,sp,32
    800043f0:	00001317          	auipc	t1,0x1
    800043f4:	4c830067          	jr	1224(t1) # 800058b8 <release>

00000000800043f8 <devintr>:
    800043f8:	142027f3          	csrr	a5,scause
    800043fc:	00000513          	li	a0,0
    80004400:	0007c463          	bltz	a5,80004408 <devintr+0x10>
    80004404:	00008067          	ret
    80004408:	fe010113          	addi	sp,sp,-32
    8000440c:	00813823          	sd	s0,16(sp)
    80004410:	00113c23          	sd	ra,24(sp)
    80004414:	00913423          	sd	s1,8(sp)
    80004418:	02010413          	addi	s0,sp,32
    8000441c:	0ff7f713          	andi	a4,a5,255
    80004420:	00900693          	li	a3,9
    80004424:	04d70c63          	beq	a4,a3,8000447c <devintr+0x84>
    80004428:	fff00713          	li	a4,-1
    8000442c:	03f71713          	slli	a4,a4,0x3f
    80004430:	00170713          	addi	a4,a4,1
    80004434:	00e78c63          	beq	a5,a4,8000444c <devintr+0x54>
    80004438:	01813083          	ld	ra,24(sp)
    8000443c:	01013403          	ld	s0,16(sp)
    80004440:	00813483          	ld	s1,8(sp)
    80004444:	02010113          	addi	sp,sp,32
    80004448:	00008067          	ret
    8000444c:	00000097          	auipc	ra,0x0
    80004450:	c8c080e7          	jalr	-884(ra) # 800040d8 <cpuid>
    80004454:	06050663          	beqz	a0,800044c0 <devintr+0xc8>
    80004458:	144027f3          	csrr	a5,sip
    8000445c:	ffd7f793          	andi	a5,a5,-3
    80004460:	14479073          	csrw	sip,a5
    80004464:	01813083          	ld	ra,24(sp)
    80004468:	01013403          	ld	s0,16(sp)
    8000446c:	00813483          	ld	s1,8(sp)
    80004470:	00200513          	li	a0,2
    80004474:	02010113          	addi	sp,sp,32
    80004478:	00008067          	ret
    8000447c:	00000097          	auipc	ra,0x0
    80004480:	258080e7          	jalr	600(ra) # 800046d4 <plic_claim>
    80004484:	00a00793          	li	a5,10
    80004488:	00050493          	mv	s1,a0
    8000448c:	06f50663          	beq	a0,a5,800044f8 <devintr+0x100>
    80004490:	00100513          	li	a0,1
    80004494:	fa0482e3          	beqz	s1,80004438 <devintr+0x40>
    80004498:	00048593          	mv	a1,s1
    8000449c:	00003517          	auipc	a0,0x3
    800044a0:	dec50513          	addi	a0,a0,-532 # 80007288 <_ZZ12printIntegermE6digits+0x1e0>
    800044a4:	00000097          	auipc	ra,0x0
    800044a8:	674080e7          	jalr	1652(ra) # 80004b18 <__printf>
    800044ac:	00048513          	mv	a0,s1
    800044b0:	00000097          	auipc	ra,0x0
    800044b4:	25c080e7          	jalr	604(ra) # 8000470c <plic_complete>
    800044b8:	00100513          	li	a0,1
    800044bc:	f7dff06f          	j	80004438 <devintr+0x40>
    800044c0:	00005517          	auipc	a0,0x5
    800044c4:	57050513          	addi	a0,a0,1392 # 80009a30 <tickslock>
    800044c8:	00001097          	auipc	ra,0x1
    800044cc:	324080e7          	jalr	804(ra) # 800057ec <acquire>
    800044d0:	00004717          	auipc	a4,0x4
    800044d4:	1d470713          	addi	a4,a4,468 # 800086a4 <ticks>
    800044d8:	00072783          	lw	a5,0(a4)
    800044dc:	00005517          	auipc	a0,0x5
    800044e0:	55450513          	addi	a0,a0,1364 # 80009a30 <tickslock>
    800044e4:	0017879b          	addiw	a5,a5,1
    800044e8:	00f72023          	sw	a5,0(a4)
    800044ec:	00001097          	auipc	ra,0x1
    800044f0:	3cc080e7          	jalr	972(ra) # 800058b8 <release>
    800044f4:	f65ff06f          	j	80004458 <devintr+0x60>
    800044f8:	00001097          	auipc	ra,0x1
    800044fc:	f28080e7          	jalr	-216(ra) # 80005420 <uartintr>
    80004500:	fadff06f          	j	800044ac <devintr+0xb4>
	...

0000000080004510 <kernelvec>:
    80004510:	f0010113          	addi	sp,sp,-256
    80004514:	00113023          	sd	ra,0(sp)
    80004518:	00213423          	sd	sp,8(sp)
    8000451c:	00313823          	sd	gp,16(sp)
    80004520:	00413c23          	sd	tp,24(sp)
    80004524:	02513023          	sd	t0,32(sp)
    80004528:	02613423          	sd	t1,40(sp)
    8000452c:	02713823          	sd	t2,48(sp)
    80004530:	02813c23          	sd	s0,56(sp)
    80004534:	04913023          	sd	s1,64(sp)
    80004538:	04a13423          	sd	a0,72(sp)
    8000453c:	04b13823          	sd	a1,80(sp)
    80004540:	04c13c23          	sd	a2,88(sp)
    80004544:	06d13023          	sd	a3,96(sp)
    80004548:	06e13423          	sd	a4,104(sp)
    8000454c:	06f13823          	sd	a5,112(sp)
    80004550:	07013c23          	sd	a6,120(sp)
    80004554:	09113023          	sd	a7,128(sp)
    80004558:	09213423          	sd	s2,136(sp)
    8000455c:	09313823          	sd	s3,144(sp)
    80004560:	09413c23          	sd	s4,152(sp)
    80004564:	0b513023          	sd	s5,160(sp)
    80004568:	0b613423          	sd	s6,168(sp)
    8000456c:	0b713823          	sd	s7,176(sp)
    80004570:	0b813c23          	sd	s8,184(sp)
    80004574:	0d913023          	sd	s9,192(sp)
    80004578:	0da13423          	sd	s10,200(sp)
    8000457c:	0db13823          	sd	s11,208(sp)
    80004580:	0dc13c23          	sd	t3,216(sp)
    80004584:	0fd13023          	sd	t4,224(sp)
    80004588:	0fe13423          	sd	t5,232(sp)
    8000458c:	0ff13823          	sd	t6,240(sp)
    80004590:	cc9ff0ef          	jal	ra,80004258 <kerneltrap>
    80004594:	00013083          	ld	ra,0(sp)
    80004598:	00813103          	ld	sp,8(sp)
    8000459c:	01013183          	ld	gp,16(sp)
    800045a0:	02013283          	ld	t0,32(sp)
    800045a4:	02813303          	ld	t1,40(sp)
    800045a8:	03013383          	ld	t2,48(sp)
    800045ac:	03813403          	ld	s0,56(sp)
    800045b0:	04013483          	ld	s1,64(sp)
    800045b4:	04813503          	ld	a0,72(sp)
    800045b8:	05013583          	ld	a1,80(sp)
    800045bc:	05813603          	ld	a2,88(sp)
    800045c0:	06013683          	ld	a3,96(sp)
    800045c4:	06813703          	ld	a4,104(sp)
    800045c8:	07013783          	ld	a5,112(sp)
    800045cc:	07813803          	ld	a6,120(sp)
    800045d0:	08013883          	ld	a7,128(sp)
    800045d4:	08813903          	ld	s2,136(sp)
    800045d8:	09013983          	ld	s3,144(sp)
    800045dc:	09813a03          	ld	s4,152(sp)
    800045e0:	0a013a83          	ld	s5,160(sp)
    800045e4:	0a813b03          	ld	s6,168(sp)
    800045e8:	0b013b83          	ld	s7,176(sp)
    800045ec:	0b813c03          	ld	s8,184(sp)
    800045f0:	0c013c83          	ld	s9,192(sp)
    800045f4:	0c813d03          	ld	s10,200(sp)
    800045f8:	0d013d83          	ld	s11,208(sp)
    800045fc:	0d813e03          	ld	t3,216(sp)
    80004600:	0e013e83          	ld	t4,224(sp)
    80004604:	0e813f03          	ld	t5,232(sp)
    80004608:	0f013f83          	ld	t6,240(sp)
    8000460c:	10010113          	addi	sp,sp,256
    80004610:	10200073          	sret
    80004614:	00000013          	nop
    80004618:	00000013          	nop
    8000461c:	00000013          	nop

0000000080004620 <timervec>:
    80004620:	34051573          	csrrw	a0,mscratch,a0
    80004624:	00b53023          	sd	a1,0(a0)
    80004628:	00c53423          	sd	a2,8(a0)
    8000462c:	00d53823          	sd	a3,16(a0)
    80004630:	01853583          	ld	a1,24(a0)
    80004634:	02053603          	ld	a2,32(a0)
    80004638:	0005b683          	ld	a3,0(a1)
    8000463c:	00c686b3          	add	a3,a3,a2
    80004640:	00d5b023          	sd	a3,0(a1)
    80004644:	00200593          	li	a1,2
    80004648:	14459073          	csrw	sip,a1
    8000464c:	01053683          	ld	a3,16(a0)
    80004650:	00853603          	ld	a2,8(a0)
    80004654:	00053583          	ld	a1,0(a0)
    80004658:	34051573          	csrrw	a0,mscratch,a0
    8000465c:	30200073          	mret

0000000080004660 <plicinit>:
    80004660:	ff010113          	addi	sp,sp,-16
    80004664:	00813423          	sd	s0,8(sp)
    80004668:	01010413          	addi	s0,sp,16
    8000466c:	00813403          	ld	s0,8(sp)
    80004670:	0c0007b7          	lui	a5,0xc000
    80004674:	00100713          	li	a4,1
    80004678:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000467c:	00e7a223          	sw	a4,4(a5)
    80004680:	01010113          	addi	sp,sp,16
    80004684:	00008067          	ret

0000000080004688 <plicinithart>:
    80004688:	ff010113          	addi	sp,sp,-16
    8000468c:	00813023          	sd	s0,0(sp)
    80004690:	00113423          	sd	ra,8(sp)
    80004694:	01010413          	addi	s0,sp,16
    80004698:	00000097          	auipc	ra,0x0
    8000469c:	a40080e7          	jalr	-1472(ra) # 800040d8 <cpuid>
    800046a0:	0085171b          	slliw	a4,a0,0x8
    800046a4:	0c0027b7          	lui	a5,0xc002
    800046a8:	00e787b3          	add	a5,a5,a4
    800046ac:	40200713          	li	a4,1026
    800046b0:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    800046b4:	00813083          	ld	ra,8(sp)
    800046b8:	00013403          	ld	s0,0(sp)
    800046bc:	00d5151b          	slliw	a0,a0,0xd
    800046c0:	0c2017b7          	lui	a5,0xc201
    800046c4:	00a78533          	add	a0,a5,a0
    800046c8:	00052023          	sw	zero,0(a0)
    800046cc:	01010113          	addi	sp,sp,16
    800046d0:	00008067          	ret

00000000800046d4 <plic_claim>:
    800046d4:	ff010113          	addi	sp,sp,-16
    800046d8:	00813023          	sd	s0,0(sp)
    800046dc:	00113423          	sd	ra,8(sp)
    800046e0:	01010413          	addi	s0,sp,16
    800046e4:	00000097          	auipc	ra,0x0
    800046e8:	9f4080e7          	jalr	-1548(ra) # 800040d8 <cpuid>
    800046ec:	00813083          	ld	ra,8(sp)
    800046f0:	00013403          	ld	s0,0(sp)
    800046f4:	00d5151b          	slliw	a0,a0,0xd
    800046f8:	0c2017b7          	lui	a5,0xc201
    800046fc:	00a78533          	add	a0,a5,a0
    80004700:	00452503          	lw	a0,4(a0)
    80004704:	01010113          	addi	sp,sp,16
    80004708:	00008067          	ret

000000008000470c <plic_complete>:
    8000470c:	fe010113          	addi	sp,sp,-32
    80004710:	00813823          	sd	s0,16(sp)
    80004714:	00913423          	sd	s1,8(sp)
    80004718:	00113c23          	sd	ra,24(sp)
    8000471c:	02010413          	addi	s0,sp,32
    80004720:	00050493          	mv	s1,a0
    80004724:	00000097          	auipc	ra,0x0
    80004728:	9b4080e7          	jalr	-1612(ra) # 800040d8 <cpuid>
    8000472c:	01813083          	ld	ra,24(sp)
    80004730:	01013403          	ld	s0,16(sp)
    80004734:	00d5179b          	slliw	a5,a0,0xd
    80004738:	0c201737          	lui	a4,0xc201
    8000473c:	00f707b3          	add	a5,a4,a5
    80004740:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80004744:	00813483          	ld	s1,8(sp)
    80004748:	02010113          	addi	sp,sp,32
    8000474c:	00008067          	ret

0000000080004750 <consolewrite>:
    80004750:	fb010113          	addi	sp,sp,-80
    80004754:	04813023          	sd	s0,64(sp)
    80004758:	04113423          	sd	ra,72(sp)
    8000475c:	02913c23          	sd	s1,56(sp)
    80004760:	03213823          	sd	s2,48(sp)
    80004764:	03313423          	sd	s3,40(sp)
    80004768:	03413023          	sd	s4,32(sp)
    8000476c:	01513c23          	sd	s5,24(sp)
    80004770:	05010413          	addi	s0,sp,80
    80004774:	06c05c63          	blez	a2,800047ec <consolewrite+0x9c>
    80004778:	00060993          	mv	s3,a2
    8000477c:	00050a13          	mv	s4,a0
    80004780:	00058493          	mv	s1,a1
    80004784:	00000913          	li	s2,0
    80004788:	fff00a93          	li	s5,-1
    8000478c:	01c0006f          	j	800047a8 <consolewrite+0x58>
    80004790:	fbf44503          	lbu	a0,-65(s0)
    80004794:	0019091b          	addiw	s2,s2,1
    80004798:	00148493          	addi	s1,s1,1
    8000479c:	00001097          	auipc	ra,0x1
    800047a0:	a9c080e7          	jalr	-1380(ra) # 80005238 <uartputc>
    800047a4:	03298063          	beq	s3,s2,800047c4 <consolewrite+0x74>
    800047a8:	00048613          	mv	a2,s1
    800047ac:	00100693          	li	a3,1
    800047b0:	000a0593          	mv	a1,s4
    800047b4:	fbf40513          	addi	a0,s0,-65
    800047b8:	00000097          	auipc	ra,0x0
    800047bc:	9d8080e7          	jalr	-1576(ra) # 80004190 <either_copyin>
    800047c0:	fd5518e3          	bne	a0,s5,80004790 <consolewrite+0x40>
    800047c4:	04813083          	ld	ra,72(sp)
    800047c8:	04013403          	ld	s0,64(sp)
    800047cc:	03813483          	ld	s1,56(sp)
    800047d0:	02813983          	ld	s3,40(sp)
    800047d4:	02013a03          	ld	s4,32(sp)
    800047d8:	01813a83          	ld	s5,24(sp)
    800047dc:	00090513          	mv	a0,s2
    800047e0:	03013903          	ld	s2,48(sp)
    800047e4:	05010113          	addi	sp,sp,80
    800047e8:	00008067          	ret
    800047ec:	00000913          	li	s2,0
    800047f0:	fd5ff06f          	j	800047c4 <consolewrite+0x74>

00000000800047f4 <consoleread>:
    800047f4:	f9010113          	addi	sp,sp,-112
    800047f8:	06813023          	sd	s0,96(sp)
    800047fc:	04913c23          	sd	s1,88(sp)
    80004800:	05213823          	sd	s2,80(sp)
    80004804:	05313423          	sd	s3,72(sp)
    80004808:	05413023          	sd	s4,64(sp)
    8000480c:	03513c23          	sd	s5,56(sp)
    80004810:	03613823          	sd	s6,48(sp)
    80004814:	03713423          	sd	s7,40(sp)
    80004818:	03813023          	sd	s8,32(sp)
    8000481c:	06113423          	sd	ra,104(sp)
    80004820:	01913c23          	sd	s9,24(sp)
    80004824:	07010413          	addi	s0,sp,112
    80004828:	00060b93          	mv	s7,a2
    8000482c:	00050913          	mv	s2,a0
    80004830:	00058c13          	mv	s8,a1
    80004834:	00060b1b          	sext.w	s6,a2
    80004838:	00005497          	auipc	s1,0x5
    8000483c:	22048493          	addi	s1,s1,544 # 80009a58 <cons>
    80004840:	00400993          	li	s3,4
    80004844:	fff00a13          	li	s4,-1
    80004848:	00a00a93          	li	s5,10
    8000484c:	05705e63          	blez	s7,800048a8 <consoleread+0xb4>
    80004850:	09c4a703          	lw	a4,156(s1)
    80004854:	0984a783          	lw	a5,152(s1)
    80004858:	0007071b          	sext.w	a4,a4
    8000485c:	08e78463          	beq	a5,a4,800048e4 <consoleread+0xf0>
    80004860:	07f7f713          	andi	a4,a5,127
    80004864:	00e48733          	add	a4,s1,a4
    80004868:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    8000486c:	0017869b          	addiw	a3,a5,1
    80004870:	08d4ac23          	sw	a3,152(s1)
    80004874:	00070c9b          	sext.w	s9,a4
    80004878:	0b370663          	beq	a4,s3,80004924 <consoleread+0x130>
    8000487c:	00100693          	li	a3,1
    80004880:	f9f40613          	addi	a2,s0,-97
    80004884:	000c0593          	mv	a1,s8
    80004888:	00090513          	mv	a0,s2
    8000488c:	f8e40fa3          	sb	a4,-97(s0)
    80004890:	00000097          	auipc	ra,0x0
    80004894:	8b4080e7          	jalr	-1868(ra) # 80004144 <either_copyout>
    80004898:	01450863          	beq	a0,s4,800048a8 <consoleread+0xb4>
    8000489c:	001c0c13          	addi	s8,s8,1
    800048a0:	fffb8b9b          	addiw	s7,s7,-1
    800048a4:	fb5c94e3          	bne	s9,s5,8000484c <consoleread+0x58>
    800048a8:	000b851b          	sext.w	a0,s7
    800048ac:	06813083          	ld	ra,104(sp)
    800048b0:	06013403          	ld	s0,96(sp)
    800048b4:	05813483          	ld	s1,88(sp)
    800048b8:	05013903          	ld	s2,80(sp)
    800048bc:	04813983          	ld	s3,72(sp)
    800048c0:	04013a03          	ld	s4,64(sp)
    800048c4:	03813a83          	ld	s5,56(sp)
    800048c8:	02813b83          	ld	s7,40(sp)
    800048cc:	02013c03          	ld	s8,32(sp)
    800048d0:	01813c83          	ld	s9,24(sp)
    800048d4:	40ab053b          	subw	a0,s6,a0
    800048d8:	03013b03          	ld	s6,48(sp)
    800048dc:	07010113          	addi	sp,sp,112
    800048e0:	00008067          	ret
    800048e4:	00001097          	auipc	ra,0x1
    800048e8:	1d8080e7          	jalr	472(ra) # 80005abc <push_on>
    800048ec:	0984a703          	lw	a4,152(s1)
    800048f0:	09c4a783          	lw	a5,156(s1)
    800048f4:	0007879b          	sext.w	a5,a5
    800048f8:	fef70ce3          	beq	a4,a5,800048f0 <consoleread+0xfc>
    800048fc:	00001097          	auipc	ra,0x1
    80004900:	234080e7          	jalr	564(ra) # 80005b30 <pop_on>
    80004904:	0984a783          	lw	a5,152(s1)
    80004908:	07f7f713          	andi	a4,a5,127
    8000490c:	00e48733          	add	a4,s1,a4
    80004910:	01874703          	lbu	a4,24(a4)
    80004914:	0017869b          	addiw	a3,a5,1
    80004918:	08d4ac23          	sw	a3,152(s1)
    8000491c:	00070c9b          	sext.w	s9,a4
    80004920:	f5371ee3          	bne	a4,s3,8000487c <consoleread+0x88>
    80004924:	000b851b          	sext.w	a0,s7
    80004928:	f96bf2e3          	bgeu	s7,s6,800048ac <consoleread+0xb8>
    8000492c:	08f4ac23          	sw	a5,152(s1)
    80004930:	f7dff06f          	j	800048ac <consoleread+0xb8>

0000000080004934 <consputc>:
    80004934:	10000793          	li	a5,256
    80004938:	00f50663          	beq	a0,a5,80004944 <consputc+0x10>
    8000493c:	00001317          	auipc	t1,0x1
    80004940:	9f430067          	jr	-1548(t1) # 80005330 <uartputc_sync>
    80004944:	ff010113          	addi	sp,sp,-16
    80004948:	00113423          	sd	ra,8(sp)
    8000494c:	00813023          	sd	s0,0(sp)
    80004950:	01010413          	addi	s0,sp,16
    80004954:	00800513          	li	a0,8
    80004958:	00001097          	auipc	ra,0x1
    8000495c:	9d8080e7          	jalr	-1576(ra) # 80005330 <uartputc_sync>
    80004960:	02000513          	li	a0,32
    80004964:	00001097          	auipc	ra,0x1
    80004968:	9cc080e7          	jalr	-1588(ra) # 80005330 <uartputc_sync>
    8000496c:	00013403          	ld	s0,0(sp)
    80004970:	00813083          	ld	ra,8(sp)
    80004974:	00800513          	li	a0,8
    80004978:	01010113          	addi	sp,sp,16
    8000497c:	00001317          	auipc	t1,0x1
    80004980:	9b430067          	jr	-1612(t1) # 80005330 <uartputc_sync>

0000000080004984 <consoleintr>:
    80004984:	fe010113          	addi	sp,sp,-32
    80004988:	00813823          	sd	s0,16(sp)
    8000498c:	00913423          	sd	s1,8(sp)
    80004990:	01213023          	sd	s2,0(sp)
    80004994:	00113c23          	sd	ra,24(sp)
    80004998:	02010413          	addi	s0,sp,32
    8000499c:	00005917          	auipc	s2,0x5
    800049a0:	0bc90913          	addi	s2,s2,188 # 80009a58 <cons>
    800049a4:	00050493          	mv	s1,a0
    800049a8:	00090513          	mv	a0,s2
    800049ac:	00001097          	auipc	ra,0x1
    800049b0:	e40080e7          	jalr	-448(ra) # 800057ec <acquire>
    800049b4:	02048c63          	beqz	s1,800049ec <consoleintr+0x68>
    800049b8:	0a092783          	lw	a5,160(s2)
    800049bc:	09892703          	lw	a4,152(s2)
    800049c0:	07f00693          	li	a3,127
    800049c4:	40e7873b          	subw	a4,a5,a4
    800049c8:	02e6e263          	bltu	a3,a4,800049ec <consoleintr+0x68>
    800049cc:	00d00713          	li	a4,13
    800049d0:	04e48063          	beq	s1,a4,80004a10 <consoleintr+0x8c>
    800049d4:	07f7f713          	andi	a4,a5,127
    800049d8:	00e90733          	add	a4,s2,a4
    800049dc:	0017879b          	addiw	a5,a5,1
    800049e0:	0af92023          	sw	a5,160(s2)
    800049e4:	00970c23          	sb	s1,24(a4)
    800049e8:	08f92e23          	sw	a5,156(s2)
    800049ec:	01013403          	ld	s0,16(sp)
    800049f0:	01813083          	ld	ra,24(sp)
    800049f4:	00813483          	ld	s1,8(sp)
    800049f8:	00013903          	ld	s2,0(sp)
    800049fc:	00005517          	auipc	a0,0x5
    80004a00:	05c50513          	addi	a0,a0,92 # 80009a58 <cons>
    80004a04:	02010113          	addi	sp,sp,32
    80004a08:	00001317          	auipc	t1,0x1
    80004a0c:	eb030067          	jr	-336(t1) # 800058b8 <release>
    80004a10:	00a00493          	li	s1,10
    80004a14:	fc1ff06f          	j	800049d4 <consoleintr+0x50>

0000000080004a18 <consoleinit>:
    80004a18:	fe010113          	addi	sp,sp,-32
    80004a1c:	00113c23          	sd	ra,24(sp)
    80004a20:	00813823          	sd	s0,16(sp)
    80004a24:	00913423          	sd	s1,8(sp)
    80004a28:	02010413          	addi	s0,sp,32
    80004a2c:	00005497          	auipc	s1,0x5
    80004a30:	02c48493          	addi	s1,s1,44 # 80009a58 <cons>
    80004a34:	00048513          	mv	a0,s1
    80004a38:	00003597          	auipc	a1,0x3
    80004a3c:	8a858593          	addi	a1,a1,-1880 # 800072e0 <_ZZ12printIntegermE6digits+0x238>
    80004a40:	00001097          	auipc	ra,0x1
    80004a44:	d88080e7          	jalr	-632(ra) # 800057c8 <initlock>
    80004a48:	00000097          	auipc	ra,0x0
    80004a4c:	7ac080e7          	jalr	1964(ra) # 800051f4 <uartinit>
    80004a50:	01813083          	ld	ra,24(sp)
    80004a54:	01013403          	ld	s0,16(sp)
    80004a58:	00000797          	auipc	a5,0x0
    80004a5c:	d9c78793          	addi	a5,a5,-612 # 800047f4 <consoleread>
    80004a60:	0af4bc23          	sd	a5,184(s1)
    80004a64:	00000797          	auipc	a5,0x0
    80004a68:	cec78793          	addi	a5,a5,-788 # 80004750 <consolewrite>
    80004a6c:	0cf4b023          	sd	a5,192(s1)
    80004a70:	00813483          	ld	s1,8(sp)
    80004a74:	02010113          	addi	sp,sp,32
    80004a78:	00008067          	ret

0000000080004a7c <console_read>:
    80004a7c:	ff010113          	addi	sp,sp,-16
    80004a80:	00813423          	sd	s0,8(sp)
    80004a84:	01010413          	addi	s0,sp,16
    80004a88:	00813403          	ld	s0,8(sp)
    80004a8c:	00005317          	auipc	t1,0x5
    80004a90:	08433303          	ld	t1,132(t1) # 80009b10 <devsw+0x10>
    80004a94:	01010113          	addi	sp,sp,16
    80004a98:	00030067          	jr	t1

0000000080004a9c <console_write>:
    80004a9c:	ff010113          	addi	sp,sp,-16
    80004aa0:	00813423          	sd	s0,8(sp)
    80004aa4:	01010413          	addi	s0,sp,16
    80004aa8:	00813403          	ld	s0,8(sp)
    80004aac:	00005317          	auipc	t1,0x5
    80004ab0:	06c33303          	ld	t1,108(t1) # 80009b18 <devsw+0x18>
    80004ab4:	01010113          	addi	sp,sp,16
    80004ab8:	00030067          	jr	t1

0000000080004abc <panic>:
    80004abc:	fe010113          	addi	sp,sp,-32
    80004ac0:	00113c23          	sd	ra,24(sp)
    80004ac4:	00813823          	sd	s0,16(sp)
    80004ac8:	00913423          	sd	s1,8(sp)
    80004acc:	02010413          	addi	s0,sp,32
    80004ad0:	00050493          	mv	s1,a0
    80004ad4:	00003517          	auipc	a0,0x3
    80004ad8:	81450513          	addi	a0,a0,-2028 # 800072e8 <_ZZ12printIntegermE6digits+0x240>
    80004adc:	00005797          	auipc	a5,0x5
    80004ae0:	0c07ae23          	sw	zero,220(a5) # 80009bb8 <pr+0x18>
    80004ae4:	00000097          	auipc	ra,0x0
    80004ae8:	034080e7          	jalr	52(ra) # 80004b18 <__printf>
    80004aec:	00048513          	mv	a0,s1
    80004af0:	00000097          	auipc	ra,0x0
    80004af4:	028080e7          	jalr	40(ra) # 80004b18 <__printf>
    80004af8:	00002517          	auipc	a0,0x2
    80004afc:	61050513          	addi	a0,a0,1552 # 80007108 <_ZZ12printIntegermE6digits+0x60>
    80004b00:	00000097          	auipc	ra,0x0
    80004b04:	018080e7          	jalr	24(ra) # 80004b18 <__printf>
    80004b08:	00100793          	li	a5,1
    80004b0c:	00004717          	auipc	a4,0x4
    80004b10:	b8f72e23          	sw	a5,-1124(a4) # 800086a8 <panicked>
    80004b14:	0000006f          	j	80004b14 <panic+0x58>

0000000080004b18 <__printf>:
    80004b18:	f3010113          	addi	sp,sp,-208
    80004b1c:	08813023          	sd	s0,128(sp)
    80004b20:	07313423          	sd	s3,104(sp)
    80004b24:	09010413          	addi	s0,sp,144
    80004b28:	05813023          	sd	s8,64(sp)
    80004b2c:	08113423          	sd	ra,136(sp)
    80004b30:	06913c23          	sd	s1,120(sp)
    80004b34:	07213823          	sd	s2,112(sp)
    80004b38:	07413023          	sd	s4,96(sp)
    80004b3c:	05513c23          	sd	s5,88(sp)
    80004b40:	05613823          	sd	s6,80(sp)
    80004b44:	05713423          	sd	s7,72(sp)
    80004b48:	03913c23          	sd	s9,56(sp)
    80004b4c:	03a13823          	sd	s10,48(sp)
    80004b50:	03b13423          	sd	s11,40(sp)
    80004b54:	00005317          	auipc	t1,0x5
    80004b58:	04c30313          	addi	t1,t1,76 # 80009ba0 <pr>
    80004b5c:	01832c03          	lw	s8,24(t1)
    80004b60:	00b43423          	sd	a1,8(s0)
    80004b64:	00c43823          	sd	a2,16(s0)
    80004b68:	00d43c23          	sd	a3,24(s0)
    80004b6c:	02e43023          	sd	a4,32(s0)
    80004b70:	02f43423          	sd	a5,40(s0)
    80004b74:	03043823          	sd	a6,48(s0)
    80004b78:	03143c23          	sd	a7,56(s0)
    80004b7c:	00050993          	mv	s3,a0
    80004b80:	4a0c1663          	bnez	s8,8000502c <__printf+0x514>
    80004b84:	60098c63          	beqz	s3,8000519c <__printf+0x684>
    80004b88:	0009c503          	lbu	a0,0(s3)
    80004b8c:	00840793          	addi	a5,s0,8
    80004b90:	f6f43c23          	sd	a5,-136(s0)
    80004b94:	00000493          	li	s1,0
    80004b98:	22050063          	beqz	a0,80004db8 <__printf+0x2a0>
    80004b9c:	00002a37          	lui	s4,0x2
    80004ba0:	00018ab7          	lui	s5,0x18
    80004ba4:	000f4b37          	lui	s6,0xf4
    80004ba8:	00989bb7          	lui	s7,0x989
    80004bac:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80004bb0:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80004bb4:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80004bb8:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80004bbc:	00148c9b          	addiw	s9,s1,1
    80004bc0:	02500793          	li	a5,37
    80004bc4:	01998933          	add	s2,s3,s9
    80004bc8:	38f51263          	bne	a0,a5,80004f4c <__printf+0x434>
    80004bcc:	00094783          	lbu	a5,0(s2)
    80004bd0:	00078c9b          	sext.w	s9,a5
    80004bd4:	1e078263          	beqz	a5,80004db8 <__printf+0x2a0>
    80004bd8:	0024849b          	addiw	s1,s1,2
    80004bdc:	07000713          	li	a4,112
    80004be0:	00998933          	add	s2,s3,s1
    80004be4:	38e78a63          	beq	a5,a4,80004f78 <__printf+0x460>
    80004be8:	20f76863          	bltu	a4,a5,80004df8 <__printf+0x2e0>
    80004bec:	42a78863          	beq	a5,a0,8000501c <__printf+0x504>
    80004bf0:	06400713          	li	a4,100
    80004bf4:	40e79663          	bne	a5,a4,80005000 <__printf+0x4e8>
    80004bf8:	f7843783          	ld	a5,-136(s0)
    80004bfc:	0007a603          	lw	a2,0(a5)
    80004c00:	00878793          	addi	a5,a5,8
    80004c04:	f6f43c23          	sd	a5,-136(s0)
    80004c08:	42064a63          	bltz	a2,8000503c <__printf+0x524>
    80004c0c:	00a00713          	li	a4,10
    80004c10:	02e677bb          	remuw	a5,a2,a4
    80004c14:	00002d97          	auipc	s11,0x2
    80004c18:	6fcd8d93          	addi	s11,s11,1788 # 80007310 <digits>
    80004c1c:	00900593          	li	a1,9
    80004c20:	0006051b          	sext.w	a0,a2
    80004c24:	00000c93          	li	s9,0
    80004c28:	02079793          	slli	a5,a5,0x20
    80004c2c:	0207d793          	srli	a5,a5,0x20
    80004c30:	00fd87b3          	add	a5,s11,a5
    80004c34:	0007c783          	lbu	a5,0(a5)
    80004c38:	02e656bb          	divuw	a3,a2,a4
    80004c3c:	f8f40023          	sb	a5,-128(s0)
    80004c40:	14c5d863          	bge	a1,a2,80004d90 <__printf+0x278>
    80004c44:	06300593          	li	a1,99
    80004c48:	00100c93          	li	s9,1
    80004c4c:	02e6f7bb          	remuw	a5,a3,a4
    80004c50:	02079793          	slli	a5,a5,0x20
    80004c54:	0207d793          	srli	a5,a5,0x20
    80004c58:	00fd87b3          	add	a5,s11,a5
    80004c5c:	0007c783          	lbu	a5,0(a5)
    80004c60:	02e6d73b          	divuw	a4,a3,a4
    80004c64:	f8f400a3          	sb	a5,-127(s0)
    80004c68:	12a5f463          	bgeu	a1,a0,80004d90 <__printf+0x278>
    80004c6c:	00a00693          	li	a3,10
    80004c70:	00900593          	li	a1,9
    80004c74:	02d777bb          	remuw	a5,a4,a3
    80004c78:	02079793          	slli	a5,a5,0x20
    80004c7c:	0207d793          	srli	a5,a5,0x20
    80004c80:	00fd87b3          	add	a5,s11,a5
    80004c84:	0007c503          	lbu	a0,0(a5)
    80004c88:	02d757bb          	divuw	a5,a4,a3
    80004c8c:	f8a40123          	sb	a0,-126(s0)
    80004c90:	48e5f263          	bgeu	a1,a4,80005114 <__printf+0x5fc>
    80004c94:	06300513          	li	a0,99
    80004c98:	02d7f5bb          	remuw	a1,a5,a3
    80004c9c:	02059593          	slli	a1,a1,0x20
    80004ca0:	0205d593          	srli	a1,a1,0x20
    80004ca4:	00bd85b3          	add	a1,s11,a1
    80004ca8:	0005c583          	lbu	a1,0(a1)
    80004cac:	02d7d7bb          	divuw	a5,a5,a3
    80004cb0:	f8b401a3          	sb	a1,-125(s0)
    80004cb4:	48e57263          	bgeu	a0,a4,80005138 <__printf+0x620>
    80004cb8:	3e700513          	li	a0,999
    80004cbc:	02d7f5bb          	remuw	a1,a5,a3
    80004cc0:	02059593          	slli	a1,a1,0x20
    80004cc4:	0205d593          	srli	a1,a1,0x20
    80004cc8:	00bd85b3          	add	a1,s11,a1
    80004ccc:	0005c583          	lbu	a1,0(a1)
    80004cd0:	02d7d7bb          	divuw	a5,a5,a3
    80004cd4:	f8b40223          	sb	a1,-124(s0)
    80004cd8:	46e57663          	bgeu	a0,a4,80005144 <__printf+0x62c>
    80004cdc:	02d7f5bb          	remuw	a1,a5,a3
    80004ce0:	02059593          	slli	a1,a1,0x20
    80004ce4:	0205d593          	srli	a1,a1,0x20
    80004ce8:	00bd85b3          	add	a1,s11,a1
    80004cec:	0005c583          	lbu	a1,0(a1)
    80004cf0:	02d7d7bb          	divuw	a5,a5,a3
    80004cf4:	f8b402a3          	sb	a1,-123(s0)
    80004cf8:	46ea7863          	bgeu	s4,a4,80005168 <__printf+0x650>
    80004cfc:	02d7f5bb          	remuw	a1,a5,a3
    80004d00:	02059593          	slli	a1,a1,0x20
    80004d04:	0205d593          	srli	a1,a1,0x20
    80004d08:	00bd85b3          	add	a1,s11,a1
    80004d0c:	0005c583          	lbu	a1,0(a1)
    80004d10:	02d7d7bb          	divuw	a5,a5,a3
    80004d14:	f8b40323          	sb	a1,-122(s0)
    80004d18:	3eeaf863          	bgeu	s5,a4,80005108 <__printf+0x5f0>
    80004d1c:	02d7f5bb          	remuw	a1,a5,a3
    80004d20:	02059593          	slli	a1,a1,0x20
    80004d24:	0205d593          	srli	a1,a1,0x20
    80004d28:	00bd85b3          	add	a1,s11,a1
    80004d2c:	0005c583          	lbu	a1,0(a1)
    80004d30:	02d7d7bb          	divuw	a5,a5,a3
    80004d34:	f8b403a3          	sb	a1,-121(s0)
    80004d38:	42eb7e63          	bgeu	s6,a4,80005174 <__printf+0x65c>
    80004d3c:	02d7f5bb          	remuw	a1,a5,a3
    80004d40:	02059593          	slli	a1,a1,0x20
    80004d44:	0205d593          	srli	a1,a1,0x20
    80004d48:	00bd85b3          	add	a1,s11,a1
    80004d4c:	0005c583          	lbu	a1,0(a1)
    80004d50:	02d7d7bb          	divuw	a5,a5,a3
    80004d54:	f8b40423          	sb	a1,-120(s0)
    80004d58:	42ebfc63          	bgeu	s7,a4,80005190 <__printf+0x678>
    80004d5c:	02079793          	slli	a5,a5,0x20
    80004d60:	0207d793          	srli	a5,a5,0x20
    80004d64:	00fd8db3          	add	s11,s11,a5
    80004d68:	000dc703          	lbu	a4,0(s11)
    80004d6c:	00a00793          	li	a5,10
    80004d70:	00900c93          	li	s9,9
    80004d74:	f8e404a3          	sb	a4,-119(s0)
    80004d78:	00065c63          	bgez	a2,80004d90 <__printf+0x278>
    80004d7c:	f9040713          	addi	a4,s0,-112
    80004d80:	00f70733          	add	a4,a4,a5
    80004d84:	02d00693          	li	a3,45
    80004d88:	fed70823          	sb	a3,-16(a4)
    80004d8c:	00078c93          	mv	s9,a5
    80004d90:	f8040793          	addi	a5,s0,-128
    80004d94:	01978cb3          	add	s9,a5,s9
    80004d98:	f7f40d13          	addi	s10,s0,-129
    80004d9c:	000cc503          	lbu	a0,0(s9)
    80004da0:	fffc8c93          	addi	s9,s9,-1
    80004da4:	00000097          	auipc	ra,0x0
    80004da8:	b90080e7          	jalr	-1136(ra) # 80004934 <consputc>
    80004dac:	ffac98e3          	bne	s9,s10,80004d9c <__printf+0x284>
    80004db0:	00094503          	lbu	a0,0(s2)
    80004db4:	e00514e3          	bnez	a0,80004bbc <__printf+0xa4>
    80004db8:	1a0c1663          	bnez	s8,80004f64 <__printf+0x44c>
    80004dbc:	08813083          	ld	ra,136(sp)
    80004dc0:	08013403          	ld	s0,128(sp)
    80004dc4:	07813483          	ld	s1,120(sp)
    80004dc8:	07013903          	ld	s2,112(sp)
    80004dcc:	06813983          	ld	s3,104(sp)
    80004dd0:	06013a03          	ld	s4,96(sp)
    80004dd4:	05813a83          	ld	s5,88(sp)
    80004dd8:	05013b03          	ld	s6,80(sp)
    80004ddc:	04813b83          	ld	s7,72(sp)
    80004de0:	04013c03          	ld	s8,64(sp)
    80004de4:	03813c83          	ld	s9,56(sp)
    80004de8:	03013d03          	ld	s10,48(sp)
    80004dec:	02813d83          	ld	s11,40(sp)
    80004df0:	0d010113          	addi	sp,sp,208
    80004df4:	00008067          	ret
    80004df8:	07300713          	li	a4,115
    80004dfc:	1ce78a63          	beq	a5,a4,80004fd0 <__printf+0x4b8>
    80004e00:	07800713          	li	a4,120
    80004e04:	1ee79e63          	bne	a5,a4,80005000 <__printf+0x4e8>
    80004e08:	f7843783          	ld	a5,-136(s0)
    80004e0c:	0007a703          	lw	a4,0(a5)
    80004e10:	00878793          	addi	a5,a5,8
    80004e14:	f6f43c23          	sd	a5,-136(s0)
    80004e18:	28074263          	bltz	a4,8000509c <__printf+0x584>
    80004e1c:	00002d97          	auipc	s11,0x2
    80004e20:	4f4d8d93          	addi	s11,s11,1268 # 80007310 <digits>
    80004e24:	00f77793          	andi	a5,a4,15
    80004e28:	00fd87b3          	add	a5,s11,a5
    80004e2c:	0007c683          	lbu	a3,0(a5)
    80004e30:	00f00613          	li	a2,15
    80004e34:	0007079b          	sext.w	a5,a4
    80004e38:	f8d40023          	sb	a3,-128(s0)
    80004e3c:	0047559b          	srliw	a1,a4,0x4
    80004e40:	0047569b          	srliw	a3,a4,0x4
    80004e44:	00000c93          	li	s9,0
    80004e48:	0ee65063          	bge	a2,a4,80004f28 <__printf+0x410>
    80004e4c:	00f6f693          	andi	a3,a3,15
    80004e50:	00dd86b3          	add	a3,s11,a3
    80004e54:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80004e58:	0087d79b          	srliw	a5,a5,0x8
    80004e5c:	00100c93          	li	s9,1
    80004e60:	f8d400a3          	sb	a3,-127(s0)
    80004e64:	0cb67263          	bgeu	a2,a1,80004f28 <__printf+0x410>
    80004e68:	00f7f693          	andi	a3,a5,15
    80004e6c:	00dd86b3          	add	a3,s11,a3
    80004e70:	0006c583          	lbu	a1,0(a3)
    80004e74:	00f00613          	li	a2,15
    80004e78:	0047d69b          	srliw	a3,a5,0x4
    80004e7c:	f8b40123          	sb	a1,-126(s0)
    80004e80:	0047d593          	srli	a1,a5,0x4
    80004e84:	28f67e63          	bgeu	a2,a5,80005120 <__printf+0x608>
    80004e88:	00f6f693          	andi	a3,a3,15
    80004e8c:	00dd86b3          	add	a3,s11,a3
    80004e90:	0006c503          	lbu	a0,0(a3)
    80004e94:	0087d813          	srli	a6,a5,0x8
    80004e98:	0087d69b          	srliw	a3,a5,0x8
    80004e9c:	f8a401a3          	sb	a0,-125(s0)
    80004ea0:	28b67663          	bgeu	a2,a1,8000512c <__printf+0x614>
    80004ea4:	00f6f693          	andi	a3,a3,15
    80004ea8:	00dd86b3          	add	a3,s11,a3
    80004eac:	0006c583          	lbu	a1,0(a3)
    80004eb0:	00c7d513          	srli	a0,a5,0xc
    80004eb4:	00c7d69b          	srliw	a3,a5,0xc
    80004eb8:	f8b40223          	sb	a1,-124(s0)
    80004ebc:	29067a63          	bgeu	a2,a6,80005150 <__printf+0x638>
    80004ec0:	00f6f693          	andi	a3,a3,15
    80004ec4:	00dd86b3          	add	a3,s11,a3
    80004ec8:	0006c583          	lbu	a1,0(a3)
    80004ecc:	0107d813          	srli	a6,a5,0x10
    80004ed0:	0107d69b          	srliw	a3,a5,0x10
    80004ed4:	f8b402a3          	sb	a1,-123(s0)
    80004ed8:	28a67263          	bgeu	a2,a0,8000515c <__printf+0x644>
    80004edc:	00f6f693          	andi	a3,a3,15
    80004ee0:	00dd86b3          	add	a3,s11,a3
    80004ee4:	0006c683          	lbu	a3,0(a3)
    80004ee8:	0147d79b          	srliw	a5,a5,0x14
    80004eec:	f8d40323          	sb	a3,-122(s0)
    80004ef0:	21067663          	bgeu	a2,a6,800050fc <__printf+0x5e4>
    80004ef4:	02079793          	slli	a5,a5,0x20
    80004ef8:	0207d793          	srli	a5,a5,0x20
    80004efc:	00fd8db3          	add	s11,s11,a5
    80004f00:	000dc683          	lbu	a3,0(s11)
    80004f04:	00800793          	li	a5,8
    80004f08:	00700c93          	li	s9,7
    80004f0c:	f8d403a3          	sb	a3,-121(s0)
    80004f10:	00075c63          	bgez	a4,80004f28 <__printf+0x410>
    80004f14:	f9040713          	addi	a4,s0,-112
    80004f18:	00f70733          	add	a4,a4,a5
    80004f1c:	02d00693          	li	a3,45
    80004f20:	fed70823          	sb	a3,-16(a4)
    80004f24:	00078c93          	mv	s9,a5
    80004f28:	f8040793          	addi	a5,s0,-128
    80004f2c:	01978cb3          	add	s9,a5,s9
    80004f30:	f7f40d13          	addi	s10,s0,-129
    80004f34:	000cc503          	lbu	a0,0(s9)
    80004f38:	fffc8c93          	addi	s9,s9,-1
    80004f3c:	00000097          	auipc	ra,0x0
    80004f40:	9f8080e7          	jalr	-1544(ra) # 80004934 <consputc>
    80004f44:	ff9d18e3          	bne	s10,s9,80004f34 <__printf+0x41c>
    80004f48:	0100006f          	j	80004f58 <__printf+0x440>
    80004f4c:	00000097          	auipc	ra,0x0
    80004f50:	9e8080e7          	jalr	-1560(ra) # 80004934 <consputc>
    80004f54:	000c8493          	mv	s1,s9
    80004f58:	00094503          	lbu	a0,0(s2)
    80004f5c:	c60510e3          	bnez	a0,80004bbc <__printf+0xa4>
    80004f60:	e40c0ee3          	beqz	s8,80004dbc <__printf+0x2a4>
    80004f64:	00005517          	auipc	a0,0x5
    80004f68:	c3c50513          	addi	a0,a0,-964 # 80009ba0 <pr>
    80004f6c:	00001097          	auipc	ra,0x1
    80004f70:	94c080e7          	jalr	-1716(ra) # 800058b8 <release>
    80004f74:	e49ff06f          	j	80004dbc <__printf+0x2a4>
    80004f78:	f7843783          	ld	a5,-136(s0)
    80004f7c:	03000513          	li	a0,48
    80004f80:	01000d13          	li	s10,16
    80004f84:	00878713          	addi	a4,a5,8
    80004f88:	0007bc83          	ld	s9,0(a5)
    80004f8c:	f6e43c23          	sd	a4,-136(s0)
    80004f90:	00000097          	auipc	ra,0x0
    80004f94:	9a4080e7          	jalr	-1628(ra) # 80004934 <consputc>
    80004f98:	07800513          	li	a0,120
    80004f9c:	00000097          	auipc	ra,0x0
    80004fa0:	998080e7          	jalr	-1640(ra) # 80004934 <consputc>
    80004fa4:	00002d97          	auipc	s11,0x2
    80004fa8:	36cd8d93          	addi	s11,s11,876 # 80007310 <digits>
    80004fac:	03ccd793          	srli	a5,s9,0x3c
    80004fb0:	00fd87b3          	add	a5,s11,a5
    80004fb4:	0007c503          	lbu	a0,0(a5)
    80004fb8:	fffd0d1b          	addiw	s10,s10,-1
    80004fbc:	004c9c93          	slli	s9,s9,0x4
    80004fc0:	00000097          	auipc	ra,0x0
    80004fc4:	974080e7          	jalr	-1676(ra) # 80004934 <consputc>
    80004fc8:	fe0d12e3          	bnez	s10,80004fac <__printf+0x494>
    80004fcc:	f8dff06f          	j	80004f58 <__printf+0x440>
    80004fd0:	f7843783          	ld	a5,-136(s0)
    80004fd4:	0007bc83          	ld	s9,0(a5)
    80004fd8:	00878793          	addi	a5,a5,8
    80004fdc:	f6f43c23          	sd	a5,-136(s0)
    80004fe0:	000c9a63          	bnez	s9,80004ff4 <__printf+0x4dc>
    80004fe4:	1080006f          	j	800050ec <__printf+0x5d4>
    80004fe8:	001c8c93          	addi	s9,s9,1
    80004fec:	00000097          	auipc	ra,0x0
    80004ff0:	948080e7          	jalr	-1720(ra) # 80004934 <consputc>
    80004ff4:	000cc503          	lbu	a0,0(s9)
    80004ff8:	fe0518e3          	bnez	a0,80004fe8 <__printf+0x4d0>
    80004ffc:	f5dff06f          	j	80004f58 <__printf+0x440>
    80005000:	02500513          	li	a0,37
    80005004:	00000097          	auipc	ra,0x0
    80005008:	930080e7          	jalr	-1744(ra) # 80004934 <consputc>
    8000500c:	000c8513          	mv	a0,s9
    80005010:	00000097          	auipc	ra,0x0
    80005014:	924080e7          	jalr	-1756(ra) # 80004934 <consputc>
    80005018:	f41ff06f          	j	80004f58 <__printf+0x440>
    8000501c:	02500513          	li	a0,37
    80005020:	00000097          	auipc	ra,0x0
    80005024:	914080e7          	jalr	-1772(ra) # 80004934 <consputc>
    80005028:	f31ff06f          	j	80004f58 <__printf+0x440>
    8000502c:	00030513          	mv	a0,t1
    80005030:	00000097          	auipc	ra,0x0
    80005034:	7bc080e7          	jalr	1980(ra) # 800057ec <acquire>
    80005038:	b4dff06f          	j	80004b84 <__printf+0x6c>
    8000503c:	40c0053b          	negw	a0,a2
    80005040:	00a00713          	li	a4,10
    80005044:	02e576bb          	remuw	a3,a0,a4
    80005048:	00002d97          	auipc	s11,0x2
    8000504c:	2c8d8d93          	addi	s11,s11,712 # 80007310 <digits>
    80005050:	ff700593          	li	a1,-9
    80005054:	02069693          	slli	a3,a3,0x20
    80005058:	0206d693          	srli	a3,a3,0x20
    8000505c:	00dd86b3          	add	a3,s11,a3
    80005060:	0006c683          	lbu	a3,0(a3)
    80005064:	02e557bb          	divuw	a5,a0,a4
    80005068:	f8d40023          	sb	a3,-128(s0)
    8000506c:	10b65e63          	bge	a2,a1,80005188 <__printf+0x670>
    80005070:	06300593          	li	a1,99
    80005074:	02e7f6bb          	remuw	a3,a5,a4
    80005078:	02069693          	slli	a3,a3,0x20
    8000507c:	0206d693          	srli	a3,a3,0x20
    80005080:	00dd86b3          	add	a3,s11,a3
    80005084:	0006c683          	lbu	a3,0(a3)
    80005088:	02e7d73b          	divuw	a4,a5,a4
    8000508c:	00200793          	li	a5,2
    80005090:	f8d400a3          	sb	a3,-127(s0)
    80005094:	bca5ece3          	bltu	a1,a0,80004c6c <__printf+0x154>
    80005098:	ce5ff06f          	j	80004d7c <__printf+0x264>
    8000509c:	40e007bb          	negw	a5,a4
    800050a0:	00002d97          	auipc	s11,0x2
    800050a4:	270d8d93          	addi	s11,s11,624 # 80007310 <digits>
    800050a8:	00f7f693          	andi	a3,a5,15
    800050ac:	00dd86b3          	add	a3,s11,a3
    800050b0:	0006c583          	lbu	a1,0(a3)
    800050b4:	ff100613          	li	a2,-15
    800050b8:	0047d69b          	srliw	a3,a5,0x4
    800050bc:	f8b40023          	sb	a1,-128(s0)
    800050c0:	0047d59b          	srliw	a1,a5,0x4
    800050c4:	0ac75e63          	bge	a4,a2,80005180 <__printf+0x668>
    800050c8:	00f6f693          	andi	a3,a3,15
    800050cc:	00dd86b3          	add	a3,s11,a3
    800050d0:	0006c603          	lbu	a2,0(a3)
    800050d4:	00f00693          	li	a3,15
    800050d8:	0087d79b          	srliw	a5,a5,0x8
    800050dc:	f8c400a3          	sb	a2,-127(s0)
    800050e0:	d8b6e4e3          	bltu	a3,a1,80004e68 <__printf+0x350>
    800050e4:	00200793          	li	a5,2
    800050e8:	e2dff06f          	j	80004f14 <__printf+0x3fc>
    800050ec:	00002c97          	auipc	s9,0x2
    800050f0:	204c8c93          	addi	s9,s9,516 # 800072f0 <_ZZ12printIntegermE6digits+0x248>
    800050f4:	02800513          	li	a0,40
    800050f8:	ef1ff06f          	j	80004fe8 <__printf+0x4d0>
    800050fc:	00700793          	li	a5,7
    80005100:	00600c93          	li	s9,6
    80005104:	e0dff06f          	j	80004f10 <__printf+0x3f8>
    80005108:	00700793          	li	a5,7
    8000510c:	00600c93          	li	s9,6
    80005110:	c69ff06f          	j	80004d78 <__printf+0x260>
    80005114:	00300793          	li	a5,3
    80005118:	00200c93          	li	s9,2
    8000511c:	c5dff06f          	j	80004d78 <__printf+0x260>
    80005120:	00300793          	li	a5,3
    80005124:	00200c93          	li	s9,2
    80005128:	de9ff06f          	j	80004f10 <__printf+0x3f8>
    8000512c:	00400793          	li	a5,4
    80005130:	00300c93          	li	s9,3
    80005134:	dddff06f          	j	80004f10 <__printf+0x3f8>
    80005138:	00400793          	li	a5,4
    8000513c:	00300c93          	li	s9,3
    80005140:	c39ff06f          	j	80004d78 <__printf+0x260>
    80005144:	00500793          	li	a5,5
    80005148:	00400c93          	li	s9,4
    8000514c:	c2dff06f          	j	80004d78 <__printf+0x260>
    80005150:	00500793          	li	a5,5
    80005154:	00400c93          	li	s9,4
    80005158:	db9ff06f          	j	80004f10 <__printf+0x3f8>
    8000515c:	00600793          	li	a5,6
    80005160:	00500c93          	li	s9,5
    80005164:	dadff06f          	j	80004f10 <__printf+0x3f8>
    80005168:	00600793          	li	a5,6
    8000516c:	00500c93          	li	s9,5
    80005170:	c09ff06f          	j	80004d78 <__printf+0x260>
    80005174:	00800793          	li	a5,8
    80005178:	00700c93          	li	s9,7
    8000517c:	bfdff06f          	j	80004d78 <__printf+0x260>
    80005180:	00100793          	li	a5,1
    80005184:	d91ff06f          	j	80004f14 <__printf+0x3fc>
    80005188:	00100793          	li	a5,1
    8000518c:	bf1ff06f          	j	80004d7c <__printf+0x264>
    80005190:	00900793          	li	a5,9
    80005194:	00800c93          	li	s9,8
    80005198:	be1ff06f          	j	80004d78 <__printf+0x260>
    8000519c:	00002517          	auipc	a0,0x2
    800051a0:	15c50513          	addi	a0,a0,348 # 800072f8 <_ZZ12printIntegermE6digits+0x250>
    800051a4:	00000097          	auipc	ra,0x0
    800051a8:	918080e7          	jalr	-1768(ra) # 80004abc <panic>

00000000800051ac <printfinit>:
    800051ac:	fe010113          	addi	sp,sp,-32
    800051b0:	00813823          	sd	s0,16(sp)
    800051b4:	00913423          	sd	s1,8(sp)
    800051b8:	00113c23          	sd	ra,24(sp)
    800051bc:	02010413          	addi	s0,sp,32
    800051c0:	00005497          	auipc	s1,0x5
    800051c4:	9e048493          	addi	s1,s1,-1568 # 80009ba0 <pr>
    800051c8:	00048513          	mv	a0,s1
    800051cc:	00002597          	auipc	a1,0x2
    800051d0:	13c58593          	addi	a1,a1,316 # 80007308 <_ZZ12printIntegermE6digits+0x260>
    800051d4:	00000097          	auipc	ra,0x0
    800051d8:	5f4080e7          	jalr	1524(ra) # 800057c8 <initlock>
    800051dc:	01813083          	ld	ra,24(sp)
    800051e0:	01013403          	ld	s0,16(sp)
    800051e4:	0004ac23          	sw	zero,24(s1)
    800051e8:	00813483          	ld	s1,8(sp)
    800051ec:	02010113          	addi	sp,sp,32
    800051f0:	00008067          	ret

00000000800051f4 <uartinit>:
    800051f4:	ff010113          	addi	sp,sp,-16
    800051f8:	00813423          	sd	s0,8(sp)
    800051fc:	01010413          	addi	s0,sp,16
    80005200:	100007b7          	lui	a5,0x10000
    80005204:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80005208:	f8000713          	li	a4,-128
    8000520c:	00e781a3          	sb	a4,3(a5)
    80005210:	00300713          	li	a4,3
    80005214:	00e78023          	sb	a4,0(a5)
    80005218:	000780a3          	sb	zero,1(a5)
    8000521c:	00e781a3          	sb	a4,3(a5)
    80005220:	00700693          	li	a3,7
    80005224:	00d78123          	sb	a3,2(a5)
    80005228:	00e780a3          	sb	a4,1(a5)
    8000522c:	00813403          	ld	s0,8(sp)
    80005230:	01010113          	addi	sp,sp,16
    80005234:	00008067          	ret

0000000080005238 <uartputc>:
    80005238:	00003797          	auipc	a5,0x3
    8000523c:	4707a783          	lw	a5,1136(a5) # 800086a8 <panicked>
    80005240:	00078463          	beqz	a5,80005248 <uartputc+0x10>
    80005244:	0000006f          	j	80005244 <uartputc+0xc>
    80005248:	fd010113          	addi	sp,sp,-48
    8000524c:	02813023          	sd	s0,32(sp)
    80005250:	00913c23          	sd	s1,24(sp)
    80005254:	01213823          	sd	s2,16(sp)
    80005258:	01313423          	sd	s3,8(sp)
    8000525c:	02113423          	sd	ra,40(sp)
    80005260:	03010413          	addi	s0,sp,48
    80005264:	00003917          	auipc	s2,0x3
    80005268:	44c90913          	addi	s2,s2,1100 # 800086b0 <uart_tx_r>
    8000526c:	00093783          	ld	a5,0(s2)
    80005270:	00003497          	auipc	s1,0x3
    80005274:	44848493          	addi	s1,s1,1096 # 800086b8 <uart_tx_w>
    80005278:	0004b703          	ld	a4,0(s1)
    8000527c:	02078693          	addi	a3,a5,32
    80005280:	00050993          	mv	s3,a0
    80005284:	02e69c63          	bne	a3,a4,800052bc <uartputc+0x84>
    80005288:	00001097          	auipc	ra,0x1
    8000528c:	834080e7          	jalr	-1996(ra) # 80005abc <push_on>
    80005290:	00093783          	ld	a5,0(s2)
    80005294:	0004b703          	ld	a4,0(s1)
    80005298:	02078793          	addi	a5,a5,32
    8000529c:	00e79463          	bne	a5,a4,800052a4 <uartputc+0x6c>
    800052a0:	0000006f          	j	800052a0 <uartputc+0x68>
    800052a4:	00001097          	auipc	ra,0x1
    800052a8:	88c080e7          	jalr	-1908(ra) # 80005b30 <pop_on>
    800052ac:	00093783          	ld	a5,0(s2)
    800052b0:	0004b703          	ld	a4,0(s1)
    800052b4:	02078693          	addi	a3,a5,32
    800052b8:	fce688e3          	beq	a3,a4,80005288 <uartputc+0x50>
    800052bc:	01f77693          	andi	a3,a4,31
    800052c0:	00005597          	auipc	a1,0x5
    800052c4:	90058593          	addi	a1,a1,-1792 # 80009bc0 <uart_tx_buf>
    800052c8:	00d586b3          	add	a3,a1,a3
    800052cc:	00170713          	addi	a4,a4,1
    800052d0:	01368023          	sb	s3,0(a3)
    800052d4:	00e4b023          	sd	a4,0(s1)
    800052d8:	10000637          	lui	a2,0x10000
    800052dc:	02f71063          	bne	a4,a5,800052fc <uartputc+0xc4>
    800052e0:	0340006f          	j	80005314 <uartputc+0xdc>
    800052e4:	00074703          	lbu	a4,0(a4)
    800052e8:	00f93023          	sd	a5,0(s2)
    800052ec:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    800052f0:	00093783          	ld	a5,0(s2)
    800052f4:	0004b703          	ld	a4,0(s1)
    800052f8:	00f70e63          	beq	a4,a5,80005314 <uartputc+0xdc>
    800052fc:	00564683          	lbu	a3,5(a2)
    80005300:	01f7f713          	andi	a4,a5,31
    80005304:	00e58733          	add	a4,a1,a4
    80005308:	0206f693          	andi	a3,a3,32
    8000530c:	00178793          	addi	a5,a5,1
    80005310:	fc069ae3          	bnez	a3,800052e4 <uartputc+0xac>
    80005314:	02813083          	ld	ra,40(sp)
    80005318:	02013403          	ld	s0,32(sp)
    8000531c:	01813483          	ld	s1,24(sp)
    80005320:	01013903          	ld	s2,16(sp)
    80005324:	00813983          	ld	s3,8(sp)
    80005328:	03010113          	addi	sp,sp,48
    8000532c:	00008067          	ret

0000000080005330 <uartputc_sync>:
    80005330:	ff010113          	addi	sp,sp,-16
    80005334:	00813423          	sd	s0,8(sp)
    80005338:	01010413          	addi	s0,sp,16
    8000533c:	00003717          	auipc	a4,0x3
    80005340:	36c72703          	lw	a4,876(a4) # 800086a8 <panicked>
    80005344:	02071663          	bnez	a4,80005370 <uartputc_sync+0x40>
    80005348:	00050793          	mv	a5,a0
    8000534c:	100006b7          	lui	a3,0x10000
    80005350:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80005354:	02077713          	andi	a4,a4,32
    80005358:	fe070ce3          	beqz	a4,80005350 <uartputc_sync+0x20>
    8000535c:	0ff7f793          	andi	a5,a5,255
    80005360:	00f68023          	sb	a5,0(a3)
    80005364:	00813403          	ld	s0,8(sp)
    80005368:	01010113          	addi	sp,sp,16
    8000536c:	00008067          	ret
    80005370:	0000006f          	j	80005370 <uartputc_sync+0x40>

0000000080005374 <uartstart>:
    80005374:	ff010113          	addi	sp,sp,-16
    80005378:	00813423          	sd	s0,8(sp)
    8000537c:	01010413          	addi	s0,sp,16
    80005380:	00003617          	auipc	a2,0x3
    80005384:	33060613          	addi	a2,a2,816 # 800086b0 <uart_tx_r>
    80005388:	00003517          	auipc	a0,0x3
    8000538c:	33050513          	addi	a0,a0,816 # 800086b8 <uart_tx_w>
    80005390:	00063783          	ld	a5,0(a2)
    80005394:	00053703          	ld	a4,0(a0)
    80005398:	04f70263          	beq	a4,a5,800053dc <uartstart+0x68>
    8000539c:	100005b7          	lui	a1,0x10000
    800053a0:	00005817          	auipc	a6,0x5
    800053a4:	82080813          	addi	a6,a6,-2016 # 80009bc0 <uart_tx_buf>
    800053a8:	01c0006f          	j	800053c4 <uartstart+0x50>
    800053ac:	0006c703          	lbu	a4,0(a3)
    800053b0:	00f63023          	sd	a5,0(a2)
    800053b4:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800053b8:	00063783          	ld	a5,0(a2)
    800053bc:	00053703          	ld	a4,0(a0)
    800053c0:	00f70e63          	beq	a4,a5,800053dc <uartstart+0x68>
    800053c4:	01f7f713          	andi	a4,a5,31
    800053c8:	00e806b3          	add	a3,a6,a4
    800053cc:	0055c703          	lbu	a4,5(a1)
    800053d0:	00178793          	addi	a5,a5,1
    800053d4:	02077713          	andi	a4,a4,32
    800053d8:	fc071ae3          	bnez	a4,800053ac <uartstart+0x38>
    800053dc:	00813403          	ld	s0,8(sp)
    800053e0:	01010113          	addi	sp,sp,16
    800053e4:	00008067          	ret

00000000800053e8 <uartgetc>:
    800053e8:	ff010113          	addi	sp,sp,-16
    800053ec:	00813423          	sd	s0,8(sp)
    800053f0:	01010413          	addi	s0,sp,16
    800053f4:	10000737          	lui	a4,0x10000
    800053f8:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    800053fc:	0017f793          	andi	a5,a5,1
    80005400:	00078c63          	beqz	a5,80005418 <uartgetc+0x30>
    80005404:	00074503          	lbu	a0,0(a4)
    80005408:	0ff57513          	andi	a0,a0,255
    8000540c:	00813403          	ld	s0,8(sp)
    80005410:	01010113          	addi	sp,sp,16
    80005414:	00008067          	ret
    80005418:	fff00513          	li	a0,-1
    8000541c:	ff1ff06f          	j	8000540c <uartgetc+0x24>

0000000080005420 <uartintr>:
    80005420:	100007b7          	lui	a5,0x10000
    80005424:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80005428:	0017f793          	andi	a5,a5,1
    8000542c:	0a078463          	beqz	a5,800054d4 <uartintr+0xb4>
    80005430:	fe010113          	addi	sp,sp,-32
    80005434:	00813823          	sd	s0,16(sp)
    80005438:	00913423          	sd	s1,8(sp)
    8000543c:	00113c23          	sd	ra,24(sp)
    80005440:	02010413          	addi	s0,sp,32
    80005444:	100004b7          	lui	s1,0x10000
    80005448:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000544c:	0ff57513          	andi	a0,a0,255
    80005450:	fffff097          	auipc	ra,0xfffff
    80005454:	534080e7          	jalr	1332(ra) # 80004984 <consoleintr>
    80005458:	0054c783          	lbu	a5,5(s1)
    8000545c:	0017f793          	andi	a5,a5,1
    80005460:	fe0794e3          	bnez	a5,80005448 <uartintr+0x28>
    80005464:	00003617          	auipc	a2,0x3
    80005468:	24c60613          	addi	a2,a2,588 # 800086b0 <uart_tx_r>
    8000546c:	00003517          	auipc	a0,0x3
    80005470:	24c50513          	addi	a0,a0,588 # 800086b8 <uart_tx_w>
    80005474:	00063783          	ld	a5,0(a2)
    80005478:	00053703          	ld	a4,0(a0)
    8000547c:	04f70263          	beq	a4,a5,800054c0 <uartintr+0xa0>
    80005480:	100005b7          	lui	a1,0x10000
    80005484:	00004817          	auipc	a6,0x4
    80005488:	73c80813          	addi	a6,a6,1852 # 80009bc0 <uart_tx_buf>
    8000548c:	01c0006f          	j	800054a8 <uartintr+0x88>
    80005490:	0006c703          	lbu	a4,0(a3)
    80005494:	00f63023          	sd	a5,0(a2)
    80005498:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000549c:	00063783          	ld	a5,0(a2)
    800054a0:	00053703          	ld	a4,0(a0)
    800054a4:	00f70e63          	beq	a4,a5,800054c0 <uartintr+0xa0>
    800054a8:	01f7f713          	andi	a4,a5,31
    800054ac:	00e806b3          	add	a3,a6,a4
    800054b0:	0055c703          	lbu	a4,5(a1)
    800054b4:	00178793          	addi	a5,a5,1
    800054b8:	02077713          	andi	a4,a4,32
    800054bc:	fc071ae3          	bnez	a4,80005490 <uartintr+0x70>
    800054c0:	01813083          	ld	ra,24(sp)
    800054c4:	01013403          	ld	s0,16(sp)
    800054c8:	00813483          	ld	s1,8(sp)
    800054cc:	02010113          	addi	sp,sp,32
    800054d0:	00008067          	ret
    800054d4:	00003617          	auipc	a2,0x3
    800054d8:	1dc60613          	addi	a2,a2,476 # 800086b0 <uart_tx_r>
    800054dc:	00003517          	auipc	a0,0x3
    800054e0:	1dc50513          	addi	a0,a0,476 # 800086b8 <uart_tx_w>
    800054e4:	00063783          	ld	a5,0(a2)
    800054e8:	00053703          	ld	a4,0(a0)
    800054ec:	04f70263          	beq	a4,a5,80005530 <uartintr+0x110>
    800054f0:	100005b7          	lui	a1,0x10000
    800054f4:	00004817          	auipc	a6,0x4
    800054f8:	6cc80813          	addi	a6,a6,1740 # 80009bc0 <uart_tx_buf>
    800054fc:	01c0006f          	j	80005518 <uartintr+0xf8>
    80005500:	0006c703          	lbu	a4,0(a3)
    80005504:	00f63023          	sd	a5,0(a2)
    80005508:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000550c:	00063783          	ld	a5,0(a2)
    80005510:	00053703          	ld	a4,0(a0)
    80005514:	02f70063          	beq	a4,a5,80005534 <uartintr+0x114>
    80005518:	01f7f713          	andi	a4,a5,31
    8000551c:	00e806b3          	add	a3,a6,a4
    80005520:	0055c703          	lbu	a4,5(a1)
    80005524:	00178793          	addi	a5,a5,1
    80005528:	02077713          	andi	a4,a4,32
    8000552c:	fc071ae3          	bnez	a4,80005500 <uartintr+0xe0>
    80005530:	00008067          	ret
    80005534:	00008067          	ret

0000000080005538 <kinit>:
    80005538:	fc010113          	addi	sp,sp,-64
    8000553c:	02913423          	sd	s1,40(sp)
    80005540:	fffff7b7          	lui	a5,0xfffff
    80005544:	00005497          	auipc	s1,0x5
    80005548:	6ab48493          	addi	s1,s1,1707 # 8000abef <end+0xfff>
    8000554c:	02813823          	sd	s0,48(sp)
    80005550:	01313c23          	sd	s3,24(sp)
    80005554:	00f4f4b3          	and	s1,s1,a5
    80005558:	02113c23          	sd	ra,56(sp)
    8000555c:	03213023          	sd	s2,32(sp)
    80005560:	01413823          	sd	s4,16(sp)
    80005564:	01513423          	sd	s5,8(sp)
    80005568:	04010413          	addi	s0,sp,64
    8000556c:	000017b7          	lui	a5,0x1
    80005570:	01100993          	li	s3,17
    80005574:	00f487b3          	add	a5,s1,a5
    80005578:	01b99993          	slli	s3,s3,0x1b
    8000557c:	06f9e063          	bltu	s3,a5,800055dc <kinit+0xa4>
    80005580:	00004a97          	auipc	s5,0x4
    80005584:	670a8a93          	addi	s5,s5,1648 # 80009bf0 <end>
    80005588:	0754ec63          	bltu	s1,s5,80005600 <kinit+0xc8>
    8000558c:	0734fa63          	bgeu	s1,s3,80005600 <kinit+0xc8>
    80005590:	00088a37          	lui	s4,0x88
    80005594:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80005598:	00003917          	auipc	s2,0x3
    8000559c:	12890913          	addi	s2,s2,296 # 800086c0 <kmem>
    800055a0:	00ca1a13          	slli	s4,s4,0xc
    800055a4:	0140006f          	j	800055b8 <kinit+0x80>
    800055a8:	000017b7          	lui	a5,0x1
    800055ac:	00f484b3          	add	s1,s1,a5
    800055b0:	0554e863          	bltu	s1,s5,80005600 <kinit+0xc8>
    800055b4:	0534f663          	bgeu	s1,s3,80005600 <kinit+0xc8>
    800055b8:	00001637          	lui	a2,0x1
    800055bc:	00100593          	li	a1,1
    800055c0:	00048513          	mv	a0,s1
    800055c4:	00000097          	auipc	ra,0x0
    800055c8:	5e4080e7          	jalr	1508(ra) # 80005ba8 <__memset>
    800055cc:	00093783          	ld	a5,0(s2)
    800055d0:	00f4b023          	sd	a5,0(s1)
    800055d4:	00993023          	sd	s1,0(s2)
    800055d8:	fd4498e3          	bne	s1,s4,800055a8 <kinit+0x70>
    800055dc:	03813083          	ld	ra,56(sp)
    800055e0:	03013403          	ld	s0,48(sp)
    800055e4:	02813483          	ld	s1,40(sp)
    800055e8:	02013903          	ld	s2,32(sp)
    800055ec:	01813983          	ld	s3,24(sp)
    800055f0:	01013a03          	ld	s4,16(sp)
    800055f4:	00813a83          	ld	s5,8(sp)
    800055f8:	04010113          	addi	sp,sp,64
    800055fc:	00008067          	ret
    80005600:	00002517          	auipc	a0,0x2
    80005604:	d2850513          	addi	a0,a0,-728 # 80007328 <digits+0x18>
    80005608:	fffff097          	auipc	ra,0xfffff
    8000560c:	4b4080e7          	jalr	1204(ra) # 80004abc <panic>

0000000080005610 <freerange>:
    80005610:	fc010113          	addi	sp,sp,-64
    80005614:	000017b7          	lui	a5,0x1
    80005618:	02913423          	sd	s1,40(sp)
    8000561c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80005620:	009504b3          	add	s1,a0,s1
    80005624:	fffff537          	lui	a0,0xfffff
    80005628:	02813823          	sd	s0,48(sp)
    8000562c:	02113c23          	sd	ra,56(sp)
    80005630:	03213023          	sd	s2,32(sp)
    80005634:	01313c23          	sd	s3,24(sp)
    80005638:	01413823          	sd	s4,16(sp)
    8000563c:	01513423          	sd	s5,8(sp)
    80005640:	01613023          	sd	s6,0(sp)
    80005644:	04010413          	addi	s0,sp,64
    80005648:	00a4f4b3          	and	s1,s1,a0
    8000564c:	00f487b3          	add	a5,s1,a5
    80005650:	06f5e463          	bltu	a1,a5,800056b8 <freerange+0xa8>
    80005654:	00004a97          	auipc	s5,0x4
    80005658:	59ca8a93          	addi	s5,s5,1436 # 80009bf0 <end>
    8000565c:	0954e263          	bltu	s1,s5,800056e0 <freerange+0xd0>
    80005660:	01100993          	li	s3,17
    80005664:	01b99993          	slli	s3,s3,0x1b
    80005668:	0734fc63          	bgeu	s1,s3,800056e0 <freerange+0xd0>
    8000566c:	00058a13          	mv	s4,a1
    80005670:	00003917          	auipc	s2,0x3
    80005674:	05090913          	addi	s2,s2,80 # 800086c0 <kmem>
    80005678:	00002b37          	lui	s6,0x2
    8000567c:	0140006f          	j	80005690 <freerange+0x80>
    80005680:	000017b7          	lui	a5,0x1
    80005684:	00f484b3          	add	s1,s1,a5
    80005688:	0554ec63          	bltu	s1,s5,800056e0 <freerange+0xd0>
    8000568c:	0534fa63          	bgeu	s1,s3,800056e0 <freerange+0xd0>
    80005690:	00001637          	lui	a2,0x1
    80005694:	00100593          	li	a1,1
    80005698:	00048513          	mv	a0,s1
    8000569c:	00000097          	auipc	ra,0x0
    800056a0:	50c080e7          	jalr	1292(ra) # 80005ba8 <__memset>
    800056a4:	00093703          	ld	a4,0(s2)
    800056a8:	016487b3          	add	a5,s1,s6
    800056ac:	00e4b023          	sd	a4,0(s1)
    800056b0:	00993023          	sd	s1,0(s2)
    800056b4:	fcfa76e3          	bgeu	s4,a5,80005680 <freerange+0x70>
    800056b8:	03813083          	ld	ra,56(sp)
    800056bc:	03013403          	ld	s0,48(sp)
    800056c0:	02813483          	ld	s1,40(sp)
    800056c4:	02013903          	ld	s2,32(sp)
    800056c8:	01813983          	ld	s3,24(sp)
    800056cc:	01013a03          	ld	s4,16(sp)
    800056d0:	00813a83          	ld	s5,8(sp)
    800056d4:	00013b03          	ld	s6,0(sp)
    800056d8:	04010113          	addi	sp,sp,64
    800056dc:	00008067          	ret
    800056e0:	00002517          	auipc	a0,0x2
    800056e4:	c4850513          	addi	a0,a0,-952 # 80007328 <digits+0x18>
    800056e8:	fffff097          	auipc	ra,0xfffff
    800056ec:	3d4080e7          	jalr	980(ra) # 80004abc <panic>

00000000800056f0 <kfree>:
    800056f0:	fe010113          	addi	sp,sp,-32
    800056f4:	00813823          	sd	s0,16(sp)
    800056f8:	00113c23          	sd	ra,24(sp)
    800056fc:	00913423          	sd	s1,8(sp)
    80005700:	02010413          	addi	s0,sp,32
    80005704:	03451793          	slli	a5,a0,0x34
    80005708:	04079c63          	bnez	a5,80005760 <kfree+0x70>
    8000570c:	00004797          	auipc	a5,0x4
    80005710:	4e478793          	addi	a5,a5,1252 # 80009bf0 <end>
    80005714:	00050493          	mv	s1,a0
    80005718:	04f56463          	bltu	a0,a5,80005760 <kfree+0x70>
    8000571c:	01100793          	li	a5,17
    80005720:	01b79793          	slli	a5,a5,0x1b
    80005724:	02f57e63          	bgeu	a0,a5,80005760 <kfree+0x70>
    80005728:	00001637          	lui	a2,0x1
    8000572c:	00100593          	li	a1,1
    80005730:	00000097          	auipc	ra,0x0
    80005734:	478080e7          	jalr	1144(ra) # 80005ba8 <__memset>
    80005738:	00003797          	auipc	a5,0x3
    8000573c:	f8878793          	addi	a5,a5,-120 # 800086c0 <kmem>
    80005740:	0007b703          	ld	a4,0(a5)
    80005744:	01813083          	ld	ra,24(sp)
    80005748:	01013403          	ld	s0,16(sp)
    8000574c:	00e4b023          	sd	a4,0(s1)
    80005750:	0097b023          	sd	s1,0(a5)
    80005754:	00813483          	ld	s1,8(sp)
    80005758:	02010113          	addi	sp,sp,32
    8000575c:	00008067          	ret
    80005760:	00002517          	auipc	a0,0x2
    80005764:	bc850513          	addi	a0,a0,-1080 # 80007328 <digits+0x18>
    80005768:	fffff097          	auipc	ra,0xfffff
    8000576c:	354080e7          	jalr	852(ra) # 80004abc <panic>

0000000080005770 <kalloc>:
    80005770:	fe010113          	addi	sp,sp,-32
    80005774:	00813823          	sd	s0,16(sp)
    80005778:	00913423          	sd	s1,8(sp)
    8000577c:	00113c23          	sd	ra,24(sp)
    80005780:	02010413          	addi	s0,sp,32
    80005784:	00003797          	auipc	a5,0x3
    80005788:	f3c78793          	addi	a5,a5,-196 # 800086c0 <kmem>
    8000578c:	0007b483          	ld	s1,0(a5)
    80005790:	02048063          	beqz	s1,800057b0 <kalloc+0x40>
    80005794:	0004b703          	ld	a4,0(s1)
    80005798:	00001637          	lui	a2,0x1
    8000579c:	00500593          	li	a1,5
    800057a0:	00048513          	mv	a0,s1
    800057a4:	00e7b023          	sd	a4,0(a5)
    800057a8:	00000097          	auipc	ra,0x0
    800057ac:	400080e7          	jalr	1024(ra) # 80005ba8 <__memset>
    800057b0:	01813083          	ld	ra,24(sp)
    800057b4:	01013403          	ld	s0,16(sp)
    800057b8:	00048513          	mv	a0,s1
    800057bc:	00813483          	ld	s1,8(sp)
    800057c0:	02010113          	addi	sp,sp,32
    800057c4:	00008067          	ret

00000000800057c8 <initlock>:
    800057c8:	ff010113          	addi	sp,sp,-16
    800057cc:	00813423          	sd	s0,8(sp)
    800057d0:	01010413          	addi	s0,sp,16
    800057d4:	00813403          	ld	s0,8(sp)
    800057d8:	00b53423          	sd	a1,8(a0)
    800057dc:	00052023          	sw	zero,0(a0)
    800057e0:	00053823          	sd	zero,16(a0)
    800057e4:	01010113          	addi	sp,sp,16
    800057e8:	00008067          	ret

00000000800057ec <acquire>:
    800057ec:	fe010113          	addi	sp,sp,-32
    800057f0:	00813823          	sd	s0,16(sp)
    800057f4:	00913423          	sd	s1,8(sp)
    800057f8:	00113c23          	sd	ra,24(sp)
    800057fc:	01213023          	sd	s2,0(sp)
    80005800:	02010413          	addi	s0,sp,32
    80005804:	00050493          	mv	s1,a0
    80005808:	10002973          	csrr	s2,sstatus
    8000580c:	100027f3          	csrr	a5,sstatus
    80005810:	ffd7f793          	andi	a5,a5,-3
    80005814:	10079073          	csrw	sstatus,a5
    80005818:	fffff097          	auipc	ra,0xfffff
    8000581c:	8e0080e7          	jalr	-1824(ra) # 800040f8 <mycpu>
    80005820:	07852783          	lw	a5,120(a0)
    80005824:	06078e63          	beqz	a5,800058a0 <acquire+0xb4>
    80005828:	fffff097          	auipc	ra,0xfffff
    8000582c:	8d0080e7          	jalr	-1840(ra) # 800040f8 <mycpu>
    80005830:	07852783          	lw	a5,120(a0)
    80005834:	0004a703          	lw	a4,0(s1)
    80005838:	0017879b          	addiw	a5,a5,1
    8000583c:	06f52c23          	sw	a5,120(a0)
    80005840:	04071063          	bnez	a4,80005880 <acquire+0x94>
    80005844:	00100713          	li	a4,1
    80005848:	00070793          	mv	a5,a4
    8000584c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80005850:	0007879b          	sext.w	a5,a5
    80005854:	fe079ae3          	bnez	a5,80005848 <acquire+0x5c>
    80005858:	0ff0000f          	fence
    8000585c:	fffff097          	auipc	ra,0xfffff
    80005860:	89c080e7          	jalr	-1892(ra) # 800040f8 <mycpu>
    80005864:	01813083          	ld	ra,24(sp)
    80005868:	01013403          	ld	s0,16(sp)
    8000586c:	00a4b823          	sd	a0,16(s1)
    80005870:	00013903          	ld	s2,0(sp)
    80005874:	00813483          	ld	s1,8(sp)
    80005878:	02010113          	addi	sp,sp,32
    8000587c:	00008067          	ret
    80005880:	0104b903          	ld	s2,16(s1)
    80005884:	fffff097          	auipc	ra,0xfffff
    80005888:	874080e7          	jalr	-1932(ra) # 800040f8 <mycpu>
    8000588c:	faa91ce3          	bne	s2,a0,80005844 <acquire+0x58>
    80005890:	00002517          	auipc	a0,0x2
    80005894:	aa050513          	addi	a0,a0,-1376 # 80007330 <digits+0x20>
    80005898:	fffff097          	auipc	ra,0xfffff
    8000589c:	224080e7          	jalr	548(ra) # 80004abc <panic>
    800058a0:	00195913          	srli	s2,s2,0x1
    800058a4:	fffff097          	auipc	ra,0xfffff
    800058a8:	854080e7          	jalr	-1964(ra) # 800040f8 <mycpu>
    800058ac:	00197913          	andi	s2,s2,1
    800058b0:	07252e23          	sw	s2,124(a0)
    800058b4:	f75ff06f          	j	80005828 <acquire+0x3c>

00000000800058b8 <release>:
    800058b8:	fe010113          	addi	sp,sp,-32
    800058bc:	00813823          	sd	s0,16(sp)
    800058c0:	00113c23          	sd	ra,24(sp)
    800058c4:	00913423          	sd	s1,8(sp)
    800058c8:	01213023          	sd	s2,0(sp)
    800058cc:	02010413          	addi	s0,sp,32
    800058d0:	00052783          	lw	a5,0(a0)
    800058d4:	00079a63          	bnez	a5,800058e8 <release+0x30>
    800058d8:	00002517          	auipc	a0,0x2
    800058dc:	a6050513          	addi	a0,a0,-1440 # 80007338 <digits+0x28>
    800058e0:	fffff097          	auipc	ra,0xfffff
    800058e4:	1dc080e7          	jalr	476(ra) # 80004abc <panic>
    800058e8:	01053903          	ld	s2,16(a0)
    800058ec:	00050493          	mv	s1,a0
    800058f0:	fffff097          	auipc	ra,0xfffff
    800058f4:	808080e7          	jalr	-2040(ra) # 800040f8 <mycpu>
    800058f8:	fea910e3          	bne	s2,a0,800058d8 <release+0x20>
    800058fc:	0004b823          	sd	zero,16(s1)
    80005900:	0ff0000f          	fence
    80005904:	0f50000f          	fence	iorw,ow
    80005908:	0804a02f          	amoswap.w	zero,zero,(s1)
    8000590c:	ffffe097          	auipc	ra,0xffffe
    80005910:	7ec080e7          	jalr	2028(ra) # 800040f8 <mycpu>
    80005914:	100027f3          	csrr	a5,sstatus
    80005918:	0027f793          	andi	a5,a5,2
    8000591c:	04079a63          	bnez	a5,80005970 <release+0xb8>
    80005920:	07852783          	lw	a5,120(a0)
    80005924:	02f05e63          	blez	a5,80005960 <release+0xa8>
    80005928:	fff7871b          	addiw	a4,a5,-1
    8000592c:	06e52c23          	sw	a4,120(a0)
    80005930:	00071c63          	bnez	a4,80005948 <release+0x90>
    80005934:	07c52783          	lw	a5,124(a0)
    80005938:	00078863          	beqz	a5,80005948 <release+0x90>
    8000593c:	100027f3          	csrr	a5,sstatus
    80005940:	0027e793          	ori	a5,a5,2
    80005944:	10079073          	csrw	sstatus,a5
    80005948:	01813083          	ld	ra,24(sp)
    8000594c:	01013403          	ld	s0,16(sp)
    80005950:	00813483          	ld	s1,8(sp)
    80005954:	00013903          	ld	s2,0(sp)
    80005958:	02010113          	addi	sp,sp,32
    8000595c:	00008067          	ret
    80005960:	00002517          	auipc	a0,0x2
    80005964:	9f850513          	addi	a0,a0,-1544 # 80007358 <digits+0x48>
    80005968:	fffff097          	auipc	ra,0xfffff
    8000596c:	154080e7          	jalr	340(ra) # 80004abc <panic>
    80005970:	00002517          	auipc	a0,0x2
    80005974:	9d050513          	addi	a0,a0,-1584 # 80007340 <digits+0x30>
    80005978:	fffff097          	auipc	ra,0xfffff
    8000597c:	144080e7          	jalr	324(ra) # 80004abc <panic>

0000000080005980 <holding>:
    80005980:	00052783          	lw	a5,0(a0)
    80005984:	00079663          	bnez	a5,80005990 <holding+0x10>
    80005988:	00000513          	li	a0,0
    8000598c:	00008067          	ret
    80005990:	fe010113          	addi	sp,sp,-32
    80005994:	00813823          	sd	s0,16(sp)
    80005998:	00913423          	sd	s1,8(sp)
    8000599c:	00113c23          	sd	ra,24(sp)
    800059a0:	02010413          	addi	s0,sp,32
    800059a4:	01053483          	ld	s1,16(a0)
    800059a8:	ffffe097          	auipc	ra,0xffffe
    800059ac:	750080e7          	jalr	1872(ra) # 800040f8 <mycpu>
    800059b0:	01813083          	ld	ra,24(sp)
    800059b4:	01013403          	ld	s0,16(sp)
    800059b8:	40a48533          	sub	a0,s1,a0
    800059bc:	00153513          	seqz	a0,a0
    800059c0:	00813483          	ld	s1,8(sp)
    800059c4:	02010113          	addi	sp,sp,32
    800059c8:	00008067          	ret

00000000800059cc <push_off>:
    800059cc:	fe010113          	addi	sp,sp,-32
    800059d0:	00813823          	sd	s0,16(sp)
    800059d4:	00113c23          	sd	ra,24(sp)
    800059d8:	00913423          	sd	s1,8(sp)
    800059dc:	02010413          	addi	s0,sp,32
    800059e0:	100024f3          	csrr	s1,sstatus
    800059e4:	100027f3          	csrr	a5,sstatus
    800059e8:	ffd7f793          	andi	a5,a5,-3
    800059ec:	10079073          	csrw	sstatus,a5
    800059f0:	ffffe097          	auipc	ra,0xffffe
    800059f4:	708080e7          	jalr	1800(ra) # 800040f8 <mycpu>
    800059f8:	07852783          	lw	a5,120(a0)
    800059fc:	02078663          	beqz	a5,80005a28 <push_off+0x5c>
    80005a00:	ffffe097          	auipc	ra,0xffffe
    80005a04:	6f8080e7          	jalr	1784(ra) # 800040f8 <mycpu>
    80005a08:	07852783          	lw	a5,120(a0)
    80005a0c:	01813083          	ld	ra,24(sp)
    80005a10:	01013403          	ld	s0,16(sp)
    80005a14:	0017879b          	addiw	a5,a5,1
    80005a18:	06f52c23          	sw	a5,120(a0)
    80005a1c:	00813483          	ld	s1,8(sp)
    80005a20:	02010113          	addi	sp,sp,32
    80005a24:	00008067          	ret
    80005a28:	0014d493          	srli	s1,s1,0x1
    80005a2c:	ffffe097          	auipc	ra,0xffffe
    80005a30:	6cc080e7          	jalr	1740(ra) # 800040f8 <mycpu>
    80005a34:	0014f493          	andi	s1,s1,1
    80005a38:	06952e23          	sw	s1,124(a0)
    80005a3c:	fc5ff06f          	j	80005a00 <push_off+0x34>

0000000080005a40 <pop_off>:
    80005a40:	ff010113          	addi	sp,sp,-16
    80005a44:	00813023          	sd	s0,0(sp)
    80005a48:	00113423          	sd	ra,8(sp)
    80005a4c:	01010413          	addi	s0,sp,16
    80005a50:	ffffe097          	auipc	ra,0xffffe
    80005a54:	6a8080e7          	jalr	1704(ra) # 800040f8 <mycpu>
    80005a58:	100027f3          	csrr	a5,sstatus
    80005a5c:	0027f793          	andi	a5,a5,2
    80005a60:	04079663          	bnez	a5,80005aac <pop_off+0x6c>
    80005a64:	07852783          	lw	a5,120(a0)
    80005a68:	02f05a63          	blez	a5,80005a9c <pop_off+0x5c>
    80005a6c:	fff7871b          	addiw	a4,a5,-1
    80005a70:	06e52c23          	sw	a4,120(a0)
    80005a74:	00071c63          	bnez	a4,80005a8c <pop_off+0x4c>
    80005a78:	07c52783          	lw	a5,124(a0)
    80005a7c:	00078863          	beqz	a5,80005a8c <pop_off+0x4c>
    80005a80:	100027f3          	csrr	a5,sstatus
    80005a84:	0027e793          	ori	a5,a5,2
    80005a88:	10079073          	csrw	sstatus,a5
    80005a8c:	00813083          	ld	ra,8(sp)
    80005a90:	00013403          	ld	s0,0(sp)
    80005a94:	01010113          	addi	sp,sp,16
    80005a98:	00008067          	ret
    80005a9c:	00002517          	auipc	a0,0x2
    80005aa0:	8bc50513          	addi	a0,a0,-1860 # 80007358 <digits+0x48>
    80005aa4:	fffff097          	auipc	ra,0xfffff
    80005aa8:	018080e7          	jalr	24(ra) # 80004abc <panic>
    80005aac:	00002517          	auipc	a0,0x2
    80005ab0:	89450513          	addi	a0,a0,-1900 # 80007340 <digits+0x30>
    80005ab4:	fffff097          	auipc	ra,0xfffff
    80005ab8:	008080e7          	jalr	8(ra) # 80004abc <panic>

0000000080005abc <push_on>:
    80005abc:	fe010113          	addi	sp,sp,-32
    80005ac0:	00813823          	sd	s0,16(sp)
    80005ac4:	00113c23          	sd	ra,24(sp)
    80005ac8:	00913423          	sd	s1,8(sp)
    80005acc:	02010413          	addi	s0,sp,32
    80005ad0:	100024f3          	csrr	s1,sstatus
    80005ad4:	100027f3          	csrr	a5,sstatus
    80005ad8:	0027e793          	ori	a5,a5,2
    80005adc:	10079073          	csrw	sstatus,a5
    80005ae0:	ffffe097          	auipc	ra,0xffffe
    80005ae4:	618080e7          	jalr	1560(ra) # 800040f8 <mycpu>
    80005ae8:	07852783          	lw	a5,120(a0)
    80005aec:	02078663          	beqz	a5,80005b18 <push_on+0x5c>
    80005af0:	ffffe097          	auipc	ra,0xffffe
    80005af4:	608080e7          	jalr	1544(ra) # 800040f8 <mycpu>
    80005af8:	07852783          	lw	a5,120(a0)
    80005afc:	01813083          	ld	ra,24(sp)
    80005b00:	01013403          	ld	s0,16(sp)
    80005b04:	0017879b          	addiw	a5,a5,1
    80005b08:	06f52c23          	sw	a5,120(a0)
    80005b0c:	00813483          	ld	s1,8(sp)
    80005b10:	02010113          	addi	sp,sp,32
    80005b14:	00008067          	ret
    80005b18:	0014d493          	srli	s1,s1,0x1
    80005b1c:	ffffe097          	auipc	ra,0xffffe
    80005b20:	5dc080e7          	jalr	1500(ra) # 800040f8 <mycpu>
    80005b24:	0014f493          	andi	s1,s1,1
    80005b28:	06952e23          	sw	s1,124(a0)
    80005b2c:	fc5ff06f          	j	80005af0 <push_on+0x34>

0000000080005b30 <pop_on>:
    80005b30:	ff010113          	addi	sp,sp,-16
    80005b34:	00813023          	sd	s0,0(sp)
    80005b38:	00113423          	sd	ra,8(sp)
    80005b3c:	01010413          	addi	s0,sp,16
    80005b40:	ffffe097          	auipc	ra,0xffffe
    80005b44:	5b8080e7          	jalr	1464(ra) # 800040f8 <mycpu>
    80005b48:	100027f3          	csrr	a5,sstatus
    80005b4c:	0027f793          	andi	a5,a5,2
    80005b50:	04078463          	beqz	a5,80005b98 <pop_on+0x68>
    80005b54:	07852783          	lw	a5,120(a0)
    80005b58:	02f05863          	blez	a5,80005b88 <pop_on+0x58>
    80005b5c:	fff7879b          	addiw	a5,a5,-1
    80005b60:	06f52c23          	sw	a5,120(a0)
    80005b64:	07853783          	ld	a5,120(a0)
    80005b68:	00079863          	bnez	a5,80005b78 <pop_on+0x48>
    80005b6c:	100027f3          	csrr	a5,sstatus
    80005b70:	ffd7f793          	andi	a5,a5,-3
    80005b74:	10079073          	csrw	sstatus,a5
    80005b78:	00813083          	ld	ra,8(sp)
    80005b7c:	00013403          	ld	s0,0(sp)
    80005b80:	01010113          	addi	sp,sp,16
    80005b84:	00008067          	ret
    80005b88:	00001517          	auipc	a0,0x1
    80005b8c:	7f850513          	addi	a0,a0,2040 # 80007380 <digits+0x70>
    80005b90:	fffff097          	auipc	ra,0xfffff
    80005b94:	f2c080e7          	jalr	-212(ra) # 80004abc <panic>
    80005b98:	00001517          	auipc	a0,0x1
    80005b9c:	7c850513          	addi	a0,a0,1992 # 80007360 <digits+0x50>
    80005ba0:	fffff097          	auipc	ra,0xfffff
    80005ba4:	f1c080e7          	jalr	-228(ra) # 80004abc <panic>

0000000080005ba8 <__memset>:
    80005ba8:	ff010113          	addi	sp,sp,-16
    80005bac:	00813423          	sd	s0,8(sp)
    80005bb0:	01010413          	addi	s0,sp,16
    80005bb4:	1a060e63          	beqz	a2,80005d70 <__memset+0x1c8>
    80005bb8:	40a007b3          	neg	a5,a0
    80005bbc:	0077f793          	andi	a5,a5,7
    80005bc0:	00778693          	addi	a3,a5,7
    80005bc4:	00b00813          	li	a6,11
    80005bc8:	0ff5f593          	andi	a1,a1,255
    80005bcc:	fff6071b          	addiw	a4,a2,-1
    80005bd0:	1b06e663          	bltu	a3,a6,80005d7c <__memset+0x1d4>
    80005bd4:	1cd76463          	bltu	a4,a3,80005d9c <__memset+0x1f4>
    80005bd8:	1a078e63          	beqz	a5,80005d94 <__memset+0x1ec>
    80005bdc:	00b50023          	sb	a1,0(a0)
    80005be0:	00100713          	li	a4,1
    80005be4:	1ae78463          	beq	a5,a4,80005d8c <__memset+0x1e4>
    80005be8:	00b500a3          	sb	a1,1(a0)
    80005bec:	00200713          	li	a4,2
    80005bf0:	1ae78a63          	beq	a5,a4,80005da4 <__memset+0x1fc>
    80005bf4:	00b50123          	sb	a1,2(a0)
    80005bf8:	00300713          	li	a4,3
    80005bfc:	18e78463          	beq	a5,a4,80005d84 <__memset+0x1dc>
    80005c00:	00b501a3          	sb	a1,3(a0)
    80005c04:	00400713          	li	a4,4
    80005c08:	1ae78263          	beq	a5,a4,80005dac <__memset+0x204>
    80005c0c:	00b50223          	sb	a1,4(a0)
    80005c10:	00500713          	li	a4,5
    80005c14:	1ae78063          	beq	a5,a4,80005db4 <__memset+0x20c>
    80005c18:	00b502a3          	sb	a1,5(a0)
    80005c1c:	00700713          	li	a4,7
    80005c20:	18e79e63          	bne	a5,a4,80005dbc <__memset+0x214>
    80005c24:	00b50323          	sb	a1,6(a0)
    80005c28:	00700e93          	li	t4,7
    80005c2c:	00859713          	slli	a4,a1,0x8
    80005c30:	00e5e733          	or	a4,a1,a4
    80005c34:	01059e13          	slli	t3,a1,0x10
    80005c38:	01c76e33          	or	t3,a4,t3
    80005c3c:	01859313          	slli	t1,a1,0x18
    80005c40:	006e6333          	or	t1,t3,t1
    80005c44:	02059893          	slli	a7,a1,0x20
    80005c48:	40f60e3b          	subw	t3,a2,a5
    80005c4c:	011368b3          	or	a7,t1,a7
    80005c50:	02859813          	slli	a6,a1,0x28
    80005c54:	0108e833          	or	a6,a7,a6
    80005c58:	03059693          	slli	a3,a1,0x30
    80005c5c:	003e589b          	srliw	a7,t3,0x3
    80005c60:	00d866b3          	or	a3,a6,a3
    80005c64:	03859713          	slli	a4,a1,0x38
    80005c68:	00389813          	slli	a6,a7,0x3
    80005c6c:	00f507b3          	add	a5,a0,a5
    80005c70:	00e6e733          	or	a4,a3,a4
    80005c74:	000e089b          	sext.w	a7,t3
    80005c78:	00f806b3          	add	a3,a6,a5
    80005c7c:	00e7b023          	sd	a4,0(a5)
    80005c80:	00878793          	addi	a5,a5,8
    80005c84:	fed79ce3          	bne	a5,a3,80005c7c <__memset+0xd4>
    80005c88:	ff8e7793          	andi	a5,t3,-8
    80005c8c:	0007871b          	sext.w	a4,a5
    80005c90:	01d787bb          	addw	a5,a5,t4
    80005c94:	0ce88e63          	beq	a7,a4,80005d70 <__memset+0x1c8>
    80005c98:	00f50733          	add	a4,a0,a5
    80005c9c:	00b70023          	sb	a1,0(a4)
    80005ca0:	0017871b          	addiw	a4,a5,1
    80005ca4:	0cc77663          	bgeu	a4,a2,80005d70 <__memset+0x1c8>
    80005ca8:	00e50733          	add	a4,a0,a4
    80005cac:	00b70023          	sb	a1,0(a4)
    80005cb0:	0027871b          	addiw	a4,a5,2
    80005cb4:	0ac77e63          	bgeu	a4,a2,80005d70 <__memset+0x1c8>
    80005cb8:	00e50733          	add	a4,a0,a4
    80005cbc:	00b70023          	sb	a1,0(a4)
    80005cc0:	0037871b          	addiw	a4,a5,3
    80005cc4:	0ac77663          	bgeu	a4,a2,80005d70 <__memset+0x1c8>
    80005cc8:	00e50733          	add	a4,a0,a4
    80005ccc:	00b70023          	sb	a1,0(a4)
    80005cd0:	0047871b          	addiw	a4,a5,4
    80005cd4:	08c77e63          	bgeu	a4,a2,80005d70 <__memset+0x1c8>
    80005cd8:	00e50733          	add	a4,a0,a4
    80005cdc:	00b70023          	sb	a1,0(a4)
    80005ce0:	0057871b          	addiw	a4,a5,5
    80005ce4:	08c77663          	bgeu	a4,a2,80005d70 <__memset+0x1c8>
    80005ce8:	00e50733          	add	a4,a0,a4
    80005cec:	00b70023          	sb	a1,0(a4)
    80005cf0:	0067871b          	addiw	a4,a5,6
    80005cf4:	06c77e63          	bgeu	a4,a2,80005d70 <__memset+0x1c8>
    80005cf8:	00e50733          	add	a4,a0,a4
    80005cfc:	00b70023          	sb	a1,0(a4)
    80005d00:	0077871b          	addiw	a4,a5,7
    80005d04:	06c77663          	bgeu	a4,a2,80005d70 <__memset+0x1c8>
    80005d08:	00e50733          	add	a4,a0,a4
    80005d0c:	00b70023          	sb	a1,0(a4)
    80005d10:	0087871b          	addiw	a4,a5,8
    80005d14:	04c77e63          	bgeu	a4,a2,80005d70 <__memset+0x1c8>
    80005d18:	00e50733          	add	a4,a0,a4
    80005d1c:	00b70023          	sb	a1,0(a4)
    80005d20:	0097871b          	addiw	a4,a5,9
    80005d24:	04c77663          	bgeu	a4,a2,80005d70 <__memset+0x1c8>
    80005d28:	00e50733          	add	a4,a0,a4
    80005d2c:	00b70023          	sb	a1,0(a4)
    80005d30:	00a7871b          	addiw	a4,a5,10
    80005d34:	02c77e63          	bgeu	a4,a2,80005d70 <__memset+0x1c8>
    80005d38:	00e50733          	add	a4,a0,a4
    80005d3c:	00b70023          	sb	a1,0(a4)
    80005d40:	00b7871b          	addiw	a4,a5,11
    80005d44:	02c77663          	bgeu	a4,a2,80005d70 <__memset+0x1c8>
    80005d48:	00e50733          	add	a4,a0,a4
    80005d4c:	00b70023          	sb	a1,0(a4)
    80005d50:	00c7871b          	addiw	a4,a5,12
    80005d54:	00c77e63          	bgeu	a4,a2,80005d70 <__memset+0x1c8>
    80005d58:	00e50733          	add	a4,a0,a4
    80005d5c:	00b70023          	sb	a1,0(a4)
    80005d60:	00d7879b          	addiw	a5,a5,13
    80005d64:	00c7f663          	bgeu	a5,a2,80005d70 <__memset+0x1c8>
    80005d68:	00f507b3          	add	a5,a0,a5
    80005d6c:	00b78023          	sb	a1,0(a5)
    80005d70:	00813403          	ld	s0,8(sp)
    80005d74:	01010113          	addi	sp,sp,16
    80005d78:	00008067          	ret
    80005d7c:	00b00693          	li	a3,11
    80005d80:	e55ff06f          	j	80005bd4 <__memset+0x2c>
    80005d84:	00300e93          	li	t4,3
    80005d88:	ea5ff06f          	j	80005c2c <__memset+0x84>
    80005d8c:	00100e93          	li	t4,1
    80005d90:	e9dff06f          	j	80005c2c <__memset+0x84>
    80005d94:	00000e93          	li	t4,0
    80005d98:	e95ff06f          	j	80005c2c <__memset+0x84>
    80005d9c:	00000793          	li	a5,0
    80005da0:	ef9ff06f          	j	80005c98 <__memset+0xf0>
    80005da4:	00200e93          	li	t4,2
    80005da8:	e85ff06f          	j	80005c2c <__memset+0x84>
    80005dac:	00400e93          	li	t4,4
    80005db0:	e7dff06f          	j	80005c2c <__memset+0x84>
    80005db4:	00500e93          	li	t4,5
    80005db8:	e75ff06f          	j	80005c2c <__memset+0x84>
    80005dbc:	00600e93          	li	t4,6
    80005dc0:	e6dff06f          	j	80005c2c <__memset+0x84>

0000000080005dc4 <__memmove>:
    80005dc4:	ff010113          	addi	sp,sp,-16
    80005dc8:	00813423          	sd	s0,8(sp)
    80005dcc:	01010413          	addi	s0,sp,16
    80005dd0:	0e060863          	beqz	a2,80005ec0 <__memmove+0xfc>
    80005dd4:	fff6069b          	addiw	a3,a2,-1
    80005dd8:	0006881b          	sext.w	a6,a3
    80005ddc:	0ea5e863          	bltu	a1,a0,80005ecc <__memmove+0x108>
    80005de0:	00758713          	addi	a4,a1,7
    80005de4:	00a5e7b3          	or	a5,a1,a0
    80005de8:	40a70733          	sub	a4,a4,a0
    80005dec:	0077f793          	andi	a5,a5,7
    80005df0:	00f73713          	sltiu	a4,a4,15
    80005df4:	00174713          	xori	a4,a4,1
    80005df8:	0017b793          	seqz	a5,a5
    80005dfc:	00e7f7b3          	and	a5,a5,a4
    80005e00:	10078863          	beqz	a5,80005f10 <__memmove+0x14c>
    80005e04:	00900793          	li	a5,9
    80005e08:	1107f463          	bgeu	a5,a6,80005f10 <__memmove+0x14c>
    80005e0c:	0036581b          	srliw	a6,a2,0x3
    80005e10:	fff8081b          	addiw	a6,a6,-1
    80005e14:	02081813          	slli	a6,a6,0x20
    80005e18:	01d85893          	srli	a7,a6,0x1d
    80005e1c:	00858813          	addi	a6,a1,8
    80005e20:	00058793          	mv	a5,a1
    80005e24:	00050713          	mv	a4,a0
    80005e28:	01088833          	add	a6,a7,a6
    80005e2c:	0007b883          	ld	a7,0(a5)
    80005e30:	00878793          	addi	a5,a5,8
    80005e34:	00870713          	addi	a4,a4,8
    80005e38:	ff173c23          	sd	a7,-8(a4)
    80005e3c:	ff0798e3          	bne	a5,a6,80005e2c <__memmove+0x68>
    80005e40:	ff867713          	andi	a4,a2,-8
    80005e44:	02071793          	slli	a5,a4,0x20
    80005e48:	0207d793          	srli	a5,a5,0x20
    80005e4c:	00f585b3          	add	a1,a1,a5
    80005e50:	40e686bb          	subw	a3,a3,a4
    80005e54:	00f507b3          	add	a5,a0,a5
    80005e58:	06e60463          	beq	a2,a4,80005ec0 <__memmove+0xfc>
    80005e5c:	0005c703          	lbu	a4,0(a1)
    80005e60:	00e78023          	sb	a4,0(a5)
    80005e64:	04068e63          	beqz	a3,80005ec0 <__memmove+0xfc>
    80005e68:	0015c603          	lbu	a2,1(a1)
    80005e6c:	00100713          	li	a4,1
    80005e70:	00c780a3          	sb	a2,1(a5)
    80005e74:	04e68663          	beq	a3,a4,80005ec0 <__memmove+0xfc>
    80005e78:	0025c603          	lbu	a2,2(a1)
    80005e7c:	00200713          	li	a4,2
    80005e80:	00c78123          	sb	a2,2(a5)
    80005e84:	02e68e63          	beq	a3,a4,80005ec0 <__memmove+0xfc>
    80005e88:	0035c603          	lbu	a2,3(a1)
    80005e8c:	00300713          	li	a4,3
    80005e90:	00c781a3          	sb	a2,3(a5)
    80005e94:	02e68663          	beq	a3,a4,80005ec0 <__memmove+0xfc>
    80005e98:	0045c603          	lbu	a2,4(a1)
    80005e9c:	00400713          	li	a4,4
    80005ea0:	00c78223          	sb	a2,4(a5)
    80005ea4:	00e68e63          	beq	a3,a4,80005ec0 <__memmove+0xfc>
    80005ea8:	0055c603          	lbu	a2,5(a1)
    80005eac:	00500713          	li	a4,5
    80005eb0:	00c782a3          	sb	a2,5(a5)
    80005eb4:	00e68663          	beq	a3,a4,80005ec0 <__memmove+0xfc>
    80005eb8:	0065c703          	lbu	a4,6(a1)
    80005ebc:	00e78323          	sb	a4,6(a5)
    80005ec0:	00813403          	ld	s0,8(sp)
    80005ec4:	01010113          	addi	sp,sp,16
    80005ec8:	00008067          	ret
    80005ecc:	02061713          	slli	a4,a2,0x20
    80005ed0:	02075713          	srli	a4,a4,0x20
    80005ed4:	00e587b3          	add	a5,a1,a4
    80005ed8:	f0f574e3          	bgeu	a0,a5,80005de0 <__memmove+0x1c>
    80005edc:	02069613          	slli	a2,a3,0x20
    80005ee0:	02065613          	srli	a2,a2,0x20
    80005ee4:	fff64613          	not	a2,a2
    80005ee8:	00e50733          	add	a4,a0,a4
    80005eec:	00c78633          	add	a2,a5,a2
    80005ef0:	fff7c683          	lbu	a3,-1(a5)
    80005ef4:	fff78793          	addi	a5,a5,-1
    80005ef8:	fff70713          	addi	a4,a4,-1
    80005efc:	00d70023          	sb	a3,0(a4)
    80005f00:	fec798e3          	bne	a5,a2,80005ef0 <__memmove+0x12c>
    80005f04:	00813403          	ld	s0,8(sp)
    80005f08:	01010113          	addi	sp,sp,16
    80005f0c:	00008067          	ret
    80005f10:	02069713          	slli	a4,a3,0x20
    80005f14:	02075713          	srli	a4,a4,0x20
    80005f18:	00170713          	addi	a4,a4,1
    80005f1c:	00e50733          	add	a4,a0,a4
    80005f20:	00050793          	mv	a5,a0
    80005f24:	0005c683          	lbu	a3,0(a1)
    80005f28:	00178793          	addi	a5,a5,1
    80005f2c:	00158593          	addi	a1,a1,1
    80005f30:	fed78fa3          	sb	a3,-1(a5)
    80005f34:	fee798e3          	bne	a5,a4,80005f24 <__memmove+0x160>
    80005f38:	f89ff06f          	j	80005ec0 <__memmove+0xfc>

0000000080005f3c <__mem_free>:
    80005f3c:	ff010113          	addi	sp,sp,-16
    80005f40:	00813423          	sd	s0,8(sp)
    80005f44:	01010413          	addi	s0,sp,16
    80005f48:	00002597          	auipc	a1,0x2
    80005f4c:	78058593          	addi	a1,a1,1920 # 800086c8 <freep>
    80005f50:	0005b783          	ld	a5,0(a1)
    80005f54:	ff050693          	addi	a3,a0,-16
    80005f58:	0007b703          	ld	a4,0(a5)
    80005f5c:	00d7fc63          	bgeu	a5,a3,80005f74 <__mem_free+0x38>
    80005f60:	00e6ee63          	bltu	a3,a4,80005f7c <__mem_free+0x40>
    80005f64:	00e7fc63          	bgeu	a5,a4,80005f7c <__mem_free+0x40>
    80005f68:	00070793          	mv	a5,a4
    80005f6c:	0007b703          	ld	a4,0(a5)
    80005f70:	fed7e8e3          	bltu	a5,a3,80005f60 <__mem_free+0x24>
    80005f74:	fee7eae3          	bltu	a5,a4,80005f68 <__mem_free+0x2c>
    80005f78:	fee6f8e3          	bgeu	a3,a4,80005f68 <__mem_free+0x2c>
    80005f7c:	ff852803          	lw	a6,-8(a0)
    80005f80:	02081613          	slli	a2,a6,0x20
    80005f84:	01c65613          	srli	a2,a2,0x1c
    80005f88:	00c68633          	add	a2,a3,a2
    80005f8c:	02c70a63          	beq	a4,a2,80005fc0 <__mem_free+0x84>
    80005f90:	fee53823          	sd	a4,-16(a0)
    80005f94:	0087a503          	lw	a0,8(a5)
    80005f98:	02051613          	slli	a2,a0,0x20
    80005f9c:	01c65613          	srli	a2,a2,0x1c
    80005fa0:	00c78633          	add	a2,a5,a2
    80005fa4:	04c68263          	beq	a3,a2,80005fe8 <__mem_free+0xac>
    80005fa8:	00813403          	ld	s0,8(sp)
    80005fac:	00d7b023          	sd	a3,0(a5)
    80005fb0:	00f5b023          	sd	a5,0(a1)
    80005fb4:	00000513          	li	a0,0
    80005fb8:	01010113          	addi	sp,sp,16
    80005fbc:	00008067          	ret
    80005fc0:	00872603          	lw	a2,8(a4)
    80005fc4:	00073703          	ld	a4,0(a4)
    80005fc8:	0106083b          	addw	a6,a2,a6
    80005fcc:	ff052c23          	sw	a6,-8(a0)
    80005fd0:	fee53823          	sd	a4,-16(a0)
    80005fd4:	0087a503          	lw	a0,8(a5)
    80005fd8:	02051613          	slli	a2,a0,0x20
    80005fdc:	01c65613          	srli	a2,a2,0x1c
    80005fe0:	00c78633          	add	a2,a5,a2
    80005fe4:	fcc692e3          	bne	a3,a2,80005fa8 <__mem_free+0x6c>
    80005fe8:	00813403          	ld	s0,8(sp)
    80005fec:	0105053b          	addw	a0,a0,a6
    80005ff0:	00a7a423          	sw	a0,8(a5)
    80005ff4:	00e7b023          	sd	a4,0(a5)
    80005ff8:	00f5b023          	sd	a5,0(a1)
    80005ffc:	00000513          	li	a0,0
    80006000:	01010113          	addi	sp,sp,16
    80006004:	00008067          	ret

0000000080006008 <__mem_alloc>:
    80006008:	fc010113          	addi	sp,sp,-64
    8000600c:	02813823          	sd	s0,48(sp)
    80006010:	02913423          	sd	s1,40(sp)
    80006014:	03213023          	sd	s2,32(sp)
    80006018:	01513423          	sd	s5,8(sp)
    8000601c:	02113c23          	sd	ra,56(sp)
    80006020:	01313c23          	sd	s3,24(sp)
    80006024:	01413823          	sd	s4,16(sp)
    80006028:	01613023          	sd	s6,0(sp)
    8000602c:	04010413          	addi	s0,sp,64
    80006030:	00002a97          	auipc	s5,0x2
    80006034:	698a8a93          	addi	s5,s5,1688 # 800086c8 <freep>
    80006038:	00f50913          	addi	s2,a0,15
    8000603c:	000ab683          	ld	a3,0(s5)
    80006040:	00495913          	srli	s2,s2,0x4
    80006044:	0019049b          	addiw	s1,s2,1
    80006048:	00048913          	mv	s2,s1
    8000604c:	0c068c63          	beqz	a3,80006124 <__mem_alloc+0x11c>
    80006050:	0006b503          	ld	a0,0(a3)
    80006054:	00852703          	lw	a4,8(a0)
    80006058:	10977063          	bgeu	a4,s1,80006158 <__mem_alloc+0x150>
    8000605c:	000017b7          	lui	a5,0x1
    80006060:	0009099b          	sext.w	s3,s2
    80006064:	0af4e863          	bltu	s1,a5,80006114 <__mem_alloc+0x10c>
    80006068:	02099a13          	slli	s4,s3,0x20
    8000606c:	01ca5a13          	srli	s4,s4,0x1c
    80006070:	fff00b13          	li	s6,-1
    80006074:	0100006f          	j	80006084 <__mem_alloc+0x7c>
    80006078:	0007b503          	ld	a0,0(a5) # 1000 <_entry-0x7ffff000>
    8000607c:	00852703          	lw	a4,8(a0)
    80006080:	04977463          	bgeu	a4,s1,800060c8 <__mem_alloc+0xc0>
    80006084:	00050793          	mv	a5,a0
    80006088:	fea698e3          	bne	a3,a0,80006078 <__mem_alloc+0x70>
    8000608c:	000a0513          	mv	a0,s4
    80006090:	00000097          	auipc	ra,0x0
    80006094:	0d0080e7          	jalr	208(ra) # 80006160 <kvmincrease>
    80006098:	00050793          	mv	a5,a0
    8000609c:	01050513          	addi	a0,a0,16
    800060a0:	07678e63          	beq	a5,s6,8000611c <__mem_alloc+0x114>
    800060a4:	0137a423          	sw	s3,8(a5)
    800060a8:	00000097          	auipc	ra,0x0
    800060ac:	e94080e7          	jalr	-364(ra) # 80005f3c <__mem_free>
    800060b0:	000ab783          	ld	a5,0(s5)
    800060b4:	06078463          	beqz	a5,8000611c <__mem_alloc+0x114>
    800060b8:	0007b503          	ld	a0,0(a5)
    800060bc:	00078693          	mv	a3,a5
    800060c0:	00852703          	lw	a4,8(a0)
    800060c4:	fc9760e3          	bltu	a4,s1,80006084 <__mem_alloc+0x7c>
    800060c8:	08e48263          	beq	s1,a4,8000614c <__mem_alloc+0x144>
    800060cc:	4127073b          	subw	a4,a4,s2
    800060d0:	02071693          	slli	a3,a4,0x20
    800060d4:	01c6d693          	srli	a3,a3,0x1c
    800060d8:	00e52423          	sw	a4,8(a0)
    800060dc:	00d50533          	add	a0,a0,a3
    800060e0:	01252423          	sw	s2,8(a0)
    800060e4:	00fab023          	sd	a5,0(s5)
    800060e8:	01050513          	addi	a0,a0,16
    800060ec:	03813083          	ld	ra,56(sp)
    800060f0:	03013403          	ld	s0,48(sp)
    800060f4:	02813483          	ld	s1,40(sp)
    800060f8:	02013903          	ld	s2,32(sp)
    800060fc:	01813983          	ld	s3,24(sp)
    80006100:	01013a03          	ld	s4,16(sp)
    80006104:	00813a83          	ld	s5,8(sp)
    80006108:	00013b03          	ld	s6,0(sp)
    8000610c:	04010113          	addi	sp,sp,64
    80006110:	00008067          	ret
    80006114:	000019b7          	lui	s3,0x1
    80006118:	f51ff06f          	j	80006068 <__mem_alloc+0x60>
    8000611c:	00000513          	li	a0,0
    80006120:	fcdff06f          	j	800060ec <__mem_alloc+0xe4>
    80006124:	00004797          	auipc	a5,0x4
    80006128:	abc78793          	addi	a5,a5,-1348 # 80009be0 <base>
    8000612c:	00078513          	mv	a0,a5
    80006130:	00fab023          	sd	a5,0(s5)
    80006134:	00f7b023          	sd	a5,0(a5)
    80006138:	00000713          	li	a4,0
    8000613c:	00004797          	auipc	a5,0x4
    80006140:	aa07a623          	sw	zero,-1364(a5) # 80009be8 <base+0x8>
    80006144:	00050693          	mv	a3,a0
    80006148:	f11ff06f          	j	80006058 <__mem_alloc+0x50>
    8000614c:	00053703          	ld	a4,0(a0)
    80006150:	00e7b023          	sd	a4,0(a5)
    80006154:	f91ff06f          	j	800060e4 <__mem_alloc+0xdc>
    80006158:	00068793          	mv	a5,a3
    8000615c:	f6dff06f          	j	800060c8 <__mem_alloc+0xc0>

0000000080006160 <kvmincrease>:
    80006160:	fe010113          	addi	sp,sp,-32
    80006164:	01213023          	sd	s2,0(sp)
    80006168:	00001937          	lui	s2,0x1
    8000616c:	fff90913          	addi	s2,s2,-1 # fff <_entry-0x7ffff001>
    80006170:	00813823          	sd	s0,16(sp)
    80006174:	00113c23          	sd	ra,24(sp)
    80006178:	00913423          	sd	s1,8(sp)
    8000617c:	02010413          	addi	s0,sp,32
    80006180:	01250933          	add	s2,a0,s2
    80006184:	00c95913          	srli	s2,s2,0xc
    80006188:	02090863          	beqz	s2,800061b8 <kvmincrease+0x58>
    8000618c:	00000493          	li	s1,0
    80006190:	00148493          	addi	s1,s1,1
    80006194:	fffff097          	auipc	ra,0xfffff
    80006198:	5dc080e7          	jalr	1500(ra) # 80005770 <kalloc>
    8000619c:	fe991ae3          	bne	s2,s1,80006190 <kvmincrease+0x30>
    800061a0:	01813083          	ld	ra,24(sp)
    800061a4:	01013403          	ld	s0,16(sp)
    800061a8:	00813483          	ld	s1,8(sp)
    800061ac:	00013903          	ld	s2,0(sp)
    800061b0:	02010113          	addi	sp,sp,32
    800061b4:	00008067          	ret
    800061b8:	01813083          	ld	ra,24(sp)
    800061bc:	01013403          	ld	s0,16(sp)
    800061c0:	00813483          	ld	s1,8(sp)
    800061c4:	00013903          	ld	s2,0(sp)
    800061c8:	00000513          	li	a0,0
    800061cc:	02010113          	addi	sp,sp,32
    800061d0:	00008067          	ret
	...
