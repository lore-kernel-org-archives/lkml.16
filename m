Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C30288510;
	Wed, 25 Jun 2025 09:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842603; cv=none; b=WN840ck/OrfWqlLGwz8xKzY+IQ6D8jXnm72HzM7KCqGjrGTdehkoE5/SWdcc6C9ieVz1bfx+7GAoKGH8d8UFWuJ4ATyJP2n4DlXqD/nHahWo7ZHhX3X8pw5IRM1el+gQtDzQ49K6oyNYt5usgQH83x1e7YiWrTvYTc624pfX50E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842603; c=relaxed/simple;
	bh=sqvg4CEuP24G1oqgyP3iciZZc6kw1pJPpRXMs7O5zu0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ow6vy5qxeV6XlPuaET8I5c9CjIsLkBjRJFKClWbZdz586epH5rrt/u1Ftf3sUJnDIzTZSL41E8uwgSXr6SrqUdX97wmsAU6pad801yrtju3OwxBabIYX0J4htkn+VelL+9s/D9dqGF4vDsGj7K5OIyA/XJ+SzX5jCWHEYYiOlFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=3aPgyhqN; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="3aPgyhqN"
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P5vmrD005164;
	Wed, 25 Jun 2025 11:09:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	xuDJe2W3RtxW1x6yjr/Ql0xkRmkhKX6+97ANyqL1lVE=; b=3aPgyhqNFyt3cEJJ
	FUMCkr+DAJ6joUhafCnRRrLb3yUV790IBUGTLaIqpF6t1PbdMZHhvs9cI/kcCbWH
	NeF84olbGJnDvLuMd3mkPUwzUIupPuGpcVpH5TCvK8nq9e26F8N1p0u/t0oJ71Rt
	2bC2d8FqD5Ojvw43+Kop1D6tsdfq/IGmkAa2V124cMuRg7IyvCrR8atqfmAuaT0l
	+YGPLJu06p0BKhacGmviyx0Kpwo0ckCge6dQl2ROFjXnX5E2SFSnzq0mXomc1S1y
	BEHpBVouJWeqG/jyfQwV5v6vPK66aRXysxVtN0p0Fag0jZlR1z8R2IPOWsMoNasU
	Qj57Ag==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47dhvbrtpw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 11:09:36 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0D48C4004B;
	Wed, 25 Jun 2025 11:08:24 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 77924B29166;
	Wed, 25 Jun 2025 11:07:34 +0200 (CEST)
Received: from localhost (10.48.87.144) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 25 Jun
 2025 11:07:34 +0200
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Wed, 25 Jun 2025 11:07:25 +0200
Subject: [PATCH RESEND v4 2/3] clk: stm32: introduce clocks for STM32MP21
 platform
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250625-upstream_rcc_mp21-v4-2-9368a86c8515@foss.st.com>
References: <20250625-upstream_rcc_mp21-v4-0-9368a86c8515@foss.st.com>
In-Reply-To: <20250625-upstream_rcc_mp21-v4-0-9368a86c8515@foss.st.com>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
        Nicolas Le Bayon
	<nicolas.le.bayon@foss.st.com>,
        Alok Tiwari <alok.a.tiwari@oracle.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_02,2025-06-23_07,2025-03-28_01

This driver is intended for the STM32MP21 clock family.

Signed-off-by: Nicolas Le Bayon <nicolas.le.bayon@foss.st.com>
Reviewed-by: Alok Tiwari <alok.a.tiwari@oracle.com>
Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 drivers/clk/stm32/Kconfig         |    7 +
 drivers/clk/stm32/Makefile        |    1 +
 drivers/clk/stm32/clk-stm32mp21.c | 1586 +++++++++++++++++++++++++++++++++++++
 drivers/clk/stm32/stm32mp21_rcc.h |  651 +++++++++++++++
 4 files changed, 2245 insertions(+)

diff --git a/drivers/clk/stm32/Kconfig b/drivers/clk/stm32/Kconfig
index dca409d52652213cfbd8d5ecf1a339ea53ba5d52..9c73c146db8e67e5dc414704f2ee624e58dbfde4 100644
--- a/drivers/clk/stm32/Kconfig
+++ b/drivers/clk/stm32/Kconfig
@@ -25,6 +25,13 @@ config COMMON_CLK_STM32MP157
 	help
 	  Support for stm32mp15x SoC family clocks.
 
+config COMMON_CLK_STM32MP215
+	bool "Clock driver for stm32mp21x clocks"
+	depends on ARM || ARM64 || COMPILE_TEST
+	default y
+	help
+	  Support for stm32mp21x SoC family clocks
+
 config COMMON_CLK_STM32MP257
 	bool "Clock driver for stm32mp25x clocks"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/stm32/Makefile b/drivers/clk/stm32/Makefile
index 0a627164fccee76054cd747bd100b90670277be9..e04727b59449f43fcc715f94f43f1c8abe63e133 100644
--- a/drivers/clk/stm32/Makefile
+++ b/drivers/clk/stm32/Makefile
@@ -1,3 +1,4 @@
 obj-$(CONFIG_COMMON_CLK_STM32MP135)	+= clk-stm32mp13.o clk-stm32-core.o reset-stm32.o
 obj-$(CONFIG_COMMON_CLK_STM32MP157)	+= clk-stm32mp1.o reset-stm32.o
+obj-$(CONFIG_COMMON_CLK_STM32MP215)	+= clk-stm32mp21.o clk-stm32-core.o reset-stm32.o
 obj-$(CONFIG_COMMON_CLK_STM32MP257)	+= clk-stm32mp25.o clk-stm32-core.o reset-stm32.o
diff --git a/drivers/clk/stm32/clk-stm32mp21.c b/drivers/clk/stm32/clk-stm32mp21.c
new file mode 100644
index 0000000000000000000000000000000000000000..c8a37b716bd559c656e2915792553d63d5f612b6
--- /dev/null
+++ b/drivers/clk/stm32/clk-stm32mp21.c
@@ -0,0 +1,1586 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) STMicroelectronics 2023 - All Rights Reserved
+ * Author: Gabriel Fernandez <gabriel.fernandez@foss.st.com> for STMicroelectronics.
+ */
+
+#include <linux/bus/stm32_firewall_device.h>
+#include <linux/clk-provider.h>
+#include <linux/io.h>
+#include <linux/platform_device.h>
+
+#include "clk-stm32-core.h"
+#include "reset-stm32.h"
+#include "stm32mp21_rcc.h"
+
+#include <dt-bindings/clock/st,stm32mp21-rcc.h>
+#include <dt-bindings/reset/st,stm32mp21-rcc.h>
+
+/* Max clock binding value */
+#define STM32MP21_LAST_CLK	CK_SCMI_KER_ETR
+
+/* Clock security definition */
+#define SECF_NONE		-1
+
+#define RCC_REG_SIZE	32
+#define RCC_SECCFGR(x)	(((x) / RCC_REG_SIZE) * 0x4 + RCC_SECCFGR0)
+#define RCC_CIDCFGR(x)	((x) * 0x8 + RCC_R0CIDCFGR)
+#define RCC_SEMCR(x)	((x) * 0x8 + RCC_R0SEMCR)
+#define RCC_CID1	1
+
+/* Register: RIFSC_CIDCFGR */
+#define RCC_CIDCFGR_CFEN	BIT(0)
+#define RCC_CIDCFGR_SEM_EN	BIT(1)
+#define RCC_CIDCFGR_SEMWLC1_EN	BIT(17)
+#define RCC_CIDCFGR_SCID_MASK	GENMASK(6, 4)
+
+/* Register: RIFSC_SEMCR */
+#define RCC_SEMCR_SEMCID_MASK	GENMASK(6, 4)
+
+#define MP21_RIF_RCC_MCO1		108
+#define MP21_RIF_RCC_MCO2		109
+
+#define SEC_RIFSC_FLAG		BIT(31)
+#define SEC_RIFSC(_id)		((_id) | SEC_RIFSC_FLAG)
+
+enum {
+	HSE,
+	HSI,
+	MSI,
+	LSE,
+	LSI,
+	HSE_DIV2,
+	ICN_HS_MCU,
+	ICN_LS_MCU,
+	ICN_SDMMC,
+	ICN_DDR,
+	ICN_DISPLAY,
+	ICN_HSL,
+	ICN_NIC,
+	FLEXGEN_07,
+	FLEXGEN_08,
+	FLEXGEN_09,
+	FLEXGEN_10,
+	FLEXGEN_11,
+	FLEXGEN_12,
+	FLEXGEN_13,
+	FLEXGEN_14,
+	FLEXGEN_16,
+	FLEXGEN_17,
+	FLEXGEN_18,
+	FLEXGEN_19,
+	FLEXGEN_20,
+	FLEXGEN_21,
+	FLEXGEN_22,
+	FLEXGEN_23,
+	FLEXGEN_24,
+	FLEXGEN_25,
+	FLEXGEN_26,
+	FLEXGEN_27,
+	FLEXGEN_29,
+	FLEXGEN_30,
+	FLEXGEN_31,
+	FLEXGEN_33,
+	FLEXGEN_36,
+	FLEXGEN_37,
+	FLEXGEN_38,
+	FLEXGEN_39,
+	FLEXGEN_40,
+	FLEXGEN_41,
+	FLEXGEN_42,
+	FLEXGEN_43,
+	FLEXGEN_44,
+	FLEXGEN_45,
+	FLEXGEN_46,
+	FLEXGEN_47,
+	FLEXGEN_48,
+	FLEXGEN_50,
+	FLEXGEN_51,
+	FLEXGEN_52,
+	FLEXGEN_53,
+	FLEXGEN_54,
+	FLEXGEN_55,
+	FLEXGEN_56,
+	FLEXGEN_57,
+	FLEXGEN_58,
+	FLEXGEN_61,
+	FLEXGEN_62,
+	FLEXGEN_63,
+	ICN_APB1,
+	ICN_APB2,
+	ICN_APB3,
+	ICN_APB4,
+	ICN_APB5,
+	ICN_APBDBG,
+	TIMG1,
+	TIMG2,
+};
+
+static const struct clk_parent_data adc1_src[] = {
+	{ .index = FLEXGEN_46 },
+	{ .index = ICN_LS_MCU },
+};
+
+static const struct clk_parent_data adc2_src[] = {
+	{ .index = FLEXGEN_47 },
+	{ .index = ICN_LS_MCU },
+	{ .index = FLEXGEN_46 },
+};
+
+static const struct clk_parent_data usb2phy1_src[] = {
+	{ .index = FLEXGEN_57 },
+	{ .index = HSE_DIV2 },
+};
+
+static const struct clk_parent_data usb2phy2_src[] = {
+	{ .index = FLEXGEN_58 },
+	{ .index = HSE_DIV2 },
+};
+
+static const struct clk_parent_data dts_src[] = {
+	{ .index = HSI },
+	{ .index = HSE },
+	{ .index = MSI },
+};
+
+static const struct clk_parent_data mco1_src[] = {
+	{ .index = FLEXGEN_61 },
+};
+
+static const struct clk_parent_data mco2_src[] = {
+	{ .index = FLEXGEN_62 },
+};
+
+enum enum_mux_cfg {
+	MUX_ADC1,
+	MUX_ADC2,
+	MUX_DTS,
+	MUX_MCO1,
+	MUX_MCO2,
+	MUX_USB2PHY1,
+	MUX_USB2PHY2,
+	MUX_NB
+};
+
+#define MUX_CFG(id, _offset, _shift, _width)	\
+	[id] = {				\
+		.offset		= (_offset),	\
+		.shift		= (_shift),	\
+		.width		= (_width),	\
+	}
+
+static const struct stm32_mux_cfg stm32mp21_muxes[MUX_NB] = {
+	MUX_CFG(MUX_ADC1,		RCC_ADC1CFGR,		12,	1),
+	MUX_CFG(MUX_ADC2,		RCC_ADC2CFGR,		12,	2),
+	MUX_CFG(MUX_DTS,		RCC_DTSCFGR,		12,	2),
+	MUX_CFG(MUX_MCO1,		RCC_MCO1CFGR,		0,	1),
+	MUX_CFG(MUX_MCO2,		RCC_MCO2CFGR,		0,	1),
+	MUX_CFG(MUX_USB2PHY1,		RCC_USB2PHY1CFGR,	15,	1),
+	MUX_CFG(MUX_USB2PHY2,		RCC_USB2PHY2CFGR,	15,	1),
+};
+
+enum enum_gate_cfg {
+	GATE_ADC1,
+	GATE_ADC2,
+	GATE_CRC,
+	GATE_CRYP1,
+	GATE_CRYP2,
+	GATE_CSI,
+	GATE_DCMIPP,
+	GATE_DCMIPSSI,
+	GATE_DDRPERFM,
+	GATE_DTS,
+	GATE_ETH1,
+	GATE_ETH1MAC,
+	GATE_ETH1RX,
+	GATE_ETH1STP,
+	GATE_ETH1TX,
+	GATE_ETH2,
+	GATE_ETH2MAC,
+	GATE_ETH2RX,
+	GATE_ETH2STP,
+	GATE_ETH2TX,
+	GATE_FDCAN,
+	GATE_HASH1,
+	GATE_HASH2,
+	GATE_HDP,
+	GATE_I2C1,
+	GATE_I2C2,
+	GATE_I2C3,
+	GATE_I3C1,
+	GATE_I3C2,
+	GATE_I3C3,
+	GATE_IWDG1,
+	GATE_IWDG2,
+	GATE_IWDG3,
+	GATE_IWDG4,
+	GATE_LPTIM1,
+	GATE_LPTIM2,
+	GATE_LPTIM3,
+	GATE_LPTIM4,
+	GATE_LPTIM5,
+	GATE_LPUART1,
+	GATE_LTDC,
+	GATE_MCO1,
+	GATE_MCO2,
+	GATE_MDF1,
+	GATE_OTG,
+	GATE_PKA,
+	GATE_RNG1,
+	GATE_RNG2,
+	GATE_SAES,
+	GATE_SAI1,
+	GATE_SAI2,
+	GATE_SAI3,
+	GATE_SAI4,
+	GATE_SDMMC1,
+	GATE_SDMMC2,
+	GATE_SDMMC3,
+	GATE_SERC,
+	GATE_SPDIFRX,
+	GATE_SPI1,
+	GATE_SPI2,
+	GATE_SPI3,
+	GATE_SPI4,
+	GATE_SPI5,
+	GATE_SPI6,
+	GATE_TIM1,
+	GATE_TIM10,
+	GATE_TIM11,
+	GATE_TIM12,
+	GATE_TIM13,
+	GATE_TIM14,
+	GATE_TIM15,
+	GATE_TIM16,
+	GATE_TIM17,
+	GATE_TIM2,
+	GATE_TIM3,
+	GATE_TIM4,
+	GATE_TIM5,
+	GATE_TIM6,
+	GATE_TIM7,
+	GATE_TIM8,
+	GATE_UART4,
+	GATE_UART5,
+	GATE_UART7,
+	GATE_USART1,
+	GATE_USART2,
+	GATE_USART3,
+	GATE_USART6,
+	GATE_USB2PHY1,
+	GATE_USB2PHY2,
+	GATE_USBH,
+	GATE_VREF,
+	GATE_WWDG1,
+	GATE_NB
+};
+
+#define GATE_CFG(id, _offset, _bit_idx, _offset_clr)	\
+	[id] = {					\
+		.offset		= (_offset),		\
+		.bit_idx	= (_bit_idx),		\
+		.set_clr	= (_offset_clr),	\
+	}
+
+static const struct stm32_gate_cfg stm32mp21_gates[GATE_NB] = {
+	GATE_CFG(GATE_ADC1,		RCC_ADC1CFGR,		1,	0),
+	GATE_CFG(GATE_ADC2,		RCC_ADC2CFGR,		1,	0),
+	GATE_CFG(GATE_CRC,		RCC_CRCCFGR,		1,	0),
+	GATE_CFG(GATE_CRYP1,		RCC_CRYP1CFGR,		1,	0),
+	GATE_CFG(GATE_CRYP2,		RCC_CRYP2CFGR,		1,	0),
+	GATE_CFG(GATE_CSI,		RCC_CSICFGR,		1,	0),
+	GATE_CFG(GATE_DCMIPP,		RCC_DCMIPPCFGR,		1,	0),
+	GATE_CFG(GATE_DCMIPSSI,		RCC_DCMIPSSICFGR,	1,	0),
+	GATE_CFG(GATE_DDRPERFM,		RCC_DDRPERFMCFGR,	1,	0),
+	GATE_CFG(GATE_DTS,		RCC_DTSCFGR,		1,	0),
+	GATE_CFG(GATE_ETH1,		RCC_ETH1CFGR,		5,	0),
+	GATE_CFG(GATE_ETH1MAC,		RCC_ETH1CFGR,		1,	0),
+	GATE_CFG(GATE_ETH1RX,		RCC_ETH1CFGR,		10,	0),
+	GATE_CFG(GATE_ETH1STP,		RCC_ETH1CFGR,		4,	0),
+	GATE_CFG(GATE_ETH1TX,		RCC_ETH1CFGR,		8,	0),
+	GATE_CFG(GATE_ETH2,		RCC_ETH2CFGR,		5,	0),
+	GATE_CFG(GATE_ETH2MAC,		RCC_ETH2CFGR,		1,	0),
+	GATE_CFG(GATE_ETH2RX,		RCC_ETH2CFGR,		10,	0),
+	GATE_CFG(GATE_ETH2STP,		RCC_ETH2CFGR,		4,	0),
+	GATE_CFG(GATE_ETH2TX,		RCC_ETH2CFGR,		8,	0),
+	GATE_CFG(GATE_FDCAN,		RCC_FDCANCFGR,		1,	0),
+	GATE_CFG(GATE_HASH1,		RCC_HASH1CFGR,		1,	0),
+	GATE_CFG(GATE_HASH2,		RCC_HASH2CFGR,		1,	0),
+	GATE_CFG(GATE_HDP,		RCC_HDPCFGR,		1,	0),
+	GATE_CFG(GATE_I2C1,		RCC_I2C1CFGR,		1,	0),
+	GATE_CFG(GATE_I2C2,		RCC_I2C2CFGR,		1,	0),
+	GATE_CFG(GATE_I2C3,		RCC_I2C3CFGR,		1,	0),
+	GATE_CFG(GATE_I3C1,		RCC_I3C1CFGR,		1,	0),
+	GATE_CFG(GATE_I3C2,		RCC_I3C2CFGR,		1,	0),
+	GATE_CFG(GATE_I3C3,		RCC_I3C3CFGR,		1,	0),
+	GATE_CFG(GATE_IWDG1,		RCC_IWDG1CFGR,		1,	0),
+	GATE_CFG(GATE_IWDG2,		RCC_IWDG2CFGR,		1,	0),
+	GATE_CFG(GATE_IWDG3,		RCC_IWDG3CFGR,		1,	0),
+	GATE_CFG(GATE_IWDG4,		RCC_IWDG4CFGR,		1,	0),
+	GATE_CFG(GATE_LPTIM1,		RCC_LPTIM1CFGR,		1,	0),
+	GATE_CFG(GATE_LPTIM2,		RCC_LPTIM2CFGR,		1,	0),
+	GATE_CFG(GATE_LPTIM3,		RCC_LPTIM3CFGR,		1,	0),
+	GATE_CFG(GATE_LPTIM4,		RCC_LPTIM4CFGR,		1,	0),
+	GATE_CFG(GATE_LPTIM5,		RCC_LPTIM5CFGR,		1,	0),
+	GATE_CFG(GATE_LPUART1,		RCC_LPUART1CFGR,	1,	0),
+	GATE_CFG(GATE_LTDC,		RCC_LTDCCFGR,		1,	0),
+	GATE_CFG(GATE_MCO1,		RCC_MCO1CFGR,		8,	0),
+	GATE_CFG(GATE_MCO2,		RCC_MCO2CFGR,		8,	0),
+	GATE_CFG(GATE_MDF1,		RCC_MDF1CFGR,		1,	0),
+	GATE_CFG(GATE_OTG,		RCC_OTGCFGR,		1,	0),
+	GATE_CFG(GATE_PKA,		RCC_PKACFGR,		1,	0),
+	GATE_CFG(GATE_RNG1,		RCC_RNG1CFGR,		1,	0),
+	GATE_CFG(GATE_RNG2,		RCC_RNG2CFGR,		1,	0),
+	GATE_CFG(GATE_SAES,		RCC_SAESCFGR,		1,	0),
+	GATE_CFG(GATE_SAI1,		RCC_SAI1CFGR,		1,	0),
+	GATE_CFG(GATE_SAI2,		RCC_SAI2CFGR,		1,	0),
+	GATE_CFG(GATE_SAI3,		RCC_SAI3CFGR,		1,	0),
+	GATE_CFG(GATE_SAI4,		RCC_SAI4CFGR,		1,	0),
+	GATE_CFG(GATE_SDMMC1,		RCC_SDMMC1CFGR,		1,	0),
+	GATE_CFG(GATE_SDMMC2,		RCC_SDMMC2CFGR,		1,	0),
+	GATE_CFG(GATE_SDMMC3,		RCC_SDMMC3CFGR,		1,	0),
+	GATE_CFG(GATE_SERC,		RCC_SERCCFGR,		1,	0),
+	GATE_CFG(GATE_SPDIFRX,		RCC_SPDIFRXCFGR,	1,	0),
+	GATE_CFG(GATE_SPI1,		RCC_SPI1CFGR,		1,	0),
+	GATE_CFG(GATE_SPI2,		RCC_SPI2CFGR,		1,	0),
+	GATE_CFG(GATE_SPI3,		RCC_SPI3CFGR,		1,	0),
+	GATE_CFG(GATE_SPI4,		RCC_SPI4CFGR,		1,	0),
+	GATE_CFG(GATE_SPI5,		RCC_SPI5CFGR,		1,	0),
+	GATE_CFG(GATE_SPI6,		RCC_SPI6CFGR,		1,	0),
+	GATE_CFG(GATE_TIM1,		RCC_TIM1CFGR,		1,	0),
+	GATE_CFG(GATE_TIM10,		RCC_TIM10CFGR,		1,	0),
+	GATE_CFG(GATE_TIM11,		RCC_TIM11CFGR,		1,	0),
+	GATE_CFG(GATE_TIM12,		RCC_TIM12CFGR,		1,	0),
+	GATE_CFG(GATE_TIM13,		RCC_TIM13CFGR,		1,	0),
+	GATE_CFG(GATE_TIM14,		RCC_TIM14CFGR,		1,	0),
+	GATE_CFG(GATE_TIM15,		RCC_TIM15CFGR,		1,	0),
+	GATE_CFG(GATE_TIM16,		RCC_TIM16CFGR,		1,	0),
+	GATE_CFG(GATE_TIM17,		RCC_TIM17CFGR,		1,	0),
+	GATE_CFG(GATE_TIM2,		RCC_TIM2CFGR,		1,	0),
+	GATE_CFG(GATE_TIM3,		RCC_TIM3CFGR,		1,	0),
+	GATE_CFG(GATE_TIM4,		RCC_TIM4CFGR,		1,	0),
+	GATE_CFG(GATE_TIM5,		RCC_TIM5CFGR,		1,	0),
+	GATE_CFG(GATE_TIM6,		RCC_TIM6CFGR,		1,	0),
+	GATE_CFG(GATE_TIM7,		RCC_TIM7CFGR,		1,	0),
+	GATE_CFG(GATE_TIM8,		RCC_TIM8CFGR,		1,	0),
+	GATE_CFG(GATE_UART4,		RCC_UART4CFGR,		1,	0),
+	GATE_CFG(GATE_UART5,		RCC_UART5CFGR,		1,	0),
+	GATE_CFG(GATE_UART7,		RCC_UART7CFGR,		1,	0),
+	GATE_CFG(GATE_USART1,		RCC_USART1CFGR,		1,	0),
+	GATE_CFG(GATE_USART2,		RCC_USART2CFGR,		1,	0),
+	GATE_CFG(GATE_USART3,		RCC_USART3CFGR,		1,	0),
+	GATE_CFG(GATE_USART6,		RCC_USART6CFGR,		1,	0),
+	GATE_CFG(GATE_USB2PHY1,		RCC_USB2PHY1CFGR,	1,	0),
+	GATE_CFG(GATE_USB2PHY2,		RCC_USB2PHY2CFGR,	1,	0),
+	GATE_CFG(GATE_USBH,		RCC_USBHCFGR,		1,	0),
+	GATE_CFG(GATE_VREF,		RCC_VREFCFGR,		1,	0),
+	GATE_CFG(GATE_WWDG1,		RCC_WWDG1CFGR,		1,	0),
+};
+
+#define CLK_HW_INIT_INDEX(_name, _parent, _ops, _flags)		\
+	(&(struct clk_init_data) {					\
+		.flags		= _flags,				\
+		.name		= _name,				\
+		.parent_data	= (const struct clk_parent_data[]) {	\
+					{ .index = _parent },		\
+				  },					\
+		.num_parents	= 1,					\
+		.ops		= _ops,					\
+	})
+
+/* ADC */
+static struct clk_stm32_gate ck_icn_p_adc1 = {
+	.gate_id = GATE_ADC1,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_adc1", ICN_LS_MCU, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_composite ck_ker_adc1 = {
+	.gate_id = GATE_ADC1,
+	.mux_id = MUX_ADC1,
+	.div_id = NO_STM32_DIV,
+	.hw.init = CLK_HW_INIT_PARENTS_DATA("ck_ker_adc1", adc1_src, &clk_stm32_composite_ops, 0),
+};
+
+static struct clk_stm32_gate ck_icn_p_adc2 = {
+	.gate_id = GATE_ADC2,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_adc2", ICN_LS_MCU, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_composite ck_ker_adc2 = {
+	.gate_id = GATE_ADC2,
+	.mux_id = MUX_ADC2,
+	.div_id = NO_STM32_DIV,
+	.hw.init = CLK_HW_INIT_PARENTS_DATA("ck_ker_adc2", adc2_src, &clk_stm32_composite_ops, 0),
+};
+
+/* CSI-HOST */
+static struct clk_stm32_gate ck_icn_p_csi = {
+	.gate_id = GATE_CSI,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_csi", ICN_APB4, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_ker_csi = {
+	.gate_id = GATE_CSI,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_csi", FLEXGEN_29, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_ker_csitxesc = {
+	.gate_id = GATE_CSI,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_csitxesc", FLEXGEN_30, &clk_stm32_gate_ops, 0),
+};
+
+/* CSI-PHY */
+static struct clk_stm32_gate ck_ker_csiphy = {
+	.gate_id = GATE_CSI,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_csiphy", FLEXGEN_31, &clk_stm32_gate_ops, 0),
+};
+
+/* DCMIPP */
+static struct clk_stm32_gate ck_icn_p_dcmipp = {
+	.gate_id = GATE_DCMIPP,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_dcmipp", ICN_APB4, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_icn_p_dcmipssi = {
+	.gate_id = GATE_DCMIPSSI,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_dcmipssi", ICN_LS_MCU, &clk_stm32_gate_ops, 0),
+};
+
+/* DDRPERMF */
+static struct clk_stm32_gate ck_icn_p_ddrperfm = {
+	.gate_id = GATE_DDRPERFM,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_ddrperfm", ICN_APB4, &clk_stm32_gate_ops, 0),
+};
+
+/* CRC */
+static struct clk_stm32_gate ck_icn_p_crc = {
+	.gate_id = GATE_CRC,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_crc", ICN_LS_MCU, &clk_stm32_gate_ops, 0),
+};
+
+/* CRYP */
+static struct clk_stm32_gate ck_icn_p_cryp1 = {
+	.gate_id = GATE_CRYP1,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_cryp1", ICN_LS_MCU, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_icn_p_cryp2 = {
+	.gate_id = GATE_CRYP2,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_cryp2", ICN_LS_MCU, &clk_stm32_gate_ops, 0),
+};
+
+/* DBG & TRACE */
+/* Trace and debug clocks are managed by SCMI */
+
+/* LTDC */
+static struct clk_stm32_gate ck_icn_p_ltdc = {
+	.gate_id = GATE_LTDC,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_ltdc", ICN_APB4, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_ker_ltdc = {
+	.gate_id = GATE_LTDC,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_ltdc", FLEXGEN_27, &clk_stm32_gate_ops,
+				       CLK_SET_RATE_PARENT),
+};
+
+/* DTS */
+static struct clk_stm32_composite ck_ker_dts = {
+	.gate_id = GATE_DTS,
+	.mux_id = MUX_DTS,
+	.div_id = NO_STM32_DIV,
+	.hw.init = CLK_HW_INIT_PARENTS_DATA("ck_ker_dts", dts_src,
+					    &clk_stm32_composite_ops, 0),
+};
+
+/* ETHERNET */
+static struct clk_stm32_gate ck_icn_p_eth1 = {
+	.gate_id = GATE_ETH1,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_eth1", ICN_LS_MCU, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_ker_eth1stp = {
+	.gate_id = GATE_ETH1STP,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_eth1stp", ICN_LS_MCU, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_ker_eth1 = {
+	.gate_id = GATE_ETH1,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_eth1", FLEXGEN_54, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_ker_eth1ptp = {
+	.gate_id = GATE_ETH1,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_eth1ptp", FLEXGEN_56, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_ker_eth1mac = {
+	.gate_id = GATE_ETH1MAC,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_eth1mac", ICN_LS_MCU, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_ker_eth1tx = {
+	.gate_id = GATE_ETH1TX,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_eth1tx", ICN_LS_MCU, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_ker_eth1rx = {
+	.gate_id = GATE_ETH1RX,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_eth1rx", ICN_LS_MCU, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_icn_p_eth2 = {
+	.gate_id = GATE_ETH2,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_eth2", ICN_LS_MCU, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_ker_eth2stp = {
+	.gate_id = GATE_ETH2STP,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_eth2stp", ICN_LS_MCU, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_ker_eth2 = {
+	.gate_id = GATE_ETH2,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_eth2", FLEXGEN_55, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_ker_eth2ptp = {
+	.gate_id = GATE_ETH2,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_eth2ptp", FLEXGEN_56, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_ker_eth2mac = {
+	.gate_id = GATE_ETH2MAC,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_eth2mac", ICN_LS_MCU, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_ker_eth2tx = {
+	.gate_id = GATE_ETH2TX,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_eth2tx", ICN_LS_MCU, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_ker_eth2rx = {
+	.gate_id = GATE_ETH2RX,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_eth2rx", ICN_LS_MCU, &clk_stm32_gate_ops, 0),
+};
+
+/* FDCAN */
+static struct clk_stm32_gate ck_icn_p_fdcan = {
+	.gate_id = GATE_FDCAN,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_fdcan", ICN_APB2, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_ker_fdcan = {
+	.gate_id = GATE_FDCAN,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_fdcan", FLEXGEN_26, &clk_stm32_gate_ops, 0),
+};
+
+/* HASH */
+static struct clk_stm32_gate ck_icn_p_hash1 = {
+	.gate_id = GATE_HASH1,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_hash1", ICN_LS_MCU, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_icn_p_hash2 = {
+	.gate_id = GATE_HASH2,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_hash2", ICN_LS_MCU, &clk_stm32_gate_ops, 0),
+};
+
+/* HDP */
+static struct clk_stm32_gate ck_icn_p_hdp = {
+	.gate_id = GATE_HDP,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_hdp", ICN_APB3, &clk_stm32_gate_ops, 0),
+};
+
+/* I2C */
+static struct clk_stm32_gate ck_icn_p_i2c1 = {
+	.gate_id = GATE_I2C1,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_i2c1", ICN_APB1, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_icn_p_i2c2 = {
+	.gate_id = GATE_I2C2,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_i2c2", ICN_APB1, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_icn_p_i2c3 = {
+	.gate_id = GATE_I2C3,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_i2c3", ICN_APB5, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_ker_i2c1 = {
+	.gate_id = GATE_I2C1,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_i2c1", FLEXGEN_13, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_ker_i2c2 = {
+	.gate_id = GATE_I2C2,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_i2c2", FLEXGEN_13, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_ker_i2c3 = {
+	.gate_id = GATE_I2C3,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_i2c3", FLEXGEN_38, &clk_stm32_gate_ops, 0),
+};
+
+/* I3C */
+static struct clk_stm32_gate ck_icn_p_i3c1 = {
+	.gate_id = GATE_I3C1,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_i3c1", ICN_APB1, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_icn_p_i3c2 = {
+	.gate_id = GATE_I3C2,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_i3c2", ICN_APB1, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_icn_p_i3c3 = {
+	.gate_id = GATE_I3C3,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_i3c3", ICN_APB5, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_ker_i3c1 = {
+	.gate_id = GATE_I3C1,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_i3c1", FLEXGEN_14, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_ker_i3c2 = {
+	.gate_id = GATE_I3C2,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_i3c2", FLEXGEN_14, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_ker_i3c3 = {
+	.gate_id = GATE_I3C3,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_i3c3", FLEXGEN_36, &clk_stm32_gate_ops, 0),
+};
+
+/* IWDG */
+static struct clk_stm32_gate ck_icn_p_iwdg1 = {
+	.gate_id = GATE_IWDG1,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_iwdg1", ICN_APB3, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_icn_p_iwdg2 = {
+	.gate_id = GATE_IWDG2,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_iwdg2", ICN_APB3, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_icn_p_iwdg3 = {
+	.gate_id = GATE_IWDG3,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_iwdg3", ICN_APB3, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_icn_p_iwdg4 = {
+	.gate_id = GATE_IWDG4,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_iwdg4", ICN_APB3, &clk_stm32_gate_ops, 0),
+};
+
+/* LPTIM */
+static struct clk_stm32_gate ck_icn_p_lptim1 = {
+	.gate_id = GATE_LPTIM1,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_lptim1", ICN_APB1, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_icn_p_lptim2 = {
+	.gate_id = GATE_LPTIM2,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_lptim2", ICN_APB1, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_icn_p_lptim3 = {
+	.gate_id = GATE_LPTIM3,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_lptim3", ICN_LS_MCU, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_icn_p_lptim4 = {
+	.gate_id = GATE_LPTIM4,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_lptim4", ICN_LS_MCU, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_icn_p_lptim5 = {
+	.gate_id = GATE_LPTIM5,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_lptim5", ICN_LS_MCU, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_ker_lptim1 = {
+	.gate_id = GATE_LPTIM1,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_lptim1", FLEXGEN_07, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_ker_lptim2 = {
+	.gate_id = GATE_LPTIM2,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_lptim2", FLEXGEN_07, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_ker_lptim3 = {
+	.gate_id = GATE_LPTIM3,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_lptim3", FLEXGEN_40, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_ker_lptim4 = {
+	.gate_id = GATE_LPTIM4,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_lptim4", FLEXGEN_41, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_ker_lptim5 = {
+	.gate_id = GATE_LPTIM5,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_lptim5", FLEXGEN_42, &clk_stm32_gate_ops, 0),
+};
+
+/* LPUART */
+static struct clk_stm32_gate ck_icn_p_lpuart1 = {
+	.gate_id = GATE_LPUART1,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_lpuart1", ICN_LS_MCU, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_ker_lpuart1 = {
+	.gate_id = GATE_LPUART1,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_lpuart1", FLEXGEN_39, &clk_stm32_gate_ops, 0),
+};
+
+/* MCO1 & MCO2 */
+static struct clk_stm32_composite ck_mco1 = {
+	.gate_id = GATE_MCO1,
+	.mux_id = MUX_MCO1,
+	.div_id = NO_STM32_DIV,
+	.hw.init = CLK_HW_INIT_PARENTS_DATA("ck_mco1", mco1_src, &clk_stm32_composite_ops, 0),
+};
+
+static struct clk_stm32_composite ck_mco2 = {
+	.gate_id = GATE_MCO2,
+	.mux_id = MUX_MCO2,
+	.div_id = NO_STM32_DIV,
+	.hw.init = CLK_HW_INIT_PARENTS_DATA("ck_mco2", mco2_src, &clk_stm32_composite_ops, 0),
+};
+
+/* MDF */
+static struct clk_stm32_gate ck_icn_p_mdf1 = {
+	.gate_id = GATE_MDF1,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_mdf1", ICN_LS_MCU, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_ker_mdf1 = {
+	.gate_id = GATE_MDF1,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_mdf1", FLEXGEN_21, &clk_stm32_gate_ops, 0),
+};
+
+/* OTG */
+static struct clk_stm32_gate ck_icn_m_otg = {
+	.gate_id = GATE_OTG,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_m_otg", ICN_LS_MCU, &clk_stm32_gate_ops, 0),
+};
+
+/* PKA */
+static struct clk_stm32_gate ck_icn_p_pka = {
+	.gate_id = GATE_PKA,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_pka", ICN_LS_MCU, &clk_stm32_gate_ops, 0),
+};
+
+/* RNG */
+static struct clk_stm32_gate ck_icn_p_rng1 = {
+	.gate_id = GATE_RNG1,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_rng1", ICN_LS_MCU, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_icn_p_rng2 = {
+	.gate_id = GATE_RNG2,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_rng2", ICN_LS_MCU, &clk_stm32_gate_ops, 0),
+};
+
+/* SAES */
+static struct clk_stm32_gate ck_icn_p_saes = {
+	.gate_id = GATE_SAES,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_saes", ICN_LS_MCU, &clk_stm32_gate_ops, 0),
+};
+
+/* SAI */
+static struct clk_stm32_gate ck_icn_p_sai1 = {
+	.gate_id = GATE_SAI1,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_sai1", ICN_APB2, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_icn_p_sai2 = {
+	.gate_id = GATE_SAI2,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_sai2", ICN_APB2, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_icn_p_sai3 = {
+	.gate_id = GATE_SAI3,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_sai3", ICN_APB2, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_icn_p_sai4 = {
+	.gate_id = GATE_SAI4,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_sai4", ICN_APB2, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_ker_sai1 = {
+	.gate_id = GATE_SAI1,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_sai1", FLEXGEN_22, &clk_stm32_gate_ops,
+				       CLK_SET_RATE_PARENT),
+};
+
+static struct clk_stm32_gate ck_ker_sai2 = {
+	.gate_id = GATE_SAI2,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_sai2", FLEXGEN_23, &clk_stm32_gate_ops,
+				       CLK_SET_RATE_PARENT),
+};
+
+static struct clk_stm32_gate ck_ker_sai3 = {
+	.gate_id = GATE_SAI3,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_sai3", FLEXGEN_24, &clk_stm32_gate_ops,
+				       CLK_SET_RATE_PARENT),
+};
+
+static struct clk_stm32_gate ck_ker_sai4 = {
+	.gate_id = GATE_SAI4,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_sai4", FLEXGEN_25, &clk_stm32_gate_ops,
+				       CLK_SET_RATE_PARENT),
+};
+
+/* SDMMC */
+static struct clk_stm32_gate ck_icn_m_sdmmc1 = {
+	.gate_id = GATE_SDMMC1,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_m_sdmmc1", ICN_SDMMC, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_icn_m_sdmmc2 = {
+	.gate_id = GATE_SDMMC2,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_m_sdmmc2", ICN_SDMMC, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_icn_m_sdmmc3 = {
+	.gate_id = GATE_SDMMC3,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_m_sdmmc3", ICN_SDMMC, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_ker_sdmmc1 = {
+	.gate_id = GATE_SDMMC1,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_sdmmc1", FLEXGEN_51, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_ker_sdmmc2 = {
+	.gate_id = GATE_SDMMC2,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_sdmmc2", FLEXGEN_52, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_ker_sdmmc3 = {
+	.gate_id = GATE_SDMMC3,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_sdmmc3", FLEXGEN_53, &clk_stm32_gate_ops, 0),
+};
+
+/* SERC */
+static struct clk_stm32_gate ck_icn_p_serc = {
+	.gate_id = GATE_SERC,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_serc", ICN_APB3, &clk_stm32_gate_ops, 0),
+};
+
+/* SPDIF */
+static struct clk_stm32_gate ck_icn_p_spdifrx = {
+	.gate_id = GATE_SPDIFRX,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_spdifrx", ICN_APB1, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_ker_spdifrx = {
+	.gate_id = GATE_SPDIFRX,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_spdifrx", FLEXGEN_12, &clk_stm32_gate_ops, 0),
+};
+
+/* SPI */
+static struct clk_stm32_gate ck_icn_p_spi1 = {
+	.gate_id = GATE_SPI1,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_spi1", ICN_APB2, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_icn_p_spi2 = {
+	.gate_id = GATE_SPI2,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_spi2", ICN_APB1, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_icn_p_spi3 = {
+	.gate_id = GATE_SPI3,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_spi3", ICN_APB1, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_icn_p_spi4 = {
+	.gate_id = GATE_SPI4,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_spi4", ICN_APB2, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_icn_p_spi5 = {
+	.gate_id = GATE_SPI5,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_spi5", ICN_APB2, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_icn_p_spi6 = {
+	.gate_id = GATE_SPI6,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_spi6", ICN_APB2, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_ker_spi1 = {
+	.gate_id = GATE_SPI1,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_spi1", FLEXGEN_16, &clk_stm32_gate_ops,
+				     CLK_SET_RATE_PARENT),
+};
+
+static struct clk_stm32_gate ck_ker_spi2 = {
+	.gate_id = GATE_SPI2,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_spi2", FLEXGEN_10, &clk_stm32_gate_ops,
+				       CLK_SET_RATE_PARENT),
+};
+
+static struct clk_stm32_gate ck_ker_spi3 = {
+	.gate_id = GATE_SPI3,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_spi3", FLEXGEN_11, &clk_stm32_gate_ops,
+				       CLK_SET_RATE_PARENT),
+};
+
+static struct clk_stm32_gate ck_ker_spi4 = {
+	.gate_id = GATE_SPI4,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_spi4", FLEXGEN_17, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_ker_spi5 = {
+	.gate_id = GATE_SPI5,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_spi5", FLEXGEN_17, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_ker_spi6 = {
+	.gate_id = GATE_SPI6,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_spi6", FLEXGEN_37, &clk_stm32_gate_ops, 0),
+};
+
+/* Timers */
+static struct clk_stm32_gate ck_icn_p_tim2 = {
+	.gate_id = GATE_TIM2,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_tim2", ICN_APB1, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_icn_p_tim3 = {
+	.gate_id = GATE_TIM3,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_tim3", ICN_APB1, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_icn_p_tim4 = {
+	.gate_id = GATE_TIM4,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_tim4", ICN_APB1, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_icn_p_tim5 = {
+	.gate_id = GATE_TIM5,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_tim5", ICN_APB1, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_icn_p_tim6 = {
+	.gate_id = GATE_TIM6,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_tim6", ICN_APB1, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_icn_p_tim7 = {
+	.gate_id = GATE_TIM7,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_tim7", ICN_APB1, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_icn_p_tim10 = {
+	.gate_id = GATE_TIM10,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_tim10", ICN_APB1, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_icn_p_tim11 = {
+	.gate_id = GATE_TIM11,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_tim11", ICN_APB1, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_icn_p_tim12 = {
+	.gate_id = GATE_TIM12,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_tim12", ICN_APB1, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_icn_p_tim13 = {
+	.gate_id = GATE_TIM13,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_tim13", ICN_APB1, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_icn_p_tim14 = {
+	.gate_id = GATE_TIM14,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_tim14", ICN_APB1, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_icn_p_tim1 = {
+	.gate_id = GATE_TIM1,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_tim1", ICN_APB2, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_icn_p_tim8 = {
+	.gate_id = GATE_TIM8,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_tim8", ICN_APB2, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_icn_p_tim15 = {
+	.gate_id = GATE_TIM15,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_tim15", ICN_APB2, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_icn_p_tim16 = {
+	.gate_id = GATE_TIM16,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_tim16", ICN_APB2, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_icn_p_tim17 = {
+	.gate_id = GATE_TIM17,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_tim17", ICN_APB2, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_ker_tim2 = {
+	.gate_id = GATE_TIM2,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_tim2", TIMG1, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_ker_tim3 = {
+	.gate_id = GATE_TIM3,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_tim3", TIMG1, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_ker_tim4 = {
+	.gate_id = GATE_TIM4,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_tim4", TIMG1, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_ker_tim5 = {
+	.gate_id = GATE_TIM5,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_tim5", TIMG1, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_ker_tim6 = {
+	.gate_id = GATE_TIM6,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_tim6", TIMG1, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_ker_tim7 = {
+	.gate_id = GATE_TIM7,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_tim7", TIMG1, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_ker_tim10 = {
+	.gate_id = GATE_TIM10,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_tim10", TIMG1, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_ker_tim11 = {
+	.gate_id = GATE_TIM11,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_tim11", TIMG1, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_ker_tim12 = {
+	.gate_id = GATE_TIM12,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_tim12", TIMG1, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_ker_tim13 = {
+	.gate_id = GATE_TIM13,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_tim13", TIMG1, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_ker_tim14 = {
+	.gate_id = GATE_TIM14,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_tim14", TIMG1, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_ker_tim1 = {
+	.gate_id = GATE_TIM1,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_tim1", TIMG2, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_ker_tim8 = {
+	.gate_id = GATE_TIM8,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_tim8", TIMG2, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_ker_tim15 = {
+	.gate_id = GATE_TIM15,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_tim15", TIMG2, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_ker_tim16 = {
+	.gate_id = GATE_TIM16,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_tim16", TIMG2, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_ker_tim17 = {
+	.gate_id = GATE_TIM17,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_tim17", TIMG2, &clk_stm32_gate_ops, 0),
+};
+
+/* UART/USART */
+static struct clk_stm32_gate ck_icn_p_usart2 = {
+	.gate_id = GATE_USART2,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_usart2", ICN_APB1, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_icn_p_usart3 = {
+	.gate_id = GATE_USART3,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_usart3", ICN_APB1, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_icn_p_uart4 = {
+	.gate_id = GATE_UART4,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_uart4", ICN_APB1, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_icn_p_uart5 = {
+	.gate_id = GATE_UART5,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_uart5", ICN_APB1, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_icn_p_usart1 = {
+	.gate_id = GATE_USART1,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_usart1", ICN_APB2, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_icn_p_usart6 = {
+	.gate_id = GATE_USART6,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_usart6", ICN_APB2, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_icn_p_uart7 = {
+	.gate_id = GATE_UART7,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_uart7", ICN_APB2, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_ker_usart2 = {
+	.gate_id = GATE_USART2,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_usart2", FLEXGEN_08, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_ker_uart4 = {
+	.gate_id = GATE_UART4,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_uart4", FLEXGEN_08, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_ker_usart3 = {
+	.gate_id = GATE_USART3,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_usart3", FLEXGEN_09, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_ker_uart5 = {
+	.gate_id = GATE_UART5,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_uart5", FLEXGEN_09, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_ker_usart1 = {
+	.gate_id = GATE_USART1,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_usart1", FLEXGEN_18, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_ker_usart6 = {
+	.gate_id = GATE_USART6,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_usart6", FLEXGEN_19, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_ker_uart7 = {
+	.gate_id = GATE_UART7,
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_uart7", FLEXGEN_20, &clk_stm32_gate_ops, 0),
+};
+
+/* USB2PHY1 */
+static struct clk_stm32_composite ck_ker_usb2phy1 = {
+	.gate_id = GATE_USB2PHY1,
+	.mux_id = MUX_USB2PHY1,
+	.div_id = NO_STM32_DIV,
+	.hw.init = CLK_HW_INIT_PARENTS_DATA("ck_ker_usb2phy1", usb2phy1_src,
+					    &clk_stm32_composite_ops, 0),
+};
+
+/* USBH */
+static struct clk_stm32_gate ck_icn_m_usbhehci = {
+	.gate_id = GATE_USBH,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_m_usbhehci", ICN_HSL, &clk_stm32_gate_ops, 0),
+};
+
+static struct clk_stm32_gate ck_icn_m_usbhohci = {
+	.gate_id = GATE_USBH,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_m_usbhohci", ICN_HSL, &clk_stm32_gate_ops, 0),
+};
+
+/* USB2PHY2 */
+static struct clk_stm32_composite ck_ker_usb2phy2_en = {
+	.gate_id = GATE_USB2PHY2,
+	.mux_id = MUX_USB2PHY2,
+	.div_id = NO_STM32_DIV,
+	.hw.init = CLK_HW_INIT_PARENTS_DATA("ck_ker_usb2phy2_en", usb2phy2_src,
+					    &clk_stm32_composite_ops, 0),
+};
+
+/* VREF */
+static struct clk_stm32_gate ck_icn_p_vref = {
+	.gate_id = GATE_VREF,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_vref", ICN_APB3, &clk_stm32_gate_ops, 0),
+};
+
+/* WWDG */
+static struct clk_stm32_gate ck_icn_p_wwdg1 = {
+	.gate_id = GATE_WWDG1,
+	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_wwdg1", ICN_APB3, &clk_stm32_gate_ops, 0),
+};
+
+static int stm32_rcc_get_access(void __iomem *base, u32 index)
+{
+	u32 seccfgr, cidcfgr, semcr;
+	int bit, cid;
+
+	bit = index % RCC_REG_SIZE;
+
+	seccfgr = readl(base + RCC_SECCFGR(index));
+	if (seccfgr & BIT(bit))
+		return -EACCES;
+
+	cidcfgr = readl(base + RCC_CIDCFGR(index));
+	if (!(cidcfgr & RCC_CIDCFGR_CFEN))
+		/* CID filtering is turned off: access granted */
+		return 0;
+
+	if (!(cidcfgr & RCC_CIDCFGR_SEM_EN)) {
+		/* Static CID mode */
+		cid = FIELD_GET(RCC_CIDCFGR_SCID_MASK, cidcfgr);
+		if (cid != RCC_CID1)
+			return -EACCES;
+		return 0;
+	}
+
+	/* Pass-list with semaphore mode */
+	if (!(cidcfgr & RCC_CIDCFGR_SEMWLC1_EN))
+		return -EACCES;
+
+	semcr = readl(base + RCC_SEMCR(index));
+
+	cid = FIELD_GET(RCC_SEMCR_SEMCID_MASK, semcr);
+	if (cid != RCC_CID1)
+		return -EACCES;
+
+	return 0;
+}
+
+static int stm32mp21_check_security(struct device_node *np, void __iomem *base,
+				    const struct clock_config *cfg)
+{
+	int ret = 0;
+
+	if (cfg->sec_id != SECF_NONE) {
+		struct stm32_firewall firewall;
+		u32 index = (u32)cfg->sec_id;
+
+		if (index & SEC_RIFSC_FLAG) {
+			ret = stm32_firewall_get_firewall(np, &firewall, 1);
+			if (ret)
+				return ret;
+			ret = stm32_firewall_grant_access_by_id(&firewall, index & ~SEC_RIFSC_FLAG);
+		} else {
+			ret = stm32_rcc_get_access(base, cfg->sec_id & ~SEC_RIFSC_FLAG);
+		}
+	}
+
+	return ret;
+}
+
+static const struct clock_config stm32mp21_clock_cfg[] = {
+	STM32_GATE_CFG(CK_BUS_ETH1,		ck_icn_p_eth1,		SEC_RIFSC(60)),
+	STM32_GATE_CFG(CK_BUS_ETH2,		ck_icn_p_eth2,		SEC_RIFSC(61)),
+	STM32_GATE_CFG(CK_BUS_ADC1,		ck_icn_p_adc1,		SEC_RIFSC(58)),
+	STM32_GATE_CFG(CK_BUS_ADC2,		ck_icn_p_adc2,		SEC_RIFSC(59)),
+	STM32_GATE_CFG(CK_BUS_CRC,		ck_icn_p_crc,		SEC_RIFSC(109)),
+	STM32_GATE_CFG(CK_BUS_MDF1,		ck_icn_p_mdf1,		SEC_RIFSC(54)),
+	STM32_GATE_CFG(CK_BUS_HASH1,		ck_icn_p_hash1,		SEC_RIFSC(96)),
+	STM32_GATE_CFG(CK_BUS_HASH2,		ck_icn_p_hash2,		SEC_RIFSC(97)),
+	STM32_GATE_CFG(CK_BUS_RNG1,		ck_icn_p_rng1,		SEC_RIFSC(92)),
+	STM32_GATE_CFG(CK_BUS_RNG2,		ck_icn_p_rng2,		SEC_RIFSC(93)),
+	STM32_GATE_CFG(CK_BUS_CRYP1,		ck_icn_p_cryp1,		SEC_RIFSC(98)),
+	STM32_GATE_CFG(CK_BUS_CRYP2,		ck_icn_p_cryp2,		SEC_RIFSC(99)),
+	STM32_GATE_CFG(CK_BUS_SAES,		ck_icn_p_saes,		SEC_RIFSC(95)),
+	STM32_GATE_CFG(CK_BUS_PKA,		ck_icn_p_pka,		SEC_RIFSC(94)),
+	STM32_GATE_CFG(CK_BUS_LPUART1,		ck_icn_p_lpuart1,	SEC_RIFSC(40)),
+	STM32_GATE_CFG(CK_BUS_LPTIM3,		ck_icn_p_lptim3,	SEC_RIFSC(19)),
+	STM32_GATE_CFG(CK_BUS_LPTIM4,		ck_icn_p_lptim4,	SEC_RIFSC(20)),
+	STM32_GATE_CFG(CK_BUS_LPTIM5,		ck_icn_p_lptim5,	SEC_RIFSC(21)),
+	STM32_GATE_CFG(CK_BUS_SDMMC1,		ck_icn_m_sdmmc1,	SEC_RIFSC(76)),
+	STM32_GATE_CFG(CK_BUS_SDMMC2,		ck_icn_m_sdmmc2,	SEC_RIFSC(77)),
+	STM32_GATE_CFG(CK_BUS_SDMMC3,		ck_icn_m_sdmmc3,	SEC_RIFSC(78)),
+	STM32_GATE_CFG(CK_BUS_USBHOHCI,		ck_icn_m_usbhohci,	SEC_RIFSC(63)),
+	STM32_GATE_CFG(CK_BUS_USBHEHCI,		ck_icn_m_usbhehci,	SEC_RIFSC(63)),
+	STM32_GATE_CFG(CK_BUS_OTG,		ck_icn_m_otg,		SEC_RIFSC(66)),
+	STM32_GATE_CFG(CK_BUS_TIM2,		ck_icn_p_tim2,		SEC_RIFSC(1)),
+	STM32_GATE_CFG(CK_BUS_TIM3,		ck_icn_p_tim3,		SEC_RIFSC(2)),
+	STM32_GATE_CFG(CK_BUS_TIM4,		ck_icn_p_tim4,		SEC_RIFSC(3)),
+	STM32_GATE_CFG(CK_BUS_TIM5,		ck_icn_p_tim5,		SEC_RIFSC(4)),
+	STM32_GATE_CFG(CK_BUS_TIM6,		ck_icn_p_tim6,		SEC_RIFSC(5)),
+	STM32_GATE_CFG(CK_BUS_TIM7,		ck_icn_p_tim7,		SEC_RIFSC(6)),
+	STM32_GATE_CFG(CK_BUS_TIM10,		ck_icn_p_tim10,		SEC_RIFSC(8)),
+	STM32_GATE_CFG(CK_BUS_TIM11,		ck_icn_p_tim11,		SEC_RIFSC(9)),
+	STM32_GATE_CFG(CK_BUS_TIM12,		ck_icn_p_tim12,		SEC_RIFSC(10)),
+	STM32_GATE_CFG(CK_BUS_TIM13,		ck_icn_p_tim13,		SEC_RIFSC(11)),
+	STM32_GATE_CFG(CK_BUS_TIM14,		ck_icn_p_tim14,		SEC_RIFSC(12)),
+	STM32_GATE_CFG(CK_BUS_LPTIM1,		ck_icn_p_lptim1,	SEC_RIFSC(17)),
+	STM32_GATE_CFG(CK_BUS_LPTIM2,		ck_icn_p_lptim2,	SEC_RIFSC(18)),
+	STM32_GATE_CFG(CK_BUS_SPI2,		ck_icn_p_spi2,		SEC_RIFSC(23)),
+	STM32_GATE_CFG(CK_BUS_SPI3,		ck_icn_p_spi3,		SEC_RIFSC(24)),
+	STM32_GATE_CFG(CK_BUS_SPDIFRX,		ck_icn_p_spdifrx,	SEC_RIFSC(30)),
+	STM32_GATE_CFG(CK_BUS_USART2,		ck_icn_p_usart2,	SEC_RIFSC(32)),
+	STM32_GATE_CFG(CK_BUS_USART3,		ck_icn_p_usart3,	SEC_RIFSC(33)),
+	STM32_GATE_CFG(CK_BUS_UART4,		ck_icn_p_uart4,		SEC_RIFSC(34)),
+	STM32_GATE_CFG(CK_BUS_UART5,		ck_icn_p_uart5,		SEC_RIFSC(35)),
+	STM32_GATE_CFG(CK_BUS_I2C1,		ck_icn_p_i2c1,		SEC_RIFSC(41)),
+	STM32_GATE_CFG(CK_BUS_I2C2,		ck_icn_p_i2c2,		SEC_RIFSC(42)),
+	STM32_GATE_CFG(CK_BUS_I2C3,		ck_icn_p_i2c3,		SEC_RIFSC(43)),
+	STM32_GATE_CFG(CK_BUS_I3C1,		ck_icn_p_i3c1,		SEC_RIFSC(114)),
+	STM32_GATE_CFG(CK_BUS_I3C2,		ck_icn_p_i3c2,		SEC_RIFSC(115)),
+	STM32_GATE_CFG(CK_BUS_I3C3,		ck_icn_p_i3c3,		SEC_RIFSC(116)),
+	STM32_GATE_CFG(CK_BUS_TIM1,		ck_icn_p_tim1,		SEC_RIFSC(0)),
+	STM32_GATE_CFG(CK_BUS_TIM8,		ck_icn_p_tim8,		SEC_RIFSC(7)),
+	STM32_GATE_CFG(CK_BUS_TIM15,		ck_icn_p_tim15,		SEC_RIFSC(13)),
+	STM32_GATE_CFG(CK_BUS_TIM16,		ck_icn_p_tim16,		SEC_RIFSC(14)),
+	STM32_GATE_CFG(CK_BUS_TIM17,		ck_icn_p_tim17,		SEC_RIFSC(15)),
+	STM32_GATE_CFG(CK_BUS_SAI1,		ck_icn_p_sai1,		SEC_RIFSC(49)),
+	STM32_GATE_CFG(CK_BUS_SAI2,		ck_icn_p_sai2,		SEC_RIFSC(50)),
+	STM32_GATE_CFG(CK_BUS_SAI3,		ck_icn_p_sai3,		SEC_RIFSC(51)),
+	STM32_GATE_CFG(CK_BUS_SAI4,		ck_icn_p_sai4,		SEC_RIFSC(52)),
+	STM32_GATE_CFG(CK_BUS_USART1,		ck_icn_p_usart1,	SEC_RIFSC(31)),
+	STM32_GATE_CFG(CK_BUS_USART6,		ck_icn_p_usart6,	SEC_RIFSC(36)),
+	STM32_GATE_CFG(CK_BUS_UART7,		ck_icn_p_uart7,		SEC_RIFSC(37)),
+	STM32_GATE_CFG(CK_BUS_FDCAN,		ck_icn_p_fdcan,		SEC_RIFSC(56)),
+	STM32_GATE_CFG(CK_BUS_SPI1,		ck_icn_p_spi1,		SEC_RIFSC(22)),
+	STM32_GATE_CFG(CK_BUS_SPI4,		ck_icn_p_spi4,		SEC_RIFSC(25)),
+	STM32_GATE_CFG(CK_BUS_SPI5,		ck_icn_p_spi5,		SEC_RIFSC(26)),
+	STM32_GATE_CFG(CK_BUS_SPI6,		ck_icn_p_spi6,		SEC_RIFSC(27)),
+	STM32_GATE_CFG(CK_BUS_IWDG1,		ck_icn_p_iwdg1,		SEC_RIFSC(100)),
+	STM32_GATE_CFG(CK_BUS_IWDG2,		ck_icn_p_iwdg2,		SEC_RIFSC(101)),
+	STM32_GATE_CFG(CK_BUS_IWDG3,		ck_icn_p_iwdg3,		SEC_RIFSC(102)),
+	STM32_GATE_CFG(CK_BUS_IWDG4,		ck_icn_p_iwdg4,		SEC_RIFSC(103)),
+	STM32_GATE_CFG(CK_BUS_WWDG1,		ck_icn_p_wwdg1,		SEC_RIFSC(104)),
+	STM32_GATE_CFG(CK_BUS_VREF,		ck_icn_p_vref,		SEC_RIFSC(106)),
+	STM32_GATE_CFG(CK_BUS_SERC,		ck_icn_p_serc,		SEC_RIFSC(110)),
+	STM32_GATE_CFG(CK_BUS_HDP,		ck_icn_p_hdp,		SEC_RIFSC(57)),
+	STM32_GATE_CFG(CK_BUS_LTDC,		ck_icn_p_ltdc,		SEC_RIFSC(80)),
+	STM32_GATE_CFG(CK_BUS_CSI,		ck_icn_p_csi,		SEC_RIFSC(86)),
+	STM32_GATE_CFG(CK_BUS_DCMIPP,		ck_icn_p_dcmipp,	SEC_RIFSC(87)),
+	STM32_GATE_CFG(CK_BUS_DCMIPSSI,		ck_icn_p_dcmipssi,	SEC_RIFSC(88)),
+	STM32_GATE_CFG(CK_BUS_DDRPERFM,		ck_icn_p_ddrperfm,	SEC_RIFSC(67)),
+	STM32_GATE_CFG(CK_KER_TIM2,		ck_ker_tim2,		SEC_RIFSC(1)),
+	STM32_GATE_CFG(CK_KER_TIM3,		ck_ker_tim3,		SEC_RIFSC(2)),
+	STM32_GATE_CFG(CK_KER_TIM4,		ck_ker_tim4,		SEC_RIFSC(3)),
+	STM32_GATE_CFG(CK_KER_TIM5,		ck_ker_tim5,		SEC_RIFSC(4)),
+	STM32_GATE_CFG(CK_KER_TIM6,		ck_ker_tim6,		SEC_RIFSC(5)),
+	STM32_GATE_CFG(CK_KER_TIM7,		ck_ker_tim7,		SEC_RIFSC(6)),
+	STM32_GATE_CFG(CK_KER_TIM10,		ck_ker_tim10,		SEC_RIFSC(8)),
+	STM32_GATE_CFG(CK_KER_TIM11,		ck_ker_tim11,		SEC_RIFSC(9)),
+	STM32_GATE_CFG(CK_KER_TIM12,		ck_ker_tim12,		SEC_RIFSC(10)),
+	STM32_GATE_CFG(CK_KER_TIM13,		ck_ker_tim13,		SEC_RIFSC(11)),
+	STM32_GATE_CFG(CK_KER_TIM14,		ck_ker_tim14,		SEC_RIFSC(12)),
+	STM32_GATE_CFG(CK_KER_TIM1,		ck_ker_tim1,		SEC_RIFSC(0)),
+	STM32_GATE_CFG(CK_KER_TIM8,		ck_ker_tim8,		SEC_RIFSC(7)),
+	STM32_GATE_CFG(CK_KER_TIM15,		ck_ker_tim15,		SEC_RIFSC(13)),
+	STM32_GATE_CFG(CK_KER_TIM16,		ck_ker_tim16,		SEC_RIFSC(14)),
+	STM32_GATE_CFG(CK_KER_TIM17,		ck_ker_tim17,		SEC_RIFSC(15)),
+	STM32_GATE_CFG(CK_KER_LPTIM1,		ck_ker_lptim1,		SEC_RIFSC(17)),
+	STM32_GATE_CFG(CK_KER_LPTIM2,		ck_ker_lptim2,		SEC_RIFSC(18)),
+	STM32_GATE_CFG(CK_KER_USART2,		ck_ker_usart2,		SEC_RIFSC(32)),
+	STM32_GATE_CFG(CK_KER_UART4,		ck_ker_uart4,		SEC_RIFSC(34)),
+	STM32_GATE_CFG(CK_KER_USART3,		ck_ker_usart3,		SEC_RIFSC(33)),
+	STM32_GATE_CFG(CK_KER_UART5,		ck_ker_uart5,		SEC_RIFSC(35)),
+	STM32_GATE_CFG(CK_KER_SPI2,		ck_ker_spi2,		SEC_RIFSC(23)),
+	STM32_GATE_CFG(CK_KER_SPI3,		ck_ker_spi3,		SEC_RIFSC(24)),
+	STM32_GATE_CFG(CK_KER_SPDIFRX,		ck_ker_spdifrx,		SEC_RIFSC(30)),
+	STM32_GATE_CFG(CK_KER_I2C1,		ck_ker_i2c1,		SEC_RIFSC(41)),
+	STM32_GATE_CFG(CK_KER_I2C2,		ck_ker_i2c2,		SEC_RIFSC(42)),
+	STM32_GATE_CFG(CK_KER_I3C1,		ck_ker_i3c1,		SEC_RIFSC(114)),
+	STM32_GATE_CFG(CK_KER_I3C2,		ck_ker_i3c2,		SEC_RIFSC(115)),
+	STM32_GATE_CFG(CK_KER_I2C3,		ck_ker_i2c3,		SEC_RIFSC(43)),
+	STM32_GATE_CFG(CK_KER_I3C3,		ck_ker_i3c3,		SEC_RIFSC(116)),
+	STM32_GATE_CFG(CK_KER_SPI1,		ck_ker_spi1,		SEC_RIFSC(22)),
+	STM32_GATE_CFG(CK_KER_SPI4,		ck_ker_spi4,		SEC_RIFSC(25)),
+	STM32_GATE_CFG(CK_KER_SPI5,		ck_ker_spi5,		SEC_RIFSC(26)),
+	STM32_GATE_CFG(CK_KER_SPI6,		ck_ker_spi6,		SEC_RIFSC(27)),
+	STM32_GATE_CFG(CK_KER_USART1,		ck_ker_usart1,		SEC_RIFSC(31)),
+	STM32_GATE_CFG(CK_KER_USART6,		ck_ker_usart6,		SEC_RIFSC(36)),
+	STM32_GATE_CFG(CK_KER_UART7,		ck_ker_uart7,		SEC_RIFSC(37)),
+	STM32_GATE_CFG(CK_KER_MDF1,		ck_ker_mdf1,		SEC_RIFSC(54)),
+	STM32_GATE_CFG(CK_KER_SAI1,		ck_ker_sai1,		SEC_RIFSC(49)),
+	STM32_GATE_CFG(CK_KER_SAI2,		ck_ker_sai2,		SEC_RIFSC(50)),
+	STM32_GATE_CFG(CK_KER_SAI3,		ck_ker_sai3,		SEC_RIFSC(51)),
+	STM32_GATE_CFG(CK_KER_SAI4,		ck_ker_sai4,		SEC_RIFSC(52)),
+	STM32_GATE_CFG(CK_KER_FDCAN,		ck_ker_fdcan,		SEC_RIFSC(56)),
+	STM32_GATE_CFG(CK_KER_CSI,		ck_ker_csi,		SEC_RIFSC(86)),
+	STM32_GATE_CFG(CK_KER_CSITXESC,		ck_ker_csitxesc,	SEC_RIFSC(86)),
+	STM32_GATE_CFG(CK_KER_CSIPHY,		ck_ker_csiphy,		SEC_RIFSC(86)),
+	STM32_GATE_CFG(CK_KER_LPUART1,		ck_ker_lpuart1,		SEC_RIFSC(40)),
+	STM32_GATE_CFG(CK_KER_LPTIM3,		ck_ker_lptim3,		SEC_RIFSC(19)),
+	STM32_GATE_CFG(CK_KER_LPTIM4,		ck_ker_lptim4,		SEC_RIFSC(20)),
+	STM32_GATE_CFG(CK_KER_LPTIM5,		ck_ker_lptim5,		SEC_RIFSC(21)),
+	STM32_GATE_CFG(CK_KER_SDMMC1,		ck_ker_sdmmc1,		SEC_RIFSC(76)),
+	STM32_GATE_CFG(CK_KER_SDMMC2,		ck_ker_sdmmc2,		SEC_RIFSC(77)),
+	STM32_GATE_CFG(CK_KER_SDMMC3,		ck_ker_sdmmc3,		SEC_RIFSC(78)),
+	STM32_GATE_CFG(CK_KER_ETH1,		ck_ker_eth1,		SEC_RIFSC(60)),
+	STM32_GATE_CFG(CK_ETH1_STP,		ck_ker_eth1stp,		SEC_RIFSC(60)),
+	STM32_GATE_CFG(CK_KER_ETH2,		ck_ker_eth2,		SEC_RIFSC(61)),
+	STM32_GATE_CFG(CK_ETH2_STP,		ck_ker_eth2stp,		SEC_RIFSC(61)),
+	STM32_GATE_CFG(CK_KER_ETH1PTP,		ck_ker_eth1ptp,		SEC_RIFSC(60)),
+	STM32_GATE_CFG(CK_KER_ETH2PTP,		ck_ker_eth2ptp,		SEC_RIFSC(61)),
+	STM32_GATE_CFG(CK_ETH1_MAC,		ck_ker_eth1mac,		SEC_RIFSC(60)),
+	STM32_GATE_CFG(CK_ETH1_TX,		ck_ker_eth1tx,		SEC_RIFSC(60)),
+	STM32_GATE_CFG(CK_ETH1_RX,		ck_ker_eth1rx,		SEC_RIFSC(60)),
+	STM32_GATE_CFG(CK_ETH2_MAC,		ck_ker_eth2mac,		SEC_RIFSC(61)),
+	STM32_GATE_CFG(CK_ETH2_TX,		ck_ker_eth2tx,		SEC_RIFSC(61)),
+	STM32_GATE_CFG(CK_ETH2_RX,		ck_ker_eth2rx,		SEC_RIFSC(61)),
+	STM32_COMPOSITE_CFG(CK_MCO1,		ck_mco1,		MP21_RIF_RCC_MCO1),
+	STM32_COMPOSITE_CFG(CK_MCO2,		ck_mco2,		MP21_RIF_RCC_MCO2),
+	STM32_COMPOSITE_CFG(CK_KER_ADC1,	ck_ker_adc1,		SEC_RIFSC(58)),
+	STM32_COMPOSITE_CFG(CK_KER_ADC2,	ck_ker_adc2,		SEC_RIFSC(59)),
+	STM32_COMPOSITE_CFG(CK_KER_USB2PHY1,	ck_ker_usb2phy1,	SEC_RIFSC(63)),
+	STM32_COMPOSITE_CFG(CK_KER_USB2PHY2EN,	ck_ker_usb2phy2_en,	SEC_RIFSC(66)),
+	STM32_COMPOSITE_CFG(CK_KER_DTS,		ck_ker_dts,		SEC_RIFSC(107)),
+	STM32_GATE_CFG(CK_KER_LTDC,		ck_ker_ltdc,		SEC_RIFSC(80)),
+};
+
+#define RESET_MP21(id, _offset, _bit_idx, _set_clr)	\
+	[id] = &(struct stm32_reset_cfg){		\
+		.offset		= (_offset),		\
+		.bit_idx	= (_bit_idx),		\
+		.set_clr	= (_set_clr),		\
+	}
+
+static const struct stm32_reset_cfg *stm32mp21_reset_cfg[] = {
+	RESET_MP21(TIM1_R,		RCC_TIM1CFGR,		0,	0),
+	RESET_MP21(TIM2_R,		RCC_TIM2CFGR,		0,	0),
+	RESET_MP21(TIM3_R,		RCC_TIM3CFGR,		0,	0),
+	RESET_MP21(TIM4_R,		RCC_TIM4CFGR,		0,	0),
+	RESET_MP21(TIM5_R,		RCC_TIM5CFGR,		0,	0),
+	RESET_MP21(TIM6_R,		RCC_TIM6CFGR,		0,	0),
+	RESET_MP21(TIM7_R,		RCC_TIM7CFGR,		0,	0),
+	RESET_MP21(TIM8_R,		RCC_TIM8CFGR,		0,	0),
+	RESET_MP21(TIM10_R,		RCC_TIM10CFGR,		0,	0),
+	RESET_MP21(TIM11_R,		RCC_TIM11CFGR,		0,	0),
+	RESET_MP21(TIM12_R,		RCC_TIM12CFGR,		0,	0),
+	RESET_MP21(TIM13_R,		RCC_TIM13CFGR,		0,	0),
+	RESET_MP21(TIM14_R,		RCC_TIM14CFGR,		0,	0),
+	RESET_MP21(TIM15_R,		RCC_TIM15CFGR,		0,	0),
+	RESET_MP21(TIM16_R,		RCC_TIM16CFGR,		0,	0),
+	RESET_MP21(TIM17_R,		RCC_TIM17CFGR,		0,	0),
+	RESET_MP21(LPTIM1_R,		RCC_LPTIM1CFGR,		0,	0),
+	RESET_MP21(LPTIM2_R,		RCC_LPTIM2CFGR,		0,	0),
+	RESET_MP21(LPTIM3_R,		RCC_LPTIM3CFGR,		0,	0),
+	RESET_MP21(LPTIM4_R,		RCC_LPTIM4CFGR,		0,	0),
+	RESET_MP21(LPTIM5_R,		RCC_LPTIM5CFGR,		0,	0),
+	RESET_MP21(SPI1_R,		RCC_SPI1CFGR,		0,	0),
+	RESET_MP21(SPI2_R,		RCC_SPI2CFGR,		0,	0),
+	RESET_MP21(SPI3_R,		RCC_SPI3CFGR,		0,	0),
+	RESET_MP21(SPI4_R,		RCC_SPI4CFGR,		0,	0),
+	RESET_MP21(SPI5_R,		RCC_SPI5CFGR,		0,	0),
+	RESET_MP21(SPI6_R,		RCC_SPI6CFGR,		0,	0),
+	RESET_MP21(SPDIFRX_R,		RCC_SPDIFRXCFGR,	0,	0),
+	RESET_MP21(USART1_R,		RCC_USART1CFGR,		0,	0),
+	RESET_MP21(USART2_R,		RCC_USART2CFGR,		0,	0),
+	RESET_MP21(USART3_R,		RCC_USART3CFGR,		0,	0),
+	RESET_MP21(UART4_R,		RCC_UART4CFGR,		0,	0),
+	RESET_MP21(UART5_R,		RCC_UART5CFGR,		0,	0),
+	RESET_MP21(USART6_R,		RCC_USART6CFGR,		0,	0),
+	RESET_MP21(UART7_R,		RCC_UART7CFGR,		0,	0),
+	RESET_MP21(LPUART1_R,		RCC_LPUART1CFGR,	0,	0),
+	RESET_MP21(I2C1_R,		RCC_I2C1CFGR,		0,	0),
+	RESET_MP21(I2C2_R,		RCC_I2C2CFGR,		0,	0),
+	RESET_MP21(I2C3_R,		RCC_I2C3CFGR,		0,	0),
+	RESET_MP21(SAI1_R,		RCC_SAI1CFGR,		0,	0),
+	RESET_MP21(SAI2_R,		RCC_SAI2CFGR,		0,	0),
+	RESET_MP21(SAI3_R,		RCC_SAI3CFGR,		0,	0),
+	RESET_MP21(SAI4_R,		RCC_SAI4CFGR,		0,	0),
+	RESET_MP21(MDF1_R,		RCC_MDF1CFGR,		0,	0),
+	RESET_MP21(FDCAN_R,		RCC_FDCANCFGR,		0,	0),
+	RESET_MP21(HDP_R,		RCC_HDPCFGR,		0,	0),
+	RESET_MP21(ADC1_R,		RCC_ADC1CFGR,		0,	0),
+	RESET_MP21(ADC2_R,		RCC_ADC2CFGR,		0,	0),
+	RESET_MP21(ETH1_R,		RCC_ETH1CFGR,		0,	0),
+	RESET_MP21(ETH2_R,		RCC_ETH2CFGR,		0,	0),
+	RESET_MP21(OTG_R,		RCC_OTGCFGR,		0,	0),
+	RESET_MP21(USBH_R,		RCC_USBHCFGR,		0,	0),
+	RESET_MP21(USB2PHY1_R,		RCC_USB2PHY1CFGR,	0,	0),
+	RESET_MP21(USB2PHY2_R,		RCC_USB2PHY2CFGR,	0,	0),
+	RESET_MP21(SDMMC1_R,		RCC_SDMMC1CFGR,		0,	0),
+	RESET_MP21(SDMMC1DLL_R,		RCC_SDMMC1CFGR,		16,	0),
+	RESET_MP21(SDMMC2_R,		RCC_SDMMC2CFGR,		0,	0),
+	RESET_MP21(SDMMC2DLL_R,		RCC_SDMMC2CFGR,		16,	0),
+	RESET_MP21(SDMMC3_R,		RCC_SDMMC3CFGR,		0,	0),
+	RESET_MP21(SDMMC3DLL_R,		RCC_SDMMC3CFGR,		16,	0),
+	RESET_MP21(LTDC_R,		RCC_LTDCCFGR,		0,	0),
+	RESET_MP21(CSI_R,		RCC_CSICFGR,		0,	0),
+	RESET_MP21(DCMIPP_R,		RCC_DCMIPPCFGR,		0,	0),
+	RESET_MP21(DCMIPSSI_R,		RCC_DCMIPSSICFGR,	0,	0),
+	RESET_MP21(WWDG1_R,		RCC_WWDG1CFGR,		0,	0),
+	RESET_MP21(VREF_R,		RCC_VREFCFGR,		0,	0),
+	RESET_MP21(DTS_R,		RCC_DTSCFGR,		0,	0),
+	RESET_MP21(CRC_R,		RCC_CRCCFGR,		0,	0),
+	RESET_MP21(SERC_R,		RCC_SERCCFGR,		0,	0),
+	RESET_MP21(I3C1_R,		RCC_I3C1CFGR,		0,	0),
+	RESET_MP21(I3C2_R,		RCC_I3C2CFGR,		0,	0),
+	RESET_MP21(IWDG2_KER_R,		RCC_IWDGC1CFGSETR,	18,	1),
+	RESET_MP21(IWDG4_KER_R,		RCC_IWDGC2CFGSETR,	18,	1),
+	RESET_MP21(RNG1_R,		RCC_RNG1CFGR,		0,	0),
+	RESET_MP21(RNG2_R,		RCC_RNG2CFGR,		0,	0),
+	RESET_MP21(PKA_R,		RCC_PKACFGR,		0,	0),
+	RESET_MP21(SAES_R,		RCC_SAESCFGR,		0,	0),
+	RESET_MP21(HASH1_R,		RCC_HASH1CFGR,		0,	0),
+	RESET_MP21(HASH2_R,		RCC_HASH2CFGR,		0,	0),
+	RESET_MP21(CRYP1_R,		RCC_CRYP1CFGR,		0,	0),
+	RESET_MP21(CRYP2_R,		RCC_CRYP2CFGR,		0,	0),
+};
+
+static u16 stm32mp21_cpt_gate[GATE_NB];
+
+static struct clk_stm32_clock_data stm32mp21_clock_data = {
+	.gate_cpt	= stm32mp21_cpt_gate,
+	.gates		= stm32mp21_gates,
+	.muxes		= stm32mp21_muxes,
+};
+
+static struct clk_stm32_reset_data stm32mp21_reset_data = {
+	.reset_lines	= stm32mp21_reset_cfg,
+	.nr_lines	= ARRAY_SIZE(stm32mp21_reset_cfg),
+};
+
+static const struct stm32_rcc_match_data stm32mp21_data = {
+	.tab_clocks	= stm32mp21_clock_cfg,
+	.num_clocks	= ARRAY_SIZE(stm32mp21_clock_cfg),
+	.maxbinding	= STM32MP21_LAST_CLK,
+	.clock_data	= &stm32mp21_clock_data,
+	.reset_data	= &stm32mp21_reset_data,
+	.check_security = &stm32mp21_check_security,
+};
+
+static const struct of_device_id stm32mp21_match_data[] = {
+	{ .compatible = "st,stm32mp21-rcc", .data = &stm32mp21_data, },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, stm32mp21_match_data);
+
+static int stm32mp21_rcc_clocks_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	void __iomem *base;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (WARN_ON(IS_ERR(base)))
+		return PTR_ERR(base);
+
+	return stm32_rcc_init(dev, stm32mp21_match_data, base);
+}
+
+static struct platform_driver stm32mp21_rcc_clocks_driver = {
+	.driver	= {
+		.name = "stm32mp21_rcc",
+		.of_match_table = stm32mp21_match_data,
+	},
+	.probe = stm32mp21_rcc_clocks_probe,
+};
+
+static int __init stm32mp21_clocks_init(void)
+{
+	return platform_driver_register(&stm32mp21_rcc_clocks_driver);
+}
+
+core_initcall(stm32mp21_clocks_init);
+
diff --git a/drivers/clk/stm32/stm32mp21_rcc.h b/drivers/clk/stm32/stm32mp21_rcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..df3ea921ffba103c5ab7bbb8f76f302c13b9782f
--- /dev/null
+++ b/drivers/clk/stm32/stm32mp21_rcc.h
@@ -0,0 +1,651 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) STMicroelectronics 2025 - All Rights Reserved
+ * Author: Gabriel Fernandez <gabriel.fernandez@foss.st.com> for STMicroelectronics.
+ */
+
+#ifndef STM32MP21_RCC_H
+#define STM32MP21_RCC_H
+
+#define RCC_SECCFGR0				0x0
+#define RCC_SECCFGR1				0x4
+#define RCC_SECCFGR2				0x8
+#define RCC_SECCFGR3				0xC
+#define RCC_PRIVCFGR0				0x10
+#define RCC_PRIVCFGR1				0x14
+#define RCC_PRIVCFGR2				0x18
+#define RCC_PRIVCFGR3				0x1C
+#define RCC_RCFGLOCKR0				0x20
+#define RCC_RCFGLOCKR1				0x24
+#define RCC_RCFGLOCKR2				0x28
+#define RCC_RCFGLOCKR3				0x2C
+#define RCC_R0CIDCFGR				0x30
+#define RCC_R0SEMCR				0x34
+#define RCC_R1CIDCFGR				0x38
+#define RCC_R1SEMCR				0x3C
+#define RCC_R2CIDCFGR				0x40
+#define RCC_R2SEMCR				0x44
+#define RCC_R3CIDCFGR				0x48
+#define RCC_R3SEMCR				0x4C
+#define RCC_R4CIDCFGR				0x50
+#define RCC_R4SEMCR				0x54
+#define RCC_R5CIDCFGR				0x58
+#define RCC_R5SEMCR				0x5C
+#define RCC_R6CIDCFGR				0x60
+#define RCC_R6SEMCR				0x64
+#define RCC_R7CIDCFGR				0x68
+#define RCC_R7SEMCR				0x6C
+#define RCC_R8CIDCFGR				0x70
+#define RCC_R8SEMCR				0x74
+#define RCC_R9CIDCFGR				0x78
+#define RCC_R9SEMCR				0x7C
+#define RCC_R10CIDCFGR				0x80
+#define RCC_R10SEMCR				0x84
+#define RCC_R11CIDCFGR				0x88
+#define RCC_R11SEMCR				0x8C
+#define RCC_R12CIDCFGR				0x90
+#define RCC_R12SEMCR				0x94
+#define RCC_R13CIDCFGR				0x98
+#define RCC_R13SEMCR				0x9C
+#define RCC_R14CIDCFGR				0xA0
+#define RCC_R14SEMCR				0xA4
+#define RCC_R15CIDCFGR				0xA8
+#define RCC_R15SEMCR				0xAC
+#define RCC_R16CIDCFGR				0xB0
+#define RCC_R16SEMCR				0xB4
+#define RCC_R17CIDCFGR				0xB8
+#define RCC_R17SEMCR				0xBC
+#define RCC_R18CIDCFGR				0xC0
+#define RCC_R18SEMCR				0xC4
+#define RCC_R19CIDCFGR				0xC8
+#define RCC_R19SEMCR				0xCC
+#define RCC_R20CIDCFGR				0xD0
+#define RCC_R20SEMCR				0xD4
+#define RCC_R21CIDCFGR				0xD8
+#define RCC_R21SEMCR				0xDC
+#define RCC_R22CIDCFGR				0xE0
+#define RCC_R22SEMCR				0xE4
+#define RCC_R23CIDCFGR				0xE8
+#define RCC_R23SEMCR				0xEC
+#define RCC_R24CIDCFGR				0xF0
+#define RCC_R24SEMCR				0xF4
+#define RCC_R25CIDCFGR				0xF8
+#define RCC_R25SEMCR				0xFC
+#define RCC_R26CIDCFGR				0x100
+#define RCC_R26SEMCR				0x104
+#define RCC_R27CIDCFGR				0x108
+#define RCC_R27SEMCR				0x10C
+#define RCC_R28CIDCFGR				0x110
+#define RCC_R28SEMCR				0x114
+#define RCC_R29CIDCFGR				0x118
+#define RCC_R29SEMCR				0x11C
+#define RCC_R30CIDCFGR				0x120
+#define RCC_R30SEMCR				0x124
+#define RCC_R31CIDCFGR				0x128
+#define RCC_R31SEMCR				0x12C
+#define RCC_R32CIDCFGR				0x130
+#define RCC_R32SEMCR				0x134
+#define RCC_R33CIDCFGR				0x138
+#define RCC_R33SEMCR				0x13C
+#define RCC_R34CIDCFGR				0x140
+#define RCC_R34SEMCR				0x144
+#define RCC_R35CIDCFGR				0x148
+#define RCC_R35SEMCR				0x14C
+#define RCC_R36CIDCFGR				0x150
+#define RCC_R36SEMCR				0x154
+#define RCC_R37CIDCFGR				0x158
+#define RCC_R37SEMCR				0x15C
+#define RCC_R38CIDCFGR				0x160
+#define RCC_R38SEMCR				0x164
+#define RCC_R39CIDCFGR				0x168
+#define RCC_R39SEMCR				0x16C
+#define RCC_R40CIDCFGR				0x170
+#define RCC_R40SEMCR				0x174
+#define RCC_R41CIDCFGR				0x178
+#define RCC_R41SEMCR				0x17C
+#define RCC_R42CIDCFGR				0x180
+#define RCC_R42SEMCR				0x184
+#define RCC_R43CIDCFGR				0x188
+#define RCC_R43SEMCR				0x18C
+#define RCC_R44CIDCFGR				0x190
+#define RCC_R44SEMCR				0x194
+#define RCC_R45CIDCFGR				0x198
+#define RCC_R45SEMCR				0x19C
+#define RCC_R46CIDCFGR				0x1A0
+#define RCC_R46SEMCR				0x1A4
+#define RCC_R47CIDCFGR				0x1A8
+#define RCC_R47SEMCR				0x1AC
+#define RCC_R48CIDCFGR				0x1B0
+#define RCC_R48SEMCR				0x1B4
+#define RCC_R49CIDCFGR				0x1B8
+#define RCC_R49SEMCR				0x1BC
+#define RCC_R50CIDCFGR				0x1C0
+#define RCC_R50SEMCR				0x1C4
+#define RCC_R51CIDCFGR				0x1C8
+#define RCC_R51SEMCR				0x1CC
+#define RCC_R52CIDCFGR				0x1D0
+#define RCC_R52SEMCR				0x1D4
+#define RCC_R53CIDCFGR				0x1D8
+#define RCC_R53SEMCR				0x1DC
+#define RCC_R54CIDCFGR				0x1E0
+#define RCC_R54SEMCR				0x1E4
+#define RCC_R55CIDCFGR				0x1E8
+#define RCC_R55SEMCR				0x1EC
+#define RCC_R56CIDCFGR				0x1F0
+#define RCC_R56SEMCR				0x1F4
+#define RCC_R57CIDCFGR				0x1F8
+#define RCC_R57SEMCR				0x1FC
+#define RCC_R58CIDCFGR				0x200
+#define RCC_R58SEMCR				0x204
+#define RCC_R59CIDCFGR				0x208
+#define RCC_R59SEMCR				0x20C
+#define RCC_R60CIDCFGR				0x210
+#define RCC_R60SEMCR				0x214
+#define RCC_R61CIDCFGR				0x218
+#define RCC_R61SEMCR				0x21C
+#define RCC_R62CIDCFGR				0x220
+#define RCC_R62SEMCR				0x224
+#define RCC_R63CIDCFGR				0x228
+#define RCC_R63SEMCR				0x22C
+#define RCC_R64CIDCFGR				0x230
+#define RCC_R64SEMCR				0x234
+#define RCC_R65CIDCFGR				0x238
+#define RCC_R65SEMCR				0x23C
+#define RCC_R66CIDCFGR				0x240
+#define RCC_R66SEMCR				0x244
+#define RCC_R67CIDCFGR				0x248
+#define RCC_R67SEMCR				0x24C
+#define RCC_R68CIDCFGR				0x250
+#define RCC_R68SEMCR				0x254
+#define RCC_R69CIDCFGR				0x258
+#define RCC_R69SEMCR				0x25C
+#define RCC_R70CIDCFGR				0x260
+#define RCC_R70SEMCR				0x264
+#define RCC_R71CIDCFGR				0x268
+#define RCC_R71SEMCR				0x26C
+#define RCC_R73CIDCFGR				0x278
+#define RCC_R73SEMCR				0x27C
+#define RCC_R74CIDCFGR				0x280
+#define RCC_R74SEMCR				0x284
+#define RCC_R75CIDCFGR				0x288
+#define RCC_R75SEMCR				0x28C
+#define RCC_R76CIDCFGR				0x290
+#define RCC_R76SEMCR				0x294
+#define RCC_R77CIDCFGR				0x298
+#define RCC_R77SEMCR				0x29C
+#define RCC_R78CIDCFGR				0x2A0
+#define RCC_R78SEMCR				0x2A4
+#define RCC_R79CIDCFGR				0x2A8
+#define RCC_R79SEMCR				0x2AC
+#define RCC_R83CIDCFGR				0x2C8
+#define RCC_R83SEMCR				0x2CC
+#define RCC_R84CIDCFGR				0x2D0
+#define RCC_R84SEMCR				0x2D4
+#define RCC_R85CIDCFGR				0x2D8
+#define RCC_R85SEMCR				0x2DC
+#define RCC_R86CIDCFGR				0x2E0
+#define RCC_R86SEMCR				0x2E4
+#define RCC_R87CIDCFGR				0x2E8
+#define RCC_R87SEMCR				0x2EC
+#define RCC_R88CIDCFGR				0x2F0
+#define RCC_R88SEMCR				0x2F4
+#define RCC_R90CIDCFGR				0x300
+#define RCC_R90SEMCR				0x304
+#define RCC_R91CIDCFGR				0x308
+#define RCC_R91SEMCR				0x30C
+#define RCC_R92CIDCFGR				0x310
+#define RCC_R92SEMCR				0x314
+#define RCC_R93CIDCFGR				0x318
+#define RCC_R93SEMCR				0x31C
+#define RCC_R94CIDCFGR				0x320
+#define RCC_R94SEMCR				0x324
+#define RCC_R95CIDCFGR				0x328
+#define RCC_R95SEMCR				0x32C
+#define RCC_R96CIDCFGR				0x330
+#define RCC_R96SEMCR				0x334
+#define RCC_R97CIDCFGR				0x338
+#define RCC_R97SEMCR				0x33C
+#define RCC_R98CIDCFGR				0x340
+#define RCC_R98SEMCR				0x344
+#define RCC_R101CIDCFGR				0x358
+#define RCC_R101SEMCR				0x35C
+#define RCC_R102CIDCFGR				0x360
+#define RCC_R102SEMCR				0x364
+#define RCC_R103CIDCFGR				0x368
+#define RCC_R103SEMCR				0x36C
+#define RCC_R104CIDCFGR				0x370
+#define RCC_R104SEMCR				0x374
+#define RCC_R105CIDCFGR				0x378
+#define RCC_R105SEMCR				0x37C
+#define RCC_R106CIDCFGR				0x380
+#define RCC_R106SEMCR				0x384
+#define RCC_R108CIDCFGR				0x390
+#define RCC_R108SEMCR				0x394
+#define RCC_R109CIDCFGR				0x398
+#define RCC_R109SEMCR				0x39C
+#define RCC_R110CIDCFGR				0x3A0
+#define RCC_R110SEMCR				0x3A4
+#define RCC_R111CIDCFGR				0x3A8
+#define RCC_R111SEMCR				0x3AC
+#define RCC_R112CIDCFGR				0x3B0
+#define RCC_R112SEMCR				0x3B4
+#define RCC_R113CIDCFGR				0x3B8
+#define RCC_R113SEMCR				0x3BC
+#define RCC_GRSTCSETR				0x400
+#define RCC_C1RSTCSETR				0x404
+#define RCC_C2RSTCSETR				0x40C
+#define RCC_HWRSTSCLRR				0x410
+#define RCC_C1HWRSTSCLRR			0x414
+#define RCC_C2HWRSTSCLRR			0x418
+#define RCC_C1BOOTRSTSSETR			0x41C
+#define RCC_C1BOOTRSTSCLRR			0x420
+#define RCC_C2BOOTRSTSSETR			0x424
+#define RCC_C2BOOTRSTSCLRR			0x428
+#define RCC_C1SREQSETR				0x42C
+#define RCC_C1SREQCLRR				0x430
+#define RCC_CPUBOOTCR				0x434
+#define RCC_STBYBOOTCR				0x438
+#define RCC_LEGBOOTCR				0x43C
+#define RCC_BDCR				0x440
+#define RCC_RDCR				0x44C
+#define RCC_C1MSRDCR				0x450
+#define RCC_PWRLPDLYCR				0x454
+#define RCC_C1CIESETR				0x458
+#define RCC_C1CIFCLRR				0x45C
+#define RCC_C2CIESETR				0x460
+#define RCC_C2CIFCLRR				0x464
+#define RCC_IWDGC1FZSETR			0x468
+#define RCC_IWDGC1FZCLRR			0x46C
+#define RCC_IWDGC1CFGSETR			0x470
+#define RCC_IWDGC1CFGCLRR			0x474
+#define RCC_IWDGC2FZSETR			0x478
+#define RCC_IWDGC2FZCLRR			0x47C
+#define RCC_IWDGC2CFGSETR			0x480
+#define RCC_IWDGC2CFGCLRR			0x484
+#define RCC_MCO1CFGR				0x488
+#define RCC_MCO2CFGR				0x48C
+#define RCC_OCENSETR				0x490
+#define RCC_OCENCLRR				0x494
+#define RCC_OCRDYR				0x498
+#define RCC_HSICFGR				0x49C
+#define RCC_MSICFGR				0x4A0
+#define RCC_LSICR				0x4A4
+#define RCC_RTCDIVR				0x4A8
+#define RCC_APB1DIVR				0x4AC
+#define RCC_APB2DIVR				0x4B0
+#define RCC_APB3DIVR				0x4B4
+#define RCC_APB4DIVR				0x4B8
+#define RCC_APB5DIVR				0x4BC
+#define RCC_APBDBGDIVR				0x4C0
+#define RCC_TIMG1PRER				0x4C8
+#define RCC_TIMG2PRER				0x4CC
+#define RCC_LSMCUDIVR				0x4D0
+#define RCC_DDRCPCFGR				0x4D4
+#define RCC_DDRCAPBCFGR				0x4D8
+#define RCC_DDRPHYCAPBCFGR			0x4DC
+#define RCC_DDRPHYCCFGR				0x4E0
+#define RCC_DDRCFGR				0x4E4
+#define RCC_DDRITFCFGR				0x4E8
+#define RCC_SYSRAMCFGR				0x4F0
+#define RCC_SRAM1CFGR				0x4F8
+#define RCC_RETRAMCFGR				0x500
+#define RCC_BKPSRAMCFGR				0x504
+#define RCC_OSPI1CFGR				0x514
+#define RCC_FMCCFGR				0x51C
+#define RCC_DBGCFGR				0x520
+#define RCC_STMCFGR				0x524
+#define RCC_ETRCFGR				0x528
+#define RCC_GPIOACFGR				0x52C
+#define RCC_GPIOBCFGR				0x530
+#define RCC_GPIOCCFGR				0x534
+#define RCC_GPIODCFGR				0x538
+#define RCC_GPIOECFGR				0x53C
+#define RCC_GPIOFCFGR				0x540
+#define RCC_GPIOGCFGR				0x544
+#define RCC_GPIOHCFGR				0x548
+#define RCC_GPIOICFGR				0x54C
+#define RCC_GPIOZCFGR				0x558
+#define RCC_HPDMA1CFGR				0x55C
+#define RCC_HPDMA2CFGR				0x560
+#define RCC_HPDMA3CFGR				0x564
+#define RCC_IPCC1CFGR				0x570
+#define RCC_RTCCFGR				0x578
+#define RCC_SYSCPU1CFGR				0x580
+#define RCC_BSECCFGR				0x584
+#define RCC_PLL2CFGR1				0x590
+#define RCC_PLL2CFGR2				0x594
+#define RCC_PLL2CFGR3				0x598
+#define RCC_PLL2CFGR4				0x59C
+#define RCC_PLL2CFGR5				0x5A0
+#define RCC_PLL2CFGR6				0x5A8
+#define RCC_PLL2CFGR7				0x5AC
+#define RCC_HSIFMONCR				0x5E0
+#define RCC_HSIFVALR				0x5E4
+#define RCC_MSIFMONCR				0x5E8
+#define RCC_MSIFVALR				0x5EC
+#define RCC_TIM1CFGR				0x700
+#define RCC_TIM2CFGR				0x704
+#define RCC_TIM3CFGR				0x708
+#define RCC_TIM4CFGR				0x70C
+#define RCC_TIM5CFGR				0x710
+#define RCC_TIM6CFGR				0x714
+#define RCC_TIM7CFGR				0x718
+#define RCC_TIM8CFGR				0x71C
+#define RCC_TIM10CFGR				0x720
+#define RCC_TIM11CFGR				0x724
+#define RCC_TIM12CFGR				0x728
+#define RCC_TIM13CFGR				0x72C
+#define RCC_TIM14CFGR				0x730
+#define RCC_TIM15CFGR				0x734
+#define RCC_TIM16CFGR				0x738
+#define RCC_TIM17CFGR				0x73C
+#define RCC_LPTIM1CFGR				0x744
+#define RCC_LPTIM2CFGR				0x748
+#define RCC_LPTIM3CFGR				0x74C
+#define RCC_LPTIM4CFGR				0x750
+#define RCC_LPTIM5CFGR				0x754
+#define RCC_SPI1CFGR				0x758
+#define RCC_SPI2CFGR				0x75C
+#define RCC_SPI3CFGR				0x760
+#define RCC_SPI4CFGR				0x764
+#define RCC_SPI5CFGR				0x768
+#define RCC_SPI6CFGR				0x76C
+#define RCC_SPDIFRXCFGR				0x778
+#define RCC_USART1CFGR				0x77C
+#define RCC_USART2CFGR				0x780
+#define RCC_USART3CFGR				0x784
+#define RCC_UART4CFGR				0x788
+#define RCC_UART5CFGR				0x78C
+#define RCC_USART6CFGR				0x790
+#define RCC_UART7CFGR				0x794
+#define RCC_LPUART1CFGR				0x7A0
+#define RCC_I2C1CFGR				0x7A4
+#define RCC_I2C2CFGR				0x7A8
+#define RCC_I2C3CFGR				0x7AC
+#define RCC_SAI1CFGR				0x7C4
+#define RCC_SAI2CFGR				0x7C8
+#define RCC_SAI3CFGR				0x7CC
+#define RCC_SAI4CFGR				0x7D0
+#define RCC_MDF1CFGR				0x7D8
+#define RCC_FDCANCFGR				0x7E0
+#define RCC_HDPCFGR				0x7E4
+#define RCC_ADC1CFGR				0x7E8
+#define RCC_ADC2CFGR				0x7EC
+#define RCC_ETH1CFGR				0x7F0
+#define RCC_ETH2CFGR				0x7F4
+#define RCC_USBHCFGR				0x7FC
+#define RCC_USB2PHY1CFGR			0x800
+#define RCC_OTGCFGR				0x808
+#define RCC_USB2PHY2CFGR			0x80C
+#define RCC_STGENCFGR				0x824
+#define RCC_SDMMC1CFGR				0x830
+#define RCC_SDMMC2CFGR				0x834
+#define RCC_SDMMC3CFGR				0x838
+#define RCC_LTDCCFGR				0x840
+#define RCC_CSICFGR				0x858
+#define RCC_DCMIPPCFGR				0x85C
+#define RCC_DCMIPSSICFGR			0x860
+#define RCC_RNG1CFGR				0x870
+#define RCC_RNG2CFGR				0x874
+#define RCC_PKACFGR				0x878
+#define RCC_SAESCFGR				0x87C
+#define RCC_HASH1CFGR				0x880
+#define RCC_HASH2CFGR				0x884
+#define RCC_CRYP1CFGR				0x888
+#define RCC_CRYP2CFGR				0x88C
+#define RCC_IWDG1CFGR				0x894
+#define RCC_IWDG2CFGR				0x898
+#define RCC_IWDG3CFGR				0x89C
+#define RCC_IWDG4CFGR				0x8A0
+#define RCC_WWDG1CFGR				0x8A4
+#define RCC_VREFCFGR				0x8AC
+#define RCC_DTSCFGR				0x8B0
+#define RCC_CRCCFGR				0x8B4
+#define RCC_SERCCFGR				0x8B8
+#define RCC_DDRPERFMCFGR			0x8C0
+#define RCC_I3C1CFGR				0x8C8
+#define RCC_I3C2CFGR				0x8CC
+#define RCC_I3C3CFGR				0x8D0
+#define RCC_MUXSELCFGR				0x1000
+#define RCC_XBAR0CFGR				0x1018
+#define RCC_XBAR1CFGR				0x101C
+#define RCC_XBAR2CFGR				0x1020
+#define RCC_XBAR3CFGR				0x1024
+#define RCC_XBAR4CFGR				0x1028
+#define RCC_XBAR5CFGR				0x102C
+#define RCC_XBAR6CFGR				0x1030
+#define RCC_XBAR7CFGR				0x1034
+#define RCC_XBAR8CFGR				0x1038
+#define RCC_XBAR9CFGR				0x103C
+#define RCC_XBAR10CFGR				0x1040
+#define RCC_XBAR11CFGR				0x1044
+#define RCC_XBAR12CFGR				0x1048
+#define RCC_XBAR13CFGR				0x104C
+#define RCC_XBAR14CFGR				0x1050
+#define RCC_XBAR15CFGR				0x1054
+#define RCC_XBAR16CFGR				0x1058
+#define RCC_XBAR17CFGR				0x105C
+#define RCC_XBAR18CFGR				0x1060
+#define RCC_XBAR19CFGR				0x1064
+#define RCC_XBAR20CFGR				0x1068
+#define RCC_XBAR21CFGR				0x106C
+#define RCC_XBAR22CFGR				0x1070
+#define RCC_XBAR23CFGR				0x1074
+#define RCC_XBAR24CFGR				0x1078
+#define RCC_XBAR25CFGR				0x107C
+#define RCC_XBAR26CFGR				0x1080
+#define RCC_XBAR27CFGR				0x1084
+#define RCC_XBAR28CFGR				0x1088
+#define RCC_XBAR29CFGR				0x108C
+#define RCC_XBAR30CFGR				0x1090
+#define RCC_XBAR31CFGR				0x1094
+#define RCC_XBAR32CFGR				0x1098
+#define RCC_XBAR33CFGR				0x109C
+#define RCC_XBAR34CFGR				0x10A0
+#define RCC_XBAR35CFGR				0x10A4
+#define RCC_XBAR36CFGR				0x10A8
+#define RCC_XBAR37CFGR				0x10AC
+#define RCC_XBAR38CFGR				0x10B0
+#define RCC_XBAR39CFGR				0x10B4
+#define RCC_XBAR40CFGR				0x10B8
+#define RCC_XBAR41CFGR				0x10BC
+#define RCC_XBAR42CFGR				0x10C0
+#define RCC_XBAR43CFGR				0x10C4
+#define RCC_XBAR44CFGR				0x10C8
+#define RCC_XBAR45CFGR				0x10CC
+#define RCC_XBAR46CFGR				0x10D0
+#define RCC_XBAR47CFGR				0x10D4
+#define RCC_XBAR48CFGR				0x10D8
+#define RCC_XBAR49CFGR				0x10DC
+#define RCC_XBAR50CFGR				0x10E0
+#define RCC_XBAR51CFGR				0x10E4
+#define RCC_XBAR52CFGR				0x10E8
+#define RCC_XBAR53CFGR				0x10EC
+#define RCC_XBAR54CFGR				0x10F0
+#define RCC_XBAR55CFGR				0x10F4
+#define RCC_XBAR56CFGR				0x10F8
+#define RCC_XBAR57CFGR				0x10FC
+#define RCC_XBAR58CFGR				0x1100
+#define RCC_XBAR59CFGR				0x1104
+#define RCC_XBAR60CFGR				0x1108
+#define RCC_XBAR61CFGR				0x110C
+#define RCC_XBAR62CFGR				0x1110
+#define RCC_XBAR63CFGR				0x1114
+#define RCC_PREDIV0CFGR				0x1118
+#define RCC_PREDIV1CFGR				0x111C
+#define RCC_PREDIV2CFGR				0x1120
+#define RCC_PREDIV3CFGR				0x1124
+#define RCC_PREDIV4CFGR				0x1128
+#define RCC_PREDIV5CFGR				0x112C
+#define RCC_PREDIV6CFGR				0x1130
+#define RCC_PREDIV7CFGR				0x1134
+#define RCC_PREDIV8CFGR				0x1138
+#define RCC_PREDIV9CFGR				0x113C
+#define RCC_PREDIV10CFGR			0x1140
+#define RCC_PREDIV11CFGR			0x1144
+#define RCC_PREDIV12CFGR			0x1148
+#define RCC_PREDIV13CFGR			0x114C
+#define RCC_PREDIV14CFGR			0x1150
+#define RCC_PREDIV15CFGR			0x1154
+#define RCC_PREDIV16CFGR			0x1158
+#define RCC_PREDIV17CFGR			0x115C
+#define RCC_PREDIV18CFGR			0x1160
+#define RCC_PREDIV19CFGR			0x1164
+#define RCC_PREDIV20CFGR			0x1168
+#define RCC_PREDIV21CFGR			0x116C
+#define RCC_PREDIV22CFGR			0x1170
+#define RCC_PREDIV23CFGR			0x1174
+#define RCC_PREDIV24CFGR			0x1178
+#define RCC_PREDIV25CFGR			0x117C
+#define RCC_PREDIV26CFGR			0x1180
+#define RCC_PREDIV27CFGR			0x1184
+#define RCC_PREDIV28CFGR			0x1188
+#define RCC_PREDIV29CFGR			0x118C
+#define RCC_PREDIV30CFGR			0x1190
+#define RCC_PREDIV31CFGR			0x1194
+#define RCC_PREDIV32CFGR			0x1198
+#define RCC_PREDIV33CFGR			0x119C
+#define RCC_PREDIV34CFGR			0x11A0
+#define RCC_PREDIV35CFGR			0x11A4
+#define RCC_PREDIV36CFGR			0x11A8
+#define RCC_PREDIV37CFGR			0x11AC
+#define RCC_PREDIV38CFGR			0x11B0
+#define RCC_PREDIV39CFGR			0x11B4
+#define RCC_PREDIV40CFGR			0x11B8
+#define RCC_PREDIV41CFGR			0x11BC
+#define RCC_PREDIV42CFGR			0x11C0
+#define RCC_PREDIV43CFGR			0x11C4
+#define RCC_PREDIV44CFGR			0x11C8
+#define RCC_PREDIV45CFGR			0x11CC
+#define RCC_PREDIV46CFGR			0x11D0
+#define RCC_PREDIV47CFGR			0x11D4
+#define RCC_PREDIV48CFGR			0x11D8
+#define RCC_PREDIV49CFGR			0x11DC
+#define RCC_PREDIV50CFGR			0x11E0
+#define RCC_PREDIV51CFGR			0x11E4
+#define RCC_PREDIV52CFGR			0x11E8
+#define RCC_PREDIV53CFGR			0x11EC
+#define RCC_PREDIV54CFGR			0x11F0
+#define RCC_PREDIV55CFGR			0x11F4
+#define RCC_PREDIV56CFGR			0x11F8
+#define RCC_PREDIV57CFGR			0x11FC
+#define RCC_PREDIV58CFGR			0x1200
+#define RCC_PREDIV59CFGR			0x1204
+#define RCC_PREDIV60CFGR			0x1208
+#define RCC_PREDIV61CFGR			0x120C
+#define RCC_PREDIV62CFGR			0x1210
+#define RCC_PREDIV63CFGR			0x1214
+#define RCC_PREDIVSR1				0x1218
+#define RCC_PREDIVSR2				0x121C
+#define RCC_FINDIV0CFGR				0x1224
+#define RCC_FINDIV1CFGR				0x1228
+#define RCC_FINDIV2CFGR				0x122C
+#define RCC_FINDIV3CFGR				0x1230
+#define RCC_FINDIV4CFGR				0x1234
+#define RCC_FINDIV5CFGR				0x1238
+#define RCC_FINDIV6CFGR				0x123C
+#define RCC_FINDIV7CFGR				0x1240
+#define RCC_FINDIV8CFGR				0x1244
+#define RCC_FINDIV9CFGR				0x1248
+#define RCC_FINDIV10CFGR			0x124C
+#define RCC_FINDIV11CFGR			0x1250
+#define RCC_FINDIV12CFGR			0x1254
+#define RCC_FINDIV13CFGR			0x1258
+#define RCC_FINDIV14CFGR			0x125C
+#define RCC_FINDIV15CFGR			0x1260
+#define RCC_FINDIV16CFGR			0x1264
+#define RCC_FINDIV17CFGR			0x1268
+#define RCC_FINDIV18CFGR			0x126C
+#define RCC_FINDIV19CFGR			0x1270
+#define RCC_FINDIV20CFGR			0x1274
+#define RCC_FINDIV21CFGR			0x1278
+#define RCC_FINDIV22CFGR			0x127C
+#define RCC_FINDIV23CFGR			0x1280
+#define RCC_FINDIV24CFGR			0x1284
+#define RCC_FINDIV25CFGR			0x1288
+#define RCC_FINDIV26CFGR			0x128C
+#define RCC_FINDIV27CFGR			0x1290
+#define RCC_FINDIV28CFGR			0x1294
+#define RCC_FINDIV29CFGR			0x1298
+#define RCC_FINDIV30CFGR			0x129C
+#define RCC_FINDIV31CFGR			0x12A0
+#define RCC_FINDIV32CFGR			0x12A4
+#define RCC_FINDIV33CFGR			0x12A8
+#define RCC_FINDIV34CFGR			0x12AC
+#define RCC_FINDIV35CFGR			0x12B0
+#define RCC_FINDIV36CFGR			0x12B4
+#define RCC_FINDIV37CFGR			0x12B8
+#define RCC_FINDIV38CFGR			0x12BC
+#define RCC_FINDIV39CFGR			0x12C0
+#define RCC_FINDIV40CFGR			0x12C4
+#define RCC_FINDIV41CFGR			0x12C8
+#define RCC_FINDIV42CFGR			0x12CC
+#define RCC_FINDIV43CFGR			0x12D0
+#define RCC_FINDIV44CFGR			0x12D4
+#define RCC_FINDIV45CFGR			0x12D8
+#define RCC_FINDIV46CFGR			0x12DC
+#define RCC_FINDIV47CFGR			0x12E0
+#define RCC_FINDIV48CFGR			0x12E4
+#define RCC_FINDIV49CFGR			0x12E8
+#define RCC_FINDIV50CFGR			0x12EC
+#define RCC_FINDIV51CFGR			0x12F0
+#define RCC_FINDIV52CFGR			0x12F4
+#define RCC_FINDIV53CFGR			0x12F8
+#define RCC_FINDIV54CFGR			0x12FC
+#define RCC_FINDIV55CFGR			0x1300
+#define RCC_FINDIV56CFGR			0x1304
+#define RCC_FINDIV57CFGR			0x1308
+#define RCC_FINDIV58CFGR			0x130C
+#define RCC_FINDIV59CFGR			0x1310
+#define RCC_FINDIV60CFGR			0x1314
+#define RCC_FINDIV61CFGR			0x1318
+#define RCC_FINDIV62CFGR			0x131C
+#define RCC_FINDIV63CFGR			0x1320
+#define RCC_FINDIVSR1				0x1324
+#define RCC_FINDIVSR2				0x1328
+#define RCC_FCALCOBS0CFGR			0x1340
+#define RCC_FCALCOBS1CFGR			0x1344
+#define RCC_FCALCREFCFGR			0x1348
+#define RCC_FCALCCR1				0x134C
+#define RCC_FCALCCR2				0x1354
+#define RCC_FCALCSR				0x1358
+#define RCC_PLL4CFGR1				0x1360
+#define RCC_PLL4CFGR2				0x1364
+#define RCC_PLL4CFGR3				0x1368
+#define RCC_PLL4CFGR4				0x136C
+#define RCC_PLL4CFGR5				0x1370
+#define RCC_PLL4CFGR6				0x1378
+#define RCC_PLL4CFGR7				0x137C
+#define RCC_PLL5CFGR1				0x1388
+#define RCC_PLL5CFGR2				0x138C
+#define RCC_PLL5CFGR3				0x1390
+#define RCC_PLL5CFGR4				0x1394
+#define RCC_PLL5CFGR5				0x1398
+#define RCC_PLL5CFGR6				0x13A0
+#define RCC_PLL5CFGR7				0x13A4
+#define RCC_PLL6CFGR1				0x13B0
+#define RCC_PLL6CFGR2				0x13B4
+#define RCC_PLL6CFGR3				0x13B8
+#define RCC_PLL6CFGR4				0x13BC
+#define RCC_PLL6CFGR5				0x13C0
+#define RCC_PLL6CFGR6				0x13C8
+#define RCC_PLL6CFGR7				0x13CC
+#define RCC_PLL7CFGR1				0x13D8
+#define RCC_PLL7CFGR2				0x13DC
+#define RCC_PLL7CFGR3				0x13E0
+#define RCC_PLL7CFGR4				0x13E4
+#define RCC_PLL7CFGR5				0x13E8
+#define RCC_PLL7CFGR6				0x13F0
+#define RCC_PLL7CFGR7				0x13F4
+#define RCC_PLL8CFGR1				0x1400
+#define RCC_PLL8CFGR2				0x1404
+#define RCC_PLL8CFGR3				0x1408
+#define RCC_PLL8CFGR4				0x140C
+#define RCC_PLL8CFGR5				0x1410
+#define RCC_PLL8CFGR6				0x1418
+#define RCC_PLL8CFGR7				0x141C
+#define RCC_VERR				0xFFF4
+#define RCC_IDR					0xFFF8
+#define RCC_SIDR				0xFFFC
+
+#endif /* STM32MP21_RCC_H */

-- 
2.25.1

