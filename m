Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86E3280CC8;
	Tue,  3 Jun 2025 09:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748941479; cv=none; b=WRws2J94VrrCI/V4dv6CllIHlgp6//ZHakEXYHiUoz2pmlbqFROmyvidrHcPITlPkvtweOFf29uwzKR3SiQJ9G+YwdLiZIhM2wNKOwFAuNFYMVgkEM7rVNeyiV/oB9TFUhva3LJu8UegaBl5c2jK53lMA2LqVaa2qAPyFYnKuLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748941479; c=relaxed/simple;
	bh=/P4Iybl2mRkgg5CvvY1kiXeUd0Yn7BAefp7unwcjH9w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=kuyCLZQJ3p0r6UNnspWB5udFrT2DgQ18sqiQQvuwY9MxVB2iI8A/tgrB6xefTp3uBvUwEbTzvuAshci+OVtnxRIKQpRCWA+ZlwQW6HvnE6YVc5Sl4blhMy/Xru57zFXSvQx/1CxdeHWw8RCfb6Y+3VCRS9fe8pnLa1A5JGt2RNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=rkPh9i2G; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="rkPh9i2G"
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5538ZlQ8006601;
	Tue, 3 Jun 2025 11:04:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	YfJMaO0eYguXaUJRaguoa/RcLyZPTE29pUZJ917p4ro=; b=rkPh9i2GqDNCK3sZ
	ZTRkUM0vNz0f8uRzgJjNKJty0KSaz9muvAeIJW+7DuKuYwQFUO8Py+yMCPXQM0lg
	Xw1hku1g8GFF4c9X0wgl2udN31KgXcK7+73jyHfWS4mV+fRM9RkYHnI/z54fx7EW
	qBOCoBHcDVWjuDis14AW2gY98bogSa4r3iQTz1qujOqFLzBDY+cxEfZmvmOXU+Be
	U4m8GZW9LzAgYmgrYuirxYAHMOX9HsY8YGBcQIcf7kT6wwhTGR0AqhfB6luYWhz4
	+eUI5zZwOnkBH6WvlFdQH5ucJNRKWVgDWLHsqi4QF0aDUc0hEEWRa04h/dnIu1ZM
	GWXBFw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 471g8stuv6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Jun 2025 11:04:25 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4E73640058;
	Tue,  3 Jun 2025 11:03:19 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 996476CF2C8;
	Tue,  3 Jun 2025 11:02:36 +0200 (CEST)
Received: from localhost (10.48.87.237) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Jun
 2025 11:02:36 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Tue, 3 Jun 2025 11:02:13 +0200
Subject: [PATCH v2 7/7] ARM: dts: stm32: add stm32mp157f-dk2 board support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250603-stm32mp157f-dk2-v2-7-5be0854a9299@foss.st.com>
References: <20250603-stm32mp157f-dk2-v2-0-5be0854a9299@foss.st.com>
In-Reply-To: <20250603-stm32mp157f-dk2-v2-0-5be0854a9299@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Amelie Delaunay <amelie.delaunay@foss.st.com>,
        Himanshu Bhavani
	<himanshu.bhavani@siliconsignals.io>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01

STM32MP157F-DK2 board embeds a STM32MP157F SoC. This SoC contains the same
level of feature than a STM32MP157C SOC but A7 clock frequency can reach
800MHz, hence the inclusion of the newly introduced stm32mp15xf.dtsi.

As for other latest STM32 MPU families, STM32MP157F-DK2 relies on OP-TEE
SCMI services for SoC clock and reset controllers resources, and for PMIC,
now under OP-TEE control. That's why stm32mp157f-dk2-scmi.dtsi is
introduced, to move all clocks, resets and regulators to SCMI-based ones.

To "disable" SCMI, just need to comment stm32mp157f-dk2-scmi.dtsi inclusion
and to replace &scmi_v3v3 with &v3v3, then to disable arm_wdt and to enable
i2c4 and its subnodes for PMIC support by Linux. Reconfigure usbotg for
dual role with type-C support if needed.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>

---
Changes in v2:
- rename stm32mp157x-dk2-scmi.dtsi into stm32mp157f-dk2-scmi.dtsi
- cleanup stm32mp157f-dk2-scmi.dtsi (remove comments and useless properties)
- disable iwdg2 and add arm,smc-wdt watchdog in stm32mp157f-dk2-scmi.dtsi
- set 32s timeout and enable arm_wdt
- move (sort) stm32mp157f-dk2.dtb in Makefile
---
 arch/arm/boot/dts/st/Makefile                  |   3 +-
 arch/arm/boot/dts/st/stm32mp157f-dk2-scmi.dtsi | 196 +++++++++++++++++++++++++
 arch/arm/boot/dts/st/stm32mp157f-dk2.dts       | 179 ++++++++++++++++++++++
 3 files changed, 377 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/st/Makefile b/arch/arm/boot/dts/st/Makefile
index cc9948b9870f7f73629573149bfd342af75b07da..66d4f96da5ddbba337c2f290512a74b85e5c568e 100644
--- a/arch/arm/boot/dts/st/Makefile
+++ b/arch/arm/boot/dts/st/Makefile
@@ -72,7 +72,8 @@ dtb-$(CONFIG_ARCH_STM32) += \
 	stm32mp157c-odyssey.dtb \
 	stm32mp157c-osd32mp1-red.dtb \
 	stm32mp157c-phycore-stm32mp1-3.dtb \
-	stm32mp157c-ultra-fly-sbc.dtb
+	stm32mp157c-ultra-fly-sbc.dtb \
+	stm32mp157f-dk2.dtb
 dtb-$(CONFIG_ARCH_U8500) += \
 	ste-snowball.dtb \
 	ste-hrefprev60-stuib.dtb \
diff --git a/arch/arm/boot/dts/st/stm32mp157f-dk2-scmi.dtsi b/arch/arm/boot/dts/st/stm32mp157f-dk2-scmi.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..89de85a2eff327f20336552692c833f5627cb6f7
--- /dev/null
+++ b/arch/arm/boot/dts/st/stm32mp157f-dk2-scmi.dtsi
@@ -0,0 +1,196 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2025 - All Rights Reserved
+ * Author: Amelie Delaunay <amelie.delaunay@foss.st.com> for STMicroelectronics.
+ */
+
+#include "stm32mp15-scmi.dtsi"
+
+/ {
+	reserved-memory {
+		optee@de000000 {
+			reg = <0xde000000 0x2000000>;
+			no-map;
+		};
+	};
+
+	arm_wdt: watchdog {
+		compatible = "arm,smc-wdt";
+		arm,smc-id = <0xbc000000>;
+		status = "disabled";
+	};
+
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
+	status = "disabled";
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
+	};
+
+	scmi_vdd: regulator@5 {
+		reg = <VOLTD_SCMI_STPMIC1_BUCK3>;
+		regulator-name = "vdd";
+	};
+
+	scmi_v3v3: regulator@6 {
+		reg = <VOLTD_SCMI_STPMIC1_BUCK4>;
+		regulator-name = "v3v3";
+	};
+
+	scmi_v1v8_audio: regulator@7 {
+		reg = <VOLTD_SCMI_STPMIC1_LDO1>;
+		regulator-name = "v1v8_audio";
+	};
+
+	scmi_v3v3_hdmi: regulator@8 {
+		reg = <VOLTD_SCMI_STPMIC1_LDO2>;
+		regulator-name = "v3v3_hdmi";
+	};
+
+	scmi_vdd_usb: regulator@a {
+		reg = <VOLTD_SCMI_STPMIC1_LDO4>;
+		regulator-name = "vdd_usb";
+	};
+
+	scmi_vdda: regulator@b {
+		reg = <VOLTD_SCMI_STPMIC1_LDO5>;
+		regulator-name = "vdda";
+	};
+
+	scmi_v1v2_hdmi: regulator@c {
+		reg = <VOLTD_SCMI_STPMIC1_LDO6>;
+		regulator-name = "v1v2_hdmi";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		regulator-always-on;
+	};
+
+	scmi_vbus_otg: regulator@f {
+		reg = <VOLTD_SCMI_STPMIC1_PWR_SW1>;
+		regulator-name = "vbus_otg";
+	 };
+
+	 scmi_vbus_sw: regulator@10 {
+		reg = <VOLTD_SCMI_STPMIC1_PWR_SW2>;
+		regulator-name = "vbus_sw";
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
diff --git a/arch/arm/boot/dts/st/stm32mp157f-dk2.dts b/arch/arm/boot/dts/st/stm32mp157f-dk2.dts
new file mode 100644
index 0000000000000000000000000000000000000000..43375c4d62a3cd07609a99b91be42f87f3f4ed96
--- /dev/null
+++ b/arch/arm/boot/dts/st/stm32mp157f-dk2.dts
@@ -0,0 +1,179 @@
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
+#include "stm32mp157f-dk2-scmi.dtsi"
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
+&arm_wdt {
+	timeout-sec = <32>;
+	status = "okay";
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

-- 
2.25.1

