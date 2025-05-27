Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F5C1DE2BD;
	Tue, 27 May 2025 06:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748325871; cv=none; b=ewwYQIMNz/slf+GUUf5ki/CFrEM2gW0X1NqEMDZE3R+Mczs5gpRFo0JkSUpHpiExu4BlIKrKqoacvFc/ivhFYvzu3tjXvidNEC7JDWBi5pTxgmyndd9gKcAjcNOXFtJowVOrg0PEfvNcQEjOaeuN1ejJkvfrcgOA/JPDtJsbxqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748325871; c=relaxed/simple;
	bh=+MyDwDF7YpR6gInr7nLfu4C02m2Ev6au7Gfgu/h8d4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TVNoeX8AU66HsXcGZYeTBVdI/c4z4EdiwzszggZzqkVYF83LLahebxDOZy6Gc39Oovn+ltmSWtAPMSrMYMZYQnHnRoRO4gOZnZzELAdku0xJWGFm0A4z1elG0xYwTGfpPR8jh6JBtsSpJaxuZJgHJMj3VEWyTdxYwM+EG0dvOgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=pOVkoaZX; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=bYKLLQNG reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="pOVkoaZX";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="bYKLLQNG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1748325868; x=1779861868;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pvGK2rNOyPO1TvWUTFHF9O2Y20/YigsXU5qydRTniyU=;
  b=pOVkoaZXhvUWXeCEH+NsASPNVS/IxdPmi79ODvIILYhBVGdkRmiWmzw+
   1v6HuvQZxIavnS3zeEBiXISutUOc6fTP8PiIyDe/phPEtrMITNE+lSEHX
   qHY8zk/oaY4rTWBe1lnejO0xNsyieQBhs+ZpKGziy7LK61VfQnlww7cHt
   MpGDTgcukJXWkRxsi2e1KqlEjFjVreEsRInc/aM3lCYEBBKkyTfshsaFF
   cFV8MmwAk6IVr/RdYkY6mCYsHMfeEYpsmKf0xsef0F/VT71R35YeHoBg2
   GuNxDMD1uE4uanjWaDpG97rw6qOQnMhkVIp6Knl+nlZIUJudYqKopdNnF
   A==;
X-CSE-ConnectionGUID: 5tWuRAahSEiBL9IZveDD1w==
X-CSE-MsgGUID: ZVORmZV8TBGJ1NRVT7LXNg==
X-IronPort-AV: E=Sophos;i="6.15,317,1739833200"; 
   d="scan'208";a="44300078"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 27 May 2025 08:04:24 +0200
X-CheckPoint: {683555E8-10-68AAF6F9-E177A1A4}
X-MAIL-CPID: E58F6C343C0AA601F992F16B005E6079_2
X-Control-Analysis: str=0001.0A006399.683555FD.0031,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A9E6116F316;
	Tue, 27 May 2025 08:04:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1748325860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pvGK2rNOyPO1TvWUTFHF9O2Y20/YigsXU5qydRTniyU=;
	b=bYKLLQNGdpcN037471k4p2A1SvSQ/YfIstVxn2JqzsuHYF8tXMvaFBm/3zqCRMPGKu8yyr
	3uJql1yMbjvp7r9rmzvm/Mm9DgKU6toZiIM3Jth2QqCVv90iOhJCc6EEimDUlORtsm2zKr
	XPn7W1KfGtOetKPkufcBZ/ihMqShmPvr1usTAwvGixt17j5Bs7zhjQJsh5BsqFXSWxZcun
	GM9qtSFgoIsy0VwFh65yRbQu3WhhTwBfBiIWAf9f9T1O4SDdEO2FD1+zP0Zhn5ASGsKHMb
	7sdO4Glfyb0ppnnH58HCCMy2dTg/JxUW8Hl7YGTvdB9VBKmziIpuu54tAVwnGw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Gregor Herburger <gregor.herburger@tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 2/2] arm64: dts: ls1028a: Add mbls1028a and mbls1028a-ind devicetrees
Date: Tue, 27 May 2025 08:03:55 +0200
Message-ID: <20250527060400.1005757-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250527060400.1005757-1-alexander.stein@ew.tq-group.com>
References: <20250527060400.1005757-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Gregor Herburger <gregor.herburger@tq-group.com>

Add device trees for the MBLS1028A and the MBLS1028A-IND and the SoM
TQMLS1028A.

Signed-off-by: Gregor Herburger <gregor.herburger@tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |   2 +
 .../fsl-ls1028a-tqmls1028a-mbls1028a-ind.dts  |  68 ++++
 .../fsl-ls1028a-tqmls1028a-mbls1028a.dts      | 118 +++++++
 .../fsl-ls1028a-tqmls1028a-mbls1028a.dtsi     | 291 ++++++++++++++++++
 .../dts/freescale/fsl-ls1028a-tqmls1028a.dtsi | 117 +++++++
 5 files changed, 596 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls1028a-ind.dts
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls1028a.dts
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls1028a.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a.dtsi

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 75ea65d718c1f..38674e4eeb4c3 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -16,6 +16,8 @@ dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1028a-kontron-sl28-var3-ads2.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1028a-kontron-sl28-var4.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1028a-qds.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1028a-rdb.dtb
+dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1028a-tqmls1028a-mbls1028a.dtb
+dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1028a-tqmls1028a-mbls1028a-ind.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1043a-qds.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1043a-rdb.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1043a-tqmls1043a-mbls10xxa.dtb
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls1028a-ind.dts b/arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls1028a-ind.dts
new file mode 100644
index 0000000000000..fb735c5d475ad
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls1028a-ind.dts
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright 2019-2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Michael Krummsdorf
+ * Author: Matthias Schiffer
+ * Author: Alexander Stein
+ */
+
+/dts-v1/;
+
+#include "fsl-ls1028a-tqmls1028a-mbls1028a.dtsi"
+
+/ {
+	model = "MBLS1028A-IND starterkit";
+	compatible = "tq,ls1028a-tqmls1028a-mbls1028a-ind", "tq,ls1028a-tqmls1028a", "fsl,ls1028a";
+};
+
+&i2c5 {
+	gpio_exp_3v3: gpio@71 {
+		compatible = "nxp,pca9538";
+		reg = <0x71>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		clk-intn-hog {
+			gpio-hog;
+			gpios = <0 GPIO_ACTIVE_HIGH>;
+			input;
+			line-name = "CLK_INT#";
+		};
+
+		mpcie-waken-hog {
+			gpio-hog;
+			gpios = <2 GPIO_ACTIVE_HIGH>;
+			input;
+			line-name = "MPCIE_WAKE#";
+		};
+
+		mpcie-disn-hog {
+			gpio-hog;
+			gpios = <3 GPIO_ACTIVE_HIGH>;
+			output-high;
+			line-name = "MPCIE_DIS#";
+		};
+
+		mpcie-rstn-hog {
+			gpio-hog;
+			gpios = <4 GPIO_ACTIVE_HIGH>;
+			output-high;
+			line-name = "MPCIE_RST#";
+		};
+
+		sata-perstn-hog {
+			gpio-hog;
+			gpios = <6 GPIO_ACTIVE_HIGH>;
+			output-high;
+			line-name = "SATA_PERST#";
+		};
+
+		dcdc-reset-hog {
+			gpio-hog;
+			gpios = <7 GPIO_ACTIVE_HIGH>;
+			output-low;
+			line-name = "DCDC_RESET";
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls1028a.dts b/arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls1028a.dts
new file mode 100644
index 0000000000000..c5590c6d23995
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls1028a.dts
@@ -0,0 +1,118 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright 2019-2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Michael Krummsdorf
+ * Author: Matthias Schiffer
+ * Author: Alexander Stein
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+#include "fsl-ls1028a-tqmls1028a-mbls1028a.dtsi"
+
+/ {
+	model = "MBLS1028A starterkit";
+	compatible = "tq,ls1028a-tqmls1028a-mbls1028a", "tq,ls1028a-tqmls1028a", "fsl,ls1028a";
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		autorepeat;
+
+		button-0 {
+			label = "S4";
+			linux,code = <BTN_0>;
+			gpios = <&gpio_exp_3v3 11 GPIO_ACTIVE_LOW>;
+		};
+
+		button-1 {
+			label = "S5";
+			linux,code = <BTN_1>;
+			gpios = <&gpio_exp_3v3 12 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	gpio-beeper {
+		compatible = "gpio-beeper";
+		gpios = <&gpio_exp_3v3 15 GPIO_ACTIVE_HIGH>;
+	};
+
+	gpio-leds {
+		compatible = "gpio-leds";
+
+		led-1 {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <1>;
+			gpios = <&gpio_exp_3v3 14 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "default-on";
+		};
+
+		led-2 {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_HEARTBEAT;
+			gpios = <&gpio_exp_3v3 13 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+		};
+	};
+};
+
+&i2c5 {
+	gpio_exp_3v3: gpio@25 {
+		compatible = "nxp,pca9555";
+		reg = <0x25>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <30 IRQ_TYPE_LEVEL_LOW>;
+		vcc-supply = <&reg_3p3v>;
+
+		clk-intn-hog {
+			gpio-hog;
+			gpios = <0 GPIO_ACTIVE_HIGH>;
+			input;
+			line-name = "CLK_INT#";
+		};
+
+		mpcie-waken-hog {
+			gpio-hog;
+			gpios = <2 GPIO_ACTIVE_HIGH>;
+			input;
+			line-name = "MPCIE_WAKE#";
+		};
+
+		mpcie-disn-hog {
+			gpio-hog;
+			gpios = <3 GPIO_ACTIVE_HIGH>;
+			output-high;
+			line-name = "MPCIE_DIS#";
+		};
+
+		mpcie-rstn-hog {
+			gpio-hog;
+			gpios = <4 GPIO_ACTIVE_HIGH>;
+			output-high;
+			line-name = "MPCIE_RST#";
+		};
+
+		sata-perstn-hog {
+			gpio-hog;
+			gpios = <6 GPIO_ACTIVE_HIGH>;
+			output-high;
+			line-name = "SATA_PERST#";
+		};
+	};
+};
+
+&gpio_exp_1v8 {
+	dcdc-reset-hog {
+		gpio-hog;
+		gpios = <6 GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "DCDC_RESET";
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls1028a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls1028a.dtsi
new file mode 100644
index 0000000000000..6261100f3413a
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls1028a.dtsi
@@ -0,0 +1,291 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright 2019-2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Michael Krummsdorf
+ * Author: Matthias Schiffer
+ * Author: Alexander Stein
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/net/ti-dp83867.h>
+#include "fsl-ls1028a-tqmls1028a.dtsi"
+
+/ {
+	aliases {
+		gpio0 = &gpio1;
+		gpio1 = &gpio2;
+		gpio2 = &gpio3;
+
+		crypto = &crypto;
+
+		mmc0 = &esdhc; /* SD-Card */
+		mmc1 = &esdhc1; /* eMMC */
+
+		serial0 = &duart0;
+		serial1 = &duart1;
+	};
+
+	chosen {
+		stdout-path = &duart0;
+	};
+
+	reg_1p8v: regulator-1p8v {
+		compatible = "regulator-fixed";
+		regulator-name = "V_1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	reg_3p3v: regulator-3p3v {
+		compatible = "regulator-fixed";
+		regulator-name = "V_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		/* global autoconfigured region for contiguous allocations */
+		linux,cma {
+			compatible = "shared-dma-pool";
+			reusable;
+			/* 256 MiB */
+			size = <0 0x10000000>;
+			linux,cma-default;
+		};
+	};
+};
+
+&can0 {
+	status = "okay";
+};
+
+&can1 {
+	status = "okay";
+};
+
+&dspi2 {
+	bus-num = <2>;
+	status = "okay";
+};
+
+&duart0 {
+	status = "okay";
+};
+
+&duart1 {
+	status = "okay";
+};
+
+&esdhc {
+	cd-gpios = <&gpio1 31 GPIO_ACTIVE_LOW>;
+	disable-wp;
+	no-mmc;
+	no-sdio;
+	no-1-8-v;
+	bus-width = <4>;
+	status = "okay";
+};
+
+/* When switched to baseboard-internal i2c bus,
+ * IIC5 has access to the following devices.
+ */
+&i2c4 {
+	status = "okay";
+
+	/* SI5338 - set up in U-Boot */
+	/* clockgen@70 */
+};
+
+&i2c5 {
+	status = "okay";
+
+	gpio_exp_1v8: gpio@70 {
+		compatible = "nxp,pca9538";
+		reg = <0x70>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <30 IRQ_TYPE_LEVEL_LOW>;
+		vcc-supply = <&reg_1p8v>;
+
+		ec1-intn-hog {
+			gpio-hog;
+			gpios = <0 0>;
+			input;
+			line-name = "EC1_INT#";
+		};
+
+		sgmii-intn-hog {
+			gpio-hog;
+			gpios = <2 0>;
+			input;
+			line-name = "SGMII_INT#";
+		};
+
+		qsgmii-intn-hog {
+			gpio-hog;
+			gpios = <4 0>;
+			input;
+			line-name = "QSGMII_INT#";
+		};
+
+		qsgmii-rstn-hog {
+			gpio-hog;
+			gpios = <5 0>;
+			output-high;
+			line-name = "QSGMII_RESET#";
+		};
+	};
+};
+
+&enetc_mdio_pf3 {
+	mdio0_rgmii_phy00: ethernet-phy@0 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0x00>;
+		reset-gpios = <&gpio_exp_1v8 1 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <1>;
+		reset-deassert-us = <200>;
+		interrupt-parent = <&gpio_exp_1v8>;
+		interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
+		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_50_NS>;
+		ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
+		ti,led-function = <0x05b0>;
+		ti,led-ctrl = <0x1001>;
+		ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
+		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
+	};
+
+	mdio0_sgmii_phy03: ethernet-phy@3 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0x03>;
+		reset-gpios = <&gpio_exp_1v8 3 GPIO_ACTIVE_LOW>;
+		/*
+		 * Long reset to work around PHY incorrect strap pin sampling
+		 * due to external capacitors for SGMII
+		 */
+		reset-assert-us = <2500>;
+		reset-deassert-us = <200>;
+		interrupt-parent = <&gpio_exp_1v8>;
+		interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
+		ti,led-function = <0x05b0>;
+		ti,led-ctrl = <0x1001>;
+		ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
+		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
+	};
+
+	qsgmii_phy1: ethernet-phy@1c {
+		reg = <0x1c>;
+	};
+
+	qsgmii_phy2: ethernet-phy@1d {
+		reg = <0x1d>;
+	};
+
+	qsgmii_phy3: ethernet-phy@1e {
+		reg = <0x1e>;
+	};
+
+	qsgmii_phy4: ethernet-phy@1f {
+		reg = <0x1f>;
+	};
+};
+
+&enetc_port0 {
+	phy-handle = <&mdio0_sgmii_phy03>;
+	phy-mode = "sgmii";
+	managed = "in-band-status";
+	status = "okay";
+};
+
+&enetc_port1 {
+	phy-handle = <&mdio0_rgmii_phy00>;
+	phy-mode = "rgmii-id";
+	status = "okay";
+};
+
+&enetc_port2 {
+	status = "okay";
+};
+
+&mscc_felix {
+	status = "okay";
+};
+
+/* l2switch ports */
+&mscc_felix_port0 {
+	phy-handle = <&qsgmii_phy1>;
+	phy-mode = "qsgmii";
+	status = "okay";
+};
+
+&mscc_felix_port1 {
+	phy-handle = <&qsgmii_phy2>;
+	phy-mode = "qsgmii";
+	status = "okay";
+};
+
+&mscc_felix_port2 {
+	phy-handle = <&qsgmii_phy3>;
+	phy-mode = "qsgmii";
+	status = "okay";
+};
+
+&mscc_felix_port3 {
+	phy-handle = <&qsgmii_phy4>;
+	phy-mode = "qsgmii";
+	status = "okay";
+};
+
+&mscc_felix_port4 {
+	ethernet = <&enetc_port2>;
+	status = "okay";
+};
+
+&pcie2 {
+	status = "okay";
+};
+
+&sata {
+	status = "okay";
+};
+
+&usb0 {
+	/* dual role is implemented, but not a full featured OTG */
+	hnp-disable;
+	srp-disable;
+	adp-disable;
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&usb1 {
+	dr_mode = "host";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	hub_2_0: hub@1 {
+		compatible = "usb451,8142";
+		reg = <1>;
+		peer-hub = <&hub_3_0>;
+		reset-gpios = <&gpio_exp_3v3 1 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&reg_3p3v>;
+	};
+
+	hub_3_0: hub@2 {
+		compatible = "usb451,8140";
+		reg = <2>;
+		peer-hub = <&hub_2_0>;
+		reset-gpios = <&gpio_exp_3v3 1 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&reg_3p3v>;
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a.dtsi
new file mode 100644
index 0000000000000..69aa36a3a0523
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a.dtsi
@@ -0,0 +1,117 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright 2019-2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Michael Krummsdorf
+ * Author: Matthias Schiffer
+ * Author: Alexander Stein
+ */
+
+#include "fsl-ls1028a.dtsi"
+
+/ {
+	compatible = "tq,ls1028a-tqmls1028a", "fsl,ls1028a";
+
+	reg_1p8v_som: regulator-1p8v-som {
+		compatible = "regulator-fixed";
+		regulator-name = "1P8V_SOM";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	reg_3p3v_som: regulator-3p3v-som {
+		compatible = "regulator-fixed";
+		regulator-name = "3P3V_SOM";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	thermal-zones {
+		/delete-node/ ddr-controller;
+
+		cluster-thermal {
+			thermal-sensors = <&sa56004_4c 1>;
+		};
+	};
+};
+
+&esdhc1 {
+	no-sdio;
+	no-sd;
+	non-removable;
+	mmc-hs200-1_8v;
+	mmc-hs400-1_8v;
+	mmc-ddr-1_8v;
+	bus-width = <8>;
+	status = "okay";
+};
+
+&fspi {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <100000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+		vcc-supply = <&reg_1p8v_som>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+	};
+};
+
+&i2c0 {
+	status = "okay";
+
+	js42_18: temperature-sensor@18 {
+		compatible = "nxp,se97b", "jedec,jc-42.4-temp";
+		reg = <0x18>;
+	};
+
+	sa56004_4c: temperature-sensor@4c {
+		compatible = "nxp,sa56004";
+		reg = <0x4c>;
+		#thermal-sensor-cells = <1>;
+		vcc-supply = <&reg_3p3v_som>;
+	};
+
+	se97_50: eeprom@50 {
+		compatible = "nxp,se97b", "atmel,24c02";
+		read-only;
+		reg = <0x50>;
+		pagesize = <16>;
+		vcc-supply = <&reg_3p3v_som>;
+	};
+
+	rtc1: rtc@51 {
+		compatible = "nxp,pcf85063a";
+		reg = <0x51>;
+		quartz-load-femtofarads = <12500>;
+	};
+
+	m24c256_57: eeprom@57 {
+		compatible = "atmel,24c256";
+		reg = <0x57>;
+		pagesize = <32>;
+		vcc-supply = <&reg_3p3v_som>;
+	};
+};
+
+/*
+ * We use a separate sensor IC to measure core temperature. Disable the TMU
+ * as its driver can cause log spam outside of its measurement range (0-125C).
+ *
+ * Will have to be reevaluated if this DTS is ported to a mainline kernel,
+ * as both sensors of the TMU are referenced by the default LS1028A
+ * thermal-zones definitions there.
+ */
+&tmu {
+	status = "disabled";
+};
-- 
2.43.0

