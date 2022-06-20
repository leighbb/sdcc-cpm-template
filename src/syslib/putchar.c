#include "cpm_sysfunc.h"

#include "common_datatypes.h"
#include "cpmbdos.h"

#if defined(__SDCCCALL) && (__SDCCCALL > 0)
#if (__SDCCCALL > 1)
#error unsupported SDCC calling convention (>1)
#else
/*
 * SDCC calling convention version 1
 * - char argument in register a
 * - int result in de
 */
int putchar(char c) __naked {
	c;
	__asm
		cp	#10
		jr	z,00002$
00001$:
		push	ix
                ld      c,#C_WRITE
                ld      e,a
		ld	d,#0
		push	de
                call    5
		pop	de
		pop	ix
                ret
00002$:
		ld	a,#13
		call	00001$
		ld	a,#10
		jr	00001$
	__endasm;
}
#endif
#else
/*
 * SDCC calling convention version 0
 * - char argument on stack
 * - int result in hl
 */
int putchar(char c) __naked {
	c;
	__asm
		ld	hl,#2
		add	hl,sp
		ld	a,(hl)
		cp	#10
		jr	z,00002$
00001$:
		push	ix
		ld	c,#C_WRITE
		ld	e,a
		ld	d,#0
		push	de
		call	5
		pop	hl
		pop	ix
		ret
00002$:
		ld	a,#13
		call	00001$
		ld	a,#10
		jr	00001$
	__endasm;
}
#endif
