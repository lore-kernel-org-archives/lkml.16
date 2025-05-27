Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C18271458;
	Tue, 27 May 2025 13:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748351151; cv=none; b=KEVuu/LR+nWkXWY31H0fMjG/chvDKjtrG0pOdjqtXMicxs55Pb6XudPNl3F6WFAprZiIpN2aGqjmqkK+NajQ4w5Ey7MKjq2UWMejbwwrqX7JAWEsJFmFWJdXOto0lQSYcyHB5MXtzcd/33Xu9j2F9twbseTvRv67wQAt++Mk2fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748351151; c=relaxed/simple;
	bh=yVLtlANTW6WRNVq421In8bycDA8FAdkEmb2SAjhCams=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=A+5F75docx0zG88zo1rgY9yLDa5yO8aRqPDFMP7U6EeKFe4s4qH8OiFre4az62WxWHABh3D/PeqWKGf56eHQwk3liOUivyDL9YnKS+rkJyh69pEsKARbDZfJaJNV0Y0Yp5RaavJOT8y6mklRW4XJsu0zoF6maAmMZpKxPinbnQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=dQMGJQCY; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="dQMGJQCY"
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RA7oYm032253;
	Tue, 27 May 2025 15:05:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	dlyX6SX6KMKhkZJ9DrcXWl6eODnOb3MaM+058SXyIEU=; b=dQMGJQCYqELORIFt
	gxrl3p4jrVANjQU9REsx3HKm/0Zs9BzVMuwVfSy67KyJTeI9UZXGbYgkDiD8JB7z
	PEMFWAwzy+WX31sTk9iYtgpl1oslhddOqked08pOHGXTCBdSGBf15jOntgPhTFmY
	mqlrc8Wxak0mYzo9+k2vM4KIn80+TUp9+3OICpAx0oF9MjFcuNP//p+0j5sTFP9a
	Z4nKRMivJN143X0ogrPpCVlU9ei0bx1RsgD4QpVUOIfktyalyiMPj10fRFuaE4UB
	VU2kQKc1Yl6aGJZn9HuBSRXDBvIWblTwPd2azULoV9QlbV+zyhiYdInmRCgk/EMW
	rTVDQw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46uqp4j1n4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 May 2025 15:05:38 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3E89040051;
	Tue, 27 May 2025 15:04:32 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 64843AE080F;
	Tue, 27 May 2025 15:03:50 +0200 (CEST)
Received: from localhost (10.48.86.139) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 27 May
 2025 15:03:50 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Tue, 27 May 2025 15:03:21 +0200
Subject: [PATCH 5/5] ARM: dts: stm32: add stm32mp157f-dk2 board support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250527-stm32mp157f-dk2-v1-5-8aef885a4928@foss.st.com>
References: <20250527-stm32mp157f-dk2-v1-0-8aef885a4928@foss.st.com>
In-Reply-To: <20250527-stm32mp157f-dk2-v1-0-8aef885a4928@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Amelie Delaunay <amelie.delaunay@foss.st.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_06,2025-05-27_01,2025-03-28_01

STM32MP157F-DK2 board embeds a STM32MP157F SoC. This SoC contains the same
level of feature than a STM32MP157C SOC but A7 clock frequency can reach
800MHz, hence the inclusion of the newly introduced stm32mp15xf.dtsi.

As for other latest STM32 MPU families, STM32MP157F-DK2 relies on OP-TEE
SCMI services for SoC clock and reset controllers resources, and for PMIC,
now under OP-TEE control. That's why stm32mp157x-dk2-scmi.dtsi is
introduced, to move all clocks, resets and regulators to SCMI-based ones.

To "disable" SCMI, just need to comment stm32mp157x-dk2-scmi.dtsi inclusion
and to replace &scmi_v3v3 with &v3v3, then to enable i2c4 and its subnodes
for PMIC support by Linux. Reconfigure usbotg for dual role with type-C
support if needed.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 arch/arm/boot/dts/st/Makefile                  |   1 +
 arch/arm/boot/dts/st/stm32mp157f-dk2.dts       | 174 +++++++++++++++++
 arch/arm/boot/dts/st/stm32mp157x-dk2-scmi.dtsi | 252 +++++++++++++++++++++++++
 3 files changed, 427 insertions(+)

diff --git a/arch/arm/boot/dts/st/Makefile b/arch/arm/boot/dts/st/Makefile
index cc9948b9870f7f73629573149bfd342af75b07da..8e17a4a847a385b677df6f3a34e943ae4368a068 100644
--- a/arch/arm/boot/dts/st/Makefile
+++ b/arch/arm/boot/dts/st/Makefile
@@ -61,6 +61,7 @@ dtb-$(CONFIG_ARCH_STM32) += \
 	stm32mp157c-dhcom-picoitx.dtb \
 	stm32mp157c-dk2.dtb \
 	stm32mp157c-dk2-scmi.dtb \
+	stm32mp157f-dk2.dtb \
 	stm32mp157c-ed1.dtb \
 	stm32mp157c-ed1-scmi.dtb \
 	stm32mp157c-emsbc-argon.dtb \
diff --git a/arch/arm/boot/dts/st/stm32mp157f-dk2.dts b/arch/arm/boot/dts/st/stm32mp157f-dk2.dts
new file mode 100644
index 0000000000000000000000000000000000000000..c40e22a6737df075563c93b0b460a00d5ede376c
--- /dev/null
+++ b/arch/arm/boot/dts/st/stm32mp157f-dk2.dts
@@ -0,0 +1,174 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2025 - All Rights Reserved
+ * Author: Amelie Delaunay <amelie.delaunay@foss.st.com> for STMicroelectronics.
+ */
+
+/dts-v1/;
+
+#include "stm32mp157.dtsi"
+#include "stm32mp15xf.dtsi"
+#include "stm32mp15-pinctrl.dtsi"
+#include "stm32mp15xxac-pinctrl.dtsi"
+#include "stm32mp15xx-dkx.dtsi"
+#include "stm32mp157x-dk2-scmi.dtsi"
+
+/ {
+	model = "STMicroelectronics STM32MP157F-DK2 Discovery Board";
+	compatible = "st,stm32mp157f-dk2", "st,stm32mp157";
+
+	aliases {
+		ethernet0 = &ethernet0;
+		serial3 = &usart2;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	wifi_pwrseq: wifi-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpioh 4 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&cryp1 {
+	status = "okay";
+};
+
+&dsi {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	panel@0 {
+		compatible = "orisetech,otm8009a";
+		reg = <0>;
+		reset-gpios = <&gpioe 4 GPIO_ACTIVE_LOW>;
+		power-supply = <&scmi_v3v3>;
+		status = "okay";
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&dsi_out>;
+			};
+		};
+	};
+};
+
+&dsi_in {
+	remote-endpoint = <&ltdc_ep1_out>;
+};
+
+&dsi_out {
+	remote-endpoint = <&panel_in>;
+};
+
+&i2c1 {
+	touchscreen@38 {
+		compatible = "focaltech,ft6236";
+		reg = <0x38>;
+		interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-parent = <&gpiof>;
+		touchscreen-size-x = <480>;
+		touchscreen-size-y = <800>;
+		status = "okay";
+	};
+};
+
+/* I2C4 is managed by OP-TEE */
+&i2c4 {
+	status = "disabled";
+
+	/* i2c4 subnodes, which won't be managed by Linux */
+	typec@28 {
+		status = "disabled";
+		connector {
+			status = "disabled";
+		};
+	};
+
+	stpmic@33 {
+		status = "disabled";
+	};
+};
+
+&ltdc {
+	status = "okay";
+
+	port {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ltdc_ep1_out: endpoint@1 {
+			reg = <1>;
+			remote-endpoint = <&dsi_in>;
+		};
+	};
+};
+
+&rtc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&rtc_rsvd_pins_a>;
+
+	rtc_lsco_pins_a: rtc-lsco-0 {
+		pins = "out2_rmp";
+		function = "lsco";
+	};
+};
+
+/* Wifi */
+&sdmmc2 {
+	pinctrl-names = "default", "opendrain", "sleep";
+	pinctrl-0 = <&sdmmc2_b4_pins_a>;
+	pinctrl-1 = <&sdmmc2_b4_od_pins_a>;
+	pinctrl-2 = <&sdmmc2_b4_sleep_pins_a>;
+	non-removable;
+	cap-sdio-irq;
+	st,neg-edge;
+	bus-width = <4>;
+	vmmc-supply = <&scmi_v3v3>;
+	mmc-pwrseq = <&wifi_pwrseq>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	brcmf: wifi@1 {
+		reg = <1>;
+		compatible = "brcm,bcm4329-fmac";
+		pinctrl-names = "default";
+		pinctrl-0 = <&rtc_lsco_pins_a>;
+	};
+};
+
+/* Bluetooth */
+&usart2 {
+	pinctrl-names = "default", "sleep", "idle";
+	pinctrl-0 = <&usart2_pins_c>;
+	pinctrl-1 = <&usart2_sleep_pins_c>;
+	pinctrl-2 = <&usart2_idle_pins_c>;
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		shutdown-gpios = <&gpioz 6 GPIO_ACTIVE_HIGH>;
+		compatible = "brcm,bcm43438-bt";
+		max-speed = <3000000>;
+		vbat-supply = <&scmi_v3v3>;
+		vddio-supply = <&scmi_v3v3>;
+	};
+};
+
+/* Since I2C4 is disabled, STUSB1600 is also disabled so there is no Type-C support */
+&usbotg_hs {
+	dr_mode = "peripheral";
+	role-switch-default-mode = "peripheral";
+	/*
+	 * Forcing dr_mode = "peripheral"/"role-switch-default-mode = "peripheral";
+	 * will cause the pull-up on D+/D- to be raised as soon as the OTG is configured at runtime,
+	 * regardless of the presence of VBUS. Notice that on self-powered devices like
+	 * stm32mp157f-dk2, this isn't compliant with the USB standard. That's why usbotg_hs is kept
+	 * disabled here.
+	 */
+	status = "disabled";
+};
diff --git a/arch/arm/boot/dts/st/stm32mp157x-dk2-scmi.dtsi b/arch/arm/boot/dts/st/stm32mp157x-dk2-scmi.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..0c55203ae1520029abcda3bb47513815d0c4bfc1
--- /dev/null
+++ b/arch/arm/boot/dts/st/stm32mp157x-dk2-scmi.dtsi
@@ -0,0 +1,252 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2025 - All Rights Reserved
+ * Author: Amelie Delaunay <amelie.delaunay@foss.st.com> for STMicroelectronics.
+ */
+
+#include <dt-bindings/regulator/st,stm32mp15-regulator.h>
+#include "stm32mp15-scmi.dtsi"
+
+/ {
+	reserved-memory {
+		optee@de000000 {
+			reg = <0xde000000 0x2000000>;
+			no-map;
+		};
+	};
+};
+
+&adc {
+	vdd-supply = <&scmi_vdd>;
+	vdda-supply = <&scmi_vdd>;
+};
+
+&cpu0 {
+	clocks = <&scmi_clk CK_SCMI_MPU>;
+};
+
+&cpu1 {
+	clocks = <&scmi_clk CK_SCMI_MPU>;
+};
+
+&cryp1 {
+	clocks = <&scmi_clk CK_SCMI_CRYP1>;
+	resets = <&scmi_reset RST_SCMI_CRYP1>;
+};
+
+&cs42l51 {
+	VL-supply = <&scmi_v3v3>;
+	VD-supply = <&scmi_v1v8_audio>;
+	VA-supply = <&scmi_v1v8_audio>;
+	VAHP-supply = <&scmi_v1v8_audio>;
+};
+
+&dsi {
+	phy-dsi-supply = <&scmi_reg18>;
+	clocks = <&rcc DSI>, <&scmi_clk CK_SCMI_HSE>, <&rcc DSI_PX>;
+};
+
+&gpioz {
+	clocks = <&scmi_clk CK_SCMI_GPIOZ>;
+};
+
+&hash1 {
+	clocks = <&scmi_clk CK_SCMI_HASH1>;
+	resets = <&scmi_reset RST_SCMI_HASH1>;
+};
+
+&i2c1 {
+	hdmi-transmitter@39 {
+		iovcc-supply = <&scmi_v3v3_hdmi>;
+		cvcc12-supply = <&scmi_v1v2_hdmi>;
+	};
+};
+
+&iwdg2 {
+	clocks = <&rcc IWDG2>, <&scmi_clk CK_SCMI_LSI>;
+};
+
+&m4_rproc {
+	/delete-property/ st,syscfg-holdboot;
+	resets = <&scmi_reset RST_SCMI_MCU>,
+		 <&scmi_reset RST_SCMI_MCU_HOLD_BOOT>;
+	reset-names = "mcu_rst", "hold_boot";
+};
+
+&mdma1 {
+	resets = <&scmi_reset RST_SCMI_MDMA>;
+};
+
+&optee {
+	interrupt-parent = <&intc>;
+	interrupts = <GIC_PPI 15 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
+};
+
+&pwr_regulators {
+	vdd-supply = <&scmi_vdd>;
+	vdd_3v3_usbfs-supply = <&scmi_vdd_usb>;
+	status = "disabled";
+};
+
+&rcc {
+	compatible = "st,stm32mp1-rcc-secure", "syscon";
+	clock-names = "hse", "hsi", "csi", "lse", "lsi";
+	clocks = <&scmi_clk CK_SCMI_HSE>,
+		 <&scmi_clk CK_SCMI_HSI>,
+		 <&scmi_clk CK_SCMI_CSI>,
+		 <&scmi_clk CK_SCMI_LSE>,
+		 <&scmi_clk CK_SCMI_LSI>;
+};
+
+&rng1 {
+	clocks = <&scmi_clk CK_SCMI_RNG1>;
+	resets = <&scmi_reset RST_SCMI_RNG1>;
+};
+
+&rtc {
+	clocks = <&scmi_clk CK_SCMI_RTCAPB>, <&scmi_clk CK_SCMI_RTC>;
+};
+
+&scmi_reguls {
+	scmi_vddcore: regulator@3 {
+		reg = <VOLTD_SCMI_STPMIC1_BUCK1>;
+		regulator-name = "vddcore";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1350000>;
+		regulator-always-on;
+		/*
+		 * Not supported by SCMI regu, handled in SCMI server
+		 * regulator-over-current-protection;
+		 * regulator-initial-mode = <0>;
+		 */
+	};
+
+	scmi_vdd: regulator@5 {
+		reg = <VOLTD_SCMI_STPMIC1_BUCK3>;
+		regulator-name = "vdd";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		/*
+		 * Not supported by SCMI regu, handled in SCMI server
+		 * regulator-over-current-protection;
+		 * regulator-initial-mode = <0>;
+		 * st,mask-reset;
+		 */
+	};
+
+	scmi_v3v3: regulator@6 {
+		reg = <VOLTD_SCMI_STPMIC1_BUCK4>;
+		regulator-name = "v3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		/*
+		 * Not supported by SCMI regu, handled in SCMI server
+		 * regulator-over-current-protection;
+		 * regulator-initial-mode = <0>;
+		 */
+	};
+
+	scmi_v1v8_audio: regulator@7 {
+		reg = <VOLTD_SCMI_STPMIC1_LDO1>;
+		regulator-name = "v1v8_audio";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+		/*
+		 * Not supported by SCMI regu, handled in SCMI server
+		 * interrupts = <IT_CURLIM_LDO1 0>;
+		 */
+	};
+
+	scmi_v3v3_hdmi: regulator@8 {
+		reg = <VOLTD_SCMI_STPMIC1_LDO2>;
+		regulator-name = "v3v3_hdmi";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		/*
+		 * Not supported by SCMI regu, handled in SCMI server
+		 * interrupts = <IT_CURLIM_LDO2 0>;
+		 */
+	};
+
+	scmi_vdd_usb: regulator@a {
+		reg = <VOLTD_SCMI_STPMIC1_LDO4>;
+		regulator-name = "vdd_usb";
+		/*
+		 * Not supported by SCMI regu, handled in SCMI server
+		 * interrupts = <IT_CURLIM_LDO4 0>;
+		 */
+	};
+
+	scmi_vdda: regulator@b {
+		reg = <VOLTD_SCMI_STPMIC1_LDO5>;
+		regulator-name = "vdda";
+		regulator-min-microvolt = <2900000>;
+		regulator-max-microvolt = <2900000>;
+		regulator-boot-on;
+		/*
+		 * Not supported by SCMI regu, handled in SCMI server
+		 * interrupts = <IT_CURLIM_LDO5 0>;
+		 */
+	};
+
+	scmi_v1v2_hdmi: regulator@c {
+		reg = <VOLTD_SCMI_STPMIC1_LDO6>;
+		regulator-name = "v1v2_hdmi";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		regulator-always-on;
+		/*
+		 * Not supported by SCMI regu, handled in SCMI server
+		 * interrupts = <IT_CURLIM_LDO6 0>;
+		 */
+	};
+
+	scmi_vbus_otg: regulator@f {
+		reg = <VOLTD_SCMI_STPMIC1_PWR_SW1>;
+		regulator-name = "vbus_otg";
+		/*
+		 * Not supported by SCMI regu, handled in SCMI server
+		 * interrupts = <IT_OCP_OTG 0>;
+		 */
+	 };
+
+	 scmi_vbus_sw: regulator@10 {
+		reg = <VOLTD_SCMI_STPMIC1_PWR_SW2>;
+		regulator-name = "vbus_sw";
+		/*
+		 * Not supported by SCMI regu, handled in SCMI server
+		 * interrupts = <IT_OCP_SWOUT 0>;
+		 * regulator-active-discharge = <1>;
+		 */
+	 };
+};
+
+&sdmmc1 {
+	vmmc-supply = <&scmi_v3v3>;
+};
+
+&sdmmc3 {
+	vmmc-supply = <&scmi_v3v3>;
+};
+
+&usbh_ehci {
+	hub@1 {
+		vdd-supply = <&scmi_v3v3>;
+	};
+};
+
+&usbphyc_port0 {
+	phy-supply = <&scmi_vdd_usb>;
+};
+
+&usbphyc_port1 {
+	phy-supply = <&scmi_vdd_usb>;
+};
+
+&vrefbuf {
+	vdda-supply = <&scmi_vdd>;
+};

-- 
2.25.1

