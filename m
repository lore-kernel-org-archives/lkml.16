Received: from zg8tmja2lje4os43os4xodqa.icoremail.net (zg8tmja2lje4os43os4xodqa.icoremail.net [206.189.79.184])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45C3E28B7E1;
	Wed,  4 Jun 2025 08:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=206.189.79.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749027181; cv=none; b=i7sGsRFlpV925r5KqqtpWpyW8r6qJr9YMLuMFCo/YFmZWdgO2XlylVDfmfNQdsE8MVUZZgRzrrxZy/njP/2qILfo3tGIFVhjsyd7XYsvsoD5uHntB5s6AeKMycwcZP/295WhPT8qNc+f022Q8EbmyUXGYOVtLA86+m8SmpagNMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749027181; c=relaxed/simple;
	bh=qFpva0TmfGMoqQwfYpHpQh703G/IXdwn7pLxD30Dac4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=H2zb35M+zT0slvaKoBqxNP4vQf5l85p/MGueyZR3oV3Wu3VJimAikWLMfr0dBahSktvQCqQgkZueaKmgiYpUAtmg7RN5g+n744Oxnq+HueKYuelxp2QYkIniFVcPBPjCMfdEO1jxzhXdPbgji+Lpeqm1ecE9plnx44BwAqazHrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=206.189.79.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from E0005152DT.eswin.cn (unknown [10.12.96.41])
	by app2 (Coremail) with SMTP id TQJkCgD3lpVVCUBo0WKaAA--.53474S2;
	Wed, 04 Jun 2025 16:52:39 +0800 (CST)
From: dongxuyang@eswincomputing.com
To: p.zabel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: ningyu@eswincomputing.com,
	linmin@eswincomputing.com,
	huangyifeng@eswincomputing.com,
	Xuyang Dong <dongxuyang@eswincomputing.com>
Subject: [PATCH v2 1/2] dt-bindings: reset: eswin: Documentation for eic7700 SoC
Date: Wed,  4 Jun 2025 16:52:35 +0800
Message-Id: <20250604085235.2153-1-dongxuyang@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
In-Reply-To: <20250604085124.2098-1-dongxuyang@eswincomputing.com>
References: <20250604085124.2098-1-dongxuyang@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:TQJkCgD3lpVVCUBo0WKaAA--.53474S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAF1UKry8Zw1kuFykuryDJrb_yoWrAw47pF
	4kCFyDtr1DKFWIgw4FvF1SkF13Jwn3Wr1DXr4UZF47JF1Utw1vya4YgFs5JF98ZFs3GrW3
	WFykXw18Zr9rAw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lw4CEc2x0rVAKj4xxMxkF7I0En4kS14v26r1q6r43MxkIecxEwVCm-wCF04
	k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
	MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr4
	1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l
	IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUXJ5wUUUUU=
X-CM-SenderInfo: pgrqw5xx1d0w46hv4xpqfrz1xxwl0woofrz/

From: Xuyang Dong <dongxuyang@eswincomputing.com>

Add device tree binding documentation and header file for the ESWIN
eic7700 reset controller module.

Signed-off-by: Yifeng Huang <huangyifeng@eswincomputing.com>
Signed-off-by: Xuyang Dong <dongxuyang@eswincomputing.com>
---
 .../bindings/reset/eswin,eic7700-reset.yaml   | 41 +++++++++++
 .../dt-bindings/reset/eswin,eic7700-reset.h   | 73 +++++++++++++++++++
 2 files changed, 114 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/eswin,eic7700-reset.yaml
 create mode 100644 include/dt-bindings/reset/eswin,eic7700-reset.h

diff --git a/Documentation/devicetree/bindings/reset/eswin,eic7700-reset.yaml b/Documentation/devicetree/bindings/reset/eswin,eic7700-reset.yaml
new file mode 100644
index 000000000000..85ad5fec9430
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/eswin,eic7700-reset.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/eswin,eic7700-reset.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ESWIN EIC7700 SoC reset controller
+
+maintainers:
+  - Yifeng Huang <huangyifeng@eswincomputing.com>
+  - Xuyang Dong <dongxuyang@eswincomputing.com>
+
+properties:
+  compatible:
+    items:
+      - const: eswin,eic7700-reset
+      - const: syscon
+      - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  '#reset-cells':
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - '#reset-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/reset/eswin,eic7700-reset.h>
+
+    reset-controller@51828000 {
+        compatible = "eswin,eic7700-reset", "syscon", "simple-mfd";
+        reg = <0x51828000 0x80000>;
+        #reset-cells = <2>;
+    };
diff --git a/include/dt-bindings/reset/eswin,eic7700-reset.h b/include/dt-bindings/reset/eswin,eic7700-reset.h
new file mode 100644
index 000000000000..7ba31db86141
--- /dev/null
+++ b/include/dt-bindings/reset/eswin,eic7700-reset.h
@@ -0,0 +1,73 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright 2024, Beijing ESWIN Computing Technology Co., Ltd.. All rights reserved.
+ *
+ * Device Tree binding constants for EIC7700 reset controller.
+ *
+ * Authors:
+ *	Yifeng Huang <huangyifeng@eswincomputing.com>
+ *	Xuyang Dong <dongxuyang@eswincomputing.com>
+ */
+
+#ifndef __DT_ESWIN_EIC7700_RESET_H__
+#define __DT_ESWIN_EIC7700_RESET_H__
+
+#define SNOC_RST_CTRL 0
+#define GPU_RST_CTRL 1
+#define DSP_RST_CTRL 2
+#define D2D_RST_CTRL 3
+#define DDR_RST_CTRL 4
+#define TCU_RST_CTRL 5
+#define NPU_RST_CTRL 6
+#define HSPDMA_RST_CTRL 7
+#define PCIE_RST_CTRL 8
+#define I2C_RST_CTRL 9
+#define FAN_RST_CTRL 10
+#define PVT_RST_CTRL 11
+#define MBOX_RST_CTRL 12
+#define UART_RST_CTRL 13
+#define GPIO_RST_CTRL 14
+#define TIMER_RST_CTRL 15
+#define SSI_RST_CTRL 16
+#define WDT_RST_CTRL 17
+#define LSP_CFGRST_CTRL 18
+#define U84_RST_CTRL 19
+#define SCPU_RST_CTRL 20
+#define LPCPU_RST_CTRL 21
+#define VC_RST_CTRL 22
+#define JD_RST_CTRL 23
+#define JE_RST_CTRL 24
+#define VD_RST_CTRL 25
+#define VE_RST_CTRL 26
+#define G2D_RST_CTRL 27
+#define VI_RST_CTRL 28
+#define DVP_RST_CTRL 29
+#define ISP0_RST_CTRL 30
+#define ISP1_RST_CTRL 31
+#define SHUTTER_RST_CTRL 32
+#define VO_PHYRST_CTRL 33
+#define VO_I2SRST_CTRL 34
+#define VO_RST_CTRL 35
+#define BOOTSPI_RST_CTRL 36
+#define I2C1_RST_CTRL 37
+#define I2C0_RST_CTRL 38
+#define DMA1_RST_CTRL 39
+#define FPRT_RST_CTRL 40
+#define HBLOCK_RST_CTRL 41
+#define SECSR_RST_CTRL 42
+#define OTP_RST_CTRL 43
+#define PKA_RST_CTRL 44
+#define SPACC_RST_CTRL 45
+#define TRNG_RST_CTRL 46
+#define RESERVED 47
+#define TIMER0_RST_CTRL 48
+#define TIMER1_RST_CTRL 49
+#define TIMER2_RST_CTRL 50
+#define TIMER3_RST_CTRL 51
+#define RTC_RST_CTRL 52
+#define MNOC_RST_CTRL 53
+#define RNOC_RST_CTRL 54
+#define CNOC_RST_CTRL 55
+#define LNOC_RST_CTRL 56
+
+#endif /*endif __DT_ESWIN_EIC7700_RESET_H__*/
--
2.17.1

