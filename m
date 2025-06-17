Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893162EBDC0;
	Tue, 17 Jun 2025 16:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750177509; cv=none; b=YZ9IR75ErlhxxJcNUIPQmOHj98phmJKsJCgtjS9nWW63jTtdLdy5MZ7otGB1aeWyAeJ+bHHeSEVcwY6+E7XGAfzBtoXCAg70xBqWQJbEI1V3y9NcwOySiId45GS3wjHIEtZxuEDARLGV77EJpnEF4Dfa1ZZcUAPRtV40v1tOiqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750177509; c=relaxed/simple;
	bh=SJImj8DX4cFCxxe5T6hltCyBPxouDRd2XFWmdEWwo2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p3zy3NruEb1qmmNFcrxhOZBsCb47O/ngRx2NOqwfYm4/5wCqcHM+jfgwxaLV8bTcUw3lyR0jLKQ01R6BFMLiokdfmT5h24AQlpVGNxxgyfZqkuqlkJIdkqJ8bpvyqRwdREAhJXm3FHKLJys9bUExotYmMkJmG6zE8Gra4IkkGCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=Tw6KrqUt; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="Tw6KrqUt"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 487F4258DE;
	Tue, 17 Jun 2025 18:25:06 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id feSf5wsVr4Ax; Tue, 17 Jun 2025 18:25:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1750177505; bh=SJImj8DX4cFCxxe5T6hltCyBPxouDRd2XFWmdEWwo2Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Tw6KrqUtPeN4KBbUYImaMiUJzCC55BOFhsF7g7zxMd80+lFQC6e5Ka8vSzJ+NRRlr
	 3oLzrPBpVvPryn5ypZ121PPlWEWCf1p9MHg23mvZ/s6noipc2seYXyMVt41KvzD3WA
	 NXpj3vHicE07NovaeMrQiylztwUiEMqqduVKz4OMW5e8OuB+aE3m7FYSrSdJjgiQRP
	 FtYoLmRpsH+snlCsvoskk3aiuZp1+0rUzr6U24xRGut399tISA9I2hkCAhvgaWaxS5
	 tBha1FtB/gvWl/8rVVqWlRCyqYX2ow72yl0+sRzzQDPrJTa9frInRk7znYNiYkeU7/
	 TZpgiOUF+qwWg==
From: Yao Zi <ziyao@disroot.org>
To: Yinbo Zhu <zhuyinbo@loongson.cn>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Mingcong Bai <jeffbai@aosc.io>,
	Kexy Biscuit <kexybiscuit@aosc.io>,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH v2 1/8] dt-bindings: clock: loongson2: Add Loongson 2K0300 compatible
Date: Tue, 17 Jun 2025 16:24:19 +0000
Message-ID: <20250617162426.12629-2-ziyao@disroot.org>
In-Reply-To: <20250617162426.12629-1-ziyao@disroot.org>
References: <20250617162426.12629-1-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the clock controller shipped in Loongson 2K0300 SoC, which
generates various clock signals for SoC peripherals.

Differing from previous generations of SoCs, 2K0300 requires a 120MHz
external clock input, and a separate dt-binding header is used for
cleanness.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 .../bindings/clock/loongson,ls2k-clk.yaml     | 26 ++++++---
 MAINTAINERS                                   |  1 +
 .../dt-bindings/clock/loongson,ls2k0300-clk.h | 54 +++++++++++++++++++
 3 files changed, 75 insertions(+), 6 deletions(-)
 create mode 100644 include/dt-bindings/clock/loongson,ls2k0300-clk.h

diff --git a/Documentation/devicetree/bindings/clock/loongson,ls2k-clk.yaml b/Documentation/devicetree/bindings/clock/loongson,ls2k-clk.yaml
index 4f79cdb417ab..3e0a894cfb2f 100644
--- a/Documentation/devicetree/bindings/clock/loongson,ls2k-clk.yaml
+++ b/Documentation/devicetree/bindings/clock/loongson,ls2k-clk.yaml
@@ -16,6 +16,7 @@ description: |
 properties:
   compatible:
     enum:
+      - loongson,ls2k0300-clk
       - loongson,ls2k0500-clk
       - loongson,ls2k-clk  # This is for Loongson-2K1000
       - loongson,ls2k2000-clk
@@ -24,19 +25,32 @@ properties:
     maxItems: 1
 
   clocks:
-    items:
-      - description: 100m ref
+    maxItems: 1
 
-  clock-names:
-    items:
-      - const: ref_100m
+  clock-names: true
 
   '#clock-cells':
     const: 1
     description:
       The clock consumer should specify the desired clock by having the clock
       ID in its "clocks" phandle cell. See include/dt-bindings/clock/loongson,ls2k-clk.h
-      for the full list of Loongson-2 SoC clock IDs.
+      and include/dt-bindings/clock/loongson,ls2k0300-clk.h for the full list of
+      Loongson-2 SoC clock IDs.
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: loongson,ls2k0300-clk
+    then:
+      properties:
+        clock-names:
+          const: ref_120m
+    else:
+      properties:
+        clock-names:
+          const: ref_100m
 
 required:
   - compatible
diff --git a/MAINTAINERS b/MAINTAINERS
index dd844ac8d910..9b7c4b2b7f58 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13954,6 +13954,7 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/clock/loongson,ls2k-clk.yaml
 F:	drivers/clk/clk-loongson2.c
 F:	include/dt-bindings/clock/loongson,ls2k-clk.h
+F:	include/dt-bindings/clock/loongson,ls2k0300-clk.h
 
 LOONGSON SPI DRIVER
 M:	Yinbo Zhu <zhuyinbo@loongson.cn>
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

