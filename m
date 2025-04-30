Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27D91FCFE9;
	Wed, 30 Apr 2025 07:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745999439; cv=none; b=QuMoHNx1VFsuR2RjQ78YKT7k8bCbB23zsLHMVWmJl1XM19mszPjU3NVwbAAqBvMwMZhIstB39DjVC35NfxD0jxXVTZ8tpzMX0ZAfZRwjQnSSDgWMFIUGvTACRca23BrmTjLWLGVBtl8oga6cueUnR3x9+Zaa/Zaf2s54EdKKu5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745999439; c=relaxed/simple;
	bh=diKFBjWXJOGhs4IFhkl3FVMsNFiQGgF0BbIn/iteEqw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=LWAGo2ZpZXMBvMmTM39Zbu6TM7R+BZ+fIivYObjy2zM8dJs7duomZWCgCB/LVdXTRJdBTWC0rviHfml2xXrSVQDBMMJSG8waJ1DznSNdYxHJqV3duzkIRX6RmLl7R95koOsLBhU9NH8EKaPApBafBtHmjyYwN9Psy3VSLVEkpBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=l53W3bbX; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="l53W3bbX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1745999358;
	bh=hyCeNbeJdxcB2lF5RAlXP8rubKGgXywPOdd8N78vUUg=;
	h=From:To:Subject:Date:Message-Id;
	b=l53W3bbXxZEPmciQJHKsGqtvDXvN4ro/v91JfpPSgz0/bqVGyM7PzuflFP/hB3WGK
	 VogoxwUSDYan+UcZMKMiHb2P7NM6Bdt56Zz6VMAhC+1+75+8vub6cut/mly0KfUCvK
	 G6k+3qZ6wIGNDzBZfFOsRfHJpJBElSnolW8G5oMs=
X-QQ-mid: zesmtpsz5t1745999348tb07a80f6
X-QQ-Originating-IP: UBwGYlmaclXM86yVCi6aUZ4NJl1jMnEuKQArBZr98DA=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 30 Apr 2025 15:49:06 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13092006623820627139
EX-QQ-RecipientCnt: 21
From: Chaoyi Chen <kernel@airkyi.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Kever Yang <kever.yang@rock-chips.com>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Alexey Charkov <alchark@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] arm64: dts: rockchip: Add rk3399-evb-ind board
Date: Wed, 30 Apr 2025 15:48:48 +0800
Message-Id: <20250430074848.539-3-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250430074848.539-1-kernel@airkyi.com>
References: <20250430074848.539-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: NnHSgyOaHlCIcnhSQQ0JFPy0uiQTkjA9LGikybF2OTj1Yjgyg3Rtmgxj
	kkWkUGJuudlSLstePKh7bAgOONN5O1Xc76jgZpNoARvrAXBbAlChBD71z8Ho/XvRc/KU4ld
	FhnHaMbvox0jY09LIEPD+OXEklieFzj9a+m1bMvDS3OBsB8gzDalnUgw4eUJ3A/3NHvJt+f
	lGH4GVcvj48aGFoc51JSdG8WObe8m5mkwOWXZ2Rlzd/b4iNVweZv1WpAnhHUrlwTBuspdR1
	nP8xaxsd1+xi1DT/2HTNIcjvGlDxihdKKBI+9qdrvm/LAz5lHfQmZAiqLzq06GpqQs7f2ht
	FBgEM3hPM3zGFQTd6NNUiTm88Dv1daFI7kTd5++xFYDWd0ecFpiejH4+vIBUksZ22z7vLdS
	JdwlKA1luG3GMwmX5URHAnji8+v8x1yOX45+aG35LEYcbkwSK7podQRnyBx3S+B1uIDggKF
	pxGhwhzDxy1CKmDZQ3SZnNSV4qOKWIGk717LXo+wG5Nc4ZtgmDWBlBaL5D5SqmJi8don+Fj
	CAaAmUKBn5l7d57g0tc8IhcTGzhrfl9uwapldZurYg0a53X85bYauVHRH8orokgS72IUqHf
	rwPgVFUobpRQnXjUC8W0NbUcCYDxB4xIt9rPLuf6wluMzffMYUnn9UnIQWGvFh2hPBt2J3O
	Q9kAHhdLA1j43zgTCZP8xwITP9uGabuVVUZ+pVZGwVIlYH72OnIU22qiSidm0H8SkWxqmyX
	+5J4swc4IdHC71p2/HXzsP7uX9fXNi/oing1iqJEaSHjbX003O0vWiauzuaiJIAS4/zVNLl
	9x0uEaOdOakI7FTTQxqssSwtRMTXvAMBJO30e7wrwIp62AgXLPvhz/Z7Pbt2TFoZqIo4b6U
	R9IkhnACSPKKI+gB3WpGgps4wGKp3Fs70IhWh5aux9yiiJIk3uYTRVPsumKcihCQajDNAZp
	jeJxveFeFUHdam+VOb0icjQl90FTxAFXgaKtHh85EWi6y3HxjBqkifKnKyuyChl55BQQsLu
	LHvPyevUgifa2DkbGhfER884ihG4ACF5s10jyu09VHT0bG7iOkDiJDu+ms5gHku8Vtz/Q6z
	Q==
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

General feature for rk3399 industry evaluation board:
- Rockchip RK3399
- 4GB LPDDR4
- emmc5.1
- SDIO3.0 compatible TF card
- 1x HDMI2.0a TX
- 1x HDMI1.4b RX with TC358749XBG HDMI to MIPI CSI2 bridge chip
- 1x type-c DisplayPort
- 3x USB3.0 Host
- 1x USB2.0 Host
- 1x Ethernet / USB3.0 to Ethernet

Tested with HDMI/GPU/USB2.0/USB3.0/TF card/emmc.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---

Changes in v2:
- Remove gmac
- Add rk809 PMIC
- Add CPU supply
- Fix io-domain for sdmmc
- Enable vopl

 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../boot/dts/rockchip/rk3399-evb-ind.dts      | 466 ++++++++++++++++++
 2 files changed, 467 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 3e8771ef69ba..8a3adb7482ca 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -40,6 +40,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3368-px5-evb.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3368-r88.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-eaidk-610.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-evb.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-evb-ind.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-ficus.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-firefly.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-gru-bob.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts b/arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts
new file mode 100644
index 000000000000..ebfe7e56b3f5
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts
@@ -0,0 +1,466 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2025 Rockchip Electronics Co., Ltd.
+ */
+
+/dts-v1/;
+#include "rk3399-base.dtsi"
+
+/ {
+	model = "Rockchip RK3399 EVB IND LPDDR4 Board";
+	compatible = "rockchip,rk3399-evb-ind", "rockchip,rk3399";
+
+	aliases {
+		ethernet0 = &gmac;
+		mmc0 = &sdhci;
+		mmc1 = &sdmmc;
+	};
+
+	chosen {
+		stdout-path = "serial2:1500000n8";
+	};
+
+	vcc5v0_sys: regulator-vcc5v0-sys {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio4 RK_PD2 GPIO_ACTIVE_HIGH>;
+		regulator-name = "vcc5v0_sys";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+	};
+};
+
+&cpu_l0 {
+	cpu-supply = <&vdd_cpu_l>;
+};
+
+&cpu_l1 {
+	cpu-supply = <&vdd_cpu_l>;
+};
+
+&cpu_l2 {
+	cpu-supply = <&vdd_cpu_l>;
+};
+
+&cpu_l3 {
+	cpu-supply = <&vdd_cpu_l>;
+};
+
+&cpu_b0 {
+	cpu-supply = <&vdd_cpu_b>;
+};
+
+&cpu_b1 {
+	cpu-supply = <&vdd_cpu_b>;
+};
+
+&emmc_phy {
+	status = "okay";
+};
+
+&gpu {
+	mali-supply = <&vdd_gpu>;
+	status = "okay";
+};
+
+&hdmi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&hdmi_i2c_xfer>, <&hdmi_cec>;
+	status = "okay";
+};
+
+&hdmi_sound {
+	status = "okay";
+};
+
+&i2c0 {
+	clock-frequency = <400000>;
+	i2c-scl-falling-time-ns = <4>;
+	i2c-scl-rising-time-ns = <168>;
+	status = "okay";
+
+	rk809: pmic@20 {
+		compatible = "rockchip,rk809";
+		reg = <0x20>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <RK_PC5 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pmic_int_l>;
+		rockchip,system-power-controller;
+		#clock-cells = <1>;
+		pmic-reset-func = <0>;
+		wakeup-source;
+		clock-output-names = "xin32k", "rk808-clkout2";
+
+		vcc1-supply = <&vcc5v0_sys>;
+		vcc2-supply = <&vcc5v0_sys>;
+		vcc3-supply = <&vcc5v0_sys>;
+		vcc4-supply = <&vcc5v0_sys>;
+		vcc5-supply = <&vcc_buck5>;
+		vcc6-supply = <&vcc_buck5>;
+		vcc7-supply = <&vcc5v0_sys>;
+		vcc8-supply = <&vcc3v3_sys>;
+		vcc9-supply = <&vcc5v0_sys>;
+
+		regulators {
+			vdd_center: DCDC_REG1 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-initial-mode = <0x2>;
+				regulator-max-microvolt = <1350000>;
+				regulator-min-microvolt = <750000>;
+				regulator-ramp-delay = <6001>;
+				regulator-name = "vdd_center";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdd_cpu_l: DCDC_REG2 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-initial-mode = <0x2>;
+				regulator-max-microvolt = <1350000>;
+				regulator-min-microvolt = <750000>;
+				regulator-ramp-delay = <6001>;
+				regulator-name = "vdd_cpu_l";
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
+			vcc3v3_sys: DCDC_REG4 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-initial-mode = <0x2>;
+				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <3300000>;
+				regulator-name = "vcc3v3_sys";
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <3300000>;
+				};
+			};
+
+			vcc_buck5: DCDC_REG5 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <2200000>;
+				regulator-min-microvolt = <2200000>;
+				regulator-name = "vcc_buck5";
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <2200000>;
+				};
+			};
+
+			vcca_0v9: LDO_REG1 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <900000>;
+				regulator-min-microvolt = <900000>;
+				regulator-name = "vcca_0v9";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc_1v8: LDO_REG2 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <1800000>;
+				regulator-min-microvolt = <1800000>;
+				regulator-name = "vcc_1v8";
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <1800000>;
+				};
+			};
+
+			vcc0v9_soc: LDO_REG3 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <900000>;
+				regulator-min-microvolt = <900000>;
+				regulator-name = "vcc0v9_soc";
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <900000>;
+				};
+			};
+
+			vcca_1v8: LDO_REG4 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <1800000>;
+				regulator-min-microvolt = <1800000>;
+				regulator-name = "vcca_1v8";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdd1v5_dvp: LDO_REG5 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <1500000>;
+				regulator-min-microvolt = <1500000>;
+				regulator-name = "vdd1v5_dvp";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc_1v5: LDO_REG6 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <1500000>;
+				regulator-min-microvolt = <1500000>;
+				regulator-name = "vcc_1v5";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc_3v0: LDO_REG7 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3000000>;
+				regulator-min-microvolt = <3000000>;
+				regulator-name = "vcc_3v0";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vccio_sd: LDO_REG8 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <1800000>;
+				regulator-name = "vccio_sd";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc_sd: LDO_REG9 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <3300000>;
+				regulator-name = "vcc_sd";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc5v0_usb: SWITCH_REG1 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-name = "vcc5v0_usb";
+				regulator-state-mem {
+					regulator-on-in-suspend;
+				};
+			};
+
+			vccio_3v3: SWITCH_REG2 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-name = "vccio_3v3";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+		};
+	};
+
+	vdd_cpu_b: tcs4525@1c {
+		compatible = "tcs,tcs4525";
+		reg = <0x1c>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vsel1_gpio>;
+		fcs,suspend-voltage-selector = <1>;
+		vin-supply = <&vcc5v0_sys>;
+		vsel-gpios = <&gpio1 RK_PC1 GPIO_ACTIVE_HIGH>;
+		regulator-compatible = "fan53555-reg";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-initial-state = <3>;
+		regulator-max-microvolt = <1500000>;
+		regulator-min-microvolt = <712500>;
+		regulator-name = "vdd_cpu_b";
+		regulator-ramp-delay = <1000>;
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+
+	vdd_gpu: tcs4526@10 {
+		compatible = "tcs,tcs4525";
+		reg = <0x10>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vsel2_gpio>;
+		fcs,suspend-voltage-selector = <1>;
+		vin-supply = <&vcc5v0_sys>;
+		vsel-gpios = <&gpio1 RK_PB6 GPIO_ACTIVE_HIGH>;
+		regulator-compatible = "fan53555-reg";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-initial-state = <3>;
+		regulator-max-microvolt = <1500000>;
+		regulator-min-microvolt = <712500>;
+		regulator-name = "vdd_gpu";
+		regulator-ramp-delay = <1000>;
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+};
+
+&io_domains {
+	audio-supply = <&vcca_1v8>;
+	bt656-supply = <&vcc_3v0>;
+	gpio1830-supply = <&vcc_3v0>;
+	sdmmc-supply = <&vccio_sd>;
+	status = "okay";
+};
+
+&sdmmc {
+	bus-width = <4>;
+	cap-mmc-highspeed;
+	cap-sd-highspeed;
+	disable-wp;
+	no-sdio;
+	no-mmc;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdmmc_clk &sdmmc_cmd &sdmmc_bus4>;
+	sd-uhs-sdr104;
+	vmmc-supply = <&vcc_sd>;
+	vqmmc-supply = <&vccio_sd>;
+	status = "okay";
+};
+
+&sdhci {
+	bus-width = <8>;
+	keep-power-in-suspend;
+	mmc-hs400-1_8v;
+	mmc-hs400-enhanced-strobe;
+	no-sdio;
+	no-sd;
+	non-removable;
+	status = "okay";
+};
+
+&tcphy0 {
+	status = "okay";
+};
+
+&tcphy1 {
+	status = "okay";
+};
+
+&u2phy0 {
+	status = "okay";
+};
+
+&u2phy0_host {
+	status = "okay";
+};
+
+&u2phy0_otg {
+	status = "okay";
+};
+
+&u2phy1 {
+	status = "okay";
+};
+
+&u2phy1_host {
+	status = "okay";
+};
+
+&u2phy1_otg {
+	status = "okay";
+};
+
+&uart2 {
+	status = "okay";
+};
+
+&usbdrd_dwc3_0 {
+	status = "okay";
+};
+
+&usbdrd3_0 {
+	status = "okay";
+};
+
+&usbdrd3_1 {
+	status = "okay";
+};
+
+&usbdrd_dwc3_1 {
+	dr_mode = "host";
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
+&usb_host1_ehci {
+	status = "okay";
+};
+
+&usb_host1_ohci {
+	status = "okay";
+};
+
+&pinctrl {
+	pmic {
+		pmic_int_l: pmic-int-l {
+			rockchip,pins = <1 RK_PC5 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+
+		vsel1_gpio: vsel1-gpio {
+			rockchip,pins = <1 RK_PC1 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+
+		vsel2_gpio: vsel2-gpio {
+			rockchip,pins = <1 RK_PB6 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+	};
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
+	status = "okay";
+};
+
+&vopl_mmu {
+	status = "okay";
+};
--
2.49.0

