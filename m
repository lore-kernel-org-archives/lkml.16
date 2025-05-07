Received: from sender3-op-o16.zoho.com (sender3-op-o16.zoho.com [136.143.184.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017D1287508;
	Wed,  7 May 2025 13:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746624411; cv=pass; b=EJd7+bfdojW3haVqGT4luiy4uAQ4b2pYzgOUoTA9bTNgeRcgVYtpuZ5asjR0TD3ad2gyBJ4T4AgeUalLMIIk02TQVtxpygwv9PkBV/x5b6M5wQsf6SFEUnkg4mfpvgU2dmoNwIi/zc4MYRA1a20y5opmh19FolimGAaepVjnGL4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746624411; c=relaxed/simple;
	bh=ODVCmynnJQ0c6rF92R6nLjsQtfRSNDqvQd+5DSy8y4U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QMkw5Q1+Qb4E7DwSPdItu2H/KYvjRy9rbZ+cGg26uDAGoohzahgwORDIVnG0S/d5GfehY8mHxHQ8EiPHhtuQUsjIzZud9I1WoJg4b9+m0OMDUW6AzdExVZxhpxOashQy6jnbOLg9m3y9ZWYcu4C2CE+UwjovbO7/o184kZQcdA8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=h8oxnT9L; arc=pass smtp.client-ip=136.143.184.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="h8oxnT9L"
ARC-Seal: i=1; a=rsa-sha256; t=1746624387; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SD9GjFQO0Hl3nq9kUw7qcxzc8Ph7XwWtb18xE++xbekM1jpEwaBx72NHTG/ioKqOVo9D4+lob96dU9zN+bKfLYpF4P3uwb9YEWeIjZMr+0He6rQK0H4LwS40Z054Qn6nyxO9qqxIfY5J+nGCpoRCvqUtcC/+MHKP+YGcDdPxKyE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1746624387; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=RwMP1KKbEuTPv9DVxFj/JYtXhUf6m5oOAVvM8JZb6Ck=; 
	b=fXlFA4DM+rAZShpXYiQWRkjt2Vd6tr5fe63vKGW5V4riqJXJ0yV5ypsdRG7a967PAYQZ2Mp8k7qu9Q3QFFi9G0jgC/EgmYzpiutDUXVDf3w3vUinhlJ9wcvT4DXyeb/RKlcFJWa3IwgjF643SLZFcdFzAApUkmbsIgGDEUEYgb4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746624387;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=RwMP1KKbEuTPv9DVxFj/JYtXhUf6m5oOAVvM8JZb6Ck=;
	b=h8oxnT9Ly0m/PiArx2alkPfnDA3dzHNF/yH3qkHj16DgHImUh83DUH/OijWGlTZY
	xAbKQI3ghBNg7KPKYsc065EYsaLnq8ia1EYGdGlMn5HT7seAffGzXxgMmbiiBwHAcOE
	lrA2qcKaf1SDxmNMR265C2hdKjKfd5MIWll3Qq4A=
Received: by mx.zohomail.com with SMTPS id 1746624386135508.5781894207631;
	Wed, 7 May 2025 06:26:26 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Wed, 07 May 2025 21:25:33 +0800
Subject: [PATCH v3 1/2] dt-bindings: reset: add support for canaan,k230-rst
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-k230-reset-v3-1-c85240782ea5@pigmoral.tech>
References: <20250507-k230-reset-v3-0-c85240782ea5@pigmoral.tech>
In-Reply-To: <20250507-k230-reset-v3-0-c85240782ea5@pigmoral.tech>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Junhui Liu <junhui.liu@pigmoral.tech>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>, 
 Chen Wang <unicorn_wang@outlook.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746624358; l=4335;
 i=junhui.liu@pigmoral.tech; s=20250507; h=from:subject:message-id;
 bh=ODVCmynnJQ0c6rF92R6nLjsQtfRSNDqvQd+5DSy8y4U=;
 b=X0fQigF6puj42Hcef0+G9Dc61RVyhhXFVJR9USBpr/lpXE7rSRRTEff+pWczwcEj5/YV1r6w4
 iSAW8exmkSzBVUk9EvYLbZHSqbIbvBF+X7I8UHjQVf1HNiCZkBt62kL
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=d3i4H2mg9LUn4SQemoLAjLRQy0nTcyknIv6zgKMwiBA=
X-ZohoMailClient: External

Introduces a reset controller driver for the Kendryte K230 SoC,
resposible for managing the reset functionality of the CPUs and
various sub-modules.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 .../devicetree/bindings/reset/canaan,k230-rst.yaml | 39 ++++++++++
 include/dt-bindings/reset/canaan,k230-rst.h        | 90 ++++++++++++++++++++++
 2 files changed, 129 insertions(+)

diff --git a/Documentation/devicetree/bindings/reset/canaan,k230-rst.yaml b/Documentation/devicetree/bindings/reset/canaan,k230-rst.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..d352d0e12d8106a232bb5e6d7e138697d2106937
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/canaan,k230-rst.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/canaan,k230-rst.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Canaan Kendryte K230 Reset Controller
+
+maintainers:
+  - Junhui Liu <junhui.liu@pigmoral.tech>
+
+description:
+  The Canaan Kendryte K230 reset controller is part of the SoC's system
+  controller and controls the reset registers for CPUs and various peripherals.
+
+properties:
+  compatible:
+    const: canaan,k230-rst
+
+  reg:
+    maxItems: 1
+
+  '#reset-cells':
+    const: 1
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
+    reset-controller@91101000 {
+      compatible = "canaan,k230-rst";
+      reg = <0x91101000 0x1000>;
+      #reset-cells = <1>;
+    };
diff --git a/include/dt-bindings/reset/canaan,k230-rst.h b/include/dt-bindings/reset/canaan,k230-rst.h
new file mode 100644
index 0000000000000000000000000000000000000000..e4f6612607fea2faf2bcaa80add0b291c3371e4b
--- /dev/null
+++ b/include/dt-bindings/reset/canaan,k230-rst.h
@@ -0,0 +1,90 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2023-2024 Canaan Bright Sight Co., Ltd
+ * Copyright (C) 2024-2025 Junhui Liu <junhui.liu@pigmoral.tech>
+ */
+#ifndef _DT_BINDINGS_CANAAN_K230_RST_H_
+#define _DT_BINDINGS_CANAAN_K230_RST_H_
+
+#define RST_CPU0		0
+#define RST_CPU1		1
+#define RST_CPU0_FLUSH		2
+#define RST_CPU1_FLUSH		3
+#define RST_AI			4
+#define RST_VPU			5
+#define RST_HISYS		6
+#define RST_HISYS_AHB		7
+#define RST_SDIO0		8
+#define RST_SDIO1		9
+#define RST_SDIO_AXI		10
+#define RST_USB0		11
+#define RST_USB1		12
+#define RST_USB0_AHB		13
+#define RST_USB1_AHB		14
+#define RST_SPI0		15
+#define RST_SPI1		16
+#define RST_SPI2		17
+#define RST_SEC			18
+#define RST_PDMA		19
+#define RST_SDMA		20
+#define RST_DECOMPRESS		21
+#define RST_SRAM		22
+#define RST_SHRM_AXIM		23
+#define RST_SHRM_AXIS		24
+#define RST_NONAI2D		25
+#define RST_MCTL		26
+#define RST_ISP			27
+#define RST_ISP_DW		28
+#define RST_DPU			29
+#define RST_DISP		30
+#define RST_GPU			31
+#define RST_AUDIO		32
+#define RST_TIMER0		33
+#define RST_TIMER1		34
+#define RST_TIMER2		35
+#define RST_TIMER3		36
+#define RST_TIMER4		37
+#define RST_TIMER5		38
+#define RST_TIMER_APB		39
+#define RST_HDI			40
+#define RST_WDT0		41
+#define RST_WDT1		42
+#define RST_WDT0_APB		43
+#define RST_WDT1_APB		44
+#define RST_TS_APB		45
+#define RST_MAILBOX		46
+#define RST_STC			47
+#define RST_PMU			48
+#define RST_LOSYS_APB		49
+#define RST_UART0		50
+#define RST_UART1		51
+#define RST_UART2		52
+#define RST_UART3		53
+#define RST_UART4		54
+#define RST_I2C0		55
+#define RST_I2C1		56
+#define RST_I2C2		57
+#define RST_I2C3		58
+#define RST_I2C4		59
+#define RST_JAMLINK0_APB	60
+#define RST_JAMLINK1_APB	61
+#define RST_JAMLINK2_APB	62
+#define RST_JAMLINK3_APB	63
+#define RST_CODEC_APB		64
+#define RST_GPIO_DB		65
+#define RST_GPIO_APB		66
+#define RST_ADC			67
+#define RST_ADC_APB		68
+#define RST_PWM_APB		69
+#define RST_SHRM_APB		70
+#define RST_CSI0		71
+#define RST_CSI1		72
+#define RST_CSI2		73
+#define RST_CSI_DPHY		74
+#define RST_ISP_AHB		75
+#define RST_M0			76
+#define RST_M1			77
+#define RST_M2			78
+#define RST_SPI2AXI		79
+
+#endif

-- 
2.49.0

