/*
 * Copyright (c) 2013-2019, ARM Limited and Contributors. All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 */

#include <arch.h>
#include <asm_macros.S>
#include <drivers/console.h>
#include <platform_def.h>

	.weak	plat_report_exception
	.weak	plat_reset_handler
	.weak	plat_disable_acp
	.weak	bl1_plat_prepare_exit
	.weak	plat_panic_handler
	.weak	bl31_plat_enable_mmu
	.weak	bl32_plat_enable_mmu

#ifndef PLAT_OVERRIDE_EXCEPTION_HANDLERS
	.globl	plat_handle_el3_sync_sp_el0
	.globl	plat_handle_el3_irq_sp_el0
	.globl	plat_handle_el3_fiq_sp_el0
	.globl	plat_handle_el3_ea_sp_el0
	.globl	plat_handle_el3_sync_sp_elx
	.globl	plat_handle_el3_irq_sp_elx
	.globl	plat_handle_el3_fiq_sp_elx
	.globl	plat_handle_el3_ea_sp_elx
	.globl	plat_handle_el3_ea_lel_aa64
	.globl	plat_handle_el3_ea_lel_aa32
	.globl	plat_handle_imp_def_el3_handler
#endif /* PLAT_OVERRIDE_EXCEPTION_HANDLERS */

	.weak	plat_handle_uncontainable_ea
	.weak	plat_handle_double_fault

#define MPIDR_RES_BIT_MASK	0xff000000

	/* -----------------------------------------------------
	 * Placeholder function which should be redefined by
	 * each platform.
	 * -----------------------------------------------------
	 */
func plat_report_exception
	ret
endfunc plat_report_exception

	/* -----------------------------------------------------
	 * Placeholder function which should be redefined by
	 * each platform. This function should preserve x19 - x29.
	 * -----------------------------------------------------
	 */
func plat_reset_handler
	ret
endfunc plat_reset_handler

	/* -----------------------------------------------------
	 * Placeholder function which should be redefined by
	 * each platform. This function is allowed to use
	 * registers x0 - x17.
	 * -----------------------------------------------------
	 */
func plat_disable_acp
	ret
endfunc plat_disable_acp

	/* -----------------------------------------------------
	 * void bl1_plat_prepare_exit(entry_point_info_t *ep_info);
	 * Called before exiting BL1. Default: do nothing
	 * -----------------------------------------------------
	 */
func bl1_plat_prepare_exit
	ret
endfunc bl1_plat_prepare_exit

	/* -----------------------------------------------------
	 * void plat_panic_handler(void) __dead2;
	 * Endless loop by default.
	 * -----------------------------------------------------
	 */
func plat_panic_handler
	wfi
	b	plat_panic_handler
endfunc plat_panic_handler

	/* -----------------------------------------------------
	 * void bl31_plat_enable_mmu(uint32_t flags);
	 *
	 * Enable MMU in BL31.
	 * -----------------------------------------------------
	 */
func bl31_plat_enable_mmu
	b	enable_mmu_direct_el3
endfunc bl31_plat_enable_mmu

	/* -----------------------------------------------------
	 * void bl32_plat_enable_mmu(uint32_t flags);
	 *
	 * Enable MMU in BL32.
	 * -----------------------------------------------------
	 */
func bl32_plat_enable_mmu
	b	enable_mmu_direct_el1
endfunc bl32_plat_enable_mmu


#ifndef PLAT_OVERRIDE_EXCEPTION_HANDLERS
/* ---------------------------------------------------------------------
 * Current EL with SP_EL0 : 0x0 - 0x200
 * ---------------------------------------------------------------------
 */
	/* -----------------------------------------------------
	 * Platform handler for EL3 Sync SP_EL0 Exception.
	 * -----------------------------------------------------
	 */
func plat_handle_el3_sync_sp_el0
	b	handle_el3_sync_exception
endfunc plat_handle_el3_sync_sp_el0

	/* -----------------------------------------------------
	 * Platform handler for EL3 IRQ SP_EL0 Exception.
	 * -----------------------------------------------------
	 */
func plat_handle_el3_irq_sp_el0
	b	report_unhandled_interrupt
endfunc plat_handle_el3_irq_sp_el0

	/* -----------------------------------------------------
	 * Platform handler for EL3 FIQ SP_EL0 Exception.
	 * -----------------------------------------------------
	 */
func plat_handle_el3_fiq_sp_el0
	b	report_unhandled_interrupt
endfunc plat_handle_el3_fiq_sp_el0

	/* -----------------------------------------------------
	 * Platform handler for EL3 External Abort SP_EL0.
	 * -----------------------------------------------------
	 */
func plat_handle_el3_ea_sp_el0
	b	report_unhandled_exception
endfunc plat_handle_el3_ea_sp_el0

/* ---------------------------------------------------------------------
 * Current EL with SP_ELx: 0x200 - 0x400
 * ---------------------------------------------------------------------
 */
	/* -----------------------------------------------------
	 * Platform handler for EL3 Sync SP_ELx Exception.
	 * -----------------------------------------------------
	 */
func plat_handle_el3_sync_sp_elx
	b	report_unhandled_exception
endfunc plat_handle_el3_sync_sp_elx

	/* -----------------------------------------------------
	 * Platform handler for EL3 IRQ SP_ELx Exception.
	 * -----------------------------------------------------
	 */
func plat_handle_el3_irq_sp_elx
	b	report_unhandled_interrupt
endfunc plat_handle_el3_irq_sp_elx

	/* -----------------------------------------------------
	 * Platform handler for EL3 FIQ SP_ELx Exception.
	 * -----------------------------------------------------
	 */
func plat_handle_el3_fiq_sp_elx
	b	report_unhandled_interrupt
endfunc plat_handle_el3_fiq_sp_elx

	/* -----------------------------------------------------
	 * Platform handler for EL3 External Abort SP_ELx.
	 * -----------------------------------------------------
	 */
func plat_handle_el3_ea_sp_elx
	b	report_unhandled_exception
endfunc plat_handle_el3_ea_sp_elx

/* ---------------------------------------------------------------------
 * Lower EL using AArch64 : 0x400 - 0x600
 * ---------------------------------------------------------------------
 */

    /* -----------------------------------------------------
	 * Platform handler for EL3 External Abort aarch64.
	 * -----------------------------------------------------
	 */
func plat_handle_el3_ea_lel_aa64
	b	report_unhandled_exception
endfunc plat_handle_el3_ea_lel_aa64

/* ---------------------------------------------------------------------
 * Lower EL using AArch32 : 0x600 - 0x800
 * ---------------------------------------------------------------------
 */
    /* -----------------------------------------------------
	 * Platform handler for EL3 External Abort aarch32.
	 * -----------------------------------------------------
	 */
func plat_handle_el3_ea_lel_aa32
	b	report_unhandled_exception
endfunc plat_handle_el3_ea_lel_aa32

	/* -----------------------------------------------------
	 * Platform handler for imp_def_el3_handler.
	 * -----------------------------------------------------
	 */
func plat_handle_imp_def_el3_handler
	b	report_unhandled_exception
endfunc plat_handle_imp_def_el3_handler
#endif /* PLAT_OVERRIDE_EXCEPTION_HANDLERS */

	/* -----------------------------------------------------
	 * Platform handler for Uncontainable External Abort.
	 *
	 * x0: EA reason
	 * x1: EA syndrome
	 * -----------------------------------------------------
	 */
func plat_handle_uncontainable_ea
	b	report_unhandled_exception
endfunc plat_handle_uncontainable_ea

	/* -----------------------------------------------------
	 * Platform handler for Double Fault.
	 *
	 * x0: EA reason
	 * x1: EA syndrome
	 * -----------------------------------------------------
	 */
func plat_handle_double_fault
	b	report_unhandled_exception
endfunc plat_handle_double_fault
