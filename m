Received: from smtp-8fa9.mail.infomaniak.ch (smtp-8fa9.mail.infomaniak.ch [83.166.143.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C54220687
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 15:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.166.143.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747842281; cv=none; b=BRxieNo/Cb+0mndhlrTlid03SxRHuNG/Zjoxwf0MNJdhPW0dYLWEzSeOX48sZ/qhdGQliRQem+UbyLNJgyBVh/SIieo0xjcGPSu34Xfh6Bl90rO795WasH9eill60suKZmpFctarJLsj+Ns08Zc+EiTlFTS1hhs6h48Pslbg94w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747842281; c=relaxed/simple;
	bh=opbuZD+JTDIVfHWoOO5PmzAGYRZ/F2Ig9Wm5pGXx09c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IaYnhUKMID7BuDkS+O9BGjhvU5veZG2PBQG69Y0UK+gynlfJgjDx+cX8Q65QBl3aRHXWQRrwmyucAK+4LlZm0SvowU7EueZmBJPnkFE1a7e3ezYhKpw2VxmP80nscqOffTkJHqqC4CcIyHQ3MWtGFxxOKZ3iPthA7rstKLc1+y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net; spf=pass smtp.mailfrom=0leil.net; arc=none smtp.client-ip=83.166.143.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-4-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6b])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4b2bMM2m0Lz13xf;
	Wed, 21 May 2025 17:44:31 +0200 (CEST)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4b2bML5VjLzMhT;
	Wed, 21 May 2025 17:44:30 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Wed, 21 May 2025 17:44:20 +0200
Subject: [PATCH 2/2] arm64: dts: rockchip: support Ethernet Switch adapter
 for RK3588 Jaguar
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250521-jaguar-mezz-eth-switch-v1-2-9b5c48ebb867@cherry.de>
References: <20250521-jaguar-mezz-eth-switch-v1-0-9b5c48ebb867@cherry.de>
In-Reply-To: <20250521-jaguar-mezz-eth-switch-v1-0-9b5c48ebb867@cherry.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha

From: Quentin Schulz <quentin.schulz@cherry.de>

This adds support for the Ethernet Switch adapter connected through the
mezzanine connector on RK3588 Jaguar.

This adapter has a KSZ9896 Ethernet Switch with 4 1GbE Ethernet
connectors, two user controllable LEDs, and an M12 12-pin connector
which exposes the following signals:
 - RS232/RS485 (max 250Kbps/500Kbps, RX pin1, TX pin2)
 - two digital inputs (pin4 routed to GPIO3_C5 on SoC, pin5 to GPIO4_B4)
 - two digital outputs (pin7 routed to GPIO3_D3 on SoC, pin8 to
   GPIO3_D1)
 - two analog inputs (pin10 to channel1 of ADS1015, pin11 to channel2)

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 arch/arm64/boot/dts/rockchip/Makefile              |   5 +
 .../rockchip/rk3588-jaguar-ethernet-switch.dtso    | 189 +++++++++++++++++++++
 2 files changed, 194 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 3e8771ef69ba1c1428117cc2ae29b84e13523e21..6d5ad354b77de1c3f995b119f97541f9c2cc9dbd 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -151,6 +151,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-firefly-itx-3588j.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-friendlyelec-cm3588-nas.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-h96-max-v58.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-jaguar.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-jaguar-ethernet-switch.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-jaguar-pre-ict-tester.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-mnt-reform2.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-nanopc-t6.dtb
@@ -222,6 +223,10 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6b-wifi.dtb
 rk3588-edgeble-neu6b-wifi-dtbs := rk3588-edgeble-neu6b-io.dtb \
 	rk3588-edgeble-neu6a-wifi.dtbo
 
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-jaguar-ethernet-switch.dtb
+rk3588-jaguar-ethernet-switch-dtbs := rk3588-jaguar.dtb \
+	rk3588-jaguar-ethernet-switch.dtbo
+
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-jaguar-pre-ict-tester.dtb
 rk3588-jaguar-pre-ict-tester-dtbs := rk3588-jaguar.dtb \
 	rk3588-jaguar-pre-ict-tester.dtbo
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtso b/arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..cff7655a21007a934019590f3836344b9851e537
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtso
@@ -0,0 +1,189 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2025 Cherry Embedded Solutions GmbH
+ *
+ * Device Tree Overlay for the Ethernet Switch adapter for the Mezzanine
+ * connector on RK3588 Jaguar.
+ *
+ * This adapter has a KSZ9896 Ethernet Switch with 4 1GbE Ethernet connectors,
+ * two user controllable LEDs, and an M12 12-pin connector which exposes the
+ * following signals:
+ *  - RS232/RS485 (max 250Kbps/500Kbps, RX pin1, TX pin2)
+ *  - two digital inputs (pin4 routed to GPIO3_C5 on SoC, pin5 to GPIO4_B4)
+ *  - two digital outputs (pin7 routed to GPIO3_D3 on SoC, pin8 to GPIO3_D1)
+ *  - two analog inputs (pin10 to channel1 of ADS1015, pin11 to channel2)
+ *
+ * RK3588 Jaguar can be powered entirely through the adapter via the M8 3-pin
+ * connector (12-24V).
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/rockchip,rk3588-cru.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/pinctrl/rockchip.h>
+
+&{/} {
+	mezzanine-leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&led_usr1_pin &led_usr2_pin>;
+
+		led-1 {
+			gpios = <&gpio1 RK_PC1 GPIO_ACTIVE_HIGH>;
+			label = "USR1";
+		};
+
+		led-2 {
+			gpios = <&gpio3 RK_PC4 GPIO_ACTIVE_HIGH>;
+			label = "USR2";
+		};
+	};
+};
+
+&gmac1 {
+	clock_in_out = "output";
+	phy-mode = "rgmii";
+	pinctrl-names = "default";
+	pinctrl-0 = <&gmac1_rx_bus2
+		     &gmac1_tx_bus2
+		     &gmac1_rgmii_clk
+		     &gmac1_rgmii_bus
+		     &eth1_pins>;
+	rx_delay = <0x30>;
+	tx_delay = <0x30>;
+	status = "okay";
+
+	fixed-link {
+		speed = <1000>;
+		full-duplex;
+	};
+};
+
+&i2c1 {
+	#address-cells = <1>;
+	/* ADS1015 can handle high-speed (HS) mode (up to 3.4MHz) on I2C bus,
+	   but SOC can handle only up to 400kHz. */
+	clock-frequency = <400000>;
+	#size-cells = <0>;
+	status = "okay";
+
+	adc@48 {
+		compatible = "ti,ads1015";
+		reg = <0x48>;
+		#address-cells = <1>;
+		interrupt-parent = <&gpio3>;
+		interrupts = <RK_PC7 IRQ_TYPE_EDGE_FALLING>;
+		pinctrl-0 = <&adc_alert>;
+		pinctrl-names = "default";
+		#io-channel-cells = <1>;
+		#size-cells = <0>;
+
+		channel@1 {
+			reg = <5>; /* Single-ended between AIN1 and GND */
+			ti,datarate = <0>;
+			ti,gain = <5>;
+		};
+
+		channel@2 {
+			reg = <6>; /* Single-ended between AIN2 and GND */
+			ti,datarate = <0>;
+			ti,gain = <5>;
+		};
+	};
+
+	switch@5f {
+		compatible = "microchip,ksz9896";
+		reg = <0x5f>;
+		interrupt-parent = <&gpio3>;
+		interrupts = <RK_PB7 IRQ_TYPE_EDGE_FALLING>; /* ETH_INTRP_N */
+		pinctrl-0 = <&eth_reset_n &eth_intrp_n>;
+		pinctrl-names = "default";
+		reset-gpios = <&gpio3 RK_PB6 GPIO_ACTIVE_LOW>; /* ETH_RESET */
+		microchip,synclko-disable; /* CLKO_25_125 only routed to TP1 */
+
+		ethernet-ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			lan1: port@0 {
+				reg = <0>;
+				label = "ETH1";
+			};
+
+			lan2: port@1 {
+				reg = <1>;
+				label = "ETH2";
+			};
+
+			lan3: port@2 {
+				reg = <2>;
+				label = "ETH3";
+			};
+
+			lan4: port@3 {
+				reg = <3>;
+				label = "ETH4";
+			};
+
+			port@5 {
+				reg = <5>;
+				ethernet = <&gmac1>;
+				label = "CPU";
+				phy-mode = "rgmii";
+				/* Delay done by the MAC via rx_delay/tx_delay */
+				rx-internal-delay-ps = <0>;
+				tx-internal-delay-ps = <0>;
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
+&pinctrl {
+	adc {
+		adc_alert: adc-alert-irq {
+			rockchip,pins =
+				<3 RK_PC7 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
+	ethernet {
+		eth_intrp_n: eth-intrp-n {
+			rockchip,pins =
+				<3 RK_PB7 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		eth_reset_n: eth-reset-n {
+			rockchip,pins =
+				<3 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	leds {
+		led_usr1_pin: led-usr1-pin {
+			rockchip,pins =
+				<1 RK_PC1 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+
+		led_usr2_pin: led-usr2-pin {
+			rockchip,pins =
+				<3 RK_PC4 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+	};
+};
+
+&uart9 {
+	/* GPIO3_D0/EN_RS485_MODE for switching between RS232 and RS485 */
+	pinctrl-0 = <&uart9m2_xfer &uart9m2_rtsn>;
+	pinctrl-names = "default";
+	linux,rs485-enabled-at-boot-time;
+	status = "okay";
+};

-- 
2.49.0

