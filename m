Received: from mail-sh.amlogic.com (unknown [58.32.228.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB5F270EAD;
	Fri,  9 May 2025 08:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=58.32.228.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746777837; cv=none; b=nnbvBRbRK8vrjSreECI7rPiXGtJGZpf/lU+0M01lKA8zAgqQ6+uSDkMNl27JH5DoDSeCrUitsM3u/deGH7HYsVW8RpRRp2aRM34sREpd3rayZJNhDaLcmRiw02bCukNvCiSUym5ZFhnpbXlSn3ckChy2vaHSOqksmc5Q7109TJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746777837; c=relaxed/simple;
	bh=VECZN4z3JFUGvP8/W8zRdzWovQTMnbjvXjZeft4Xsx8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b5TyqpvPTJbfUfN45FdfkVejzqypZhCTXJF/tBlITTRIpkPRS5ZOglevALebnMCTPNFuAgn3L7zh+ad8ifgECXhV7dd9cLgh6Cb0d3akGqQVZcHl0zEIdCeAM0IrYjIMYgb+abM7/Gv4Bb8fmgPLKJlh8k81QNOF85r/kVaE8Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; arc=none smtp.client-ip=58.32.228.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Received: from rd03-sz.software.amlogic (10.28.11.121) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.39; Fri, 9 May 2025
 15:48:42 +0800
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
Subject: [PATCH v3 1/6] dt-bindings: clock: add Amlogic T7 PLL clock controller
Date: Fri, 9 May 2025 07:48:19 +0000
Message-ID: <20250509074825.1933254-2-jian.hu@amlogic.com>
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

Add DT bindings for the PLL clock controller of the Amlogic T7 SoC family.

Signed-off-by: Jian Hu <jian.hu@amlogic.com>
---
 .../bindings/clock/amlogic,t7-pll-clkc.yaml   | 114 ++++++++++++++++++
 .../dt-bindings/clock/amlogic,t7-pll-clkc.h   |  56 +++++++++
 2 files changed, 170 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
 create mode 100644 include/dt-bindings/clock/amlogic,t7-pll-clkc.h

diff --git a/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
new file mode 100644
index 000000000000..aea3763616a0
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
@@ -0,0 +1,114 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2024 Amlogic, Inc. All rights reserved
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/amlogic,t7-pll-clkc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic T7 PLL Clock Control Controller
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+  - Jerome Brunet <jbrunet@baylibre.com>
+  - Jian Hu <jian.hu@amlogic.com>
+  - Xianwei Zhao <xianwei.zhao@amlogic.com>
+
+properties:
+  compatible:
+    enum:
+      - amlogic,t7-pll-gp0
+      - amlogic,t7-pll-gp1
+      - amlogic,t7-pll-hifi
+      - amlogic,t7-pll-pcie
+      - amlogic,t7-mpll
+      - amlogic,t7-pll-hdmi
+      - amlogic,t7-pll-mclk
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  clocks:
+    items:
+      - description: mclk pll input oscillator gate
+      - description: oscillator input clock source for mclk_sel_0
+      - description: fixed input clock source for mclk_sel_0
+    minItems: 1
+
+  clock-names:
+    items:
+      - const: in0
+      - const: in1
+      - const: in2
+    minItems: 1
+
+required:
+  - compatible
+  - '#clock-cells'
+  - reg
+  - clocks
+  - clock-names
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: amlogic,t7-pll-mclk
+
+    then:
+      properties:
+        clocks:
+          minItems: 3
+
+        clock-names:
+          minItems: 3
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - amlogic,t7-pll-gp0
+              - amlogic,t7-pll-gp1
+              - amlogic,t7-pll-hifi
+              - amlogic,t7-pll-pcie
+              - amlogic,t7-mpll
+              - amlogic,t7-pll-hdmi
+
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+
+        clock-names:
+          maxItems: 1
+
+additionalProperties: false
+
+examples:
+  - |
+    apb {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        clock-controller@8080 {
+            compatible = "amlogic,t7-pll-gp0";
+            reg = <0 0x8080 0 0x20>;
+            clocks = <&scmi_clk 2>;
+            clock-names = "in0";
+            #clock-cells = <1>;
+        };
+
+        clock-controller@8300 {
+            compatible = "amlogic,t7-pll-mclk";
+            reg = <0 0x8300 0 0x18>;
+            clocks = <&scmi_clk 2>,
+                     <&xtal>,
+                     <&scmi_clk 31>;
+            clock-names = "in0", "in1", "in2";
+            #clock-cells = <1>;
+        };
+    };
diff --git a/include/dt-bindings/clock/amlogic,t7-pll-clkc.h b/include/dt-bindings/clock/amlogic,t7-pll-clkc.h
new file mode 100644
index 000000000000..b0cb5892ac34
--- /dev/null
+++ b/include/dt-bindings/clock/amlogic,t7-pll-clkc.h
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright (C) 2024 Amlogic, Inc. All rights reserved
+ */
+
+#ifndef __T7_PLL_CLKC_H
+#define __T7_PLL_CLKC_H
+
+/* GP0 */
+#define CLKID_GP0_PLL_DCO	0
+#define CLKID_GP0_PLL		1
+
+/* GP1 */
+#define CLKID_GP1_PLL_DCO	0
+#define CLKID_GP1_PLL		1
+
+/* HIFI */
+#define CLKID_HIFI_PLL_DCO	0
+#define CLKID_HIFI_PLL		1
+
+/* PCIE */
+#define CLKID_PCIE_PLL_DCO	0
+#define CLKID_PCIE_PLL_DCO_DIV2	1
+#define CLKID_PCIE_PLL_OD	2
+#define CLKID_PCIE_PLL		3
+
+/* MPLL */
+#define CLKID_MPLL_PREDIV	0
+#define CLKID_MPLL0_DIV		1
+#define CLKID_MPLL0		2
+#define CLKID_MPLL1_DIV		3
+#define CLKID_MPLL1		4
+#define CLKID_MPLL2_DIV		5
+#define CLKID_MPLL2		6
+#define CLKID_MPLL3_DIV		7
+#define CLKID_MPLL3		8
+
+/* HDMI */
+#define CLKID_HDMI_PLL_DCO	0
+#define CLKID_HDMI_PLL_OD	1
+#define CLKID_HDMI_PLL		2
+
+/* MCLK */
+#define CLKID_MCLK_PLL_DCO	0
+#define CLKID_MCLK_PRE		1
+#define CLKID_MCLK_PLL		2
+#define CLKID_MCLK_0_SEL	3
+#define CLKID_MCLK_0_DIV2	4
+#define CLKID_MCLK_0_PRE	5
+#define CLKID_MCLK_0		6
+#define CLKID_MCLK_1_SEL	7
+#define CLKID_MCLK_1_DIV2	8
+#define CLKID_MCLK_1_PRE	9
+#define CLKID_MCLK_1		10
+
+#endif /* __T7_PLL_CLKC_H */
-- 
2.47.1

