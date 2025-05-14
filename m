Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE1A2701B1;
	Wed, 14 May 2025 12:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747224569; cv=none; b=ZEW6v03OfAt3cOTiopWzknQG9gwnwLsDzV1eFVblJvPSar+inkMm777kRgzUUMwrgxq/Vk98TXRvQPQe/RYnrdpmjsQqjqZxHirAymm6tscGOeLQdAbXaNynjNx0FUt4T3eKFzpBBAw33jA1DfpeRLPojJ0A0lJBLOkKTVALlkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747224569; c=relaxed/simple;
	bh=yF8AO5tD+R39VcA1QnDUaDb7G1BeoPoDQhChc04WLWU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qnvu/kuNkI9e8xNnOhF4OthtDm/GRjx1RtnaIAl5TNZfZwI/vFvxLaI5wwAlxCy98BT6cB9t11zoX0M5LZQ+9RKlHMAGxDJVjmWVto+tyXGnZlHFJne09dtPkIp04wFzrrCMGb9a/+I7P4HnraKwZafWB02MQ4fxg8tJNhSAuT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=pNSC58T4; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="pNSC58T4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=MunZn9GrvPtIHD4LWsPpqrwqYLZmnP9w4qpC/nKv5os=; b=pNSC58T4wP9P4IIRhWkJHVONEP
	qph/9QoWvVPHfCxKfbbEhk8OhNSA8L78Y1cmkA5Vt4KPKh3oh65cF9G8AOGu66HxdKKoliEA1Bx5J
	oxNyk895p2Nm1HIukujO/MbXikUmAx5kVNfURtXuJgaOr+kS+1aUIhZhUHfyZMFk+qRlhhPuyvBqf
	xLPKiWIF58vGPZ1vZGZpfZzIJgxhRdJR8c9yavwdg+4TqB53dBHyTA/gtkkpE4heyRLxpVlXoubJy
	OhV02RCdN2m1qdkmPSEgfSmbMgHP5a8muXVOGts9zmagWshbn6zqeW66uYRxHJxjYnjqxxDiLV0A9
	d0QDOOGg==;
Received: from i53875a50.versanet.de ([83.135.90.80] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uFAvJ-0005f9-T3; Wed, 14 May 2025 14:09:21 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: quentin.schulz@cherry.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH v3 4/6] arm64: dts: rockchip: add px30-cobra base dtsi and board variants
Date: Wed, 14 May 2025 14:09:04 +0200
Message-ID: <20250514120906.2412588-5-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250514120906.2412588-1-heiko@sntech.de>
References: <20250514120906.2412588-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Heiko Stuebner <heiko.stuebner@cherry.de>

Cobra are Touchscreen devices built around the PX30 SoC using
a variety of display options.

The devices feature an EMMC, network port, usb host + OTG ports and
a 720x1280 display with a touchscreen.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 arch/arm64/boot/dts/rockchip/Makefile         |   4 +
 .../rockchip/px30-cobra-ltk050h3146w-a2.dts   |  39 ++
 .../dts/rockchip/px30-cobra-ltk050h3146w.dts  |  39 ++
 .../dts/rockchip/px30-cobra-ltk050h3148w.dts  |  39 ++
 .../dts/rockchip/px30-cobra-ltk500hd1829.dts  |  73 +++
 arch/arm64/boot/dts/rockchip/px30-cobra.dtsi  | 566 ++++++++++++++++++
 6 files changed, 760 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w-a2.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3148w.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra-ltk500hd1829.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra.dtsi

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 3e8771ef69ba..8151e8bb1cd3 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -1,4 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_ROCKCHIP) += px30-cobra-ltk050h3146w-a2.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += px30-cobra-ltk050h3146w.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += px30-cobra-ltk050h3148w.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += px30-cobra-ltk500hd1829.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += px30-evb.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += px30-engicam-px30-core-ctouch2.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += px30-engicam-px30-core-ctouch2-of10.dtb
diff --git a/arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w-a2.dts b/arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w-a2.dts
new file mode 100644
index 000000000000..1d26164be7b8
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w-a2.dts
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2025 Cherry Embedded Solutions GmbH
+ */
+
+/dts-v1/;
+#include "px30-cobra.dtsi"
+
+/ {
+	model = "Theobroma Systems Cobra with LTK050H3146W-A2 Display";
+	compatible = "tsd,px30-cobra-ltk050h3146w-a2", "tsd,px30-cobra", "rockchip,px30";
+};
+
+&dsi {
+	status = "okay";
+
+	panel@0 {
+		compatible = "leadtek,ltk050h3146w-a2";
+		reg = <0>;
+		backlight = <&backlight>;
+		iovcc-supply = <&vcc_1v8>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&dsp_rst>;
+		reset-gpios = <&gpio0 RK_PB2 GPIO_ACTIVE_LOW>;
+		vci-supply = <&vcc_2v8>;
+
+		port {
+			mipi_in_panel: endpoint {
+				remote-endpoint = <&mipi_out_panel>;
+			};
+		};
+	};
+};
+
+&dsi_out {
+	mipi_out_panel: endpoint {
+		remote-endpoint = <&mipi_in_panel>;
+	};
+};
diff --git a/arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w.dts b/arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w.dts
new file mode 100644
index 000000000000..82c6acdb4fae
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w.dts
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2025 Cherry Embedded Solutions GmbH
+ */
+
+/dts-v1/;
+#include "px30-cobra.dtsi"
+
+/ {
+	model = "Theobroma Systems Cobra with LTK050H3146W Display";
+	compatible = "tsd,px30-cobra-ltk050h3146w", "tsd,px30-cobra", "rockchip,px30";
+};
+
+&dsi {
+	status = "okay";
+
+	panel@0 {
+		compatible = "leadtek,ltk050h3146w";
+		reg = <0>;
+		backlight = <&backlight>;
+		iovcc-supply = <&vcc_1v8>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&dsp_rst>;
+		reset-gpios = <&gpio0 RK_PB2 GPIO_ACTIVE_LOW>;
+		vci-supply = <&vcc_2v8>;
+
+		port {
+			mipi_in_panel: endpoint {
+				remote-endpoint = <&mipi_out_panel>;
+			};
+		};
+	};
+};
+
+&dsi_out {
+	mipi_out_panel: endpoint {
+		remote-endpoint = <&mipi_in_panel>;
+	};
+};
diff --git a/arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3148w.dts b/arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3148w.dts
new file mode 100644
index 000000000000..94449132df38
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3148w.dts
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2025 Cherry Embedded Solutions GmbH
+ */
+
+/dts-v1/;
+#include "px30-cobra.dtsi"
+
+/ {
+	model = "Theobroma Systems Cobra with ltk050h3148w Display";
+	compatible = "tsd,px30-cobra-ltk050h3148w", "tsd,px30-cobra", "rockchip,px30";
+};
+
+&dsi {
+	status = "okay";
+
+	panel@0 {
+		compatible = "leadtek,ltk050h3148w";
+		reg = <0>;
+		backlight = <&backlight>;
+		iovcc-supply = <&vcc_1v8>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&dsp_rst>;
+		reset-gpios = <&gpio0 RK_PB2 GPIO_ACTIVE_LOW>;
+		vci-supply = <&vcc_2v8>;
+
+		port {
+			mipi_in_panel: endpoint {
+				remote-endpoint = <&mipi_out_panel>;
+			};
+		};
+	};
+};
+
+&dsi_out {
+	mipi_out_panel: endpoint {
+		remote-endpoint = <&mipi_in_panel>;
+	};
+};
diff --git a/arch/arm64/boot/dts/rockchip/px30-cobra-ltk500hd1829.dts b/arch/arm64/boot/dts/rockchip/px30-cobra-ltk500hd1829.dts
new file mode 100644
index 000000000000..d7b639e7ccab
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/px30-cobra-ltk500hd1829.dts
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2025 Cherry Embedded Solutions GmbH
+ */
+
+/dts-v1/;
+#include "px30-cobra.dtsi"
+
+/ {
+	model = "Theobroma Systems Cobra prototype with LTK500HD1829 Display";
+	compatible = "tsd,px30-cobra-ltk500hd1829", "tsd,px30-cobra", "rockchip,px30";
+
+	aliases {
+		mmc1 = &sdmmc;
+	};
+};
+
+&dsi {
+	status = "okay";
+
+	panel@0 {
+		compatible = "leadtek,ltk500hd1829";
+		reg = <0>;
+		backlight = <&backlight>;
+		iovcc-supply = <&vcc_1v8>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&dsp_rst>;
+		reset-gpios = <&gpio0 RK_PB2 GPIO_ACTIVE_LOW>;
+		vcc-supply = <&vcc_2v8>;
+
+		port {
+			mipi_in_panel: endpoint {
+				remote-endpoint = <&mipi_out_panel>;
+			};
+		};
+	};
+};
+
+&dsi_out {
+	mipi_out_panel: endpoint {
+		remote-endpoint = <&mipi_in_panel>;
+	};
+};
+
+&pinctrl {
+	pinctrl-names = "default";
+	pinctrl-0 = <&cobra_pin_hog>, <&cobra_proto_hog>;
+
+	hog {
+		cobra_proto_hog: cobra-proto-hog {
+			rockchip,pins =
+				/* STUSB4500 open drain outout POWER_OK2, needs pull-up */
+				<3 RK_PB1 RK_FUNC_GPIO &pcfg_pull_up>,
+				/* STUSB4500 open drain outout POWER_OK3, needs pull-up */
+				<3 RK_PB2 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+};
+
+&sdmmc {
+	bus-width = <4>;
+	broken-cd;
+	cap-sd-highspeed;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdmmc_clk &sdmmc_cmd &sdmmc_bus4>;
+	sd-uhs-sdr12;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	vmmc-supply = <&vccio_sd>;
+	vqmmc-supply = <&vccio_sd>;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/rockchip/px30-cobra.dtsi b/arch/arm64/boot/dts/rockchip/px30-cobra.dtsi
new file mode 100644
index 000000000000..d8059a648321
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/px30-cobra.dtsi
@@ -0,0 +1,566 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2025 Cherry Embedded Solutions GmbH
+ */
+
+/dts-v1/;
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/pinctrl/rockchip.h>
+#include "px30.dtsi"
+
+/ {
+	aliases {
+		ethernet0 = &gmac;
+		mmc0 = &emmc;
+	};
+
+	chosen {
+		stdout-path = "serial5:115200n8";
+	};
+
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		power-supply = <&vcc5v0_sys>;
+		pwms = <&pwm0 0 25000 0>;
+	};
+
+	beeper {
+		compatible = "pwm-beeper";
+		pwms = <&pwm1 0 1000 0>;
+	};
+
+	emmc_pwrseq: emmc-pwrseq {
+		compatible = "mmc-pwrseq-emmc";
+		pinctrl-0 = <&emmc_reset>;
+		pinctrl-names = "default";
+		reset-gpios = <&gpio1 RK_PB3 GPIO_ACTIVE_HIGH>;
+	};
+
+	gpio-leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&heartbeat_led_pin>;
+
+		/*
+		 * LED14 on the PCB. Typically NOT populated.
+		 */
+		led-0 {
+			color = <LED_COLOR_ID_BLUE>;
+			gpios = <&gpio0 RK_PA0 GPIO_ACTIVE_HIGH>;
+			label = "heartbeat";
+			linux,default-trigger = "heartbeat";
+		};
+	};
+
+	pwm-leds {
+		compatible = "pwm-leds";
+
+		ring_red: led-0 {
+			color = <LED_COLOR_ID_RED>;
+			default-state = "off";
+			label = "ring_red";
+			pwms = <&pwm5 0 1000000 0>;
+			max-brightness = <255>;
+		};
+
+		ring_green: led-1 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			label = "ring_green";
+			pwms = <&pwm6 0 1000000 0>;
+			max-brightness = <255>;
+		};
+
+		ring_blue: led-2 {
+			color = <LED_COLOR_ID_BLUE>;
+			default-state = "off";
+			label = "ring_blue";
+			pwms = <&pwm7 0 1000000 0>;
+			max-brightness = <255>;
+		};
+	};
+
+	/* also named 5V_Q7 in schematics */
+	vcc5v0_sys: regulator-vccsys {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_sys";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+};
+
+&cpu0 {
+	cpu-supply = <&vdd_arm>;
+};
+
+&cpu1 {
+	cpu-supply = <&vdd_arm>;
+};
+
+&cpu2 {
+	cpu-supply = <&vdd_arm>;
+};
+
+&cpu3 {
+	cpu-supply = <&vdd_arm>;
+};
+
+&display_subsystem {
+	status = "okay";
+};
+
+&dsi_dphy {
+	status = "okay";
+};
+
+&emmc {
+	bus-width = <8>;
+	cap-mmc-highspeed;
+	/*
+	 * For hs200 support, U-Boot would have to set the RK809 DCDC4
+	 * rail to 1.8V from the default of 3.0V. It doesn't do that on
+	 * devices out in the field, so disable hs200.
+	 * mmc-hs200-1_8v;
+	 */
+	mmc-pwrseq = <&emmc_pwrseq>;
+	non-removable;
+	vmmc-supply = <&vcc_3v3>;
+	vqmmc-supply = <&vcc_emmc>;
+	status = "okay";
+};
+
+&gmac {
+	clock_in_out = "output";
+	phy-handle = <&dp83825>;
+	phy-supply = <&vcc_3v3>;
+	status = "okay";
+};
+
+&gpu {
+	mali-supply = <&vdd_log>;
+	status = "okay";
+};
+
+/* I2C0 = PMIC, STUSB4500, RTC */
+&i2c0 {
+	status = "okay";
+
+	rk809: pmic@20 {
+		compatible = "rockchip,rk809";
+		reg = <0x20>;
+		#clock-cells = <0>;
+		clock-output-names = "xin32k";
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PA7 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pmic_int>;
+		system-power-controller;
+		wakeup-source;
+
+		vcc1-supply = <&vcc5v0_sys>;
+		vcc2-supply = <&vcc5v0_sys>;
+		vcc3-supply = <&vcc5v0_sys>;
+		vcc4-supply = <&vcc5v0_sys>;
+		vcc5-supply = <&vcc_3v3>;
+		vcc6-supply = <&vcc_3v3>;
+		vcc7-supply = <&vcc_3v3>;
+		vcc9-supply = <&vcc5v0_sys>;
+
+		regulators {
+			vdd_log: DCDC_REG1 {
+				regulator-name = "vdd_log";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <950000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-ramp-delay = <6001>;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <950000>;
+				};
+			};
+
+			vdd_arm: DCDC_REG2 {
+				regulator-name = "vdd_arm";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <950000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-ramp-delay = <6001>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+					regulator-suspend-microvolt = <950000>;
+				};
+			};
+
+			vcc_ddr: DCDC_REG3 {
+				regulator-name = "vcc_ddr";
+				regulator-always-on;
+				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+				};
+			};
+
+			vcc_3v0_1v8: vcc_emmc: DCDC_REG4 {
+				regulator-name = "vcc_3v0_1v8";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <3000000>;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <3000000>;
+				};
+			};
+
+			vcc_3v3: DCDC_REG5 {
+				regulator-name = "vcc_3v3";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <3300000>;
+				};
+			};
+
+			vcc_1v8: LDO_REG2 {
+				regulator-name = "vcc_1v8";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <1800000>;
+				};
+			};
+
+			vcc_1v0: LDO_REG3 {
+				regulator-name = "vcc_1v0";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1000000>;
+				regulator-max-microvolt = <1000000>;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <1000000>;
+				};
+			};
+
+			vcc_2v8: LDO_REG4 {
+				regulator-name = "vcc_2v8";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+					regulator-suspend-microvolt = <2800000>;
+				};
+			};
+
+			/*
+			 * vccio_sd also supplies the vmmc supply on prototypes
+			 * with sd-slots, so needs to stay single voltage for
+			 * those. Production models don't have sd-slots anymore
+			 * and only supply vccio2 from this regulator.
+			 */
+			vccio_sd: LDO_REG5 {
+				regulator-name = "vccio_sd";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <3000000>;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <3000000>;
+				};
+			};
+
+			/* vcc_sdio also supplies the pull-up resistors for i2c1 */
+			vcc_sdio: LDO_REG6 {
+				regulator-name = "vcc_sdio";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <3000000>;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <3300000>;
+				};
+			};
+
+			vcc_lcd: LDO_REG7 {
+				regulator-name = "vcc_lcd";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1000000>;
+				regulator-max-microvolt = <1000000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+					regulator-suspend-microvolt = <1000000>;
+				};
+			};
+
+			vcc_1v8_lcd: LDO_REG8 {
+				regulator-name = "vcc_1v8_lcd";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <1800000>;
+				};
+			};
+
+			vcca_1v8: LDO_REG9 {
+				regulator-name = "vcca_1v8";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+					regulator-suspend-microvolt = <1800000>;
+				};
+			};
+		};
+	};
+};
+
+&i2c1 {
+	clock-frequency = <100000>;
+	status = "okay";
+};
+
+&i2c2 {
+	clock-frequency = <100000>;
+	i2c-scl-falling-time-ns = <50>;
+	i2c-scl-rising-time-ns = <300>;
+	status = "okay";
+
+	touchscreen@14 {
+		compatible = "goodix,gt911";
+		reg = <0x14>;
+		AVDD28-supply = <&vcc_2v8>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PA1 IRQ_TYPE_LEVEL_LOW>;
+		irq-gpios = <&gpio0 RK_PA1 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&tch_int &tch_rst>;
+		reset-gpios = <&gpio0 RK_PB5 GPIO_ACTIVE_HIGH>;
+		touchscreen-inverted-x;
+		VDDIO-supply = <&vcc_3v3>;
+	};
+};
+
+/*
+ * Enable pull-ups to prevent floating pins when the touch
+ * panel is not connected.
+ */
+&i2c2_xfer {
+	rockchip,pins =
+		<2 RK_PB7 2 &pcfg_pull_up>,
+		<2 RK_PC0 2 &pcfg_pull_up>;
+};
+
+&io_domains {
+	vccio1-supply = <&vcc_sdio>;
+	vccio2-supply = <&vccio_sd>;
+	vccio3-supply = <&vcc_3v3>;
+	vccio4-supply = <&vcc_3v3>;
+	vccio5-supply = <&vcc_1v8>;
+	vccio6-supply = <&vcc_emmc>;
+	status = "okay";
+};
+
+&mdio {
+	dp83825: ethernet-phy@0 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0x0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&phy_rst>;
+		reset-assert-us = <50000>;
+		reset-deassert-us = <50000>;
+		reset-gpios = <&gpio2 RK_PB6 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&pinctrl {
+	pinctrl-names = "default";
+	pinctrl-0 = <&cobra_pin_hog>;
+
+	hog {
+		cobra_pin_hog: cobra-pin-hog {
+			rockchip,pins =
+				/* USB_HUB2_RESET */
+				<0 RK_PA5 RK_FUNC_GPIO &pcfg_output_high>,
+				/* USB_HUB1_RESET */
+				<0 RK_PB4 RK_FUNC_GPIO &pcfg_output_high>,
+				/* The default pull-down can keep the IC in reset. */
+				<3 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
+				/* USB-A 5V enable */
+				<3 RK_PC0 RK_FUNC_GPIO &pcfg_output_high>,
+				/* USB-A data enable */
+				<3 RK_PD3 RK_FUNC_GPIO &pcfg_output_high>,
+		};
+	};
+
+	emmc {
+		emmc_reset: emmc-reset {
+			rockchip,pins =
+				<1 RK_PB3 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	ethernet {
+		phy_rst: phy-rst {
+			rockchip,pins =
+				<2 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	leds {
+		heartbeat_led_pin: heartbeat-led-pin {
+			rockchip,pins =
+				<0 RK_PA0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	panel {
+		dsp_rst: dsp-rst {
+			rockchip,pins =
+				<0 RK_PB2 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+
+		tch_int: tch-int {
+			rockchip,pins =
+				<0 RK_PA1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		tch_rst: tch-rst {
+			rockchip,pins =
+				<0 RK_PB5 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	pmic {
+		pmic_int: pmic-int {
+			rockchip,pins =
+				<0 RK_PA7 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+};
+
+&pmu_io_domains {
+	pmuio1-supply = <&vcc_3v3>;
+	pmuio2-supply = <&vcc_3v3>;
+	status = "okay";
+};
+
+&pwm0 {
+	status = "okay";
+};
+
+&pwm1 {
+	status = "okay";
+};
+
+&pwm5 {
+	status = "okay";
+};
+
+&pwm6 {
+	status = "okay";
+};
+
+&pwm7 {
+	status = "okay";
+};
+
+&saradc {
+	vref-supply = <&vcc_1v8>;
+	status = "okay";
+};
+
+&tsadc {
+	status = "okay";
+};
+
+&u2phy {
+	status = "okay";
+};
+
+&u2phy_host {
+	status = "okay";
+};
+
+&u2phy_otg {
+	status = "okay";
+};
+
+&uart1 {
+	/delete-property/ dmas;
+	/delete-property/ dma-names;
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart1_xfer>;
+	status = "okay";
+};
+
+&uart5 {
+	pinctrl-0 = <&uart5_xfer>;
+	status = "okay";
+};
+
+&usb20_otg {
+	status = "okay";
+};
+
+&usb_host0_ehci {
+	status = "okay";
+};
+
+&usb_host0_ohci {
+	status = "okay";
+};
+
+&vopb {
+	status = "okay";
+};
+
+&vopb_mmu {
+	status = "okay";
+};
+
+&vopl {
+	status = "disabled";
+};
+
+&vopl_mmu {
+	status = "disabled";
+};
+
+&wdt {
+	status = "okay";
+};
-- 
2.47.2

