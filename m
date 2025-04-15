Received: from mail-m19731103.qiye.163.com (mail-m19731103.qiye.163.com [220.197.31.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515852741D0;
	Tue, 15 Apr 2025 05:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744694362; cv=none; b=ct9dQWBHVnJQyLwT6/jGFnN51EohjIoVI9FDkwuZzbzVrxeRoVWqhyTNlf1xVCq6SdySdHvoVG3omkNcKnZOMuiT+6ns2kupmVqGOROkGwcmJHbLhakosfhyZw4KAmbWCa4D1wWdbTWGkvguwu6ffj/Yd7IEU1V1iMlyT7y2hRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744694362; c=relaxed/simple;
	bh=QR4zj2sOJr9Jppi7VYDD6OPVuIjLB3mVNp43yQyUiyM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Wj1NUTKoKfNgTCgYoM7m/l7WNBeZkCLAt1Aid8Czp0KJnpke7cgacTs1VDr8Nj82JIOusFYvROtk7NX33QleA95b60A6CUlSLjQgneUeZGnsPmSjiFEk7QBthJUeOPk8j1dh7HL94koTtxb32qzyafXM7dt+Odvv5TmJGOiSSnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=hEp76QV5; arc=none smtp.client-ip=220.197.31.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="hEp76QV5"
Received: from localhost.localdomain (unknown [103.29.142.67])
	by smtp.qiye.163.com (Hmail) with ESMTP id 11e6d969c;
	Tue, 15 Apr 2025 13:19:15 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Finley Xiao <finley.xiao@rock-chips.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <didi.debian@cknow.org>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Johan Jonker <jbx6244@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 7/7] arm64: dts: rockchip: Add RK3562 evb2 devicetree
Date: Tue, 15 Apr 2025 13:18:55 +0800
Message-Id: <20250415051855.59740-8-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250415051855.59740-1-kever.yang@rock-chips.com>
References: <20250415051855.59740-1-kever.yang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDTUpKVh5KGUMeQkkaTxhPSFYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKS0hVSUJVSk9JVU1MWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0NNVUpLS1
	VLWQY+
X-HM-Tid: 0a9637e3276103afkunm11e6d969c
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NCo6HRw4ETIBHho6MAIVChkS
	GjxPC0JVSlVKTE9PTUJPSE5MQ0pMVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlKS0hVSUJVSk9JVU1MWVdZCAFZQUpPT0xLNwY+
DKIM-Signature:a=rsa-sha256;
	b=hEp76QV5ijsXusZTboxm+iXGeN3j8jeKSb67/b3BSGsezZpZSsklvRrJGmHSgKsFqEcAvdoRS0TYoNlcnI+2fLnESxU3VZRR898b0YpfV4SKDvj0s9ArKKtFG002ZHWc7844fdUsraiBwUoFxVmCNPUaPnUUuWX5V4eI0q6KmCs=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=cRV2ax8yzZxUzJ6lPmuLIA05SWeK4MErk3BjagmWP3k=;
	h=date:mime-version:subject:message-id:from;

From: Finley Xiao <finley.xiao@rock-chips.com>

DRAM: DDR4
Storage: eMMC
PMIC: RK809
Audio: Headphone and speaker
Interface:
- USB3.0 HOST
- USB2.0 HOST
- PCIe x4 slot(pcie2x1 available)
- SD card slot
- GMAC
- debug UART0

NOTE: the USB3.0 and the PCIe reuse the comboPHY, so the USB3.0 work in
USB2 only mode.

Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
---

Changes in v4:
- remove gmac nodes

Changes in v3: None
Changes in v2: None

 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../boot/dts/rockchip/rk3562-evb2-v10.dts     | 488 ++++++++++++++++++
 2 files changed, 489 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3562-evb2-v10.dts

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 3e8771ef69ba..aa23068be4d5 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -81,6 +81,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-sapphire.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-sapphire-excavator.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399pro-rock-pi-n10.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-radxa-e20c.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3562-evb2-v10.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-anbernic-rg-arc-d.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-anbernic-rg-arc-s.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-anbernic-rg353p.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3562-evb2-v10.dts b/arch/arm64/boot/dts/rockchip/rk3562-evb2-v10.dts
new file mode 100644
index 000000000000..b7e01cfe2f5a
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3562-evb2-v10.dts
@@ -0,0 +1,488 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2024 Rockchip Electronics Co., Ltd.
+ *
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/pinctrl/rockchip.h>
+#include "rk3562.dtsi"
+
+/ {
+	model = "Rockchip RK3562 EVB V20 Board";
+	compatible = "rockchip,rk3562-evb2-v10", "rockchip,rk3562";
+
+	chosen: chosen {
+		stdout-path = "serial0:1500000n8";
+	};
+
+	adc_keys: adc-keys {
+		compatible = "adc-keys";
+		io-channels = <&saradc0 1>;
+		io-channel-names = "buttons";
+		keyup-threshold-microvolt = <1800000>;
+		poll-interval = <100>;
+
+		button-vol-up {
+			linux,code = <KEY_VOLUMEUP>;
+			label = "volume up";
+			press-threshold-microvolt = <17000>;
+		};
+
+		button-vol-down {
+			linux,code = <KEY_VOLUMEDOWN>;
+			label = "volume down";
+			press-threshold-microvolt = <414000>;
+		};
+
+		button-menu {
+			linux,code = <KEY_MENU>;
+			label = "menu";
+			press-threshold-microvolt = <800000>;
+		};
+
+		button-back {
+			linux,code = <KEY_BACK>;
+			label = "back";
+			press-threshold-microvolt = <1200000>;
+		};
+	};
+
+	leds: leds {
+		compatible = "gpio-leds";
+		work_led: led-0 {
+			gpios = <&gpio0 RK_PB4 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+		};
+	};
+
+	dc_12v: dc-12v {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc12v_dcin";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+	};
+
+	sdio_pwrseq: sdio-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		clocks = <&rk809 1>;
+		clock-names = "ext_clock";
+		pinctrl-names = "default";
+		pinctrl-0 = <&wifi_enable_h>;
+
+		/*
+		 * On the module itself this is one of these (depending
+		 * on the actual card populated):
+		 * - SDIO_RESET_L_WL_REG_ON
+		 * - PDN (power down when low)
+		 */
+		post-power-on-delay-ms = <200>;
+		reset-gpios = <&gpio0 RK_PB3 GPIO_ACTIVE_LOW>;
+	};
+
+	vcc3v3_pcie20: vcc3v3-pcie20 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc3v3_pcie20";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		enable-active-high;
+		gpios = <&gpio0 RK_PB7 GPIO_ACTIVE_HIGH>;
+		startup-delay-us = <5000>;
+		vin-supply = <&dc_12v>;
+	};
+
+	vcc5v0_sys: vcc5v0-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_sys";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&dc_12v>;
+	};
+
+	vcc5v0_usb: vcc5v0-usb {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_usb";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&dc_12v>;
+	};
+
+	vcc5v0_usb_host: vcc5v0-usb-host {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_usb_host";
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+		gpio = <&gpio4 RK_PB0 GPIO_ACTIVE_HIGH>;
+		vin-supply = <&vcc5v0_usb>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb_host_pwren>;
+	};
+
+	vcc5v0_usb_otg: vcc5v0-usb-otg {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_usb_otg";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+		gpio = <&gpio0 RK_PC0 GPIO_ACTIVE_HIGH>;
+		vin-supply = <&vcc5v0_usb>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb_otg_pwren>;
+	};
+
+	vcc3v3_clk: vcc3v3-clk {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc3v3_clk";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vcc3v3_sys: vcc-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc3v3_sys";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&dc_12v>;
+	};
+};
+
+&combphy_pu {
+	status = "okay";
+};
+
+&i2c0 {
+	status = "okay";
+
+	rk809: pmic@20 {
+		compatible = "rockchip,rk809";
+		reg = <0x20>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-names = "default", "pmic-sleep",
+			"pmic-power-off", "pmic-reset";
+		pinctrl-0 = <&pmic_int>;
+		rockchip,system-power-controller;
+		wakeup-source;
+		#clock-cells = <1>;
+		clock-output-names = "rk808-clkout1", "rk808-clkout2";
+
+		vcc1-supply = <&vcc3v3_sys>;
+		vcc2-supply = <&vcc3v3_sys>;
+		vcc3-supply = <&vcc3v3_sys>;
+		vcc4-supply = <&vcc3v3_sys>;
+		vcc5-supply = <&vcc3v3_sys>;
+		vcc6-supply = <&vcc3v3_sys>;
+		vcc7-supply = <&vcc3v3_sys>;
+		vcc8-supply = <&vcc3v3_sys>;
+		vcc9-supply = <&vcc3v3_sys>;
+
+		regulators {
+			vdd_logic: DCDC_REG1 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-ramp-delay = <6001>;
+				regulator-initial-mode = <0x2>;
+				regulator-name = "vdd_logic";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdd_cpu: DCDC_REG2 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-ramp-delay = <6001>;
+				regulator-initial-mode = <0x2>;
+				regulator-name = "vdd_cpu";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc_ddr: DCDC_REG3 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-initial-mode = <0x2>;
+				regulator-name = "vcc_ddr";
+				regulator-state-mem {
+					regulator-on-in-suspend;
+				};
+			};
+
+			vdd_gpu: DCDC_REG4 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-ramp-delay = <6001>;
+				regulator-initial-mode = <0x2>;
+				regulator-name = "vdd_gpu";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc2v8_dvp: LDO_REG1 {
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+				regulator-name = "vcc2v8_dvp";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdda_0v9: LDO_REG2 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <900000>;
+				regulator-name = "vdda_0v9";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdda0v9_pmu: LDO_REG3 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <900000>;
+				regulator-name = "vdda0v9_pmu";
+				regulator-state-mem {
+				regulator-on-in-suspend;
+					regulator-suspend-microvolt = <900000>;
+				};
+			};
+
+			vccio_acodec: LDO_REG4 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <3000000>;
+				regulator-name = "vccio_acodec";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vccio_sd: LDO_REG5 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vccio_sd";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc3v3_pmu: LDO_REG6 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vcc3v3_pmu";
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <3300000>;
+				};
+			};
+
+			vcca_1v8: LDO_REG7 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "vcca_1v8";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcca1v8_pmu: LDO_REG8 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "vcca1v8_pmu";
+				regulator-state-mem {
+				regulator-on-in-suspend;
+					regulator-suspend-microvolt = <1800000>;
+				};
+			};
+
+			vcc1v8_dvp: LDO_REG9 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "vcc1v8_dvp";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc_1v8: DCDC_REG5 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "vcc_1v8";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc_3v3: SWITCH_REG1 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-name = "vcc_3v3";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc3v3_sd: SWITCH_REG2 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-name = "vcc3v3_sd";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+		};
+	};
+};
+
+&pcie2x1 {
+	reset-gpios = <&gpio3 RK_PB0 GPIO_ACTIVE_HIGH>;
+	vpcie3v3-supply = <&vcc3v3_pcie20>;
+	status = "okay";
+};
+
+&pinctrl {
+	sdio-pwrseq {
+		wifi_enable_h: wifi-enable-h {
+			rockchip,pins = <0 RK_PB3 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	usb {
+		usb_host_pwren: usb-host-pwren {
+			rockchip,pins = <4 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		usb_otg_pwren: usb-otg-pwren {
+			rockchip,pins = <0 RK_PC0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
+
+&saradc0 {
+	status = "okay";
+	vref-supply = <&vcc_1v8>;
+};
+
+&sdhci {
+	bus-width = <8>;
+	no-sdio;
+	no-sd;
+	non-removable;
+	mmc-hs400-1_8v;
+	mmc-hs400-enhanced-strobe;
+	full-pwr-cycle-in-suspend;
+	status = "okay";
+};
+
+&sdmmc0 {
+	no-sdio;
+	no-mmc;
+	bus-width = <4>;
+	cap-mmc-highspeed;
+	cap-sd-highspeed;
+	disable-wp;
+	sd-uhs-sdr104;
+	vmmc-supply = <&vcc3v3_sd>;
+	vqmmc-supply = <&vccio_sd>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdmmc0_bus4 &sdmmc0_clk &sdmmc0_cmd &sdmmc0_det>;
+	status = "okay";
+};
+
+&sdmmc1 {
+	no-sd;
+	no-mmc;
+	bus-width = <4>;
+	disable-wp;
+	cap-sd-highspeed;
+	cap-sdio-irq;
+	keep-power-in-suspend;
+	mmc-pwrseq = <&sdio_pwrseq>;
+	non-removable;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdmmc1_bus4 &sdmmc1_cmd &sdmmc1_clk>;
+	sd-uhs-sdr104;
+	status = "okay";
+};
+
+&u2phy {
+	status = "okay";
+};
+
+&u2phy_host {
+	status = "okay";
+	phy-supply = <&vcc5v0_usb_host>;
+};
+
+&u2phy_otg {
+	status = "okay";
+	phy-supply = <&vcc5v0_usb_otg>;
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&uart1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart1m0_xfer &uart1m0_ctsn>;
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
+&usbdrd_dwc3 {
+	status = "okay";
+	dr_mode = "host";
+	extcon = <&u2phy>;
+	maximum-speed = "high-speed";
+	phys = <&u2phy_otg>;
+	phy-names = "usb2-phy";
+	snps,dis_u2_susphy_quirk;
+	snps,usb2-lpm-disable;
+};
-- 
2.25.1

