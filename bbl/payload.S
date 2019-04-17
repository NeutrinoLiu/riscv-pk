// See LICENSE for license details.

#include "config.h"
#include "encoding.h"

  .section ".temporary_dtb", "a"
  .globl _temporary_dtb
 _temporary_dtb:
  .incbin TEMPORARY_DTB

  .section ".payload","a",@progbits
  
#if RELAXED_ALIGNMENT
  /* align payload minimally */
  .align 3
#else
  /* align payload to megapage */
  .align RISCV_PGSHIFT + RISCV_PGLEVEL_BITS
#endif

  .globl _payload_start, _payload_end
_payload_start:
  .incbin BBL_PAYLOAD
_payload_end:
