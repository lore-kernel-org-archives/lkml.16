Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A762A1DDC1B;
	Mon,  5 May 2025 11:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746446261; cv=none; b=habyf17ZlwpKDethvjwh4pqDvuw6dMzbadzRvZhUi7++NsX4Ba50UxUKd6Ag/Y8R+MBa6HgcdC5+YZnlQzxhzzFXiCNQZvl6VL8985XcSGQm/+/YEOc+skZdmbMFkgBYcGYpSe3sBKhS8vKj/EO9HDxtylrRMurE7TR70A5/bjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746446261; c=relaxed/simple;
	bh=v9h8n5Hu4zD+xGqw0zIAxd+iJP7j/KjeKe8bqqrRsIA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pv53KNC9aO/3Ep5YvBlrcFgbtzBWnreFNnee4032PMn+xCjItuX9jeOFSsnqy/HovT5U0Nw+k0q329ax7q++2BA3txl5uPMnxzKPpJ11yIEdXcQa1rTVEqlzy7EztFknmEbjmyVlu5sEk0EvYU0NKV2+055WFgEjRMdaglOnHWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=sfeMtfod; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="sfeMtfod"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 545BvNt7753533
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 May 2025 06:57:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746446243;
	bh=FghJ+OaapD/XWOZy3Fppzsc6MHEbllXdTcqrPo143bI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=sfeMtfodpQDUqEwBSj2+1QSEcJO07Dngs9t09RQngqbYXuASR1p3odvaCroboulk+
	 nFqa+g8IsgVdFzxyzKy+GeRqmRYiA9HI/akO7NEfdbbGmnT6Fhem8ejX28i0GYNF53
	 eUboA0M23NOJK9NXAm8ySqBAi2at6V1W3yOosaLk=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 545BvNFi017950
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 5 May 2025 06:57:23 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 5
 May 2025 06:57:22 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 5 May 2025 06:57:22 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 545Bv7A1004832;
	Mon, 5 May 2025 06:57:19 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <vaishnav.a@ti.com>, <u-kumar1@ti.com>, <r-donadkar@ti.com>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <jai.luthra@linux.dev>, <linux-kernel@vger.kernel.org>,
        <y-abhilashchandra@ti.com>
Subject: [PATCH 2/2] arm64: dts: ti: k3-j722s-evm: Add overlay for TEVI OV5640
Date: Mon, 5 May 2025 17:27:00 +0530
Message-ID: <20250505115700.500979-3-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250505115700.500979-1-y-abhilashchandra@ti.com>
References: <20250505115700.500979-1-y-abhilashchandra@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

From: Vaishnav Achath <vaishnav.a@ti.com>

TechNexion TEVI OV5640 camera is a 5MP camera that can be used with
J722S EVM through the 22-pin CSI-RX connector. Add a reference overlay
for quad TEVI OV5640 modules on J722S EVM.

Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
 arch/arm64/boot/dts/ti/Makefile               |   4 +
 .../k3-j722s-evm-csi2-quad-tevi-ov5640.dtso   | 358 ++++++++++++++++++
 2 files changed, 362 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 829a3b028466..76b750e4b8a8 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -123,6 +123,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-pcie1-ep.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am67a-beagley-ai.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-tevi-ov5640.dtbo
 
 # Boards with J784s4 SoC
 dtb-$(CONFIG_ARCH_K3) += k3-am69-sk.dtb
@@ -220,6 +221,8 @@ k3-j742s2-evm-usb0-type-a-dtbs := k3-j742s2-evm.dtb \
 	k3-j784s4-j742s2-evm-usb0-type-a.dtbo
 k3-j722s-evm-csi2-quad-rpi-cam-imx219-dtbs := k3-j722s-evm.dtb \
 	k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtbo
+k3-j722s-evm-csi2-quad-tevi-ov5640-dtbs := k3-j722s-evm.dtb \
+	k3-j722s-evm-csi2-quad-tevi-ov5640.dtbo
 k3-j784s4-evm-pcie0-pcie1-ep-dtbs := k3-j784s4-evm.dtb \
 	k3-j784s4-evm-pcie0-pcie1-ep.dtbo
 k3-j784s4-evm-quad-port-eth-exp1-dtbs := k3-j784s4-evm.dtb \
@@ -258,6 +261,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-j721s2-evm-pcie1-ep.dtb \
 	k3-j742s2-evm-usb0-type-a.dtb \
 	k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtb \
+	k3-j722s-evm-csi2-quad-tevi-ov5640.dtb \
 	k3-j784s4-evm-pcie0-pcie1-ep.dtb \
 	k3-j784s4-evm-quad-port-eth-exp1.dtb \
 	k3-j784s4-evm-usb0-type-a.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dtso b/arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dtso
new file mode 100644
index 000000000000..537224ea60e3
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dtso
@@ -0,0 +1,358 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * 4 x TEVI OV5640 MIPI Camera module on RPI camera connector.
+ *
+ * Copyright (C) 2024 Texas Instruments Incorporated - https://www.ti.com/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include "k3-pinctrl.h"
+
+&{/} {
+	clk_ov5640_fixed: clock-24000000 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+	};
+
+	reg_2p8v: regulator-2p8v {
+		compatible = "regulator-fixed";
+		regulator-name = "2P8V";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		vin-supply = <&vdd_sd_dv>;
+		regulator-always-on;
+	};
+
+	reg_1p8v: regulator-1p8v {
+		compatible = "regulator-fixed";
+		regulator-name = "1P8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vdd_sd_dv>;
+		regulator-always-on;
+	};
+
+	reg_3p3v: regulator-3p3v {
+		compatible = "regulator-fixed";
+		regulator-name = "3P3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vdd_sd_dv>;
+		regulator-always-on;
+	};
+};
+
+
+&main_pmx0 {
+	cam0_reset_pins_default: cam0-default-reset-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x03c, PIN_OUTPUT, 7)
+		>;
+	};
+
+	cam1_reset_pins_default: cam1-default-reset-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x044, PIN_OUTPUT, 7)
+		>;
+	};
+
+	cam2_reset_pins_default: cam2-default-reset-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x04c, PIN_OUTPUT, 7)
+		>;
+	};
+
+	cam3_reset_pins_default: cam3-default-reset-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x054, PIN_OUTPUT, 7)
+		>;
+	};
+};
+
+&exp1 {
+	p06-hog{
+		/* P06 - CSI01_MUX_SEL_2 */
+		gpio-hog;
+		gpios = <6 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "CSI01_MUX_SEL_2";
+	};
+
+	p07-hog{
+		/* P01 - CSI23_MUX_SEL_2 */
+		gpio-hog;
+		gpios = <7 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "CSI23_MUX_SEL_2";
+	};
+};
+
+&main_gpio0 {
+	p15-hog {
+		/* P15 - CSI2_CAMERA_GPIO1 */
+		gpio-hog;
+		gpios = <15 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "CSI2_CAMERA_GPIO1";
+	};
+
+	p17-hog {
+		/* P17 - CSI2_CAMERA_GPIO2 */
+		gpio-hog;
+		gpios = <17 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "CSI2_CAMERA_GPIO2";
+	};
+
+	p19-hog {
+		/* P19 - CSI2_CAMERA_GPIO3 */
+		gpio-hog;
+		gpios = <19 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "CSI2_CAMERA_GPIO3";
+	};
+
+	p21-hog {
+		/* P21 - CSI2_CAMERA_GPIO4 */
+		gpio-hog;
+		gpios = <21 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "CSI2_CAMERA_GPIO4";
+	};
+};
+
+&pca9543_0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	i2c@0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0>;
+
+		ov5640_0: camera@3c {
+			compatible = "ovti,ov5640";
+			reg = <0x3c>;
+			clocks = <&clk_ov5640_fixed>;
+			clock-names = "xclk";
+
+			AVDD-supply = <&reg_2p8v>;
+			DOVDD-supply = <&reg_1p8v>;
+			DVDD-supply = <&reg_3p3v>;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&cam0_reset_pins_default>;
+
+			port {
+				csi2_cam0: endpoint {
+					remote-endpoint = <&csi2rx0_in_sensor>;
+					clock-lanes = <0>;
+					data-lanes = <1 2>;
+				};
+			};
+		};
+	};
+
+	i2c@1 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <1>;
+
+		ov5640_1: camera@3c {
+			compatible = "ovti,ov5640";
+			reg = <0x3c>;
+			clocks = <&clk_ov5640_fixed>;
+			clock-names = "xclk";
+
+			AVDD-supply = <&reg_2p8v>;
+			DOVDD-supply = <&reg_1p8v>;
+			DVDD-supply = <&reg_3p3v>;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&cam1_reset_pins_default>;
+
+			port {
+				csi2_cam1: endpoint {
+					remote-endpoint = <&csi2rx1_in_sensor>;
+					clock-lanes = <0>;
+					data-lanes = <1 2>;
+				};
+			};
+		};
+	};
+};
+
+&pca9543_1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	i2c@0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0>;
+
+		ov5640_2: camera@3c {
+			compatible = "ovti,ov5640";
+			reg = <0x3c>;
+			clocks = <&clk_ov5640_fixed>;
+			clock-names = "xclk";
+
+			AVDD-supply = <&reg_2p8v>;
+			DOVDD-supply = <&reg_1p8v>;
+			DVDD-supply = <&reg_3p3v>;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&cam2_reset_pins_default>;
+
+			port {
+				csi2_cam2: endpoint {
+					remote-endpoint = <&csi2rx2_in_sensor>;
+					clock-lanes = <0>;
+					data-lanes = <1 2>;
+				};
+			};
+		};
+	};
+
+	i2c@1 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <1>;
+
+		ov5640_3: camera@3c {
+			compatible = "ovti,ov5640";
+			reg = <0x3c>;
+			clocks = <&clk_ov5640_fixed>;
+			clock-names = "xclk";
+
+			AVDD-supply = <&reg_2p8v>;
+			DOVDD-supply = <&reg_1p8v>;
+			DVDD-supply = <&reg_3p3v>;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&cam3_reset_pins_default>;
+
+			port {
+				csi2_cam3: endpoint {
+					remote-endpoint = <&csi2rx3_in_sensor>;
+					clock-lanes = <0>;
+					data-lanes = <1 2>;
+				};
+			};
+		};
+	};
+};
+
+&cdns_csi2rx0 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		csi0_port0: port@0 {
+			reg = <0>;
+			status = "okay";
+
+			csi2rx0_in_sensor: endpoint {
+				remote-endpoint = <&csi2_cam0>;
+				bus-type = <4>; /* CSI2 DPHY */
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+			};
+		};
+	};
+};
+
+&cdns_csi2rx1 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		csi1_port0: port@0 {
+			reg = <0>;
+			status = "okay";
+
+			csi2rx1_in_sensor: endpoint {
+				remote-endpoint = <&csi2_cam1>;
+				bus-type = <4>; /* CSI2 DPHY */
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+			};
+		};
+	};
+};
+
+&cdns_csi2rx2 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		csi2_port0: port@0 {
+			reg = <0>;
+			status = "okay";
+
+			csi2rx2_in_sensor: endpoint {
+				remote-endpoint = <&csi2_cam2>;
+				bus-type = <4>; /* CSI2 DPHY */
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+			};
+		};
+	};
+};
+
+&cdns_csi2rx3 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		csi3_port0: port@0 {
+			reg = <0>;
+			status = "okay";
+
+			csi2rx3_in_sensor: endpoint {
+				remote-endpoint = <&csi2_cam3>;
+				bus-type = <4>; /* CSI2 DPHY */
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+			};
+		};
+	};
+};
+
+&ti_csi2rx0 {
+	status = "okay";
+};
+
+&dphy0 {
+	status = "okay";
+};
+
+&ti_csi2rx1 {
+	status = "okay";
+};
+
+&dphy1 {
+	status = "okay";
+};
+
+
+&ti_csi2rx2 {
+	status = "okay";
+};
+
+&dphy2 {
+	status = "okay";
+};
+
+
+&ti_csi2rx3 {
+	status = "okay";
+};
+
+&dphy3 {
+	status = "okay";
+};
-- 
2.34.1

