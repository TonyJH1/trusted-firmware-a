/*
 * Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 */
#ifndef QTI_PLATFORM_SETUP_H
#define QTI_PLATFORM_SETUP_H

#include <stdint.h>

#include <qti_interrupt_svc.h>

void sec_core(void);
void timer_qtimer_security_config(void);
void timer_sec_wdog_init(void);
void rpmh_client_init(void);
void cmd_db_tzbsp_init(void);
void pdcTcs_initialize(void);
void pdc_seq_sys_init(void);
void pwr_utils_lvl_init(void);
void icbuarb_init(void);
void HAL_avs_Init(void);
void Clock_Init(void);
void icb_error_init(void);
void icbcfg_init(void);
void Tlmm_Init(void);
void HAL_avs_SecondaryRailInit(void);
void ac_init(void);
void smmu_init(void);
void Clock_TZInitDone(void);
void pdcOS_initialize(void);
void int_svc_init(void);

static inline void dbg_init(void) {}
static inline void lmh_config_init(void) {}
static inline void cpucp_start(void) {}
static inline void cpucp_clkdom_init(void) {}

typedef void (*qti_platform_init_func)(void);

qti_platform_init_func qti_platform_init_functions[]={
	qti_interrupt_svc_init,

	sec_core,
	timer_qtimer_security_config,
	timer_sec_wdog_init,
	rpmh_client_init,
	cmd_db_tzbsp_init,
	pdcTcs_initialize,
	pdc_seq_sys_init,
	pwr_utils_lvl_init,
	icbuarb_init,
	HAL_avs_Init,
	Clock_Init,
	icb_error_init,
	icbcfg_init,
	Tlmm_Init,
	HAL_avs_SecondaryRailInit,
	lmh_config_init,
	ac_init,
	smmu_init,
	dbg_init,
	Clock_TZInitDone,
	pdcOS_initialize,
	int_svc_init,
	cpucp_start,
	cpucp_clkdom_init,
	0
};

#endif /* QTI_PLATFORM_SETUP_H */
