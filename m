Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C61296146;
	Thu, 10 Apr 2025 14:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744296082; cv=none; b=sVxXxQwwdYiGtQGMSlG4pCTTYaxX4I1+jMBfkjkDGrBBqcdTMUSRIzNe9uO8p1e3PaJXavxP9dVRaZN5PeBVSMxtFwACnILQ8eDLOWi38VBXCGdy+aD8KqmAZ2BR7Md85xS3B5u98M3edSYJQXO2YTm4lGV72Ojg0i+yhe6P3x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744296082; c=relaxed/simple;
	bh=AEBwu9KGwtB/tunaAVeyELuIBXdSJHvPydYBqWXIDbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=inoDqLU+hR1IN0NZXVTN3lQHRE3A44O0l1QR++AxmAVhSiBQo3dhcq2ieQIWtuC2eOWPlynK1Gd9jCZZZKLVV7ULbjYvQ2KyZf/7p0nqFpDoRXlQT2OL3SldjwFjfhzBj+YeEtN+FizD8GTMt/8hkh3CfnfGLgIRU8c9raZhpXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Vrm4UJ3R; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Vrm4UJ3R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744296078;
	bh=AEBwu9KGwtB/tunaAVeyELuIBXdSJHvPydYBqWXIDbM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Vrm4UJ3RNuyccXTEPIzNfy5MDb1ws1JpFjWLkY48176j9mpKNAnZbiq2Q8DvDuwmE
	 HbybC5BHbyVUoFEc0/TSRPEQH3Ga3FmafT6Hx7I6uc1WzCf/FNG8pY7Y75T4/x6bYO
	 5vCV4iyDnaPvvs37CkWt+ciKX/hbSwX//Zn4unE3XTLg95UHzZ/Ja4P4Pn3U+xgBiY
	 Imurw1gaoCDCgN6N5NDrzqbIe4xX3sDZeOC7yfwRjIG5LwprSavjn2qu0KKXdPoXvu
	 doFkrsNDmBhEnRJLLrlmYHl5noVxdmiKkEv5PX3h2F5d32sDpswImkDqsGxmQf7nE2
	 K0ahU3kFchH/Q==
Received: from IcarusMOD.eternityproject.eu (fi-19-199-243.service.infuturo.it [151.19.199.243])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 76AD217E1072;
	Thu, 10 Apr 2025 16:41:15 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: mturquette@baylibre.com
Cc: sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	y.oudjana@protonmail.com,
	lukas.bulwahn@redhat.com,
	u.kleine-koenig@baylibre.com,
	geert+renesas@glider.be,
	amergnat@baylibre.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 1/3] dt-bindings: clock: mediatek: Describe MT6893 Clock Controllers
Date: Thu, 10 Apr 2025 16:41:08 +0200
Message-ID: <20250410144110.476197-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410144110.476197-1-angelogioacchino.delregno@collabora.com>
References: <20250410144110.476197-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add bindings to describe both the System Clock Controllers,
providing PLLs and main clocks, and the functional clock
controllers, providing peripheral clocks (i2c, multimedia, etc),
as found in the MediaTek Dimensity 1200 (MT6893) SoC.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/clock/mediatek,mt6893-clock.yaml |  56 +++
 .../clock/mediatek,mt6893-sys-clock.yaml      |  68 +++
 .../dt-bindings/clock/mediatek,mt6893-clk.h   | 449 ++++++++++++++++++
 3 files changed, 573 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt6893-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt6893-sys-clock.yaml
 create mode 100644 include/dt-bindings/clock/mediatek,mt6893-clk.h

diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt6893-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt6893-clock.yaml
new file mode 100644
index 000000000000..72fbde7263a1
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt6893-clock.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/mediatek,mt6893-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Functional Clock Controller for MT6893
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+description: |
+  The clock architecture in MediaTek SoCs is structured like below:
+  PLLs -->
+          dividers -->
+                      muxes
+                           -->
+                              clock gate
+
+  The devices provide clock gate control in different IP blocks.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt6893-scp-adsp
+      - mediatek,mt6893-imp-iic-wrap-c
+      - mediatek,mt6893-imp-iic-wrap-e
+      - mediatek,mt6893-imp-iic-wrap-n
+      - mediatek,mt6893-imp-iic-wrap-s
+      - mediatek,mt6893-mdpsys
+      - mediatek,mt6893-mfgcfg
+      - mediatek,mt6893-vdecsys
+      - mediatek,mt6893-vdecsys-soc
+      - mediatek,mt6893-vencsys-c0
+      - mediatek,mt6893-vencsys-c1
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@11008000 {
+        compatible = "mediatek,mt6893-imp-iic-wrap-c";
+        reg = <0x11008000 0x1000>;
+        #clock-cells = <1>;
+    };
diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt6893-sys-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt6893-sys-clock.yaml
new file mode 100644
index 000000000000..a7d258f5b6e2
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt6893-sys-clock.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/mediatek,mt6893-sys-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek System Clock Controller for MT6893
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+description: |
+  The clock architecture in MediaTek SoCs is structured like below:
+  PLLs -->
+          dividers -->
+                      muxes
+                           -->
+                              clock gate
+
+  The apmixedsys provides most of PLLs which are generated from SoC 26m.
+  The topckgen provides dividers and muxes which provide the clock source to other IP blocks.
+  The infracfg_ao provides clock gate in peripheral and infrastructure IP blocks.
+  The device nodes also provide the system control capacity for configuration.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - mediatek,mt6893-apmixedsys
+          - mediatek,mt6893-infracfg-ao
+          - mediatek,mt6893-topckgen
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@10000000 {
+        compatible = "mediatek,mt6893-topckgen", "syscon";
+        reg = <0x10000000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+    clock-controller@10001000 {
+        compatible = "mediatek,mt6893-infracfg-ao", "syscon";
+        reg = <0x10001000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+    clock-controller@1000c000 {
+        compatible = "mediatek,mt6893-apmixedsys", "syscon";
+        reg = <0x1000c000 0x1000>;
+        #clock-cells = <1>;
+    };
diff --git a/include/dt-bindings/clock/mediatek,mt6893-clk.h b/include/dt-bindings/clock/mediatek,mt6893-clk.h
new file mode 100644
index 000000000000..e56da571615d
--- /dev/null
+++ b/include/dt-bindings/clock/mediatek,mt6893-clk.h
@@ -0,0 +1,449 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ * Copyright (c) 2025 Collabora Ltd
+ */
+
+#ifndef _DT_BINDINGS_CLK_MT6893_H
+#define _DT_BINDINGS_CLK_MT6893_H
+
+/* TOPCKGEN */
+#define CLK_TOP_ULPOSC			0
+#define CLK_TOP_MAINPLL_D3		1
+#define CLK_TOP_MAINPLL_D4		2
+#define CLK_TOP_MAINPLL_D4_D2		3
+#define CLK_TOP_MAINPLL_D4_D4		4
+#define CLK_TOP_MAINPLL_D4_D8		5
+#define CLK_TOP_MAINPLL_D4_D16		6
+#define CLK_TOP_MAINPLL_D5		7
+#define CLK_TOP_MAINPLL_D5_D2		8
+#define CLK_TOP_MAINPLL_D5_D4		9
+#define CLK_TOP_MAINPLL_D5_D8		10
+#define CLK_TOP_MAINPLL_D6		11
+#define CLK_TOP_MAINPLL_D6_D2		12
+#define CLK_TOP_MAINPLL_D6_D4		13
+#define CLK_TOP_MAINPLL_D6_D8		14
+#define CLK_TOP_MAINPLL_D7		15
+#define CLK_TOP_MAINPLL_D7_D2		16
+#define CLK_TOP_MAINPLL_D7_D4		17
+#define CLK_TOP_MAINPLL_D7_D8		18
+#define CLK_TOP_MAINPLL_D9		19
+#define CLK_TOP_UNIVPLL_D2		20
+#define CLK_TOP_UNIVPLL_D3		21
+#define CLK_TOP_UNIVPLL_D4		22
+#define CLK_TOP_UNIVPLL_D4_D2		23
+#define CLK_TOP_UNIVPLL_D4_D4		24
+#define CLK_TOP_UNIVPLL_D4_D8		25
+#define CLK_TOP_UNIVPLL_D5		26
+#define CLK_TOP_UNIVPLL_D5_D2		27
+#define CLK_TOP_UNIVPLL_D5_D4		28
+#define CLK_TOP_UNIVPLL_D5_D8		29
+#define CLK_TOP_UNIVPLL_D5_D16		30
+#define CLK_TOP_UNIVPLL_D6		31
+#define CLK_TOP_UNIVPLL_D6_D2		32
+#define CLK_TOP_UNIVPLL_D6_D4		33
+#define CLK_TOP_UNIVPLL_D6_D8		34
+#define CLK_TOP_UNIVPLL_D6_D16		35
+#define CLK_TOP_UNIVPLL_D7		36
+#define CLK_TOP_UNIVPLL_D7_D2		37
+#define CLK_TOP_UNIVPLL_192M_D2		38
+#define CLK_TOP_UNIVPLL_192M_D4		39
+#define CLK_TOP_UNIVPLL_192M_D8		40
+#define CLK_TOP_UNIVPLL_192M_D16	41
+#define CLK_TOP_UNIVPLL_192M_D32	42
+#define CLK_TOP_USB20_192M		43
+#define CLK_TOP_USB20_PLL_D2		44
+#define CLK_TOP_USB20_PLL_D4		45
+#define CLK_TOP_MPLL_D2			46
+#define CLK_TOP_MPLL_D4			47
+#define CLK_TOP_APLL1_D2		48
+#define CLK_TOP_APLL1_D4		49
+#define CLK_TOP_APLL1_D8		50
+#define CLK_TOP_APLL2_D2		51
+#define CLK_TOP_APLL2_D4		52
+#define CLK_TOP_APLL2_D8		53
+#define CLK_TOP_ADSPPLL_D4		54
+#define CLK_TOP_ADSPPLL_D5		55
+#define CLK_TOP_ADSPPLL_D6		56
+#define CLK_TOP_MMPLL_D3		57
+#define CLK_TOP_MMPLL_D4		58
+#define CLK_TOP_MMPLL_D4_D2		59
+#define CLK_TOP_MMPLL_D4_D4		60
+#define CLK_TOP_MMPLL_D5		61
+#define CLK_TOP_MMPLL_D5_D2		62
+#define CLK_TOP_MMPLL_D5_D4		63
+#define CLK_TOP_MMPLL_D6		64
+#define CLK_TOP_MMPLL_D6_D2		65
+#define CLK_TOP_MMPLL_D7		66
+#define CLK_TOP_MMPLL_D9		67
+#define CLK_TOP_APUPLL_D2		68
+#define CLK_TOP_TVDPLL_D2		69
+#define CLK_TOP_TVDPLL_D4		70
+#define CLK_TOP_TVDPLL_D8		71
+#define CLK_TOP_TVDPLL_D16		72
+#define CLK_TOP_MSDCPLL_D2		73
+#define CLK_TOP_MSDCPLL_D4		74
+#define CLK_TOP_MSDCPLL_D8		75
+#define CLK_TOP_MSDCPLL_D16		76
+#define CLK_TOP_OSC_D2			77
+#define CLK_TOP_OSC_D4			78
+#define CLK_TOP_OSC_D8			79
+#define CLK_TOP_OSC_D16			80
+#define CLK_TOP_OSC_D10			81
+#define CLK_TOP_OSC_D20			82
+#define CLK_TOP_TVDPLL_MAINPLL_D2	83
+#define CLK_TOP_AXI_SEL			84
+#define CLK_TOP_SPM_SEL			85
+#define CLK_TOP_SCP_SEL			86
+#define CLK_TOP_BUS_AXIMEM_SEL		87
+#define CLK_TOP_DISP_SEL		88
+#define CLK_TOP_MDP_SEL			89
+#define CLK_TOP_IMG1_SEL		90
+#define CLK_TOP_IMG2_SEL		91
+#define CLK_TOP_IPE_SEL			92
+#define CLK_TOP_DPE_SEL			93
+#define CLK_TOP_CAM_SEL			94
+#define CLK_TOP_CCU_SEL			95
+#define CLK_TOP_DSP_SEL			96
+#define CLK_TOP_DSP1_SEL		97
+#define CLK_TOP_DSP2_SEL		98
+#define CLK_TOP_DSP3_SEL		99
+#define CLK_TOP_DSP4_SEL		100
+#define CLK_TOP_DSP5_SEL		101
+#define CLK_TOP_DSP6_SEL		102
+#define CLK_TOP_DSP7_SEL		103
+#define CLK_TOP_IPU_IF_SEL		104
+#define CLK_TOP_MFG_SEL			105
+#define CLK_TOP_CAMTG_SEL		106
+#define CLK_TOP_CAMTG2_SEL		107
+#define CLK_TOP_CAMTG3_SEL		108
+#define CLK_TOP_CAMTG4_SEL		109
+#define CLK_TOP_UART_SEL		110
+#define CLK_TOP_SPI_SEL			111
+#define CLK_TOP_MSDC50_0_HCLK_SEL	112
+#define CLK_TOP_MSDC50_0_SEL		113
+#define CLK_TOP_MSDC30_1_SEL		114
+#define CLK_TOP_AUDIO_SEL		115
+#define CLK_TOP_AUD_INTBUS_SEL		116
+#define CLK_TOP_PWRAP_ULPOSC_SEL	117
+#define CLK_TOP_ATB_SEL			118
+#define CLK_TOP_SSPM_SEL		119
+#define CLK_TOP_DP_SEL			120
+#define CLK_TOP_SCAM_SEL		121
+#define CLK_TOP_DISP_PWM_SEL		122
+#define CLK_TOP_USB_TOP_SEL		123
+#define CLK_TOP_SSUSB_XHCI_SEL		124
+#define CLK_TOP_I2C_SEL			125
+#define CLK_TOP_SENINF_SEL		126
+#define CLK_TOP_SENINF1_SEL		127
+#define CLK_TOP_SENINF2_SEL		128
+#define CLK_TOP_SENINF3_SEL		129
+#define CLK_TOP_DXCC_SEL		130
+#define CLK_TOP_AUD_ENGEN1_SEL		131
+#define CLK_TOP_AUD_ENGEN2_SEL		132
+#define CLK_TOP_AES_UFSFDE_SEL		133
+#define CLK_TOP_UFS_SEL			134
+#define CLK_TOP_AUD_1_SEL		135
+#define CLK_TOP_AUD_2_SEL		136
+#define CLK_TOP_ADSP_SEL		137
+#define CLK_TOP_DPMAIF_MAIN_SEL		138
+#define CLK_TOP_VENC_SEL		139
+#define CLK_TOP_VDEC_SEL		140
+#define CLK_TOP_VDEC_LAT_SEL		141
+#define CLK_TOP_CAMTM_SEL		142
+#define CLK_TOP_PWM_SEL			143
+#define CLK_TOP_AUDIO_H_SEL		144
+#define CLK_TOP_CAMTG5_SEL		145
+#define CLK_TOP_CAMTG6_SEL		146
+#define CLK_TOP_MCUPM_SEL		147
+#define CLK_TOP_SPMI_MST_SEL		148
+#define CLK_TOP_DVFSRC_SEL		149
+#define CLK_TOP_APLL_I2S0_MCK_SEL	150
+#define CLK_TOP_APLL_I2S1_MCK_SEL	151
+#define CLK_TOP_APLL_I2S2_MCK_SEL	152
+#define CLK_TOP_APLL_I2S3_MCK_SEL	153
+#define CLK_TOP_APLL_I2S4_MCK_SEL	154
+#define CLK_TOP_APLL_I2S5_MCK_SEL	155
+#define CLK_TOP_APLL_I2S6_MCK_SEL	156
+#define CLK_TOP_APLL_I2S7_MCK_SEL	157
+#define CLK_TOP_APLL_I2S8_MCK_SEL	158
+#define CLK_TOP_APLL_I2S9_MCK_SEL	159
+#define CLK_TOP_APLL1_CK_DIV0		160
+#define CLK_TOP_APLL2_CK_DIV0		161
+#define CLK_TOP_APLL12_CK_DIV0		162
+#define CLK_TOP_APLL12_CK_DIV1		163
+#define CLK_TOP_APLL12_CK_DIV2		164
+#define CLK_TOP_APLL12_CK_DIV3		165
+#define CLK_TOP_APLL12_CK_DIV4		166
+#define CLK_TOP_APLL12_CK_DIVB		167
+#define CLK_TOP_APLL12_CK_DIV5_LSB	168
+#define CLK_TOP_APLL12_CK_DIV5_MSB	169
+#define CLK_TOP_APLL12_CK_DIV6		170
+#define CLK_TOP_APLL12_CK_DIV7		171
+#define CLK_TOP_APLL12_CK_DIV8		172
+#define CLK_TOP_APLL12_CK_DIV9		173
+
+/* INFRACFG_AO */
+#define CLK_INFRA_AO_PMIC_TMR		0
+#define CLK_INFRA_AO_PMIC_AP		1
+#define CLK_INFRA_AO_GCE		2
+#define CLK_INFRA_AO_GCE2		3
+#define CLK_INFRA_AO_THERM		4
+#define CLK_INFRA_AO_I2C0		5
+#define CLK_INFRA_AO_I2C1		6
+#define CLK_INFRA_AO_I2C2		7
+#define CLK_INFRA_AO_I2C3		8
+#define CLK_INFRA_AO_PWM_HCLK		9
+#define CLK_INFRA_AO_PWM1		10
+#define CLK_INFRA_AO_PWM2		11
+#define CLK_INFRA_AO_PWM3		12
+#define CLK_INFRA_AO_PWM4		13
+#define CLK_INFRA_AO_PWM		14
+#define CLK_INFRA_AO_UART0		15
+#define CLK_INFRA_AO_UART1		16
+#define CLK_INFRA_AO_UART2		17
+#define CLK_INFRA_AO_UART3		18
+#define CLK_INFRA_AO_GCE_26M		19
+#define CLK_INFRA_AO_CQ_DMA_FPC		20
+#define CLK_INFRA_AO_BTIF		21
+#define CLK_INFRA_AO_SPI0		22
+#define CLK_INFRA_AO_MSDC0		23
+#define CLK_INFRA_AO_MSDC1		24
+#define CLK_INFRA_AO_MSDC0_SRC		25
+#define CLK_INFRA_AO_AUXADC		26
+#define CLK_INFRA_AO_CPUM		27
+#define CLK_INFRA_AO_CCIF1_AP		28
+#define CLK_INFRA_AO_CCIF1_MD		29
+#define CLK_INFRA_AO_MSDC1_SRC		30
+#define CLK_INFRA_AO_AP_DMA_PS		31
+#define CLK_INFRA_AO_DEVICE_APC		32
+#define CLK_INFRA_AO_CCIF_AP		33
+#define CLK_INFRA_AO_AUDIO		34
+#define CLK_INFRA_AO_CCIF_MD		35
+#define CLK_INFRA_AO_DXCC_SEC_CORE	36
+#define CLK_INFRA_AO_SSUSB		37
+#define CLK_INFRA_AO_DISP_PWM		38
+#define CLK_INFRA_AO_DPMAIF		39
+#define CLK_INFRA_AO_AUDIO_26M_BCLK	40
+#define CLK_INFRA_AO_SPI1		41
+#define CLK_INFRA_AO_I2C4		42
+#define CLK_INFRA_AO_SPI2		43
+#define CLK_INFRA_AO_SPI3		44
+#define CLK_INFRA_AO_UNIPRO_SYSCLK	45
+#define CLK_INFRA_AO_UFS_MP_SAP_BCLK	46
+#define CLK_INFRA_AO_I2C5		47
+#define CLK_INFRA_AO_I2C5_ARBITER	48
+#define CLK_INFRA_AO_I2C5_IMM		49
+#define CLK_INFRA_AO_I2C1_ARBITER	50
+#define CLK_INFRA_AO_I2C1_IMM		51
+#define CLK_INFRA_AO_I2C2_ARBITER	52
+#define CLK_INFRA_AO_I2C2_IMM		53
+#define CLK_INFRA_AO_SPI4		54
+#define CLK_INFRA_AO_SPI5		55
+#define CLK_INFRA_AO_CQ_DMA		56
+#define CLK_INFRA_AO_UFS		57
+#define CLK_INFRA_AO_AES		58
+#define CLK_INFRA_AO_SSUSB_XHCI		59
+#define CLK_INFRA_AO_MSDC0_SELF		60
+#define CLK_INFRA_AO_MSDC1_SELF		61
+#define CLK_INFRA_AO_MSDC2_SELF		62
+#define CLK_INFRA_AO_I2C6		63
+#define CLK_INFRA_AO_AP_MSDC0		64
+#define CLK_INFRA_AO_MD_MSDC0		65
+#define CLK_INFRA_AO_I2C7		66
+#define CLK_INFRA_AO_I2C8		67
+#define CLK_INFRA_AO_FBIST2FPC		68
+#define CLK_INFRA_AO_DEVICE_DAPC_SYNC	69
+#define CLK_INFRA_AO_DPMAIF_MAIN	70
+#define CLK_INFRA_AO_SPI6_CK		71
+#define CLK_INFRA_AO_SPI7_CK		72
+#define CLK_INFRA_AO_APDMA		73
+
+/* APMIXEDSYS */
+#define CLK_APMIXED_ARMPLL_LL		0
+#define CLK_APMIXED_ARMPLL_BL0		1
+#define CLK_APMIXED_ARMPLL_BL1		2
+#define CLK_APMIXED_ARMPLL_BL2		3
+#define CLK_APMIXED_ARMPLL_BL3		4
+#define CLK_APMIXED_CCIPLL		5
+#define CLK_APMIXED_MAINPLL		6
+#define CLK_APMIXED_UNIVPLL		7
+#define CLK_APMIXED_MSDCPLL		8
+#define CLK_APMIXED_MMPLL		9
+#define CLK_APMIXED_ADSPPLL		10
+#define CLK_APMIXED_MFGPLL		11
+#define CLK_APMIXED_TVDPLL		12
+#define CLK_APMIXED_APLL1		13
+#define CLK_APMIXED_APLL2		14
+#define CLK_APMIXED_MPLL		15
+#define CLK_APMIXED_APUPLL		16
+
+/* SCP_ADSP */
+#define CLK_SCP_ADSP_AUDIODSP	0
+
+/* IMP_IIC_WRAP_C */
+#define CLK_IMP_IIC_WRAP_C_AP_I2C0		0
+#define CLK_IMP_IIC_WRAP_C_AP_I2C10		1
+#define CLK_IMP_IIC_WRAP_C_AP_I2C11		2
+#define CLK_IMP_IIC_WRAP_C_AP_I2C12		3
+#define CLK_IMP_IIC_WRAP_C_AP_I2C13		4
+
+/* IMP_IIC_WRAP_E */
+#define CLK_IMP_IIC_WRAP_E_AP_I2C3		0
+#define CLK_IMP_IIC_WRAP_E_AP_I2C9		1
+
+/* IMP_IIC_WRAP_S */
+#define CLK_IMP_IIC_WRAP_S_AP_I2C1		0
+#define CLK_IMP_IIC_WRAP_S_AP_I2C2		1
+#define CLK_IMP_IIC_WRAP_S_AP_I2C4		2
+#define CLK_IMP_IIC_WRAP_S_AP_I2C7		3
+#define CLK_IMP_IIC_WRAP_S_AP_I2C8		4
+
+/* IMP_IIC_WRAP_N */
+#define CLK_IMP_IIC_WRAP_N_AP_I2C5		0
+#define CLK_IMP_IIC_WRAP_N_AP_I2C6		1
+
+/* MFGCFG */
+#define CLK_MFGCFG_BG3D			0
+
+/* MMSYS_CONFIG */
+#define CLK_MM_DISP_RSZ0		0
+#define CLK_MM_DISP_RSZ1		1
+#define CLK_MM_DISP_OVL0		2
+#define CLK_MM_INLINE			3
+#define CLK_MM_MDP_TDSHP4		4
+#define CLK_MM_MDP_TDSHP5		5
+#define CLK_MM_MDP_AAL4			6
+#define CLK_MM_MDP_AAL5			7
+#define CLK_MM_MDP_HDR4			8
+#define CLK_MM_MDP_HDR5			9
+#define CLK_MM_MDP_RSZ4			10
+#define CLK_MM_MDP_RSZ5			11
+#define CLK_MM_MDP_RDMA4		12
+#define CLK_MM_MDP_RDMA5		13
+#define CLK_MM_DISP_FAKE_ENG0		14
+#define CLK_MM_DISP_FAKE_ENG1		15
+#define CLK_MM_DISP_OVL0_2L		16
+#define CLK_MM_DISP_OVL1_2L		17
+#define CLK_MM_DISP_OVL2_2L		18
+#define CLK_MM_DISP_MUTEX		19
+#define CLK_MM_DISP_OVL1		20
+#define CLK_MM_DISP_OVL3_2L		21
+#define CLK_MM_DISP_CCORR0		22
+#define CLK_MM_DISP_CCORR1		23
+#define CLK_MM_DISP_COLOR0		24
+#define CLK_MM_DISP_COLOR1		25
+#define CLK_MM_DISP_POSTMASK0		26
+#define CLK_MM_DISP_POSTMASK1		27
+#define CLK_MM_DISP_DITHER0		28
+#define CLK_MM_DISP_DITHER1		29
+#define CLK_MM_DSI0_MM_CLK		30
+#define CLK_MM_DSI1_MM_CLK		31
+#define CLK_MM_DISP_GAMMA0		32
+#define CLK_MM_DISP_GAMMA1		33
+#define CLK_MM_DISP_AAL0		34
+#define CLK_MM_DISP_AAL1		35
+#define CLK_MM_DISP_WDMA0		36
+#define CLK_MM_DISP_WDMA1		37
+#define CLK_MM_DISP_UFBC_WDMA0		38
+#define CLK_MM_DISP_UFBC_WDMA1		39
+#define CLK_MM_DISP_RDMA0		40
+#define CLK_MM_DISP_RDMA1		41
+#define CLK_MM_DISP_RDMA4		42
+#define CLK_MM_DISP_RDMA5		43
+#define CLK_MM_DISP_DSC_WRAP		44
+#define CLK_MM_DP_INTF_MM_CLK		45
+#define CLK_MM_DISP_MERGE0		46
+#define CLK_MM_DISP_MERGE1		47
+#define CLK_MM_SMI_COMMON		48
+#define CLK_MM_SMI_GALS			49
+#define CLK_MM_SMI_INFRA		50
+#define CLK_MM_SMI_IOMMU		51
+#define CLK_MM_DSI0_INTF_CLK		52
+#define CLK_MM_DSI1_INTF_CLK		53
+#define CLK_MM_DP_INTF_INTF_CLK		54
+#define CLK_MM_CK_26_MHZ		55
+#define CLK_MM_CK_32_KHZ		56
+
+/* VDEC_SOC_GCON */
+#define CLK_VDEC_SOC_LARB1		0
+#define CLK_VDEC_SOC_LAT		1
+#define CLK_VDEC_SOC_LAT_ACTIVE		2
+#define CLK_VDEC_SOC_LAT_ENG		3
+#define CLK_VDEC_SOC_VDEC		4
+#define CLK_VDEC_SOC_VDEC_ACTIVE	5
+#define CLK_VDEC_SOC_VDEC_ENG		6
+
+/* VDEC_GCON */
+#define CLK_VDEC_LARB1			0
+#define CLK_VDEC_LAT			1
+#define CLK_VDEC_LAT_ACTIVE		2
+#define CLK_VDEC_LAT_ENG		3
+#define CLK_VDEC_VDEC			4
+#define CLK_VDEC_ACTIVE			5
+#define CLK_VDEC_VDEC_ENG		6
+
+/* VENC_GCON */
+#define CLK_VENC0_SET0_LARB		0
+#define CLK_VENC0_SET1_VENC		1
+#define CLK_VENC0_SET2_JPGENC		2
+#define CLK_VENC0_SET3_JPGDEC		3
+#define CLK_VENC0_SET4_JPGDEC_C1	4
+#define CLK_VENC0_SET5_GALS		5
+
+/* VENC_C1_GCON */
+#define CLK_VENC1_SET0_LARB		0
+#define CLK_VENC1_SET1_VENC		1
+#define CLK_VENC1_SET2_JPGENC		2
+#define CLK_VENC1_SET3_JPGDEC		3
+#define CLK_VENC1_SET4_JPGDEC_C1	4
+#define CLK_VENC1_SET5_GALS		5
+
+/* MDPSYS_CONFIG */
+#define CLK_MDP_RDMA0			0
+#define CLK_MDP_FG0			1
+#define CLK_MDP_HDR0			2
+#define CLK_MDP_AAL0			3
+#define CLK_MDP_RSZ0			4
+#define CLK_MDP_TDSHP0			5
+#define CLK_MDP_TCC0			6
+#define CLK_MDP_WROT0			7
+#define CLK_MDP_RDMA2			8
+#define CLK_MDP_AAL2			9
+#define CLK_MDP_RSZ2			10
+#define CLK_MDP_COLOR0			11
+#define CLK_MDP_TDSHP2			12
+#define CLK_MDP_TCC2			13
+#define CLK_MDP_WROT2			14
+#define CLK_MDP_MUTEX0			15
+#define CLK_MDP_RDMA1			16
+#define CLK_MDP_FG1			17
+#define CLK_MDP_HDR1			18
+#define CLK_MDP_AAL1			19
+#define CLK_MDP_RSZ1			20
+#define CLK_MDP_TDSHP1			21
+#define CLK_MDP_TCC1			22
+#define CLK_MDP_WROT1			23
+#define CLK_MDP_RDMA3			24
+#define CLK_MDP_AAL3			25
+#define CLK_MDP_RSZ3			26
+#define CLK_MDP_COLOR1			27
+#define CLK_MDP_TDSHP3			28
+#define CLK_MDP_TCC3			29
+#define CLK_MDP_WROT3			30
+#define CLK_MDP_APB_BUS			31
+#define CLK_MDP_MMSYSRAM		32
+#define CLK_MDP_APMCU_GALS		33
+#define CLK_MDP_SMI0			36
+#define CLK_MDP_IMG_DL_ASYNC0		37
+#define CLK_MDP_IMG_DL_ASYNC1		38
+#define CLK_MDP_IMG_DL_ASYNC2		39
+#define CLK_MDP_SMI1			40
+#define CLK_MDP_IMG_DL_ASYNC3		41
+#define CLK_MDP_SMI2			44
+#define CLK_MDP_IMG0_IMG_DL_ASYNC0	48
+#define CLK_MDP_IMG0_IMG_DL_ASYNC1	49
+#define CLK_MDP_IMG1_IMG_DL_ASYNC2	50
+#define CLK_MDP_IMG1_IMG_DL_ASYNC3	51
+
+#endif /* _DT_BINDINGS_CLK_MT6893_H */
-- 
2.49.0

