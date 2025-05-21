Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA576FB9;
	Wed, 21 May 2025 00:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747788437; cv=none; b=bIO5EV0I6LtTcWVNckNyquMPnJWvlUgl4LpspT7gvr+p3p+5kjV++wignQikk3cvxd8+o2nqm/U52Y15BWtjgHgHZDmyooGIF5AY8bkACe0+Pih377n0DYHufJKytBSPRALTB6iP+DTRe+4zegrnvkPm10EdNmLIK8R4vmUbAf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747788437; c=relaxed/simple;
	bh=rRDlF1Vf8OaC1qiDKBqVwnNcPdkFg1jUoLmIDsbmKm0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aObzaArZgjeXwYC19RrCUvBzp3EBOoCimOemCCziG232ONPo72tEKA6+304IEhfxdCwM78EUm99Xg2tWvIBcsQxpUJpiqbAz/TxUtplp4pidUbFythZWm8KUvwd4wQyx7qrnUKhB65Hcg+IfDiiIa2qtCaWxUrZjr1hosNP4w/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RrwuZZEM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RrwuZZEM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04BB6C4CEE9;
	Wed, 21 May 2025 00:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747788437;
	bh=rRDlF1Vf8OaC1qiDKBqVwnNcPdkFg1jUoLmIDsbmKm0=;
	h=From:To:Cc:Subject:Date:From;
	b=RrwuZZEMdV8xlGsPd0P124fARf815Wk1tFm4BZD4dVKNUHiRBlJYNr866hxFi7OWp
	 9IDEXF/0lmGC9810KxUxwcy5ITWcvPoXqa4dIcHCPE4jsfPodLyrHLTkAoWpCz1+zh
	 o6XQOaA1Kkii8/ITU2dvamGpzX1hwL35kXMnqLhK5BL8Jv4v/EDfnYoebQvSodtB9D
	 hwWzVmXsew0BvPPseZlvJ9UFFWt1VpIqfsW750EU2Btowdda26ZpQHamgjZXYJ3yCs
	 0fV6k0GQzkOTodDUuasdH1WXc3xrO1mE+1StNn/hgnWq/dICNY4Hv/tBobOPqYlgQY
	 6J2cuKR8n1TVQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Oleksij Rempel <linux@rempel-privat.de>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: clock: Convert alphascale,asm9260-clock-controller to DT schema
Date: Tue, 20 May 2025 19:47:11 -0500
Message-ID: <20250521004712.1793193-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Alphascale Clock Controller binding to DT schema format.
Add the undocumented 'clocks' property which is used in DTS. Drop the
clock defines and consumer examples from the old binding.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/clock/alphascale,acc.txt         | 114 ------------------
 .../alphascale,asm9260-clock-controller.yaml  |  49 ++++++++
 2 files changed, 49 insertions(+), 114 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/alphascale,acc.txt
 create mode 100644 Documentation/devicetree/bindings/clock/alphascale,asm9260-clock-controller.yaml

diff --git a/Documentation/devicetree/bindings/clock/alphascale,acc.txt b/Documentation/devicetree/bindings/clock/alphascale,acc.txt
deleted file mode 100644
index c9fb9324c634..000000000000
--- a/Documentation/devicetree/bindings/clock/alphascale,acc.txt
+++ /dev/null
@@ -1,114 +0,0 @@
-Alphascale Clock Controller
-
-The ACC (Alphascale Clock Controller) is responsible for choosing proper
-clock source, setting dividers and clock gates.
-
-Required properties for the ACC node:
- - compatible: must be "alphascale,asm9260-clock-controller"
- - reg: must contain the ACC register base and size
- - #clock-cells : shall be set to 1.
-
-Simple one-cell clock specifier format is used, where the only cell is used
-as an index of the clock inside the provider.
-It is encouraged to use dt-binding for clock index definitions. SoC specific
-dt-binding should be included to the device tree descriptor. For example
-Alphascale ASM9260:
-#include <dt-bindings/clock/alphascale,asm9260.h>
-
-This binding contains two types of clock providers:
- _AHB_ - AHB gate;
- _SYS_ - adjustable clock source. Not all peripheral have _SYS_ clock provider.
-All clock specific details can be found in the SoC documentation.
-CLKID_AHB_ROM		0
-CLKID_AHB_RAM		1
-CLKID_AHB_GPIO		2
-CLKID_AHB_MAC		3
-CLKID_AHB_EMI		4
-CLKID_AHB_USB0		5
-CLKID_AHB_USB1		6
-CLKID_AHB_DMA0		7
-CLKID_AHB_DMA1		8
-CLKID_AHB_UART0		9
-CLKID_AHB_UART1		10
-CLKID_AHB_UART2		11
-CLKID_AHB_UART3		12
-CLKID_AHB_UART4		13
-CLKID_AHB_UART5		14
-CLKID_AHB_UART6		15
-CLKID_AHB_UART7		16
-CLKID_AHB_UART8		17
-CLKID_AHB_UART9		18
-CLKID_AHB_I2S0		19
-CLKID_AHB_I2C0		20
-CLKID_AHB_I2C1		21
-CLKID_AHB_SSP0		22
-CLKID_AHB_IOCONFIG	23
-CLKID_AHB_WDT		24
-CLKID_AHB_CAN0		25
-CLKID_AHB_CAN1		26
-CLKID_AHB_MPWM		27
-CLKID_AHB_SPI0		28
-CLKID_AHB_SPI1		29
-CLKID_AHB_QEI		30
-CLKID_AHB_QUADSPI0	31
-CLKID_AHB_CAMIF		32
-CLKID_AHB_LCDIF		33
-CLKID_AHB_TIMER0	34
-CLKID_AHB_TIMER1	35
-CLKID_AHB_TIMER2	36
-CLKID_AHB_TIMER3	37
-CLKID_AHB_IRQ		38
-CLKID_AHB_RTC		39
-CLKID_AHB_NAND		40
-CLKID_AHB_ADC0		41
-CLKID_AHB_LED		42
-CLKID_AHB_DAC0		43
-CLKID_AHB_LCD		44
-CLKID_AHB_I2S1		45
-CLKID_AHB_MAC1		46
-
-CLKID_SYS_CPU		47
-CLKID_SYS_AHB		48
-CLKID_SYS_I2S0M		49
-CLKID_SYS_I2S0S		50
-CLKID_SYS_I2S1M		51
-CLKID_SYS_I2S1S		52
-CLKID_SYS_UART0		53
-CLKID_SYS_UART1		54
-CLKID_SYS_UART2		55
-CLKID_SYS_UART3		56
-CLKID_SYS_UART4		56
-CLKID_SYS_UART5		57
-CLKID_SYS_UART6		58
-CLKID_SYS_UART7		59
-CLKID_SYS_UART8		60
-CLKID_SYS_UART9		61
-CLKID_SYS_SPI0		62
-CLKID_SYS_SPI1		63
-CLKID_SYS_QUADSPI	64
-CLKID_SYS_SSP0		65
-CLKID_SYS_NAND		66
-CLKID_SYS_TRACE		67
-CLKID_SYS_CAMM		68
-CLKID_SYS_WDT		69
-CLKID_SYS_CLKOUT	70
-CLKID_SYS_MAC		71
-CLKID_SYS_LCD		72
-CLKID_SYS_ADCANA	73
-
-Example of clock consumer with _SYS_ and _AHB_ sinks.
-uart4: serial@80010000 {
-	compatible = "alphascale,asm9260-uart";
-	reg = <0x80010000 0x4000>;
-	clocks = <&acc CLKID_SYS_UART4>, <&acc CLKID_AHB_UART4>;
-	interrupts = <19>;
-};
-
-Clock consumer with only one, _AHB_ sink.
-timer0: timer@80088000 {
-	compatible = "alphascale,asm9260-timer";
-	reg = <0x80088000 0x4000>;
-	clocks = <&acc CLKID_AHB_TIMER0>;
-	interrupts = <29>;
-};
-
diff --git a/Documentation/devicetree/bindings/clock/alphascale,asm9260-clock-controller.yaml b/Documentation/devicetree/bindings/clock/alphascale,asm9260-clock-controller.yaml
new file mode 100644
index 000000000000..1caad419ce9d
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/alphascale,asm9260-clock-controller.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/alphascale,asm9260-clock-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Alphascale Clock Controller
+
+maintainers:
+  - Oleksij Rempel <linux@rempel-privat.de>
+
+description: |
+  The ACC (Alphascale Clock Controller) is responsible for choosing proper
+  clock source, setting dividers and clock gates.
+
+  Simple one-cell clock specifier format is used, where the only cell is used
+  as an index of the clock inside the provider.
+  It is encouraged to use dt-binding for clock index definitions. SoC specific
+  dt-binding should be included to the device tree descriptor. For example
+  Alphascale ASM9260:
+
+  #include <dt-bindings/clock/alphascale,asm9260.h>
+
+  This binding contains two types of clock providers:
+
+    _AHB_ - AHB gate;
+    _SYS_ - adjustable clock source. Not all peripheral have _SYS_ clock provider.
+
+  All clock specific details can be found in the SoC documentation.
+
+properties:
+  compatible:
+    const: alphascale,asm9260-clock-controller
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+
+additionalProperties: false
-- 
2.47.2

