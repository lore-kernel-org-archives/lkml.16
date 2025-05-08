Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC1B279791;
	Thu,  8 May 2025 15:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746719585; cv=none; b=lHqqqiOVpD06dSOkKTYBrjCbHb3aeEOYzL9QF65i+kt6yMsLEFdFOPKI5HsIABRAugTAvjBtAtgHMCZwzj7kstuFpPiy4hnloohmgcdJ8PqWKq8xeQfJbREYkefs0WzRFHbdZLsOPHhpfQxiu02HGMAL5GtooPwTalbC3dAl6+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746719585; c=relaxed/simple;
	bh=F/q9V2sM+hxPkDRhThRcshxDMo5H7oWL7zvs20GHR2g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SVkNv8pEOIeaCR4eU6YSHsrgDl8d0aFEobZisNX68ToELoRb3vntb/5cRABEbMahrd/62MgcW3mzxsykP672cJDuoN5DOOufgQ+R1MVMIEVXWXmt7EIRiw4lvDhB9PLsMYjqEGvfRJaLH5MD2u10nfn/NND2MioLu6rcQy9+vBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=iZ3PVDJ1; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="iZ3PVDJ1"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 548FqnFn1704159
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 8 May 2025 10:52:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746719569;
	bh=33sKYYkXDp1y4LV52B5pg7ZkBuRmivNNRuVE+7WRY68=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=iZ3PVDJ1oVypnLzeqMYYkW0jiQ2xr+MY+fQVNNu0PkP4nApb5RIfs5+P6iM8g58/R
	 qSOG0OdDetdg5E9gm76lsyd7B6+8FCmVyA3/UPSsbLupDh9Pmq0WfJlWtFNAeVsEEB
	 R4U9oFiUiP3O4/EzrLbsApODHqit6e2puNDKWJ/c=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 548Fqn9b028061
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 May 2025 10:52:49 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 May 2025 10:52:48 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 May 2025 10:52:48 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 548Fq2oN050794;
	Thu, 8 May 2025 10:52:44 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <vaishnav.a@ti.com>, <u-kumar1@ti.com>, <r-donadkar@ti.com>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <jai.luthra@linux.dev>, <linux-kernel@vger.kernel.org>,
        <y-abhilashchandra@ti.com>
Subject: [PATCH v2 3/4] arm64: dts: ti: k3-j722s-evm: Add overlay for quad IMX219
Date: Thu, 8 May 2025 21:21:33 +0530
Message-ID: <20250508155134.2026300-4-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250508155134.2026300-1-y-abhilashchandra@ti.com>
References: <20250508155134.2026300-1-y-abhilashchandra@ti.com>
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

RPi v2 Camera (IMX219) is an 8MP camera that can be used with J722S EVM
through the 22-pin CSI-RX connector. Add a reference overlay for quad
IMX219 RPI camera v2 modules on J722S EVM

Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
 arch/arm64/boot/dts/ti/Makefile               |   5 +
 ...k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtso | 329 ++++++++++++++++++
 2 files changed, 334 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 3c3aa09a94b6..b317eaff64cc 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -132,6 +132,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-pcie1-ep.dtbo
 # Boards with J722s SoC
 dtb-$(CONFIG_ARCH_K3) += k3-am67a-beagley-ai.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtbo
 
 # Boards with J784s4 SoC
 dtb-$(CONFIG_ARCH_K3) += k3-am69-sk.dtb
@@ -227,6 +228,8 @@ k3-j721s2-evm-pcie1-ep-dtbs := k3-j721s2-common-proc-board.dtb \
 	k3-j721s2-evm-pcie1-ep.dtbo
 k3-j742s2-evm-usb0-type-a-dtbs := k3-j742s2-evm.dtb \
 	k3-j784s4-j742s2-evm-usb0-type-a.dtbo
+k3-j722s-evm-csi2-quad-rpi-cam-imx219-dtbs := k3-j722s-evm.dtb \
+	k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtbo
 k3-j784s4-evm-pcie0-pcie1-ep-dtbs := k3-j784s4-evm.dtb \
 	k3-j784s4-evm-pcie0-pcie1-ep.dtbo
 k3-j784s4-evm-quad-port-eth-exp1-dtbs := k3-j784s4-evm.dtb \
@@ -264,6 +267,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtb \
 	k3-j721s2-evm-pcie1-ep.dtb \
 	k3-j742s2-evm-usb0-type-a.dtb \
+	k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtb \
 	k3-j784s4-evm-pcie0-pcie1-ep.dtb \
 	k3-j784s4-evm-quad-port-eth-exp1.dtb \
 	k3-j784s4-evm-usb0-type-a.dtb \
@@ -288,5 +292,6 @@ DTC_FLAGS_k3-j721e-common-proc-board += -@
 DTC_FLAGS_k3-j721e-evm-pcie0-ep += -@
 DTC_FLAGS_k3-j721e-sk += -@
 DTC_FLAGS_k3-j721s2-common-proc-board += -@
+DTC_FLAGS_k3-j722s-evm += -@
 DTC_FLAGS_k3-j784s4-evm += -@
 DTC_FLAGS_k3-j742s2-evm += -@
diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtso b/arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtso
new file mode 100644
index 000000000000..5e5f08dd2ba9
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtso
@@ -0,0 +1,329 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * DT Overlay for RPi Camera V2.1 on J722S-EVM board.
+ *
+ * Copyright (C) 2025 Texas Instruments Incorporated - https://www.ti.com/
+ *
+ * Schematics: https://datasheets.raspberrypi.com/camera/camera-v2-schematics.pdf
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include "k3-pinctrl.h"
+
+&main_pmx0 {
+	cam0_reset_pins_default: cam0-default-reset-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x03c, PIN_OUTPUT, 7) /* (R22) GPIO0_15 */
+		>;
+	};
+
+	cam1_reset_pins_default: cam1-default-reset-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x044, PIN_OUTPUT, 7) /* (R26) GPIO0_17 */
+		>;
+	};
+
+	cam2_reset_pins_default: cam2-default-reset-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x04c, PIN_OUTPUT, 7) /* (T25) GPIO0_19 */
+		>;
+	};
+
+	cam3_reset_pins_default: cam3-default-reset-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x054, PIN_OUTPUT, 7) /* (T21) GPIO0_21 */
+		>;
+	};
+};
+
+&{/} {
+	clk_imx219_fixed: clock-24000000 {
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
+		vin-supply = <&vcc_3v3_exp>;
+		regulator-always-on;
+	};
+
+	reg_1p8v: regulator-1p8v {
+		compatible = "regulator-fixed";
+		regulator-name = "1P8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vcc_3v3_exp>;
+		regulator-always-on;
+	};
+
+	reg_1p2v: regulator-1p2v {
+		compatible = "regulator-fixed";
+		regulator-name = "1P2V";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		vin-supply = <&vcc_3v3_exp>;
+		regulator-always-on;
+	};
+};
+
+&csi01_mux {
+	idle-state = <1>;
+};
+
+&csi23_mux {
+	idle-state = <1>;
+};
+
+&pca9543_0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	/* CAM0 I2C */
+	i2c@0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0>;
+
+		imx219_0: sensor@10 {
+			compatible = "sony,imx219";
+			reg = <0x10>;
+
+			clocks = <&clk_imx219_fixed>;
+
+			VANA-supply = <&reg_2p8v>;
+			VDIG-supply = <&reg_1p8v>;
+			VDDL-supply = <&reg_1p2v>;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&cam0_reset_pins_default>;
+
+			reset-gpios = <&main_gpio0 15 GPIO_ACTIVE_HIGH>;
+
+			port {
+				csi2_cam0: endpoint {
+					remote-endpoint = <&csi2rx0_in_sensor>;
+					link-frequencies = /bits/ 64 <456000000>;
+					clock-lanes = <0>;
+					data-lanes = <1 2>;
+				};
+			};
+		};
+	};
+
+	/* CAM1 I2C */
+	i2c@1 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <1>;
+
+		imx219_1: sensor@10 {
+			compatible = "sony,imx219";
+			reg = <0x10>;
+
+			clocks = <&clk_imx219_fixed>;
+
+			VANA-supply = <&reg_2p8v>;
+			VDIG-supply = <&reg_1p8v>;
+			VDDL-supply = <&reg_1p2v>;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&cam1_reset_pins_default>;
+
+			reset-gpios = <&main_gpio0 17 GPIO_ACTIVE_HIGH>;
+
+			port {
+				csi2_cam1: endpoint {
+					remote-endpoint = <&csi2rx1_in_sensor>;
+					link-frequencies = /bits/ 64 <456000000>;
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
+	/* CAM0 I2C */
+	i2c@0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0>;
+
+		imx219_2: sensor@10 {
+			compatible = "sony,imx219";
+			reg = <0x10>;
+
+			clocks = <&clk_imx219_fixed>;
+
+			VANA-supply = <&reg_2p8v>;
+			VDIG-supply = <&reg_1p8v>;
+			VDDL-supply = <&reg_1p2v>;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&cam2_reset_pins_default>;
+
+			reset-gpios = <&main_gpio0 19 GPIO_ACTIVE_HIGH>;
+
+			port {
+				csi2_cam2: endpoint {
+					remote-endpoint = <&csi2rx2_in_sensor>;
+					link-frequencies = /bits/ 64 <456000000>;
+					clock-lanes = <0>;
+					data-lanes = <1 2>;
+				};
+			};
+		};
+	};
+
+	/* CAM1 I2C */
+	i2c@1 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <1>;
+
+		imx219_3: sensor@10 {
+			compatible = "sony,imx219";
+			reg = <0x10>;
+
+			clocks = <&clk_imx219_fixed>;
+
+			VANA-supply = <&reg_2p8v>;
+			VDIG-supply = <&reg_1p8v>;
+			VDDL-supply = <&reg_1p2v>;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&cam3_reset_pins_default>;
+
+			reset-gpios = <&main_gpio0 21 GPIO_ACTIVE_HIGH>;
+
+			port {
+				csi2_cam3: endpoint {
+					remote-endpoint = <&csi2rx3_in_sensor>;
+					link-frequencies = /bits/ 64 <456000000>;
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
+&ti_csi2rx2 {
+	status = "okay";
+};
+
+&dphy2 {
+	status = "okay";
+};
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

