Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7EE22A4FC;
	Fri, 23 May 2025 10:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747997175; cv=none; b=JJAM2l907XvR9enoY9aorLA/XxNpADJHe8vvh5ck8QWiZBPvcA1kMbDiVo3+PZ1uwr1xcwQ/YSrjitloI3RjtHk0ltieVoAP1HmoVtT2JAgDPEEhrxsEm+n/hgt+w+IHLAbyhJyMcqMcE5XzoJK7C2VgkVzDWb7+ZAE7r/qZyPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747997175; c=relaxed/simple;
	bh=R2qt1PgPlfZdW0uCkZD3WsYf2ueDKi37uGThCDgyG14=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pPmRm+5dSz+SVkfYTpSBJ/+tvRI0AGSN7mda/9w3CNNC8+YAOREHL2tC5b5bAAznoLBLlkU7F5p7j4Tnid8KCbKsOa1Kqwj+/Vj6biaiqH/xo6Ux9syXIUazFIFxnYRuqJU9F0S5DEghA5slfGC8Dg1SBSfhMnaFwkThaFwqTXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=co8q+FxF; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="co8q+FxF"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 7314126025;
	Fri, 23 May 2025 12:46:12 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e2dD39EOxXH8; Fri, 23 May 2025 12:46:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1747997171; bh=R2qt1PgPlfZdW0uCkZD3WsYf2ueDKi37uGThCDgyG14=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=co8q+FxFywJ8ydDFnZ/L2TsW4po6DBLilaJclrF8KB4Ry1hXMkizbAYe+FLYdh2+7
	 ldkP/f96hfZgbcyvLbFvS4OPWqs0xr7mNaLKTUUaYfLb+B653qZZmBLe9/YlBYtyTz
	 YYJ9ztiRoNlbteKJ+pUY/T/iVYtPEP1AD45OhdmBu+GyfecEGSlDPRLwJ+o11B4TnL
	 asgckN3Bv+ygwkmQKyUbqHu1wuC43vhSdLejqnoskQCFAv+Akz7n3YOCWIYAKZlmc6
	 xrOYtwItJzrQT11koVycgWS0Y4eU8XnjrRT5g/zk+NPQTEuI8bygXmwX2HcA6kBa91
	 3wYlB5OSRochQ==
From: Yao Zi <ziyao@disroot.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Mingcong Bai <jeffbai@aosc.io>,
	Kexy Biscuit <kexybiscuit@aosc.io>,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH 1/8] dt-bindings: clock: Document Loongson 2K0300 clock controller
Date: Fri, 23 May 2025 10:45:45 +0000
Message-ID: <20250523104552.32742-2-ziyao@disroot.org>
In-Reply-To: <20250523104552.32742-1-ziyao@disroot.org>
References: <20250523104552.32742-1-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the clock controller shipped in Loongson 2K0300 SoC, which
generates various clock signals for SoC peripherals.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 .../bindings/clock/loongson,ls2k0300-clk.yaml | 52 ++++++++++++++++++
 .../dt-bindings/clock/loongson,ls2k0300-clk.h | 54 +++++++++++++++++++
 2 files changed, 106 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/loongson,ls2k0300-clk.yaml
 create mode 100644 include/dt-bindings/clock/loongson,ls2k0300-clk.h

diff --git a/Documentation/devicetree/bindings/clock/loongson,ls2k0300-clk.yaml b/Documentation/devicetree/bindings/clock/loongson,ls2k0300-clk.yaml
new file mode 100644
index 000000000000..d96b9d7cb7c4
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/loongson,ls2k0300-clk.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/loongson,ls2k0300-clk.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Loongson-2K0300 SoC Clock Controller
+
+maintainers:
+  - Yao Zi <ziyao@disroot.org>
+
+description: |
+  The Loongson 2K0300 clock controller generates various clocks for SoC
+  peripherals. See include/dt-bindings/clock/loongson,ls2k0300-clk.h for
+  valid clock IDs.
+
+properties:
+  compatible:
+    const: loongson,ls2k0300-clk
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: External 120MHz reference clock
+
+  clock-names:
+    items:
+      - const: ref_120m
+
+  '#clock-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    clk: clock-controller@16000400 {
+        compatible = "loongson,ls2k0300-clk";
+        reg = <0x16000400 0x100>;
+        clocks = <&ref_120m>;
+        clock-names = "ref_120m";
+        #clock-cells = <1>;
+    };
diff --git a/include/dt-bindings/clock/loongson,ls2k0300-clk.h b/include/dt-bindings/clock/loongson,ls2k0300-clk.h
new file mode 100644
index 000000000000..5e8f7b2f33f2
--- /dev/null
+++ b/include/dt-bindings/clock/loongson,ls2k0300-clk.h
@@ -0,0 +1,54 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright (C) 2025 Yao Zi <ziyao@disroot.org>
+ */
+#ifndef _DT_BINDINGS_CLK_LOONGSON_LS2K300_H_
+#define _DT_BINDINGS_CLK_LOONGSON_LS2K300_H_
+
+/* Derivied from REFCLK */
+#define LS2K0300_CLK_STABLE			0
+#define LS2K0300_PLL_NODE			1
+#define LS2K0300_PLL_DDR			2
+#define LS2K0300_PLL_PIX			3
+#define LS2K0300_CLK_THSENS			4
+
+/* Derived from PLL_NODE */
+#define LS2K0300_CLK_NODE_DIV			5
+#define LS2K0300_CLK_NODE_PLL_GATE		6
+#define LS2K0300_CLK_NODE_SCALE			7
+#define LS2K0300_CLK_NODE_GATE			8
+#define LS2K0300_CLK_GMAC_DIV			9
+#define LS2K0300_CLK_GMAC_GATE			10
+#define LS2K0300_CLK_I2S_DIV			11
+#define LS2K0300_CLK_I2S_SCALE			12
+#define LS2K0300_CLK_I2S_GATE			13
+
+/* Derived from PLL_DDR */
+#define LS2K0300_CLK_DDR_DIV			14
+#define LS2K0300_CLK_DDR_GATE			15
+#define LS2K0300_CLK_NET_DIV			16
+#define LS2K0300_CLK_NET_GATE			17
+#define LS2K0300_CLK_DEV_DIV			18
+#define LS2K0300_CLK_DEV_GATE			19
+
+/* Derived from PLL_PIX */
+#define LS2K0300_CLK_PIX_DIV			20
+#define LS2K0300_CLK_PIX_PLL_GATE		21
+#define LS2K0300_CLK_PIX_SCALE			22
+#define LS2K0300_CLK_PIX_GATE			23
+#define LS2K0300_CLK_GMACBP_DIV			24
+#define LS2K0300_CLK_GMACBP_GATE		25
+
+/* Derived from CLK_DEV */
+#define LS2K0300_CLK_USB_SCALE			26
+#define LS2K0300_CLK_USB_GATE			27
+#define LS2K0300_CLK_APB_SCALE			28
+#define LS2K0300_CLK_APB_GATE			29
+#define LS2K0300_CLK_BOOT_SCALE			30
+#define LS2K0300_CLK_BOOT_GATE			31
+#define LS2K0300_CLK_SDIO_SCALE			32
+#define LS2K0300_CLK_SDIO_GATE			33
+
+#define LS2K0300_CLK_GMAC_IN			34
+
+#endif // _DT_BINDINGS_CLK_LOONGSON_LS2K300_H_
-- 
2.49.0

