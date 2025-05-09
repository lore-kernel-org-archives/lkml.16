Received: from mail-sh.amlogic.com (unknown [58.32.228.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98D427587A;
	Fri,  9 May 2025 07:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=58.32.228.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746777000; cv=none; b=H6JB9V6ja6HejAARqrSf7BA7O5apicA/Ed+zJjR8JabQEHjpeDVbu120OyH6RGMYDqBY5yd0khysNuYozfitTIe+K7vSH3f2A7b6qf2wem7RlSwxWtrzhbLR0sx/aahAtPQ+/+V9PRGM65t/oK7QtAfcUV9pK7K2Mr5XDplv47Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746777000; c=relaxed/simple;
	bh=ilThju02aXl0eYg7Bwuj2jY4T6NInXTyHpIDujPf81g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bVVRRkoYj4q2/K8u/rGUeec3IR0cqjTSiUHVkF3jejBJHop4NYANftS8StArAR3gLmAdaP25MgT5ong4Md3P9CbQvSiPAJDJazGvWeldzDEmvRTWyNIlK+W91Vj0C4XpvM57LEl0xDdBKsdOkEkJucqU2jQeqGpU2YpDGoaLIIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; arc=none smtp.client-ip=58.32.228.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Received: from rd03-sz.software.amlogic (10.28.11.121) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.39; Fri, 9 May 2025
 15:48:44 +0800
From: Jian Hu <jian.hu@amlogic.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Xianwei Zhao
	<xianwei.zhao@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, "Stephen
 Boyd" <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
	"Dmitry Rokosov" <ddrokosov@sberdevices.ru>, robh+dt <robh+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
CC: Jian Hu <jian.hu@amlogic.com>, devicetree <devicetree@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>, linux-amlogic
	<linux-amlogic@lists.infradead.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v3 3/6] dt-bindings: clock: add Amlogic T7 peripherals clock controller
Date: Fri, 9 May 2025 07:48:21 +0000
Message-ID: <20250509074825.1933254-4-jian.hu@amlogic.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250509074825.1933254-1-jian.hu@amlogic.com>
References: <20250509074825.1933254-1-jian.hu@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add DT bindings for the peripheral clock controller of the Amlogic T7
SoC family.

Signed-off-by: Jian Hu <jian.hu@amlogic.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../clock/amlogic,t7-peripherals-clkc.yaml    | 112 +++++++++
 .../clock/amlogic,t7-peripherals-clkc.h       | 230 ++++++++++++++++++
 2 files changed, 342 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.yaml
 create mode 100644 include/dt-bindings/clock/amlogic,t7-peripherals-clkc.h

diff --git a/Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.yaml
new file mode 100644
index 000000000000..c7544d0d89c7
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.yaml
@@ -0,0 +1,112 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2024 Amlogic, Inc. All rights reserved
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/amlogic,t7-peripherals-clkc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic T7 Peripherals Clock Controller
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+  - Jerome Brunet <jbrunet@baylibre.com>
+  - Xianwei Zhao <xianwei.zhao@amlogic.com>
+  - Jian Hu <jian.hu@amlogic.com>
+
+properties:
+  compatible:
+    const: amlogic,t7-peripherals-clkc
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  clocks:
+    minItems: 13
+    items:
+      - description: input oscillator
+      - description: input sys clk
+      - description: input fclk div 2
+      - description: input fclk div 2p5
+      - description: input fclk div 3
+      - description: input fclk div 4
+      - description: input fclk div 5
+      - description: input fclk div 7
+      - description: input hifi pll
+      - description: input gp0 pll
+      - description: input gp1 pll
+      - description: input mpll1
+      - description: input mpll2
+      - description: external input rmii oscillator (optional)
+      - description: input video pll0 (optional)
+      - description: external pad input for rtc (optional)
+
+  clock-names:
+    minItems: 13
+    items:
+      - const: xtal
+      - const: sys
+      - const: fdiv2
+      - const: fdiv2p5
+      - const: fdiv3
+      - const: fdiv4
+      - const: fdiv5
+      - const: fdiv7
+      - const: hifi
+      - const: gp0
+      - const: gp1
+      - const: mpll1
+      - const: mpll2
+      - const: ext_rmii
+      - const: vid_pll0
+      - const: ext_rtc
+
+required:
+  - compatible
+  - '#clock-cells'
+  - reg
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    apb {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        clkc_periphs:clock-controller@0 {
+            compatible = "amlogic,t7-peripherals-clkc";
+            reg = <0 0x0 0 0x1c8>;
+            #clock-cells = <1>;
+            clocks = <&xtal>,
+                     <&scmi_clk 13>,
+                     <&scmi_clk 18>,
+                     <&scmi_clk 20>,
+                     <&scmi_clk 22>,
+                     <&scmi_clk 24>,
+                     <&scmi_clk 26>,
+                     <&scmi_clk 28>,
+                     <&hifi 1>,
+                     <&gp0 1>,
+                     <&gp1 1>,
+                     <&mpll 4>,
+                     <&mpll 6>;
+            clock-names = "xtal",
+                          "sys",
+                          "fdiv2",
+                          "fdiv2p5",
+                          "fdiv3",
+                          "fdiv4",
+                          "fdiv5",
+                          "fdiv7",
+                          "hifi",
+                          "gp0",
+                          "gp1",
+                          "mpll1",
+                          "mpll2";
+        };
+    };
diff --git a/include/dt-bindings/clock/amlogic,t7-peripherals-clkc.h b/include/dt-bindings/clock/amlogic,t7-peripherals-clkc.h
new file mode 100644
index 000000000000..82ce9a7624ac
--- /dev/null
+++ b/include/dt-bindings/clock/amlogic,t7-peripherals-clkc.h
@@ -0,0 +1,230 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright (C) 2024 Amlogic, Inc. All rights reserved
+ */
+
+#ifndef __T7_PERIPHERALS_CLKC_H
+#define __T7_PERIPHERALS_CLKC_H
+
+#define CLKID_RTC_32K_IN		0
+#define CLKID_RTC_32K_DIV		1
+#define CLKID_RTC_32K_FORCE_SEL		2
+#define CLKID_RTC_32K_OUT		3
+#define CLKID_RTC_32K_MUX0_0		4
+#define CLKID_RTC_32K_MUX0_1		5
+#define CLKID_RTC			6
+#define CLKID_CECB_32K_IN		7
+#define CLKID_CECB_32K_DIV		8
+#define CLKID_CECB_32K_SEL_PRE		9
+#define CLKID_CECB_32K_SEL		10
+#define CLKID_CECA_32K_IN		11
+#define CLKID_CECA_32K_DIV		12
+#define CLKID_CECA_32K_SEL_PRE		13
+#define CLKID_CECA_32K_SEL		14
+#define CLKID_CECA_32K			15
+#define CLKID_CECB_32K			16
+#define CLKID_SC_SEL			17
+#define CLKID_SC_DIV			18
+#define CLKID_SC			19
+#define CLKID_DSPA_A_SEL		20
+#define CLKID_DSPA_A_DIV		21
+#define CLKID_DSPA_A			22
+#define CLKID_DSPA_B_SEL		23
+#define CLKID_DSPA_B_DIV		24
+#define CLKID_DSPA_B			25
+#define CLKID_DSPA			26
+#define CLKID_DSPB_A_SEL		27
+#define CLKID_DSPB_A_DIV		28
+#define CLKID_DSPB_A			29
+#define CLKID_DSPB_B_SEL		30
+#define CLKID_DSPB_B_DIV		31
+#define CLKID_DSPB_B			32
+#define CLKID_DSPB			33
+#define CLKID_CLK_24M			34
+#define CLKID_CLK_24M_DIV2		35
+#define CLKID_CLK_12M			36
+#define CLKID_ANAKIN_0_SEL		37
+#define CLKID_ANAKIN_0_DIV		38
+#define CLKID_ANAKIN_0			39
+#define CLKID_ANAKIN_1_SEL		40
+#define CLKID_ANAKIN_1_DIV		41
+#define CLKID_ANAKIN_1			42
+#define CLKID_ANAKIN			43
+#define CLKID_ANAKIN_CLK		44
+#define CLKID_FCLK_DIV2_DIVN_PRE	45
+#define CLKID_FCLK_DIV2_DIVN		46
+#define CLKID_TS_DIV			47
+#define CLKID_TS			48
+#define CLKID_MIPI_CSI_PHY_0_SEL	49
+#define CLKID_MIPI_CSI_PHY_0_DIV	50
+#define CLKID_MIPI_CSI_PHY_0		51
+#define CLKID_MIPI_CSI_PHY_1_SEL	52
+#define CLKID_MIPI_CSI_PHY_1_DIV	53
+#define CLKID_MIPI_CSI_PHY_1		54
+#define CLKID_MIPI_CSI_PHY		55
+#define CLKID_MIPI_ISP_SEL		56
+#define CLKID_MIPI_ISP_DIV		57
+#define CLKID_MIPI_ISP			58
+#define CLKID_MALI_0_SEL		59
+#define CLKID_MALI_0_DIV		60
+#define CLKID_MALI_0			61
+#define CLKID_MALI_1_SEL		62
+#define CLKID_MALI_1_DIV		63
+#define CLKID_MALI_1			64
+#define CLKID_MALI			65
+#define CLKID_ETH_RMII_SEL		66
+#define CLKID_ETH_RMII_DIV		67
+#define CLKID_ETH_RMII			68
+#define CLKID_FCLK_DIV2_DIV8		69
+#define CLKID_ETH_125M			70
+#define CLKID_SD_EMMC_C_SEL		71
+#define CLKID_SD_EMMC_C_DIV		72
+#define CLKID_SD_EMMC_C			73
+#define CLKID_SD_EMMC_A_SEL		74
+#define CLKID_SD_EMMC_A_DIV		75
+#define CLKID_SD_EMMC_A			76
+#define CLKID_SD_EMMC_B_SEL		77
+#define CLKID_SD_EMMC_B_DIV		78
+#define CLKID_SD_EMMC_B			79
+#define CLKID_SPICC0_SEL		80
+#define CLKID_SPICC0_DIV		81
+#define CLKID_SPICC0			82
+#define CLKID_SPICC1_SEL		83
+#define CLKID_SPICC1_DIV		84
+#define CLKID_SPICC1			85
+#define CLKID_SPICC2_SEL		86
+#define CLKID_SPICC2_DIV		87
+#define CLKID_SPICC2			88
+#define CLKID_SPICC3_SEL		89
+#define CLKID_SPICC3_DIV		90
+#define CLKID_SPICC3			91
+#define CLKID_SPICC4_SEL		92
+#define CLKID_SPICC4_DIV		93
+#define CLKID_SPICC4			94
+#define CLKID_SPICC5_SEL		95
+#define CLKID_SPICC5_DIV		96
+#define CLKID_SPICC5			97
+#define CLKID_SARADC_SEL		98
+#define CLKID_SARADC_DIV		99
+#define CLKID_SARADC			100
+#define CLKID_PWM_A_SEL			101
+#define CLKID_PWM_A_DIV			102
+#define CLKID_PWM_A			103
+#define CLKID_PWM_B_SEL			104
+#define CLKID_PWM_B_DIV			105
+#define CLKID_PWM_B			106
+#define CLKID_PWM_C_SEL			107
+#define CLKID_PWM_C_DIV			108
+#define CLKID_PWM_C			109
+#define CLKID_PWM_D_SEL			110
+#define CLKID_PWM_D_DIV			111
+#define CLKID_PWM_D			112
+#define CLKID_PWM_E_SEL			113
+#define CLKID_PWM_E_DIV			114
+#define CLKID_PWM_E			115
+#define CLKID_PWM_F_SEL			116
+#define CLKID_PWM_F_DIV			117
+#define CLKID_PWM_F			118
+#define CLKID_PWM_AO_A_SEL		119
+#define CLKID_PWM_AO_A_DIV		120
+#define CLKID_PWM_AO_A			121
+#define CLKID_PWM_AO_B_SEL		122
+#define CLKID_PWM_AO_B_DIV		123
+#define CLKID_PWM_AO_B			124
+#define CLKID_PWM_AO_C_SEL		125
+#define CLKID_PWM_AO_C_DIV		126
+#define CLKID_PWM_AO_C			127
+#define CLKID_PWM_AO_D_SEL		128
+#define CLKID_PWM_AO_D_DIV		129
+#define CLKID_PWM_AO_D			130
+#define CLKID_PWM_AO_E_SEL		131
+#define CLKID_PWM_AO_E_DIV		132
+#define CLKID_PWM_AO_E			133
+#define CLKID_PWM_AO_F_SEL		134
+#define CLKID_PWM_AO_F_DIV		135
+#define CLKID_PWM_AO_F			136
+#define CLKID_PWM_AO_G_SEL		137
+#define CLKID_PWM_AO_G_DIV		138
+#define CLKID_PWM_AO_G			139
+#define CLKID_PWM_AO_H_SEL		140
+#define CLKID_PWM_AO_H_DIV		141
+#define CLKID_PWM_AO_H			142
+#define CLKID_SYS_DDR			143
+#define CLKID_SYS_DOS			144
+#define CLKID_SYS_MIPI_DSI_A		145
+#define CLKID_SYS_MIPI_DSI_B		146
+#define CLKID_SYS_ETHPHY		147
+#define CLKID_SYS_MALI			148
+#define CLKID_SYS_AOCPU			149
+#define CLKID_SYS_AUCPU			150
+#define CLKID_SYS_CEC			151
+#define CLKID_SYS_GDC			152
+#define CLKID_SYS_DESWARP		153
+#define CLKID_SYS_AMPIPE_NAND		154
+#define CLKID_SYS_AMPIPE_ETH		155
+#define CLKID_SYS_AM2AXI0		156
+#define CLKID_SYS_AM2AXI1		157
+#define CLKID_SYS_AM2AXI2		158
+#define CLKID_SYS_SD_EMMC_A		159
+#define CLKID_SYS_SD_EMMC_B		160
+#define CLKID_SYS_SD_EMMC_C		161
+#define CLKID_SYS_SMARTCARD		162
+#define CLKID_SYS_ACODEC		163
+#define CLKID_SYS_SPIFC			164
+#define CLKID_SYS_MSR_CLK		165
+#define CLKID_SYS_IR_CTRL		166
+#define CLKID_SYS_AUDIO			167
+#define CLKID_SYS_ETH			168
+#define CLKID_SYS_UART_A		169
+#define CLKID_SYS_UART_B		170
+#define CLKID_SYS_UART_C		171
+#define CLKID_SYS_UART_D		172
+#define CLKID_SYS_UART_E		173
+#define CLKID_SYS_UART_F		174
+#define CLKID_SYS_AIFIFO		175
+#define CLKID_SYS_SPICC2		176
+#define CLKID_SYS_SPICC3		177
+#define CLKID_SYS_SPICC4		178
+#define CLKID_SYS_TS_A73		179
+#define CLKID_SYS_TS_A53		180
+#define CLKID_SYS_SPICC5		181
+#define CLKID_SYS_G2D			182
+#define CLKID_SYS_SPICC0		183
+#define CLKID_SYS_SPICC1		184
+#define CLKID_SYS_PCIE			185
+#define CLKID_SYS_USB			186
+#define CLKID_SYS_PCIE_PHY		187
+#define CLKID_SYS_I2C_AO_A		188
+#define CLKID_SYS_I2C_AO_B		189
+#define CLKID_SYS_I2C_M_A		190
+#define CLKID_SYS_I2C_M_B		191
+#define CLKID_SYS_I2C_M_C		192
+#define CLKID_SYS_I2C_M_D		193
+#define CLKID_SYS_I2C_M_E		194
+#define CLKID_SYS_I2C_M_F		195
+#define CLKID_SYS_HDMITX_APB		196
+#define CLKID_SYS_I2C_S_A		197
+#define CLKID_SYS_HDMIRX_PCLK		198
+#define CLKID_SYS_MMC_APB		199
+#define CLKID_SYS_MIPI_ISP_PCLK		200
+#define CLKID_SYS_RSA			201
+#define CLKID_SYS_PCLK_SYS_APB		202
+#define CLKID_SYS_A73PCLK_APB		203
+#define CLKID_SYS_DSPA			204
+#define CLKID_SYS_DSPB			205
+#define CLKID_SYS_VPU_INTR		206
+#define CLKID_SYS_SAR_ADC		207
+#define CLKID_SYS_GIC			208
+#define CLKID_SYS_TS_GPU		209
+#define CLKID_SYS_TS_NNA		210
+#define CLKID_SYS_TS_VPU		211
+#define CLKID_SYS_TS_HEVC		212
+#define CLKID_SYS_PWM_AB		213
+#define CLKID_SYS_PWM_CD		214
+#define CLKID_SYS_PWM_EF		215
+#define CLKID_SYS_PWM_AO_AB		216
+#define CLKID_SYS_PWM_AO_CD		217
+#define CLKID_SYS_PWM_AO_EF		218
+#define CLKID_SYS_PWM_AO_GH		219
+
+#endif /* __T7_PERIPHERALS_CLKC_H */
-- 
2.47.1

