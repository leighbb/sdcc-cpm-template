#include "cpm_sysfunc.h"

#include "common_datatypes.h"
#include "cpmbdos.h"

#if defined(__SDCCCALL) && (__SDCCCALL > 0)
#if (__SDCCCALL > 1)
#error unsupported SDCC calling convention (>1)
#else
/* SDCC calling convention version 1 - argument in register a */
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
#else
/* SDCC calling convention version 0 - argument on stack */
int putchar(char c) __naked {
	c;
	__asm
		push	ix
		ld	hl,#4
		add	hl,sp
		ld	a,(hl)
		jr	z,00002$
00001$:
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
