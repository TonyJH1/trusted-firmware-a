/*
 * Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 */
#ifndef QTI_PLATFORM_SETUP_H
#define QTI_PLATFORM_SETUP_H

#include <stdint.h>

#include <drivers/qti/accesscontrol/accesscontrol.h>
#include <drivers/qti/accesscontrol/xpu.h>
#include <drivers/qti/qtimer/qtimer.h>
#include <drivers/qti/sec_core/sec_core.h>
#include <drivers/qti/smmu/smmu.h>
#include <drivers/qti/watchdog/watchdog.h>

#include <qti_interrupt_svc.h>
#include <qti_plat.h>
#include <qtiseclib_interface.h>

typedef void (*qti_platform_init_func)(void);

qti_platform_init_func qti_platform_init_functions[]={
	qti_smmu_init,
	qti_interrupt_svc_init,
	qti_sec_core_init,
	qti_qtimer_init,
	qti_watchdog_init,
	qti_accesscontrol_init,
	qtiseclib_bl31_platform_setup,
	0
};

#endif /* QTI_PLATFORM_SETUP_H */