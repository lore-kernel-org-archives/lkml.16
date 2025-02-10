Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4EF156C6A;
	Mon, 10 Feb 2025 16:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.92.40.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739205928; cv=none; b=GSm7oAYNgkNNtFrecAClmNFZBoEwv4pyH8k1nVfk3FCM67eVKWuvQNONyRnQrn21+eW+qbPZ1QaUnJPd/Pstu6h25yIbQq1TtZhADVG8hdt43TcWAhQ9RWygS4HGEF7fnIa42EFK9B3Knbuz9HTWh/yTKWgGSZfnmNGaF1g1M2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739205928; c=relaxed/simple;
	bh=y6LipfjiP70lz0iIolxkGo+eWwABy7qHeLboHDDSDOA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Hj56KwebpN6XGnBuKjWQdp/IarDDK2xpqwW2OdnPzjoCbS6Mp8czXCOmbwYokKxzRU+K6Ibx3vWS2f1HghcbRjeNcmu+hOttn6qHZPWrLZ+7u7ih53U639RY8BPTSrSP1Dpu56YJCl/kPSQNuKH9C+0yUvTjtOgQ5gKnqmaD+P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com; spf=pass smtp.mailfrom=thorsis.com; dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b=FXzt1v/N; arc=none smtp.client-ip=217.92.40.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b="FXzt1v/N"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E4C841480321;
	Mon, 10 Feb 2025 17:45:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1739205917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AJq/DbnAu7CYKu8ZlgeZYkydXunGRVZL6/T78Qy7bPY=;
	b=FXzt1v/NGV9VVrv9XiPdMs5VuLSW6s8lDJixS5p1hVswr91HxKVEiUWtOEKMyH1PdeIE8q
	3wz2izQofSjcTYsbz6vDxuX/3b4ZPN1ZnuQ8JxIdx1LcRrhbgfCWZz38DNMR+FJpSzJXh/
	5ZUltJvfrripaYoax872kJg1REvx34vyETQu7VGp5BjlY7uU2JI8YOQjrOff+IeTLyrYuH
	7SEOZ/8SZl4LOO45U3b3afSdMpz+8LWj/QXHOzNxfrD8Z0rVIWrfpjUqwlc4kpn0S8m+FF
	JrJyZ9A37UEoTg7E1Oi+siFAVlnoy4XBMrXTzs5VW+krBrr/ll7ktQW9MyxB8A==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 02/16] ARM: dts: microchip: Use new PMC bindings
Date: Mon, 10 Feb 2025 17:44:52 +0100
Message-Id: <20250210164506.495747-3-ada@thorsis.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250210164506.495747-1-ada@thorsis.com>
References: <20250210164506.495747-1-ada@thorsis.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The bindings were split up per SoC before adding new members for
missing clocks.

Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v2:
    - new patch, not present in v1

 arch/arm/boot/dts/microchip/sam9x60.dtsi  | 15 ++++++++-------
 arch/arm/boot/dts/microchip/sam9x7.dtsi   | 11 ++++++-----
 arch/arm/boot/dts/microchip/sama7d65.dtsi |  5 +++--
 arch/arm/boot/dts/microchip/sama7g5.dtsi  | 23 ++++++++++++-----------
 4 files changed, 29 insertions(+), 25 deletions(-)

diff --git a/arch/arm/boot/dts/microchip/sam9x60.dtsi b/arch/arm/boot/dts/microchip/sam9x60.dtsi
index b8b2c1ddf3f1e..1724b79967a17 100644
--- a/arch/arm/boot/dts/microchip/sam9x60.dtsi
+++ b/arch/arm/boot/dts/microchip/sam9x60.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/clock/at91.h>
+#include <dt-bindings/clock/microchip,sam9x60-pmc.h>
 #include <dt-bindings/mfd/at91-usart.h>
 #include <dt-bindings/mfd/atmel-flexcom.h>
 
@@ -81,9 +82,9 @@ usb0: gadget@500000 {
 			reg = <0x00500000 0x100000
 				0xf803c000 0x400>;
 			interrupts = <23 IRQ_TYPE_LEVEL_HIGH 2>;
-			clocks = <&pmc PMC_TYPE_PERIPHERAL 23>, <&pmc PMC_TYPE_CORE PMC_UTMI>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 23>, <&pmc PMC_TYPE_CORE SAM9X60_PMC_UTMI>;
 			clock-names = "pclk", "hclk";
-			assigned-clocks = <&pmc PMC_TYPE_CORE PMC_UTMI>;
+			assigned-clocks = <&pmc PMC_TYPE_CORE SAM9X60_PMC_UTMI>;
 			assigned-clock-rates = <480000000>;
 			status = "disabled";
 		};
@@ -101,9 +102,9 @@ usb2: ehci@700000 {
 			compatible = "atmel,at91sam9g45-ehci", "usb-ehci";
 			reg = <0x00700000 0x100000>;
 			interrupts = <22 IRQ_TYPE_LEVEL_HIGH 2>;
-			clocks = <&pmc PMC_TYPE_CORE PMC_UTMI>, <&pmc PMC_TYPE_PERIPHERAL 22>;
+			clocks = <&pmc PMC_TYPE_CORE SAM9X60_PMC_UTMI>, <&pmc PMC_TYPE_PERIPHERAL 22>;
 			clock-names = "usb_clk", "ehci_clk";
-			assigned-clocks = <&pmc PMC_TYPE_CORE PMC_UTMI>;
+			assigned-clocks = <&pmc PMC_TYPE_CORE SAM9X60_PMC_UTMI>;
 			assigned-clock-rates = <480000000>;
 			status = "disabled";
 		};
@@ -121,7 +122,7 @@ ebi: ebi@10000000 {
 				  0x3 0x0 0x40000000 0x10000000
 				  0x4 0x0 0x50000000 0x10000000
 				  0x5 0x0 0x60000000 0x10000000>;
-			clocks = <&pmc PMC_TYPE_CORE PMC_MCK>;
+			clocks = <&pmc PMC_TYPE_CORE SAM9X60_PMC_MCK>;
 			status = "disabled";
 
 			nand_controller: nand-controller {
@@ -1063,7 +1064,7 @@ hlcdc: hlcdc@f8038000 {
 				clocks = <&pmc PMC_TYPE_PERIPHERAL 25>, <&pmc PMC_TYPE_GCK 25>, <&clk32k 1>;
 				clock-names = "periph_clk","sys_clk", "slow_clk";
 				assigned-clocks = <&pmc PMC_TYPE_GCK 25>;
-				assigned-clock-parents = <&pmc PMC_TYPE_CORE PMC_MCK>;
+				assigned-clock-parents = <&pmc PMC_TYPE_CORE SAM9X60_PMC_MCK>;
 				status = "disabled";
 
 				hlcdc-display-controller {
@@ -1369,7 +1370,7 @@ pit: timer@fffffe40 {
 				compatible = "atmel,at91sam9260-pit";
 				reg = <0xfffffe40 0x10>;
 				interrupts = <1 IRQ_TYPE_LEVEL_HIGH 7>;
-				clocks = <&pmc PMC_TYPE_CORE PMC_MCK>;
+				clocks = <&pmc PMC_TYPE_CORE SAM9X60_PMC_MCK>;
 			};
 
 			clk32k: clock-controller@fffffe50 {
diff --git a/arch/arm/boot/dts/microchip/sam9x7.dtsi b/arch/arm/boot/dts/microchip/sam9x7.dtsi
index b217a908f5253..458cfb81f8bcf 100644
--- a/arch/arm/boot/dts/microchip/sam9x7.dtsi
+++ b/arch/arm/boot/dts/microchip/sam9x7.dtsi
@@ -8,6 +8,7 @@
  */
 
 #include <dt-bindings/clock/at91.h>
+#include <dt-bindings/clock/microchip,sam9x7-pmc.h>
 #include <dt-bindings/dma/at91.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -477,9 +478,9 @@ can0: can@f8000000 {
 			interrupt-names = "int0", "int1";
 			clocks = <&pmc PMC_TYPE_PERIPHERAL 29>, <&pmc PMC_TYPE_GCK 29>;
 			clock-names = "hclk", "cclk";
-			assigned-clocks = <&pmc PMC_TYPE_CORE PMC_UTMI>, <&pmc PMC_TYPE_GCK 29>;
+			assigned-clocks = <&pmc PMC_TYPE_CORE SAM9X7_PMC_UTMI>, <&pmc PMC_TYPE_GCK 29>;
 			assigned-clock-rates = <480000000>, <40000000>;
-			assigned-clock-parents = <&pmc PMC_TYPE_CORE PMC_UTMI>, <&pmc PMC_TYPE_CORE PMC_UTMI>;
+			assigned-clock-parents = <&pmc PMC_TYPE_CORE SAM9X7_PMC_UTMI>, <&pmc PMC_TYPE_CORE SAM9X7_PMC_UTMI>;
 			bosch,mram-cfg = <0x3400 0 0 64 0 0 32 32>;
 			status = "disabled";
 		};
@@ -493,9 +494,9 @@ can1: can@f8004000 {
 			interrupt-names = "int0", "int1";
 			clocks = <&pmc PMC_TYPE_PERIPHERAL 30>, <&pmc PMC_TYPE_GCK 30>;
 			clock-names = "hclk", "cclk";
-			assigned-clocks = <&pmc PMC_TYPE_CORE PMC_UTMI>, <&pmc PMC_TYPE_GCK 30>;
+			assigned-clocks = <&pmc PMC_TYPE_CORE SAM9X7_PMC_UTMI>, <&pmc PMC_TYPE_GCK 30>;
 			assigned-clock-rates = <480000000>, <40000000>;
-			assigned-clock-parents = <&pmc PMC_TYPE_CORE PMC_UTMI>, <&pmc PMC_TYPE_CORE PMC_UTMI>;
+			assigned-clock-parents = <&pmc PMC_TYPE_CORE SAM9X7_PMC_UTMI>, <&pmc PMC_TYPE_CORE SAM9X7_PMC_UTMI>;
 			bosch,mram-cfg = <0x7800 0 0 64 0 0 32 32>;
 			status = "disabled";
 		};
@@ -1100,7 +1101,7 @@ pmecc: ecc-engine@ffffe000 {
 		mpddrc: mpddrc@ffffe800 {
 			compatible = "microchip,sam9x7-ddramc", "atmel,sama5d3-ddramc";
 			reg = <0xffffe800 0x200>;
-			clocks = <&pmc PMC_TYPE_SYSTEM 2>, <&pmc PMC_TYPE_CORE PMC_MCK>;
+			clocks = <&pmc PMC_TYPE_SYSTEM 2>, <&pmc PMC_TYPE_CORE SAM9X7_PMC_MCK>;
 			clock-names = "ddrck", "mpddr";
 		};
 
diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
index 854b30d15dcd4..111a6a6ef0e00 100644
--- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
@@ -9,6 +9,7 @@
  */
 
 #include <dt-bindings/clock/at91.h>
+#include <dt-bindings/clock/microchip,sama7d65-pmc.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
@@ -29,7 +30,7 @@ cpu0: cpu@0 {
 			compatible = "arm,cortex-a7";
 			reg = <0x0>;
 			device_type = "cpu";
-			clocks = <&pmc PMC_TYPE_CORE PMC_CPUPLL>;
+			clocks = <&pmc PMC_TYPE_CORE SAMA7D65_PMC_CPUPLL>;
 			clock-names = "cpu";
 		};
 	};
@@ -91,7 +92,7 @@ sdmmc1: mmc@e1208000 {
 			clock-names = "hclock", "multclk";
 			assigned-clocks = <&pmc PMC_TYPE_GCK 76>;
 			assigned-clock-rates = <200000000>;
-			assigned-clock-parents = <&pmc PMC_TYPE_CORE PMC_MCK1>;
+			assigned-clock-parents = <&pmc PMC_TYPE_CORE SAMA7D65_PMC_MCK1>;
 			status = "disabled";
 		};
 
diff --git a/arch/arm/boot/dts/microchip/sama7g5.dtsi b/arch/arm/boot/dts/microchip/sama7g5.dtsi
index 17bcdcf0cf4a0..f68c2eb8edd54 100644
--- a/arch/arm/boot/dts/microchip/sama7g5.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7g5.dtsi
@@ -13,6 +13,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/at91.h>
+#include <dt-bindings/clock/microchip,sama7g5-pmc.h>
 #include <dt-bindings/dma/at91.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/mfd/at91-usart.h>
@@ -34,7 +35,7 @@ cpu0: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a7";
 			reg = <0x0>;
-			clocks = <&pmc PMC_TYPE_CORE PMC_CPUPLL>;
+			clocks = <&pmc PMC_TYPE_CORE SAMA7G5_PMC_CPUPLL>;
 			clock-names = "cpu";
 			operating-points-v2 = <&cpu_opp_table>;
 			#cooling-cells = <2>; /* min followed by max */
@@ -189,7 +190,7 @@ ebi: ebi@40000000 {
 				  0x1 0x0 0x48000000 0x8000000
 				  0x2 0x0 0x50000000 0x8000000
 				  0x3 0x0 0x58000000 0x8000000>;
-			clocks = <&pmc PMC_TYPE_CORE PMC_MCK1>;
+			clocks = <&pmc PMC_TYPE_CORE SAMA7G5_PMC_MCK1>;
 			status = "disabled";
 
 			nand_controller: nand-controller {
@@ -372,7 +373,7 @@ can0: can@e0828000 {
 			clocks = <&pmc PMC_TYPE_PERIPHERAL 61>, <&pmc PMC_TYPE_GCK 61>;
 			clock-names = "hclk", "cclk";
 			assigned-clocks = <&pmc PMC_TYPE_GCK 61>;
-			assigned-clock-parents = <&pmc PMC_TYPE_CORE PMC_SYSPLL>;
+			assigned-clock-parents = <&pmc PMC_TYPE_CORE SAMA7G5_PMC_SYSPLL>;
 			assigned-clock-rates = <40000000>;
 			bosch,mram-cfg = <0x3400 0 0 64 0 0 32 32>;
 			status = "disabled";
@@ -388,7 +389,7 @@ can1: can@e082c000 {
 			clocks = <&pmc PMC_TYPE_PERIPHERAL 62>, <&pmc PMC_TYPE_GCK 62>;
 			clock-names = "hclk", "cclk";
 			assigned-clocks = <&pmc PMC_TYPE_GCK 62>;
-			assigned-clock-parents = <&pmc PMC_TYPE_CORE PMC_SYSPLL>;
+			assigned-clock-parents = <&pmc PMC_TYPE_CORE SAMA7G5_PMC_SYSPLL>;
 			assigned-clock-rates = <40000000>;
 			bosch,mram-cfg = <0x7800 0 0 64 0 0 32 32>;
 			status = "disabled";
@@ -404,7 +405,7 @@ can2: can@e0830000 {
 			clocks = <&pmc PMC_TYPE_PERIPHERAL 63>, <&pmc PMC_TYPE_GCK 63>;
 			clock-names = "hclk", "cclk";
 			assigned-clocks = <&pmc PMC_TYPE_GCK 63>;
-			assigned-clock-parents = <&pmc PMC_TYPE_CORE PMC_SYSPLL>;
+			assigned-clock-parents = <&pmc PMC_TYPE_CORE SAMA7G5_PMC_SYSPLL>;
 			assigned-clock-rates = <40000000>;
 			bosch,mram-cfg = <0xbc00 0 0 64 0 0 32 32>;
 			status = "disabled";
@@ -420,7 +421,7 @@ can3: can@e0834000 {
 			clocks = <&pmc PMC_TYPE_PERIPHERAL 64>, <&pmc PMC_TYPE_GCK 64>;
 			clock-names = "hclk", "cclk";
 			assigned-clocks = <&pmc PMC_TYPE_GCK 64>;
-			assigned-clock-parents = <&pmc PMC_TYPE_CORE PMC_SYSPLL>;
+			assigned-clock-parents = <&pmc PMC_TYPE_CORE SAMA7G5_PMC_SYSPLL>;
 			assigned-clock-rates = <40000000>;
 			bosch,mram-cfg = <0x0 0 0 64 0 0 32 32>;
 			status = "disabled";
@@ -436,7 +437,7 @@ can4: can@e0838000 {
 			clocks = <&pmc PMC_TYPE_PERIPHERAL 65>, <&pmc PMC_TYPE_GCK 65>;
 			clock-names = "hclk", "cclk";
 			assigned-clocks = <&pmc PMC_TYPE_GCK 65>;
-			assigned-clock-parents = <&pmc PMC_TYPE_CORE PMC_SYSPLL>;
+			assigned-clock-parents = <&pmc PMC_TYPE_CORE SAMA7G5_PMC_SYSPLL>;
 			assigned-clock-rates = <40000000>;
 			bosch,mram-cfg = <0x4400 0 0 64 0 0 32 32>;
 			status = "disabled";
@@ -452,7 +453,7 @@ can5: can@e083c000 {
 			clocks = <&pmc PMC_TYPE_PERIPHERAL 66>, <&pmc PMC_TYPE_GCK 66>;
 			clock-names = "hclk", "cclk";
 			assigned-clocks = <&pmc PMC_TYPE_GCK 66>;
-			assigned-clock-parents = <&pmc PMC_TYPE_CORE PMC_SYSPLL>;
+			assigned-clock-parents = <&pmc PMC_TYPE_CORE SAMA7G5_PMC_SYSPLL>;
 			assigned-clock-rates = <40000000>;
 			bosch,mram-cfg = <0x8800 0 0 64 0 0 32 32>;
 			status = "disabled";
@@ -483,7 +484,7 @@ sdmmc0: mmc@e1204000 {
 			interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&pmc PMC_TYPE_PERIPHERAL 80>, <&pmc PMC_TYPE_GCK 80>;
 			clock-names = "hclock", "multclk";
-			assigned-clock-parents = <&pmc PMC_TYPE_CORE PMC_SYSPLL>;
+			assigned-clock-parents = <&pmc PMC_TYPE_CORE SAMA7G5_PMC_SYSPLL>;
 			assigned-clocks = <&pmc PMC_TYPE_GCK 80>;
 			assigned-clock-rates = <200000000>;
 			microchip,sdcal-inverted;
@@ -496,7 +497,7 @@ sdmmc1: mmc@e1208000 {
 			interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&pmc PMC_TYPE_PERIPHERAL 81>, <&pmc PMC_TYPE_GCK 81>;
 			clock-names = "hclock", "multclk";
-			assigned-clock-parents = <&pmc PMC_TYPE_CORE PMC_SYSPLL>;
+			assigned-clock-parents = <&pmc PMC_TYPE_CORE SAMA7G5_PMC_SYSPLL>;
 			assigned-clocks = <&pmc PMC_TYPE_GCK 81>;
 			assigned-clock-rates = <200000000>;
 			microchip,sdcal-inverted;
@@ -509,7 +510,7 @@ sdmmc2: mmc@e120c000 {
 			interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&pmc PMC_TYPE_PERIPHERAL 82>, <&pmc PMC_TYPE_GCK 82>;
 			clock-names = "hclock", "multclk";
-			assigned-clock-parents = <&pmc PMC_TYPE_CORE PMC_SYSPLL>;
+			assigned-clock-parents = <&pmc PMC_TYPE_CORE SAMA7G5_PMC_SYSPLL>;
 			assigned-clocks = <&pmc PMC_TYPE_GCK 82>;
 			assigned-clock-rates = <200000000>;
 			microchip,sdcal-inverted;
-- 
2.39.5

