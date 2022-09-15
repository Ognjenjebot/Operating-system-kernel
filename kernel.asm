
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00007117          	auipc	sp,0x7
    80000004:	ff013103          	ld	sp,-16(sp) # 80006ff0 <_GLOBAL_OFFSET_TABLE_+0x40>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	689020ef          	jal	ra,80002ea4 <start>

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
    80001084:	40c010ef          	jal	ra,80002490 <_ZN5Riscv20handleSupervisorTrapEv>

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

    void* volatile stack = new uint64[DEFAULT_STACK_SIZE];
    80001220:	00008537          	lui	a0,0x8
    80001224:	00001097          	auipc	ra,0x1
    80001228:	140080e7          	jalr	320(ra) # 80002364 <_Znam>
    8000122c:	fca43423          	sd	a0,-56(s0)
    printInteger((uint64)stack);
    80001230:	fc843503          	ld	a0,-56(s0)
    80001234:	00002097          	auipc	ra,0x2
    80001238:	bb4080e7          	jalr	-1100(ra) # 80002de8 <_Z12printIntegerm>
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

00000000800012bc <_Z15thread_dispatchv>:

void thread_dispatch(){
    800012bc:	ff010113          	addi	sp,sp,-16
    800012c0:	00813423          	sd	s0,8(sp)
    800012c4:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a0, %0" : : "r" (THREAD_DISPACH));
    800012c8:	01300793          	li	a5,19
    800012cc:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    800012d0:	00000073          	ecall
}
    800012d4:	00813403          	ld	s0,8(sp)
    800012d8:	01010113          	addi	sp,sp,16
    800012dc:	00008067          	ret

00000000800012e0 <_Z21thread_initializationPP7_threadPFvPvES2_>:

void thread_initialization(
        thread_t *handle,
        void(*start_routine)(void*),
        void *arg) {
    800012e0:	fc010113          	addi	sp,sp,-64
    800012e4:	02113c23          	sd	ra,56(sp)
    800012e8:	02813823          	sd	s0,48(sp)
    800012ec:	02913423          	sd	s1,40(sp)
    800012f0:	03213023          	sd	s2,32(sp)
    800012f4:	01313c23          	sd	s3,24(sp)
    800012f8:	04010413          	addi	s0,sp,64
    800012fc:	00050993          	mv	s3,a0
    80001300:	00058913          	mv	s2,a1
    80001304:	00060493          	mv	s1,a2
    void* volatile stack = new uint64[DEFAULT_STACK_SIZE];
    80001308:	00008537          	lui	a0,0x8
    8000130c:	00001097          	auipc	ra,0x1
    80001310:	058080e7          	jalr	88(ra) # 80002364 <_Znam>
    80001314:	fca43423          	sd	a0,-56(s0)
    if (stack != nullptr) {
    80001318:	fc843783          	ld	a5,-56(s0)
    8000131c:	02078263          	beqz	a5,80001340 <_Z21thread_initializationPP7_threadPFvPvES2_+0x60>
        __asm__ volatile("mv a0, %0" : : "r" (THREAD_INIT));
    80001320:	04300793          	li	a5,67
    80001324:	00078513          	mv	a0,a5
        __asm__ volatile("mv a1, %0" : : "r" (handle));
    80001328:	00098593          	mv	a1,s3
        __asm__ volatile("mv a2, %0" : : "r" (start_routine));
    8000132c:	00090613          	mv	a2,s2
        __asm__ volatile("mv a3, %0" : : "r" (arg));
    80001330:	00048693          	mv	a3,s1
        __asm__ volatile("mv a4, %0" : : "r" (stack));
    80001334:	fc843783          	ld	a5,-56(s0)
    80001338:	00078713          	mv	a4,a5
        __asm__ volatile("ecall");
    8000133c:	00000073          	ecall
    }
}
    80001340:	03813083          	ld	ra,56(sp)
    80001344:	03013403          	ld	s0,48(sp)
    80001348:	02813483          	ld	s1,40(sp)
    8000134c:	02013903          	ld	s2,32(sp)
    80001350:	01813983          	ld	s3,24(sp)
    80001354:	04010113          	addi	sp,sp,64
    80001358:	00008067          	ret

000000008000135c <_Z12thread_startP7_thread>:

void thread_start(thread_t t){
    8000135c:	ff010113          	addi	sp,sp,-16
    80001360:	00813423          	sd	s0,8(sp)
    80001364:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %0" : : "r" (t));
    80001368:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %0" : : "r" (THREAD_START));
    8000136c:	04400793          	li	a5,68
    80001370:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    80001374:	00000073          	ecall
}
    80001378:	00813403          	ld	s0,8(sp)
    8000137c:	01010113          	addi	sp,sp,16
    80001380:	00008067          	ret

0000000080001384 <_Z8sem_openPP4_semj>:


int sem_open(sem_t *handle, unsigned init){
    80001384:	ff010113          	addi	sp,sp,-16
    80001388:	00813423          	sd	s0,8(sp)
    8000138c:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a2, %0" : : "r" (init));
    80001390:	00058613          	mv	a2,a1
    __asm__ volatile("mv a1, %0" : : "r" (handle));
    80001394:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %0" : : "r" (SEM_OPEN));
    80001398:	02100793          	li	a5,33
    8000139c:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    800013a0:	00000073          	ecall
    uint64 ret;
    __asm__ volatile("mv %0, a0" : "=r" (ret));
    800013a4:	00050513          	mv	a0,a0
    return ret;
}
    800013a8:	0005051b          	sext.w	a0,a0
    800013ac:	00813403          	ld	s0,8(sp)
    800013b0:	01010113          	addi	sp,sp,16
    800013b4:	00008067          	ret

00000000800013b8 <_Z9sem_closeP4_sem>:

int sem_close(sem_t handle){
    800013b8:	ff010113          	addi	sp,sp,-16
    800013bc:	00813423          	sd	s0,8(sp)
    800013c0:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %0" : : "r" (handle));
    800013c4:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %0" : : "r" (SEM_CLOSE));
    800013c8:	02200793          	li	a5,34
    800013cc:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    800013d0:	00000073          	ecall
    uint64 ret;
    __asm__ volatile("mv %0, a0" : "=r" (ret));
    800013d4:	00050513          	mv	a0,a0
    return ret;
}
    800013d8:	0005051b          	sext.w	a0,a0
    800013dc:	00813403          	ld	s0,8(sp)
    800013e0:	01010113          	addi	sp,sp,16
    800013e4:	00008067          	ret

00000000800013e8 <_Z8sem_waitP4_sem>:

int sem_wait(sem_t id){
    800013e8:	ff010113          	addi	sp,sp,-16
    800013ec:	00813423          	sd	s0,8(sp)
    800013f0:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %0" : : "r" (id));
    800013f4:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %0" : : "r" (SEM_WAIT));
    800013f8:	02300793          	li	a5,35
    800013fc:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    80001400:	00000073          	ecall
    uint64 ret;
    __asm__ volatile("mv %0, a0" : "=r" (ret));
    80001404:	00050513          	mv	a0,a0
    return ret;
}
    80001408:	0005051b          	sext.w	a0,a0
    8000140c:	00813403          	ld	s0,8(sp)
    80001410:	01010113          	addi	sp,sp,16
    80001414:	00008067          	ret

0000000080001418 <_Z10sem_signalP4_sem>:

int sem_signal(sem_t id){
    80001418:	ff010113          	addi	sp,sp,-16
    8000141c:	00813423          	sd	s0,8(sp)
    80001420:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %0" : : "r" (id));
    80001424:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %0" : : "r" (SEM_SIGNAL));
    80001428:	02400793          	li	a5,36
    8000142c:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    80001430:	00000073          	ecall
    uint64 ret;
    __asm__ volatile("mv %0, a0" : "=r" (ret));
    80001434:	00050513          	mv	a0,a0
    return ret;
}
    80001438:	0005051b          	sext.w	a0,a0
    8000143c:	00813403          	ld	s0,8(sp)
    80001440:	01010113          	addi	sp,sp,16
    80001444:	00008067          	ret

0000000080001448 <_Z10time_sleepm>:

int time_sleep(time_t t){
    80001448:	ff010113          	addi	sp,sp,-16
    8000144c:	00813423          	sd	s0,8(sp)
    80001450:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %0" : : "r" (t));
    80001454:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %0" : : "r" (THREAD_SLEEP));
    80001458:	03100793          	li	a5,49
    8000145c:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    80001460:	00000073          	ecall
    uint64 ret;
    __asm__ volatile("mv %0, a0" : "=r" (ret));
    80001464:	00050513          	mv	a0,a0
    return ret;
}
    80001468:	0005051b          	sext.w	a0,a0
    8000146c:	00813403          	ld	s0,8(sp)
    80001470:	01010113          	addi	sp,sp,16
    80001474:	00008067          	ret

0000000080001478 <_Z4getcv>:

char getc(){
    80001478:	ff010113          	addi	sp,sp,-16
    8000147c:	00813423          	sd	s0,8(sp)
    80001480:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a0, %0" : : "r" (GETC));
    80001484:	04100793          	li	a5,65
    80001488:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    8000148c:	00000073          	ecall
    char ret;
    __asm__ volatile("mv %0, a0" : "=r" (ret));
    80001490:	00050513          	mv	a0,a0
    return ret;
}
    80001494:	0ff57513          	andi	a0,a0,255
    80001498:	00813403          	ld	s0,8(sp)
    8000149c:	01010113          	addi	sp,sp,16
    800014a0:	00008067          	ret

00000000800014a4 <_Z4putcc>:
void putc(char c){
    800014a4:	ff010113          	addi	sp,sp,-16
    800014a8:	00813423          	sd	s0,8(sp)
    800014ac:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %0" : : "r" (c));
    800014b0:	00050593          	mv	a1,a0
    __asm__ volatile("mv a0, %0" : : "r" (PUTC));
    800014b4:	04200793          	li	a5,66
    800014b8:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    800014bc:	00000073          	ecall
}
    800014c0:	00813403          	ld	s0,8(sp)
    800014c4:	01010113          	addi	sp,sp,16
    800014c8:	00008067          	ret

00000000800014cc <_ZL9fibonaccim>:
        }
    }
}

static uint64 fibonacci(uint64 n)
{
    800014cc:	fe010113          	addi	sp,sp,-32
    800014d0:	00113c23          	sd	ra,24(sp)
    800014d4:	00813823          	sd	s0,16(sp)
    800014d8:	00913423          	sd	s1,8(sp)
    800014dc:	01213023          	sd	s2,0(sp)
    800014e0:	02010413          	addi	s0,sp,32
    800014e4:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    800014e8:	00100793          	li	a5,1
    800014ec:	02a7f863          	bgeu	a5,a0,8000151c <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { _thread::yield(); }
    800014f0:	00a00793          	li	a5,10
    800014f4:	02f577b3          	remu	a5,a0,a5
    800014f8:	02078e63          	beqz	a5,80001534 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    800014fc:	fff48513          	addi	a0,s1,-1
    80001500:	00000097          	auipc	ra,0x0
    80001504:	fcc080e7          	jalr	-52(ra) # 800014cc <_ZL9fibonaccim>
    80001508:	00050913          	mv	s2,a0
    8000150c:	ffe48513          	addi	a0,s1,-2
    80001510:	00000097          	auipc	ra,0x0
    80001514:	fbc080e7          	jalr	-68(ra) # 800014cc <_ZL9fibonaccim>
    80001518:	00a90533          	add	a0,s2,a0
}
    8000151c:	01813083          	ld	ra,24(sp)
    80001520:	01013403          	ld	s0,16(sp)
    80001524:	00813483          	ld	s1,8(sp)
    80001528:	00013903          	ld	s2,0(sp)
    8000152c:	02010113          	addi	sp,sp,32
    80001530:	00008067          	ret
    if (n % 10 == 0) { _thread::yield(); }
    80001534:	00001097          	auipc	ra,0x1
    80001538:	a4c080e7          	jalr	-1460(ra) # 80001f80 <_ZN7_thread5yieldEv>
    8000153c:	fc1ff06f          	j	800014fc <_ZL9fibonaccim+0x30>

0000000080001540 <_Z11workerBodyAPv>:
{
    80001540:	fe010113          	addi	sp,sp,-32
    80001544:	00113c23          	sd	ra,24(sp)
    80001548:	00813823          	sd	s0,16(sp)
    8000154c:	00913423          	sd	s1,8(sp)
    80001550:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++)
    80001554:	00000493          	li	s1,0
    80001558:	0500006f          	j	800015a8 <_Z11workerBodyAPv+0x68>
            time_sleep(50);
    8000155c:	03200513          	li	a0,50
    80001560:	00000097          	auipc	ra,0x0
    80001564:	ee8080e7          	jalr	-280(ra) # 80001448 <_Z10time_sleepm>
            char c = getc();
    80001568:	00000097          	auipc	ra,0x0
    8000156c:	f10080e7          	jalr	-240(ra) # 80001478 <_Z4getcv>
            putc(c);
    80001570:	00000097          	auipc	ra,0x0
    80001574:	f34080e7          	jalr	-204(ra) # 800014a4 <_Z4putcc>
    80001578:	0400006f          	j	800015b8 <_Z11workerBodyAPv+0x78>
        for (uint64 j = 0; j < 10000; j++)
    8000157c:	00168693          	addi	a3,a3,1
    80001580:	000027b7          	lui	a5,0x2
    80001584:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80001588:	00d7ee63          	bltu	a5,a3,800015a4 <_Z11workerBodyAPv+0x64>
            for (uint64 k = 0; k < 30000; k++)
    8000158c:	00000713          	li	a4,0
    80001590:	000077b7          	lui	a5,0x7
    80001594:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80001598:	fee7e2e3          	bltu	a5,a4,8000157c <_Z11workerBodyAPv+0x3c>
    8000159c:	00170713          	addi	a4,a4,1
    800015a0:	ff1ff06f          	j	80001590 <_Z11workerBodyAPv+0x50>
    for (uint64 i = 0; i < 10; i++)
    800015a4:	00148493          	addi	s1,s1,1
    800015a8:	00900793          	li	a5,9
    800015ac:	0497e063          	bltu	a5,s1,800015ec <_Z11workerBodyAPv+0xac>
        if(i == 5) {
    800015b0:	00500793          	li	a5,5
    800015b4:	faf484e3          	beq	s1,a5,8000155c <_Z11workerBodyAPv+0x1c>
        printString("A: i=");
    800015b8:	00005517          	auipc	a0,0x5
    800015bc:	a6850513          	addi	a0,a0,-1432 # 80006020 <CONSOLE_STATUS+0x10>
    800015c0:	00001097          	auipc	ra,0x1
    800015c4:	7b8080e7          	jalr	1976(ra) # 80002d78 <_Z11printStringPKc>
        printInteger(i);
    800015c8:	00048513          	mv	a0,s1
    800015cc:	00002097          	auipc	ra,0x2
    800015d0:	81c080e7          	jalr	-2020(ra) # 80002de8 <_Z12printIntegerm>
        printString("\n");
    800015d4:	00005517          	auipc	a0,0x5
    800015d8:	adc50513          	addi	a0,a0,-1316 # 800060b0 <CONSOLE_STATUS+0xa0>
    800015dc:	00001097          	auipc	ra,0x1
    800015e0:	79c080e7          	jalr	1948(ra) # 80002d78 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++)
    800015e4:	00000693          	li	a3,0
    800015e8:	f99ff06f          	j	80001580 <_Z11workerBodyAPv+0x40>
}
    800015ec:	01813083          	ld	ra,24(sp)
    800015f0:	01013403          	ld	s0,16(sp)
    800015f4:	00813483          	ld	s1,8(sp)
    800015f8:	02010113          	addi	sp,sp,32
    800015fc:	00008067          	ret

0000000080001600 <_Z11workerBodyBv>:
{
    80001600:	fe010113          	addi	sp,sp,-32
    80001604:	00113c23          	sd	ra,24(sp)
    80001608:	00813823          	sd	s0,16(sp)
    8000160c:	00913423          	sd	s1,8(sp)
    80001610:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++)
    80001614:	00000493          	li	s1,0
    80001618:	0300006f          	j	80001648 <_Z11workerBodyBv+0x48>
        for (uint64 j = 0; j < 10000; j++)
    8000161c:	00168693          	addi	a3,a3,1
    80001620:	000027b7          	lui	a5,0x2
    80001624:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80001628:	00d7ee63          	bltu	a5,a3,80001644 <_Z11workerBodyBv+0x44>
            for (uint64 k = 0; k < 30000; k++)
    8000162c:	00000713          	li	a4,0
    80001630:	000077b7          	lui	a5,0x7
    80001634:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80001638:	fee7e2e3          	bltu	a5,a4,8000161c <_Z11workerBodyBv+0x1c>
    8000163c:	00170713          	addi	a4,a4,1
    80001640:	ff1ff06f          	j	80001630 <_Z11workerBodyBv+0x30>
    for (uint64 i = 0; i < 16; i++)
    80001644:	00148493          	addi	s1,s1,1
    80001648:	00f00793          	li	a5,15
    8000164c:	0297ec63          	bltu	a5,s1,80001684 <_Z11workerBodyBv+0x84>
        printString("B: i=");
    80001650:	00005517          	auipc	a0,0x5
    80001654:	9d850513          	addi	a0,a0,-1576 # 80006028 <CONSOLE_STATUS+0x18>
    80001658:	00001097          	auipc	ra,0x1
    8000165c:	720080e7          	jalr	1824(ra) # 80002d78 <_Z11printStringPKc>
        printInteger(i);
    80001660:	00048513          	mv	a0,s1
    80001664:	00001097          	auipc	ra,0x1
    80001668:	784080e7          	jalr	1924(ra) # 80002de8 <_Z12printIntegerm>
        printString("\n");
    8000166c:	00005517          	auipc	a0,0x5
    80001670:	a4450513          	addi	a0,a0,-1468 # 800060b0 <CONSOLE_STATUS+0xa0>
    80001674:	00001097          	auipc	ra,0x1
    80001678:	704080e7          	jalr	1796(ra) # 80002d78 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++)
    8000167c:	00000693          	li	a3,0
    80001680:	fa1ff06f          	j	80001620 <_Z11workerBodyBv+0x20>
}
    80001684:	01813083          	ld	ra,24(sp)
    80001688:	01013403          	ld	s0,16(sp)
    8000168c:	00813483          	ld	s1,8(sp)
    80001690:	02010113          	addi	sp,sp,32
    80001694:	00008067          	ret

0000000080001698 <_Z11workerBodyCv>:

void workerBodyC()
{
    80001698:	fe010113          	addi	sp,sp,-32
    8000169c:	00113c23          	sd	ra,24(sp)
    800016a0:	00813823          	sd	s0,16(sp)
    800016a4:	00913423          	sd	s1,8(sp)
    800016a8:	01213023          	sd	s2,0(sp)
    800016ac:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    800016b0:	00000493          	li	s1,0
    800016b4:	0380006f          	j	800016ec <_Z11workerBodyCv+0x54>
    for (; i < 3; i++)
    {
        printString("C: i=");
    800016b8:	00005517          	auipc	a0,0x5
    800016bc:	97850513          	addi	a0,a0,-1672 # 80006030 <CONSOLE_STATUS+0x20>
    800016c0:	00001097          	auipc	ra,0x1
    800016c4:	6b8080e7          	jalr	1720(ra) # 80002d78 <_Z11printStringPKc>
        printInteger(i);
    800016c8:	00048513          	mv	a0,s1
    800016cc:	00001097          	auipc	ra,0x1
    800016d0:	71c080e7          	jalr	1820(ra) # 80002de8 <_Z12printIntegerm>
        printString("\n");
    800016d4:	00005517          	auipc	a0,0x5
    800016d8:	9dc50513          	addi	a0,a0,-1572 # 800060b0 <CONSOLE_STATUS+0xa0>
    800016dc:	00001097          	auipc	ra,0x1
    800016e0:	69c080e7          	jalr	1692(ra) # 80002d78 <_Z11printStringPKc>
    for (; i < 3; i++)
    800016e4:	0014849b          	addiw	s1,s1,1
    800016e8:	0ff4f493          	andi	s1,s1,255
    800016ec:	00200793          	li	a5,2
    800016f0:	fc97f4e3          	bgeu	a5,s1,800016b8 <_Z11workerBodyCv+0x20>
    }

    printString("C: yield\n");
    800016f4:	00005517          	auipc	a0,0x5
    800016f8:	94450513          	addi	a0,a0,-1724 # 80006038 <CONSOLE_STATUS+0x28>
    800016fc:	00001097          	auipc	ra,0x1
    80001700:	67c080e7          	jalr	1660(ra) # 80002d78 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80001704:	00700313          	li	t1,7
    _thread::yield();
    80001708:	00001097          	auipc	ra,0x1
    8000170c:	878080e7          	jalr	-1928(ra) # 80001f80 <_ZN7_thread5yieldEv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80001710:	00030913          	mv	s2,t1

    printString("C: t1=");
    80001714:	00005517          	auipc	a0,0x5
    80001718:	93450513          	addi	a0,a0,-1740 # 80006048 <CONSOLE_STATUS+0x38>
    8000171c:	00001097          	auipc	ra,0x1
    80001720:	65c080e7          	jalr	1628(ra) # 80002d78 <_Z11printStringPKc>
    printInteger(t1);
    80001724:	00090513          	mv	a0,s2
    80001728:	00001097          	auipc	ra,0x1
    8000172c:	6c0080e7          	jalr	1728(ra) # 80002de8 <_Z12printIntegerm>
    printString("\n");
    80001730:	00005517          	auipc	a0,0x5
    80001734:	98050513          	addi	a0,a0,-1664 # 800060b0 <CONSOLE_STATUS+0xa0>
    80001738:	00001097          	auipc	ra,0x1
    8000173c:	640080e7          	jalr	1600(ra) # 80002d78 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    80001740:	00c00513          	li	a0,12
    80001744:	00000097          	auipc	ra,0x0
    80001748:	d88080e7          	jalr	-632(ra) # 800014cc <_ZL9fibonaccim>
    8000174c:	00050913          	mv	s2,a0
    printString("C: fibonaci=");
    80001750:	00005517          	auipc	a0,0x5
    80001754:	90050513          	addi	a0,a0,-1792 # 80006050 <CONSOLE_STATUS+0x40>
    80001758:	00001097          	auipc	ra,0x1
    8000175c:	620080e7          	jalr	1568(ra) # 80002d78 <_Z11printStringPKc>
    printInteger(result);
    80001760:	00090513          	mv	a0,s2
    80001764:	00001097          	auipc	ra,0x1
    80001768:	684080e7          	jalr	1668(ra) # 80002de8 <_Z12printIntegerm>
    printString("\n");
    8000176c:	00005517          	auipc	a0,0x5
    80001770:	94450513          	addi	a0,a0,-1724 # 800060b0 <CONSOLE_STATUS+0xa0>
    80001774:	00001097          	auipc	ra,0x1
    80001778:	604080e7          	jalr	1540(ra) # 80002d78 <_Z11printStringPKc>
    8000177c:	0380006f          	j	800017b4 <_Z11workerBodyCv+0x11c>

    for (; i < 6; i++)
    {
        printString("C: i=");
    80001780:	00005517          	auipc	a0,0x5
    80001784:	8b050513          	addi	a0,a0,-1872 # 80006030 <CONSOLE_STATUS+0x20>
    80001788:	00001097          	auipc	ra,0x1
    8000178c:	5f0080e7          	jalr	1520(ra) # 80002d78 <_Z11printStringPKc>
        printInteger(i);
    80001790:	00048513          	mv	a0,s1
    80001794:	00001097          	auipc	ra,0x1
    80001798:	654080e7          	jalr	1620(ra) # 80002de8 <_Z12printIntegerm>
        printString("\n");
    8000179c:	00005517          	auipc	a0,0x5
    800017a0:	91450513          	addi	a0,a0,-1772 # 800060b0 <CONSOLE_STATUS+0xa0>
    800017a4:	00001097          	auipc	ra,0x1
    800017a8:	5d4080e7          	jalr	1492(ra) # 80002d78 <_Z11printStringPKc>
    for (; i < 6; i++)
    800017ac:	0014849b          	addiw	s1,s1,1
    800017b0:	0ff4f493          	andi	s1,s1,255
    800017b4:	00500793          	li	a5,5
    800017b8:	fc97f4e3          	bgeu	a5,s1,80001780 <_Z11workerBodyCv+0xe8>
    }
//    _thread::yield();
}
    800017bc:	01813083          	ld	ra,24(sp)
    800017c0:	01013403          	ld	s0,16(sp)
    800017c4:	00813483          	ld	s1,8(sp)
    800017c8:	00013903          	ld	s2,0(sp)
    800017cc:	02010113          	addi	sp,sp,32
    800017d0:	00008067          	ret

00000000800017d4 <_Z11workerBodyDv>:

void workerBodyD()
{
    800017d4:	fe010113          	addi	sp,sp,-32
    800017d8:	00113c23          	sd	ra,24(sp)
    800017dc:	00813823          	sd	s0,16(sp)
    800017e0:	00913423          	sd	s1,8(sp)
    800017e4:	01213023          	sd	s2,0(sp)
    800017e8:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    800017ec:	00a00493          	li	s1,10
    800017f0:	0380006f          	j	80001828 <_Z11workerBodyDv+0x54>
    for (; i < 13; i++)
    {
        printString("D: i=");
    800017f4:	00005517          	auipc	a0,0x5
    800017f8:	86c50513          	addi	a0,a0,-1940 # 80006060 <CONSOLE_STATUS+0x50>
    800017fc:	00001097          	auipc	ra,0x1
    80001800:	57c080e7          	jalr	1404(ra) # 80002d78 <_Z11printStringPKc>
        printInteger(i);
    80001804:	00048513          	mv	a0,s1
    80001808:	00001097          	auipc	ra,0x1
    8000180c:	5e0080e7          	jalr	1504(ra) # 80002de8 <_Z12printIntegerm>
        printString("\n");
    80001810:	00005517          	auipc	a0,0x5
    80001814:	8a050513          	addi	a0,a0,-1888 # 800060b0 <CONSOLE_STATUS+0xa0>
    80001818:	00001097          	auipc	ra,0x1
    8000181c:	560080e7          	jalr	1376(ra) # 80002d78 <_Z11printStringPKc>
    for (; i < 13; i++)
    80001820:	0014849b          	addiw	s1,s1,1
    80001824:	0ff4f493          	andi	s1,s1,255
    80001828:	00c00793          	li	a5,12
    8000182c:	fc97f4e3          	bgeu	a5,s1,800017f4 <_Z11workerBodyDv+0x20>
    }

    printString("D: yield\n");
    80001830:	00005517          	auipc	a0,0x5
    80001834:	83850513          	addi	a0,a0,-1992 # 80006068 <CONSOLE_STATUS+0x58>
    80001838:	00001097          	auipc	ra,0x1
    8000183c:	540080e7          	jalr	1344(ra) # 80002d78 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80001840:	00500313          	li	t1,5
    _thread::yield();
    80001844:	00000097          	auipc	ra,0x0
    80001848:	73c080e7          	jalr	1852(ra) # 80001f80 <_ZN7_thread5yieldEv>

    uint64 result = fibonacci(16);
    8000184c:	01000513          	li	a0,16
    80001850:	00000097          	auipc	ra,0x0
    80001854:	c7c080e7          	jalr	-900(ra) # 800014cc <_ZL9fibonaccim>
    80001858:	00050913          	mv	s2,a0
    printString("D: fibonaci=");
    8000185c:	00005517          	auipc	a0,0x5
    80001860:	81c50513          	addi	a0,a0,-2020 # 80006078 <CONSOLE_STATUS+0x68>
    80001864:	00001097          	auipc	ra,0x1
    80001868:	514080e7          	jalr	1300(ra) # 80002d78 <_Z11printStringPKc>
    printInteger(result);
    8000186c:	00090513          	mv	a0,s2
    80001870:	00001097          	auipc	ra,0x1
    80001874:	578080e7          	jalr	1400(ra) # 80002de8 <_Z12printIntegerm>
    printString("\n");
    80001878:	00005517          	auipc	a0,0x5
    8000187c:	83850513          	addi	a0,a0,-1992 # 800060b0 <CONSOLE_STATUS+0xa0>
    80001880:	00001097          	auipc	ra,0x1
    80001884:	4f8080e7          	jalr	1272(ra) # 80002d78 <_Z11printStringPKc>
    80001888:	0380006f          	j	800018c0 <_Z11workerBodyDv+0xec>

    for (; i < 16; i++)
    {
        printString("D: i=");
    8000188c:	00004517          	auipc	a0,0x4
    80001890:	7d450513          	addi	a0,a0,2004 # 80006060 <CONSOLE_STATUS+0x50>
    80001894:	00001097          	auipc	ra,0x1
    80001898:	4e4080e7          	jalr	1252(ra) # 80002d78 <_Z11printStringPKc>
        printInteger(i);
    8000189c:	00048513          	mv	a0,s1
    800018a0:	00001097          	auipc	ra,0x1
    800018a4:	548080e7          	jalr	1352(ra) # 80002de8 <_Z12printIntegerm>
        printString("\n");
    800018a8:	00005517          	auipc	a0,0x5
    800018ac:	80850513          	addi	a0,a0,-2040 # 800060b0 <CONSOLE_STATUS+0xa0>
    800018b0:	00001097          	auipc	ra,0x1
    800018b4:	4c8080e7          	jalr	1224(ra) # 80002d78 <_Z11printStringPKc>
    for (; i < 16; i++)
    800018b8:	0014849b          	addiw	s1,s1,1
    800018bc:	0ff4f493          	andi	s1,s1,255
    800018c0:	00f00793          	li	a5,15
    800018c4:	fc97f4e3          	bgeu	a5,s1,8000188c <_Z11workerBodyDv+0xb8>
    }
//    _thread::yield();
    800018c8:	01813083          	ld	ra,24(sp)
    800018cc:	01013403          	ld	s0,16(sp)
    800018d0:	00813483          	ld	s1,8(sp)
    800018d4:	00013903          	ld	s2,0(sp)
    800018d8:	02010113          	addi	sp,sp,32
    800018dc:	00008067          	ret

00000000800018e0 <_ZN9SemaphoreD1Ev>:

Semaphore::Semaphore(unsigned int init) {
    sem_open(&myHandle, init);
}

Semaphore::~Semaphore() {
    800018e0:	ff010113          	addi	sp,sp,-16
    800018e4:	00113423          	sd	ra,8(sp)
    800018e8:	00813023          	sd	s0,0(sp)
    800018ec:	01010413          	addi	s0,sp,16
    800018f0:	00005797          	auipc	a5,0x5
    800018f4:	68078793          	addi	a5,a5,1664 # 80006f70 <_ZTV9Semaphore+0x10>
    800018f8:	00f53023          	sd	a5,0(a0)
    sem_close(myHandle);
    800018fc:	00853503          	ld	a0,8(a0)
    80001900:	00000097          	auipc	ra,0x0
    80001904:	ab8080e7          	jalr	-1352(ra) # 800013b8 <_Z9sem_closeP4_sem>
}
    80001908:	00813083          	ld	ra,8(sp)
    8000190c:	00013403          	ld	s0,0(sp)
    80001910:	01010113          	addi	sp,sp,16
    80001914:	00008067          	ret

0000000080001918 <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    80001918:	fe010113          	addi	sp,sp,-32
    8000191c:	00113c23          	sd	ra,24(sp)
    80001920:	00813823          	sd	s0,16(sp)
    80001924:	00913423          	sd	s1,8(sp)
    80001928:	02010413          	addi	s0,sp,32
    8000192c:	00050493          	mv	s1,a0
}
    80001930:	00000097          	auipc	ra,0x0
    80001934:	fb0080e7          	jalr	-80(ra) # 800018e0 <_ZN9SemaphoreD1Ev>
    80001938:	00048513          	mv	a0,s1
    8000193c:	00001097          	auipc	ra,0x1
    80001940:	a50080e7          	jalr	-1456(ra) # 8000238c <_ZdlPv>
    80001944:	01813083          	ld	ra,24(sp)
    80001948:	01013403          	ld	s0,16(sp)
    8000194c:	00813483          	ld	s1,8(sp)
    80001950:	02010113          	addi	sp,sp,32
    80001954:	00008067          	ret

0000000080001958 <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    80001958:	ff010113          	addi	sp,sp,-16
    8000195c:	00113423          	sd	ra,8(sp)
    80001960:	00813023          	sd	s0,0(sp)
    80001964:	01010413          	addi	s0,sp,16
    80001968:	00005797          	auipc	a5,0x5
    8000196c:	60878793          	addi	a5,a5,1544 # 80006f70 <_ZTV9Semaphore+0x10>
    80001970:	00f53023          	sd	a5,0(a0)
    sem_open(&myHandle, init);
    80001974:	00850513          	addi	a0,a0,8
    80001978:	00000097          	auipc	ra,0x0
    8000197c:	a0c080e7          	jalr	-1524(ra) # 80001384 <_Z8sem_openPP4_semj>
}
    80001980:	00813083          	ld	ra,8(sp)
    80001984:	00013403          	ld	s0,0(sp)
    80001988:	01010113          	addi	sp,sp,16
    8000198c:	00008067          	ret

0000000080001990 <_ZN9Semaphore4waitEv>:

int Semaphore::wait() {
    80001990:	ff010113          	addi	sp,sp,-16
    80001994:	00113423          	sd	ra,8(sp)
    80001998:	00813023          	sd	s0,0(sp)
    8000199c:	01010413          	addi	s0,sp,16
    return sem_wait(myHandle);
    800019a0:	00853503          	ld	a0,8(a0)
    800019a4:	00000097          	auipc	ra,0x0
    800019a8:	a44080e7          	jalr	-1468(ra) # 800013e8 <_Z8sem_waitP4_sem>
}
    800019ac:	00813083          	ld	ra,8(sp)
    800019b0:	00013403          	ld	s0,0(sp)
    800019b4:	01010113          	addi	sp,sp,16
    800019b8:	00008067          	ret

00000000800019bc <_ZN9Semaphore6signalEv>:

int Semaphore::signal() {
    800019bc:	ff010113          	addi	sp,sp,-16
    800019c0:	00113423          	sd	ra,8(sp)
    800019c4:	00813023          	sd	s0,0(sp)
    800019c8:	01010413          	addi	s0,sp,16
    return sem_signal(myHandle);
    800019cc:	00853503          	ld	a0,8(a0)
    800019d0:	00000097          	auipc	ra,0x0
    800019d4:	a48080e7          	jalr	-1464(ra) # 80001418 <_Z10sem_signalP4_sem>
}
    800019d8:	00813083          	ld	ra,8(sp)
    800019dc:	00013403          	ld	s0,0(sp)
    800019e0:	01010113          	addi	sp,sp,16
    800019e4:	00008067          	ret

00000000800019e8 <_ZN6Thread7wrapperEPv>:
}

//kao na vezbama, agumenti se poklapaju za vec postojeci body, a mora da se posalje this u konstruktoru
//jer je wrapper staticka metoda
void Thread::wrapper(void *thread)
{
    800019e8:	ff010113          	addi	sp,sp,-16
    800019ec:	00113423          	sd	ra,8(sp)
    800019f0:	00813023          	sd	s0,0(sp)
    800019f4:	01010413          	addi	s0,sp,16
    ((Thread*)thread)->run();
    800019f8:	00053783          	ld	a5,0(a0)
    800019fc:	0107b783          	ld	a5,16(a5)
    80001a00:	000780e7          	jalr	a5
}
    80001a04:	00813083          	ld	ra,8(sp)
    80001a08:	00013403          	ld	s0,0(sp)
    80001a0c:	01010113          	addi	sp,sp,16
    80001a10:	00008067          	ret

0000000080001a14 <_ZN6ThreadD1Ev>:
Thread::~Thread(){
    80001a14:	ff010113          	addi	sp,sp,-16
    80001a18:	00113423          	sd	ra,8(sp)
    80001a1c:	00813023          	sd	s0,0(sp)
    80001a20:	01010413          	addi	s0,sp,16
    80001a24:	00005797          	auipc	a5,0x5
    80001a28:	57478793          	addi	a5,a5,1396 # 80006f98 <_ZTV6Thread+0x10>
    80001a2c:	00f53023          	sd	a5,0(a0)
    thread_exit();
    80001a30:	00000097          	auipc	ra,0x0
    80001a34:	860080e7          	jalr	-1952(ra) # 80001290 <_Z11thread_exitv>
}
    80001a38:	00813083          	ld	ra,8(sp)
    80001a3c:	00013403          	ld	s0,0(sp)
    80001a40:	01010113          	addi	sp,sp,16
    80001a44:	00008067          	ret

0000000080001a48 <_ZN6ThreadD0Ev>:
Thread::~Thread(){
    80001a48:	fe010113          	addi	sp,sp,-32
    80001a4c:	00113c23          	sd	ra,24(sp)
    80001a50:	00813823          	sd	s0,16(sp)
    80001a54:	00913423          	sd	s1,8(sp)
    80001a58:	02010413          	addi	s0,sp,32
    80001a5c:	00050493          	mv	s1,a0
}
    80001a60:	00000097          	auipc	ra,0x0
    80001a64:	fb4080e7          	jalr	-76(ra) # 80001a14 <_ZN6ThreadD1Ev>
    80001a68:	00048513          	mv	a0,s1
    80001a6c:	00001097          	auipc	ra,0x1
    80001a70:	920080e7          	jalr	-1760(ra) # 8000238c <_ZdlPv>
    80001a74:	01813083          	ld	ra,24(sp)
    80001a78:	01013403          	ld	s0,16(sp)
    80001a7c:	00813483          	ld	s1,8(sp)
    80001a80:	02010113          	addi	sp,sp,32
    80001a84:	00008067          	ret

0000000080001a88 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (*body)(void *), void *arg) {
    80001a88:	ff010113          	addi	sp,sp,-16
    80001a8c:	00113423          	sd	ra,8(sp)
    80001a90:	00813023          	sd	s0,0(sp)
    80001a94:	01010413          	addi	s0,sp,16
    80001a98:	00005797          	auipc	a5,0x5
    80001a9c:	50078793          	addi	a5,a5,1280 # 80006f98 <_ZTV6Thread+0x10>
    80001aa0:	00f53023          	sd	a5,0(a0)
    thread_initialization(&myHandle, body, arg);
    80001aa4:	00850513          	addi	a0,a0,8
    80001aa8:	00000097          	auipc	ra,0x0
    80001aac:	838080e7          	jalr	-1992(ra) # 800012e0 <_Z21thread_initializationPP7_threadPFvPvES2_>
}
    80001ab0:	00813083          	ld	ra,8(sp)
    80001ab4:	00013403          	ld	s0,0(sp)
    80001ab8:	01010113          	addi	sp,sp,16
    80001abc:	00008067          	ret

0000000080001ac0 <_ZN6ThreadC1Ev>:
Thread::Thread() {
    80001ac0:	ff010113          	addi	sp,sp,-16
    80001ac4:	00113423          	sd	ra,8(sp)
    80001ac8:	00813023          	sd	s0,0(sp)
    80001acc:	01010413          	addi	s0,sp,16
    80001ad0:	00005797          	auipc	a5,0x5
    80001ad4:	4c878793          	addi	a5,a5,1224 # 80006f98 <_ZTV6Thread+0x10>
    80001ad8:	00f53023          	sd	a5,0(a0)
    thread_initialization(&myHandle, wrapper, this);
    80001adc:	00050613          	mv	a2,a0
    80001ae0:	00000597          	auipc	a1,0x0
    80001ae4:	f0858593          	addi	a1,a1,-248 # 800019e8 <_ZN6Thread7wrapperEPv>
    80001ae8:	00850513          	addi	a0,a0,8
    80001aec:	fffff097          	auipc	ra,0xfffff
    80001af0:	7f4080e7          	jalr	2036(ra) # 800012e0 <_Z21thread_initializationPP7_threadPFvPvES2_>
}
    80001af4:	00813083          	ld	ra,8(sp)
    80001af8:	00013403          	ld	s0,0(sp)
    80001afc:	01010113          	addi	sp,sp,16
    80001b00:	00008067          	ret

0000000080001b04 <_ZN6Thread5startEv>:
int Thread::start(){
    80001b04:	ff010113          	addi	sp,sp,-16
    80001b08:	00113423          	sd	ra,8(sp)
    80001b0c:	00813023          	sd	s0,0(sp)
    80001b10:	01010413          	addi	s0,sp,16
    thread_start(myHandle);
    80001b14:	00853503          	ld	a0,8(a0)
    80001b18:	00000097          	auipc	ra,0x0
    80001b1c:	844080e7          	jalr	-1980(ra) # 8000135c <_Z12thread_startP7_thread>
}
    80001b20:	00000513          	li	a0,0
    80001b24:	00813083          	ld	ra,8(sp)
    80001b28:	00013403          	ld	s0,0(sp)
    80001b2c:	01010113          	addi	sp,sp,16
    80001b30:	00008067          	ret

0000000080001b34 <_ZN6Thread8dispatchEv>:
void Thread::dispatch(){
    80001b34:	ff010113          	addi	sp,sp,-16
    80001b38:	00113423          	sd	ra,8(sp)
    80001b3c:	00813023          	sd	s0,0(sp)
    80001b40:	01010413          	addi	s0,sp,16
    thread_dispatch();
    80001b44:	fffff097          	auipc	ra,0xfffff
    80001b48:	778080e7          	jalr	1912(ra) # 800012bc <_Z15thread_dispatchv>
}
    80001b4c:	00813083          	ld	ra,8(sp)
    80001b50:	00013403          	ld	s0,0(sp)
    80001b54:	01010113          	addi	sp,sp,16
    80001b58:	00008067          	ret

0000000080001b5c <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t t){
    80001b5c:	ff010113          	addi	sp,sp,-16
    80001b60:	00113423          	sd	ra,8(sp)
    80001b64:	00813023          	sd	s0,0(sp)
    80001b68:	01010413          	addi	s0,sp,16
    return time_sleep(t);
    80001b6c:	00000097          	auipc	ra,0x0
    80001b70:	8dc080e7          	jalr	-1828(ra) # 80001448 <_Z10time_sleepm>
}
    80001b74:	00813083          	ld	ra,8(sp)
    80001b78:	00013403          	ld	s0,0(sp)
    80001b7c:	01010113          	addi	sp,sp,16
    80001b80:	00008067          	ret

0000000080001b84 <_ZN6Thread3runEv>:
    static void dispatch ();
    static int sleep (time_t);
    static void wrapper(void*);
protected:
    Thread ();
    virtual void run () {}
    80001b84:	ff010113          	addi	sp,sp,-16
    80001b88:	00813423          	sd	s0,8(sp)
    80001b8c:	01010413          	addi	s0,sp,16
    80001b90:	00813403          	ld	s0,8(sp)
    80001b94:	01010113          	addi	sp,sp,16
    80001b98:	00008067          	ret

0000000080001b9c <_ZN7Console4getcEv>:
// Created by os on 9/14/22.
//

#include "../h/syscall_cpp.hpp"

char Console::getc(){
    80001b9c:	ff010113          	addi	sp,sp,-16
    80001ba0:	00113423          	sd	ra,8(sp)
    80001ba4:	00813023          	sd	s0,0(sp)
    80001ba8:	01010413          	addi	s0,sp,16
    return ::getc();
    80001bac:	00000097          	auipc	ra,0x0
    80001bb0:	8cc080e7          	jalr	-1844(ra) # 80001478 <_Z4getcv>
}
    80001bb4:	00813083          	ld	ra,8(sp)
    80001bb8:	00013403          	ld	s0,0(sp)
    80001bbc:	01010113          	addi	sp,sp,16
    80001bc0:	00008067          	ret

0000000080001bc4 <_ZN7Console4putcEc>:
void Console::putc(char c){
    80001bc4:	ff010113          	addi	sp,sp,-16
    80001bc8:	00113423          	sd	ra,8(sp)
    80001bcc:	00813023          	sd	s0,0(sp)
    80001bd0:	01010413          	addi	s0,sp,16
    return ::putc(c);
    80001bd4:	00000097          	auipc	ra,0x0
    80001bd8:	8d0080e7          	jalr	-1840(ra) # 800014a4 <_Z4putcc>
    80001bdc:	00813083          	ld	ra,8(sp)
    80001be0:	00013403          	ld	s0,0(sp)
    80001be4:	01010113          	addi	sp,sp,16
    80001be8:	00008067          	ret

0000000080001bec <main>:
#include "../h/riscv.hpp"
#include "../h/syscall_c.h"


int main()
{
    80001bec:	fb010113          	addi	sp,sp,-80
    80001bf0:	04113423          	sd	ra,72(sp)
    80001bf4:	04813023          	sd	s0,64(sp)
    80001bf8:	02913c23          	sd	s1,56(sp)
    80001bfc:	03213823          	sd	s2,48(sp)
    80001c00:	05010413          	addi	s0,sp,80
    Riscv::w_stvec((uint64) &Riscv::supervisorTrap);
    80001c04:	00005797          	auipc	a5,0x5
    80001c08:	3cc7b783          	ld	a5,972(a5) # 80006fd0 <_GLOBAL_OFFSET_TABLE_+0x20>
    return stvec;
}

inline void Riscv::w_stvec(uint64 stvec)
{
    __asm__ volatile ("csrw stvec, %[stvec]" : : [stvec] "r"(stvec));
    80001c0c:	10579073          	csrw	stvec,a5
    _thread *threads[5];

    threads[0] = _thread::createThread(nullptr);
    80001c10:	00000513          	li	a0,0
    80001c14:	00000097          	auipc	ra,0x0
    80001c18:	184080e7          	jalr	388(ra) # 80001d98 <_ZN7_thread12createThreadEPFvPvE>
    80001c1c:	faa43c23          	sd	a0,-72(s0)
    _thread::running = threads[0];
    80001c20:	00005797          	auipc	a5,0x5
    80001c24:	3a87b783          	ld	a5,936(a5) # 80006fc8 <_GLOBAL_OFFSET_TABLE_+0x18>
    80001c28:	00a7b023          	sd	a0,0(a5)
    if(Riscv::buff2.itemAvailable == nullptr){
    80001c2c:	00005797          	auipc	a5,0x5
    80001c30:	3dc7b783          	ld	a5,988(a5) # 80007008 <_GLOBAL_OFFSET_TABLE_+0x58>
    80001c34:	0007b783          	ld	a5,0(a5)
    80001c38:	04078e63          	beqz	a5,80001c94 <main+0xa8>
        _sem::createSem(&Riscv::buff2.itemAvailable, 0);
    }
    if(Riscv::buff1.itemAvailable == nullptr){
    80001c3c:	00005797          	auipc	a5,0x5
    80001c40:	39c7b783          	ld	a5,924(a5) # 80006fd8 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001c44:	0007b783          	ld	a5,0(a5)
    80001c48:	06078263          	beqz	a5,80001cac <main+0xc0>
        _sem::createSem(&Riscv::buff1.itemAvailable, 0);
    }
//    thread_create(&threads[1], &workerBodyA, nullptr);
//    threads[1] = _thread::createThread(workerBodyA);
    thread_create(&threads[1], workerBodyA, nullptr);
    80001c4c:	00000613          	li	a2,0
    80001c50:	00005597          	auipc	a1,0x5
    80001c54:	3c05b583          	ld	a1,960(a1) # 80007010 <_GLOBAL_OFFSET_TABLE_+0x60>
    80001c58:	fc040513          	addi	a0,s0,-64
    80001c5c:	fffff097          	auipc	ra,0xfffff
    80001c60:	59c080e7          	jalr	1436(ra) # 800011f8 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadA created\n");
    80001c64:	00004517          	auipc	a0,0x4
    80001c68:	42450513          	addi	a0,a0,1060 # 80006088 <CONSOLE_STATUS+0x78>
    80001c6c:	00001097          	auipc	ra,0x1
    80001c70:	10c080e7          	jalr	268(ra) # 80002d78 <_Z11printStringPKc>
    threads[2] = _thread::createThread(&_thread::consoleWrite);
    80001c74:	00005517          	auipc	a0,0x5
    80001c78:	36c53503          	ld	a0,876(a0) # 80006fe0 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001c7c:	00000097          	auipc	ra,0x0
    80001c80:	11c080e7          	jalr	284(ra) # 80001d98 <_ZN7_thread12createThreadEPFvPvE>
    80001c84:	fca43423          	sd	a0,-56(s0)
    __asm__ volatile ("csrw sip, %[sip]" : : [sip] "r"(sip));
}

inline void Riscv::ms_sstatus(uint64 mask)
{
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    80001c88:	00200793          	li	a5,2
    80001c8c:	1007a073          	csrs	sstatus,a5
}
    80001c90:	03c0006f          	j	80001ccc <main+0xe0>
        _sem::createSem(&Riscv::buff2.itemAvailable, 0);
    80001c94:	00000593          	li	a1,0
    80001c98:	00005517          	auipc	a0,0x5
    80001c9c:	37053503          	ld	a0,880(a0) # 80007008 <_GLOBAL_OFFSET_TABLE_+0x58>
    80001ca0:	00001097          	auipc	ra,0x1
    80001ca4:	c28080e7          	jalr	-984(ra) # 800028c8 <_ZN4_sem9createSemEPPS_m>
    80001ca8:	f95ff06f          	j	80001c3c <main+0x50>
        _sem::createSem(&Riscv::buff1.itemAvailable, 0);
    80001cac:	00000593          	li	a1,0
    80001cb0:	00005517          	auipc	a0,0x5
    80001cb4:	32853503          	ld	a0,808(a0) # 80006fd8 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001cb8:	00001097          	auipc	ra,0x1
    80001cbc:	c10080e7          	jalr	-1008(ra) # 800028c8 <_ZN4_sem9createSemEPPS_m>
    80001cc0:	f8dff06f          	j	80001c4c <main+0x60>
//    {
//        _thread::yield();
//    }
    while (!(threads[0]->isFinished() && threads[1]->isFinished() && threads[2]->isFinished()))
    {
        _thread::yield();
    80001cc4:	00000097          	auipc	ra,0x0
    80001cc8:	2bc080e7          	jalr	700(ra) # 80001f80 <_ZN7_thread5yieldEv>
    while (!(threads[0]->isFinished() && threads[1]->isFinished() && threads[2]->isFinished()))
    80001ccc:	fb843783          	ld	a5,-72(s0)
class _thread
{
public:
    ~_thread() { delete[] stack; }

    bool isFinished() const { return finished; }
    80001cd0:	0287c783          	lbu	a5,40(a5)
    80001cd4:	fe0788e3          	beqz	a5,80001cc4 <main+0xd8>
    80001cd8:	fc043783          	ld	a5,-64(s0)
    80001cdc:	0287c783          	lbu	a5,40(a5)
    80001ce0:	fe0782e3          	beqz	a5,80001cc4 <main+0xd8>
    80001ce4:	fc843783          	ld	a5,-56(s0)
    80001ce8:	0287c783          	lbu	a5,40(a5)
    80001cec:	fc078ce3          	beqz	a5,80001cc4 <main+0xd8>
    }
    printString("test");
    80001cf0:	00004517          	auipc	a0,0x4
    80001cf4:	3b050513          	addi	a0,a0,944 # 800060a0 <CONSOLE_STATUS+0x90>
    80001cf8:	00001097          	auipc	ra,0x1
    80001cfc:	080080e7          	jalr	128(ra) # 80002d78 <_Z11printStringPKc>
    //DODATI DELETE I NEW!!!
    for (auto &thread: threads)
    80001d00:	fb840493          	addi	s1,s0,-72
    80001d04:	0140006f          	j	80001d18 <main+0x12c>
    {
        delete thread;
    80001d08:	00090513          	mv	a0,s2
    80001d0c:	00000097          	auipc	ra,0x0
    80001d10:	680080e7          	jalr	1664(ra) # 8000238c <_ZdlPv>
    for (auto &thread: threads)
    80001d14:	00848493          	addi	s1,s1,8
    80001d18:	fe040793          	addi	a5,s0,-32
    80001d1c:	02f48063          	beq	s1,a5,80001d3c <main+0x150>
        delete thread;
    80001d20:	0004b903          	ld	s2,0(s1)
    80001d24:	fe0908e3          	beqz	s2,80001d14 <main+0x128>
    ~_thread() { delete[] stack; }
    80001d28:	00893503          	ld	a0,8(s2)
    80001d2c:	fc050ee3          	beqz	a0,80001d08 <main+0x11c>
    80001d30:	00000097          	auipc	ra,0x0
    80001d34:	684080e7          	jalr	1668(ra) # 800023b4 <_ZdaPv>
    80001d38:	fd1ff06f          	j	80001d08 <main+0x11c>
    }
    printString("Finished\n");
    80001d3c:	00004517          	auipc	a0,0x4
    80001d40:	36c50513          	addi	a0,a0,876 # 800060a8 <CONSOLE_STATUS+0x98>
    80001d44:	00001097          	auipc	ra,0x1
    80001d48:	034080e7          	jalr	52(ra) # 80002d78 <_Z11printStringPKc>

    return 0;
}
    80001d4c:	00000513          	li	a0,0
    80001d50:	04813083          	ld	ra,72(sp)
    80001d54:	04013403          	ld	s0,64(sp)
    80001d58:	03813483          	ld	s1,56(sp)
    80001d5c:	03013903          	ld	s2,48(sp)
    80001d60:	05010113          	addi	sp,sp,80
    80001d64:	00008067          	ret

0000000080001d68 <_ZN7_thread8setSleepEv>:

_thread *_thread::running = nullptr;

uint64 _thread::timeSliceCounter = 0;

void _thread::setSleep(){
    80001d68:	ff010113          	addi	sp,sp,-16
    80001d6c:	00813423          	sd	s0,8(sp)
    80001d70:	01010413          	addi	s0,sp,16
    if(!_thread::sleeping)
    80001d74:	03954783          	lbu	a5,57(a0)
    80001d78:	00079c63          	bnez	a5,80001d90 <_ZN7_thread8setSleepEv+0x28>
        _thread::sleeping = true;
    80001d7c:	00100793          	li	a5,1
    80001d80:	02f50ca3          	sb	a5,57(a0)
    else
        _thread::sleeping = false;
}
    80001d84:	00813403          	ld	s0,8(sp)
    80001d88:	01010113          	addi	sp,sp,16
    80001d8c:	00008067          	ret
        _thread::sleeping = false;
    80001d90:	02050ca3          	sb	zero,57(a0)
}
    80001d94:	ff1ff06f          	j	80001d84 <_ZN7_thread8setSleepEv+0x1c>

0000000080001d98 <_ZN7_thread12createThreadEPFvPvE>:

//mickov kod za kreiranje niti
_thread *_thread::createThread(Body body)
{
    80001d98:	fe010113          	addi	sp,sp,-32
    80001d9c:	00113c23          	sd	ra,24(sp)
    80001da0:	00813823          	sd	s0,16(sp)
    80001da4:	00913423          	sd	s1,8(sp)
    80001da8:	01213023          	sd	s2,0(sp)
    80001dac:	02010413          	addi	s0,sp,32
    80001db0:	00050913          	mv	s2,a0
    return new _thread(body, TIME_SLICE);
    80001db4:	04800513          	li	a0,72
    80001db8:	00000097          	auipc	ra,0x0
    80001dbc:	584080e7          	jalr	1412(ra) # 8000233c <_Znwm>
    80001dc0:	00050493          	mv	s1,a0
            stack(body != nullptr ? new uint64[STACK_SIZE] : nullptr),
            context({(uint64) &threadWrapper,
                     stack != nullptr ? (uint64) &stack[STACK_SIZE] : 0
                    }),
            timeSlice(timeSlice),
            finished(false)
    80001dc4:	01253023          	sd	s2,0(a0)
            stack(body != nullptr ? new uint64[STACK_SIZE] : nullptr),
    80001dc8:	00090a63          	beqz	s2,80001ddc <_ZN7_thread12createThreadEPFvPvE+0x44>
    80001dcc:	00002537          	lui	a0,0x2
    80001dd0:	00000097          	auipc	ra,0x0
    80001dd4:	594080e7          	jalr	1428(ra) # 80002364 <_Znam>
    80001dd8:	0080006f          	j	80001de0 <_ZN7_thread12createThreadEPFvPvE+0x48>
    80001ddc:	00000513          	li	a0,0
            finished(false)
    80001de0:	00a4b423          	sd	a0,8(s1)
    80001de4:	00000797          	auipc	a5,0x0
    80001de8:	1b878793          	addi	a5,a5,440 # 80001f9c <_ZN7_thread13threadWrapperEv>
    80001dec:	00f4b823          	sd	a5,16(s1)
                     stack != nullptr ? (uint64) &stack[STACK_SIZE] : 0
    80001df0:	04050063          	beqz	a0,80001e30 <_ZN7_thread12createThreadEPFvPvE+0x98>
    80001df4:	000027b7          	lui	a5,0x2
    80001df8:	00f507b3          	add	a5,a0,a5
            finished(false)
    80001dfc:	00f4bc23          	sd	a5,24(s1)
    80001e00:	00200793          	li	a5,2
    80001e04:	02f4b023          	sd	a5,32(s1)
    80001e08:	02048423          	sb	zero,40(s1)
    80001e0c:	0204b823          	sd	zero,48(s1)
    80001e10:	02048c23          	sb	zero,56(s1)
    80001e14:	02048ca3          	sb	zero,57(s1)
    80001e18:	0404b023          	sd	zero,64(s1)
    {
        if (body != nullptr) { Scheduler::put(this);}
    80001e1c:	02090c63          	beqz	s2,80001e54 <_ZN7_thread12createThreadEPFvPvE+0xbc>
    80001e20:	00048513          	mv	a0,s1
    80001e24:	00001097          	auipc	ra,0x1
    80001e28:	df8080e7          	jalr	-520(ra) # 80002c1c <_ZN9Scheduler3putEP7_thread>
    80001e2c:	0280006f          	j	80001e54 <_ZN7_thread12createThreadEPFvPvE+0xbc>
                     stack != nullptr ? (uint64) &stack[STACK_SIZE] : 0
    80001e30:	00000793          	li	a5,0
    80001e34:	fc9ff06f          	j	80001dfc <_ZN7_thread12createThreadEPFvPvE+0x64>
    80001e38:	00050913          	mv	s2,a0
    80001e3c:	00048513          	mv	a0,s1
    80001e40:	00000097          	auipc	ra,0x0
    80001e44:	54c080e7          	jalr	1356(ra) # 8000238c <_ZdlPv>
    80001e48:	00090513          	mv	a0,s2
    80001e4c:	00006097          	auipc	ra,0x6
    80001e50:	57c080e7          	jalr	1404(ra) # 800083c8 <_Unwind_Resume>
}
    80001e54:	00048513          	mv	a0,s1
    80001e58:	01813083          	ld	ra,24(sp)
    80001e5c:	01013403          	ld	s0,16(sp)
    80001e60:	00813483          	ld	s1,8(sp)
    80001e64:	00013903          	ld	s2,0(sp)
    80001e68:	02010113          	addi	sp,sp,32
    80001e6c:	00008067          	ret

0000000080001e70 <_ZN7_thread12createThreadEPPS_PFvPvES2_S2_b>:
//poziv za projekat
int _thread::createThread(thread_t* handle, Body body, void *args, void *stack, bool t)
{
    80001e70:	fc010113          	addi	sp,sp,-64
    80001e74:	02113c23          	sd	ra,56(sp)
    80001e78:	02813823          	sd	s0,48(sp)
    80001e7c:	02913423          	sd	s1,40(sp)
    80001e80:	03213023          	sd	s2,32(sp)
    80001e84:	01313c23          	sd	s3,24(sp)
    80001e88:	01413823          	sd	s4,16(sp)
    80001e8c:	01513423          	sd	s5,8(sp)
    80001e90:	01613023          	sd	s6,0(sp)
    80001e94:	04010413          	addi	s0,sp,64
    80001e98:	00050a13          	mv	s4,a0
    80001e9c:	00058993          	mv	s3,a1
    80001ea0:	00060a93          	mv	s5,a2
    80001ea4:	00068913          	mv	s2,a3
    80001ea8:	00070b13          	mv	s6,a4
    *handle = new _thread(body, args, stack, t);
    80001eac:	04800513          	li	a0,72
    80001eb0:	00000097          	auipc	ra,0x0
    80001eb4:	48c080e7          	jalr	1164(ra) # 8000233c <_Znwm>
    80001eb8:	00050493          	mv	s1,a0
            context({(uint64) &threadWrapper,
                     stack != nullptr ?  (uint64) &stack[DEFAULT_STACK_SIZE] : 0
                    }),
            timeSlice(DEFAULT_TIME_SLICE),
            finished(false),
            args(args)
    80001ebc:	01353023          	sd	s3,0(a0) # 2000 <_entry-0x7fffe000>
            stack(body != nullptr ? (uint64*)stackk : nullptr),
    80001ec0:	06098e63          	beqz	s3,80001f3c <_ZN7_thread12createThreadEPPS_PFvPvES2_S2_b+0xcc>
            args(args)
    80001ec4:	0124b423          	sd	s2,8(s1)
    80001ec8:	00000797          	auipc	a5,0x0
    80001ecc:	0d478793          	addi	a5,a5,212 # 80001f9c <_ZN7_thread13threadWrapperEv>
    80001ed0:	00f4b823          	sd	a5,16(s1)
                     stack != nullptr ?  (uint64) &stack[DEFAULT_STACK_SIZE] : 0
    80001ed4:	06090863          	beqz	s2,80001f44 <_ZN7_thread12createThreadEPPS_PFvPvES2_S2_b+0xd4>
    80001ed8:	000086b7          	lui	a3,0x8
    80001edc:	00d90933          	add	s2,s2,a3
            args(args)
    80001ee0:	0124bc23          	sd	s2,24(s1)
    80001ee4:	00200793          	li	a5,2
    80001ee8:	02f4b023          	sd	a5,32(s1)
    80001eec:	02048423          	sb	zero,40(s1)
    80001ef0:	0354b823          	sd	s5,48(s1)
    80001ef4:	02048c23          	sb	zero,56(s1)
    80001ef8:	02048ca3          	sb	zero,57(s1)
    80001efc:	0404b023          	sd	zero,64(s1)
    {
        if (body != nullptr) {
    80001f00:	00098463          	beqz	s3,80001f08 <_ZN7_thread12createThreadEPPS_PFvPvES2_S2_b+0x98>
            if(t)
    80001f04:	040b1463          	bnez	s6,80001f4c <_ZN7_thread12createThreadEPPS_PFvPvES2_S2_b+0xdc>
    80001f08:	009a3023          	sd	s1,0(s4)
    if(*handle != nullptr)
    80001f0c:	04048863          	beqz	s1,80001f5c <_ZN7_thread12createThreadEPPS_PFvPvES2_S2_b+0xec>
        return 0;
    80001f10:	00000513          	li	a0,0
    else
        return -2;
}
    80001f14:	03813083          	ld	ra,56(sp)
    80001f18:	03013403          	ld	s0,48(sp)
    80001f1c:	02813483          	ld	s1,40(sp)
    80001f20:	02013903          	ld	s2,32(sp)
    80001f24:	01813983          	ld	s3,24(sp)
    80001f28:	01013a03          	ld	s4,16(sp)
    80001f2c:	00813a83          	ld	s5,8(sp)
    80001f30:	00013b03          	ld	s6,0(sp)
    80001f34:	04010113          	addi	sp,sp,64
    80001f38:	00008067          	ret
            stack(body != nullptr ? (uint64*)stackk : nullptr),
    80001f3c:	00000913          	li	s2,0
    80001f40:	f85ff06f          	j	80001ec4 <_ZN7_thread12createThreadEPPS_PFvPvES2_S2_b+0x54>
                     stack != nullptr ?  (uint64) &stack[DEFAULT_STACK_SIZE] : 0
    80001f44:	00000913          	li	s2,0
    80001f48:	f99ff06f          	j	80001ee0 <_ZN7_thread12createThreadEPPS_PFvPvES2_S2_b+0x70>
                Scheduler::put(this);
    80001f4c:	00048513          	mv	a0,s1
    80001f50:	00001097          	auipc	ra,0x1
    80001f54:	ccc080e7          	jalr	-820(ra) # 80002c1c <_ZN9Scheduler3putEP7_thread>
    80001f58:	fb1ff06f          	j	80001f08 <_ZN7_thread12createThreadEPPS_PFvPvES2_S2_b+0x98>
        return -2;
    80001f5c:	ffe00513          	li	a0,-2
    80001f60:	fb5ff06f          	j	80001f14 <_ZN7_thread12createThreadEPPS_PFvPvES2_S2_b+0xa4>
    80001f64:	00050913          	mv	s2,a0
    *handle = new _thread(body, args, stack, t);
    80001f68:	00048513          	mv	a0,s1
    80001f6c:	00000097          	auipc	ra,0x0
    80001f70:	420080e7          	jalr	1056(ra) # 8000238c <_ZdlPv>
    80001f74:	00090513          	mv	a0,s2
    80001f78:	00006097          	auipc	ra,0x6
    80001f7c:	450080e7          	jalr	1104(ra) # 800083c8 <_Unwind_Resume>

0000000080001f80 <_ZN7_thread5yieldEv>:

void _thread::yield()
{
    80001f80:	ff010113          	addi	sp,sp,-16
    80001f84:	00813423          	sd	s0,8(sp)
    80001f88:	01010413          	addi	s0,sp,16
    __asm__ volatile ("ecall");
    80001f8c:	00000073          	ecall
}
    80001f90:	00813403          	ld	s0,8(sp)
    80001f94:	01010113          	addi	sp,sp,16
    80001f98:	00008067          	ret

0000000080001f9c <_ZN7_thread13threadWrapperEv>:

    _thread::contextSwitch(&old->context, &running->context);
}

void _thread::threadWrapper()
{
    80001f9c:	fe010113          	addi	sp,sp,-32
    80001fa0:	00113c23          	sd	ra,24(sp)
    80001fa4:	00813823          	sd	s0,16(sp)
    80001fa8:	00913423          	sd	s1,8(sp)
    80001fac:	02010413          	addi	s0,sp,32
    Riscv::popSppSpie();
    80001fb0:	00000097          	auipc	ra,0x0
    80001fb4:	4c0080e7          	jalr	1216(ra) # 80002470 <_ZN5Riscv10popSppSpieEv>
    running->body(_thread::running->args);
    80001fb8:	00005497          	auipc	s1,0x5
    80001fbc:	0b848493          	addi	s1,s1,184 # 80007070 <_ZN7_thread7runningE>
    80001fc0:	0004b783          	ld	a5,0(s1)
    80001fc4:	0007b703          	ld	a4,0(a5)
    80001fc8:	0307b503          	ld	a0,48(a5)
    80001fcc:	000700e7          	jalr	a4
    running->setFinished(true);
    80001fd0:	0004b783          	ld	a5,0(s1)
    void setFinished(bool value) { finished = value; }
    80001fd4:	00100713          	li	a4,1
    80001fd8:	02e78423          	sb	a4,40(a5)
    printString("gotova nit");
    80001fdc:	00004517          	auipc	a0,0x4
    80001fe0:	0dc50513          	addi	a0,a0,220 # 800060b8 <CONSOLE_STATUS+0xa8>
    80001fe4:	00001097          	auipc	ra,0x1
    80001fe8:	d94080e7          	jalr	-620(ra) # 80002d78 <_Z11printStringPKc>
    _thread::yield();
    80001fec:	00000097          	auipc	ra,0x0
    80001ff0:	f94080e7          	jalr	-108(ra) # 80001f80 <_ZN7_thread5yieldEv>
}
    80001ff4:	01813083          	ld	ra,24(sp)
    80001ff8:	01013403          	ld	s0,16(sp)
    80001ffc:	00813483          	ld	s1,8(sp)
    80002000:	02010113          	addi	sp,sp,32
    80002004:	00008067          	ret

0000000080002008 <_ZN7_thread8dispatchEv>:
{
    80002008:	fe010113          	addi	sp,sp,-32
    8000200c:	00113c23          	sd	ra,24(sp)
    80002010:	00813823          	sd	s0,16(sp)
    80002014:	00913423          	sd	s1,8(sp)
    80002018:	01213023          	sd	s2,0(sp)
    8000201c:	02010413          	addi	s0,sp,32
    _thread *old = running;
    80002020:	00005497          	auipc	s1,0x5
    80002024:	0504b483          	ld	s1,80(s1) # 80007070 <_ZN7_thread7runningE>
    bool isFinished() const { return finished; }
    80002028:	0284c783          	lbu	a5,40(s1)
    if (!old->isFinished() && !old->blocked && !old->sleeping) {
    8000202c:	00079a63          	bnez	a5,80002040 <_ZN7_thread8dispatchEv+0x38>
    80002030:	0384c703          	lbu	a4,56(s1)
    80002034:	00071663          	bnez	a4,80002040 <_ZN7_thread8dispatchEv+0x38>
    80002038:	0394c703          	lbu	a4,57(s1)
    8000203c:	04070c63          	beqz	a4,80002094 <_ZN7_thread8dispatchEv+0x8c>
    else if(!old->isFinished() && old->blocked && !old->sleeping){
    80002040:	06079063          	bnez	a5,800020a0 <_ZN7_thread8dispatchEv+0x98>
    80002044:	0384c783          	lbu	a5,56(s1)
    80002048:	04078c63          	beqz	a5,800020a0 <_ZN7_thread8dispatchEv+0x98>
    8000204c:	0394c783          	lbu	a5,57(s1)
    80002050:	04079863          	bnez	a5,800020a0 <_ZN7_thread8dispatchEv+0x98>
        if(old->blockedBy != nullptr){
    80002054:	0404b503          	ld	a0,64(s1)
    80002058:	04050463          	beqz	a0,800020a0 <_ZN7_thread8dispatchEv+0x98>
            old->blockedBy->blockedList().addLast(old);
    8000205c:	00001097          	auipc	ra,0x1
    80002060:	af8080e7          	jalr	-1288(ra) # 80002b54 <_ZN4_sem11blockedListEv>
    80002064:	00050913          	mv	s2,a0
        if (!tail) { tail = head; }
    }

    void addLast(T *data)
    {
        Elem *elem = new Elem(data, 0);
    80002068:	01800513          	li	a0,24
    8000206c:	00000097          	auipc	ra,0x0
    80002070:	2d0080e7          	jalr	720(ra) # 8000233c <_Znwm>
        Elem(T *data, Elem *next, int sleepTime = 0) : data(data), next(next), sleepTime(sleepTime) {}
    80002074:	00953023          	sd	s1,0(a0)
    80002078:	00053423          	sd	zero,8(a0)
    8000207c:	00052823          	sw	zero,16(a0)
        if (tail)
    80002080:	00893783          	ld	a5,8(s2)
    80002084:	04078a63          	beqz	a5,800020d8 <_ZN7_thread8dispatchEv+0xd0>
        {
            tail->next = elem;
    80002088:	00a7b423          	sd	a0,8(a5)
            tail = elem;
    8000208c:	00a93423          	sd	a0,8(s2)
    80002090:	0100006f          	j	800020a0 <_ZN7_thread8dispatchEv+0x98>
        Scheduler::put(old);
    80002094:	00048513          	mv	a0,s1
    80002098:	00001097          	auipc	ra,0x1
    8000209c:	b84080e7          	jalr	-1148(ra) # 80002c1c <_ZN9Scheduler3putEP7_thread>
    running = Scheduler::get();
    800020a0:	00001097          	auipc	ra,0x1
    800020a4:	b14080e7          	jalr	-1260(ra) # 80002bb4 <_ZN9Scheduler3getEv>
    800020a8:	00005797          	auipc	a5,0x5
    800020ac:	fca7b423          	sd	a0,-56(a5) # 80007070 <_ZN7_thread7runningE>
    _thread::contextSwitch(&old->context, &running->context);
    800020b0:	01050593          	addi	a1,a0,16
    800020b4:	01048513          	addi	a0,s1,16
    800020b8:	fffff097          	auipc	ra,0xfffff
    800020bc:	078080e7          	jalr	120(ra) # 80001130 <_ZN7_thread13contextSwitchEPNS_7ContextES1_>
}
    800020c0:	01813083          	ld	ra,24(sp)
    800020c4:	01013403          	ld	s0,16(sp)
    800020c8:	00813483          	ld	s1,8(sp)
    800020cc:	00013903          	ld	s2,0(sp)
    800020d0:	02010113          	addi	sp,sp,32
    800020d4:	00008067          	ret
        } else
        {
            head = tail = elem;
    800020d8:	00a93423          	sd	a0,8(s2)
    800020dc:	00a93023          	sd	a0,0(s2)
        }
    }
    800020e0:	fc1ff06f          	j	800020a0 <_ZN7_thread8dispatchEv+0x98>

00000000800020e4 <_ZN7_thread10threadStopEv>:

int _thread::threadStop(){
    800020e4:	ff010113          	addi	sp,sp,-16
    800020e8:	00113423          	sd	ra,8(sp)
    800020ec:	00813023          	sd	s0,0(sp)
    800020f0:	01010413          	addi	s0,sp,16
    void setFinished(bool value) { finished = value; }
    800020f4:	00005797          	auipc	a5,0x5
    800020f8:	f7c7b783          	ld	a5,-132(a5) # 80007070 <_ZN7_thread7runningE>
    800020fc:	00100713          	li	a4,1
    80002100:	02e78423          	sb	a4,40(a5)
    running->setFinished(true);
    dispatch();
    80002104:	00000097          	auipc	ra,0x0
    80002108:	f04080e7          	jalr	-252(ra) # 80002008 <_ZN7_thread8dispatchEv>
//        return 0;
//    }
//    delete []running->stack;
//    nzm da se brise nit ili se samo zaustavlja
return 0;
}
    8000210c:	00000513          	li	a0,0
    80002110:	00813083          	ld	ra,8(sp)
    80002114:	00013403          	ld	s0,0(sp)
    80002118:	01010113          	addi	sp,sp,16
    8000211c:	00008067          	ret

0000000080002120 <_ZN7_thread5dblckEv>:

void _thread::dblck(){
    80002120:	ff010113          	addi	sp,sp,-16
    80002124:	00813423          	sd	s0,8(sp)
    80002128:	01010413          	addi	s0,sp,16
    _thread::blocked = false;
    8000212c:	02050c23          	sb	zero,56(a0)
    _thread::blockedBy = nullptr;
    80002130:	04053023          	sd	zero,64(a0)
}
    80002134:	00813403          	ld	s0,8(sp)
    80002138:	01010113          	addi	sp,sp,16
    8000213c:	00008067          	ret

0000000080002140 <_ZN7_thread5sleepEm>:


int _thread::sleep(time_t time) {
    80002140:	fe010113          	addi	sp,sp,-32
    80002144:	00113c23          	sd	ra,24(sp)
    80002148:	00813823          	sd	s0,16(sp)
    8000214c:	00913423          	sd	s1,8(sp)
    80002150:	01213023          	sd	s2,0(sp)
    80002154:	02010413          	addi	s0,sp,32
    80002158:	00050493          	mv	s1,a0
    running->setSleep();
    8000215c:	00005917          	auipc	s2,0x5
    80002160:	f1490913          	addi	s2,s2,-236 # 80007070 <_ZN7_thread7runningE>
    80002164:	00093503          	ld	a0,0(s2)
    80002168:	00000097          	auipc	ra,0x0
    8000216c:	c00080e7          	jalr	-1024(ra) # 80001d68 <_ZN7_thread8setSleepEv>
    Riscv::sleepingThreads.addSleepingThread(running, time);
    80002170:	00093903          	ld	s2,0(s2)
    80002174:	0004849b          	sext.w	s1,s1
        if (!tail) { return 0; }
        return tail->data;
    }

    void addSleepingThread(T *data, int time){
        Elem *elem = new Elem(data);
    80002178:	01800513          	li	a0,24
    8000217c:	00000097          	auipc	ra,0x0
    80002180:	1c0080e7          	jalr	448(ra) # 8000233c <_Znwm>
        Elem(T *data) : data(data), next(nullptr), sleepTime(0) {}
    80002184:	01253023          	sd	s2,0(a0)
    80002188:	00053423          	sd	zero,8(a0)
    8000218c:	00052823          	sw	zero,16(a0)
        if(!head){
    80002190:	00005797          	auipc	a5,0x5
    80002194:	e707b783          	ld	a5,-400(a5) # 80007000 <_GLOBAL_OFFSET_TABLE_+0x50>
    80002198:	0007b783          	ld	a5,0(a5)
    8000219c:	00078863          	beqz	a5,800021ac <_ZN7_thread5sleepEm+0x6c>
            elem->sleepTime = time;
            tail = head;
            return;
        }
        int timeCount = 0;
        Elem *next = head, *prev = nullptr;
    800021a0:	00000693          	li	a3,0
        int timeCount = 0;
    800021a4:	00000713          	li	a4,0
    800021a8:	0200006f          	j	800021c8 <_ZN7_thread5sleepEm+0x88>
            head = elem;
    800021ac:	00005797          	auipc	a5,0x5
    800021b0:	e547b783          	ld	a5,-428(a5) # 80007000 <_GLOBAL_OFFSET_TABLE_+0x50>
    800021b4:	00a7b023          	sd	a0,0(a5)
            elem->sleepTime = time;
    800021b8:	00952823          	sw	s1,16(a0)
            tail = head;
    800021bc:	00a7b423          	sd	a0,8(a5)
            return;
    800021c0:	0500006f          	j	80002210 <_ZN7_thread5sleepEm+0xd0>

        while(time >= timeCount + next->sleepTime){
             timeCount += next->sleepTime;
             prev= next;
             next = next->next;
    800021c4:	00060793          	mv	a5,a2
        while(time >= timeCount + next->sleepTime){
    800021c8:	0107a603          	lw	a2,16(a5)
    800021cc:	00070593          	mv	a1,a4
    800021d0:	00e6073b          	addw	a4,a2,a4
    800021d4:	00e4cc63          	blt	s1,a4,800021ec <_ZN7_thread5sleepEm+0xac>
             next = next->next;
    800021d8:	0087b603          	ld	a2,8(a5)
             prev= next;
    800021dc:	00078693          	mv	a3,a5
             if(next == nullptr)
    800021e0:	fe0612e3          	bnez	a2,800021c4 <_ZN7_thread5sleepEm+0x84>
             next = next->next;
    800021e4:	00060793          	mv	a5,a2
             timeCount += next->sleepTime;
    800021e8:	00070593          	mv	a1,a4
                 break;
        }
        if(!prev){
    800021ec:	04068463          	beqz	a3,80002234 <_ZN7_thread5sleepEm+0xf4>
            head = elem;
            head->next = next;
            head->next->sleepTime -=  head->sleepTime;
        }
        else {
            prev->next = elem;
    800021f0:	00a6b423          	sd	a0,8(a3) # 8008 <_entry-0x7fff7ff8>
            elem->next = next;
    800021f4:	00f53423          	sd	a5,8(a0)
            int diff = time - timeCount;
    800021f8:	40b484bb          	subw	s1,s1,a1
            elem->sleepTime = diff;
    800021fc:	00952823          	sw	s1,16(a0)
            if(next != nullptr)
    80002200:	00078863          	beqz	a5,80002210 <_ZN7_thread5sleepEm+0xd0>
                next->sleepTime -= diff;
    80002204:	0107a703          	lw	a4,16(a5)
    80002208:	409704bb          	subw	s1,a4,s1
    8000220c:	0097a823          	sw	s1,16(a5)
    dispatch();
    80002210:	00000097          	auipc	ra,0x0
    80002214:	df8080e7          	jalr	-520(ra) # 80002008 <_ZN7_thread8dispatchEv>
    return 0; //TODO povratna vrednost!!!
}
    80002218:	00000513          	li	a0,0
    8000221c:	01813083          	ld	ra,24(sp)
    80002220:	01013403          	ld	s0,16(sp)
    80002224:	00813483          	ld	s1,8(sp)
    80002228:	00013903          	ld	s2,0(sp)
    8000222c:	02010113          	addi	sp,sp,32
    80002230:	00008067          	ret
            head = elem;
    80002234:	00005717          	auipc	a4,0x5
    80002238:	dcc73703          	ld	a4,-564(a4) # 80007000 <_GLOBAL_OFFSET_TABLE_+0x50>
    8000223c:	00a73023          	sd	a0,0(a4)
            head->next = next;
    80002240:	00f53423          	sd	a5,8(a0)
            head->next->sleepTime -=  head->sleepTime;
    80002244:	01052683          	lw	a3,16(a0)
    80002248:	0107a703          	lw	a4,16(a5)
    8000224c:	40d7073b          	subw	a4,a4,a3
    80002250:	00e7a823          	sw	a4,16(a5)
    80002254:	fbdff06f          	j	80002210 <_ZN7_thread5sleepEm+0xd0>

0000000080002258 <_ZN7_thread12consoleWriteEPv>:

void _thread::consoleWrite(void* t) {
    80002258:	ff010113          	addi	sp,sp,-16
    8000225c:	00113423          	sd	ra,8(sp)
    80002260:	00813023          	sd	s0,0(sp)
    80002264:	01010413          	addi	s0,sp,16
    {
        while(true){
            char c = Riscv::buff1.take();
    80002268:	00005517          	auipc	a0,0x5
    8000226c:	d7053503          	ld	a0,-656(a0) # 80006fd8 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002270:	00001097          	auipc	ra,0x1
    80002274:	a50080e7          	jalr	-1456(ra) # 80002cc0 <_ZN14KeyboardBuffer4takeEv>
            if((*((char*)CONSOLE_STATUS) & CONSOLE_TX_STATUS_BIT) && (Riscv::buff1.getCount() > 0)){
    80002278:	00005797          	auipc	a5,0x5
    8000227c:	d487b783          	ld	a5,-696(a5) # 80006fc0 <_GLOBAL_OFFSET_TABLE_+0x10>
    80002280:	0007b783          	ld	a5,0(a5)
    80002284:	0007c783          	lbu	a5,0(a5)
    80002288:	0207f793          	andi	a5,a5,32
    8000228c:	fc078ee3          	beqz	a5,80002268 <_ZN7_thread12consoleWriteEPv+0x10>
public:
    KeyboardBuffer() : head(0),tail(0),count(0) { _sem::createSem(&itemAvailable, 0);}
    char take ();
    void append (char c);
    _sem *itemAvailable;
    uint64 getCount() { return count; }
    80002290:	00005797          	auipc	a5,0x5
    80002294:	d487b783          	ld	a5,-696(a5) # 80006fd8 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002298:	1187b783          	ld	a5,280(a5)
    8000229c:	fc0786e3          	beqz	a5,80002268 <_ZN7_thread12consoleWriteEPv+0x10>
                *((char*)CONSOLE_TX_DATA) = c;
    800022a0:	00005797          	auipc	a5,0x5
    800022a4:	d487b783          	ld	a5,-696(a5) # 80006fe8 <_GLOBAL_OFFSET_TABLE_+0x38>
    800022a8:	0007b783          	ld	a5,0(a5)
    800022ac:	00a78023          	sb	a0,0(a5)
    800022b0:	fb9ff06f          	j	80002268 <_ZN7_thread12consoleWriteEPv+0x10>

00000000800022b4 <_ZN7_thread12idleDeletionEv>:
        }

    }
}

void _thread::idleDeletion() {
    800022b4:	fe010113          	addi	sp,sp,-32
    800022b8:	00113c23          	sd	ra,24(sp)
    800022bc:	00813823          	sd	s0,16(sp)
    800022c0:	00913423          	sd	s1,8(sp)
    800022c4:	02010413          	addi	s0,sp,32
    800022c8:	0340006f          	j	800022fc <_ZN7_thread12idleDeletionEv+0x48>
            pom = head;
    800022cc:	00005797          	auipc	a5,0x5
    800022d0:	d2c7b783          	ld	a5,-724(a5) # 80006ff8 <_GLOBAL_OFFSET_TABLE_+0x48>
    800022d4:	0007b703          	ld	a4,0(a5)
    800022d8:	00e7b823          	sd	a4,16(a5)
    800022dc:	0300006f          	j	8000230c <_ZN7_thread12idleDeletionEv+0x58>
    ~_thread() { delete[] stack; }
    800022e0:	00000097          	auipc	ra,0x0
    800022e4:	0d4080e7          	jalr	212(ra) # 800023b4 <_ZdaPv>
    while(true){
        _thread *t = Scheduler::readyThreadQueue.traverseList();
        if(t->isFinished())
            delete t;
    800022e8:	00048513          	mv	a0,s1
    800022ec:	00000097          	auipc	ra,0x0
    800022f0:	0a0080e7          	jalr	160(ra) # 8000238c <_ZdlPv>
        dispatch();
    800022f4:	00000097          	auipc	ra,0x0
    800022f8:	d14080e7          	jalr	-748(ra) # 80002008 <_ZN7_thread8dispatchEv>
        if(pom == nullptr){
    800022fc:	00005797          	auipc	a5,0x5
    80002300:	cfc7b783          	ld	a5,-772(a5) # 80006ff8 <_GLOBAL_OFFSET_TABLE_+0x48>
    80002304:	0107b783          	ld	a5,16(a5)
    80002308:	fc0782e3          	beqz	a5,800022cc <_ZN7_thread12idleDeletionEv+0x18>
        Elem *t = pom;
    8000230c:	00005717          	auipc	a4,0x5
    80002310:	cec73703          	ld	a4,-788(a4) # 80006ff8 <_GLOBAL_OFFSET_TABLE_+0x48>
    80002314:	01073783          	ld	a5,16(a4)
        pom = pom->next;
    80002318:	0087b683          	ld	a3,8(a5)
    8000231c:	00d73823          	sd	a3,16(a4)
        return t->data;
    80002320:	0007b483          	ld	s1,0(a5)
    bool isFinished() const { return finished; }
    80002324:	0284c783          	lbu	a5,40(s1)
        if(t->isFinished())
    80002328:	fc0786e3          	beqz	a5,800022f4 <_ZN7_thread12idleDeletionEv+0x40>
            delete t;
    8000232c:	fc0484e3          	beqz	s1,800022f4 <_ZN7_thread12idleDeletionEv+0x40>
    ~_thread() { delete[] stack; }
    80002330:	0084b503          	ld	a0,8(s1)
    80002334:	fa0516e3          	bnez	a0,800022e0 <_ZN7_thread12idleDeletionEv+0x2c>
    80002338:	fb1ff06f          	j	800022e8 <_ZN7_thread12idleDeletionEv+0x34>

000000008000233c <_Znwm>:
#include "../h/print.hpp"

using size_t = decltype(sizeof(0));

void *operator new(size_t n)
{
    8000233c:	ff010113          	addi	sp,sp,-16
    80002340:	00113423          	sd	ra,8(sp)
    80002344:	00813023          	sd	s0,0(sp)
    80002348:	01010413          	addi	s0,sp,16
//    printString("new operator");
    return __mem_alloc(n);
    8000234c:	00003097          	auipc	ra,0x3
    80002350:	cec080e7          	jalr	-788(ra) # 80005038 <__mem_alloc>
}
    80002354:	00813083          	ld	ra,8(sp)
    80002358:	00013403          	ld	s0,0(sp)
    8000235c:	01010113          	addi	sp,sp,16
    80002360:	00008067          	ret

0000000080002364 <_Znam>:

void *operator new[](size_t n)
{
    80002364:	ff010113          	addi	sp,sp,-16
    80002368:	00113423          	sd	ra,8(sp)
    8000236c:	00813023          	sd	s0,0(sp)
    80002370:	01010413          	addi	s0,sp,16
    return __mem_alloc(n);
    80002374:	00003097          	auipc	ra,0x3
    80002378:	cc4080e7          	jalr	-828(ra) # 80005038 <__mem_alloc>
}
    8000237c:	00813083          	ld	ra,8(sp)
    80002380:	00013403          	ld	s0,0(sp)
    80002384:	01010113          	addi	sp,sp,16
    80002388:	00008067          	ret

000000008000238c <_ZdlPv>:

void operator delete(void *p) noexcept
{
    8000238c:	ff010113          	addi	sp,sp,-16
    80002390:	00113423          	sd	ra,8(sp)
    80002394:	00813023          	sd	s0,0(sp)
    80002398:	01010413          	addi	s0,sp,16
    __mem_free(p);
    8000239c:	00003097          	auipc	ra,0x3
    800023a0:	bd0080e7          	jalr	-1072(ra) # 80004f6c <__mem_free>
}
    800023a4:	00813083          	ld	ra,8(sp)
    800023a8:	00013403          	ld	s0,0(sp)
    800023ac:	01010113          	addi	sp,sp,16
    800023b0:	00008067          	ret

00000000800023b4 <_ZdaPv>:

void operator delete[](void *p) noexcept
{
    800023b4:	ff010113          	addi	sp,sp,-16
    800023b8:	00113423          	sd	ra,8(sp)
    800023bc:	00813023          	sd	s0,0(sp)
    800023c0:	01010413          	addi	s0,sp,16
    __mem_free(p);
    800023c4:	00003097          	auipc	ra,0x3
    800023c8:	ba8080e7          	jalr	-1112(ra) # 80004f6c <__mem_free>
    800023cc:	00813083          	ld	ra,8(sp)
    800023d0:	00013403          	ld	s0,0(sp)
    800023d4:	01010113          	addi	sp,sp,16
    800023d8:	00008067          	ret

00000000800023dc <_Z41__static_initialization_and_destruction_0ii>:
    }
        else
    {
        // unexpected trap cause
    }
    800023dc:	00100793          	li	a5,1
    800023e0:	00f50463          	beq	a0,a5,800023e8 <_Z41__static_initialization_and_destruction_0ii+0xc>
    800023e4:	00008067          	ret
    800023e8:	000107b7          	lui	a5,0x10
    800023ec:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    800023f0:	fef59ae3          	bne	a1,a5,800023e4 <_Z41__static_initialization_and_destruction_0ii+0x8>
    800023f4:	fe010113          	addi	sp,sp,-32
    800023f8:	00113c23          	sd	ra,24(sp)
    800023fc:	00813823          	sd	s0,16(sp)
    80002400:	00913423          	sd	s1,8(sp)
    80002404:	02010413          	addi	s0,sp,32
    };

    Elem *head, *tail, *pom = nullptr;

public:
    List() : head(0), tail(0) {}
    80002408:	00005497          	auipc	s1,0x5
    8000240c:	c7848493          	addi	s1,s1,-904 # 80007080 <_ZN5Riscv15sleepingThreadsE>
    80002410:	0004b023          	sd	zero,0(s1)
    80002414:	0004b423          	sd	zero,8(s1)
    80002418:	0004b823          	sd	zero,16(s1)
    KeyboardBuffer() : head(0),tail(0),count(0) { _sem::createSem(&itemAvailable, 0);}
    8000241c:	1204b023          	sd	zero,288(s1)
    80002420:	1204b423          	sd	zero,296(s1)
    80002424:	1204b823          	sd	zero,304(s1)
    80002428:	00000593          	li	a1,0
    8000242c:	00005517          	auipc	a0,0x5
    80002430:	c6c50513          	addi	a0,a0,-916 # 80007098 <_ZN5Riscv5buff1E>
    80002434:	00000097          	auipc	ra,0x0
    80002438:	494080e7          	jalr	1172(ra) # 800028c8 <_ZN4_sem9createSemEPPS_m>
    8000243c:	2404b023          	sd	zero,576(s1)
    80002440:	2404b423          	sd	zero,584(s1)
    80002444:	2404b823          	sd	zero,592(s1)
    80002448:	00000593          	li	a1,0
    8000244c:	00005517          	auipc	a0,0x5
    80002450:	d6c50513          	addi	a0,a0,-660 # 800071b8 <_ZN5Riscv5buff2E>
    80002454:	00000097          	auipc	ra,0x0
    80002458:	474080e7          	jalr	1140(ra) # 800028c8 <_ZN4_sem9createSemEPPS_m>
    8000245c:	01813083          	ld	ra,24(sp)
    80002460:	01013403          	ld	s0,16(sp)
    80002464:	00813483          	ld	s1,8(sp)
    80002468:	02010113          	addi	sp,sp,32
    8000246c:	00008067          	ret

0000000080002470 <_ZN5Riscv10popSppSpieEv>:
{
    80002470:	ff010113          	addi	sp,sp,-16
    80002474:	00813423          	sd	s0,8(sp)
    80002478:	01010413          	addi	s0,sp,16
    __asm__ volatile("csrw sepc, ra");
    8000247c:	14109073          	csrw	sepc,ra
    __asm__ volatile("sret");
    80002480:	10200073          	sret
}
    80002484:	00813403          	ld	s0,8(sp)
    80002488:	01010113          	addi	sp,sp,16
    8000248c:	00008067          	ret

0000000080002490 <_ZN5Riscv20handleSupervisorTrapEv>:
{
    80002490:	f9010113          	addi	sp,sp,-112
    80002494:	06113423          	sd	ra,104(sp)
    80002498:	06813023          	sd	s0,96(sp)
    8000249c:	04913c23          	sd	s1,88(sp)
    800024a0:	07010413          	addi	s0,sp,112
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r"(scause));
    800024a4:	142027f3          	csrr	a5,scause
    800024a8:	faf43c23          	sd	a5,-72(s0)
    return scause;
    800024ac:	fb843703          	ld	a4,-72(s0)
    if (scause == 0x0000000000000008UL || scause == 0x0000000000000009UL)
    800024b0:	ff870693          	addi	a3,a4,-8
    800024b4:	00100793          	li	a5,1
    800024b8:	04d7f463          	bgeu	a5,a3,80002500 <_ZN5Riscv20handleSupervisorTrapEv+0x70>
    else if (scause == 0x8000000000000001UL)
    800024bc:	fff00793          	li	a5,-1
    800024c0:	03f79793          	slli	a5,a5,0x3f
    800024c4:	00178793          	addi	a5,a5,1
    800024c8:	2af70a63          	beq	a4,a5,8000277c <_ZN5Riscv20handleSupervisorTrapEv+0x2ec>
    else if (scause == 0x8000000000000009UL) {
    800024cc:	fff00793          	li	a5,-1
    800024d0:	03f79793          	slli	a5,a5,0x3f
    800024d4:	00978793          	addi	a5,a5,9
    800024d8:	10f71463          	bne	a4,a5,800025e0 <_ZN5Riscv20handleSupervisorTrapEv+0x150>
        int irq = plic_claim();
    800024dc:	00001097          	auipc	ra,0x1
    800024e0:	228080e7          	jalr	552(ra) # 80003704 <plic_claim>
    800024e4:	00050493          	mv	s1,a0
        if (irq == IRQ_CONSOLE)
    800024e8:	00a00793          	li	a5,10
    800024ec:	36f50463          	beq	a0,a5,80002854 <_ZN5Riscv20handleSupervisorTrapEv+0x3c4>
        plic_complete(irq);
    800024f0:	00048513          	mv	a0,s1
    800024f4:	00001097          	auipc	ra,0x1
    800024f8:	248080e7          	jalr	584(ra) # 8000373c <plic_complete>
    800024fc:	0e40006f          	j	800025e0 <_ZN5Riscv20handleSupervisorTrapEv+0x150>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80002500:	141027f3          	csrr	a5,sepc
    80002504:	fcf43423          	sd	a5,-56(s0)
    return sepc;
    80002508:	fc843783          	ld	a5,-56(s0)
        uint64 volatile sepc = r_sepc() + 4;
    8000250c:	00478793          	addi	a5,a5,4
    80002510:	f8f43c23          	sd	a5,-104(s0)
}

inline uint64 Riscv::r_sstatus()
{
    uint64 volatile sstatus;
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80002514:	100027f3          	csrr	a5,sstatus
    80002518:	fcf43023          	sd	a5,-64(s0)
    return sstatus;
    8000251c:	fc043783          	ld	a5,-64(s0)
        uint64 volatile sstatus = r_sstatus();
    80002520:	faf43023          	sd	a5,-96(s0)
        __asm__ volatile("mv %0, a0" : "=r" (code));
    80002524:	00050793          	mv	a5,a0
        if(code == 0x1) {
    80002528:	00100713          	li	a4,1
    8000252c:	08e78463          	beq	a5,a4,800025b4 <_ZN5Riscv20handleSupervisorTrapEv+0x124>
        }else if(code == 0x02) {
    80002530:	00200713          	li	a4,2
    80002534:	0ce78063          	beq	a5,a4,800025f4 <_ZN5Riscv20handleSupervisorTrapEv+0x164>
        }else if(code == 0x11){
    80002538:	01100713          	li	a4,17
    8000253c:	0ce78863          	beq	a5,a4,8000260c <_ZN5Riscv20handleSupervisorTrapEv+0x17c>
        }else if(code == 0x12){
    80002540:	01200713          	li	a4,18
    80002544:	0ee78c63          	beq	a5,a4,8000263c <_ZN5Riscv20handleSupervisorTrapEv+0x1ac>
        }else if(code == 0x13){
    80002548:	01300713          	li	a4,19
    8000254c:	10e78863          	beq	a5,a4,8000265c <_ZN5Riscv20handleSupervisorTrapEv+0x1cc>
        }else if(code == 0x21){
    80002550:	02100713          	li	a4,33
    80002554:	10e78c63          	beq	a5,a4,8000266c <_ZN5Riscv20handleSupervisorTrapEv+0x1dc>
        }else if(code == 0x22){
    80002558:	02200713          	li	a4,34
    8000255c:	12e78663          	beq	a5,a4,80002688 <_ZN5Riscv20handleSupervisorTrapEv+0x1f8>
        }else if(code == 0x23){
    80002560:	02300713          	li	a4,35
    80002564:	14e78a63          	beq	a5,a4,800026b8 <_ZN5Riscv20handleSupervisorTrapEv+0x228>
        }else if(code == 0x24){
    80002568:	02400713          	li	a4,36
    8000256c:	16e78263          	beq	a5,a4,800026d0 <_ZN5Riscv20handleSupervisorTrapEv+0x240>
        }else if(code == 0x31){
    80002570:	03100713          	li	a4,49
    80002574:	16e78a63          	beq	a5,a4,800026e8 <_ZN5Riscv20handleSupervisorTrapEv+0x258>
        }else if(code == 0x41){
    80002578:	04100713          	li	a4,65
    8000257c:	18e78263          	beq	a5,a4,80002700 <_ZN5Riscv20handleSupervisorTrapEv+0x270>
        }else if(code == 0x42){
    80002580:	04200713          	li	a4,66
    80002584:	18e78a63          	beq	a5,a4,80002718 <_ZN5Riscv20handleSupervisorTrapEv+0x288>
        }else if(code == 0x43){
    80002588:	04300713          	li	a4,67
    8000258c:	1ae78663          	beq	a5,a4,80002738 <_ZN5Riscv20handleSupervisorTrapEv+0x2a8>
        }else if(code == 0x44){
    80002590:	04400713          	li	a4,68
    80002594:	1ce78a63          	beq	a5,a4,80002768 <_ZN5Riscv20handleSupervisorTrapEv+0x2d8>
            _thread::timeSliceCounter = 0;
    80002598:	00005797          	auipc	a5,0x5
    8000259c:	a807b783          	ld	a5,-1408(a5) # 80007018 <_GLOBAL_OFFSET_TABLE_+0x68>
    800025a0:	0007b023          	sd	zero,0(a5)
            _thread::dispatch();
    800025a4:	00000097          	auipc	ra,0x0
    800025a8:	a64080e7          	jalr	-1436(ra) # 80002008 <_ZN7_thread8dispatchEv>
    int ret = 0;
    800025ac:	00000513          	li	a0,0
    800025b0:	01c0006f          	j	800025cc <_ZN5Riscv20handleSupervisorTrapEv+0x13c>
            __asm__ volatile("mv %0, a1" : "=r" (x));
    800025b4:	00058513          	mv	a0,a1
            void* r = __mem_alloc(x);
    800025b8:	00651513          	slli	a0,a0,0x6
    800025bc:	00003097          	auipc	ra,0x3
    800025c0:	a7c080e7          	jalr	-1412(ra) # 80005038 <__mem_alloc>
            __asm__ volatile("mv a0, %0" : : "r" (r));
    800025c4:	00050513          	mv	a0,a0
    int ret = 0;
    800025c8:	00000513          	li	a0,0
        w_sstatus(sstatus);
    800025cc:	fa043783          	ld	a5,-96(s0)
}

inline void Riscv::w_sstatus(uint64 sstatus)
{
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    800025d0:	10079073          	csrw	sstatus,a5
        w_sepc(sepc);
    800025d4:	f9843783          	ld	a5,-104(s0)
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    800025d8:	14179073          	csrw	sepc,a5
        __asm__ volatile("mv a0, %0" : : "r" (ret));
    800025dc:	00050513          	mv	a0,a0
    800025e0:	06813083          	ld	ra,104(sp)
    800025e4:	06013403          	ld	s0,96(sp)
    800025e8:	05813483          	ld	s1,88(sp)
    800025ec:	07010113          	addi	sp,sp,112
    800025f0:	00008067          	ret
            __asm__ volatile("mv %0, a1" : "=r" (x));
    800025f4:	00058513          	mv	a0,a1
            ret = __mem_free((void*)x);
    800025f8:	00003097          	auipc	ra,0x3
    800025fc:	974080e7          	jalr	-1676(ra) # 80004f6c <__mem_free>
            __asm__ volatile("mv a0, %0" : : "r" (ret));
    80002600:	00050513          	mv	a0,a0
    int ret = 0;
    80002604:	00000513          	li	a0,0
    80002608:	fc5ff06f          	j	800025cc <_ZN5Riscv20handleSupervisorTrapEv+0x13c>
            __asm__ volatile("mv %0, a1" : "=r" (handle));
    8000260c:	00058513          	mv	a0,a1
            __asm__ volatile("mv %0, a2" : "=r" (body));
    80002610:	00060593          	mv	a1,a2
            __asm__ volatile("ld t2, 104(fp)");
    80002614:	06843383          	ld	t2,104(s0)
            __asm__ volatile("ld t3, 112(fp)");
    80002618:	07043e03          	ld	t3,112(s0)
            __asm__ volatile("mv %0, t2" : "=r" (args));
    8000261c:	00038613          	mv	a2,t2
            __asm__ volatile("mv %0, t3" : "=r" (stack));
    80002620:	000e0693          	mv	a3,t3
            int ret = _thread::createThread(handle, body, args, stack, true);
    80002624:	00100713          	li	a4,1
    80002628:	00000097          	auipc	ra,0x0
    8000262c:	848080e7          	jalr	-1976(ra) # 80001e70 <_ZN7_thread12createThreadEPPS_PFvPvES2_S2_b>
            __asm__ volatile("mv a0, %0" : : "r" (ret));
    80002630:	00050513          	mv	a0,a0
    int ret = 0;
    80002634:	00000513          	li	a0,0
    80002638:	f95ff06f          	j	800025cc <_ZN5Riscv20handleSupervisorTrapEv+0x13c>
            int ret = _thread::threadStop();
    8000263c:	00000097          	auipc	ra,0x0
    80002640:	aa8080e7          	jalr	-1368(ra) # 800020e4 <_ZN7_thread10threadStopEv>
            if(ret != 0)
    80002644:	00050863          	beqz	a0,80002654 <_ZN5Riscv20handleSupervisorTrapEv+0x1c4>
                __asm__ volatile("mv a0, %0" : : "r" (ret));
    80002648:	00050513          	mv	a0,a0
    int ret = 0;
    8000264c:	00000513          	li	a0,0
    80002650:	f7dff06f          	j	800025cc <_ZN5Riscv20handleSupervisorTrapEv+0x13c>
                __asm__ volatile("mv a0, zero");
    80002654:	00000513          	li	a0,0
    80002658:	f75ff06f          	j	800025cc <_ZN5Riscv20handleSupervisorTrapEv+0x13c>
            _thread::dispatch();
    8000265c:	00000097          	auipc	ra,0x0
    80002660:	9ac080e7          	jalr	-1620(ra) # 80002008 <_ZN7_thread8dispatchEv>
    int ret = 0;
    80002664:	00000513          	li	a0,0
    80002668:	f65ff06f          	j	800025cc <_ZN5Riscv20handleSupervisorTrapEv+0x13c>
            __asm__ volatile("mv %0, a1" : "=r" (handle));
    8000266c:	00058513          	mv	a0,a1
            __asm__ volatile("mv %0, a2" : "=r" (init));
    80002670:	00060593          	mv	a1,a2
            int ret = _sem::createSem(handle, init);
    80002674:	00000097          	auipc	ra,0x0
    80002678:	254080e7          	jalr	596(ra) # 800028c8 <_ZN4_sem9createSemEPPS_m>
            __asm__ volatile("mv a0, %0" : : "r" (ret));
    8000267c:	00050513          	mv	a0,a0
    int ret = 0;
    80002680:	00000513          	li	a0,0
    80002684:	f49ff06f          	j	800025cc <_ZN5Riscv20handleSupervisorTrapEv+0x13c>
            __asm__ volatile("mv %0, a1" : "=r" (handle));
    80002688:	00058493          	mv	s1,a1
            delete handle; //TODO ??????????????????????????????????????
    8000268c:	00048e63          	beqz	s1,800026a8 <_ZN5Riscv20handleSupervisorTrapEv+0x218>
    80002690:	00048513          	mv	a0,s1
    80002694:	00000097          	auipc	ra,0x0
    80002698:	29c080e7          	jalr	668(ra) # 80002930 <_ZN4_semD1Ev>
    8000269c:	00048513          	mv	a0,s1
    800026a0:	00000097          	auipc	ra,0x0
    800026a4:	cec080e7          	jalr	-788(ra) # 8000238c <_ZdlPv>
            __asm__ volatile("mv a0, %0" : : "r" (ret));
    800026a8:	00000793          	li	a5,0
    800026ac:	00078513          	mv	a0,a5
    int ret = 0;
    800026b0:	00000513          	li	a0,0
    800026b4:	f19ff06f          	j	800025cc <_ZN5Riscv20handleSupervisorTrapEv+0x13c>
            __asm__ volatile("mv %0, a1" : "=r" (handle));
    800026b8:	00058513          	mv	a0,a1
            int ret = handle->wait(); //TODO ?????????;
    800026bc:	00000097          	auipc	ra,0x0
    800026c0:	40c080e7          	jalr	1036(ra) # 80002ac8 <_ZN4_sem4waitEv>
            __asm__ volatile("mv a0, %0" : : "r" (ret));
    800026c4:	00050513          	mv	a0,a0
    int ret = 0;
    800026c8:	00000513          	li	a0,0
    800026cc:	f01ff06f          	j	800025cc <_ZN5Riscv20handleSupervisorTrapEv+0x13c>
            __asm__ volatile("mv %0, a1" : "=r" (id));
    800026d0:	00058513          	mv	a0,a1
            int ret = id->signal();
    800026d4:	00000097          	auipc	ra,0x0
    800026d8:	43c080e7          	jalr	1084(ra) # 80002b10 <_ZN4_sem6signalEv>
            __asm__ volatile("mv a0, %0" : : "r" (ret));
    800026dc:	00050513          	mv	a0,a0
    int ret = 0;
    800026e0:	00000513          	li	a0,0
    800026e4:	ee9ff06f          	j	800025cc <_ZN5Riscv20handleSupervisorTrapEv+0x13c>
            __asm__ volatile("mv %0, a1" : "=r" (time));
    800026e8:	00058513          	mv	a0,a1
            int ret = _thread::sleep(time);
    800026ec:	00000097          	auipc	ra,0x0
    800026f0:	a54080e7          	jalr	-1452(ra) # 80002140 <_ZN7_thread5sleepEm>
            __asm__ volatile("mv a0, %0" : : "r" (ret));
    800026f4:	00050513          	mv	a0,a0
    int ret = 0;
    800026f8:	00000513          	li	a0,0
    800026fc:	ed1ff06f          	j	800025cc <_ZN5Riscv20handleSupervisorTrapEv+0x13c>
            ret = buff2.take();
    80002700:	00005517          	auipc	a0,0x5
    80002704:	ab850513          	addi	a0,a0,-1352 # 800071b8 <_ZN5Riscv5buff2E>
    80002708:	00000097          	auipc	ra,0x0
    8000270c:	5b8080e7          	jalr	1464(ra) # 80002cc0 <_ZN14KeyboardBuffer4takeEv>
    80002710:	0005051b          	sext.w	a0,a0
    80002714:	eb9ff06f          	j	800025cc <_ZN5Riscv20handleSupervisorTrapEv+0x13c>
            __asm__ volatile("mv %0, a1" : "=r" (c));
    80002718:	00058593          	mv	a1,a1
            buff1.append(c);
    8000271c:	0ff5f593          	andi	a1,a1,255
    80002720:	00005517          	auipc	a0,0x5
    80002724:	97850513          	addi	a0,a0,-1672 # 80007098 <_ZN5Riscv5buff1E>
    80002728:	00000097          	auipc	ra,0x0
    8000272c:	5f4080e7          	jalr	1524(ra) # 80002d1c <_ZN14KeyboardBuffer6appendEc>
    int ret = 0;
    80002730:	00000513          	li	a0,0
    80002734:	e99ff06f          	j	800025cc <_ZN5Riscv20handleSupervisorTrapEv+0x13c>
            __asm__ volatile("mv %0, a1" : "=r" (handle));
    80002738:	00058513          	mv	a0,a1
            __asm__ volatile("mv %0, a2" : "=r" (body));
    8000273c:	00060593          	mv	a1,a2
            __asm__ volatile("ld t2, 104(fp)");
    80002740:	06843383          	ld	t2,104(s0)
            __asm__ volatile("ld t3, 112(fp)");
    80002744:	07043e03          	ld	t3,112(s0)
            __asm__ volatile("mv %0, t2" : "=r" (args));
    80002748:	00038613          	mv	a2,t2
            __asm__ volatile("mv %0, t3" : "=r" (stack));
    8000274c:	000e0693          	mv	a3,t3
            int ret = _thread::createThread(handle, body, args, stack, false);
    80002750:	00000713          	li	a4,0
    80002754:	fffff097          	auipc	ra,0xfffff
    80002758:	71c080e7          	jalr	1820(ra) # 80001e70 <_ZN7_thread12createThreadEPPS_PFvPvES2_S2_b>
            __asm__ volatile("mv a0, %0" : : "r" (ret));
    8000275c:	00050513          	mv	a0,a0
    int ret = 0;
    80002760:	00000513          	li	a0,0
    80002764:	e69ff06f          	j	800025cc <_ZN5Riscv20handleSupervisorTrapEv+0x13c>
            __asm__ volatile("mv %0, a1" : "=r" (handle));
    80002768:	00058513          	mv	a0,a1
        Scheduler::put(this);
    }

    void dblck();

    void start() { Scheduler::put(this); }
    8000276c:	00000097          	auipc	ra,0x0
    80002770:	4b0080e7          	jalr	1200(ra) # 80002c1c <_ZN9Scheduler3putEP7_thread>
    int ret = 0;
    80002774:	00000513          	li	a0,0
    80002778:	e55ff06f          	j	800025cc <_ZN5Riscv20handleSupervisorTrapEv+0x13c>
//            Scheduler::put(t);
        }
    }

    void sleepControl(){
        if(head != nullptr && --head->sleepTime == 0) //dekrementira vreme i radi proveru
    8000277c:	00005717          	auipc	a4,0x5
    80002780:	90473703          	ld	a4,-1788(a4) # 80007080 <_ZN5Riscv15sleepingThreadsE>
    80002784:	00070c63          	beqz	a4,8000279c <_ZN5Riscv20handleSupervisorTrapEv+0x30c>
    80002788:	01072783          	lw	a5,16(a4)
    8000278c:	fff7879b          	addiw	a5,a5,-1
    80002790:	0007869b          	sext.w	a3,a5
    80002794:	00f72823          	sw	a5,16(a4)
    80002798:	06068e63          	beqz	a3,80002814 <_ZN5Riscv20handleSupervisorTrapEv+0x384>
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"(mask));
    8000279c:	00200793          	li	a5,2
    800027a0:	1447b073          	csrc	sip,a5
        _thread::timeSliceCounter++;
    800027a4:	00005717          	auipc	a4,0x5
    800027a8:	87473703          	ld	a4,-1932(a4) # 80007018 <_GLOBAL_OFFSET_TABLE_+0x68>
    800027ac:	00073783          	ld	a5,0(a4)
    800027b0:	00178793          	addi	a5,a5,1
    800027b4:	00f73023          	sd	a5,0(a4)
        if (_thread::timeSliceCounter >= _thread::running->getTimeSlice())
    800027b8:	00005717          	auipc	a4,0x5
    800027bc:	81073703          	ld	a4,-2032(a4) # 80006fc8 <_GLOBAL_OFFSET_TABLE_+0x18>
    800027c0:	00073703          	ld	a4,0(a4)
    uint64 getTimeSlice() const { return timeSlice; }
    800027c4:	02073703          	ld	a4,32(a4)
    800027c8:	e0e7ece3          	bltu	a5,a4,800025e0 <_ZN5Riscv20handleSupervisorTrapEv+0x150>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    800027cc:	141027f3          	csrr	a5,sepc
    800027d0:	fcf43c23          	sd	a5,-40(s0)
    return sepc;
    800027d4:	fd843783          	ld	a5,-40(s0)
            uint64 volatile sepc = r_sepc();
    800027d8:	faf43423          	sd	a5,-88(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    800027dc:	100027f3          	csrr	a5,sstatus
    800027e0:	fcf43823          	sd	a5,-48(s0)
    return sstatus;
    800027e4:	fd043783          	ld	a5,-48(s0)
            uint64 volatile sstatus = r_sstatus();
    800027e8:	faf43823          	sd	a5,-80(s0)
            _thread::timeSliceCounter = 0;
    800027ec:	00005797          	auipc	a5,0x5
    800027f0:	82c7b783          	ld	a5,-2004(a5) # 80007018 <_GLOBAL_OFFSET_TABLE_+0x68>
    800027f4:	0007b023          	sd	zero,0(a5)
            _thread::dispatch();
    800027f8:	00000097          	auipc	ra,0x0
    800027fc:	810080e7          	jalr	-2032(ra) # 80002008 <_ZN7_thread8dispatchEv>
            w_sstatus(sstatus);
    80002800:	fb043783          	ld	a5,-80(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80002804:	10079073          	csrw	sstatus,a5
            w_sepc(sepc);
    80002808:	fa843783          	ld	a5,-88(s0)
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    8000280c:	14179073          	csrw	sepc,a5
}
    80002810:	dd1ff06f          	j	800025e0 <_ZN5Riscv20handleSupervisorTrapEv+0x150>
        while(head && head->sleepTime == 0){
    80002814:	00005797          	auipc	a5,0x5
    80002818:	86c7b783          	ld	a5,-1940(a5) # 80007080 <_ZN5Riscv15sleepingThreadsE>
    8000281c:	f80780e3          	beqz	a5,8000279c <_ZN5Riscv20handleSupervisorTrapEv+0x30c>
    80002820:	0107a703          	lw	a4,16(a5)
    80002824:	f6071ce3          	bnez	a4,8000279c <_ZN5Riscv20handleSupervisorTrapEv+0x30c>
            t = head->data;
    80002828:	0007b483          	ld	s1,0(a5)
            head = head->next;
    8000282c:	0087b783          	ld	a5,8(a5)
    80002830:	00005717          	auipc	a4,0x5
    80002834:	84f73823          	sd	a5,-1968(a4) # 80007080 <_ZN5Riscv15sleepingThreadsE>
            t->setSleep();
    80002838:	00048513          	mv	a0,s1
    8000283c:	fffff097          	auipc	ra,0xfffff
    80002840:	52c080e7          	jalr	1324(ra) # 80001d68 <_ZN7_thread8setSleepEv>
        Scheduler::put(this);
    80002844:	00048513          	mv	a0,s1
    80002848:	00000097          	auipc	ra,0x0
    8000284c:	3d4080e7          	jalr	980(ra) # 80002c1c <_ZN9Scheduler3putEP7_thread>
    }
    80002850:	fc5ff06f          	j	80002814 <_ZN5Riscv20handleSupervisorTrapEv+0x384>
            while (*((char*)CONSOLE_STATUS) & CONSOLE_RX_STATUS_BIT){
    80002854:	00004797          	auipc	a5,0x4
    80002858:	76c7b783          	ld	a5,1900(a5) # 80006fc0 <_GLOBAL_OFFSET_TABLE_+0x10>
    8000285c:	0007b783          	ld	a5,0(a5)
    80002860:	0007c783          	lbu	a5,0(a5)
    80002864:	0017f713          	andi	a4,a5,1
    80002868:	c80704e3          	beqz	a4,800024f0 <_ZN5Riscv20handleSupervisorTrapEv+0x60>
                __asm__ volatile("mv a1, %0" : : "r" (*((char*)CONSOLE_STATUS)));
    8000286c:	00078593          	mv	a1,a5
                char c = (*(char*)CONSOLE_RX_DATA);
    80002870:	00004797          	auipc	a5,0x4
    80002874:	7487b783          	ld	a5,1864(a5) # 80006fb8 <_GLOBAL_OFFSET_TABLE_+0x8>
    80002878:	0007b783          	ld	a5,0(a5)
                buff2.append(c);
    8000287c:	0007c583          	lbu	a1,0(a5)
    80002880:	00005517          	auipc	a0,0x5
    80002884:	93850513          	addi	a0,a0,-1736 # 800071b8 <_ZN5Riscv5buff2E>
    80002888:	00000097          	auipc	ra,0x0
    8000288c:	494080e7          	jalr	1172(ra) # 80002d1c <_ZN14KeyboardBuffer6appendEc>
            while (*((char*)CONSOLE_STATUS) & CONSOLE_RX_STATUS_BIT){
    80002890:	fc5ff06f          	j	80002854 <_ZN5Riscv20handleSupervisorTrapEv+0x3c4>

0000000080002894 <_GLOBAL__sub_I__ZN5Riscv15sleepingThreadsE>:
    80002894:	ff010113          	addi	sp,sp,-16
    80002898:	00113423          	sd	ra,8(sp)
    8000289c:	00813023          	sd	s0,0(sp)
    800028a0:	01010413          	addi	s0,sp,16
    800028a4:	000105b7          	lui	a1,0x10
    800028a8:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    800028ac:	00100513          	li	a0,1
    800028b0:	00000097          	auipc	ra,0x0
    800028b4:	b2c080e7          	jalr	-1236(ra) # 800023dc <_Z41__static_initialization_and_destruction_0ii>
    800028b8:	00813083          	ld	ra,8(sp)
    800028bc:	00013403          	ld	s0,0(sp)
    800028c0:	01010113          	addi	sp,sp,16
    800028c4:	00008067          	ret

00000000800028c8 <_ZN4_sem9createSemEPPS_m>:
//}
//void unlock(){
//    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);
//}

int _sem::createSem(sem_t *handle, uint64 init){
    800028c8:	fe010113          	addi	sp,sp,-32
    800028cc:	00113c23          	sd	ra,24(sp)
    800028d0:	00813823          	sd	s0,16(sp)
    800028d4:	00913423          	sd	s1,8(sp)
    800028d8:	01213023          	sd	s2,0(sp)
    800028dc:	02010413          	addi	s0,sp,32
    800028e0:	00050493          	mv	s1,a0
    800028e4:	00058913          	mv	s2,a1
    *handle = new _sem(init);
    800028e8:	02000513          	li	a0,32
    800028ec:	00000097          	auipc	ra,0x0
    800028f0:	a50080e7          	jalr	-1456(ra) # 8000233c <_Znwm>
    }
    friend class _thread;
    List<_thread>& blockedList();


    _sem(int val=1) : val(val) {}
    800028f4:	01252023          	sw	s2,0(a0)
    List() : head(0), tail(0) {}
    800028f8:	00053423          	sd	zero,8(a0)
    800028fc:	00053823          	sd	zero,16(a0)
    80002900:	00053c23          	sd	zero,24(a0)
    80002904:	00a4b023          	sd	a0,0(s1)
    if(*handle  != nullptr)
    80002908:	02050063          	beqz	a0,80002928 <_ZN4_sem9createSemEPPS_m+0x60>
        return 0;
    8000290c:	00000513          	li	a0,0
    else
        return -2;
}
    80002910:	01813083          	ld	ra,24(sp)
    80002914:	01013403          	ld	s0,16(sp)
    80002918:	00813483          	ld	s1,8(sp)
    8000291c:	00013903          	ld	s2,0(sp)
    80002920:	02010113          	addi	sp,sp,32
    80002924:	00008067          	ret
        return -2;
    80002928:	ffe00513          	li	a0,-2
    8000292c:	fe5ff06f          	j	80002910 <_ZN4_sem9createSemEPPS_m+0x48>

0000000080002930 <_ZN4_semD1Ev>:

_sem::~_sem() {
    80002930:	fe010113          	addi	sp,sp,-32
    80002934:	00113c23          	sd	ra,24(sp)
    80002938:	00813823          	sd	s0,16(sp)
    8000293c:	00913423          	sd	s1,8(sp)
    80002940:	01213023          	sd	s2,0(sp)
    80002944:	02010413          	addi	s0,sp,32
//    lock();
    _thread *t;
    t = blockedThreadQueue.removeLast();
    80002948:	00850913          	addi	s2,a0,8
        if (!head) { return 0; }
    8000294c:	00853483          	ld	s1,8(a0)
    80002950:	06048863          	beqz	s1,800029c0 <_ZN4_semD1Ev+0x90>
    80002954:	00050693          	mv	a3,a0
        Elem *prev = 0;
    80002958:	00000713          	li	a4,0
        for (Elem *curr = head; curr && curr != tail; curr = curr->next)
    8000295c:	00048c63          	beqz	s1,80002974 <_ZN4_semD1Ev+0x44>
    80002960:	00893783          	ld	a5,8(s2)
    80002964:	00f48863          	beq	s1,a5,80002974 <_ZN4_semD1Ev+0x44>
            prev = curr;
    80002968:	00048713          	mv	a4,s1
        for (Elem *curr = head; curr && curr != tail; curr = curr->next)
    8000296c:	0084b483          	ld	s1,8(s1)
    80002970:	fedff06f          	j	8000295c <_ZN4_semD1Ev+0x2c>
        Elem *elem = tail;
    80002974:	00893503          	ld	a0,8(s2)
        if (prev) { prev->next = 0; }
    80002978:	02070063          	beqz	a4,80002998 <_ZN4_semD1Ev+0x68>
    8000297c:	00073423          	sd	zero,8(a4)
        tail = prev;
    80002980:	00e93423          	sd	a4,8(s2)
        T *ret = elem->data;
    80002984:	00053483          	ld	s1,0(a0)
        delete elem;
    80002988:	02050c63          	beqz	a0,800029c0 <_ZN4_semD1Ev+0x90>
    8000298c:	00000097          	auipc	ra,0x0
    80002990:	a00080e7          	jalr	-1536(ra) # 8000238c <_ZdlPv>
    80002994:	02c0006f          	j	800029c0 <_ZN4_semD1Ev+0x90>
        else { head = 0; }
    80002998:	0006b423          	sd	zero,8(a3)
    8000299c:	fe5ff06f          	j	80002980 <_ZN4_semD1Ev+0x50>
        Elem *elem = tail;
    800029a0:	00893503          	ld	a0,8(s2)
        if (prev) { prev->next = 0; }
    800029a4:	04078863          	beqz	a5,800029f4 <_ZN4_semD1Ev+0xc4>
    800029a8:	0007b423          	sd	zero,8(a5)
        tail = prev;
    800029ac:	00f93423          	sd	a5,8(s2)
        T *ret = elem->data;
    800029b0:	00053483          	ld	s1,0(a0)
        delete elem;
    800029b4:	00050663          	beqz	a0,800029c0 <_ZN4_semD1Ev+0x90>
    800029b8:	00000097          	auipc	ra,0x0
    800029bc:	9d4080e7          	jalr	-1580(ra) # 8000238c <_ZdlPv>
    while(t){
    800029c0:	02048e63          	beqz	s1,800029fc <_ZN4_semD1Ev+0xcc>
        Scheduler::put(t);
    800029c4:	00048513          	mv	a0,s1
    800029c8:	00000097          	auipc	ra,0x0
    800029cc:	254080e7          	jalr	596(ra) # 80002c1c <_ZN9Scheduler3putEP7_thread>
        if (!head) { return 0; }
    800029d0:	00093483          	ld	s1,0(s2)
    800029d4:	fe0486e3          	beqz	s1,800029c0 <_ZN4_semD1Ev+0x90>
        Elem *prev = 0;
    800029d8:	00000793          	li	a5,0
        for (Elem *curr = head; curr && curr != tail; curr = curr->next)
    800029dc:	fc0482e3          	beqz	s1,800029a0 <_ZN4_semD1Ev+0x70>
    800029e0:	00893703          	ld	a4,8(s2)
    800029e4:	fae48ee3          	beq	s1,a4,800029a0 <_ZN4_semD1Ev+0x70>
            prev = curr;
    800029e8:	00048793          	mv	a5,s1
        for (Elem *curr = head; curr && curr != tail; curr = curr->next)
    800029ec:	0084b483          	ld	s1,8(s1)
    800029f0:	fedff06f          	j	800029dc <_ZN4_semD1Ev+0xac>
        else { head = 0; }
    800029f4:	00093023          	sd	zero,0(s2)
    800029f8:	fb5ff06f          	j	800029ac <_ZN4_semD1Ev+0x7c>
        t = blockedThreadQueue.removeLast();
    }
//    unlock();
}
    800029fc:	01813083          	ld	ra,24(sp)
    80002a00:	01013403          	ld	s0,16(sp)
    80002a04:	00813483          	ld	s1,8(sp)
    80002a08:	00013903          	ld	s2,0(sp)
    80002a0c:	02010113          	addi	sp,sp,32
    80002a10:	00008067          	ret

0000000080002a14 <_ZN4_sem5blockEv>:

void _sem::block() {
    80002a14:	ff010113          	addi	sp,sp,-16
    80002a18:	00113423          	sd	ra,8(sp)
    80002a1c:	00813023          	sd	s0,0(sp)
    80002a20:	01010413          	addi	s0,sp,16

    _thread::running->blocked  = true;
    80002a24:	00004797          	auipc	a5,0x4
    80002a28:	5a47b783          	ld	a5,1444(a5) # 80006fc8 <_GLOBAL_OFFSET_TABLE_+0x18>
    80002a2c:	0007b783          	ld	a5,0(a5)
    80002a30:	00100713          	li	a4,1
    80002a34:	02e78c23          	sb	a4,56(a5)
    _thread::running->blockedBy = this;
    80002a38:	04a7b023          	sd	a0,64(a5)
    _thread::dispatch();
    80002a3c:	fffff097          	auipc	ra,0xfffff
    80002a40:	5cc080e7          	jalr	1484(ra) # 80002008 <_ZN7_thread8dispatchEv>
    //pozvace se zamena konteksta, ako je blocked = true u dispach()-u ce se ubaciti nit u blocked que
}
    80002a44:	00813083          	ld	ra,8(sp)
    80002a48:	00013403          	ld	s0,0(sp)
    80002a4c:	01010113          	addi	sp,sp,16
    80002a50:	00008067          	ret

0000000080002a54 <_ZN4_sem7deblockEv>:

void _sem::deblock(){
    80002a54:	fe010113          	addi	sp,sp,-32
    80002a58:	00113c23          	sd	ra,24(sp)
    80002a5c:	00813823          	sd	s0,16(sp)
    80002a60:	00913423          	sd	s1,8(sp)
    80002a64:	02010413          	addi	s0,sp,32
    80002a68:	00050793          	mv	a5,a0
        if (!head) { return 0; }
    80002a6c:	00853503          	ld	a0,8(a0)
    80002a70:	04050863          	beqz	a0,80002ac0 <_ZN4_sem7deblockEv+0x6c>
        head = head->next;
    80002a74:	00853703          	ld	a4,8(a0)
    80002a78:	00e7b423          	sd	a4,8(a5)
        if (!head) { tail = 0; }
    80002a7c:	02070e63          	beqz	a4,80002ab8 <_ZN4_sem7deblockEv+0x64>
        T *ret = elem->data;
    80002a80:	00053483          	ld	s1,0(a0)
        delete elem;
    80002a84:	00000097          	auipc	ra,0x0
    80002a88:	908080e7          	jalr	-1784(ra) # 8000238c <_ZdlPv>
    _thread *t = blockedThreadQueue.removeFirst();
    t->dblck();
    80002a8c:	00048513          	mv	a0,s1
    80002a90:	fffff097          	auipc	ra,0xfffff
    80002a94:	690080e7          	jalr	1680(ra) # 80002120 <_ZN7_thread5dblckEv>
    Scheduler::put(t);
    80002a98:	00048513          	mv	a0,s1
    80002a9c:	00000097          	auipc	ra,0x0
    80002aa0:	180080e7          	jalr	384(ra) # 80002c1c <_ZN9Scheduler3putEP7_thread>
}
    80002aa4:	01813083          	ld	ra,24(sp)
    80002aa8:	01013403          	ld	s0,16(sp)
    80002aac:	00813483          	ld	s1,8(sp)
    80002ab0:	02010113          	addi	sp,sp,32
    80002ab4:	00008067          	ret
        if (!head) { tail = 0; }
    80002ab8:	0007b823          	sd	zero,16(a5)
    80002abc:	fc5ff06f          	j	80002a80 <_ZN4_sem7deblockEv+0x2c>
        if (!head) { return 0; }
    80002ac0:	00050493          	mv	s1,a0
    80002ac4:	fc9ff06f          	j	80002a8c <_ZN4_sem7deblockEv+0x38>

0000000080002ac8 <_ZN4_sem4waitEv>:

int _sem::wait() {
//    lock();
    if(--val < 0)
    80002ac8:	00052783          	lw	a5,0(a0)
    80002acc:	fff7879b          	addiw	a5,a5,-1
    80002ad0:	00f52023          	sw	a5,0(a0)
    80002ad4:	02079713          	slli	a4,a5,0x20
    80002ad8:	00074663          	bltz	a4,80002ae4 <_ZN4_sem4waitEv+0x1c>
        block();
//    unlock();
    return 0;
}
    80002adc:	00000513          	li	a0,0
    80002ae0:	00008067          	ret
int _sem::wait() {
    80002ae4:	ff010113          	addi	sp,sp,-16
    80002ae8:	00113423          	sd	ra,8(sp)
    80002aec:	00813023          	sd	s0,0(sp)
    80002af0:	01010413          	addi	s0,sp,16
        block();
    80002af4:	00000097          	auipc	ra,0x0
    80002af8:	f20080e7          	jalr	-224(ra) # 80002a14 <_ZN4_sem5blockEv>
}
    80002afc:	00000513          	li	a0,0
    80002b00:	00813083          	ld	ra,8(sp)
    80002b04:	00013403          	ld	s0,0(sp)
    80002b08:	01010113          	addi	sp,sp,16
    80002b0c:	00008067          	ret

0000000080002b10 <_ZN4_sem6signalEv>:

int _sem::signal() {
//    lock();
    if(val++ < 0)
    80002b10:	00052783          	lw	a5,0(a0)
    80002b14:	0017871b          	addiw	a4,a5,1
    80002b18:	00e52023          	sw	a4,0(a0)
    80002b1c:	0007c663          	bltz	a5,80002b28 <_ZN4_sem6signalEv+0x18>
        deblock();
//    unlock();
    return 0;
}
    80002b20:	00000513          	li	a0,0
    80002b24:	00008067          	ret
int _sem::signal() {
    80002b28:	ff010113          	addi	sp,sp,-16
    80002b2c:	00113423          	sd	ra,8(sp)
    80002b30:	00813023          	sd	s0,0(sp)
    80002b34:	01010413          	addi	s0,sp,16
        deblock();
    80002b38:	00000097          	auipc	ra,0x0
    80002b3c:	f1c080e7          	jalr	-228(ra) # 80002a54 <_ZN4_sem7deblockEv>
}
    80002b40:	00000513          	li	a0,0
    80002b44:	00813083          	ld	ra,8(sp)
    80002b48:	00013403          	ld	s0,0(sp)
    80002b4c:	01010113          	addi	sp,sp,16
    80002b50:	00008067          	ret

0000000080002b54 <_ZN4_sem11blockedListEv>:

List<_thread>& _sem::blockedList(){
    80002b54:	ff010113          	addi	sp,sp,-16
    80002b58:	00813423          	sd	s0,8(sp)
    80002b5c:	01010413          	addi	s0,sp,16
    return _sem::blockedThreadQueue;
}
    80002b60:	00850513          	addi	a0,a0,8
    80002b64:	00813403          	ld	s0,8(sp)
    80002b68:	01010113          	addi	sp,sp,16
    80002b6c:	00008067          	ret

0000000080002b70 <_Z41__static_initialization_and_destruction_0ii>:
}

void Scheduler::put(_thread *ccb)
{
    readyThreadQueue.addLast(ccb);
    80002b70:	ff010113          	addi	sp,sp,-16
    80002b74:	00813423          	sd	s0,8(sp)
    80002b78:	01010413          	addi	s0,sp,16
    80002b7c:	00100793          	li	a5,1
    80002b80:	00f50863          	beq	a0,a5,80002b90 <_Z41__static_initialization_and_destruction_0ii+0x20>
    80002b84:	00813403          	ld	s0,8(sp)
    80002b88:	01010113          	addi	sp,sp,16
    80002b8c:	00008067          	ret
    80002b90:	000107b7          	lui	a5,0x10
    80002b94:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80002b98:	fef596e3          	bne	a1,a5,80002b84 <_Z41__static_initialization_and_destruction_0ii+0x14>
    List() : head(0), tail(0) {}
    80002b9c:	00004797          	auipc	a5,0x4
    80002ba0:	74478793          	addi	a5,a5,1860 # 800072e0 <_ZN9Scheduler16readyThreadQueueE>
    80002ba4:	0007b023          	sd	zero,0(a5)
    80002ba8:	0007b423          	sd	zero,8(a5)
    80002bac:	0007b823          	sd	zero,16(a5)
    80002bb0:	fd5ff06f          	j	80002b84 <_Z41__static_initialization_and_destruction_0ii+0x14>

0000000080002bb4 <_ZN9Scheduler3getEv>:
{
    80002bb4:	fe010113          	addi	sp,sp,-32
    80002bb8:	00113c23          	sd	ra,24(sp)
    80002bbc:	00813823          	sd	s0,16(sp)
    80002bc0:	00913423          	sd	s1,8(sp)
    80002bc4:	02010413          	addi	s0,sp,32
        if (!head) { return 0; }
    80002bc8:	00004517          	auipc	a0,0x4
    80002bcc:	71853503          	ld	a0,1816(a0) # 800072e0 <_ZN9Scheduler16readyThreadQueueE>
    80002bd0:	04050263          	beqz	a0,80002c14 <_ZN9Scheduler3getEv+0x60>
        head = head->next;
    80002bd4:	00853783          	ld	a5,8(a0)
    80002bd8:	00004717          	auipc	a4,0x4
    80002bdc:	70f73423          	sd	a5,1800(a4) # 800072e0 <_ZN9Scheduler16readyThreadQueueE>
        if (!head) { tail = 0; }
    80002be0:	02078463          	beqz	a5,80002c08 <_ZN9Scheduler3getEv+0x54>
        T *ret = elem->data;
    80002be4:	00053483          	ld	s1,0(a0)
        delete elem;
    80002be8:	fffff097          	auipc	ra,0xfffff
    80002bec:	7a4080e7          	jalr	1956(ra) # 8000238c <_ZdlPv>
}
    80002bf0:	00048513          	mv	a0,s1
    80002bf4:	01813083          	ld	ra,24(sp)
    80002bf8:	01013403          	ld	s0,16(sp)
    80002bfc:	00813483          	ld	s1,8(sp)
    80002c00:	02010113          	addi	sp,sp,32
    80002c04:	00008067          	ret
        if (!head) { tail = 0; }
    80002c08:	00004797          	auipc	a5,0x4
    80002c0c:	6e07b023          	sd	zero,1760(a5) # 800072e8 <_ZN9Scheduler16readyThreadQueueE+0x8>
    80002c10:	fd5ff06f          	j	80002be4 <_ZN9Scheduler3getEv+0x30>
        if (!head) { return 0; }
    80002c14:	00050493          	mv	s1,a0
    return readyThreadQueue.removeFirst();
    80002c18:	fd9ff06f          	j	80002bf0 <_ZN9Scheduler3getEv+0x3c>

0000000080002c1c <_ZN9Scheduler3putEP7_thread>:
{
    80002c1c:	fe010113          	addi	sp,sp,-32
    80002c20:	00113c23          	sd	ra,24(sp)
    80002c24:	00813823          	sd	s0,16(sp)
    80002c28:	00913423          	sd	s1,8(sp)
    80002c2c:	02010413          	addi	s0,sp,32
    80002c30:	00050493          	mv	s1,a0
        Elem *elem = new Elem(data, 0);
    80002c34:	01800513          	li	a0,24
    80002c38:	fffff097          	auipc	ra,0xfffff
    80002c3c:	704080e7          	jalr	1796(ra) # 8000233c <_Znwm>
        Elem(T *data, Elem *next, int sleepTime = 0) : data(data), next(next), sleepTime(sleepTime) {}
    80002c40:	00953023          	sd	s1,0(a0)
    80002c44:	00053423          	sd	zero,8(a0)
    80002c48:	00052823          	sw	zero,16(a0)
        if (tail)
    80002c4c:	00004797          	auipc	a5,0x4
    80002c50:	69c7b783          	ld	a5,1692(a5) # 800072e8 <_ZN9Scheduler16readyThreadQueueE+0x8>
    80002c54:	02078263          	beqz	a5,80002c78 <_ZN9Scheduler3putEP7_thread+0x5c>
            tail->next = elem;
    80002c58:	00a7b423          	sd	a0,8(a5)
            tail = elem;
    80002c5c:	00004797          	auipc	a5,0x4
    80002c60:	68a7b623          	sd	a0,1676(a5) # 800072e8 <_ZN9Scheduler16readyThreadQueueE+0x8>
    80002c64:	01813083          	ld	ra,24(sp)
    80002c68:	01013403          	ld	s0,16(sp)
    80002c6c:	00813483          	ld	s1,8(sp)
    80002c70:	02010113          	addi	sp,sp,32
    80002c74:	00008067          	ret
            head = tail = elem;
    80002c78:	00004797          	auipc	a5,0x4
    80002c7c:	66878793          	addi	a5,a5,1640 # 800072e0 <_ZN9Scheduler16readyThreadQueueE>
    80002c80:	00a7b423          	sd	a0,8(a5)
    80002c84:	00a7b023          	sd	a0,0(a5)
    80002c88:	fddff06f          	j	80002c64 <_ZN9Scheduler3putEP7_thread+0x48>

0000000080002c8c <_GLOBAL__sub_I__ZN9Scheduler16readyThreadQueueE>:
    80002c8c:	ff010113          	addi	sp,sp,-16
    80002c90:	00113423          	sd	ra,8(sp)
    80002c94:	00813023          	sd	s0,0(sp)
    80002c98:	01010413          	addi	s0,sp,16
    80002c9c:	000105b7          	lui	a1,0x10
    80002ca0:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    80002ca4:	00100513          	li	a0,1
    80002ca8:	00000097          	auipc	ra,0x0
    80002cac:	ec8080e7          	jalr	-312(ra) # 80002b70 <_Z41__static_initialization_and_destruction_0ii>
    80002cb0:	00813083          	ld	ra,8(sp)
    80002cb4:	00013403          	ld	s0,0(sp)
    80002cb8:	01010113          	addi	sp,sp,16
    80002cbc:	00008067          	ret

0000000080002cc0 <_ZN14KeyboardBuffer4takeEv>:
//    static KeyboardBuffer _instance;
//    return &_instance;
//}

//imlementacija uzeta iz zadatka sa klk3
char KeyboardBuffer::take () {
    80002cc0:	fe010113          	addi	sp,sp,-32
    80002cc4:	00113c23          	sd	ra,24(sp)
    80002cc8:	00813823          	sd	s0,16(sp)
    80002ccc:	00913423          	sd	s1,8(sp)
    80002cd0:	02010413          	addi	s0,sp,32
    80002cd4:	00050493          	mv	s1,a0
    itemAvailable->wait();
    80002cd8:	00053503          	ld	a0,0(a0)
    80002cdc:	00000097          	auipc	ra,0x0
    80002ce0:	dec080e7          	jalr	-532(ra) # 80002ac8 <_ZN4_sem4waitEv>
//    kbint_mask();
    char c = buffer[head];
    80002ce4:	1084b783          	ld	a5,264(s1)
    80002ce8:	00f48733          	add	a4,s1,a5
    80002cec:	00874503          	lbu	a0,8(a4)
    head = (head+1)%KB_SIZE;
    80002cf0:	00178793          	addi	a5,a5,1
    80002cf4:	0ff7f793          	andi	a5,a5,255
    80002cf8:	10f4b423          	sd	a5,264(s1)
    count--;
    80002cfc:	1184b783          	ld	a5,280(s1)
    80002d00:	fff78793          	addi	a5,a5,-1
    80002d04:	10f4bc23          	sd	a5,280(s1)
//    kbint_unmask();
    return c;
}
    80002d08:	01813083          	ld	ra,24(sp)
    80002d0c:	01013403          	ld	s0,16(sp)
    80002d10:	00813483          	ld	s1,8(sp)
    80002d14:	02010113          	addi	sp,sp,32
    80002d18:	00008067          	ret

0000000080002d1c <_ZN14KeyboardBuffer6appendEc>:
void KeyboardBuffer::append (char c) {
    if (count<KB_SIZE) {
    80002d1c:	11853783          	ld	a5,280(a0)
    80002d20:	0ff00713          	li	a4,255
    80002d24:	00f77463          	bgeu	a4,a5,80002d2c <_ZN14KeyboardBuffer6appendEc+0x10>
    80002d28:	00008067          	ret
void KeyboardBuffer::append (char c) {
    80002d2c:	ff010113          	addi	sp,sp,-16
    80002d30:	00113423          	sd	ra,8(sp)
    80002d34:	00813023          	sd	s0,0(sp)
    80002d38:	01010413          	addi	s0,sp,16
        buffer[tail] = c;
    80002d3c:	11053703          	ld	a4,272(a0)
    80002d40:	00e506b3          	add	a3,a0,a4
    80002d44:	00b68423          	sb	a1,8(a3)
        tail = (tail+1)%KB_SIZE;
    80002d48:	00170713          	addi	a4,a4,1
    80002d4c:	0ff77713          	andi	a4,a4,255
    80002d50:	10e53823          	sd	a4,272(a0)
        count++;
    80002d54:	00178793          	addi	a5,a5,1
    80002d58:	10f53c23          	sd	a5,280(a0)
        itemAvailable->signal();
    80002d5c:	00053503          	ld	a0,0(a0)
    80002d60:	00000097          	auipc	ra,0x0
    80002d64:	db0080e7          	jalr	-592(ra) # 80002b10 <_ZN4_sem6signalEv>
    }
    80002d68:	00813083          	ld	ra,8(sp)
    80002d6c:	00013403          	ld	s0,0(sp)
    80002d70:	01010113          	addi	sp,sp,16
    80002d74:	00008067          	ret

0000000080002d78 <_Z11printStringPKc>:
#include "../h/print.hpp"
#include "../h/riscv.hpp"
//#include "../lib/console.h"

void printString(char const *string)
{
    80002d78:	fd010113          	addi	sp,sp,-48
    80002d7c:	02113423          	sd	ra,40(sp)
    80002d80:	02813023          	sd	s0,32(sp)
    80002d84:	00913c23          	sd	s1,24(sp)
    80002d88:	01213823          	sd	s2,16(sp)
    80002d8c:	03010413          	addi	s0,sp,48
    80002d90:	00050493          	mv	s1,a0
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80002d94:	100027f3          	csrr	a5,sstatus
    80002d98:	fcf43c23          	sd	a5,-40(s0)
    return sstatus;
    80002d9c:	fd843903          	ld	s2,-40(s0)
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    80002da0:	00200793          	li	a5,2
    80002da4:	1007b073          	csrc	sstatus,a5
    uint64 sstatus = Riscv::r_sstatus();
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    while (*string != '\0')
    80002da8:	0004c503          	lbu	a0,0(s1)
    80002dac:	00050a63          	beqz	a0,80002dc0 <_Z11printStringPKc+0x48>
    {
        putc(*string);
    80002db0:	ffffe097          	auipc	ra,0xffffe
    80002db4:	6f4080e7          	jalr	1780(ra) # 800014a4 <_Z4putcc>
        string++;
    80002db8:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80002dbc:	fedff06f          	j	80002da8 <_Z11printStringPKc+0x30>
    }
    Riscv::ms_sstatus(sstatus & Riscv::SSTATUS_SIE ? Riscv::SSTATUS_SIE : 0);
    80002dc0:	0009091b          	sext.w	s2,s2
    80002dc4:	00297913          	andi	s2,s2,2
    80002dc8:	0009091b          	sext.w	s2,s2
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    80002dcc:	10092073          	csrs	sstatus,s2
}
    80002dd0:	02813083          	ld	ra,40(sp)
    80002dd4:	02013403          	ld	s0,32(sp)
    80002dd8:	01813483          	ld	s1,24(sp)
    80002ddc:	01013903          	ld	s2,16(sp)
    80002de0:	03010113          	addi	sp,sp,48
    80002de4:	00008067          	ret

0000000080002de8 <_Z12printIntegerm>:

void printInteger(uint64 integer)
{
    80002de8:	fc010113          	addi	sp,sp,-64
    80002dec:	02113c23          	sd	ra,56(sp)
    80002df0:	02813823          	sd	s0,48(sp)
    80002df4:	02913423          	sd	s1,40(sp)
    80002df8:	03213023          	sd	s2,32(sp)
    80002dfc:	04010413          	addi	s0,sp,64
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80002e00:	100027f3          	csrr	a5,sstatus
    80002e04:	fcf43423          	sd	a5,-56(s0)
    return sstatus;
    80002e08:	fc843903          	ld	s2,-56(s0)
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    80002e0c:	00200793          	li	a5,2
    80002e10:	1007b073          	csrc	sstatus,a5
    {
        neg = 1;
        x = -integer;
    } else
    {
        x = integer;
    80002e14:	0005051b          	sext.w	a0,a0
    }

    i = 0;
    80002e18:	00000493          	li	s1,0
    do
    {
        buf[i++] = digits[x % 10];
    80002e1c:	00a00613          	li	a2,10
    80002e20:	02c5773b          	remuw	a4,a0,a2
    80002e24:	02071693          	slli	a3,a4,0x20
    80002e28:	0206d693          	srli	a3,a3,0x20
    80002e2c:	00003717          	auipc	a4,0x3
    80002e30:	29c70713          	addi	a4,a4,668 # 800060c8 <_ZZ12printIntegermE6digits>
    80002e34:	00d70733          	add	a4,a4,a3
    80002e38:	00074703          	lbu	a4,0(a4)
    80002e3c:	fe040693          	addi	a3,s0,-32
    80002e40:	009687b3          	add	a5,a3,s1
    80002e44:	0014849b          	addiw	s1,s1,1
    80002e48:	fee78823          	sb	a4,-16(a5)
    } while ((x /= 10) != 0);
    80002e4c:	0005071b          	sext.w	a4,a0
    80002e50:	02c5553b          	divuw	a0,a0,a2
    80002e54:	00900793          	li	a5,9
    80002e58:	fce7e2e3          	bltu	a5,a4,80002e1c <_Z12printIntegerm+0x34>
    if (neg)
        buf[i++] = '-';

    while (--i >= 0) { putc(buf[i]); }
    80002e5c:	fff4849b          	addiw	s1,s1,-1
    80002e60:	0004ce63          	bltz	s1,80002e7c <_Z12printIntegerm+0x94>
    80002e64:	fe040793          	addi	a5,s0,-32
    80002e68:	009787b3          	add	a5,a5,s1
    80002e6c:	ff07c503          	lbu	a0,-16(a5)
    80002e70:	ffffe097          	auipc	ra,0xffffe
    80002e74:	634080e7          	jalr	1588(ra) # 800014a4 <_Z4putcc>
    80002e78:	fe5ff06f          	j	80002e5c <_Z12printIntegerm+0x74>
    Riscv::ms_sstatus(sstatus & Riscv::SSTATUS_SIE ? Riscv::SSTATUS_SIE : 0);
    80002e7c:	0009091b          	sext.w	s2,s2
    80002e80:	00297913          	andi	s2,s2,2
    80002e84:	0009091b          	sext.w	s2,s2
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    80002e88:	10092073          	csrs	sstatus,s2
    80002e8c:	03813083          	ld	ra,56(sp)
    80002e90:	03013403          	ld	s0,48(sp)
    80002e94:	02813483          	ld	s1,40(sp)
    80002e98:	02013903          	ld	s2,32(sp)
    80002e9c:	04010113          	addi	sp,sp,64
    80002ea0:	00008067          	ret

0000000080002ea4 <start>:
    80002ea4:	ff010113          	addi	sp,sp,-16
    80002ea8:	00813423          	sd	s0,8(sp)
    80002eac:	01010413          	addi	s0,sp,16
    80002eb0:	300027f3          	csrr	a5,mstatus
    80002eb4:	ffffe737          	lui	a4,0xffffe
    80002eb8:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff628f>
    80002ebc:	00e7f7b3          	and	a5,a5,a4
    80002ec0:	00001737          	lui	a4,0x1
    80002ec4:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80002ec8:	00e7e7b3          	or	a5,a5,a4
    80002ecc:	30079073          	csrw	mstatus,a5
    80002ed0:	00000797          	auipc	a5,0x0
    80002ed4:	16078793          	addi	a5,a5,352 # 80003030 <system_main>
    80002ed8:	34179073          	csrw	mepc,a5
    80002edc:	00000793          	li	a5,0
    80002ee0:	18079073          	csrw	satp,a5
    80002ee4:	000107b7          	lui	a5,0x10
    80002ee8:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80002eec:	30279073          	csrw	medeleg,a5
    80002ef0:	30379073          	csrw	mideleg,a5
    80002ef4:	104027f3          	csrr	a5,sie
    80002ef8:	2227e793          	ori	a5,a5,546
    80002efc:	10479073          	csrw	sie,a5
    80002f00:	fff00793          	li	a5,-1
    80002f04:	00a7d793          	srli	a5,a5,0xa
    80002f08:	3b079073          	csrw	pmpaddr0,a5
    80002f0c:	00f00793          	li	a5,15
    80002f10:	3a079073          	csrw	pmpcfg0,a5
    80002f14:	f14027f3          	csrr	a5,mhartid
    80002f18:	0200c737          	lui	a4,0x200c
    80002f1c:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80002f20:	0007869b          	sext.w	a3,a5
    80002f24:	00269713          	slli	a4,a3,0x2
    80002f28:	000f4637          	lui	a2,0xf4
    80002f2c:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80002f30:	00d70733          	add	a4,a4,a3
    80002f34:	0037979b          	slliw	a5,a5,0x3
    80002f38:	020046b7          	lui	a3,0x2004
    80002f3c:	00d787b3          	add	a5,a5,a3
    80002f40:	00c585b3          	add	a1,a1,a2
    80002f44:	00371693          	slli	a3,a4,0x3
    80002f48:	00004717          	auipc	a4,0x4
    80002f4c:	3b870713          	addi	a4,a4,952 # 80007300 <timer_scratch>
    80002f50:	00b7b023          	sd	a1,0(a5)
    80002f54:	00d70733          	add	a4,a4,a3
    80002f58:	00f73c23          	sd	a5,24(a4)
    80002f5c:	02c73023          	sd	a2,32(a4)
    80002f60:	34071073          	csrw	mscratch,a4
    80002f64:	00000797          	auipc	a5,0x0
    80002f68:	6ec78793          	addi	a5,a5,1772 # 80003650 <timervec>
    80002f6c:	30579073          	csrw	mtvec,a5
    80002f70:	300027f3          	csrr	a5,mstatus
    80002f74:	0087e793          	ori	a5,a5,8
    80002f78:	30079073          	csrw	mstatus,a5
    80002f7c:	304027f3          	csrr	a5,mie
    80002f80:	0807e793          	ori	a5,a5,128
    80002f84:	30479073          	csrw	mie,a5
    80002f88:	f14027f3          	csrr	a5,mhartid
    80002f8c:	0007879b          	sext.w	a5,a5
    80002f90:	00078213          	mv	tp,a5
    80002f94:	30200073          	mret
    80002f98:	00813403          	ld	s0,8(sp)
    80002f9c:	01010113          	addi	sp,sp,16
    80002fa0:	00008067          	ret

0000000080002fa4 <timerinit>:
    80002fa4:	ff010113          	addi	sp,sp,-16
    80002fa8:	00813423          	sd	s0,8(sp)
    80002fac:	01010413          	addi	s0,sp,16
    80002fb0:	f14027f3          	csrr	a5,mhartid
    80002fb4:	0200c737          	lui	a4,0x200c
    80002fb8:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80002fbc:	0007869b          	sext.w	a3,a5
    80002fc0:	00269713          	slli	a4,a3,0x2
    80002fc4:	000f4637          	lui	a2,0xf4
    80002fc8:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80002fcc:	00d70733          	add	a4,a4,a3
    80002fd0:	0037979b          	slliw	a5,a5,0x3
    80002fd4:	020046b7          	lui	a3,0x2004
    80002fd8:	00d787b3          	add	a5,a5,a3
    80002fdc:	00c585b3          	add	a1,a1,a2
    80002fe0:	00371693          	slli	a3,a4,0x3
    80002fe4:	00004717          	auipc	a4,0x4
    80002fe8:	31c70713          	addi	a4,a4,796 # 80007300 <timer_scratch>
    80002fec:	00b7b023          	sd	a1,0(a5)
    80002ff0:	00d70733          	add	a4,a4,a3
    80002ff4:	00f73c23          	sd	a5,24(a4)
    80002ff8:	02c73023          	sd	a2,32(a4)
    80002ffc:	34071073          	csrw	mscratch,a4
    80003000:	00000797          	auipc	a5,0x0
    80003004:	65078793          	addi	a5,a5,1616 # 80003650 <timervec>
    80003008:	30579073          	csrw	mtvec,a5
    8000300c:	300027f3          	csrr	a5,mstatus
    80003010:	0087e793          	ori	a5,a5,8
    80003014:	30079073          	csrw	mstatus,a5
    80003018:	304027f3          	csrr	a5,mie
    8000301c:	0807e793          	ori	a5,a5,128
    80003020:	30479073          	csrw	mie,a5
    80003024:	00813403          	ld	s0,8(sp)
    80003028:	01010113          	addi	sp,sp,16
    8000302c:	00008067          	ret

0000000080003030 <system_main>:
    80003030:	fe010113          	addi	sp,sp,-32
    80003034:	00813823          	sd	s0,16(sp)
    80003038:	00913423          	sd	s1,8(sp)
    8000303c:	00113c23          	sd	ra,24(sp)
    80003040:	02010413          	addi	s0,sp,32
    80003044:	00000097          	auipc	ra,0x0
    80003048:	0c4080e7          	jalr	196(ra) # 80003108 <cpuid>
    8000304c:	00004497          	auipc	s1,0x4
    80003050:	ff448493          	addi	s1,s1,-12 # 80007040 <started>
    80003054:	02050263          	beqz	a0,80003078 <system_main+0x48>
    80003058:	0004a783          	lw	a5,0(s1)
    8000305c:	0007879b          	sext.w	a5,a5
    80003060:	fe078ce3          	beqz	a5,80003058 <system_main+0x28>
    80003064:	0ff0000f          	fence
    80003068:	00003517          	auipc	a0,0x3
    8000306c:	0a050513          	addi	a0,a0,160 # 80006108 <_ZZ12printIntegermE6digits+0x40>
    80003070:	00001097          	auipc	ra,0x1
    80003074:	a7c080e7          	jalr	-1412(ra) # 80003aec <panic>
    80003078:	00001097          	auipc	ra,0x1
    8000307c:	9d0080e7          	jalr	-1584(ra) # 80003a48 <consoleinit>
    80003080:	00001097          	auipc	ra,0x1
    80003084:	15c080e7          	jalr	348(ra) # 800041dc <printfinit>
    80003088:	00003517          	auipc	a0,0x3
    8000308c:	02850513          	addi	a0,a0,40 # 800060b0 <CONSOLE_STATUS+0xa0>
    80003090:	00001097          	auipc	ra,0x1
    80003094:	ab8080e7          	jalr	-1352(ra) # 80003b48 <__printf>
    80003098:	00003517          	auipc	a0,0x3
    8000309c:	04050513          	addi	a0,a0,64 # 800060d8 <_ZZ12printIntegermE6digits+0x10>
    800030a0:	00001097          	auipc	ra,0x1
    800030a4:	aa8080e7          	jalr	-1368(ra) # 80003b48 <__printf>
    800030a8:	00003517          	auipc	a0,0x3
    800030ac:	00850513          	addi	a0,a0,8 # 800060b0 <CONSOLE_STATUS+0xa0>
    800030b0:	00001097          	auipc	ra,0x1
    800030b4:	a98080e7          	jalr	-1384(ra) # 80003b48 <__printf>
    800030b8:	00001097          	auipc	ra,0x1
    800030bc:	4b0080e7          	jalr	1200(ra) # 80004568 <kinit>
    800030c0:	00000097          	auipc	ra,0x0
    800030c4:	148080e7          	jalr	328(ra) # 80003208 <trapinit>
    800030c8:	00000097          	auipc	ra,0x0
    800030cc:	16c080e7          	jalr	364(ra) # 80003234 <trapinithart>
    800030d0:	00000097          	auipc	ra,0x0
    800030d4:	5c0080e7          	jalr	1472(ra) # 80003690 <plicinit>
    800030d8:	00000097          	auipc	ra,0x0
    800030dc:	5e0080e7          	jalr	1504(ra) # 800036b8 <plicinithart>
    800030e0:	00000097          	auipc	ra,0x0
    800030e4:	078080e7          	jalr	120(ra) # 80003158 <userinit>
    800030e8:	0ff0000f          	fence
    800030ec:	00100793          	li	a5,1
    800030f0:	00003517          	auipc	a0,0x3
    800030f4:	00050513          	mv	a0,a0
    800030f8:	00f4a023          	sw	a5,0(s1)
    800030fc:	00001097          	auipc	ra,0x1
    80003100:	a4c080e7          	jalr	-1460(ra) # 80003b48 <__printf>
    80003104:	0000006f          	j	80003104 <system_main+0xd4>

0000000080003108 <cpuid>:
    80003108:	ff010113          	addi	sp,sp,-16
    8000310c:	00813423          	sd	s0,8(sp)
    80003110:	01010413          	addi	s0,sp,16
    80003114:	00020513          	mv	a0,tp
    80003118:	00813403          	ld	s0,8(sp)
    8000311c:	0005051b          	sext.w	a0,a0
    80003120:	01010113          	addi	sp,sp,16
    80003124:	00008067          	ret

0000000080003128 <mycpu>:
    80003128:	ff010113          	addi	sp,sp,-16
    8000312c:	00813423          	sd	s0,8(sp)
    80003130:	01010413          	addi	s0,sp,16
    80003134:	00020793          	mv	a5,tp
    80003138:	00813403          	ld	s0,8(sp)
    8000313c:	0007879b          	sext.w	a5,a5
    80003140:	00779793          	slli	a5,a5,0x7
    80003144:	00005517          	auipc	a0,0x5
    80003148:	1ec50513          	addi	a0,a0,492 # 80008330 <cpus>
    8000314c:	00f50533          	add	a0,a0,a5
    80003150:	01010113          	addi	sp,sp,16
    80003154:	00008067          	ret

0000000080003158 <userinit>:
    80003158:	ff010113          	addi	sp,sp,-16
    8000315c:	00813423          	sd	s0,8(sp)
    80003160:	01010413          	addi	s0,sp,16
    80003164:	00813403          	ld	s0,8(sp)
    80003168:	01010113          	addi	sp,sp,16
    8000316c:	fffff317          	auipc	t1,0xfffff
    80003170:	a8030067          	jr	-1408(t1) # 80001bec <main>

0000000080003174 <either_copyout>:
    80003174:	ff010113          	addi	sp,sp,-16
    80003178:	00813023          	sd	s0,0(sp)
    8000317c:	00113423          	sd	ra,8(sp)
    80003180:	01010413          	addi	s0,sp,16
    80003184:	02051663          	bnez	a0,800031b0 <either_copyout+0x3c>
    80003188:	00058513          	mv	a0,a1
    8000318c:	00060593          	mv	a1,a2
    80003190:	0006861b          	sext.w	a2,a3
    80003194:	00002097          	auipc	ra,0x2
    80003198:	c60080e7          	jalr	-928(ra) # 80004df4 <__memmove>
    8000319c:	00813083          	ld	ra,8(sp)
    800031a0:	00013403          	ld	s0,0(sp)
    800031a4:	00000513          	li	a0,0
    800031a8:	01010113          	addi	sp,sp,16
    800031ac:	00008067          	ret
    800031b0:	00003517          	auipc	a0,0x3
    800031b4:	f8050513          	addi	a0,a0,-128 # 80006130 <_ZZ12printIntegermE6digits+0x68>
    800031b8:	00001097          	auipc	ra,0x1
    800031bc:	934080e7          	jalr	-1740(ra) # 80003aec <panic>

00000000800031c0 <either_copyin>:
    800031c0:	ff010113          	addi	sp,sp,-16
    800031c4:	00813023          	sd	s0,0(sp)
    800031c8:	00113423          	sd	ra,8(sp)
    800031cc:	01010413          	addi	s0,sp,16
    800031d0:	02059463          	bnez	a1,800031f8 <either_copyin+0x38>
    800031d4:	00060593          	mv	a1,a2
    800031d8:	0006861b          	sext.w	a2,a3
    800031dc:	00002097          	auipc	ra,0x2
    800031e0:	c18080e7          	jalr	-1000(ra) # 80004df4 <__memmove>
    800031e4:	00813083          	ld	ra,8(sp)
    800031e8:	00013403          	ld	s0,0(sp)
    800031ec:	00000513          	li	a0,0
    800031f0:	01010113          	addi	sp,sp,16
    800031f4:	00008067          	ret
    800031f8:	00003517          	auipc	a0,0x3
    800031fc:	f6050513          	addi	a0,a0,-160 # 80006158 <_ZZ12printIntegermE6digits+0x90>
    80003200:	00001097          	auipc	ra,0x1
    80003204:	8ec080e7          	jalr	-1812(ra) # 80003aec <panic>

0000000080003208 <trapinit>:
    80003208:	ff010113          	addi	sp,sp,-16
    8000320c:	00813423          	sd	s0,8(sp)
    80003210:	01010413          	addi	s0,sp,16
    80003214:	00813403          	ld	s0,8(sp)
    80003218:	00003597          	auipc	a1,0x3
    8000321c:	f6858593          	addi	a1,a1,-152 # 80006180 <_ZZ12printIntegermE6digits+0xb8>
    80003220:	00005517          	auipc	a0,0x5
    80003224:	19050513          	addi	a0,a0,400 # 800083b0 <tickslock>
    80003228:	01010113          	addi	sp,sp,16
    8000322c:	00001317          	auipc	t1,0x1
    80003230:	5cc30067          	jr	1484(t1) # 800047f8 <initlock>

0000000080003234 <trapinithart>:
    80003234:	ff010113          	addi	sp,sp,-16
    80003238:	00813423          	sd	s0,8(sp)
    8000323c:	01010413          	addi	s0,sp,16
    80003240:	00000797          	auipc	a5,0x0
    80003244:	30078793          	addi	a5,a5,768 # 80003540 <kernelvec>
    80003248:	10579073          	csrw	stvec,a5
    8000324c:	00813403          	ld	s0,8(sp)
    80003250:	01010113          	addi	sp,sp,16
    80003254:	00008067          	ret

0000000080003258 <usertrap>:
    80003258:	ff010113          	addi	sp,sp,-16
    8000325c:	00813423          	sd	s0,8(sp)
    80003260:	01010413          	addi	s0,sp,16
    80003264:	00813403          	ld	s0,8(sp)
    80003268:	01010113          	addi	sp,sp,16
    8000326c:	00008067          	ret

0000000080003270 <usertrapret>:
    80003270:	ff010113          	addi	sp,sp,-16
    80003274:	00813423          	sd	s0,8(sp)
    80003278:	01010413          	addi	s0,sp,16
    8000327c:	00813403          	ld	s0,8(sp)
    80003280:	01010113          	addi	sp,sp,16
    80003284:	00008067          	ret

0000000080003288 <kerneltrap>:
    80003288:	fe010113          	addi	sp,sp,-32
    8000328c:	00813823          	sd	s0,16(sp)
    80003290:	00113c23          	sd	ra,24(sp)
    80003294:	00913423          	sd	s1,8(sp)
    80003298:	02010413          	addi	s0,sp,32
    8000329c:	142025f3          	csrr	a1,scause
    800032a0:	100027f3          	csrr	a5,sstatus
    800032a4:	0027f793          	andi	a5,a5,2
    800032a8:	10079c63          	bnez	a5,800033c0 <kerneltrap+0x138>
    800032ac:	142027f3          	csrr	a5,scause
    800032b0:	0207ce63          	bltz	a5,800032ec <kerneltrap+0x64>
    800032b4:	00003517          	auipc	a0,0x3
    800032b8:	f1450513          	addi	a0,a0,-236 # 800061c8 <_ZZ12printIntegermE6digits+0x100>
    800032bc:	00001097          	auipc	ra,0x1
    800032c0:	88c080e7          	jalr	-1908(ra) # 80003b48 <__printf>
    800032c4:	141025f3          	csrr	a1,sepc
    800032c8:	14302673          	csrr	a2,stval
    800032cc:	00003517          	auipc	a0,0x3
    800032d0:	f0c50513          	addi	a0,a0,-244 # 800061d8 <_ZZ12printIntegermE6digits+0x110>
    800032d4:	00001097          	auipc	ra,0x1
    800032d8:	874080e7          	jalr	-1932(ra) # 80003b48 <__printf>
    800032dc:	00003517          	auipc	a0,0x3
    800032e0:	f1450513          	addi	a0,a0,-236 # 800061f0 <_ZZ12printIntegermE6digits+0x128>
    800032e4:	00001097          	auipc	ra,0x1
    800032e8:	808080e7          	jalr	-2040(ra) # 80003aec <panic>
    800032ec:	0ff7f713          	andi	a4,a5,255
    800032f0:	00900693          	li	a3,9
    800032f4:	04d70063          	beq	a4,a3,80003334 <kerneltrap+0xac>
    800032f8:	fff00713          	li	a4,-1
    800032fc:	03f71713          	slli	a4,a4,0x3f
    80003300:	00170713          	addi	a4,a4,1
    80003304:	fae798e3          	bne	a5,a4,800032b4 <kerneltrap+0x2c>
    80003308:	00000097          	auipc	ra,0x0
    8000330c:	e00080e7          	jalr	-512(ra) # 80003108 <cpuid>
    80003310:	06050663          	beqz	a0,8000337c <kerneltrap+0xf4>
    80003314:	144027f3          	csrr	a5,sip
    80003318:	ffd7f793          	andi	a5,a5,-3
    8000331c:	14479073          	csrw	sip,a5
    80003320:	01813083          	ld	ra,24(sp)
    80003324:	01013403          	ld	s0,16(sp)
    80003328:	00813483          	ld	s1,8(sp)
    8000332c:	02010113          	addi	sp,sp,32
    80003330:	00008067          	ret
    80003334:	00000097          	auipc	ra,0x0
    80003338:	3d0080e7          	jalr	976(ra) # 80003704 <plic_claim>
    8000333c:	00a00793          	li	a5,10
    80003340:	00050493          	mv	s1,a0
    80003344:	06f50863          	beq	a0,a5,800033b4 <kerneltrap+0x12c>
    80003348:	fc050ce3          	beqz	a0,80003320 <kerneltrap+0x98>
    8000334c:	00050593          	mv	a1,a0
    80003350:	00003517          	auipc	a0,0x3
    80003354:	e5850513          	addi	a0,a0,-424 # 800061a8 <_ZZ12printIntegermE6digits+0xe0>
    80003358:	00000097          	auipc	ra,0x0
    8000335c:	7f0080e7          	jalr	2032(ra) # 80003b48 <__printf>
    80003360:	01013403          	ld	s0,16(sp)
    80003364:	01813083          	ld	ra,24(sp)
    80003368:	00048513          	mv	a0,s1
    8000336c:	00813483          	ld	s1,8(sp)
    80003370:	02010113          	addi	sp,sp,32
    80003374:	00000317          	auipc	t1,0x0
    80003378:	3c830067          	jr	968(t1) # 8000373c <plic_complete>
    8000337c:	00005517          	auipc	a0,0x5
    80003380:	03450513          	addi	a0,a0,52 # 800083b0 <tickslock>
    80003384:	00001097          	auipc	ra,0x1
    80003388:	498080e7          	jalr	1176(ra) # 8000481c <acquire>
    8000338c:	00004717          	auipc	a4,0x4
    80003390:	cb870713          	addi	a4,a4,-840 # 80007044 <ticks>
    80003394:	00072783          	lw	a5,0(a4)
    80003398:	00005517          	auipc	a0,0x5
    8000339c:	01850513          	addi	a0,a0,24 # 800083b0 <tickslock>
    800033a0:	0017879b          	addiw	a5,a5,1
    800033a4:	00f72023          	sw	a5,0(a4)
    800033a8:	00001097          	auipc	ra,0x1
    800033ac:	540080e7          	jalr	1344(ra) # 800048e8 <release>
    800033b0:	f65ff06f          	j	80003314 <kerneltrap+0x8c>
    800033b4:	00001097          	auipc	ra,0x1
    800033b8:	09c080e7          	jalr	156(ra) # 80004450 <uartintr>
    800033bc:	fa5ff06f          	j	80003360 <kerneltrap+0xd8>
    800033c0:	00003517          	auipc	a0,0x3
    800033c4:	dc850513          	addi	a0,a0,-568 # 80006188 <_ZZ12printIntegermE6digits+0xc0>
    800033c8:	00000097          	auipc	ra,0x0
    800033cc:	724080e7          	jalr	1828(ra) # 80003aec <panic>

00000000800033d0 <clockintr>:
    800033d0:	fe010113          	addi	sp,sp,-32
    800033d4:	00813823          	sd	s0,16(sp)
    800033d8:	00913423          	sd	s1,8(sp)
    800033dc:	00113c23          	sd	ra,24(sp)
    800033e0:	02010413          	addi	s0,sp,32
    800033e4:	00005497          	auipc	s1,0x5
    800033e8:	fcc48493          	addi	s1,s1,-52 # 800083b0 <tickslock>
    800033ec:	00048513          	mv	a0,s1
    800033f0:	00001097          	auipc	ra,0x1
    800033f4:	42c080e7          	jalr	1068(ra) # 8000481c <acquire>
    800033f8:	00004717          	auipc	a4,0x4
    800033fc:	c4c70713          	addi	a4,a4,-948 # 80007044 <ticks>
    80003400:	00072783          	lw	a5,0(a4)
    80003404:	01013403          	ld	s0,16(sp)
    80003408:	01813083          	ld	ra,24(sp)
    8000340c:	00048513          	mv	a0,s1
    80003410:	0017879b          	addiw	a5,a5,1
    80003414:	00813483          	ld	s1,8(sp)
    80003418:	00f72023          	sw	a5,0(a4)
    8000341c:	02010113          	addi	sp,sp,32
    80003420:	00001317          	auipc	t1,0x1
    80003424:	4c830067          	jr	1224(t1) # 800048e8 <release>

0000000080003428 <devintr>:
    80003428:	142027f3          	csrr	a5,scause
    8000342c:	00000513          	li	a0,0
    80003430:	0007c463          	bltz	a5,80003438 <devintr+0x10>
    80003434:	00008067          	ret
    80003438:	fe010113          	addi	sp,sp,-32
    8000343c:	00813823          	sd	s0,16(sp)
    80003440:	00113c23          	sd	ra,24(sp)
    80003444:	00913423          	sd	s1,8(sp)
    80003448:	02010413          	addi	s0,sp,32
    8000344c:	0ff7f713          	andi	a4,a5,255
    80003450:	00900693          	li	a3,9
    80003454:	04d70c63          	beq	a4,a3,800034ac <devintr+0x84>
    80003458:	fff00713          	li	a4,-1
    8000345c:	03f71713          	slli	a4,a4,0x3f
    80003460:	00170713          	addi	a4,a4,1
    80003464:	00e78c63          	beq	a5,a4,8000347c <devintr+0x54>
    80003468:	01813083          	ld	ra,24(sp)
    8000346c:	01013403          	ld	s0,16(sp)
    80003470:	00813483          	ld	s1,8(sp)
    80003474:	02010113          	addi	sp,sp,32
    80003478:	00008067          	ret
    8000347c:	00000097          	auipc	ra,0x0
    80003480:	c8c080e7          	jalr	-884(ra) # 80003108 <cpuid>
    80003484:	06050663          	beqz	a0,800034f0 <devintr+0xc8>
    80003488:	144027f3          	csrr	a5,sip
    8000348c:	ffd7f793          	andi	a5,a5,-3
    80003490:	14479073          	csrw	sip,a5
    80003494:	01813083          	ld	ra,24(sp)
    80003498:	01013403          	ld	s0,16(sp)
    8000349c:	00813483          	ld	s1,8(sp)
    800034a0:	00200513          	li	a0,2
    800034a4:	02010113          	addi	sp,sp,32
    800034a8:	00008067          	ret
    800034ac:	00000097          	auipc	ra,0x0
    800034b0:	258080e7          	jalr	600(ra) # 80003704 <plic_claim>
    800034b4:	00a00793          	li	a5,10
    800034b8:	00050493          	mv	s1,a0
    800034bc:	06f50663          	beq	a0,a5,80003528 <devintr+0x100>
    800034c0:	00100513          	li	a0,1
    800034c4:	fa0482e3          	beqz	s1,80003468 <devintr+0x40>
    800034c8:	00048593          	mv	a1,s1
    800034cc:	00003517          	auipc	a0,0x3
    800034d0:	cdc50513          	addi	a0,a0,-804 # 800061a8 <_ZZ12printIntegermE6digits+0xe0>
    800034d4:	00000097          	auipc	ra,0x0
    800034d8:	674080e7          	jalr	1652(ra) # 80003b48 <__printf>
    800034dc:	00048513          	mv	a0,s1
    800034e0:	00000097          	auipc	ra,0x0
    800034e4:	25c080e7          	jalr	604(ra) # 8000373c <plic_complete>
    800034e8:	00100513          	li	a0,1
    800034ec:	f7dff06f          	j	80003468 <devintr+0x40>
    800034f0:	00005517          	auipc	a0,0x5
    800034f4:	ec050513          	addi	a0,a0,-320 # 800083b0 <tickslock>
    800034f8:	00001097          	auipc	ra,0x1
    800034fc:	324080e7          	jalr	804(ra) # 8000481c <acquire>
    80003500:	00004717          	auipc	a4,0x4
    80003504:	b4470713          	addi	a4,a4,-1212 # 80007044 <ticks>
    80003508:	00072783          	lw	a5,0(a4)
    8000350c:	00005517          	auipc	a0,0x5
    80003510:	ea450513          	addi	a0,a0,-348 # 800083b0 <tickslock>
    80003514:	0017879b          	addiw	a5,a5,1
    80003518:	00f72023          	sw	a5,0(a4)
    8000351c:	00001097          	auipc	ra,0x1
    80003520:	3cc080e7          	jalr	972(ra) # 800048e8 <release>
    80003524:	f65ff06f          	j	80003488 <devintr+0x60>
    80003528:	00001097          	auipc	ra,0x1
    8000352c:	f28080e7          	jalr	-216(ra) # 80004450 <uartintr>
    80003530:	fadff06f          	j	800034dc <devintr+0xb4>
	...

0000000080003540 <kernelvec>:
    80003540:	f0010113          	addi	sp,sp,-256
    80003544:	00113023          	sd	ra,0(sp)
    80003548:	00213423          	sd	sp,8(sp)
    8000354c:	00313823          	sd	gp,16(sp)
    80003550:	00413c23          	sd	tp,24(sp)
    80003554:	02513023          	sd	t0,32(sp)
    80003558:	02613423          	sd	t1,40(sp)
    8000355c:	02713823          	sd	t2,48(sp)
    80003560:	02813c23          	sd	s0,56(sp)
    80003564:	04913023          	sd	s1,64(sp)
    80003568:	04a13423          	sd	a0,72(sp)
    8000356c:	04b13823          	sd	a1,80(sp)
    80003570:	04c13c23          	sd	a2,88(sp)
    80003574:	06d13023          	sd	a3,96(sp)
    80003578:	06e13423          	sd	a4,104(sp)
    8000357c:	06f13823          	sd	a5,112(sp)
    80003580:	07013c23          	sd	a6,120(sp)
    80003584:	09113023          	sd	a7,128(sp)
    80003588:	09213423          	sd	s2,136(sp)
    8000358c:	09313823          	sd	s3,144(sp)
    80003590:	09413c23          	sd	s4,152(sp)
    80003594:	0b513023          	sd	s5,160(sp)
    80003598:	0b613423          	sd	s6,168(sp)
    8000359c:	0b713823          	sd	s7,176(sp)
    800035a0:	0b813c23          	sd	s8,184(sp)
    800035a4:	0d913023          	sd	s9,192(sp)
    800035a8:	0da13423          	sd	s10,200(sp)
    800035ac:	0db13823          	sd	s11,208(sp)
    800035b0:	0dc13c23          	sd	t3,216(sp)
    800035b4:	0fd13023          	sd	t4,224(sp)
    800035b8:	0fe13423          	sd	t5,232(sp)
    800035bc:	0ff13823          	sd	t6,240(sp)
    800035c0:	cc9ff0ef          	jal	ra,80003288 <kerneltrap>
    800035c4:	00013083          	ld	ra,0(sp)
    800035c8:	00813103          	ld	sp,8(sp)
    800035cc:	01013183          	ld	gp,16(sp)
    800035d0:	02013283          	ld	t0,32(sp)
    800035d4:	02813303          	ld	t1,40(sp)
    800035d8:	03013383          	ld	t2,48(sp)
    800035dc:	03813403          	ld	s0,56(sp)
    800035e0:	04013483          	ld	s1,64(sp)
    800035e4:	04813503          	ld	a0,72(sp)
    800035e8:	05013583          	ld	a1,80(sp)
    800035ec:	05813603          	ld	a2,88(sp)
    800035f0:	06013683          	ld	a3,96(sp)
    800035f4:	06813703          	ld	a4,104(sp)
    800035f8:	07013783          	ld	a5,112(sp)
    800035fc:	07813803          	ld	a6,120(sp)
    80003600:	08013883          	ld	a7,128(sp)
    80003604:	08813903          	ld	s2,136(sp)
    80003608:	09013983          	ld	s3,144(sp)
    8000360c:	09813a03          	ld	s4,152(sp)
    80003610:	0a013a83          	ld	s5,160(sp)
    80003614:	0a813b03          	ld	s6,168(sp)
    80003618:	0b013b83          	ld	s7,176(sp)
    8000361c:	0b813c03          	ld	s8,184(sp)
    80003620:	0c013c83          	ld	s9,192(sp)
    80003624:	0c813d03          	ld	s10,200(sp)
    80003628:	0d013d83          	ld	s11,208(sp)
    8000362c:	0d813e03          	ld	t3,216(sp)
    80003630:	0e013e83          	ld	t4,224(sp)
    80003634:	0e813f03          	ld	t5,232(sp)
    80003638:	0f013f83          	ld	t6,240(sp)
    8000363c:	10010113          	addi	sp,sp,256
    80003640:	10200073          	sret
    80003644:	00000013          	nop
    80003648:	00000013          	nop
    8000364c:	00000013          	nop

0000000080003650 <timervec>:
    80003650:	34051573          	csrrw	a0,mscratch,a0
    80003654:	00b53023          	sd	a1,0(a0)
    80003658:	00c53423          	sd	a2,8(a0)
    8000365c:	00d53823          	sd	a3,16(a0)
    80003660:	01853583          	ld	a1,24(a0)
    80003664:	02053603          	ld	a2,32(a0)
    80003668:	0005b683          	ld	a3,0(a1)
    8000366c:	00c686b3          	add	a3,a3,a2
    80003670:	00d5b023          	sd	a3,0(a1)
    80003674:	00200593          	li	a1,2
    80003678:	14459073          	csrw	sip,a1
    8000367c:	01053683          	ld	a3,16(a0)
    80003680:	00853603          	ld	a2,8(a0)
    80003684:	00053583          	ld	a1,0(a0)
    80003688:	34051573          	csrrw	a0,mscratch,a0
    8000368c:	30200073          	mret

0000000080003690 <plicinit>:
    80003690:	ff010113          	addi	sp,sp,-16
    80003694:	00813423          	sd	s0,8(sp)
    80003698:	01010413          	addi	s0,sp,16
    8000369c:	00813403          	ld	s0,8(sp)
    800036a0:	0c0007b7          	lui	a5,0xc000
    800036a4:	00100713          	li	a4,1
    800036a8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    800036ac:	00e7a223          	sw	a4,4(a5)
    800036b0:	01010113          	addi	sp,sp,16
    800036b4:	00008067          	ret

00000000800036b8 <plicinithart>:
    800036b8:	ff010113          	addi	sp,sp,-16
    800036bc:	00813023          	sd	s0,0(sp)
    800036c0:	00113423          	sd	ra,8(sp)
    800036c4:	01010413          	addi	s0,sp,16
    800036c8:	00000097          	auipc	ra,0x0
    800036cc:	a40080e7          	jalr	-1472(ra) # 80003108 <cpuid>
    800036d0:	0085171b          	slliw	a4,a0,0x8
    800036d4:	0c0027b7          	lui	a5,0xc002
    800036d8:	00e787b3          	add	a5,a5,a4
    800036dc:	40200713          	li	a4,1026
    800036e0:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    800036e4:	00813083          	ld	ra,8(sp)
    800036e8:	00013403          	ld	s0,0(sp)
    800036ec:	00d5151b          	slliw	a0,a0,0xd
    800036f0:	0c2017b7          	lui	a5,0xc201
    800036f4:	00a78533          	add	a0,a5,a0
    800036f8:	00052023          	sw	zero,0(a0)
    800036fc:	01010113          	addi	sp,sp,16
    80003700:	00008067          	ret

0000000080003704 <plic_claim>:
    80003704:	ff010113          	addi	sp,sp,-16
    80003708:	00813023          	sd	s0,0(sp)
    8000370c:	00113423          	sd	ra,8(sp)
    80003710:	01010413          	addi	s0,sp,16
    80003714:	00000097          	auipc	ra,0x0
    80003718:	9f4080e7          	jalr	-1548(ra) # 80003108 <cpuid>
    8000371c:	00813083          	ld	ra,8(sp)
    80003720:	00013403          	ld	s0,0(sp)
    80003724:	00d5151b          	slliw	a0,a0,0xd
    80003728:	0c2017b7          	lui	a5,0xc201
    8000372c:	00a78533          	add	a0,a5,a0
    80003730:	00452503          	lw	a0,4(a0)
    80003734:	01010113          	addi	sp,sp,16
    80003738:	00008067          	ret

000000008000373c <plic_complete>:
    8000373c:	fe010113          	addi	sp,sp,-32
    80003740:	00813823          	sd	s0,16(sp)
    80003744:	00913423          	sd	s1,8(sp)
    80003748:	00113c23          	sd	ra,24(sp)
    8000374c:	02010413          	addi	s0,sp,32
    80003750:	00050493          	mv	s1,a0
    80003754:	00000097          	auipc	ra,0x0
    80003758:	9b4080e7          	jalr	-1612(ra) # 80003108 <cpuid>
    8000375c:	01813083          	ld	ra,24(sp)
    80003760:	01013403          	ld	s0,16(sp)
    80003764:	00d5179b          	slliw	a5,a0,0xd
    80003768:	0c201737          	lui	a4,0xc201
    8000376c:	00f707b3          	add	a5,a4,a5
    80003770:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80003774:	00813483          	ld	s1,8(sp)
    80003778:	02010113          	addi	sp,sp,32
    8000377c:	00008067          	ret

0000000080003780 <consolewrite>:
    80003780:	fb010113          	addi	sp,sp,-80
    80003784:	04813023          	sd	s0,64(sp)
    80003788:	04113423          	sd	ra,72(sp)
    8000378c:	02913c23          	sd	s1,56(sp)
    80003790:	03213823          	sd	s2,48(sp)
    80003794:	03313423          	sd	s3,40(sp)
    80003798:	03413023          	sd	s4,32(sp)
    8000379c:	01513c23          	sd	s5,24(sp)
    800037a0:	05010413          	addi	s0,sp,80
    800037a4:	06c05c63          	blez	a2,8000381c <consolewrite+0x9c>
    800037a8:	00060993          	mv	s3,a2
    800037ac:	00050a13          	mv	s4,a0
    800037b0:	00058493          	mv	s1,a1
    800037b4:	00000913          	li	s2,0
    800037b8:	fff00a93          	li	s5,-1
    800037bc:	01c0006f          	j	800037d8 <consolewrite+0x58>
    800037c0:	fbf44503          	lbu	a0,-65(s0)
    800037c4:	0019091b          	addiw	s2,s2,1
    800037c8:	00148493          	addi	s1,s1,1
    800037cc:	00001097          	auipc	ra,0x1
    800037d0:	a9c080e7          	jalr	-1380(ra) # 80004268 <uartputc>
    800037d4:	03298063          	beq	s3,s2,800037f4 <consolewrite+0x74>
    800037d8:	00048613          	mv	a2,s1
    800037dc:	00100693          	li	a3,1
    800037e0:	000a0593          	mv	a1,s4
    800037e4:	fbf40513          	addi	a0,s0,-65
    800037e8:	00000097          	auipc	ra,0x0
    800037ec:	9d8080e7          	jalr	-1576(ra) # 800031c0 <either_copyin>
    800037f0:	fd5518e3          	bne	a0,s5,800037c0 <consolewrite+0x40>
    800037f4:	04813083          	ld	ra,72(sp)
    800037f8:	04013403          	ld	s0,64(sp)
    800037fc:	03813483          	ld	s1,56(sp)
    80003800:	02813983          	ld	s3,40(sp)
    80003804:	02013a03          	ld	s4,32(sp)
    80003808:	01813a83          	ld	s5,24(sp)
    8000380c:	00090513          	mv	a0,s2
    80003810:	03013903          	ld	s2,48(sp)
    80003814:	05010113          	addi	sp,sp,80
    80003818:	00008067          	ret
    8000381c:	00000913          	li	s2,0
    80003820:	fd5ff06f          	j	800037f4 <consolewrite+0x74>

0000000080003824 <consoleread>:
    80003824:	f9010113          	addi	sp,sp,-112
    80003828:	06813023          	sd	s0,96(sp)
    8000382c:	04913c23          	sd	s1,88(sp)
    80003830:	05213823          	sd	s2,80(sp)
    80003834:	05313423          	sd	s3,72(sp)
    80003838:	05413023          	sd	s4,64(sp)
    8000383c:	03513c23          	sd	s5,56(sp)
    80003840:	03613823          	sd	s6,48(sp)
    80003844:	03713423          	sd	s7,40(sp)
    80003848:	03813023          	sd	s8,32(sp)
    8000384c:	06113423          	sd	ra,104(sp)
    80003850:	01913c23          	sd	s9,24(sp)
    80003854:	07010413          	addi	s0,sp,112
    80003858:	00060b93          	mv	s7,a2
    8000385c:	00050913          	mv	s2,a0
    80003860:	00058c13          	mv	s8,a1
    80003864:	00060b1b          	sext.w	s6,a2
    80003868:	00005497          	auipc	s1,0x5
    8000386c:	b7048493          	addi	s1,s1,-1168 # 800083d8 <cons>
    80003870:	00400993          	li	s3,4
    80003874:	fff00a13          	li	s4,-1
    80003878:	00a00a93          	li	s5,10
    8000387c:	05705e63          	blez	s7,800038d8 <consoleread+0xb4>
    80003880:	09c4a703          	lw	a4,156(s1)
    80003884:	0984a783          	lw	a5,152(s1)
    80003888:	0007071b          	sext.w	a4,a4
    8000388c:	08e78463          	beq	a5,a4,80003914 <consoleread+0xf0>
    80003890:	07f7f713          	andi	a4,a5,127
    80003894:	00e48733          	add	a4,s1,a4
    80003898:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    8000389c:	0017869b          	addiw	a3,a5,1
    800038a0:	08d4ac23          	sw	a3,152(s1)
    800038a4:	00070c9b          	sext.w	s9,a4
    800038a8:	0b370663          	beq	a4,s3,80003954 <consoleread+0x130>
    800038ac:	00100693          	li	a3,1
    800038b0:	f9f40613          	addi	a2,s0,-97
    800038b4:	000c0593          	mv	a1,s8
    800038b8:	00090513          	mv	a0,s2
    800038bc:	f8e40fa3          	sb	a4,-97(s0)
    800038c0:	00000097          	auipc	ra,0x0
    800038c4:	8b4080e7          	jalr	-1868(ra) # 80003174 <either_copyout>
    800038c8:	01450863          	beq	a0,s4,800038d8 <consoleread+0xb4>
    800038cc:	001c0c13          	addi	s8,s8,1
    800038d0:	fffb8b9b          	addiw	s7,s7,-1
    800038d4:	fb5c94e3          	bne	s9,s5,8000387c <consoleread+0x58>
    800038d8:	000b851b          	sext.w	a0,s7
    800038dc:	06813083          	ld	ra,104(sp)
    800038e0:	06013403          	ld	s0,96(sp)
    800038e4:	05813483          	ld	s1,88(sp)
    800038e8:	05013903          	ld	s2,80(sp)
    800038ec:	04813983          	ld	s3,72(sp)
    800038f0:	04013a03          	ld	s4,64(sp)
    800038f4:	03813a83          	ld	s5,56(sp)
    800038f8:	02813b83          	ld	s7,40(sp)
    800038fc:	02013c03          	ld	s8,32(sp)
    80003900:	01813c83          	ld	s9,24(sp)
    80003904:	40ab053b          	subw	a0,s6,a0
    80003908:	03013b03          	ld	s6,48(sp)
    8000390c:	07010113          	addi	sp,sp,112
    80003910:	00008067          	ret
    80003914:	00001097          	auipc	ra,0x1
    80003918:	1d8080e7          	jalr	472(ra) # 80004aec <push_on>
    8000391c:	0984a703          	lw	a4,152(s1)
    80003920:	09c4a783          	lw	a5,156(s1)
    80003924:	0007879b          	sext.w	a5,a5
    80003928:	fef70ce3          	beq	a4,a5,80003920 <consoleread+0xfc>
    8000392c:	00001097          	auipc	ra,0x1
    80003930:	234080e7          	jalr	564(ra) # 80004b60 <pop_on>
    80003934:	0984a783          	lw	a5,152(s1)
    80003938:	07f7f713          	andi	a4,a5,127
    8000393c:	00e48733          	add	a4,s1,a4
    80003940:	01874703          	lbu	a4,24(a4)
    80003944:	0017869b          	addiw	a3,a5,1
    80003948:	08d4ac23          	sw	a3,152(s1)
    8000394c:	00070c9b          	sext.w	s9,a4
    80003950:	f5371ee3          	bne	a4,s3,800038ac <consoleread+0x88>
    80003954:	000b851b          	sext.w	a0,s7
    80003958:	f96bf2e3          	bgeu	s7,s6,800038dc <consoleread+0xb8>
    8000395c:	08f4ac23          	sw	a5,152(s1)
    80003960:	f7dff06f          	j	800038dc <consoleread+0xb8>

0000000080003964 <consputc>:
    80003964:	10000793          	li	a5,256
    80003968:	00f50663          	beq	a0,a5,80003974 <consputc+0x10>
    8000396c:	00001317          	auipc	t1,0x1
    80003970:	9f430067          	jr	-1548(t1) # 80004360 <uartputc_sync>
    80003974:	ff010113          	addi	sp,sp,-16
    80003978:	00113423          	sd	ra,8(sp)
    8000397c:	00813023          	sd	s0,0(sp)
    80003980:	01010413          	addi	s0,sp,16
    80003984:	00800513          	li	a0,8
    80003988:	00001097          	auipc	ra,0x1
    8000398c:	9d8080e7          	jalr	-1576(ra) # 80004360 <uartputc_sync>
    80003990:	02000513          	li	a0,32
    80003994:	00001097          	auipc	ra,0x1
    80003998:	9cc080e7          	jalr	-1588(ra) # 80004360 <uartputc_sync>
    8000399c:	00013403          	ld	s0,0(sp)
    800039a0:	00813083          	ld	ra,8(sp)
    800039a4:	00800513          	li	a0,8
    800039a8:	01010113          	addi	sp,sp,16
    800039ac:	00001317          	auipc	t1,0x1
    800039b0:	9b430067          	jr	-1612(t1) # 80004360 <uartputc_sync>

00000000800039b4 <consoleintr>:
    800039b4:	fe010113          	addi	sp,sp,-32
    800039b8:	00813823          	sd	s0,16(sp)
    800039bc:	00913423          	sd	s1,8(sp)
    800039c0:	01213023          	sd	s2,0(sp)
    800039c4:	00113c23          	sd	ra,24(sp)
    800039c8:	02010413          	addi	s0,sp,32
    800039cc:	00005917          	auipc	s2,0x5
    800039d0:	a0c90913          	addi	s2,s2,-1524 # 800083d8 <cons>
    800039d4:	00050493          	mv	s1,a0
    800039d8:	00090513          	mv	a0,s2
    800039dc:	00001097          	auipc	ra,0x1
    800039e0:	e40080e7          	jalr	-448(ra) # 8000481c <acquire>
    800039e4:	02048c63          	beqz	s1,80003a1c <consoleintr+0x68>
    800039e8:	0a092783          	lw	a5,160(s2)
    800039ec:	09892703          	lw	a4,152(s2)
    800039f0:	07f00693          	li	a3,127
    800039f4:	40e7873b          	subw	a4,a5,a4
    800039f8:	02e6e263          	bltu	a3,a4,80003a1c <consoleintr+0x68>
    800039fc:	00d00713          	li	a4,13
    80003a00:	04e48063          	beq	s1,a4,80003a40 <consoleintr+0x8c>
    80003a04:	07f7f713          	andi	a4,a5,127
    80003a08:	00e90733          	add	a4,s2,a4
    80003a0c:	0017879b          	addiw	a5,a5,1
    80003a10:	0af92023          	sw	a5,160(s2)
    80003a14:	00970c23          	sb	s1,24(a4)
    80003a18:	08f92e23          	sw	a5,156(s2)
    80003a1c:	01013403          	ld	s0,16(sp)
    80003a20:	01813083          	ld	ra,24(sp)
    80003a24:	00813483          	ld	s1,8(sp)
    80003a28:	00013903          	ld	s2,0(sp)
    80003a2c:	00005517          	auipc	a0,0x5
    80003a30:	9ac50513          	addi	a0,a0,-1620 # 800083d8 <cons>
    80003a34:	02010113          	addi	sp,sp,32
    80003a38:	00001317          	auipc	t1,0x1
    80003a3c:	eb030067          	jr	-336(t1) # 800048e8 <release>
    80003a40:	00a00493          	li	s1,10
    80003a44:	fc1ff06f          	j	80003a04 <consoleintr+0x50>

0000000080003a48 <consoleinit>:
    80003a48:	fe010113          	addi	sp,sp,-32
    80003a4c:	00113c23          	sd	ra,24(sp)
    80003a50:	00813823          	sd	s0,16(sp)
    80003a54:	00913423          	sd	s1,8(sp)
    80003a58:	02010413          	addi	s0,sp,32
    80003a5c:	00005497          	auipc	s1,0x5
    80003a60:	97c48493          	addi	s1,s1,-1668 # 800083d8 <cons>
    80003a64:	00048513          	mv	a0,s1
    80003a68:	00002597          	auipc	a1,0x2
    80003a6c:	79858593          	addi	a1,a1,1944 # 80006200 <_ZZ12printIntegermE6digits+0x138>
    80003a70:	00001097          	auipc	ra,0x1
    80003a74:	d88080e7          	jalr	-632(ra) # 800047f8 <initlock>
    80003a78:	00000097          	auipc	ra,0x0
    80003a7c:	7ac080e7          	jalr	1964(ra) # 80004224 <uartinit>
    80003a80:	01813083          	ld	ra,24(sp)
    80003a84:	01013403          	ld	s0,16(sp)
    80003a88:	00000797          	auipc	a5,0x0
    80003a8c:	d9c78793          	addi	a5,a5,-612 # 80003824 <consoleread>
    80003a90:	0af4bc23          	sd	a5,184(s1)
    80003a94:	00000797          	auipc	a5,0x0
    80003a98:	cec78793          	addi	a5,a5,-788 # 80003780 <consolewrite>
    80003a9c:	0cf4b023          	sd	a5,192(s1)
    80003aa0:	00813483          	ld	s1,8(sp)
    80003aa4:	02010113          	addi	sp,sp,32
    80003aa8:	00008067          	ret

0000000080003aac <console_read>:
    80003aac:	ff010113          	addi	sp,sp,-16
    80003ab0:	00813423          	sd	s0,8(sp)
    80003ab4:	01010413          	addi	s0,sp,16
    80003ab8:	00813403          	ld	s0,8(sp)
    80003abc:	00005317          	auipc	t1,0x5
    80003ac0:	9d433303          	ld	t1,-1580(t1) # 80008490 <devsw+0x10>
    80003ac4:	01010113          	addi	sp,sp,16
    80003ac8:	00030067          	jr	t1

0000000080003acc <console_write>:
    80003acc:	ff010113          	addi	sp,sp,-16
    80003ad0:	00813423          	sd	s0,8(sp)
    80003ad4:	01010413          	addi	s0,sp,16
    80003ad8:	00813403          	ld	s0,8(sp)
    80003adc:	00005317          	auipc	t1,0x5
    80003ae0:	9bc33303          	ld	t1,-1604(t1) # 80008498 <devsw+0x18>
    80003ae4:	01010113          	addi	sp,sp,16
    80003ae8:	00030067          	jr	t1

0000000080003aec <panic>:
    80003aec:	fe010113          	addi	sp,sp,-32
    80003af0:	00113c23          	sd	ra,24(sp)
    80003af4:	00813823          	sd	s0,16(sp)
    80003af8:	00913423          	sd	s1,8(sp)
    80003afc:	02010413          	addi	s0,sp,32
    80003b00:	00050493          	mv	s1,a0
    80003b04:	00002517          	auipc	a0,0x2
    80003b08:	70450513          	addi	a0,a0,1796 # 80006208 <_ZZ12printIntegermE6digits+0x140>
    80003b0c:	00005797          	auipc	a5,0x5
    80003b10:	a207a623          	sw	zero,-1492(a5) # 80008538 <pr+0x18>
    80003b14:	00000097          	auipc	ra,0x0
    80003b18:	034080e7          	jalr	52(ra) # 80003b48 <__printf>
    80003b1c:	00048513          	mv	a0,s1
    80003b20:	00000097          	auipc	ra,0x0
    80003b24:	028080e7          	jalr	40(ra) # 80003b48 <__printf>
    80003b28:	00002517          	auipc	a0,0x2
    80003b2c:	58850513          	addi	a0,a0,1416 # 800060b0 <CONSOLE_STATUS+0xa0>
    80003b30:	00000097          	auipc	ra,0x0
    80003b34:	018080e7          	jalr	24(ra) # 80003b48 <__printf>
    80003b38:	00100793          	li	a5,1
    80003b3c:	00003717          	auipc	a4,0x3
    80003b40:	50f72623          	sw	a5,1292(a4) # 80007048 <panicked>
    80003b44:	0000006f          	j	80003b44 <panic+0x58>

0000000080003b48 <__printf>:
    80003b48:	f3010113          	addi	sp,sp,-208
    80003b4c:	08813023          	sd	s0,128(sp)
    80003b50:	07313423          	sd	s3,104(sp)
    80003b54:	09010413          	addi	s0,sp,144
    80003b58:	05813023          	sd	s8,64(sp)
    80003b5c:	08113423          	sd	ra,136(sp)
    80003b60:	06913c23          	sd	s1,120(sp)
    80003b64:	07213823          	sd	s2,112(sp)
    80003b68:	07413023          	sd	s4,96(sp)
    80003b6c:	05513c23          	sd	s5,88(sp)
    80003b70:	05613823          	sd	s6,80(sp)
    80003b74:	05713423          	sd	s7,72(sp)
    80003b78:	03913c23          	sd	s9,56(sp)
    80003b7c:	03a13823          	sd	s10,48(sp)
    80003b80:	03b13423          	sd	s11,40(sp)
    80003b84:	00005317          	auipc	t1,0x5
    80003b88:	99c30313          	addi	t1,t1,-1636 # 80008520 <pr>
    80003b8c:	01832c03          	lw	s8,24(t1)
    80003b90:	00b43423          	sd	a1,8(s0)
    80003b94:	00c43823          	sd	a2,16(s0)
    80003b98:	00d43c23          	sd	a3,24(s0)
    80003b9c:	02e43023          	sd	a4,32(s0)
    80003ba0:	02f43423          	sd	a5,40(s0)
    80003ba4:	03043823          	sd	a6,48(s0)
    80003ba8:	03143c23          	sd	a7,56(s0)
    80003bac:	00050993          	mv	s3,a0
    80003bb0:	4a0c1663          	bnez	s8,8000405c <__printf+0x514>
    80003bb4:	60098c63          	beqz	s3,800041cc <__printf+0x684>
    80003bb8:	0009c503          	lbu	a0,0(s3)
    80003bbc:	00840793          	addi	a5,s0,8
    80003bc0:	f6f43c23          	sd	a5,-136(s0)
    80003bc4:	00000493          	li	s1,0
    80003bc8:	22050063          	beqz	a0,80003de8 <__printf+0x2a0>
    80003bcc:	00002a37          	lui	s4,0x2
    80003bd0:	00018ab7          	lui	s5,0x18
    80003bd4:	000f4b37          	lui	s6,0xf4
    80003bd8:	00989bb7          	lui	s7,0x989
    80003bdc:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80003be0:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80003be4:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80003be8:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80003bec:	00148c9b          	addiw	s9,s1,1
    80003bf0:	02500793          	li	a5,37
    80003bf4:	01998933          	add	s2,s3,s9
    80003bf8:	38f51263          	bne	a0,a5,80003f7c <__printf+0x434>
    80003bfc:	00094783          	lbu	a5,0(s2)
    80003c00:	00078c9b          	sext.w	s9,a5
    80003c04:	1e078263          	beqz	a5,80003de8 <__printf+0x2a0>
    80003c08:	0024849b          	addiw	s1,s1,2
    80003c0c:	07000713          	li	a4,112
    80003c10:	00998933          	add	s2,s3,s1
    80003c14:	38e78a63          	beq	a5,a4,80003fa8 <__printf+0x460>
    80003c18:	20f76863          	bltu	a4,a5,80003e28 <__printf+0x2e0>
    80003c1c:	42a78863          	beq	a5,a0,8000404c <__printf+0x504>
    80003c20:	06400713          	li	a4,100
    80003c24:	40e79663          	bne	a5,a4,80004030 <__printf+0x4e8>
    80003c28:	f7843783          	ld	a5,-136(s0)
    80003c2c:	0007a603          	lw	a2,0(a5)
    80003c30:	00878793          	addi	a5,a5,8
    80003c34:	f6f43c23          	sd	a5,-136(s0)
    80003c38:	42064a63          	bltz	a2,8000406c <__printf+0x524>
    80003c3c:	00a00713          	li	a4,10
    80003c40:	02e677bb          	remuw	a5,a2,a4
    80003c44:	00002d97          	auipc	s11,0x2
    80003c48:	5ecd8d93          	addi	s11,s11,1516 # 80006230 <digits>
    80003c4c:	00900593          	li	a1,9
    80003c50:	0006051b          	sext.w	a0,a2
    80003c54:	00000c93          	li	s9,0
    80003c58:	02079793          	slli	a5,a5,0x20
    80003c5c:	0207d793          	srli	a5,a5,0x20
    80003c60:	00fd87b3          	add	a5,s11,a5
    80003c64:	0007c783          	lbu	a5,0(a5)
    80003c68:	02e656bb          	divuw	a3,a2,a4
    80003c6c:	f8f40023          	sb	a5,-128(s0)
    80003c70:	14c5d863          	bge	a1,a2,80003dc0 <__printf+0x278>
    80003c74:	06300593          	li	a1,99
    80003c78:	00100c93          	li	s9,1
    80003c7c:	02e6f7bb          	remuw	a5,a3,a4
    80003c80:	02079793          	slli	a5,a5,0x20
    80003c84:	0207d793          	srli	a5,a5,0x20
    80003c88:	00fd87b3          	add	a5,s11,a5
    80003c8c:	0007c783          	lbu	a5,0(a5)
    80003c90:	02e6d73b          	divuw	a4,a3,a4
    80003c94:	f8f400a3          	sb	a5,-127(s0)
    80003c98:	12a5f463          	bgeu	a1,a0,80003dc0 <__printf+0x278>
    80003c9c:	00a00693          	li	a3,10
    80003ca0:	00900593          	li	a1,9
    80003ca4:	02d777bb          	remuw	a5,a4,a3
    80003ca8:	02079793          	slli	a5,a5,0x20
    80003cac:	0207d793          	srli	a5,a5,0x20
    80003cb0:	00fd87b3          	add	a5,s11,a5
    80003cb4:	0007c503          	lbu	a0,0(a5)
    80003cb8:	02d757bb          	divuw	a5,a4,a3
    80003cbc:	f8a40123          	sb	a0,-126(s0)
    80003cc0:	48e5f263          	bgeu	a1,a4,80004144 <__printf+0x5fc>
    80003cc4:	06300513          	li	a0,99
    80003cc8:	02d7f5bb          	remuw	a1,a5,a3
    80003ccc:	02059593          	slli	a1,a1,0x20
    80003cd0:	0205d593          	srli	a1,a1,0x20
    80003cd4:	00bd85b3          	add	a1,s11,a1
    80003cd8:	0005c583          	lbu	a1,0(a1)
    80003cdc:	02d7d7bb          	divuw	a5,a5,a3
    80003ce0:	f8b401a3          	sb	a1,-125(s0)
    80003ce4:	48e57263          	bgeu	a0,a4,80004168 <__printf+0x620>
    80003ce8:	3e700513          	li	a0,999
    80003cec:	02d7f5bb          	remuw	a1,a5,a3
    80003cf0:	02059593          	slli	a1,a1,0x20
    80003cf4:	0205d593          	srli	a1,a1,0x20
    80003cf8:	00bd85b3          	add	a1,s11,a1
    80003cfc:	0005c583          	lbu	a1,0(a1)
    80003d00:	02d7d7bb          	divuw	a5,a5,a3
    80003d04:	f8b40223          	sb	a1,-124(s0)
    80003d08:	46e57663          	bgeu	a0,a4,80004174 <__printf+0x62c>
    80003d0c:	02d7f5bb          	remuw	a1,a5,a3
    80003d10:	02059593          	slli	a1,a1,0x20
    80003d14:	0205d593          	srli	a1,a1,0x20
    80003d18:	00bd85b3          	add	a1,s11,a1
    80003d1c:	0005c583          	lbu	a1,0(a1)
    80003d20:	02d7d7bb          	divuw	a5,a5,a3
    80003d24:	f8b402a3          	sb	a1,-123(s0)
    80003d28:	46ea7863          	bgeu	s4,a4,80004198 <__printf+0x650>
    80003d2c:	02d7f5bb          	remuw	a1,a5,a3
    80003d30:	02059593          	slli	a1,a1,0x20
    80003d34:	0205d593          	srli	a1,a1,0x20
    80003d38:	00bd85b3          	add	a1,s11,a1
    80003d3c:	0005c583          	lbu	a1,0(a1)
    80003d40:	02d7d7bb          	divuw	a5,a5,a3
    80003d44:	f8b40323          	sb	a1,-122(s0)
    80003d48:	3eeaf863          	bgeu	s5,a4,80004138 <__printf+0x5f0>
    80003d4c:	02d7f5bb          	remuw	a1,a5,a3
    80003d50:	02059593          	slli	a1,a1,0x20
    80003d54:	0205d593          	srli	a1,a1,0x20
    80003d58:	00bd85b3          	add	a1,s11,a1
    80003d5c:	0005c583          	lbu	a1,0(a1)
    80003d60:	02d7d7bb          	divuw	a5,a5,a3
    80003d64:	f8b403a3          	sb	a1,-121(s0)
    80003d68:	42eb7e63          	bgeu	s6,a4,800041a4 <__printf+0x65c>
    80003d6c:	02d7f5bb          	remuw	a1,a5,a3
    80003d70:	02059593          	slli	a1,a1,0x20
    80003d74:	0205d593          	srli	a1,a1,0x20
    80003d78:	00bd85b3          	add	a1,s11,a1
    80003d7c:	0005c583          	lbu	a1,0(a1)
    80003d80:	02d7d7bb          	divuw	a5,a5,a3
    80003d84:	f8b40423          	sb	a1,-120(s0)
    80003d88:	42ebfc63          	bgeu	s7,a4,800041c0 <__printf+0x678>
    80003d8c:	02079793          	slli	a5,a5,0x20
    80003d90:	0207d793          	srli	a5,a5,0x20
    80003d94:	00fd8db3          	add	s11,s11,a5
    80003d98:	000dc703          	lbu	a4,0(s11)
    80003d9c:	00a00793          	li	a5,10
    80003da0:	00900c93          	li	s9,9
    80003da4:	f8e404a3          	sb	a4,-119(s0)
    80003da8:	00065c63          	bgez	a2,80003dc0 <__printf+0x278>
    80003dac:	f9040713          	addi	a4,s0,-112
    80003db0:	00f70733          	add	a4,a4,a5
    80003db4:	02d00693          	li	a3,45
    80003db8:	fed70823          	sb	a3,-16(a4)
    80003dbc:	00078c93          	mv	s9,a5
    80003dc0:	f8040793          	addi	a5,s0,-128
    80003dc4:	01978cb3          	add	s9,a5,s9
    80003dc8:	f7f40d13          	addi	s10,s0,-129
    80003dcc:	000cc503          	lbu	a0,0(s9)
    80003dd0:	fffc8c93          	addi	s9,s9,-1
    80003dd4:	00000097          	auipc	ra,0x0
    80003dd8:	b90080e7          	jalr	-1136(ra) # 80003964 <consputc>
    80003ddc:	ffac98e3          	bne	s9,s10,80003dcc <__printf+0x284>
    80003de0:	00094503          	lbu	a0,0(s2)
    80003de4:	e00514e3          	bnez	a0,80003bec <__printf+0xa4>
    80003de8:	1a0c1663          	bnez	s8,80003f94 <__printf+0x44c>
    80003dec:	08813083          	ld	ra,136(sp)
    80003df0:	08013403          	ld	s0,128(sp)
    80003df4:	07813483          	ld	s1,120(sp)
    80003df8:	07013903          	ld	s2,112(sp)
    80003dfc:	06813983          	ld	s3,104(sp)
    80003e00:	06013a03          	ld	s4,96(sp)
    80003e04:	05813a83          	ld	s5,88(sp)
    80003e08:	05013b03          	ld	s6,80(sp)
    80003e0c:	04813b83          	ld	s7,72(sp)
    80003e10:	04013c03          	ld	s8,64(sp)
    80003e14:	03813c83          	ld	s9,56(sp)
    80003e18:	03013d03          	ld	s10,48(sp)
    80003e1c:	02813d83          	ld	s11,40(sp)
    80003e20:	0d010113          	addi	sp,sp,208
    80003e24:	00008067          	ret
    80003e28:	07300713          	li	a4,115
    80003e2c:	1ce78a63          	beq	a5,a4,80004000 <__printf+0x4b8>
    80003e30:	07800713          	li	a4,120
    80003e34:	1ee79e63          	bne	a5,a4,80004030 <__printf+0x4e8>
    80003e38:	f7843783          	ld	a5,-136(s0)
    80003e3c:	0007a703          	lw	a4,0(a5)
    80003e40:	00878793          	addi	a5,a5,8
    80003e44:	f6f43c23          	sd	a5,-136(s0)
    80003e48:	28074263          	bltz	a4,800040cc <__printf+0x584>
    80003e4c:	00002d97          	auipc	s11,0x2
    80003e50:	3e4d8d93          	addi	s11,s11,996 # 80006230 <digits>
    80003e54:	00f77793          	andi	a5,a4,15
    80003e58:	00fd87b3          	add	a5,s11,a5
    80003e5c:	0007c683          	lbu	a3,0(a5)
    80003e60:	00f00613          	li	a2,15
    80003e64:	0007079b          	sext.w	a5,a4
    80003e68:	f8d40023          	sb	a3,-128(s0)
    80003e6c:	0047559b          	srliw	a1,a4,0x4
    80003e70:	0047569b          	srliw	a3,a4,0x4
    80003e74:	00000c93          	li	s9,0
    80003e78:	0ee65063          	bge	a2,a4,80003f58 <__printf+0x410>
    80003e7c:	00f6f693          	andi	a3,a3,15
    80003e80:	00dd86b3          	add	a3,s11,a3
    80003e84:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80003e88:	0087d79b          	srliw	a5,a5,0x8
    80003e8c:	00100c93          	li	s9,1
    80003e90:	f8d400a3          	sb	a3,-127(s0)
    80003e94:	0cb67263          	bgeu	a2,a1,80003f58 <__printf+0x410>
    80003e98:	00f7f693          	andi	a3,a5,15
    80003e9c:	00dd86b3          	add	a3,s11,a3
    80003ea0:	0006c583          	lbu	a1,0(a3)
    80003ea4:	00f00613          	li	a2,15
    80003ea8:	0047d69b          	srliw	a3,a5,0x4
    80003eac:	f8b40123          	sb	a1,-126(s0)
    80003eb0:	0047d593          	srli	a1,a5,0x4
    80003eb4:	28f67e63          	bgeu	a2,a5,80004150 <__printf+0x608>
    80003eb8:	00f6f693          	andi	a3,a3,15
    80003ebc:	00dd86b3          	add	a3,s11,a3
    80003ec0:	0006c503          	lbu	a0,0(a3)
    80003ec4:	0087d813          	srli	a6,a5,0x8
    80003ec8:	0087d69b          	srliw	a3,a5,0x8
    80003ecc:	f8a401a3          	sb	a0,-125(s0)
    80003ed0:	28b67663          	bgeu	a2,a1,8000415c <__printf+0x614>
    80003ed4:	00f6f693          	andi	a3,a3,15
    80003ed8:	00dd86b3          	add	a3,s11,a3
    80003edc:	0006c583          	lbu	a1,0(a3)
    80003ee0:	00c7d513          	srli	a0,a5,0xc
    80003ee4:	00c7d69b          	srliw	a3,a5,0xc
    80003ee8:	f8b40223          	sb	a1,-124(s0)
    80003eec:	29067a63          	bgeu	a2,a6,80004180 <__printf+0x638>
    80003ef0:	00f6f693          	andi	a3,a3,15
    80003ef4:	00dd86b3          	add	a3,s11,a3
    80003ef8:	0006c583          	lbu	a1,0(a3)
    80003efc:	0107d813          	srli	a6,a5,0x10
    80003f00:	0107d69b          	srliw	a3,a5,0x10
    80003f04:	f8b402a3          	sb	a1,-123(s0)
    80003f08:	28a67263          	bgeu	a2,a0,8000418c <__printf+0x644>
    80003f0c:	00f6f693          	andi	a3,a3,15
    80003f10:	00dd86b3          	add	a3,s11,a3
    80003f14:	0006c683          	lbu	a3,0(a3)
    80003f18:	0147d79b          	srliw	a5,a5,0x14
    80003f1c:	f8d40323          	sb	a3,-122(s0)
    80003f20:	21067663          	bgeu	a2,a6,8000412c <__printf+0x5e4>
    80003f24:	02079793          	slli	a5,a5,0x20
    80003f28:	0207d793          	srli	a5,a5,0x20
    80003f2c:	00fd8db3          	add	s11,s11,a5
    80003f30:	000dc683          	lbu	a3,0(s11)
    80003f34:	00800793          	li	a5,8
    80003f38:	00700c93          	li	s9,7
    80003f3c:	f8d403a3          	sb	a3,-121(s0)
    80003f40:	00075c63          	bgez	a4,80003f58 <__printf+0x410>
    80003f44:	f9040713          	addi	a4,s0,-112
    80003f48:	00f70733          	add	a4,a4,a5
    80003f4c:	02d00693          	li	a3,45
    80003f50:	fed70823          	sb	a3,-16(a4)
    80003f54:	00078c93          	mv	s9,a5
    80003f58:	f8040793          	addi	a5,s0,-128
    80003f5c:	01978cb3          	add	s9,a5,s9
    80003f60:	f7f40d13          	addi	s10,s0,-129
    80003f64:	000cc503          	lbu	a0,0(s9)
    80003f68:	fffc8c93          	addi	s9,s9,-1
    80003f6c:	00000097          	auipc	ra,0x0
    80003f70:	9f8080e7          	jalr	-1544(ra) # 80003964 <consputc>
    80003f74:	ff9d18e3          	bne	s10,s9,80003f64 <__printf+0x41c>
    80003f78:	0100006f          	j	80003f88 <__printf+0x440>
    80003f7c:	00000097          	auipc	ra,0x0
    80003f80:	9e8080e7          	jalr	-1560(ra) # 80003964 <consputc>
    80003f84:	000c8493          	mv	s1,s9
    80003f88:	00094503          	lbu	a0,0(s2)
    80003f8c:	c60510e3          	bnez	a0,80003bec <__printf+0xa4>
    80003f90:	e40c0ee3          	beqz	s8,80003dec <__printf+0x2a4>
    80003f94:	00004517          	auipc	a0,0x4
    80003f98:	58c50513          	addi	a0,a0,1420 # 80008520 <pr>
    80003f9c:	00001097          	auipc	ra,0x1
    80003fa0:	94c080e7          	jalr	-1716(ra) # 800048e8 <release>
    80003fa4:	e49ff06f          	j	80003dec <__printf+0x2a4>
    80003fa8:	f7843783          	ld	a5,-136(s0)
    80003fac:	03000513          	li	a0,48
    80003fb0:	01000d13          	li	s10,16
    80003fb4:	00878713          	addi	a4,a5,8
    80003fb8:	0007bc83          	ld	s9,0(a5)
    80003fbc:	f6e43c23          	sd	a4,-136(s0)
    80003fc0:	00000097          	auipc	ra,0x0
    80003fc4:	9a4080e7          	jalr	-1628(ra) # 80003964 <consputc>
    80003fc8:	07800513          	li	a0,120
    80003fcc:	00000097          	auipc	ra,0x0
    80003fd0:	998080e7          	jalr	-1640(ra) # 80003964 <consputc>
    80003fd4:	00002d97          	auipc	s11,0x2
    80003fd8:	25cd8d93          	addi	s11,s11,604 # 80006230 <digits>
    80003fdc:	03ccd793          	srli	a5,s9,0x3c
    80003fe0:	00fd87b3          	add	a5,s11,a5
    80003fe4:	0007c503          	lbu	a0,0(a5)
    80003fe8:	fffd0d1b          	addiw	s10,s10,-1
    80003fec:	004c9c93          	slli	s9,s9,0x4
    80003ff0:	00000097          	auipc	ra,0x0
    80003ff4:	974080e7          	jalr	-1676(ra) # 80003964 <consputc>
    80003ff8:	fe0d12e3          	bnez	s10,80003fdc <__printf+0x494>
    80003ffc:	f8dff06f          	j	80003f88 <__printf+0x440>
    80004000:	f7843783          	ld	a5,-136(s0)
    80004004:	0007bc83          	ld	s9,0(a5)
    80004008:	00878793          	addi	a5,a5,8
    8000400c:	f6f43c23          	sd	a5,-136(s0)
    80004010:	000c9a63          	bnez	s9,80004024 <__printf+0x4dc>
    80004014:	1080006f          	j	8000411c <__printf+0x5d4>
    80004018:	001c8c93          	addi	s9,s9,1
    8000401c:	00000097          	auipc	ra,0x0
    80004020:	948080e7          	jalr	-1720(ra) # 80003964 <consputc>
    80004024:	000cc503          	lbu	a0,0(s9)
    80004028:	fe0518e3          	bnez	a0,80004018 <__printf+0x4d0>
    8000402c:	f5dff06f          	j	80003f88 <__printf+0x440>
    80004030:	02500513          	li	a0,37
    80004034:	00000097          	auipc	ra,0x0
    80004038:	930080e7          	jalr	-1744(ra) # 80003964 <consputc>
    8000403c:	000c8513          	mv	a0,s9
    80004040:	00000097          	auipc	ra,0x0
    80004044:	924080e7          	jalr	-1756(ra) # 80003964 <consputc>
    80004048:	f41ff06f          	j	80003f88 <__printf+0x440>
    8000404c:	02500513          	li	a0,37
    80004050:	00000097          	auipc	ra,0x0
    80004054:	914080e7          	jalr	-1772(ra) # 80003964 <consputc>
    80004058:	f31ff06f          	j	80003f88 <__printf+0x440>
    8000405c:	00030513          	mv	a0,t1
    80004060:	00000097          	auipc	ra,0x0
    80004064:	7bc080e7          	jalr	1980(ra) # 8000481c <acquire>
    80004068:	b4dff06f          	j	80003bb4 <__printf+0x6c>
    8000406c:	40c0053b          	negw	a0,a2
    80004070:	00a00713          	li	a4,10
    80004074:	02e576bb          	remuw	a3,a0,a4
    80004078:	00002d97          	auipc	s11,0x2
    8000407c:	1b8d8d93          	addi	s11,s11,440 # 80006230 <digits>
    80004080:	ff700593          	li	a1,-9
    80004084:	02069693          	slli	a3,a3,0x20
    80004088:	0206d693          	srli	a3,a3,0x20
    8000408c:	00dd86b3          	add	a3,s11,a3
    80004090:	0006c683          	lbu	a3,0(a3)
    80004094:	02e557bb          	divuw	a5,a0,a4
    80004098:	f8d40023          	sb	a3,-128(s0)
    8000409c:	10b65e63          	bge	a2,a1,800041b8 <__printf+0x670>
    800040a0:	06300593          	li	a1,99
    800040a4:	02e7f6bb          	remuw	a3,a5,a4
    800040a8:	02069693          	slli	a3,a3,0x20
    800040ac:	0206d693          	srli	a3,a3,0x20
    800040b0:	00dd86b3          	add	a3,s11,a3
    800040b4:	0006c683          	lbu	a3,0(a3)
    800040b8:	02e7d73b          	divuw	a4,a5,a4
    800040bc:	00200793          	li	a5,2
    800040c0:	f8d400a3          	sb	a3,-127(s0)
    800040c4:	bca5ece3          	bltu	a1,a0,80003c9c <__printf+0x154>
    800040c8:	ce5ff06f          	j	80003dac <__printf+0x264>
    800040cc:	40e007bb          	negw	a5,a4
    800040d0:	00002d97          	auipc	s11,0x2
    800040d4:	160d8d93          	addi	s11,s11,352 # 80006230 <digits>
    800040d8:	00f7f693          	andi	a3,a5,15
    800040dc:	00dd86b3          	add	a3,s11,a3
    800040e0:	0006c583          	lbu	a1,0(a3)
    800040e4:	ff100613          	li	a2,-15
    800040e8:	0047d69b          	srliw	a3,a5,0x4
    800040ec:	f8b40023          	sb	a1,-128(s0)
    800040f0:	0047d59b          	srliw	a1,a5,0x4
    800040f4:	0ac75e63          	bge	a4,a2,800041b0 <__printf+0x668>
    800040f8:	00f6f693          	andi	a3,a3,15
    800040fc:	00dd86b3          	add	a3,s11,a3
    80004100:	0006c603          	lbu	a2,0(a3)
    80004104:	00f00693          	li	a3,15
    80004108:	0087d79b          	srliw	a5,a5,0x8
    8000410c:	f8c400a3          	sb	a2,-127(s0)
    80004110:	d8b6e4e3          	bltu	a3,a1,80003e98 <__printf+0x350>
    80004114:	00200793          	li	a5,2
    80004118:	e2dff06f          	j	80003f44 <__printf+0x3fc>
    8000411c:	00002c97          	auipc	s9,0x2
    80004120:	0f4c8c93          	addi	s9,s9,244 # 80006210 <_ZZ12printIntegermE6digits+0x148>
    80004124:	02800513          	li	a0,40
    80004128:	ef1ff06f          	j	80004018 <__printf+0x4d0>
    8000412c:	00700793          	li	a5,7
    80004130:	00600c93          	li	s9,6
    80004134:	e0dff06f          	j	80003f40 <__printf+0x3f8>
    80004138:	00700793          	li	a5,7
    8000413c:	00600c93          	li	s9,6
    80004140:	c69ff06f          	j	80003da8 <__printf+0x260>
    80004144:	00300793          	li	a5,3
    80004148:	00200c93          	li	s9,2
    8000414c:	c5dff06f          	j	80003da8 <__printf+0x260>
    80004150:	00300793          	li	a5,3
    80004154:	00200c93          	li	s9,2
    80004158:	de9ff06f          	j	80003f40 <__printf+0x3f8>
    8000415c:	00400793          	li	a5,4
    80004160:	00300c93          	li	s9,3
    80004164:	dddff06f          	j	80003f40 <__printf+0x3f8>
    80004168:	00400793          	li	a5,4
    8000416c:	00300c93          	li	s9,3
    80004170:	c39ff06f          	j	80003da8 <__printf+0x260>
    80004174:	00500793          	li	a5,5
    80004178:	00400c93          	li	s9,4
    8000417c:	c2dff06f          	j	80003da8 <__printf+0x260>
    80004180:	00500793          	li	a5,5
    80004184:	00400c93          	li	s9,4
    80004188:	db9ff06f          	j	80003f40 <__printf+0x3f8>
    8000418c:	00600793          	li	a5,6
    80004190:	00500c93          	li	s9,5
    80004194:	dadff06f          	j	80003f40 <__printf+0x3f8>
    80004198:	00600793          	li	a5,6
    8000419c:	00500c93          	li	s9,5
    800041a0:	c09ff06f          	j	80003da8 <__printf+0x260>
    800041a4:	00800793          	li	a5,8
    800041a8:	00700c93          	li	s9,7
    800041ac:	bfdff06f          	j	80003da8 <__printf+0x260>
    800041b0:	00100793          	li	a5,1
    800041b4:	d91ff06f          	j	80003f44 <__printf+0x3fc>
    800041b8:	00100793          	li	a5,1
    800041bc:	bf1ff06f          	j	80003dac <__printf+0x264>
    800041c0:	00900793          	li	a5,9
    800041c4:	00800c93          	li	s9,8
    800041c8:	be1ff06f          	j	80003da8 <__printf+0x260>
    800041cc:	00002517          	auipc	a0,0x2
    800041d0:	04c50513          	addi	a0,a0,76 # 80006218 <_ZZ12printIntegermE6digits+0x150>
    800041d4:	00000097          	auipc	ra,0x0
    800041d8:	918080e7          	jalr	-1768(ra) # 80003aec <panic>

00000000800041dc <printfinit>:
    800041dc:	fe010113          	addi	sp,sp,-32
    800041e0:	00813823          	sd	s0,16(sp)
    800041e4:	00913423          	sd	s1,8(sp)
    800041e8:	00113c23          	sd	ra,24(sp)
    800041ec:	02010413          	addi	s0,sp,32
    800041f0:	00004497          	auipc	s1,0x4
    800041f4:	33048493          	addi	s1,s1,816 # 80008520 <pr>
    800041f8:	00048513          	mv	a0,s1
    800041fc:	00002597          	auipc	a1,0x2
    80004200:	02c58593          	addi	a1,a1,44 # 80006228 <_ZZ12printIntegermE6digits+0x160>
    80004204:	00000097          	auipc	ra,0x0
    80004208:	5f4080e7          	jalr	1524(ra) # 800047f8 <initlock>
    8000420c:	01813083          	ld	ra,24(sp)
    80004210:	01013403          	ld	s0,16(sp)
    80004214:	0004ac23          	sw	zero,24(s1)
    80004218:	00813483          	ld	s1,8(sp)
    8000421c:	02010113          	addi	sp,sp,32
    80004220:	00008067          	ret

0000000080004224 <uartinit>:
    80004224:	ff010113          	addi	sp,sp,-16
    80004228:	00813423          	sd	s0,8(sp)
    8000422c:	01010413          	addi	s0,sp,16
    80004230:	100007b7          	lui	a5,0x10000
    80004234:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80004238:	f8000713          	li	a4,-128
    8000423c:	00e781a3          	sb	a4,3(a5)
    80004240:	00300713          	li	a4,3
    80004244:	00e78023          	sb	a4,0(a5)
    80004248:	000780a3          	sb	zero,1(a5)
    8000424c:	00e781a3          	sb	a4,3(a5)
    80004250:	00700693          	li	a3,7
    80004254:	00d78123          	sb	a3,2(a5)
    80004258:	00e780a3          	sb	a4,1(a5)
    8000425c:	00813403          	ld	s0,8(sp)
    80004260:	01010113          	addi	sp,sp,16
    80004264:	00008067          	ret

0000000080004268 <uartputc>:
    80004268:	00003797          	auipc	a5,0x3
    8000426c:	de07a783          	lw	a5,-544(a5) # 80007048 <panicked>
    80004270:	00078463          	beqz	a5,80004278 <uartputc+0x10>
    80004274:	0000006f          	j	80004274 <uartputc+0xc>
    80004278:	fd010113          	addi	sp,sp,-48
    8000427c:	02813023          	sd	s0,32(sp)
    80004280:	00913c23          	sd	s1,24(sp)
    80004284:	01213823          	sd	s2,16(sp)
    80004288:	01313423          	sd	s3,8(sp)
    8000428c:	02113423          	sd	ra,40(sp)
    80004290:	03010413          	addi	s0,sp,48
    80004294:	00003917          	auipc	s2,0x3
    80004298:	dbc90913          	addi	s2,s2,-580 # 80007050 <uart_tx_r>
    8000429c:	00093783          	ld	a5,0(s2)
    800042a0:	00003497          	auipc	s1,0x3
    800042a4:	db848493          	addi	s1,s1,-584 # 80007058 <uart_tx_w>
    800042a8:	0004b703          	ld	a4,0(s1)
    800042ac:	02078693          	addi	a3,a5,32
    800042b0:	00050993          	mv	s3,a0
    800042b4:	02e69c63          	bne	a3,a4,800042ec <uartputc+0x84>
    800042b8:	00001097          	auipc	ra,0x1
    800042bc:	834080e7          	jalr	-1996(ra) # 80004aec <push_on>
    800042c0:	00093783          	ld	a5,0(s2)
    800042c4:	0004b703          	ld	a4,0(s1)
    800042c8:	02078793          	addi	a5,a5,32
    800042cc:	00e79463          	bne	a5,a4,800042d4 <uartputc+0x6c>
    800042d0:	0000006f          	j	800042d0 <uartputc+0x68>
    800042d4:	00001097          	auipc	ra,0x1
    800042d8:	88c080e7          	jalr	-1908(ra) # 80004b60 <pop_on>
    800042dc:	00093783          	ld	a5,0(s2)
    800042e0:	0004b703          	ld	a4,0(s1)
    800042e4:	02078693          	addi	a3,a5,32
    800042e8:	fce688e3          	beq	a3,a4,800042b8 <uartputc+0x50>
    800042ec:	01f77693          	andi	a3,a4,31
    800042f0:	00004597          	auipc	a1,0x4
    800042f4:	25058593          	addi	a1,a1,592 # 80008540 <uart_tx_buf>
    800042f8:	00d586b3          	add	a3,a1,a3
    800042fc:	00170713          	addi	a4,a4,1
    80004300:	01368023          	sb	s3,0(a3)
    80004304:	00e4b023          	sd	a4,0(s1)
    80004308:	10000637          	lui	a2,0x10000
    8000430c:	02f71063          	bne	a4,a5,8000432c <uartputc+0xc4>
    80004310:	0340006f          	j	80004344 <uartputc+0xdc>
    80004314:	00074703          	lbu	a4,0(a4)
    80004318:	00f93023          	sd	a5,0(s2)
    8000431c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80004320:	00093783          	ld	a5,0(s2)
    80004324:	0004b703          	ld	a4,0(s1)
    80004328:	00f70e63          	beq	a4,a5,80004344 <uartputc+0xdc>
    8000432c:	00564683          	lbu	a3,5(a2)
    80004330:	01f7f713          	andi	a4,a5,31
    80004334:	00e58733          	add	a4,a1,a4
    80004338:	0206f693          	andi	a3,a3,32
    8000433c:	00178793          	addi	a5,a5,1
    80004340:	fc069ae3          	bnez	a3,80004314 <uartputc+0xac>
    80004344:	02813083          	ld	ra,40(sp)
    80004348:	02013403          	ld	s0,32(sp)
    8000434c:	01813483          	ld	s1,24(sp)
    80004350:	01013903          	ld	s2,16(sp)
    80004354:	00813983          	ld	s3,8(sp)
    80004358:	03010113          	addi	sp,sp,48
    8000435c:	00008067          	ret

0000000080004360 <uartputc_sync>:
    80004360:	ff010113          	addi	sp,sp,-16
    80004364:	00813423          	sd	s0,8(sp)
    80004368:	01010413          	addi	s0,sp,16
    8000436c:	00003717          	auipc	a4,0x3
    80004370:	cdc72703          	lw	a4,-804(a4) # 80007048 <panicked>
    80004374:	02071663          	bnez	a4,800043a0 <uartputc_sync+0x40>
    80004378:	00050793          	mv	a5,a0
    8000437c:	100006b7          	lui	a3,0x10000
    80004380:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80004384:	02077713          	andi	a4,a4,32
    80004388:	fe070ce3          	beqz	a4,80004380 <uartputc_sync+0x20>
    8000438c:	0ff7f793          	andi	a5,a5,255
    80004390:	00f68023          	sb	a5,0(a3)
    80004394:	00813403          	ld	s0,8(sp)
    80004398:	01010113          	addi	sp,sp,16
    8000439c:	00008067          	ret
    800043a0:	0000006f          	j	800043a0 <uartputc_sync+0x40>

00000000800043a4 <uartstart>:
    800043a4:	ff010113          	addi	sp,sp,-16
    800043a8:	00813423          	sd	s0,8(sp)
    800043ac:	01010413          	addi	s0,sp,16
    800043b0:	00003617          	auipc	a2,0x3
    800043b4:	ca060613          	addi	a2,a2,-864 # 80007050 <uart_tx_r>
    800043b8:	00003517          	auipc	a0,0x3
    800043bc:	ca050513          	addi	a0,a0,-864 # 80007058 <uart_tx_w>
    800043c0:	00063783          	ld	a5,0(a2)
    800043c4:	00053703          	ld	a4,0(a0)
    800043c8:	04f70263          	beq	a4,a5,8000440c <uartstart+0x68>
    800043cc:	100005b7          	lui	a1,0x10000
    800043d0:	00004817          	auipc	a6,0x4
    800043d4:	17080813          	addi	a6,a6,368 # 80008540 <uart_tx_buf>
    800043d8:	01c0006f          	j	800043f4 <uartstart+0x50>
    800043dc:	0006c703          	lbu	a4,0(a3)
    800043e0:	00f63023          	sd	a5,0(a2)
    800043e4:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800043e8:	00063783          	ld	a5,0(a2)
    800043ec:	00053703          	ld	a4,0(a0)
    800043f0:	00f70e63          	beq	a4,a5,8000440c <uartstart+0x68>
    800043f4:	01f7f713          	andi	a4,a5,31
    800043f8:	00e806b3          	add	a3,a6,a4
    800043fc:	0055c703          	lbu	a4,5(a1)
    80004400:	00178793          	addi	a5,a5,1
    80004404:	02077713          	andi	a4,a4,32
    80004408:	fc071ae3          	bnez	a4,800043dc <uartstart+0x38>
    8000440c:	00813403          	ld	s0,8(sp)
    80004410:	01010113          	addi	sp,sp,16
    80004414:	00008067          	ret

0000000080004418 <uartgetc>:
    80004418:	ff010113          	addi	sp,sp,-16
    8000441c:	00813423          	sd	s0,8(sp)
    80004420:	01010413          	addi	s0,sp,16
    80004424:	10000737          	lui	a4,0x10000
    80004428:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000442c:	0017f793          	andi	a5,a5,1
    80004430:	00078c63          	beqz	a5,80004448 <uartgetc+0x30>
    80004434:	00074503          	lbu	a0,0(a4)
    80004438:	0ff57513          	andi	a0,a0,255
    8000443c:	00813403          	ld	s0,8(sp)
    80004440:	01010113          	addi	sp,sp,16
    80004444:	00008067          	ret
    80004448:	fff00513          	li	a0,-1
    8000444c:	ff1ff06f          	j	8000443c <uartgetc+0x24>

0000000080004450 <uartintr>:
    80004450:	100007b7          	lui	a5,0x10000
    80004454:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80004458:	0017f793          	andi	a5,a5,1
    8000445c:	0a078463          	beqz	a5,80004504 <uartintr+0xb4>
    80004460:	fe010113          	addi	sp,sp,-32
    80004464:	00813823          	sd	s0,16(sp)
    80004468:	00913423          	sd	s1,8(sp)
    8000446c:	00113c23          	sd	ra,24(sp)
    80004470:	02010413          	addi	s0,sp,32
    80004474:	100004b7          	lui	s1,0x10000
    80004478:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000447c:	0ff57513          	andi	a0,a0,255
    80004480:	fffff097          	auipc	ra,0xfffff
    80004484:	534080e7          	jalr	1332(ra) # 800039b4 <consoleintr>
    80004488:	0054c783          	lbu	a5,5(s1)
    8000448c:	0017f793          	andi	a5,a5,1
    80004490:	fe0794e3          	bnez	a5,80004478 <uartintr+0x28>
    80004494:	00003617          	auipc	a2,0x3
    80004498:	bbc60613          	addi	a2,a2,-1092 # 80007050 <uart_tx_r>
    8000449c:	00003517          	auipc	a0,0x3
    800044a0:	bbc50513          	addi	a0,a0,-1092 # 80007058 <uart_tx_w>
    800044a4:	00063783          	ld	a5,0(a2)
    800044a8:	00053703          	ld	a4,0(a0)
    800044ac:	04f70263          	beq	a4,a5,800044f0 <uartintr+0xa0>
    800044b0:	100005b7          	lui	a1,0x10000
    800044b4:	00004817          	auipc	a6,0x4
    800044b8:	08c80813          	addi	a6,a6,140 # 80008540 <uart_tx_buf>
    800044bc:	01c0006f          	j	800044d8 <uartintr+0x88>
    800044c0:	0006c703          	lbu	a4,0(a3)
    800044c4:	00f63023          	sd	a5,0(a2)
    800044c8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800044cc:	00063783          	ld	a5,0(a2)
    800044d0:	00053703          	ld	a4,0(a0)
    800044d4:	00f70e63          	beq	a4,a5,800044f0 <uartintr+0xa0>
    800044d8:	01f7f713          	andi	a4,a5,31
    800044dc:	00e806b3          	add	a3,a6,a4
    800044e0:	0055c703          	lbu	a4,5(a1)
    800044e4:	00178793          	addi	a5,a5,1
    800044e8:	02077713          	andi	a4,a4,32
    800044ec:	fc071ae3          	bnez	a4,800044c0 <uartintr+0x70>
    800044f0:	01813083          	ld	ra,24(sp)
    800044f4:	01013403          	ld	s0,16(sp)
    800044f8:	00813483          	ld	s1,8(sp)
    800044fc:	02010113          	addi	sp,sp,32
    80004500:	00008067          	ret
    80004504:	00003617          	auipc	a2,0x3
    80004508:	b4c60613          	addi	a2,a2,-1204 # 80007050 <uart_tx_r>
    8000450c:	00003517          	auipc	a0,0x3
    80004510:	b4c50513          	addi	a0,a0,-1204 # 80007058 <uart_tx_w>
    80004514:	00063783          	ld	a5,0(a2)
    80004518:	00053703          	ld	a4,0(a0)
    8000451c:	04f70263          	beq	a4,a5,80004560 <uartintr+0x110>
    80004520:	100005b7          	lui	a1,0x10000
    80004524:	00004817          	auipc	a6,0x4
    80004528:	01c80813          	addi	a6,a6,28 # 80008540 <uart_tx_buf>
    8000452c:	01c0006f          	j	80004548 <uartintr+0xf8>
    80004530:	0006c703          	lbu	a4,0(a3)
    80004534:	00f63023          	sd	a5,0(a2)
    80004538:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000453c:	00063783          	ld	a5,0(a2)
    80004540:	00053703          	ld	a4,0(a0)
    80004544:	02f70063          	beq	a4,a5,80004564 <uartintr+0x114>
    80004548:	01f7f713          	andi	a4,a5,31
    8000454c:	00e806b3          	add	a3,a6,a4
    80004550:	0055c703          	lbu	a4,5(a1)
    80004554:	00178793          	addi	a5,a5,1
    80004558:	02077713          	andi	a4,a4,32
    8000455c:	fc071ae3          	bnez	a4,80004530 <uartintr+0xe0>
    80004560:	00008067          	ret
    80004564:	00008067          	ret

0000000080004568 <kinit>:
    80004568:	fc010113          	addi	sp,sp,-64
    8000456c:	02913423          	sd	s1,40(sp)
    80004570:	fffff7b7          	lui	a5,0xfffff
    80004574:	00005497          	auipc	s1,0x5
    80004578:	ffb48493          	addi	s1,s1,-5 # 8000956f <end+0xfff>
    8000457c:	02813823          	sd	s0,48(sp)
    80004580:	01313c23          	sd	s3,24(sp)
    80004584:	00f4f4b3          	and	s1,s1,a5
    80004588:	02113c23          	sd	ra,56(sp)
    8000458c:	03213023          	sd	s2,32(sp)
    80004590:	01413823          	sd	s4,16(sp)
    80004594:	01513423          	sd	s5,8(sp)
    80004598:	04010413          	addi	s0,sp,64
    8000459c:	000017b7          	lui	a5,0x1
    800045a0:	01100993          	li	s3,17
    800045a4:	00f487b3          	add	a5,s1,a5
    800045a8:	01b99993          	slli	s3,s3,0x1b
    800045ac:	06f9e063          	bltu	s3,a5,8000460c <kinit+0xa4>
    800045b0:	00004a97          	auipc	s5,0x4
    800045b4:	fc0a8a93          	addi	s5,s5,-64 # 80008570 <end>
    800045b8:	0754ec63          	bltu	s1,s5,80004630 <kinit+0xc8>
    800045bc:	0734fa63          	bgeu	s1,s3,80004630 <kinit+0xc8>
    800045c0:	00088a37          	lui	s4,0x88
    800045c4:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    800045c8:	00003917          	auipc	s2,0x3
    800045cc:	a9890913          	addi	s2,s2,-1384 # 80007060 <kmem>
    800045d0:	00ca1a13          	slli	s4,s4,0xc
    800045d4:	0140006f          	j	800045e8 <kinit+0x80>
    800045d8:	000017b7          	lui	a5,0x1
    800045dc:	00f484b3          	add	s1,s1,a5
    800045e0:	0554e863          	bltu	s1,s5,80004630 <kinit+0xc8>
    800045e4:	0534f663          	bgeu	s1,s3,80004630 <kinit+0xc8>
    800045e8:	00001637          	lui	a2,0x1
    800045ec:	00100593          	li	a1,1
    800045f0:	00048513          	mv	a0,s1
    800045f4:	00000097          	auipc	ra,0x0
    800045f8:	5e4080e7          	jalr	1508(ra) # 80004bd8 <__memset>
    800045fc:	00093783          	ld	a5,0(s2)
    80004600:	00f4b023          	sd	a5,0(s1)
    80004604:	00993023          	sd	s1,0(s2)
    80004608:	fd4498e3          	bne	s1,s4,800045d8 <kinit+0x70>
    8000460c:	03813083          	ld	ra,56(sp)
    80004610:	03013403          	ld	s0,48(sp)
    80004614:	02813483          	ld	s1,40(sp)
    80004618:	02013903          	ld	s2,32(sp)
    8000461c:	01813983          	ld	s3,24(sp)
    80004620:	01013a03          	ld	s4,16(sp)
    80004624:	00813a83          	ld	s5,8(sp)
    80004628:	04010113          	addi	sp,sp,64
    8000462c:	00008067          	ret
    80004630:	00002517          	auipc	a0,0x2
    80004634:	c1850513          	addi	a0,a0,-1000 # 80006248 <digits+0x18>
    80004638:	fffff097          	auipc	ra,0xfffff
    8000463c:	4b4080e7          	jalr	1204(ra) # 80003aec <panic>

0000000080004640 <freerange>:
    80004640:	fc010113          	addi	sp,sp,-64
    80004644:	000017b7          	lui	a5,0x1
    80004648:	02913423          	sd	s1,40(sp)
    8000464c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80004650:	009504b3          	add	s1,a0,s1
    80004654:	fffff537          	lui	a0,0xfffff
    80004658:	02813823          	sd	s0,48(sp)
    8000465c:	02113c23          	sd	ra,56(sp)
    80004660:	03213023          	sd	s2,32(sp)
    80004664:	01313c23          	sd	s3,24(sp)
    80004668:	01413823          	sd	s4,16(sp)
    8000466c:	01513423          	sd	s5,8(sp)
    80004670:	01613023          	sd	s6,0(sp)
    80004674:	04010413          	addi	s0,sp,64
    80004678:	00a4f4b3          	and	s1,s1,a0
    8000467c:	00f487b3          	add	a5,s1,a5
    80004680:	06f5e463          	bltu	a1,a5,800046e8 <freerange+0xa8>
    80004684:	00004a97          	auipc	s5,0x4
    80004688:	eeca8a93          	addi	s5,s5,-276 # 80008570 <end>
    8000468c:	0954e263          	bltu	s1,s5,80004710 <freerange+0xd0>
    80004690:	01100993          	li	s3,17
    80004694:	01b99993          	slli	s3,s3,0x1b
    80004698:	0734fc63          	bgeu	s1,s3,80004710 <freerange+0xd0>
    8000469c:	00058a13          	mv	s4,a1
    800046a0:	00003917          	auipc	s2,0x3
    800046a4:	9c090913          	addi	s2,s2,-1600 # 80007060 <kmem>
    800046a8:	00002b37          	lui	s6,0x2
    800046ac:	0140006f          	j	800046c0 <freerange+0x80>
    800046b0:	000017b7          	lui	a5,0x1
    800046b4:	00f484b3          	add	s1,s1,a5
    800046b8:	0554ec63          	bltu	s1,s5,80004710 <freerange+0xd0>
    800046bc:	0534fa63          	bgeu	s1,s3,80004710 <freerange+0xd0>
    800046c0:	00001637          	lui	a2,0x1
    800046c4:	00100593          	li	a1,1
    800046c8:	00048513          	mv	a0,s1
    800046cc:	00000097          	auipc	ra,0x0
    800046d0:	50c080e7          	jalr	1292(ra) # 80004bd8 <__memset>
    800046d4:	00093703          	ld	a4,0(s2)
    800046d8:	016487b3          	add	a5,s1,s6
    800046dc:	00e4b023          	sd	a4,0(s1)
    800046e0:	00993023          	sd	s1,0(s2)
    800046e4:	fcfa76e3          	bgeu	s4,a5,800046b0 <freerange+0x70>
    800046e8:	03813083          	ld	ra,56(sp)
    800046ec:	03013403          	ld	s0,48(sp)
    800046f0:	02813483          	ld	s1,40(sp)
    800046f4:	02013903          	ld	s2,32(sp)
    800046f8:	01813983          	ld	s3,24(sp)
    800046fc:	01013a03          	ld	s4,16(sp)
    80004700:	00813a83          	ld	s5,8(sp)
    80004704:	00013b03          	ld	s6,0(sp)
    80004708:	04010113          	addi	sp,sp,64
    8000470c:	00008067          	ret
    80004710:	00002517          	auipc	a0,0x2
    80004714:	b3850513          	addi	a0,a0,-1224 # 80006248 <digits+0x18>
    80004718:	fffff097          	auipc	ra,0xfffff
    8000471c:	3d4080e7          	jalr	980(ra) # 80003aec <panic>

0000000080004720 <kfree>:
    80004720:	fe010113          	addi	sp,sp,-32
    80004724:	00813823          	sd	s0,16(sp)
    80004728:	00113c23          	sd	ra,24(sp)
    8000472c:	00913423          	sd	s1,8(sp)
    80004730:	02010413          	addi	s0,sp,32
    80004734:	03451793          	slli	a5,a0,0x34
    80004738:	04079c63          	bnez	a5,80004790 <kfree+0x70>
    8000473c:	00004797          	auipc	a5,0x4
    80004740:	e3478793          	addi	a5,a5,-460 # 80008570 <end>
    80004744:	00050493          	mv	s1,a0
    80004748:	04f56463          	bltu	a0,a5,80004790 <kfree+0x70>
    8000474c:	01100793          	li	a5,17
    80004750:	01b79793          	slli	a5,a5,0x1b
    80004754:	02f57e63          	bgeu	a0,a5,80004790 <kfree+0x70>
    80004758:	00001637          	lui	a2,0x1
    8000475c:	00100593          	li	a1,1
    80004760:	00000097          	auipc	ra,0x0
    80004764:	478080e7          	jalr	1144(ra) # 80004bd8 <__memset>
    80004768:	00003797          	auipc	a5,0x3
    8000476c:	8f878793          	addi	a5,a5,-1800 # 80007060 <kmem>
    80004770:	0007b703          	ld	a4,0(a5)
    80004774:	01813083          	ld	ra,24(sp)
    80004778:	01013403          	ld	s0,16(sp)
    8000477c:	00e4b023          	sd	a4,0(s1)
    80004780:	0097b023          	sd	s1,0(a5)
    80004784:	00813483          	ld	s1,8(sp)
    80004788:	02010113          	addi	sp,sp,32
    8000478c:	00008067          	ret
    80004790:	00002517          	auipc	a0,0x2
    80004794:	ab850513          	addi	a0,a0,-1352 # 80006248 <digits+0x18>
    80004798:	fffff097          	auipc	ra,0xfffff
    8000479c:	354080e7          	jalr	852(ra) # 80003aec <panic>

00000000800047a0 <kalloc>:
    800047a0:	fe010113          	addi	sp,sp,-32
    800047a4:	00813823          	sd	s0,16(sp)
    800047a8:	00913423          	sd	s1,8(sp)
    800047ac:	00113c23          	sd	ra,24(sp)
    800047b0:	02010413          	addi	s0,sp,32
    800047b4:	00003797          	auipc	a5,0x3
    800047b8:	8ac78793          	addi	a5,a5,-1876 # 80007060 <kmem>
    800047bc:	0007b483          	ld	s1,0(a5)
    800047c0:	02048063          	beqz	s1,800047e0 <kalloc+0x40>
    800047c4:	0004b703          	ld	a4,0(s1)
    800047c8:	00001637          	lui	a2,0x1
    800047cc:	00500593          	li	a1,5
    800047d0:	00048513          	mv	a0,s1
    800047d4:	00e7b023          	sd	a4,0(a5)
    800047d8:	00000097          	auipc	ra,0x0
    800047dc:	400080e7          	jalr	1024(ra) # 80004bd8 <__memset>
    800047e0:	01813083          	ld	ra,24(sp)
    800047e4:	01013403          	ld	s0,16(sp)
    800047e8:	00048513          	mv	a0,s1
    800047ec:	00813483          	ld	s1,8(sp)
    800047f0:	02010113          	addi	sp,sp,32
    800047f4:	00008067          	ret

00000000800047f8 <initlock>:
    800047f8:	ff010113          	addi	sp,sp,-16
    800047fc:	00813423          	sd	s0,8(sp)
    80004800:	01010413          	addi	s0,sp,16
    80004804:	00813403          	ld	s0,8(sp)
    80004808:	00b53423          	sd	a1,8(a0)
    8000480c:	00052023          	sw	zero,0(a0)
    80004810:	00053823          	sd	zero,16(a0)
    80004814:	01010113          	addi	sp,sp,16
    80004818:	00008067          	ret

000000008000481c <acquire>:
    8000481c:	fe010113          	addi	sp,sp,-32
    80004820:	00813823          	sd	s0,16(sp)
    80004824:	00913423          	sd	s1,8(sp)
    80004828:	00113c23          	sd	ra,24(sp)
    8000482c:	01213023          	sd	s2,0(sp)
    80004830:	02010413          	addi	s0,sp,32
    80004834:	00050493          	mv	s1,a0
    80004838:	10002973          	csrr	s2,sstatus
    8000483c:	100027f3          	csrr	a5,sstatus
    80004840:	ffd7f793          	andi	a5,a5,-3
    80004844:	10079073          	csrw	sstatus,a5
    80004848:	fffff097          	auipc	ra,0xfffff
    8000484c:	8e0080e7          	jalr	-1824(ra) # 80003128 <mycpu>
    80004850:	07852783          	lw	a5,120(a0)
    80004854:	06078e63          	beqz	a5,800048d0 <acquire+0xb4>
    80004858:	fffff097          	auipc	ra,0xfffff
    8000485c:	8d0080e7          	jalr	-1840(ra) # 80003128 <mycpu>
    80004860:	07852783          	lw	a5,120(a0)
    80004864:	0004a703          	lw	a4,0(s1)
    80004868:	0017879b          	addiw	a5,a5,1
    8000486c:	06f52c23          	sw	a5,120(a0)
    80004870:	04071063          	bnez	a4,800048b0 <acquire+0x94>
    80004874:	00100713          	li	a4,1
    80004878:	00070793          	mv	a5,a4
    8000487c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80004880:	0007879b          	sext.w	a5,a5
    80004884:	fe079ae3          	bnez	a5,80004878 <acquire+0x5c>
    80004888:	0ff0000f          	fence
    8000488c:	fffff097          	auipc	ra,0xfffff
    80004890:	89c080e7          	jalr	-1892(ra) # 80003128 <mycpu>
    80004894:	01813083          	ld	ra,24(sp)
    80004898:	01013403          	ld	s0,16(sp)
    8000489c:	00a4b823          	sd	a0,16(s1)
    800048a0:	00013903          	ld	s2,0(sp)
    800048a4:	00813483          	ld	s1,8(sp)
    800048a8:	02010113          	addi	sp,sp,32
    800048ac:	00008067          	ret
    800048b0:	0104b903          	ld	s2,16(s1)
    800048b4:	fffff097          	auipc	ra,0xfffff
    800048b8:	874080e7          	jalr	-1932(ra) # 80003128 <mycpu>
    800048bc:	faa91ce3          	bne	s2,a0,80004874 <acquire+0x58>
    800048c0:	00002517          	auipc	a0,0x2
    800048c4:	99050513          	addi	a0,a0,-1648 # 80006250 <digits+0x20>
    800048c8:	fffff097          	auipc	ra,0xfffff
    800048cc:	224080e7          	jalr	548(ra) # 80003aec <panic>
    800048d0:	00195913          	srli	s2,s2,0x1
    800048d4:	fffff097          	auipc	ra,0xfffff
    800048d8:	854080e7          	jalr	-1964(ra) # 80003128 <mycpu>
    800048dc:	00197913          	andi	s2,s2,1
    800048e0:	07252e23          	sw	s2,124(a0)
    800048e4:	f75ff06f          	j	80004858 <acquire+0x3c>

00000000800048e8 <release>:
    800048e8:	fe010113          	addi	sp,sp,-32
    800048ec:	00813823          	sd	s0,16(sp)
    800048f0:	00113c23          	sd	ra,24(sp)
    800048f4:	00913423          	sd	s1,8(sp)
    800048f8:	01213023          	sd	s2,0(sp)
    800048fc:	02010413          	addi	s0,sp,32
    80004900:	00052783          	lw	a5,0(a0)
    80004904:	00079a63          	bnez	a5,80004918 <release+0x30>
    80004908:	00002517          	auipc	a0,0x2
    8000490c:	95050513          	addi	a0,a0,-1712 # 80006258 <digits+0x28>
    80004910:	fffff097          	auipc	ra,0xfffff
    80004914:	1dc080e7          	jalr	476(ra) # 80003aec <panic>
    80004918:	01053903          	ld	s2,16(a0)
    8000491c:	00050493          	mv	s1,a0
    80004920:	fffff097          	auipc	ra,0xfffff
    80004924:	808080e7          	jalr	-2040(ra) # 80003128 <mycpu>
    80004928:	fea910e3          	bne	s2,a0,80004908 <release+0x20>
    8000492c:	0004b823          	sd	zero,16(s1)
    80004930:	0ff0000f          	fence
    80004934:	0f50000f          	fence	iorw,ow
    80004938:	0804a02f          	amoswap.w	zero,zero,(s1)
    8000493c:	ffffe097          	auipc	ra,0xffffe
    80004940:	7ec080e7          	jalr	2028(ra) # 80003128 <mycpu>
    80004944:	100027f3          	csrr	a5,sstatus
    80004948:	0027f793          	andi	a5,a5,2
    8000494c:	04079a63          	bnez	a5,800049a0 <release+0xb8>
    80004950:	07852783          	lw	a5,120(a0)
    80004954:	02f05e63          	blez	a5,80004990 <release+0xa8>
    80004958:	fff7871b          	addiw	a4,a5,-1
    8000495c:	06e52c23          	sw	a4,120(a0)
    80004960:	00071c63          	bnez	a4,80004978 <release+0x90>
    80004964:	07c52783          	lw	a5,124(a0)
    80004968:	00078863          	beqz	a5,80004978 <release+0x90>
    8000496c:	100027f3          	csrr	a5,sstatus
    80004970:	0027e793          	ori	a5,a5,2
    80004974:	10079073          	csrw	sstatus,a5
    80004978:	01813083          	ld	ra,24(sp)
    8000497c:	01013403          	ld	s0,16(sp)
    80004980:	00813483          	ld	s1,8(sp)
    80004984:	00013903          	ld	s2,0(sp)
    80004988:	02010113          	addi	sp,sp,32
    8000498c:	00008067          	ret
    80004990:	00002517          	auipc	a0,0x2
    80004994:	8e850513          	addi	a0,a0,-1816 # 80006278 <digits+0x48>
    80004998:	fffff097          	auipc	ra,0xfffff
    8000499c:	154080e7          	jalr	340(ra) # 80003aec <panic>
    800049a0:	00002517          	auipc	a0,0x2
    800049a4:	8c050513          	addi	a0,a0,-1856 # 80006260 <digits+0x30>
    800049a8:	fffff097          	auipc	ra,0xfffff
    800049ac:	144080e7          	jalr	324(ra) # 80003aec <panic>

00000000800049b0 <holding>:
    800049b0:	00052783          	lw	a5,0(a0)
    800049b4:	00079663          	bnez	a5,800049c0 <holding+0x10>
    800049b8:	00000513          	li	a0,0
    800049bc:	00008067          	ret
    800049c0:	fe010113          	addi	sp,sp,-32
    800049c4:	00813823          	sd	s0,16(sp)
    800049c8:	00913423          	sd	s1,8(sp)
    800049cc:	00113c23          	sd	ra,24(sp)
    800049d0:	02010413          	addi	s0,sp,32
    800049d4:	01053483          	ld	s1,16(a0)
    800049d8:	ffffe097          	auipc	ra,0xffffe
    800049dc:	750080e7          	jalr	1872(ra) # 80003128 <mycpu>
    800049e0:	01813083          	ld	ra,24(sp)
    800049e4:	01013403          	ld	s0,16(sp)
    800049e8:	40a48533          	sub	a0,s1,a0
    800049ec:	00153513          	seqz	a0,a0
    800049f0:	00813483          	ld	s1,8(sp)
    800049f4:	02010113          	addi	sp,sp,32
    800049f8:	00008067          	ret

00000000800049fc <push_off>:
    800049fc:	fe010113          	addi	sp,sp,-32
    80004a00:	00813823          	sd	s0,16(sp)
    80004a04:	00113c23          	sd	ra,24(sp)
    80004a08:	00913423          	sd	s1,8(sp)
    80004a0c:	02010413          	addi	s0,sp,32
    80004a10:	100024f3          	csrr	s1,sstatus
    80004a14:	100027f3          	csrr	a5,sstatus
    80004a18:	ffd7f793          	andi	a5,a5,-3
    80004a1c:	10079073          	csrw	sstatus,a5
    80004a20:	ffffe097          	auipc	ra,0xffffe
    80004a24:	708080e7          	jalr	1800(ra) # 80003128 <mycpu>
    80004a28:	07852783          	lw	a5,120(a0)
    80004a2c:	02078663          	beqz	a5,80004a58 <push_off+0x5c>
    80004a30:	ffffe097          	auipc	ra,0xffffe
    80004a34:	6f8080e7          	jalr	1784(ra) # 80003128 <mycpu>
    80004a38:	07852783          	lw	a5,120(a0)
    80004a3c:	01813083          	ld	ra,24(sp)
    80004a40:	01013403          	ld	s0,16(sp)
    80004a44:	0017879b          	addiw	a5,a5,1
    80004a48:	06f52c23          	sw	a5,120(a0)
    80004a4c:	00813483          	ld	s1,8(sp)
    80004a50:	02010113          	addi	sp,sp,32
    80004a54:	00008067          	ret
    80004a58:	0014d493          	srli	s1,s1,0x1
    80004a5c:	ffffe097          	auipc	ra,0xffffe
    80004a60:	6cc080e7          	jalr	1740(ra) # 80003128 <mycpu>
    80004a64:	0014f493          	andi	s1,s1,1
    80004a68:	06952e23          	sw	s1,124(a0)
    80004a6c:	fc5ff06f          	j	80004a30 <push_off+0x34>

0000000080004a70 <pop_off>:
    80004a70:	ff010113          	addi	sp,sp,-16
    80004a74:	00813023          	sd	s0,0(sp)
    80004a78:	00113423          	sd	ra,8(sp)
    80004a7c:	01010413          	addi	s0,sp,16
    80004a80:	ffffe097          	auipc	ra,0xffffe
    80004a84:	6a8080e7          	jalr	1704(ra) # 80003128 <mycpu>
    80004a88:	100027f3          	csrr	a5,sstatus
    80004a8c:	0027f793          	andi	a5,a5,2
    80004a90:	04079663          	bnez	a5,80004adc <pop_off+0x6c>
    80004a94:	07852783          	lw	a5,120(a0)
    80004a98:	02f05a63          	blez	a5,80004acc <pop_off+0x5c>
    80004a9c:	fff7871b          	addiw	a4,a5,-1
    80004aa0:	06e52c23          	sw	a4,120(a0)
    80004aa4:	00071c63          	bnez	a4,80004abc <pop_off+0x4c>
    80004aa8:	07c52783          	lw	a5,124(a0)
    80004aac:	00078863          	beqz	a5,80004abc <pop_off+0x4c>
    80004ab0:	100027f3          	csrr	a5,sstatus
    80004ab4:	0027e793          	ori	a5,a5,2
    80004ab8:	10079073          	csrw	sstatus,a5
    80004abc:	00813083          	ld	ra,8(sp)
    80004ac0:	00013403          	ld	s0,0(sp)
    80004ac4:	01010113          	addi	sp,sp,16
    80004ac8:	00008067          	ret
    80004acc:	00001517          	auipc	a0,0x1
    80004ad0:	7ac50513          	addi	a0,a0,1964 # 80006278 <digits+0x48>
    80004ad4:	fffff097          	auipc	ra,0xfffff
    80004ad8:	018080e7          	jalr	24(ra) # 80003aec <panic>
    80004adc:	00001517          	auipc	a0,0x1
    80004ae0:	78450513          	addi	a0,a0,1924 # 80006260 <digits+0x30>
    80004ae4:	fffff097          	auipc	ra,0xfffff
    80004ae8:	008080e7          	jalr	8(ra) # 80003aec <panic>

0000000080004aec <push_on>:
    80004aec:	fe010113          	addi	sp,sp,-32
    80004af0:	00813823          	sd	s0,16(sp)
    80004af4:	00113c23          	sd	ra,24(sp)
    80004af8:	00913423          	sd	s1,8(sp)
    80004afc:	02010413          	addi	s0,sp,32
    80004b00:	100024f3          	csrr	s1,sstatus
    80004b04:	100027f3          	csrr	a5,sstatus
    80004b08:	0027e793          	ori	a5,a5,2
    80004b0c:	10079073          	csrw	sstatus,a5
    80004b10:	ffffe097          	auipc	ra,0xffffe
    80004b14:	618080e7          	jalr	1560(ra) # 80003128 <mycpu>
    80004b18:	07852783          	lw	a5,120(a0)
    80004b1c:	02078663          	beqz	a5,80004b48 <push_on+0x5c>
    80004b20:	ffffe097          	auipc	ra,0xffffe
    80004b24:	608080e7          	jalr	1544(ra) # 80003128 <mycpu>
    80004b28:	07852783          	lw	a5,120(a0)
    80004b2c:	01813083          	ld	ra,24(sp)
    80004b30:	01013403          	ld	s0,16(sp)
    80004b34:	0017879b          	addiw	a5,a5,1
    80004b38:	06f52c23          	sw	a5,120(a0)
    80004b3c:	00813483          	ld	s1,8(sp)
    80004b40:	02010113          	addi	sp,sp,32
    80004b44:	00008067          	ret
    80004b48:	0014d493          	srli	s1,s1,0x1
    80004b4c:	ffffe097          	auipc	ra,0xffffe
    80004b50:	5dc080e7          	jalr	1500(ra) # 80003128 <mycpu>
    80004b54:	0014f493          	andi	s1,s1,1
    80004b58:	06952e23          	sw	s1,124(a0)
    80004b5c:	fc5ff06f          	j	80004b20 <push_on+0x34>

0000000080004b60 <pop_on>:
    80004b60:	ff010113          	addi	sp,sp,-16
    80004b64:	00813023          	sd	s0,0(sp)
    80004b68:	00113423          	sd	ra,8(sp)
    80004b6c:	01010413          	addi	s0,sp,16
    80004b70:	ffffe097          	auipc	ra,0xffffe
    80004b74:	5b8080e7          	jalr	1464(ra) # 80003128 <mycpu>
    80004b78:	100027f3          	csrr	a5,sstatus
    80004b7c:	0027f793          	andi	a5,a5,2
    80004b80:	04078463          	beqz	a5,80004bc8 <pop_on+0x68>
    80004b84:	07852783          	lw	a5,120(a0)
    80004b88:	02f05863          	blez	a5,80004bb8 <pop_on+0x58>
    80004b8c:	fff7879b          	addiw	a5,a5,-1
    80004b90:	06f52c23          	sw	a5,120(a0)
    80004b94:	07853783          	ld	a5,120(a0)
    80004b98:	00079863          	bnez	a5,80004ba8 <pop_on+0x48>
    80004b9c:	100027f3          	csrr	a5,sstatus
    80004ba0:	ffd7f793          	andi	a5,a5,-3
    80004ba4:	10079073          	csrw	sstatus,a5
    80004ba8:	00813083          	ld	ra,8(sp)
    80004bac:	00013403          	ld	s0,0(sp)
    80004bb0:	01010113          	addi	sp,sp,16
    80004bb4:	00008067          	ret
    80004bb8:	00001517          	auipc	a0,0x1
    80004bbc:	6e850513          	addi	a0,a0,1768 # 800062a0 <digits+0x70>
    80004bc0:	fffff097          	auipc	ra,0xfffff
    80004bc4:	f2c080e7          	jalr	-212(ra) # 80003aec <panic>
    80004bc8:	00001517          	auipc	a0,0x1
    80004bcc:	6b850513          	addi	a0,a0,1720 # 80006280 <digits+0x50>
    80004bd0:	fffff097          	auipc	ra,0xfffff
    80004bd4:	f1c080e7          	jalr	-228(ra) # 80003aec <panic>

0000000080004bd8 <__memset>:
    80004bd8:	ff010113          	addi	sp,sp,-16
    80004bdc:	00813423          	sd	s0,8(sp)
    80004be0:	01010413          	addi	s0,sp,16
    80004be4:	1a060e63          	beqz	a2,80004da0 <__memset+0x1c8>
    80004be8:	40a007b3          	neg	a5,a0
    80004bec:	0077f793          	andi	a5,a5,7
    80004bf0:	00778693          	addi	a3,a5,7
    80004bf4:	00b00813          	li	a6,11
    80004bf8:	0ff5f593          	andi	a1,a1,255
    80004bfc:	fff6071b          	addiw	a4,a2,-1
    80004c00:	1b06e663          	bltu	a3,a6,80004dac <__memset+0x1d4>
    80004c04:	1cd76463          	bltu	a4,a3,80004dcc <__memset+0x1f4>
    80004c08:	1a078e63          	beqz	a5,80004dc4 <__memset+0x1ec>
    80004c0c:	00b50023          	sb	a1,0(a0)
    80004c10:	00100713          	li	a4,1
    80004c14:	1ae78463          	beq	a5,a4,80004dbc <__memset+0x1e4>
    80004c18:	00b500a3          	sb	a1,1(a0)
    80004c1c:	00200713          	li	a4,2
    80004c20:	1ae78a63          	beq	a5,a4,80004dd4 <__memset+0x1fc>
    80004c24:	00b50123          	sb	a1,2(a0)
    80004c28:	00300713          	li	a4,3
    80004c2c:	18e78463          	beq	a5,a4,80004db4 <__memset+0x1dc>
    80004c30:	00b501a3          	sb	a1,3(a0)
    80004c34:	00400713          	li	a4,4
    80004c38:	1ae78263          	beq	a5,a4,80004ddc <__memset+0x204>
    80004c3c:	00b50223          	sb	a1,4(a0)
    80004c40:	00500713          	li	a4,5
    80004c44:	1ae78063          	beq	a5,a4,80004de4 <__memset+0x20c>
    80004c48:	00b502a3          	sb	a1,5(a0)
    80004c4c:	00700713          	li	a4,7
    80004c50:	18e79e63          	bne	a5,a4,80004dec <__memset+0x214>
    80004c54:	00b50323          	sb	a1,6(a0)
    80004c58:	00700e93          	li	t4,7
    80004c5c:	00859713          	slli	a4,a1,0x8
    80004c60:	00e5e733          	or	a4,a1,a4
    80004c64:	01059e13          	slli	t3,a1,0x10
    80004c68:	01c76e33          	or	t3,a4,t3
    80004c6c:	01859313          	slli	t1,a1,0x18
    80004c70:	006e6333          	or	t1,t3,t1
    80004c74:	02059893          	slli	a7,a1,0x20
    80004c78:	40f60e3b          	subw	t3,a2,a5
    80004c7c:	011368b3          	or	a7,t1,a7
    80004c80:	02859813          	slli	a6,a1,0x28
    80004c84:	0108e833          	or	a6,a7,a6
    80004c88:	03059693          	slli	a3,a1,0x30
    80004c8c:	003e589b          	srliw	a7,t3,0x3
    80004c90:	00d866b3          	or	a3,a6,a3
    80004c94:	03859713          	slli	a4,a1,0x38
    80004c98:	00389813          	slli	a6,a7,0x3
    80004c9c:	00f507b3          	add	a5,a0,a5
    80004ca0:	00e6e733          	or	a4,a3,a4
    80004ca4:	000e089b          	sext.w	a7,t3
    80004ca8:	00f806b3          	add	a3,a6,a5
    80004cac:	00e7b023          	sd	a4,0(a5)
    80004cb0:	00878793          	addi	a5,a5,8
    80004cb4:	fed79ce3          	bne	a5,a3,80004cac <__memset+0xd4>
    80004cb8:	ff8e7793          	andi	a5,t3,-8
    80004cbc:	0007871b          	sext.w	a4,a5
    80004cc0:	01d787bb          	addw	a5,a5,t4
    80004cc4:	0ce88e63          	beq	a7,a4,80004da0 <__memset+0x1c8>
    80004cc8:	00f50733          	add	a4,a0,a5
    80004ccc:	00b70023          	sb	a1,0(a4)
    80004cd0:	0017871b          	addiw	a4,a5,1
    80004cd4:	0cc77663          	bgeu	a4,a2,80004da0 <__memset+0x1c8>
    80004cd8:	00e50733          	add	a4,a0,a4
    80004cdc:	00b70023          	sb	a1,0(a4)
    80004ce0:	0027871b          	addiw	a4,a5,2
    80004ce4:	0ac77e63          	bgeu	a4,a2,80004da0 <__memset+0x1c8>
    80004ce8:	00e50733          	add	a4,a0,a4
    80004cec:	00b70023          	sb	a1,0(a4)
    80004cf0:	0037871b          	addiw	a4,a5,3
    80004cf4:	0ac77663          	bgeu	a4,a2,80004da0 <__memset+0x1c8>
    80004cf8:	00e50733          	add	a4,a0,a4
    80004cfc:	00b70023          	sb	a1,0(a4)
    80004d00:	0047871b          	addiw	a4,a5,4
    80004d04:	08c77e63          	bgeu	a4,a2,80004da0 <__memset+0x1c8>
    80004d08:	00e50733          	add	a4,a0,a4
    80004d0c:	00b70023          	sb	a1,0(a4)
    80004d10:	0057871b          	addiw	a4,a5,5
    80004d14:	08c77663          	bgeu	a4,a2,80004da0 <__memset+0x1c8>
    80004d18:	00e50733          	add	a4,a0,a4
    80004d1c:	00b70023          	sb	a1,0(a4)
    80004d20:	0067871b          	addiw	a4,a5,6
    80004d24:	06c77e63          	bgeu	a4,a2,80004da0 <__memset+0x1c8>
    80004d28:	00e50733          	add	a4,a0,a4
    80004d2c:	00b70023          	sb	a1,0(a4)
    80004d30:	0077871b          	addiw	a4,a5,7
    80004d34:	06c77663          	bgeu	a4,a2,80004da0 <__memset+0x1c8>
    80004d38:	00e50733          	add	a4,a0,a4
    80004d3c:	00b70023          	sb	a1,0(a4)
    80004d40:	0087871b          	addiw	a4,a5,8
    80004d44:	04c77e63          	bgeu	a4,a2,80004da0 <__memset+0x1c8>
    80004d48:	00e50733          	add	a4,a0,a4
    80004d4c:	00b70023          	sb	a1,0(a4)
    80004d50:	0097871b          	addiw	a4,a5,9
    80004d54:	04c77663          	bgeu	a4,a2,80004da0 <__memset+0x1c8>
    80004d58:	00e50733          	add	a4,a0,a4
    80004d5c:	00b70023          	sb	a1,0(a4)
    80004d60:	00a7871b          	addiw	a4,a5,10
    80004d64:	02c77e63          	bgeu	a4,a2,80004da0 <__memset+0x1c8>
    80004d68:	00e50733          	add	a4,a0,a4
    80004d6c:	00b70023          	sb	a1,0(a4)
    80004d70:	00b7871b          	addiw	a4,a5,11
    80004d74:	02c77663          	bgeu	a4,a2,80004da0 <__memset+0x1c8>
    80004d78:	00e50733          	add	a4,a0,a4
    80004d7c:	00b70023          	sb	a1,0(a4)
    80004d80:	00c7871b          	addiw	a4,a5,12
    80004d84:	00c77e63          	bgeu	a4,a2,80004da0 <__memset+0x1c8>
    80004d88:	00e50733          	add	a4,a0,a4
    80004d8c:	00b70023          	sb	a1,0(a4)
    80004d90:	00d7879b          	addiw	a5,a5,13
    80004d94:	00c7f663          	bgeu	a5,a2,80004da0 <__memset+0x1c8>
    80004d98:	00f507b3          	add	a5,a0,a5
    80004d9c:	00b78023          	sb	a1,0(a5)
    80004da0:	00813403          	ld	s0,8(sp)
    80004da4:	01010113          	addi	sp,sp,16
    80004da8:	00008067          	ret
    80004dac:	00b00693          	li	a3,11
    80004db0:	e55ff06f          	j	80004c04 <__memset+0x2c>
    80004db4:	00300e93          	li	t4,3
    80004db8:	ea5ff06f          	j	80004c5c <__memset+0x84>
    80004dbc:	00100e93          	li	t4,1
    80004dc0:	e9dff06f          	j	80004c5c <__memset+0x84>
    80004dc4:	00000e93          	li	t4,0
    80004dc8:	e95ff06f          	j	80004c5c <__memset+0x84>
    80004dcc:	00000793          	li	a5,0
    80004dd0:	ef9ff06f          	j	80004cc8 <__memset+0xf0>
    80004dd4:	00200e93          	li	t4,2
    80004dd8:	e85ff06f          	j	80004c5c <__memset+0x84>
    80004ddc:	00400e93          	li	t4,4
    80004de0:	e7dff06f          	j	80004c5c <__memset+0x84>
    80004de4:	00500e93          	li	t4,5
    80004de8:	e75ff06f          	j	80004c5c <__memset+0x84>
    80004dec:	00600e93          	li	t4,6
    80004df0:	e6dff06f          	j	80004c5c <__memset+0x84>

0000000080004df4 <__memmove>:
    80004df4:	ff010113          	addi	sp,sp,-16
    80004df8:	00813423          	sd	s0,8(sp)
    80004dfc:	01010413          	addi	s0,sp,16
    80004e00:	0e060863          	beqz	a2,80004ef0 <__memmove+0xfc>
    80004e04:	fff6069b          	addiw	a3,a2,-1
    80004e08:	0006881b          	sext.w	a6,a3
    80004e0c:	0ea5e863          	bltu	a1,a0,80004efc <__memmove+0x108>
    80004e10:	00758713          	addi	a4,a1,7
    80004e14:	00a5e7b3          	or	a5,a1,a0
    80004e18:	40a70733          	sub	a4,a4,a0
    80004e1c:	0077f793          	andi	a5,a5,7
    80004e20:	00f73713          	sltiu	a4,a4,15
    80004e24:	00174713          	xori	a4,a4,1
    80004e28:	0017b793          	seqz	a5,a5
    80004e2c:	00e7f7b3          	and	a5,a5,a4
    80004e30:	10078863          	beqz	a5,80004f40 <__memmove+0x14c>
    80004e34:	00900793          	li	a5,9
    80004e38:	1107f463          	bgeu	a5,a6,80004f40 <__memmove+0x14c>
    80004e3c:	0036581b          	srliw	a6,a2,0x3
    80004e40:	fff8081b          	addiw	a6,a6,-1
    80004e44:	02081813          	slli	a6,a6,0x20
    80004e48:	01d85893          	srli	a7,a6,0x1d
    80004e4c:	00858813          	addi	a6,a1,8
    80004e50:	00058793          	mv	a5,a1
    80004e54:	00050713          	mv	a4,a0
    80004e58:	01088833          	add	a6,a7,a6
    80004e5c:	0007b883          	ld	a7,0(a5)
    80004e60:	00878793          	addi	a5,a5,8
    80004e64:	00870713          	addi	a4,a4,8
    80004e68:	ff173c23          	sd	a7,-8(a4)
    80004e6c:	ff0798e3          	bne	a5,a6,80004e5c <__memmove+0x68>
    80004e70:	ff867713          	andi	a4,a2,-8
    80004e74:	02071793          	slli	a5,a4,0x20
    80004e78:	0207d793          	srli	a5,a5,0x20
    80004e7c:	00f585b3          	add	a1,a1,a5
    80004e80:	40e686bb          	subw	a3,a3,a4
    80004e84:	00f507b3          	add	a5,a0,a5
    80004e88:	06e60463          	beq	a2,a4,80004ef0 <__memmove+0xfc>
    80004e8c:	0005c703          	lbu	a4,0(a1)
    80004e90:	00e78023          	sb	a4,0(a5)
    80004e94:	04068e63          	beqz	a3,80004ef0 <__memmove+0xfc>
    80004e98:	0015c603          	lbu	a2,1(a1)
    80004e9c:	00100713          	li	a4,1
    80004ea0:	00c780a3          	sb	a2,1(a5)
    80004ea4:	04e68663          	beq	a3,a4,80004ef0 <__memmove+0xfc>
    80004ea8:	0025c603          	lbu	a2,2(a1)
    80004eac:	00200713          	li	a4,2
    80004eb0:	00c78123          	sb	a2,2(a5)
    80004eb4:	02e68e63          	beq	a3,a4,80004ef0 <__memmove+0xfc>
    80004eb8:	0035c603          	lbu	a2,3(a1)
    80004ebc:	00300713          	li	a4,3
    80004ec0:	00c781a3          	sb	a2,3(a5)
    80004ec4:	02e68663          	beq	a3,a4,80004ef0 <__memmove+0xfc>
    80004ec8:	0045c603          	lbu	a2,4(a1)
    80004ecc:	00400713          	li	a4,4
    80004ed0:	00c78223          	sb	a2,4(a5)
    80004ed4:	00e68e63          	beq	a3,a4,80004ef0 <__memmove+0xfc>
    80004ed8:	0055c603          	lbu	a2,5(a1)
    80004edc:	00500713          	li	a4,5
    80004ee0:	00c782a3          	sb	a2,5(a5)
    80004ee4:	00e68663          	beq	a3,a4,80004ef0 <__memmove+0xfc>
    80004ee8:	0065c703          	lbu	a4,6(a1)
    80004eec:	00e78323          	sb	a4,6(a5)
    80004ef0:	00813403          	ld	s0,8(sp)
    80004ef4:	01010113          	addi	sp,sp,16
    80004ef8:	00008067          	ret
    80004efc:	02061713          	slli	a4,a2,0x20
    80004f00:	02075713          	srli	a4,a4,0x20
    80004f04:	00e587b3          	add	a5,a1,a4
    80004f08:	f0f574e3          	bgeu	a0,a5,80004e10 <__memmove+0x1c>
    80004f0c:	02069613          	slli	a2,a3,0x20
    80004f10:	02065613          	srli	a2,a2,0x20
    80004f14:	fff64613          	not	a2,a2
    80004f18:	00e50733          	add	a4,a0,a4
    80004f1c:	00c78633          	add	a2,a5,a2
    80004f20:	fff7c683          	lbu	a3,-1(a5)
    80004f24:	fff78793          	addi	a5,a5,-1
    80004f28:	fff70713          	addi	a4,a4,-1
    80004f2c:	00d70023          	sb	a3,0(a4)
    80004f30:	fec798e3          	bne	a5,a2,80004f20 <__memmove+0x12c>
    80004f34:	00813403          	ld	s0,8(sp)
    80004f38:	01010113          	addi	sp,sp,16
    80004f3c:	00008067          	ret
    80004f40:	02069713          	slli	a4,a3,0x20
    80004f44:	02075713          	srli	a4,a4,0x20
    80004f48:	00170713          	addi	a4,a4,1
    80004f4c:	00e50733          	add	a4,a0,a4
    80004f50:	00050793          	mv	a5,a0
    80004f54:	0005c683          	lbu	a3,0(a1)
    80004f58:	00178793          	addi	a5,a5,1
    80004f5c:	00158593          	addi	a1,a1,1
    80004f60:	fed78fa3          	sb	a3,-1(a5)
    80004f64:	fee798e3          	bne	a5,a4,80004f54 <__memmove+0x160>
    80004f68:	f89ff06f          	j	80004ef0 <__memmove+0xfc>

0000000080004f6c <__mem_free>:
    80004f6c:	ff010113          	addi	sp,sp,-16
    80004f70:	00813423          	sd	s0,8(sp)
    80004f74:	01010413          	addi	s0,sp,16
    80004f78:	00002597          	auipc	a1,0x2
    80004f7c:	0f058593          	addi	a1,a1,240 # 80007068 <freep>
    80004f80:	0005b783          	ld	a5,0(a1)
    80004f84:	ff050693          	addi	a3,a0,-16
    80004f88:	0007b703          	ld	a4,0(a5)
    80004f8c:	00d7fc63          	bgeu	a5,a3,80004fa4 <__mem_free+0x38>
    80004f90:	00e6ee63          	bltu	a3,a4,80004fac <__mem_free+0x40>
    80004f94:	00e7fc63          	bgeu	a5,a4,80004fac <__mem_free+0x40>
    80004f98:	00070793          	mv	a5,a4
    80004f9c:	0007b703          	ld	a4,0(a5)
    80004fa0:	fed7e8e3          	bltu	a5,a3,80004f90 <__mem_free+0x24>
    80004fa4:	fee7eae3          	bltu	a5,a4,80004f98 <__mem_free+0x2c>
    80004fa8:	fee6f8e3          	bgeu	a3,a4,80004f98 <__mem_free+0x2c>
    80004fac:	ff852803          	lw	a6,-8(a0)
    80004fb0:	02081613          	slli	a2,a6,0x20
    80004fb4:	01c65613          	srli	a2,a2,0x1c
    80004fb8:	00c68633          	add	a2,a3,a2
    80004fbc:	02c70a63          	beq	a4,a2,80004ff0 <__mem_free+0x84>
    80004fc0:	fee53823          	sd	a4,-16(a0)
    80004fc4:	0087a503          	lw	a0,8(a5)
    80004fc8:	02051613          	slli	a2,a0,0x20
    80004fcc:	01c65613          	srli	a2,a2,0x1c
    80004fd0:	00c78633          	add	a2,a5,a2
    80004fd4:	04c68263          	beq	a3,a2,80005018 <__mem_free+0xac>
    80004fd8:	00813403          	ld	s0,8(sp)
    80004fdc:	00d7b023          	sd	a3,0(a5)
    80004fe0:	00f5b023          	sd	a5,0(a1)
    80004fe4:	00000513          	li	a0,0
    80004fe8:	01010113          	addi	sp,sp,16
    80004fec:	00008067          	ret
    80004ff0:	00872603          	lw	a2,8(a4)
    80004ff4:	00073703          	ld	a4,0(a4)
    80004ff8:	0106083b          	addw	a6,a2,a6
    80004ffc:	ff052c23          	sw	a6,-8(a0)
    80005000:	fee53823          	sd	a4,-16(a0)
    80005004:	0087a503          	lw	a0,8(a5)
    80005008:	02051613          	slli	a2,a0,0x20
    8000500c:	01c65613          	srli	a2,a2,0x1c
    80005010:	00c78633          	add	a2,a5,a2
    80005014:	fcc692e3          	bne	a3,a2,80004fd8 <__mem_free+0x6c>
    80005018:	00813403          	ld	s0,8(sp)
    8000501c:	0105053b          	addw	a0,a0,a6
    80005020:	00a7a423          	sw	a0,8(a5)
    80005024:	00e7b023          	sd	a4,0(a5)
    80005028:	00f5b023          	sd	a5,0(a1)
    8000502c:	00000513          	li	a0,0
    80005030:	01010113          	addi	sp,sp,16
    80005034:	00008067          	ret

0000000080005038 <__mem_alloc>:
    80005038:	fc010113          	addi	sp,sp,-64
    8000503c:	02813823          	sd	s0,48(sp)
    80005040:	02913423          	sd	s1,40(sp)
    80005044:	03213023          	sd	s2,32(sp)
    80005048:	01513423          	sd	s5,8(sp)
    8000504c:	02113c23          	sd	ra,56(sp)
    80005050:	01313c23          	sd	s3,24(sp)
    80005054:	01413823          	sd	s4,16(sp)
    80005058:	01613023          	sd	s6,0(sp)
    8000505c:	04010413          	addi	s0,sp,64
    80005060:	00002a97          	auipc	s5,0x2
    80005064:	008a8a93          	addi	s5,s5,8 # 80007068 <freep>
    80005068:	00f50913          	addi	s2,a0,15
    8000506c:	000ab683          	ld	a3,0(s5)
    80005070:	00495913          	srli	s2,s2,0x4
    80005074:	0019049b          	addiw	s1,s2,1
    80005078:	00048913          	mv	s2,s1
    8000507c:	0c068c63          	beqz	a3,80005154 <__mem_alloc+0x11c>
    80005080:	0006b503          	ld	a0,0(a3)
    80005084:	00852703          	lw	a4,8(a0)
    80005088:	10977063          	bgeu	a4,s1,80005188 <__mem_alloc+0x150>
    8000508c:	000017b7          	lui	a5,0x1
    80005090:	0009099b          	sext.w	s3,s2
    80005094:	0af4e863          	bltu	s1,a5,80005144 <__mem_alloc+0x10c>
    80005098:	02099a13          	slli	s4,s3,0x20
    8000509c:	01ca5a13          	srli	s4,s4,0x1c
    800050a0:	fff00b13          	li	s6,-1
    800050a4:	0100006f          	j	800050b4 <__mem_alloc+0x7c>
    800050a8:	0007b503          	ld	a0,0(a5) # 1000 <_entry-0x7ffff000>
    800050ac:	00852703          	lw	a4,8(a0)
    800050b0:	04977463          	bgeu	a4,s1,800050f8 <__mem_alloc+0xc0>
    800050b4:	00050793          	mv	a5,a0
    800050b8:	fea698e3          	bne	a3,a0,800050a8 <__mem_alloc+0x70>
    800050bc:	000a0513          	mv	a0,s4
    800050c0:	00000097          	auipc	ra,0x0
    800050c4:	0d0080e7          	jalr	208(ra) # 80005190 <kvmincrease>
    800050c8:	00050793          	mv	a5,a0
    800050cc:	01050513          	addi	a0,a0,16
    800050d0:	07678e63          	beq	a5,s6,8000514c <__mem_alloc+0x114>
    800050d4:	0137a423          	sw	s3,8(a5)
    800050d8:	00000097          	auipc	ra,0x0
    800050dc:	e94080e7          	jalr	-364(ra) # 80004f6c <__mem_free>
    800050e0:	000ab783          	ld	a5,0(s5)
    800050e4:	06078463          	beqz	a5,8000514c <__mem_alloc+0x114>
    800050e8:	0007b503          	ld	a0,0(a5)
    800050ec:	00078693          	mv	a3,a5
    800050f0:	00852703          	lw	a4,8(a0)
    800050f4:	fc9760e3          	bltu	a4,s1,800050b4 <__mem_alloc+0x7c>
    800050f8:	08e48263          	beq	s1,a4,8000517c <__mem_alloc+0x144>
    800050fc:	4127073b          	subw	a4,a4,s2
    80005100:	02071693          	slli	a3,a4,0x20
    80005104:	01c6d693          	srli	a3,a3,0x1c
    80005108:	00e52423          	sw	a4,8(a0)
    8000510c:	00d50533          	add	a0,a0,a3
    80005110:	01252423          	sw	s2,8(a0)
    80005114:	00fab023          	sd	a5,0(s5)
    80005118:	01050513          	addi	a0,a0,16
    8000511c:	03813083          	ld	ra,56(sp)
    80005120:	03013403          	ld	s0,48(sp)
    80005124:	02813483          	ld	s1,40(sp)
    80005128:	02013903          	ld	s2,32(sp)
    8000512c:	01813983          	ld	s3,24(sp)
    80005130:	01013a03          	ld	s4,16(sp)
    80005134:	00813a83          	ld	s5,8(sp)
    80005138:	00013b03          	ld	s6,0(sp)
    8000513c:	04010113          	addi	sp,sp,64
    80005140:	00008067          	ret
    80005144:	000019b7          	lui	s3,0x1
    80005148:	f51ff06f          	j	80005098 <__mem_alloc+0x60>
    8000514c:	00000513          	li	a0,0
    80005150:	fcdff06f          	j	8000511c <__mem_alloc+0xe4>
    80005154:	00003797          	auipc	a5,0x3
    80005158:	40c78793          	addi	a5,a5,1036 # 80008560 <base>
    8000515c:	00078513          	mv	a0,a5
    80005160:	00fab023          	sd	a5,0(s5)
    80005164:	00f7b023          	sd	a5,0(a5)
    80005168:	00000713          	li	a4,0
    8000516c:	00003797          	auipc	a5,0x3
    80005170:	3e07ae23          	sw	zero,1020(a5) # 80008568 <base+0x8>
    80005174:	00050693          	mv	a3,a0
    80005178:	f11ff06f          	j	80005088 <__mem_alloc+0x50>
    8000517c:	00053703          	ld	a4,0(a0)
    80005180:	00e7b023          	sd	a4,0(a5)
    80005184:	f91ff06f          	j	80005114 <__mem_alloc+0xdc>
    80005188:	00068793          	mv	a5,a3
    8000518c:	f6dff06f          	j	800050f8 <__mem_alloc+0xc0>

0000000080005190 <kvmincrease>:
    80005190:	fe010113          	addi	sp,sp,-32
    80005194:	01213023          	sd	s2,0(sp)
    80005198:	00001937          	lui	s2,0x1
    8000519c:	fff90913          	addi	s2,s2,-1 # fff <_entry-0x7ffff001>
    800051a0:	00813823          	sd	s0,16(sp)
    800051a4:	00113c23          	sd	ra,24(sp)
    800051a8:	00913423          	sd	s1,8(sp)
    800051ac:	02010413          	addi	s0,sp,32
    800051b0:	01250933          	add	s2,a0,s2
    800051b4:	00c95913          	srli	s2,s2,0xc
    800051b8:	02090863          	beqz	s2,800051e8 <kvmincrease+0x58>
    800051bc:	00000493          	li	s1,0
    800051c0:	00148493          	addi	s1,s1,1
    800051c4:	fffff097          	auipc	ra,0xfffff
    800051c8:	5dc080e7          	jalr	1500(ra) # 800047a0 <kalloc>
    800051cc:	fe991ae3          	bne	s2,s1,800051c0 <kvmincrease+0x30>
    800051d0:	01813083          	ld	ra,24(sp)
    800051d4:	01013403          	ld	s0,16(sp)
    800051d8:	00813483          	ld	s1,8(sp)
    800051dc:	00013903          	ld	s2,0(sp)
    800051e0:	02010113          	addi	sp,sp,32
    800051e4:	00008067          	ret
    800051e8:	01813083          	ld	ra,24(sp)
    800051ec:	01013403          	ld	s0,16(sp)
    800051f0:	00813483          	ld	s1,8(sp)
    800051f4:	00013903          	ld	s2,0(sp)
    800051f8:	00000513          	li	a0,0
    800051fc:	02010113          	addi	sp,sp,32
    80005200:	00008067          	ret
	...
