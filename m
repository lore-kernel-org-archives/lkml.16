Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B536E25A331;
	Wed, 30 Apr 2025 12:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746014794; cv=none; b=WtEgH6OWd8xm9R17wGXW9TrAcm2iqNJljlG5WAtF7QtbPbtxeE/TkFo4bpvYGFhym7hUSv8aCotRW+l/fu2QtjPGDDWiOrwohHROckrv3BEeD806Bse0DvnfLL8K6CMSLCrSXKcSTZ9SnoRkSTrgaE4d79IymI++/sGYszkx/Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746014794; c=relaxed/simple;
	bh=8sY32Ocai8UTD6nKl/Ayid+R66WMQ0S7xjPYvjjWZx4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b3yDfv29ZwC8LZNevFhGJZyMHbDOAr294Wx0LmMMgh5hcTWdSDZG5agOLLM8IUJmx+/BnUZMOH4F9ncL8YasHtmTfsQmvGa8r2LZxwL2rDEouJcp3UW++hum0mIqFgsXEdDuSL7H2lv7txYR0XW/PJQCpUp8BVUQhVE+wWQ9u8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=VqT+q747; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=T0LOk/CI reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="VqT+q747";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="T0LOk/CI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1746014792; x=1777550792;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Xa3mNEfdhrIDOlxo7TVXevfB9pnUglXcunIlDPViRFQ=;
  b=VqT+q747xOndpuEg2Nariue+xoO97VUF68A2JvsTN7vScPEywkk+aSGx
   x1WnX2LQfQKpTcSxr6CRbfuzdigEJD40/LRuLTxTUFGUThbLEXZDf8m34
   +ey+VYs7RHYPZdCklQi/YJNcdEB/dPyV26lbo8cbl8kNt+mZvpIcNsGCz
   0fc6gzifPfYn1KjChB8M/ARqj3pskwI6/sh385iEl+KsUl5s6rkYA4uJB
   crDWmtKzub75vWbtxzFN/vxnElf/ZtuZv8P5bJD8GCftRK9OVwxnUttyO
   nBb1T13tBoXEo7Pp6QnlPI738Q8PhTHQGAB+UKPcSAP7R0YVa2idE2Mvn
   A==;
X-CSE-ConnectionGUID: b8CHd4I3STOBD7Z2EViVTQ==
X-CSE-MsgGUID: y4pJW1tYR4mIp2PMliHZyA==
X-IronPort-AV: E=Sophos;i="6.15,251,1739833200"; 
   d="scan'208";a="43809745"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 30 Apr 2025 14:06:30 +0200
X-CheckPoint: {68121246-2E-BF62DDF1-CB8BF55F}
X-MAIL-CPID: 49C9A6B57520DDF90CE7DD2646D8985E_1
X-Control-Analysis: str=0001.0A006398.68121253.0066,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 34550168F21;
	Wed, 30 Apr 2025 14:06:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1746014786;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xa3mNEfdhrIDOlxo7TVXevfB9pnUglXcunIlDPViRFQ=;
	b=T0LOk/CInLTFG0ltpa8iyTWHKIda8dEXfX/MklxH+aH6NJOXu2d1patAplzSHE329bRmoa
	r6gHrcxIPcLh+hYqEH7VYamb0yavToPWJqCgye5jL2tAv5aiEhdNcLf4XYxL+/6t2gt20t
	9iXRjmlM3RvDa9RAq7dlb7wiVy/USu4VggVaKuUcUGAv6kynjELBOX1BJO01JAH3cPIzkd
	q34dVvw9IePBA6zrwKcKnXuP0famOMPkm89v4cCXNYENTNp6xarxBhHsuThZmBlSqV76tG
	Hvscl7xlgmdKllIWHgg8pIMBQaej6Z3guLjbD26H6MWvsELQCKwRGug7GhRkzA==
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
Subject: [PATCH v2 2/2] arm64: dts: ls1012a: add DTS for TQMLS1012al module with MBLS1012AL board
Date: Wed, 30 Apr 2025 14:06:01 +0200
Message-ID: <20250430120605.2068102-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430120605.2068102-1-alexander.stein@ew.tq-group.com>
References: <20250430120605.2068102-1-alexander.stein@ew.tq-group.com>
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
Changes in v2:
* Be a bit more specific with lm75 compatible
* Remove m25p,fast-read from spi-nor flash

 arch/arm64/boot/dts/freescale/Makefile        |   2 +
 ...sl-ls1012a-tqmls1012al-mbls1012al-emmc.dts |  21 ++
 .../fsl-ls1012a-tqmls1012al-mbls1012al.dts    | 346 ++++++++++++++++++
 .../freescale/fsl-ls1012a-tqmls1012al.dtsi    |  73 ++++
 4 files changed, 442 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1012a-tqmls1012al-mbls1012al-emmc.dts
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1012a-tqmls1012al-mbls1012al.dts
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1012a-tqmls1012al.dtsi

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index bf575395d7d5b..f6b8686ed3cfe 100644
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
index 0000000000000..82dc0a7c7d535
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1012a-tqmls1012al-mbls1012al-emmc.dts
@@ -0,0 +1,21 @@
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
+	vqmmc-supply = <&reg_1p8v>;
+	/delete-property/ no-mmc;
+	disable-wp;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	no-sdio;
+	no-sd;
+	voltage-ranges = <1800 1800>;
+	non-removable;
+};
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1012a-tqmls1012al-mbls1012al.dts b/arch/arm64/boot/dts/freescale/fsl-ls1012a-tqmls1012al-mbls1012al.dts
new file mode 100644
index 0000000000000..147c7ca130c44
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1012a-tqmls1012al-mbls1012al.dts
@@ -0,0 +1,346 @@
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
+		serial0 = &duart0;
+		/* use MAC from U-Boot environment */
+		/* TODO: PFE */
+		ethernet2 = &swport0;
+		ethernet3 = &swport1;
+		ethernet4 = &swport2;
+		ethernet5 = &swport3;
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
+	reg_1p5v: regulator-1p5v {
+		compatible = "regulator-fixed";
+		regulator-name = "1P5V";
+		regulator-min-microvolt = <1500000>;
+		regulator-max-microvolt = <1500000>;
+		regulator-always-on;
+	};
+
+	reg_1p8v: regulator-1p8v {
+		compatible = "regulator-fixed";
+		regulator-name = "1P8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	reg_3p3v: regulator-3p3v {
+		compatible = "regulator-fixed";
+		regulator-name = "3P3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+};
+
+&duart0 {
+	status = "okay";
+};
+
+&esdhc0 {
+	vmmc-supply = <&reg_3p3v>;
+	no-mmc;
+	no-sdio;
+	disable-wp;
+	sd-uhs-sdr104;
+	sd-uhs-sdr50;
+	sd-uhs-sdr25;
+	sd-uhs-sdr12;
+	status = "okay";
+};
+
+&i2c0 {
+	lm75_48: temperature-sensor@48 {
+		compatible = "national,lm75a";
+		reg = <0x48>;
+		vs-supply = <&reg_3p3v>;
+	};
+
+	gpio_exp_3p3v: gpio-expander@20 {
+		compatible = "nxp,pca9555";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		vcc-supply = <&reg_3p3v>;
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
+		vcc-pcie-en-3v3-hog {
+			gpio-hog;
+			gpios = <1 GPIO_ACTIVE_HIGH>;
+			output-high;
+			line-name = "VCC_PCIE_EN_3V3";
+		};
+
+		vcc-wlan-en-3v3-hog {
+			gpio-hog;
+			gpios = <3 GPIO_ACTIVE_HIGH>;
+			output-high;
+			line-name = "VCC_WLAN_EN_3V3";
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
+	gpio_exp_1p8v: gpio-expander@70 {
+		compatible = "nxp,pca9538";
+		reg = <0x70>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		vcc-supply = <&reg_1p8v>;
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
+
+		vcc-wlan-en-1v5-hog {
+			gpio-hog;
+			gpios = <6 GPIO_ACTIVE_HIGH>;
+			output-high;
+			line-name = "VCC_WLAN_EN_1V5";
+		};
+
+		vcc-pcie-en-1v5-hog {
+			gpio-hog;
+			gpios = <7 GPIO_ACTIVE_HIGH>;
+			output-high;
+			line-name = "VCC_PCIE_EN_1V5";
+		};
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
index 0000000000000..5f6ee8fd4094b
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1012a-tqmls1012al.dtsi
@@ -0,0 +1,73 @@
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

