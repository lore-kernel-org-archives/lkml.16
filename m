Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13CBD18F2CF
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 15:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738769572; cv=none; b=BT5AzwRCvjNAY8sKzWhjhIwLRy5rQDTrvKAdj/gFugy1pUPYtbbiQStFcTlKiknUWlw3Hg0kUTwJcMGt+EIVPPyTjJu8WeL//wlCeHTMdiE7WjRdKGGL0k2NEYXB43LOFCfL8ppm5ynkDnCN8n1JzkGt5jcDom/r2/qhZe+gAiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738769572; c=relaxed/simple;
	bh=tSu8YXFQbJwcQqiIoKaZChI++VggDiWGOByDugkawos=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UnRCZL5JjL5tyBCx4lj8/TvbmQ5LCT1/KTQuH44mvMtM9O5NarrgNFH+FCnL+KwBIi+O2JvYgD51le0oZW3CIh2oCL8+V5ff0Z/Ohlw7dY5n+poO7SaaH3qAhMoAC1AxHiDWRDFZFFH18T280FF/m85aWfm59+iZe6thpubIzr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1tfhON-0005Jb-8h; Wed, 05 Feb 2025 16:32:43 +0100
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Wed, 05 Feb 2025 16:32:27 +0100
Subject: [PATCH v4 6/6] arm64: dts: agilex5: initial support for Arrow
 AXE5-Eagle
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-v6-12-topic-socfpga-agilex5-v4-6-ebf070e2075f@pengutronix.de>
References: <20250205-v6-12-topic-socfpga-agilex5-v4-0-ebf070e2075f@pengutronix.de>
In-Reply-To: <20250205-v6-12-topic-socfpga-agilex5-v4-0-ebf070e2075f@pengutronix.de>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>
Cc: kernel@pengutronix.de, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

The Arrow AXE5-Eagle is an Intel Agilex5 SoCFPGA based board with:

   - 1x PCIe Gen4.0 edge connector
   - 4-port USB HUB
   - 2x 1Gb Ethernet
   - microSD
   - HDMI output
   - 2x 10Gb SFP+ cages

As most devices aren't supported mainline yet, this is only the initial
support for the board: leds, gpios, gmac2, i2c, uart and qspi. Although
gmac1 is equipped on the board, it doesn't work yet as it needs
additional pinctrl settings in the bootloader to work.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/intel/Makefile                 |   1 +
 .../boot/dts/intel/socfpga_agilex5_axe5_eagle.dts  | 140 +++++++++++++++++++++
 2 files changed, 141 insertions(+)

diff --git a/arch/arm64/boot/dts/intel/Makefile b/arch/arm64/boot/dts/intel/Makefile
index d39cfb723f5b6674a821dfdafb21b12668bb1e0e..3e87d548c532b1a9e38f4489c037c5c4db3a50b8 100644
--- a/arch/arm64/boot/dts/intel/Makefile
+++ b/arch/arm64/boot/dts/intel/Makefile
@@ -3,5 +3,6 @@ dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) += socfpga_agilex_n6000.dtb \
 				socfpga_agilex_socdk.dtb \
 				socfpga_agilex_socdk_nand.dtb \
 				socfpga_agilex5_socdk.dtb \
+				socfpga_agilex5_axe5_eagle.dtb \
 				socfpga_n5x_socdk.dtb
 dtb-$(CONFIG_ARCH_KEEMBAY) += keembay-evm.dtb
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_axe5_eagle.dts b/arch/arm64/boot/dts/intel/socfpga_agilex5_axe5_eagle.dts
new file mode 100644
index 0000000000000000000000000000000000000000..c0f6870e7b40a53ca0d685b4109ff24e1409bb0e
--- /dev/null
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5_axe5_eagle.dts
@@ -0,0 +1,140 @@
+// SPDX-License-Identifier:     GPL-2.0
+/*
+ * Copyright (C) 2024, Arrow Electronics, Inc.
+ */
+#include "socfpga_agilex5.dtsi"
+
+/ {
+	model = "SoCFPGA Agilex5 Arrow AXE5-Eagle";
+	compatible = "arrow,socfpga-agilex5-axe5-eagle", "intel,socfpga-agilex5";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			label = "hps_led0";
+			gpios = <&porta 6 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-1 {
+			label = "hps_led1";
+			gpios = <&porta 7 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		key-0 {
+			label = "hps_sw0";
+			gpios = <&porta 10 0>;
+			linux,input-type = <5>;	/* EV_SW */
+			linux,code = <0x0>;
+		};
+
+		key-1 {
+			label = "hps_sw1";
+			gpios = <&porta 1 0>;
+			linux,input-type = <5>;	/* EV_SW */
+			linux,code = <0x0>;
+		};
+
+		key-2 {
+			label = "hps_pb0";
+			gpios = <&porta 8 1>;
+			linux,code = <187>;		/* KEY_F17 */
+		};
+
+		key-3 {
+			label = "hps_pb1";
+			gpios = <&porta 9 1>;
+			linux,code = <188>;		/* KEY_F18 */
+		};
+	};
+
+	vdd: regulator-vdd {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-supply";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	vdd_3_3: regulator-vdd {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-supply";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+};
+
+&gmac2 {
+	status = "okay";
+	phy-mode = "rgmii-id";
+	phy-handle = <&emac2_phy0>;
+
+	mdio0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "snps,dwmac-mdio";
+		emac2_phy0: ethernet-phy@1 {
+			reg = <0x1>;
+		};
+	};
+};
+
+&gpio0 {
+	status = "okay";
+};
+
+&i2c0 {
+	status = "okay";
+};
+
+&i2c1 {
+	status = "okay";
+
+	i2c-mux@70 {
+		compatible = "nxp,pca9544";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x70>;
+		status = "okay";
+	};
+};
+
+&osc1 {
+	clock-frequency = <25000000>;
+};
+
+&qspi {
+	status = "okay";
+
+	flash@0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "micron,mt25qu02g", "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <100000000>;
+
+		m25p,fast-read;
+		cdns,read-delay = <2>;
+		cdns,tshsl-ns = <50>;
+		cdns,tsd2d-ns = <50>;
+		cdns,tchsh-ns = <4>;
+		cdns,tslch-ns = <4>;
+	};
+};
+
+&uart0 {
+	status = "okay";
+};

-- 
2.46.0

