Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F4D297A42;
	Tue, 15 Apr 2025 13:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744722020; cv=none; b=ePwbMPgaizvu/TtDE012gNZ8gmom2UmFoRcw0bkMi2584Z8d/FogGIKe2AITI9+oFdBPtSVxyJmJzPLdo9M5W4c7ypynh7K9F+bQ8Tkwk+UrGXVKDYXZSbDwljgwA51cM/n+GTqAzI7NRS2PxsJXEydFIJzR+yzo0Cxwj30BdvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744722020; c=relaxed/simple;
	bh=OsOK0+i/yYtOpzHSmr70EMH7c0JuVbsreZcQMbZ9H78=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CPuI7Z0P7FN3srz7LO1aN2lwaQQGd50TBFbMulvkmWX6ZpyT+tJF7UOvnVSVRkrr2AJ/SaSaD0H7mIbgdKFfjWIQ8ARNvYTM9lzvJ85Y1IvRIu+vrF6kz1vcewSAChePZp5DZ9r0cjWZLmK+3FQx+ku2Bs+p9/bBEp/1YdvzsDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=ca7QDwph; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=l/7PCZNe reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="ca7QDwph";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="l/7PCZNe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1744722017; x=1776258017;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1od9z4M176ZWFjt4K9HV/sw55eaKdomX1gr4aMViVHc=;
  b=ca7QDwph8yTgNLvUP25w5J+GFIjSrAgHAhPdDATh6yUHvO8tOTopr53x
   GewQba7Aw574M+tqSQfj1zByqtrvnkGqaXoPGUcaRbW+YqblNK5xwJ+Zk
   1GGgfDchKgwf7bvdzjec5NdOz5YT5bI0sx6JbRYK4xMrt9r2El85EUq7m
   y5BTZMUdYUFqACNBhH7TX7oXnQkzP6MigThbR7p1RFmMcaj8LFDNowf+L
   9r+OBhi/Dn9sK0EwkVC8DNVVh5VrqFdaL5pBS8X8X2UYjAYTYgYVU6CS2
   5xr8q0blP+LhraXmzCpCexIAZK+R5K/e8VYbGeE3tYgDTnyGsT4lbDG3D
   Q==;
X-CSE-ConnectionGUID: SjOdgPnDQ0Kgc8RZLhBZog==
X-CSE-MsgGUID: 4YqRv+Q+QcqJUhpB845W1A==
X-IronPort-AV: E=Sophos;i="6.15,213,1739833200"; 
   d="scan'208";a="43542789"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 15 Apr 2025 15:00:07 +0200
X-CheckPoint: {67FE5857-4B-DC4DC9A0-F4F29281}
X-MAIL-CPID: D388DB5C6761005589964A2F0879CE13_0
X-Control-Analysis: str=0001.0A006368.67FE5863.0081,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F3CEA1648E8;
	Tue, 15 Apr 2025 15:00:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1744722003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1od9z4M176ZWFjt4K9HV/sw55eaKdomX1gr4aMViVHc=;
	b=l/7PCZNefM144ps3lgNP/mh0T+gapElIsSsSRgwMhU4mqK54ylAg2gfvMsIvnqU+KaBCsc
	UUbffbAY6SOnZH71gYQzEsAQXw6lGU3Y9qrBsy+i0sZpdtUQoco1V5n9MDyKRrDx9E7lr8
	dUvuzK3tQTyl8d0vbGULUCk5pMOnRcWFWxmDvkqd+sWPORpy7cDP5xcuYya3czztQwWR9q
	dR5ZapOSTDHmkoUH2elTantGyv8Bfhk9C0T3GJLqTy6cvsosKYL/+5dsKiLyQl6bo9P+9C
	QYatxZOX9ivGmLg+FZX0QHcG51Q8cP3gwMpm+Moz3bsat/Lu7razK9tImmk6gQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 2/2] arm64: add initial device tree for TQMa93xx/MBa91xxCA
Date: Tue, 15 Apr 2025 14:59:45 +0200
Message-ID: <20250415125947.429121-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250415125947.429121-1-alexander.stein@ew.tq-group.com>
References: <20250415125947.429121-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

This adds support for TQMa93xx module attached to MBa91xxCA board.
TQMa93xx is a SOM using i.MX93 SOC. The SOM features PMIC, RAM, e-MMC and
some optional peripherals like SPI-NOR, RTC, EEPROM, gyroscope and
secure element.
TQMa93xxCA can be attached directly while TQMa93xxLA needs an adapter.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../freescale/imx93-tqma9352-mba91xxca.dts    | 749 ++++++++++++++++++
 2 files changed, 750 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index e8c77519eacae..b4d97b839711c 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -304,6 +304,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-14x14-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-kontron-bl-osm-s.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba91xxca.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxca.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-var-som-symphony.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dts b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dts
new file mode 100644
index 0000000000000..7b78faa4bfd09
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dts
@@ -0,0 +1,749 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (c) 2022-2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Markus Niebel
+ * Author: Alexander Stein
+ */
+/dts-v1/;
+
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/net/ti-dp83867.h>
+#include <dt-bindings/pwm/pwm.h>
+#include <dt-bindings/usb/pd.h>
+#include "imx93-tqma9352.dtsi"
+
+/{
+	model = "TQ-Systems i.MX93 TQMa93xxLA/TQMa93xxCA on MBa91xxCA starter kit";
+	compatible = "tq,imx93-tqma9352-mba91xxca", "tq,imx93-tqma9352", "fsl,imx93";
+	chassis-type = "embedded";
+
+	chosen {
+		stdout-path = &lpuart1;
+	};
+
+	aliases {
+		eeprom0 = &eeprom0;
+		ethernet0 = &eqos;
+		ethernet1 = &fec;
+		rtc0 = &pcf85063;
+		rtc1 = &bbnsm_rtc;
+	};
+
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&tpm2 2 5000000 0>;
+		brightness-levels = <0 4 8 16 32 64 128 255>;
+		default-brightness-level = <7>;
+		power-supply = <&reg_12v0>;
+		enable-gpios = <&expander2 2 GPIO_ACTIVE_HIGH>;
+		status = "disabled";
+	};
+
+	display: display {
+		/*
+		 * Display is not fixed, so compatible has to be added from
+		 * DT overlay
+		 */
+		power-supply = <&reg_3v3>;
+		enable-gpios = <&expander2 1 GPIO_ACTIVE_HIGH>;
+		backlight = <&backlight>;
+		status = "disabled";
+
+		port {
+			panel_in: endpoint {
+			};
+		};
+	};
+
+	fan0: gpio-fan {
+		compatible = "gpio-fan";
+		gpios = <&expander2 4 GPIO_ACTIVE_HIGH>;
+		gpio-fan,speed-map = <0 0>, <10000 1>;
+		fan-supply = <&reg_12v0>;
+		#cooling-cells = <2>;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		autorepeat;
+
+		switch-a {
+			label = "switcha";
+			linux,code = <BTN_0>;
+			gpios = <&expander0 6 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+
+		switch-b {
+			label = "switchb";
+			linux,code = <BTN_1>;
+			gpios = <&expander0 7 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+	};
+
+	gpio-leds {
+		compatible = "gpio-leds";
+
+		led-1 {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_STATUS;
+			gpios = <&expander2 6 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "default-on";
+		};
+
+		led-2 {
+			color = <LED_COLOR_ID_AMBER>;
+			function = LED_FUNCTION_HEARTBEAT;
+			gpios = <&expander2 7 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+		};
+	};
+
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&adc1 0>, <&adc1 1>, <&adc1 2>, <&adc1 3>;
+	};
+
+	lvds_encoder: lvds-encoder {
+		compatible = "ti,sn75lvds83", "lvds-encoder";
+		powerdown-gpios = <&expander2 3 GPIO_ACTIVE_LOW>;
+		power-supply = <&reg_3v3>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				lvds_encoder_input: endpoint {
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				lvds_encoder_output: endpoint {
+				};
+			};
+		};
+	};
+
+	reg_3v3: regulator-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "V_3V3_MB";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	reg_5v0: regulator-5v0 {
+		compatible = "regulator-fixed";
+		regulator-name = "V_5V0_MB";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	reg_12v0: regulator-12v0 {
+		compatible = "regulator-fixed";
+		regulator-name = "V_12V";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		gpio = <&expander1 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_mpcie_1v5: regulator-mpcie-1v5 {
+		compatible = "regulator-fixed";
+		regulator-name = "V_1V5_MPCIE";
+		regulator-min-microvolt = <1500000>;
+		regulator-max-microvolt = <1500000>;
+		gpio = <&expander0 2 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	reg_mpcie_3v3: regulator-mpcie-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "V_3V3_MPCIE";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&expander0 3 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	thermal-zones {
+		cpu-thermal {
+			trips {
+				cpu_active: trip-active0 {
+					temperature = <40000>;
+					hysteresis = <5000>;
+					type = "active";
+				};
+			};
+
+			cooling-maps {
+				map1 {
+					trip = <&cpu_active>;
+					cooling-device = <&fan0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+	};
+};
+
+&adc1 {
+	status = "okay";
+};
+
+&eqos {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_eqos>;
+	phy-mode = "rgmii-id";
+	phy-handle = <&ethphy_eqos>;
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy_eqos: ethernet-phy@0 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_eqos_phy>;
+			reset-gpios = <&expander1 0 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <500000>;
+			reset-deassert-us = <50000>;
+			interrupt-parent = <&gpio3>;
+			interrupts = <26 IRQ_TYPE_EDGE_FALLING>;
+			enet-phy-lane-no-swap;
+			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
+			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
+			ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
+			ti,dp83867-rxctrl-strap-quirk;
+			ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
+		};
+	};
+};
+
+&fec {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_fec>;
+	phy-mode = "rgmii-id";
+	phy-handle = <&ethphy_fec>;
+	fsl,magic-packet;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		clock-frequency = <5000000>;
+
+		ethphy_fec: ethernet-phy@0 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_fec_phy>;
+			reset-gpios = <&expander1 1 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <500000>;
+			reset-deassert-us = <50000>;
+			interrupt-parent = <&gpio3>;
+			interrupts = <27 IRQ_TYPE_EDGE_FALLING>;
+			enet-phy-lane-no-swap;
+			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
+			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
+			ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
+			ti,dp83867-rxctrl-strap-quirk;
+			ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
+		};
+	};
+};
+
+&flexcan1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexcan1>;
+	xceiver-supply = <&reg_3v3>;
+	status = "okay";
+};
+
+&gpio1 {
+	gpio-line-names =
+		/* 00 */ "", "", "", "PMIC_IRQ#",
+		/* 04 */ "", "", "", "",
+		/* 08 */ "", "", "USB_C_ALERT#", "BM2_LCD_INT#",
+		/* 12 */ "PEX_INT#", "", "RTC_EVENT#", "",
+		/* 16 */ "", "", "", "",
+		/* 20 */ "", "", "", "",
+		/* 24 */ "", "", "", "",
+		/* 28 */ "", "", "", "";
+};
+
+&gpio2 {
+	gpio-line-names =
+		/* 00 */ "", "", "", "",
+		/* 04 */ "", "", "", "",
+		/* 08 */ "", "", "", "",
+		/* 12 */ "", "", "", "",
+		/* 16 */ "", "", "", "",
+		/* 20 */ "", "", "", "",
+		/* 24 */ "", "", "", "",
+		/* 28 */ "", "", "", "";
+};
+
+&gpio3 {
+	gpio-line-names =
+		/* 00 */ "SD2_CD#", "", "", "",
+		/* 04 */ "", "", "", "SD2_RST#",
+		/* 08 */ "", "", "", "",
+		/* 12 */ "", "", "", "",
+		/* 16 */ "", "", "", "",
+		/* 20 */ "", "", "", "",
+		/* 24 */ "", "", "ENET1_INT#", "ENET2_INT#",
+		/* 28 */ "", "", "", "";
+};
+
+&gpio4 {
+	gpio-line-names =
+		/* 00 */ "", "", "", "",
+		/* 04 */ "", "", "", "",
+		/* 08 */ "", "", "", "",
+		/* 12 */ "", "", "", "",
+		/* 16 */ "", "", "", "",
+		/* 20 */ "", "", "", "",
+		/* 24 */ "", "", "", "",
+		/* 28 */ "", "", "", "";
+};
+
+&lpi2c3 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	clock-frequency = <400000>;
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&pinctrl_lpi2c3>;
+	pinctrl-1 = <&pinctrl_lpi2c3>;
+	status = "okay";
+
+	temperature-sensor@1c {
+		compatible = "nxp,se97b", "jedec,jc-42.4-temp";
+		reg = <0x1c>;
+	};
+
+	ptn5110: usb-typec@50 {
+		compatible = "nxp,ptn5110", "tcpci";
+		reg = <0x50>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_typec>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <10 IRQ_TYPE_EDGE_FALLING>;
+
+		connector {
+			compatible = "usb-c-connector";
+			label = "X17";
+			power-role = "dual";
+			data-role = "dual";
+			try-power-role = "sink";
+			typec-power-opmode = "default";
+			pd-disable;
+			self-powered;
+
+			port {
+				typec_con_hs: endpoint {
+					remote-endpoint = <&typec_hs>;
+				};
+			};
+		};
+	};
+
+	eeprom2: eeprom@54 {
+		compatible = "nxp,se97b", "atmel,24c02";
+		reg = <0x54>;
+		pagesize = <16>;
+		vcc-supply = <&reg_3v3>;
+	};
+
+	expander0: gpio@70 {
+		compatible = "nxp,pca9538";
+		reg = <0x70>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_pexp_irq>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <12 IRQ_TYPE_LEVEL_LOW>;
+		vcc-supply = <&reg_3v3>;
+		gpio-line-names = "TEMP_EVENT_MOD#", "MPCIE_WAKE#",
+				  "MPCIE_1V5_EN", "MPCIE_3V3_EN",
+				  "MPCIE_PERST#", "MPCIE_WDISABLE#",
+				  "BUTTON_A#", "BUTTON_B#";
+
+		temp-event-mod-hog {
+			gpio-hog;
+			gpios = <0 GPIO_ACTIVE_LOW>;
+			input;
+			line-name = "TEMP_EVENT_MOD#";
+		};
+
+		mpcie-wake-hog {
+			gpio-hog;
+			gpios = <1 GPIO_ACTIVE_LOW>;
+			input;
+			line-name = "MPCIE_WAKE#";
+		};
+
+		/*
+		 * Controls the mPCIE slot reset which is low active as
+		 * reset signal. The output-low states, the signal is
+		 * inactive, e.g. not in reset
+		 */
+		mpcie_rst_hog: mpcie-rst-hog {
+			gpio-hog;
+			gpios = <4 GPIO_ACTIVE_LOW>;
+			output-low;
+			line-name = "MPCIE_PERST#";
+		};
+
+		/*
+		 * Controls the mPCIE slot WDISABLE pin which is low active
+		 * as disable signal. The output-low states, the signal is
+		 * inactive, e.g. not disabled
+		 */
+		mpcie_wdisable_hog: mpcie-wdisable-hog {
+			gpio-hog;
+			gpios = <5 GPIO_ACTIVE_LOW>;
+			output-low;
+			line-name = "MPCIE_WDISABLE#";
+		};
+	};
+
+	expander1: gpio@71 {
+		compatible = "nxp,pca9538";
+		reg = <0x71>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		vcc-supply = <&reg_3v3>;
+		gpio-line-names = "ENET1_RESET#", "ENET2_RESET#",
+				  "USB_RESET#", "",
+				  "WLAN_PD#", "WLAN_W_DISABLE#",
+				  "WLAN_PERST#", "12V_EN";
+
+		/*
+		 * Controls the WiFi card PD pin which is low active
+		 * as power down signal. The output-low states, the signal
+		 * is inactive, e.g. not power down
+		 */
+		wlan-pd-hog {
+			gpio-hog;
+			gpios = <4 GPIO_ACTIVE_LOW>;
+			output-low;
+			line-name = "WLAN_PD#";
+		};
+
+		/*
+		 * Controls the WiFi card disable pin which is low active
+		 * as disable signal. The output-low states, the signal
+		 * is inactive, e.g. not disabled
+		 */
+		wlan-wdisable-hog {
+			gpio-hog;
+			gpios = <5 GPIO_ACTIVE_LOW>;
+			output-low;
+			line-name = "WLAN_W_DISABLE#";
+		};
+
+		/*
+		 * Controls the WiFi card reset pin which is low active
+		 * as reset signal. The output-low states, the signal
+		 * is inactive, e.g. not in reset
+		 */
+		wlan-perst-hog {
+			gpio-hog;
+			gpios = <6 GPIO_ACTIVE_LOW>;
+			output-low;
+			line-name = "WLAN_PERST#";
+		};
+	};
+
+	expander2: gpio@72 {
+		compatible = "nxp,pca9538";
+		reg = <0x72>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		vcc-supply = <&reg_3v3>;
+		gpio-line-names = "LCD_RESET#", "LCD_PWR_EN",
+				  "LCD_BLT_EN", "LVDS_SHDN#",
+				  "FAN_PWR_EN", "",
+				  "USER_LED1", "USER_LED2";
+	};
+};
+
+&lpuart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart1>;
+	status = "okay";
+};
+
+&lpuart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart2>;
+	linux,rs485-enabled-at-boot-time;
+	status = "okay";
+};
+
+&pcf85063 {
+	/* RTC_EVENT# from SoM is connected on mainboard */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pcf85063>;
+	interrupt-parent = <&gpio1>;
+	interrupts = <14 IRQ_TYPE_EDGE_FALLING>;
+};
+
+&se97_som {
+	/* TEMP_EVENT# from SoM is connected on mainboard */
+	interrupt-parent = <&expander0>;
+	interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+};
+
+&tpm2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_tpm2>;
+	status = "okay";
+};
+
+&usbotg1 {
+	dr_mode = "otg";
+	hnp-disable;
+	srp-disable;
+	adp-disable;
+	usb-role-switch;
+	disable-over-current;
+	samsung,picophy-pre-emp-curr-control = <3>;
+	samsung,picophy-dc-vol-level-adjust = <7>;
+	status = "okay";
+
+	port {
+		typec_hs: endpoint {
+			remote-endpoint = <&typec_con_hs>;
+		};
+	};
+};
+
+&usbotg2 {
+	dr_mode = "host";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	disable-over-current;
+	samsung,picophy-pre-emp-curr-control = <3>;
+	samsung,picophy-dc-vol-level-adjust = <7>;
+	status = "okay";
+
+	hub_2_0: hub@1 {
+		compatible = "usb424,2517";
+		reg = <1>;
+		reset-gpios = <&expander1 2 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&reg_3v3>;
+	};
+};
+
+&usdhc2 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc2_hs>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc2_uhs>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc2_uhs>, <&pinctrl_usdhc2_gpio>;
+	cd-gpios = <&gpio3 0 GPIO_ACTIVE_LOW>;
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+	bus-width = <4>;
+	no-sdio;
+	no-mmc;
+	disable-wp;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_eqos: eqosgrp {
+		fsl,pins = /* PD | FSEL_2 | DSE X4 */
+			   <MX93_PAD_ENET1_MDC__ENET_QOS_MDC				0x51e>,
+			   /* SION | HYS | ODE | FSEL_2 | DSE X4 */
+			   <MX93_PAD_ENET1_MDIO__ENET_QOS_MDIO				0x4000191e>,
+			   /* HYS | FSEL_0 | DSE no drive */
+			   <MX93_PAD_ENET1_RD0__ENET_QOS_RGMII_RD0			0x1000>,
+			   <MX93_PAD_ENET1_RD1__ENET_QOS_RGMII_RD1			0x1000>,
+			   <MX93_PAD_ENET1_RD2__ENET_QOS_RGMII_RD2			0x1000>,
+			   <MX93_PAD_ENET1_RD3__ENET_QOS_RGMII_RD3			0x1000>,
+			   <MX93_PAD_ENET1_RX_CTL__ENET_QOS_RGMII_RX_CTL		0x1000>,
+			   /* HYS | PD | FSEL_0 | DSE no drive */
+			   <MX93_PAD_ENET1_RXC__CCM_ENET_QOS_CLOCK_GENERATE_RX_CLK	0x1400>,
+			   /* PD | FSEL_2 | DSE X4 */
+			   <MX93_PAD_ENET1_TD0__ENET_QOS_RGMII_TD0			0x51e>,
+			   <MX93_PAD_ENET1_TD1__ENET_QOS_RGMII_TD1			0x51e>,
+			   <MX93_PAD_ENET1_TD2__ENET_QOS_RGMII_TD2			0x51e>,
+			   <MX93_PAD_ENET1_TD3__ENET_QOS_RGMII_TD3			0x51e>,
+			   <MX93_PAD_ENET1_TX_CTL__ENET_QOS_RGMII_TX_CTL		0x51e>,
+			   /* PD | FSEL_3 | DSE X3 */
+			   <MX93_PAD_ENET1_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x58e>;
+	};
+
+	pinctrl_eqos_phy: eqosphygrp {
+		fsl,pins = /* HYS | FSEL_0 | DSE no drive */
+			   <MX93_PAD_CCM_CLKO1__GPIO3_IO26			0x1000>;
+	};
+
+	pinctrl_fec: fecgrp {
+		fsl,pins = /* PD | FSEL_2 | DSE X4 */
+			   <MX93_PAD_ENET2_MDC__ENET1_MDC			0x51e>,
+			   /* SION | HYS | ODE | FSEL_2 | DSE X4 */
+			   <MX93_PAD_ENET2_MDIO__ENET1_MDIO			0x4000191e>,
+			   /* HYS | FSEL_0 | DSE no drive */
+			   <MX93_PAD_ENET2_RD0__ENET1_RGMII_RD0			0x1000>,
+			   <MX93_PAD_ENET2_RD1__ENET1_RGMII_RD1			0x1000>,
+			   <MX93_PAD_ENET2_RD2__ENET1_RGMII_RD2			0x1000>,
+			   <MX93_PAD_ENET2_RD3__ENET1_RGMII_RD3			0x1000>,
+			   <MX93_PAD_ENET2_RX_CTL__ENET1_RGMII_RX_CTL		0x1000>,
+			   /* HYS | PD | FSEL_0 | DSE no drive */
+			   <MX93_PAD_ENET2_RXC__ENET1_RGMII_RXC			0x1400>,
+			   /* PD | FSEL_2 | DSE X4 */
+			   <MX93_PAD_ENET2_TD0__ENET1_RGMII_TD0			0x51e>,
+			   <MX93_PAD_ENET2_TD1__ENET1_RGMII_TD1			0x51e>,
+			   <MX93_PAD_ENET2_TD2__ENET1_RGMII_TD2			0x51e>,
+			   <MX93_PAD_ENET2_TD3__ENET1_RGMII_TD3			0x51e>,
+			   <MX93_PAD_ENET2_TX_CTL__ENET1_RGMII_TX_CTL		0x51e>,
+			   /* PD | FSEL_3 | DSE X3 */
+			   <MX93_PAD_ENET2_TXC__ENET1_RGMII_TXC			0x58e>;
+	};
+
+	pinctrl_fec_phy: fecphygrp {
+		fsl,pins = /* HYS | FSEL_0 | DSE no drive */
+			   <MX93_PAD_CCM_CLKO2__GPIO3_IO27			0x1000>;
+	};
+
+	pinctrl_flexcan1: flexcan1grp {
+		fsl,pins = /* HYS | PU | FSEL_0 | DSE no drive */
+			   <MX93_PAD_PDM_BIT_STREAM0__CAN1_RX		0x1200>,
+			   /* PU | FSEL_3 | DSE X4 */
+			   <MX93_PAD_PDM_CLK__CAN1_TX			0x039e>;
+	};
+
+	pinctrl_jtag: jtaggrp {
+		fsl,pins = <MX93_PAD_DAP_TCLK_SWCLK__JTAG_MUX_TCK	0x051e>,
+			   <MX93_PAD_DAP_TDI__JTAG_MUX_TDI		0x1200>,
+			   <MX93_PAD_DAP_TDO_TRACESWO__JTAG_MUX_TDO	0x031e>,
+			   <MX93_PAD_DAP_TMS_SWDIO__JTAG_MUX_TMS	0x1200>;
+	};
+
+	pinctrl_lpi2c3: lpi2c3grp {
+		fsl,pins = /* SION | HYS | OD | FSEL_3 | DSE X4 */
+			   <MX93_PAD_GPIO_IO28__LPI2C3_SDA		0x4000199e>,
+			   <MX93_PAD_GPIO_IO29__LPI2C3_SCL		0x4000199e>;
+	};
+
+	pinctrl_pcf85063: pcf85063grp {
+		fsl,pins = <MX93_PAD_SAI1_RXD0__GPIO1_IO14		0x1000>;
+	};
+
+	pinctrl_pexp_irq: pexpirqgrp {
+		fsl,pins = /* HYS | FSEL_0 | No DSE */
+			   <MX93_PAD_SAI1_TXC__GPIO1_IO12		0x1000>;
+	};
+
+	pinctrl_rgbdisp: rgbdispgrp {
+		fsl,pins = <MX93_PAD_GPIO_IO00__MEDIAMIX_DISP_CLK	0x31e>,
+			   <MX93_PAD_GPIO_IO01__MEDIAMIX_DISP_DE	0x31e>,
+			   <MX93_PAD_GPIO_IO02__MEDIAMIX_DISP_VSYNC	0x31e>,
+			   <MX93_PAD_GPIO_IO03__MEDIAMIX_DISP_HSYNC	0x31e>,
+			   <MX93_PAD_GPIO_IO04__MEDIAMIX_DISP_DATA00	0x31e>,
+			   <MX93_PAD_GPIO_IO05__MEDIAMIX_DISP_DATA01	0x31e>,
+			   <MX93_PAD_GPIO_IO06__MEDIAMIX_DISP_DATA02	0x31e>,
+			   <MX93_PAD_GPIO_IO07__MEDIAMIX_DISP_DATA03	0x31e>,
+			   <MX93_PAD_GPIO_IO08__MEDIAMIX_DISP_DATA04	0x31e>,
+			   <MX93_PAD_GPIO_IO09__MEDIAMIX_DISP_DATA05	0x31e>,
+			   <MX93_PAD_GPIO_IO10__MEDIAMIX_DISP_DATA06	0x31e>,
+			   <MX93_PAD_GPIO_IO11__MEDIAMIX_DISP_DATA07	0x31e>,
+			   <MX93_PAD_GPIO_IO12__MEDIAMIX_DISP_DATA08	0x31e>,
+			   <MX93_PAD_GPIO_IO13__MEDIAMIX_DISP_DATA09	0x31e>,
+			   <MX93_PAD_GPIO_IO14__MEDIAMIX_DISP_DATA10	0x31e>,
+			   <MX93_PAD_GPIO_IO15__MEDIAMIX_DISP_DATA11	0x31e>,
+			   <MX93_PAD_GPIO_IO16__MEDIAMIX_DISP_DATA12	0x31e>,
+			   <MX93_PAD_GPIO_IO17__MEDIAMIX_DISP_DATA13	0x31e>,
+			   <MX93_PAD_GPIO_IO18__MEDIAMIX_DISP_DATA14	0x31e>,
+			   <MX93_PAD_GPIO_IO19__MEDIAMIX_DISP_DATA15	0x31e>,
+			   <MX93_PAD_GPIO_IO20__MEDIAMIX_DISP_DATA16	0x31e>,
+			   <MX93_PAD_GPIO_IO21__MEDIAMIX_DISP_DATA17	0x31e>,
+			   <MX93_PAD_GPIO_IO22__MEDIAMIX_DISP_DATA18	0x31e>,
+			   <MX93_PAD_GPIO_IO23__MEDIAMIX_DISP_DATA19	0x31e>,
+			   <MX93_PAD_GPIO_IO24__MEDIAMIX_DISP_DATA20	0x31e>,
+			   <MX93_PAD_GPIO_IO25__MEDIAMIX_DISP_DATA21	0x31e>,
+			   <MX93_PAD_GPIO_IO26__MEDIAMIX_DISP_DATA22	0x31e>,
+			   <MX93_PAD_GPIO_IO27__MEDIAMIX_DISP_DATA23	0x31e>;
+	};
+
+	pinctrl_touch: touchgrp {
+		fsl,pins = /* HYS | FSEL_0 | No DSE */
+			   <MX93_PAD_SAI1_TXFS__GPIO1_IO11		0x1000>;
+	};
+
+	pinctrl_tpm2: tpm2grp {
+		fsl,pins = <MX93_PAD_I2C2_SCL__TPM2_CH2			0x57e>;
+	};
+
+	pinctrl_typec: typecgrp {
+		fsl,pins = /* HYS | FSEL_0 | No DSE */
+			   <MX93_PAD_PDM_BIT_STREAM1__GPIO1_IO10	0x1000>;
+	};
+
+	pinctrl_uart1: uart1grp {
+		fsl,pins = /* HYS | FSEL_0 | No DSE */
+			   <MX93_PAD_UART1_RXD__LPUART1_RX		0x1000>,
+			   /* FSEL_2 | DSE X4 */
+			   <MX93_PAD_UART1_TXD__LPUART1_TX		0x011e>;
+	};
+
+	pinctrl_uart2: uart2grp {
+		fsl,pins = /* HYS | FSEL_0 | No DSE */
+			   <MX93_PAD_UART2_RXD__LPUART2_RX		0x1000>,
+			   /* FSEL_2 | DSE X4 */
+			   <MX93_PAD_UART2_TXD__LPUART2_TX		0x011e>,
+			   /* FSEL_2 | DSE X4 */
+			   <MX93_PAD_SAI1_TXD0__LPUART2_RTS_B		0x011e>;
+	};
+
+	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
+		fsl,pins = /* HYS | FSEL_0 | No DSE */
+			   <MX93_PAD_SD2_CD_B__GPIO3_IO00		0x1000>;
+	};
+
+	/* enable SION for data and cmd pad due to ERR052021 */
+	pinctrl_usdhc2_hs: usdhc2hsgrp {
+		fsl,pins = /* PD | FSEL_3 | DSE X5 */
+			   <MX93_PAD_SD2_CLK__USDHC2_CLK		0x05be>,
+			   /* HYS | PU | FSEL_3 | DSE X4 */
+			   <MX93_PAD_SD2_CMD__USDHC2_CMD		0x4000139e>,
+			   /* HYS | PU | FSEL_3 | DSE X3 */
+			   <MX93_PAD_SD2_DATA0__USDHC2_DATA0		0x4000138e>,
+			   <MX93_PAD_SD2_DATA1__USDHC2_DATA1		0x4000138e>,
+			   <MX93_PAD_SD2_DATA2__USDHC2_DATA2		0x4000138e>,
+			   <MX93_PAD_SD2_DATA3__USDHC2_DATA3		0x4000138e>,
+			   /* FSEL_2 | DSE X3 */
+			   <MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x010e>;
+	};
+
+	/* enable SION for data and cmd pad due to ERR052021 */
+	pinctrl_usdhc2_uhs: usdhc2uhsgrp {
+		fsl,pins = /* PD | FSEL_3 | DSE X6 */
+			   <MX93_PAD_SD2_CLK__USDHC2_CLK		0x05fe>,
+			   /* HYS | PU | FSEL_3 | DSE X4 */
+			   <MX93_PAD_SD2_CMD__USDHC2_CMD		0x4000139e>,
+			   <MX93_PAD_SD2_DATA0__USDHC2_DATA0		0x4000139e>,
+			   <MX93_PAD_SD2_DATA1__USDHC2_DATA1		0x4000139e>,
+			   <MX93_PAD_SD2_DATA2__USDHC2_DATA2		0x4000139e>,
+			   <MX93_PAD_SD2_DATA3__USDHC2_DATA3		0x4000139e>,
+			   /* FSEL_2 | DSE X3 */
+			   <MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x010e>;
+	};
+};
-- 
2.43.0

