;-------------------------------------------------------------------------------
; MSP430 Assembler Code Template for use with TI Code Composer Studio
;
;
;-------------------------------------------------------------------------------
      .cdecls C,LIST,"msp430.h"       ; Include device header file
            
;-------------------------------------------------------------------------------
      .def    RESET                   ; Export program entry-point to
                                      ; make it known to linker.
;-------------------------------------------------------------------------------
      .text                           ; Assemble into program memory.
      .retain                         ; Override ELF conditional linking
                                      ; and retain current section.
      .retainrefs                     ; And retain any sections that have
                                      ; references to current section.

;-------------------------------------------------------------------------------
RESET    mov.w   #__STACK_END,SP         ; Initialize stackpointer
StopWDT  mov.w   #WDTPW|WDTHOLD,&WDTCTL  ; Stop watchdog timer


;-------------------------------------------------------------------------------
; Main loop here
;-------------------------------------------------------------------------------
init:
	CLR.b	P1OUT				;Clear Port 1 output
	CLR.b	P6OUT				;Clear Port 6 output
      
      ;Set Led 2 as output port
	mov.b	#01000000b, P6DIR		;P6.6 output (LED2)

	;set P4.1 as input for Switch1
	mov.b	#00000000b, P4DIR
	bis.b	#BIT1, &P4REN			;enable pull up pull down
	bis.b	#BIT1, &P4OUT			;select pull up

	bic.w	#0001h, &PM5CTL0		;GPIO power on


main_loop:
check_S1:
	bit.b	#BIT1, &P4IN			;check the switch bit value (pull up)
	jnz	check_S1

led1_toggle:
	xor.b	#01000000b, P6OUT		;toggle bit P1OUT

	jmp	main_loop			;repeat to main forever

	nop
                                            
;-------------------------------------------------------------------------------
; Stack Pointer definition
;-------------------------------------------------------------------------------
      .global __STACK_END
      .sect   .stack
            
;-------------------------------------------------------------------------------
; Interrupt Vectors
;-------------------------------------------------------------------------------
       .sect   ".reset"                ; MSP430 RESET Vector
       .short  RESET
