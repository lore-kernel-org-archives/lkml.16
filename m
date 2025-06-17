Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBC22ED85C;
	Tue, 17 Jun 2025 13:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750165540; cv=none; b=MOzYdXTR8L3Q10JLcG44tLHsDJc70wXB8s+myW/tZAVEpgymmHM5ydKvYOW+FG4V3A+sgYkBhCGyLnmxr6nZs6EBWX58IHkrOHa+WoZvCR5MBJVcGO/SBIcoFK3O6Q92C9udd7728D44N18BZbWoO/MATT8STEUeC2VDVNyuRHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750165540; c=relaxed/simple;
	bh=ktRQNXVr7BEfpdZEzxW7U+BzhCCUBbVB2f56YkOFfT4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DXbKv3j2awRlx1zIpCi8Qokg3pkUBv5LFljqHRAU/VkaXwTRVzkOVA1riYz9PEx29SYTPWiEaFNXpKgP0JJjuH9Hv8iw1Azq0Y9cpZN+eoU/AGukikD6tScq0syAasUpwmKqYhwsgxbgXHvO3r8GNoOu+uvoXQlIRFkcOPFz68Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hHXRocCd; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hHXRocCd"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-450cfb790f7so45571255e9.0;
        Tue, 17 Jun 2025 06:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750165537; x=1750770337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KNibcV6kqNTWWvC72KVAuJN5oNEcId6h+wYMwk44pL4=;
        b=hHXRocCdR9uNbcqYWbQ+D4jo1XmiNdKTFD2nzhiOBmDpz3NeJzlWIvwWK/VUJ8kJMS
         bdyVdCvLRNVbEmacwMv7hFoBzRHw8wyMrv6JXB7ArtvdIp3MunO17gIr19t3S6yVxXTX
         67JHg1BPBoEjegM/YBEKUziaT1AOaDDnaykXtlocEMHnrhWq7e/Qj+hmcSuHH6w1CoSS
         VcqP+B5JizrfePRs647wLbrgbZWBvSKKko/T7mJUYfgNGhZlW9hdpSooXF/ihXG4xZAR
         3coVYz47HCWg1JuRYGWNTfjPui0Ee70sQhxBsLO+LEnXwVdDtI3L7aweD1uz265Drc2R
         E+tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750165537; x=1750770337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KNibcV6kqNTWWvC72KVAuJN5oNEcId6h+wYMwk44pL4=;
        b=Y8YmsMzvhGRwewiDgOUeA7qlB8HAS8Gj11r4gzCapX06FfKXetm3XPblz5xQNpGTRT
         NTnRO7d1mJ06KXrOHVSkWA9jvP/aIeS/4MoYuCSojASdu+n3eh035bBLPQvLSIyMOtyb
         4oqtcZIgdZptYNQ3a+NqPG/Qk98vpwr9mWlDXvsgakZydr4qsKsAMi8qH0aXwtJ6ZYwg
         kMWwRNfTvIIFpElz7ZeHBm2vxkZeHMsciXFR9z8kGmpjyrsbg+MMcCYhu+q5dSyKfFOb
         eEdPhN7sdUFHnUrqbajhVRduR5Ng9bxZEM4gWfLnQBjyGcUT7hDVSBxY4Mwp2KWB3t0z
         56Ow==
X-Forwarded-Encrypted: i=1; AJvYcCVfWXyZz9xlgRKoBNFDuuNyZ/ZfGCi4zN/3t2TSpM6hw8vmwQjAYo759zYizMZEgZ7eS0HP4eC/N/A6@vger.kernel.org, AJvYcCXWEQV40IAZv+pkSJz2jAhzf+hvGvLnUkTvR0No9ELD1XceM4VCQ980RD/Xyq2iMH6w9wgvJcxSytVG@vger.kernel.org, AJvYcCXm12mj9iHdXlDbd9fCZE9N+UkCaEsP40vvv+YLPIubljtCQTsWpZruwTeMlGI509RvAd/5yz2j10jlPQVr@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv5X9QT50d1ipJ3UcNyeT/W2Q+ELyNbMhF6eM2Rg2oC6hqKHno
	v4hyU8joApM2uCT5oMvqvHYKg6MlNzHgtHF2AdkNqPHWNizIm2RldjjU
X-Gm-Gg: ASbGncs8NdLdvDNNqyz4RlsNg/k2rgdzUJvn4sxTLHgwkmlg0HPZ11SR1ENhVEAQMTx
	QFJwbHIpztriDxEYNOMa5H9BSq9KN/IQyiH4F9VQvaUNeFw9RKjzuujPZ/bntZs9RjmNtIsMbl5
	zH35YJy9Cv1zcRgzHbNnP5Jo4I8kGPxoBQON2dIz0o2OGUIp0psa6kwUDHEI8XTZugxpjJhR9Uq
	gaGVDL4/YK1bXdk4kuv5/o7DzQpQBe/TBBE4iXBrKUrg1GUJg7q5PtOg89YJkpZAdrTLibTBuUL
	tXeIMBkQ3doYZe5AuTJgTEzDPNmEIXNYFH4YOuy4CTcWR0YpuHz5ejsc7FqS6R8aRLZt69teDmd
	HLwKV8eUkIuzjH+Xv0MTAjykoLpzrzXQ=
X-Google-Smtp-Source: AGHT+IG/OC/KeMdgIwxDRpCJNoScdaPAhicab3bKSnodc5HDOWEEQvENmFOL8eENb2KHpYBun6IK9g==
X-Received: by 2002:a05:600c:3e18:b0:450:cfa7:5ea1 with SMTP id 5b1f17b1804b1-4533caa629amr129717775e9.16.1750165537093;
        Tue, 17 Jun 2025 06:05:37 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4532e24b0c8sm173809435e9.24.2025.06.17.06.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 06:05:36 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v2 09/10] dt-bindings: clock: airoha: Document support for AN7583 clock
Date: Tue, 17 Jun 2025 15:04:52 +0200
Message-ID: <20250617130455.32682-10-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250617130455.32682-1-ansuelsmth@gmail.com>
References: <20250617130455.32682-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document support for Airoha AN7583 clock. This is based on the EN7523
clock schema with the new requirement of the "airoha,chip-scu"
(previously optional for EN7581).

Add additional binding for additional clock and reset lines.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/clock/airoha,en7523-scu.yaml     |  9 +++
 include/dt-bindings/clock/en7523-clk.h        |  3 +
 .../dt-bindings/reset/airoha,an7583-reset.h   | 61 +++++++++++++++++++
 3 files changed, 73 insertions(+)
 create mode 100644 include/dt-bindings/reset/airoha,an7583-reset.h

diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
index bce77a14c938..be9759b86fdc 100644
--- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
+++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
@@ -32,6 +32,7 @@ properties:
       - enum:
           - airoha,en7523-scu
           - airoha,en7581-scu
+          - airoha,an7583-scu
 
   reg:
     items:
@@ -82,6 +83,14 @@ allOf:
         reg:
           maxItems: 1
 
+  - if:
+      properties:
+        compatible:
+          const: airoha,an7583-scu
+    then:
+      required:
+        - airoha,chip-scu
+
 additionalProperties: false
 
 examples:
diff --git a/include/dt-bindings/clock/en7523-clk.h b/include/dt-bindings/clock/en7523-clk.h
index edfa64045f52..0fbbcb7b1b25 100644
--- a/include/dt-bindings/clock/en7523-clk.h
+++ b/include/dt-bindings/clock/en7523-clk.h
@@ -14,4 +14,7 @@
 
 #define EN7581_CLK_EMMC		8
 
+#define AN7583_CLK_MDIO0	9
+#define AN7583_CLK_MDIO1	10
+
 #endif /* _DT_BINDINGS_CLOCK_AIROHA_EN7523_H_ */
diff --git a/include/dt-bindings/reset/airoha,an7583-reset.h b/include/dt-bindings/reset/airoha,an7583-reset.h
new file mode 100644
index 000000000000..96cfe11d2943
--- /dev/null
+++ b/include/dt-bindings/reset/airoha,an7583-reset.h
@@ -0,0 +1,61 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2024 AIROHA Inc
+ * Author: Christian Marangi <ansuelsmth@gmail.com>
+ */
+
+#ifndef __DT_BINDINGS_RESET_CONTROLLER_AIROHA_AN7583_H_
+#define __DT_BINDINGS_RESET_CONTROLLER_AIROHA_AN7583_H_
+
+/* RST_CTRL2 */
+#define AN7583_XPON_PHY_RST		 0
+#define AN7583_GPON_OLT_RST		 1
+#define AN7583_CPU_TIMER2_RST		 2
+#define AN7583_HSUART_RST		 3
+#define AN7583_UART4_RST		 4
+#define AN7583_UART5_RST		 5
+#define AN7583_I2C2_RST			 6
+#define AN7583_XSI_MAC_RST		 7
+#define AN7583_XSI_PHY_RST		 8
+#define AN7583_NPU_RST			 9
+#define AN7583_TRNG_MSTART_RST		10
+#define AN7583_DUAL_HSI0_RST		11
+#define AN7583_DUAL_HSI1_RST		12
+#define AN7583_DUAL_HSI0_MAC_RST	13
+#define AN7583_DUAL_HSI1_MAC_RST	14
+#define AN7583_WDMA_RST			15
+#define AN7583_WOE0_RST			16
+#define AN7583_HSDMA_RST		17
+#define AN7583_TDMA_RST			18
+#define AN7583_EMMC_RST			19
+#define AN7583_SOE_RST			20
+#define AN7583_XFP_MAC_RST		21
+#define AN7583_MDIO0                    22
+#define AN7583_MDIO1                    23
+/* RST_CTRL1 */
+#define AN7583_PCM1_ZSI_ISI_RST		24
+#define AN7583_FE_PDMA_RST		25
+#define AN7583_FE_QDMA_RST		26
+#define AN7583_PCM_SPIWP_RST		27
+#define AN7583_CRYPTO_RST		28
+#define AN7583_TIMER_RST		29
+#define AN7583_PCM1_RST			30
+#define AN7583_UART_RST			31
+#define AN7583_GPIO_RST			32
+#define AN7583_GDMA_RST			33
+#define AN7583_I2C_MASTER_RST		34
+#define AN7583_PCM2_ZSI_ISI_RST		35
+#define AN7583_SFC_RST			36
+#define AN7583_UART2_RST		37
+#define AN7583_GDMP_RST			38
+#define AN7583_FE_RST			39
+#define AN7583_USB_HOST_P0_RST		40
+#define AN7583_GSW_RST			41
+#define AN7583_SFC2_PCM_RST		42
+#define AN7583_PCIE0_RST		43
+#define AN7583_PCIE1_RST		44
+#define AN7583_CPU_TIMER_RST		45
+#define AN7583_PCIE_HB_RST		46
+#define AN7583_XPON_MAC_RST		47
+
+#endif /* __DT_BINDINGS_RESET_CONTROLLER_AIROHA_AN7583_H_ */
-- 
2.48.1

