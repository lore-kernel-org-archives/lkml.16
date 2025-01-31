Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4AF1F2C3C
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 20:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738353938; cv=none; b=F6QohH2eskgzlux3FEOyZChRgCBqUKM6mMFtddjMLxbMtD5xHcHhxZ8nB/7ERKwCexreG68lKIkr+nyZ15QZN3E/rQZfjJtso4EaSUBc1h+aWOVkAX0K6KxndBGgLe8bnBWA/xJh34P9N+WxRj6DLsla0de2u7jMZy8ErLkvkT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738353938; c=relaxed/simple;
	bh=p1s8jhBf7GZNQ5P1JFcq8IVYKQYEgjIDe5tZf5vztFc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EiTNtB+3Y0cwJs54Rv+7LqHmrAnzu9VwC3cZRZKLWXWeam2IdmAvtBgG4XI3Tt0cLP9xBTob/K/C5U/aA+mT5Y29v/yIlaBKn0m932bA+VfyBZWncU1LCaEWaIUHfLfHZlL2MYTspnabuyx3VvOCs4xm01N02NYMcrGQ1uoJvXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=Ah7jxw7a; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="Ah7jxw7a"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1738353929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J/3avnUvoY75i9AevVctoAbtNEgRUHYk1ttL7ziA2Ac=;
	b=Ah7jxw7aYZJLZL8Dg4jvODVLJHGBofGOtzyCHHrT0DVk8foQyxwToh5823MEWbYURY9eO2
	+2B+XTEi6wy0Q7hj/od1aConMLH8gsgkGyiXgY5EONZjQXYXDmtc3maySSjrSFURUZJPtn
	AYgwGyv1wPKYUzSvtxdKBHnsVJwlg+5hET/MokEr9kuVCpHKskfHqfahvPC+/COlhRGMzr
	yxquDcfrjy/gWtbTQcFFM9GMiz81x2Fsxro1ZQFgrWNM2wuU1rKslg7qbTy9aDjwD6wEk9
	jwo5ZUvGSc484xhU+3fN8CB+2kJoYeiWBrde92Ho2GApV9H6vAuLSAatI0LyEQ==
From: Ferass El Hafidi <funderscore@postmarketos.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	funderscore@postmarketos.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Artur Weber <aweber.kernel@gmail.com>,
	Karl Chan <exxxxkc@getgoogleoff.me>
Subject: [PATCH 2/2] arm64: dts: amlogic: add support for xiaomi-aquaman/Mi TV Stick
Date: Fri, 31 Jan 2025 20:03:19 +0000
Message-ID: <20250131200319.19996-3-funderscore@postmarketos.org>
In-Reply-To: <20250131200319.19996-1-funderscore@postmarketos.org>
References: <20250131200319.19996-1-funderscore@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Ferass El Hafidi <funderscore@postmarketos.org>

Xiaomi Mi TV Stick is a small Amlogic-based Android TV stick released in 
2020.  It is known as `xiaomi-aquaman` internally.  Specifications:
 * Amlogic S805Y SoC
 * Android TV 9, upgradable to Android TV 10
 * 8 GB eMMC
 * 1 GB of RAM

The devicetree is based on p241's DT, with some changes to better match
the Mi TV Stick.

Signed-off-by: Ferass El Hafidi <funderscore@postmarketos.org>
---
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../meson-gxl-s805y-xiaomi-aquaman.dts        | 311 ++++++++++++++++++
 2 files changed, 312 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dts

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index 2fbda8419..0921707f1 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -49,6 +49,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-wetek-hub.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-wetek-play2.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s805x-libretech-ac.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s805x-p241.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s805y-xiaomi-aquaman.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-libretech-pc.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-mecool-kii-pro.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-p230.dtb
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dts
new file mode 100644
index 000000000..6b72f054a
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dts
@@ -0,0 +1,311 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2025 Ferass El Hafidi <funderscore@postmarketos.org>
+ * Based on meson-gxl-s805x-p241.dtb:
+ *  - Copyright (c) 2018 BayLibre, SAS.
+ *    Author: Neil Armstrong <narmstrong@baylibre.com>
+ *    Author: Jerome Brunet <jbrunet@baylibre.com>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/sound/meson-aiu.h>
+
+#include "meson-gxl-s805x.dtsi"
+
+/ {
+	compatible = "xiaomi,aquaman", "amlogic,s805x", "amlogic,meson-gxl";
+	model = "Xiaomi Mi TV Stick (S805Y)";
+
+	aliases {
+		serial0 = &uart_AO;
+		serial1 = &uart_A;
+	};
+
+	au2: analog-amplifier {
+		compatible = "simple-audio-amplifier";
+		sound-name-prefix = "AU2";
+		VCC-supply = <&vcc_5v>;
+		enable-gpios = <&gpio GPIOH_5 GPIO_ACTIVE_HIGH>;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	cvbs-connector {
+		/* No CVBS connector */
+		status = "disabled";
+	};
+
+	emmc_pwrseq: emmc-pwrseq {
+		compatible = "mmc-pwrseq-emmc";
+		reset-gpios = <&gpio BOOT_9 GPIO_ACTIVE_LOW>;
+	};
+
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&hdmi_tx_tmds_out>;
+			};
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-white {
+			color = <LED_COLOR_ID_WHITE>;
+			function = LED_FUNCTION_POWER;
+			gpios = <&gpio GPIODV_24 GPIO_ACTIVE_HIGH>;
+			default-state = "heartbeat";
+			panic-indicator;
+		};
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x0 0x0 0x40000000>;
+	};
+
+	vddio_boot: regulator-vddio-boot {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDIO_BOOT";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	vddao_3v3: regulator-vddao-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDAO_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	vddio_ao18: regulator-vddio-ao18 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDIO_AO18";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	vcc_3v3: regulator-vcc-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	vcc_5v: regulator-vcc-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC_5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+
+	emmc_pwrseq: emmc-pwrseq {
+		compatible = "mmc-pwrseq-emmc";
+		reset-gpios = <&gpio BOOT_9 GPIO_ACTIVE_LOW>;
+	};
+
+	wifi32k: wifi32k {
+		compatible = "pwm-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+		pwms = <&pwm_ef 0 30518 0>; /* PWM_E at 32.768KHz */
+	};
+
+	sdio_pwrseq: sdio-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpio GPIOX_6 GPIO_ACTIVE_LOW>;
+		clocks = <&wifi32k>;
+		clock-names = "ext_clock";
+	};
+
+	sound {
+		compatible = "amlogic,gx-sound-card";
+		model = "MI-AQUAMAN";
+		audio-aux-devs = <&au2>;
+		audio-widgets = "Line", "Lineout";
+		audio-routing = "AU2 INL", "ACODEC LOLN",
+				"AU2 INR", "ACODEC LORN",
+				"Lineout", "AU2 OUTL",
+				"Lineout", "AU2 OUTR";
+		clocks = <&clkc CLKID_MPLL0>,
+			 <&clkc CLKID_MPLL1>,
+			 <&clkc CLKID_MPLL2>;
+
+		assigned-clocks = <&clkc CLKID_MPLL0>,
+				  <&clkc CLKID_MPLL1>,
+				  <&clkc CLKID_MPLL2>;
+		assigned-clock-parents = <0>, <0>, <0>;
+		assigned-clock-rates = <294912000>,
+				       <270950400>,
+				       <393216000>;
+
+		dai-link-0 {
+			sound-dai = <&aiu AIU_CPU CPU_I2S_FIFO>;
+		};
+
+		dai-link-1 {
+			sound-dai = <&aiu AIU_CPU CPU_I2S_ENCODER>;
+			dai-format = "i2s";
+			mclk-fs = <256>;
+
+			codec-0 {
+				sound-dai = <&aiu AIU_HDMI CTRL_I2S>;
+			};
+
+			codec-1 {
+				sound-dai = <&aiu AIU_ACODEC CTRL_I2S>;
+			};
+		};
+
+		dai-link-2 {
+			sound-dai = <&aiu AIU_HDMI CTRL_OUT>;
+
+			codec-0 {
+				sound-dai = <&hdmi_tx>;
+			};
+		};
+
+		dai-link-3 {
+			sound-dai = <&aiu AIU_ACODEC CTRL_OUT>;
+
+			codec-0 {
+				sound-dai = <&acodec>;
+			};
+		};
+	};
+};
+
+&acodec {
+	AVDD-supply = <&vddio_ao18>;
+	status = "okay";
+};
+
+&aiu {
+	status = "okay";
+};
+
+&cec_AO {
+	status = "okay";
+	pinctrl-0 = <&ao_cec_pins>;
+	pinctrl-names = "default";
+	hdmi-phandle = <&hdmi_tx>;
+};
+
+&ethmac {
+	/* No Ethernet connector */
+	status = "disabled";
+};
+
+&internal_phy {
+	pinctrl-0 = <&eth_link_led_pins>, <&eth_act_led_pins>;
+	pinctrl-names = "default";
+};
+
+&ir {
+	/* No IR */
+	status = "disabled";
+};
+
+&hdmi_tx {
+	status = "okay";
+	pinctrl-0 = <&hdmi_hpd_pins>, <&hdmi_i2c_pins>;
+	pinctrl-names = "default";
+	hdmi-supply = <&vcc_5v>;
+};
+
+&hdmi_tx_tmds_port {
+	hdmi_tx_tmds_out: endpoint {
+		remote-endpoint = <&hdmi_connector_in>;
+	};
+};
+
+&saradc {
+	status = "okay";
+	vref-supply = <&vddio_ao18>;
+};
+
+/* Wireless SDIO Module */
+&sd_emmc_a {
+	status = "disabled";
+	pinctrl-0 = <&sdio_pins>;
+	pinctrl-1 = <&sdio_clk_gate_pins>;
+	pinctrl-names = "default", "clk-gate";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	bus-width = <4>;
+	cap-sd-highspeed;
+	max-frequency = <50000000>;
+
+	non-removable;
+	disable-wp;
+
+	/* WiFi firmware requires power to be kept while in suspend */
+	keep-power-in-suspend;
+
+	mmc-pwrseq = <&sdio_pwrseq>;
+
+	vmmc-supply = <&vddao_3v3>;
+	vqmmc-supply = <&vddio_boot>;
+};
+
+/* eMMC */
+&sd_emmc_c {
+	status = "okay";
+	pinctrl-0 = <&emmc_pins>, <&emmc_ds_pins>;
+	pinctrl-1 = <&emmc_clk_gate_pins>;
+	pinctrl-names = "default", "clk-gate";
+
+	bus-width = <8>;
+	cap-mmc-highspeed;
+	max-frequency = <200000000>;
+	non-removable;
+	disable-wp;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+
+	mmc-pwrseq = <&emmc_pwrseq>;
+	vmmc-supply = <&vcc_3v3>;
+	vqmmc-supply = <&vddio_boot>;
+};
+
+&pwm_ef {
+	status = "okay";
+	pinctrl-0 = <&pwm_e_pins>;
+	pinctrl-names = "default";
+	clocks = <&clkc CLKID_FCLK_DIV4>;
+	clock-names = "clkin0";
+};
+
+/* This is connected to the Bluetooth module: */
+&uart_A {
+	status = "okay";
+	pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+};
+
+&uart_AO {
+	status = "okay";
+	pinctrl-0 = <&uart_ao_a_pins>;
+	pinctrl-names = "default";
+};
+
+&usb {
+	status = "okay";
+	dr_mode = "host";
+};
+
+&usb2_phy0 {
+	phy-supply = <&vcc_5v>;
+};
-- 
2.47.1

