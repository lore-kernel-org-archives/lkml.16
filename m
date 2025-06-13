Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726882DA75C;
	Fri, 13 Jun 2025 07:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749801593; cv=none; b=BDhUXSo8sJ9mM1a+S6A1CJoulqpqFbILmw1VF4rGYx9XKU0/27zKkFeYaR1lQGjMRrc/7ksP3D4Kx3+JQvDZzQFJArEuHFoyVL4MmdeB6uepGZk559FOHy6Kh0I+51FNvauHmcUEcZIYas6Df4apSKu9xMm3a7zeKUvpn7IKj6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749801593; c=relaxed/simple;
	bh=xBxUN5GAr/TqYT5vMFFdZYGF4ewLegPajzxTnH2xoGE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S8t0UflLUePYFxRtpODFkwJNV/H/JVwgv4zXyC55WYieKDEy8fQ5hOLVGEvhDfjPueZpVElFJtkMBVwn0V70EImUhHoNSfCjbP7Fl4HG9DYRui/qbLXDbSm801EW86OU7J0tg3bCYIsX8KDdT2se4E8bneIRRtwdM1Z/nttsTMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=BlKD0THh; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=rsTBBsrn reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="BlKD0THh";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="rsTBBsrn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1749801590; x=1781337590;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=M8oYF/zKu55EfyhRo4p5SOvUM7BgSGwOy5LzKQe2psc=;
  b=BlKD0THhoa56za8bFsLcEAm1bv+qKuKGVfUi6t5ym6fp15BtpKDaIFEg
   kVZpxP1DY1VF84sxbVxvExDqb0Nb/OnPK8WiwxYspbDoN0ZT6X3pug34c
   +WOBtgJcyHxjSE6n+IH+LB4FUeOx9O47JjkAlCk0ngrdJFR0HQv8bkjg8
   EbzRjtEJqqaAdMobDctENEjvrI3804+m934zflOX3T/r83D2JYOnTK/MF
   whO68PRNBCIrWH6LUfWf4A7apiiCex2vGIiawGvXHRh3kUoIpedmTClhC
   RsY6Wr5iSL1qdjn55xmrV2mZgM4GlSSd6vjL1HVslDD77b5hDxaECNmEV
   g==;
X-CSE-ConnectionGUID: 9ThCBqA2Ru27/fmUtq0OVw==
X-CSE-MsgGUID: wVbWjynLTv6QIXhA/IhiLg==
X-IronPort-AV: E=Sophos;i="6.16,233,1744063200"; 
   d="scan'208";a="44619243"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 13 Jun 2025 09:59:43 +0200
X-CheckPoint: {684BDA6F-21-569BE4A0-ECC5EE08}
X-MAIL-CPID: 5032A95172478A0E0917FB6A45FF61CC_3
X-Control-Analysis: str=0001.0A006398.684BDA95.0006,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 018AF163371;
	Fri, 13 Jun 2025 09:59:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1749801579;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M8oYF/zKu55EfyhRo4p5SOvUM7BgSGwOy5LzKQe2psc=;
	b=rsTBBsrnD+bU8bnCaS3Z3lMmExdwwHK9e9Z5hvLSMOsPBiKG4vc7hguOkPVGZY30f6Q+PC
	ceUFFiyRf2YdLsNawzSRuZadtLhH+gPC+es08Plr9HQKrHjEo7So9uLsOM9FaLw5XhzF0m
	3JwZTSF4AdpeaoNTuIHawzLfuspCNdfXNswg968uP8g1Pk7oDX/0sPaayUZiDip8ulbzjh
	tfJVECngaX5qlYYHc0eAO6puFKZ0p5lk+wk5HlyBWq3AahJ6pHbnJhkxzSLd1rtYVz6nxK
	B/w9OjOC3MU4PJV+/nDz+GNRnsOgrz5wMlC6ayfcpDunGewRl61SFyKTYRSK2w==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Matthias Schiffer <matthias.schiffer@tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	Max Merchel <Max.Merchel@tq-group.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH v3 2/2] arm64: dts: ls1012a: add DTS for TQMLS1012al module with MBLS1012AL board
Date: Fri, 13 Jun 2025 09:59:25 +0200
Message-ID: <20250613075927.392499-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613075927.392499-1-alexander.stein@ew.tq-group.com>
References: <20250613075927.392499-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Matthias Schiffer <matthias.schiffer@tq-group.com>

Add initial support for TQMLS1012AL module mounted on MBLS1012AL.
It supports UART1 for console, PCIe, I2C, USB, µSD card (default), SATA
and QSPI.
There is an alternative ordering option which provides an eMMC instead of
an SD card. This uses a different DT instead.
Due missing Packet Forwarding Engine (PFE) driver support, there is no
support for Ethernet so far.

Signed-off-by: Max Merchel <Max.Merchel@tq-group.com>
Signed-off-by: Matthias Schiffer <matthias.schiffer@tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v3:
* Sorted i2c nodes according their address
* Delete SD card specific properties from eMMC configuration
* Remove duplicated properties
* Sorted alias entries alphabetically
* Add 1.8V vcc supply for SPINOR flash
* Implement PCIE and WLAN power supplies as regulator, both 1.8V and 3.3V
* Rename regulators accordingly to the power rail signal name
* Renamed GPIO expander node names (gpio@)

Changes in v2:
* Be a bit more specific with lm75 compatible
* Remove m25p,fast-read from spi-nor flash

 arch/arm64/boot/dts/freescale/Makefile        |   2 +
 ...sl-ls1012a-tqmls1012al-mbls1012al-emmc.dts |  23 ++
 .../fsl-ls1012a-tqmls1012al-mbls1012al.dts    | 362 ++++++++++++++++++
 .../freescale/fsl-ls1012a-tqmls1012al.dtsi    |  81 ++++
 4 files changed, 468 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1012a-tqmls1012al-mbls1012al-emmc.dts
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1012a-tqmls1012al-mbls1012al.dts
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1012a-tqmls1012al.dtsi

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 444acd95cd6ac..75ea65d718c1f 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -5,6 +5,8 @@ dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1012a-frwy.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1012a-oxalis.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1012a-qds.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1012a-rdb.dtb
+dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1012a-tqmls1012al-mbls1012al.dtb
+dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1012a-tqmls1012al-mbls1012al-emmc.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1028a-kontron-kbox-a-230-ls.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1028a-kontron-sl28.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1028a-kontron-sl28-var1.dtb
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1012a-tqmls1012al-mbls1012al-emmc.dts b/arch/arm64/boot/dts/freescale/fsl-ls1012a-tqmls1012al-mbls1012al-emmc.dts
new file mode 100644
index 0000000000000..07026b067320f
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1012a-tqmls1012al-mbls1012al-emmc.dts
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (c) 2018-2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Matthias Schiffer
+ * Author: Max Merchel
+ */
+
+#include "fsl-ls1012a-tqmls1012al-mbls1012al.dts"
+
+&esdhc0 {
+	vqmmc-supply = <&reg_1v8>;
+	/delete-property/ no-mmc;
+	/delete-property/ sd-uhs-sdr12;
+	/delete-property/ sd-uhs-sdr25;
+	/delete-property/ sd-uhs-sdr50;
+	/delete-property/ sd-uhs-sdr104;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	no-sd;
+	voltage-ranges = <1800 1800>;
+	non-removable;
+};
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1012a-tqmls1012al-mbls1012al.dts b/arch/arm64/boot/dts/freescale/fsl-ls1012a-tqmls1012al-mbls1012al.dts
new file mode 100644
index 0000000000000..b22da107c702f
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1012a-tqmls1012al-mbls1012al.dts
@@ -0,0 +1,362 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (c) 2018-2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Matthias Schiffer
+ * Author: Max Merchel
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/net/ti-dp83867.h>
+#include "fsl-ls1012a-tqmls1012al.dtsi"
+
+/ {
+	model = "TQ-Systems TQMLS1012AL on MBLS1012AL";
+	compatible = "tq,ls1012a-tqmls1012al-mbls1012al", "tq,ls1012a-tqmls1012al", "fsl,ls1012a";
+	chassis-type = "embedded";
+
+	aliases {
+		/* use MAC from U-Boot environment */
+		/* TODO: PFE */
+		ethernet2 = &swport0;
+		ethernet3 = &swport1;
+		ethernet4 = &swport2;
+		ethernet5 = &swport3;
+		serial0 = &duart0;
+		spi0 = &qspi;
+	};
+
+	chosen {
+		stdout-path = &duart0;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		autorepeat;
+
+		switch-1 {
+			label = "S2";
+			linux,code = <BTN_0>;
+			gpios = <&gpio_exp_3p3v 13 GPIO_ACTIVE_LOW>;
+		};
+
+		switch-2 {
+			label = "X15";
+			linux,code = <BTN_1>;
+			gpios = <&gpio_exp_1p8v 5 GPIO_ACTIVE_LOW>;
+		};
+
+		switch-3 {
+			label = "X16";
+			linux,code = <BTN_2>;
+			gpios = <&gpio_exp_1p8v 4 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	gpio-leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_HEARTBEAT;
+			gpios = <&gpio_exp_3p3v 14 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "heartbeat";
+		};
+
+		led-1 {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_STATUS;
+			gpios = <&gpio_exp_3p3v 15 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "default-on";
+		};
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
+			/* 64 MiB */
+			size = <0 0x04000000>;
+			/*  512 - 128 MiB, our minimum RAM config will be 512 MiB */
+			alloc-ranges = <0 0x80000000 0 0x98000000>;
+			linux,cma-default;
+		};
+	};
+
+	reg_1v5: regulator-1v5 {
+		compatible = "regulator-fixed";
+		regulator-name = "V_1V5";
+		regulator-min-microvolt = <1500000>;
+		regulator-max-microvolt = <1500000>;
+		regulator-always-on;
+	};
+
+	reg_1p5v_pcie: regulator-1p5v-pcie {
+		compatible = "regulator-fixed";
+		regulator-name = "V_1V5_PCIE";
+		regulator-min-microvolt = <1500000>;
+		regulator-max-microvolt = <1500000>;
+		regulator-always-on;
+		gpio = <&gpio_exp_1p8v 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&reg_1v5>;
+	};
+
+	reg_1p5v_wlan: regulator-1p5v-wlan {
+		compatible = "regulator-fixed";
+		regulator-name = "V_1V5_WLAN";
+		regulator-min-microvolt = <1500000>;
+		regulator-max-microvolt = <1500000>;
+		regulator-always-on;
+		gpio = <&gpio_exp_1p8v 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&reg_1v5>;
+	};
+
+	reg_1v8: regulator-1p8v {
+		compatible = "regulator-fixed";
+		regulator-name = "V_1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	reg_3v3: regulator-3p3v {
+		compatible = "regulator-fixed";
+		regulator-name = "3P3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	reg_3v3_pcie: regulator-3v3-pcie {
+		compatible = "regulator-fixed";
+		regulator-name = "V_3V3_PCIE";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		gpio = <&gpio_exp_3p3v 3 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&reg_3v3>;
+	};
+
+	reg_3v3_wlan: regulator-3v3-wlan {
+		compatible = "regulator-fixed";
+		regulator-name = "V_3V3_WLAN";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		gpio = <&gpio_exp_3p3v 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&reg_3v3>;
+	};
+};
+
+&duart0 {
+	status = "okay";
+};
+
+&esdhc0 {
+	vmmc-supply = <&reg_3v3>;
+	no-mmc;
+	no-sdio;
+	disable-wp;
+	sd-uhs-sdr12;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};
+
+&i2c0 {
+	gpio_exp_3p3v: gpio@20 {
+		compatible = "nxp,pca9555";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		vcc-supply = <&reg_3v3>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <24 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		gpio-line-names = "", "", "GPIO_3V3_3", "",
+				  "", "", "", "",
+				  "", "GPIO_3V3_1", "GPIO_3V3_2", "",
+				  "", "", "", "";
+
+		wlan-disable-hog {
+			gpio-hog;
+			gpios = <0 GPIO_ACTIVE_HIGH>;
+			output-high;
+			line-name = "WLAN_DISABLE#";
+		};
+
+		pcie-rst-hog {
+			gpio-hog;
+			gpios = <4 GPIO_ACTIVE_HIGH>;
+			output-high;
+			line-name = "PCIE_RST#";
+		};
+
+		wlan-rst-hog {
+			gpio-hog;
+			gpios = <5 GPIO_ACTIVE_HIGH>;
+			output-high;
+			line-name = "WLAN_RST#";
+		};
+
+		pcie-dis-hog {
+			gpio-hog;
+			gpios = <11 GPIO_ACTIVE_HIGH>;
+			output-high;
+			line-name = "PCIE_DIS#";
+		};
+
+		pcie-wake-hog {
+			gpio-hog;
+			gpios = <12 GPIO_ACTIVE_HIGH>;
+			input;
+			line-name = "PCIE_WAKE#";
+		};
+	};
+
+	lm75_48: temperature-sensor@48 {
+		compatible = "national,lm75a";
+		reg = <0x48>;
+		vs-supply = <&reg_3v3>;
+	};
+
+	switch@5f {
+		compatible = "microchip,ksz9897";
+		reg = <0x5f>;
+		reset-gpios = <&gpio_exp_3p3v 7 GPIO_ACTIVE_LOW>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			swport0: port@0 {
+				reg = <0>;
+				label = "swp0";
+				phy-mode = "internal";
+			};
+
+			swport1: port@1 {
+				reg = <1>;
+				label = "swp1";
+				phy-mode = "internal";
+			};
+
+			swport2: port@2 {
+				reg = <2>;
+				label = "swp2";
+				phy-mode = "internal";
+			};
+
+			swport3: port@3 {
+				reg = <3>;
+				label = "swp3";
+				phy-mode = "internal";
+			};
+
+			port@6 {
+				reg = <6>;
+				label = "cpu";
+				/* TODO: PFE */
+				phy-mode = "rgmii-id";
+				rx-internal-delay-ps = <1500>;
+				tx-internal-delay-ps = <1500>;
+
+				fixed-link {
+					speed = <1000>;
+					full-duplex;
+				};
+			};
+		};
+	};
+
+	gpio_exp_1p8v: gpio@70 {
+		compatible = "nxp,pca9538";
+		reg = <0x70>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		vcc-supply = <&reg_1v8>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <27 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		gpio-line-names = "PCIE_CLK_PD#", "PMIC_INT#", "ETH_SW_INT#", "",
+				  "", "", "", "",
+				  "", "GPIO_3V3_1", "GPIO_3V3_2", "",
+				  "", "", "", "";
+
+		/* do not change PCIE_CLK_PD */
+		pcie-clk-pd-hog {
+			gpio-hog;
+			gpios = <0 GPIO_ACTIVE_HIGH>;
+			output-high;
+			line-name = "PCIE_CLK_PD#";
+		};
+
+		pmic-int-hog {
+			gpio-hog;
+			gpios = <1 GPIO_ACTIVE_HIGH>;
+			input;
+			line-name = "PMIC_INT#";
+		};
+
+		eth-sw-int-hog {
+			gpio-hog;
+			gpios = <2 GPIO_ACTIVE_HIGH>;
+			input;
+			line-name = "ETH_SW_INT#";
+		};
+
+		eth-link-pwrdwn-hog {
+			gpio-hog;
+			gpios = <3 GPIO_ACTIVE_HIGH>;
+			input;
+			line-name = "ETH_LINK_PWRDWN#";
+		};
+	};
+};
+
+&pcie1 {
+	status = "okay";
+};
+
+/* TODO: PFE */
+
+&sata {
+	status = "okay";
+};
+
+&usb0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	hub_2_0: hub@1 {
+		compatible = "usb451,8142";
+		reg = <1>;
+		peer-hub = <&hub_3_0>;
+		reset-gpios = <&gpio_exp_3p3v 6 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&reg_vcc_3v3>;
+	};
+
+	hub_3_0: hub@2 {
+		compatible = "usb451,8140";
+		reg = <2>;
+		peer-hub = <&hub_2_0>;
+		reset-gpios = <&gpio_exp_3p3v 6 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&reg_vcc_3v3>;
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1012a-tqmls1012al.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1012a-tqmls1012al.dtsi
new file mode 100644
index 0000000000000..7c5a3dee91b98
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1012a-tqmls1012al.dtsi
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (c) 2018-2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Matthias Schiffer
+ * Author: Max Merchel
+ */
+
+#include "fsl-ls1012a.dtsi"
+
+/ {
+	compatible = "tq,ls1012a-tqmls1012al", "fsl,ls1012a";
+
+	memory@80000000 {
+		device_type = "memory";
+		/*  our minimum RAM config will be 512 MiB */
+		reg = <0x00000000 0x80000000 0 0x20000000>;
+	};
+
+	reg_vcc_1v8: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC_1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	reg_vcc_3v3: regulator-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+};
+
+&i2c0 {
+	status = "okay";
+
+	jc42_19: temperature-sensor@19 {
+		compatible = "nxp,se97b", "jedec,jc-42.4-temp";
+		reg = <0x19>;
+	};
+
+	m24c64_50: eeprom@50 {
+		compatible = "atmel,24c64";
+		reg = <0x50>;
+		pagesize = <32>;
+		vcc-supply = <&reg_vcc_3v3>;
+	};
+
+	m24c02_51: eeprom@51 {
+		compatible = "nxp,se97b", "atmel,24c02";
+		reg = <0x51>;
+		pagesize = <16>;
+		read-only;
+		vcc-supply = <&reg_vcc_3v3>;
+	};
+
+	rtc1: rtc@68 {
+		compatible = "dallas,ds1339";
+		reg = <0x68>;
+	};
+};
+
+&qspi {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <39000000>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <1>;
+		vcc-supply = <&reg_vcc_1v8>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+	};
+};
-- 
2.43.0

