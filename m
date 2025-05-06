Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C72145B3F;
	Tue,  6 May 2025 03:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746503137; cv=none; b=eKCcddOVwfy6kjwuwVNY0AwSCHoPvcaMChtlBo/ZjcpabPkQs4nr+KFtNApvctfqkWVhPck+liKRJGzrrgU+IkVQ6Fy+6RtRq73j9moaM6k6uE5BYerpUqPcYnnhPDbGIqHlvOweuJBwdjqwPERwzMSITmDxCKvYcpUbmiv5fQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746503137; c=relaxed/simple;
	bh=PKtacPhK2icAtcjTsO6oJoejIGbbNr+T1s+7CmvyD7g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=imUwQKToML1TA5oqjrC2luDJoYzc26j2ybEfedf3yZw0cBp7g7xeSHLvzBGzbi3FSPIJu3Er/N5eu663LjL1VG+yqOvTDNe6q7uyzMnoL//ZKjsUAkyapbUPm2HKbeQ16jxQ8I/E8s6+y85Dsaq3AdTvLZZ96/jFbrVBnDJLsWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=v/WgrQxL; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="v/WgrQxL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1746503066;
	bh=mUvjeg321mj6hkujAQdEir0PsB+kAIBak49s7qmYyqU=;
	h=From:To:Subject:Date:Message-Id;
	b=v/WgrQxLIsBGQE5crXY6vmrDQHJ/8phU7YZxrGKv6P1ZxUyweKzKOCbpZdoOFbDKh
	 BW5DarMLEl/AKvYanPVYHrav3f4x3IfwmhQagBe5mLR0veFzszE7Ijwo2Q4M+4h8vh
	 Yy5zwsFDeKQ5zPZE2udOn0x/R1cDrBTOdVtv3Z4Q=
X-QQ-mid: esmtpgz12t1746503059t21a66384
X-QQ-Originating-IP: NQEfTIhFEfSJj4koaP+i1/O/egDiOwPIUK7awOo2pt8=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 06 May 2025 11:44:16 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12356006377894110456
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
Subject: [PATCH v3 2/2] arm64: dts: rockchip: Add rk3399-evb-ind board
Date: Tue,  6 May 2025 11:43:47 +0800
Message-Id: <20250506034347.57-3-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250506034347.57-1-kernel@airkyi.com>
References: <20250506034347.57-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: NfykWmRlrd2oJyFO4fwe5TS+hPPPb6bPIuY2sWZ4TLSuLZULmPGjjGyS
	7Hsm+F2QIAJ+6mgb/RRJrzzubdvhk3RzY5nK2AxCby7Nk/RBWoT4IIeL2Yye1j4II22bDwB
	SfVaRbLA3iA1Bcgm9fXRDa7wOoD8P9LctOEsfUkoiL/Z3gHIpJfNxJim+nA9WXyeNCS27lE
	zSOoH5ZP2PHaxoDxQfgXnvmyNqIRpQjXeLR4cA6x11FORr/M5p3rang3ZEBWyj4r4MFgs94
	FBGkU8hVNBNIkxiKiKSD9Kb0SBl98AsHtdsNmXYeuHnwJ4TSJ1KuSQE636itVe8sj5eCMaS
	dvXT1UBitFEAzQTak93LD953uqpmXzTge9DF1+QVNX6e5niA5nbuMZ8+JdiBlOuhS2j8ORb
	YwErPF3maSCxSwskLbtEeNLH8fGIsqqE1YaCWb8uJj3+YZTFuKXZqo584s7VqAL5SeVlYqx
	KrjlEb8h1CoAiW7eUQfr5TFuwOg70c92s8d+zXGH2hKzMV6IYtambdW2jjaAysipLk54h2x
	W4kRxFn3pNqfvimg/JZIvbwfvVFLAjYCbwBA1xNeu0OMCqHLECk5GkQlSbHctgc2LdzXNxd
	7smHitXPiDen6XxxcXMqkIbKwOcAYSomZlgT5CiuKpBfcp48cfXpkXBk48qh9F3UMe/61Nr
	1+LIDxvXPxYmHF6FsS2LPQiyWgKgNKPvvF3p/m8InXtwllMmwajs2c2iSUSd4K2O5RpBNyr
	8LHUCNvQPLEwcBRdU2c2l2f9zn7w629EcEeZfLhTJIwS2fqNJUTriTEfOFUdZpl6XDmjatE
	mzT+YbRbF6FuDNzpuQQZxjKI305c2baYqUVTlOsprua+vvHKPOodkZH0wB8BVh9UdoFezZU
	4eS/5l3J84lfL/Jk0RqD9LnJlrniV9gV46OQDN4JqB3u+gtR6zyjs+2xoELWhdonqzcl0dE
	BjX1AFX7Kizyx4b+2nNPzGYdlB1+KJfCRYNSQscQQ+jJH82546RlhllQU
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
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

Changes in v3:
- Add i2s
- Add tsadc
- Fix devicetree coding style

Changes in v2:
- Remove gmac
- Add rk809 PMIC
- Add CPU supply
- Fix io-domain for sdmmc
- Enable vopl

 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../boot/dts/rockchip/rk3399-evb-ind.dts      | 496 ++++++++++++++++++
 2 files changed, 497 insertions(+)
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
index 000000000000..a8e94b353949
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts
@@ -0,0 +1,496 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2025 Rockchip Electronics Co., Ltd.
+ */
+
+/dts-v1/;
+#include "rk3399.dtsi"
+
+/ {
+	model = "Rockchip RK3399 EVB IND LPDDR4 Board";
+	compatible = "rockchip,rk3399-evb-ind", "rockchip,rk3399";
+
+	aliases {
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
+&cpu_b0 {
+	cpu-supply = <&vdd_cpu_b>;
+};
+
+&cpu_b1 {
+	cpu-supply = <&vdd_cpu_b>;
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
+	vdd_gpu: regulator@10 {
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
+		regulator-max-microvolt = <1500000>;
+		regulator-min-microvolt = <712500>;
+		regulator-name = "vdd_gpu";
+		regulator-ramp-delay = <1000>;
+
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+
+	vdd_cpu_b: regulator@1c {
+		compatible = "tcs,tcs4525";
+		reg = <0x1c>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vsel1_gpio>;
+		fcs,suspend-voltage-selector = <1>;
+		regulator-compatible = "fan53555-reg";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <1500000>;
+		regulator-min-microvolt = <712500>;
+		regulator-name = "vdd_cpu_b";
+		regulator-ramp-delay = <1000>;
+		vin-supply = <&vcc5v0_sys>;
+		vsel-gpios = <&gpio1 RK_PC1 GPIO_ACTIVE_HIGH>;
+
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+
+	rk809: pmic@20 {
+		compatible = "rockchip,rk809";
+		reg = <0x20>;
+		#clock-cells = <1>;
+		clock-output-names = "xin32k", "rk808-clkout2";
+		interrupt-parent = <&gpio1>;
+		interrupts = <RK_PC5 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pmic_int_l>;
+		wakeup-source;
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
+
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
+
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
+
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
+
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
+
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
+
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
+
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
+
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
+
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
+
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
+
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
+
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
+
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
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc5v0_usb: SWITCH_REG1 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-name = "vcc5v0_usb";
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+				};
+			};
+
+			vccio_3v3: SWITCH_REG2 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-name = "vccio_3v3";
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+		};
+	};
+};
+
+&i2s2 {
+	status = "okay";
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
+&pinctrl {
+	pmic {
+		pmic_int_l: pmic-int-l {
+			rockchip,pins = <1 RK_PC5 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+
+		vsel1_gpio: vsel1 {
+			rockchip,pins = <1 RK_PC1 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+
+		vsel2_gpio: vsel2 {
+			rockchip,pins = <1 RK_PB6 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+	};
+};
+
+&pmu_io_domains {
+	pmu1830-supply = <&vcc_1v8>;
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
+&tcphy0 {
+	status = "okay";
+};
+
+&tcphy1 {
+	status = "okay";
+};
+
+&tsadc {
+	/* tshut mode 0:CRU 1:GPIO */
+	rockchip,hw-tshut-mode = <1>;
+	/* tshut polarity 0:LOW 1:HIGH */
+	rockchip,hw-tshut-polarity = <1>;
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

