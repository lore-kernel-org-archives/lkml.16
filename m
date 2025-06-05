Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE2427FD64;
	Thu,  5 Jun 2025 23:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749165152; cv=none; b=mAH4VDhTeTJHWvhU4NyrNLFsztqaB3QoEjom3Yg3+6ol+EkZPG6i+Q6gNyvATqlXMMM4DGFa62JDq/qKAq/l4IWbpdVz72jDiplW73AdKNJBLxhlSq0yoJjhJ6GI60yUjvLS6hj90uBz9mwIMSdX8Hrxlrb2n1bepvXAj3es6rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749165152; c=relaxed/simple;
	bh=I1vR1vgf/3PIBKbjyvwL0J1CtXvXc6ZPxCzJM1iBbNU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RkjBjU2oxmi8ZAt1KElhxE7qq/alv+vmn1vfy1lFNGgWvsqxiCDBdeG1ywc0KpHhqbydWkGpytdx39EcAPKhHeZN99xaYiaLEg6+Zg/amipTFfQ3Q+/DbxLtLsWnoxbGazx6QpnK3srWC0daLJK+N4gj6A4yLo0WiZIwpQAdVLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IauJagEJ; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IauJagEJ"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2352e3db62cso16350985ad.2;
        Thu, 05 Jun 2025 16:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749165150; x=1749769950; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vc2TqWleR1XuJhws+EMwd0gyOFXoxLevoyx6l9NzkbQ=;
        b=IauJagEJ8QM+g4crrpVSNvdG03eA+QuZTMWRJAuRUQjLQoB3qukRGZI74XlV30zz4p
         7WtoOltY/L62adamCvEo/LMyPtijpam22+hnUT0unYC70XBxyBkXOeoFHO4E8VqHicTQ
         TPHPUgakpnUy78BUKg9/LmfPs2GwoJkw4EQlKT/sskm3If1EgtyjyT8cSs9NS/c60nAB
         eYyYzG8Yqy0DsbyRDYoGxZX1h93UzvSILzR64dq5TrNE0jULuGT9bh1U3OpxKvdCHFr7
         EqmY1THbJZ5wgYIxbInx7hbI0kup6srep+VsQzGhUEE6TzCJm0KmcP+132tv5MLVHAfK
         v44A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749165150; x=1749769950;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vc2TqWleR1XuJhws+EMwd0gyOFXoxLevoyx6l9NzkbQ=;
        b=X7lAXOGMjev+bQNLjV/CVHRGMZCdLvEnplvgoB0FCNdsHp5tmoNwd+Pc08d75UViEo
         366FDloNrEk9ElQZpwGw6QlL37tCoXaezbfWbO4uB6KwsI+V7C++Eis9bEKbAdl6bBJQ
         76F1AuFNlj5zJYeX1bUpZU/7V6CIoM/30Z4gEgekcJtIFRS3c6zmdar8nsaqE2F3cVxg
         cwgII9OxFEWnlid0Tyqg80rTNYM7+DM04BQ0wzaWhJlwpWwP07/QYpKgzW3M4sfBVFol
         DQ2vnHaIzG1rDg/qHxxotaBZeyGSGuga5wmQavVjvGiN6vvpFKivgidUdJjs4JVYSHJQ
         FExg==
X-Forwarded-Encrypted: i=1; AJvYcCUYbe++s9lvjyPo9PY2Ia+5Txs+rcEr7j5FSHnSnJ/eRXBcXwXFkpy36imye9dvB2J1A+aquU0g8ks5rlI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzOH8TdaNRVpxGJSxbBxSa2HMJ9cgoxQxnKqHJm2YHYp0+KA31
	I8G6yupxhF2QUS4tBf8//aVvPa7Nq14zk4eRXZlsD/XBoQ4qCwv7HSZe
X-Gm-Gg: ASbGncsVvzEJduCjubmKTc7H9DY/fPI0T5cbhIZe04aO4qPUqTY5yoPuGdmw97/fRtI
	X90fN1JBVNlidqvjsMBDR23AMyoWNcsen+uVtICgF1JR4kR/1DGSgw7qrRW+QPk889R/P1PCZ1r
	Bd2CKHoOovpOyrSBm/GFXcL2ZveF77ojeOV5L7DUrRNN/0ajJWW2lo4dEJCOfkUXFHmy4UQQclu
	0yHsn7ciauMV2oSOx6VxbcMXJyMcX1+nuFX1iRPKBQz/SmmqzxdYK74E7iNAm03LU3c8w5KsiGh
	UEs3ysCQXm5pL+mpGLuv3U8QuTKqPeIwiFwvjjAjlgyWOkn4XvVVoavOk1LRImzglpLAuNFq
X-Google-Smtp-Source: AGHT+IGEisH1gw39FDMb/wXJwOhLquN+GCTmEdiLW2yhUzcvGPF7Xbpyf5sXxZnZmX0Ah1V/nAU25A==
X-Received: by 2002:a17:903:189:b0:234:d292:be7f with SMTP id d9443c01a7336-23601e7fca5mr14506085ad.31.1749165149876;
        Thu, 05 Jun 2025 16:12:29 -0700 (PDT)
Received: from wash.local ([50.46.184.91])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603097091sm1346175ad.69.2025.06.05.16.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 16:12:29 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Thu, 05 Jun 2025 16:11:53 -0700
Subject: [PATCH v4 3/3] arm64: dts: rockchip: Add support for CM5 IO
 carrier
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-rk3588s-cm5-io-dts-upstream-v4-3-8445db5ca6b0@gmail.com>
References: <20250605-rk3588s-cm5-io-dts-upstream-v4-0-8445db5ca6b0@gmail.com>
In-Reply-To: <20250605-rk3588s-cm5-io-dts-upstream-v4-0-8445db5ca6b0@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Joseph Kogut <joseph.kogut@gmail.com>, 
 Steve deRosier <derosier@cal-sierra.com>
X-Mailer: b4 0.14.2

Specification:
- 1x HDMI
- 2x MIPI DSI
- 2x MIPI CSI
- 1x eDP
- 1x M.2 E key
- 1x USB 3.0 Host
- 1x USB 3.0 OTG
- 2x USB 2.0 Host
- Headphone jack w/ microphone
- Gigabit Ethernet w/ PoE
- microSD slot
- 40-pin expansion header
- 12V DC

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 arch/arm64/boot/dts/rockchip/Makefile              |   1 +
 .../boot/dts/rockchip/rk3588s-radxa-cm5-io.dts     | 454 +++++++++++++++++++++
 2 files changed, 455 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 3e8771ef69ba1c1428117cc2ae29b84e13523e21..bc09420cacde4557c42935066e9f70bca1190f82 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -177,6 +177,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-nanopi-r6c.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-odroid-m2.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-orangepi-5.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-orangepi-5b.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-radxa-cm5-io.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-rock-5a.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-rock-5c.dtb
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5-io.dts b/arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5-io.dts
new file mode 100644
index 0000000000000000000000000000000000000000..6bdb38464820278fc94e0ceb893e204df33c0381
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5-io.dts
@@ -0,0 +1,454 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2025 Joseph Kogut <joseph.kogut@gmail.com>
+ */
+
+/*
+ * CM5 IO board data sheet
+ * https://dl.radxa.com/cm5/v2200/radxa_cm5_io_v2200_schematic.pdf
+ */
+
+/dts-v1/;
+#include "rk3588s.dtsi"
+#include "rk3588s-radxa-cm5.dtsi"
+
+/ {
+	model = "Radxa Compute Module 5 (CM5) IO Board";
+	compatible = "radxa,cm5-io", "radxa,cm5", "rockchip,rk3588s";
+
+	chosen {
+		stdout-path = "serial2:1500000n8";
+	};
+
+	hdmi-con {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi0_out_con>;
+			};
+		};
+	};
+
+	vcc12v_dcin: regulator-12v0-vcc-dcin {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc12v_dcin";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+	};
+
+	vcc5v0_host: vcc5v0-host-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_host";
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+		gpio = <&gpio1 RK_PA0 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vcc5v0_host_en>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vcc5v0_sys: regulator-5v0-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_sys";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc12v_dcin>;
+	};
+
+	vbus5v0_typec: vbus5v0-typec {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus5v0_typec";
+		gpio = <&gpio0 RK_PD5 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vbus5v0_typec_en>;
+		enable-active-high;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vcc3v3_pcie: regulator-3v3-vcc-pcie {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc3v3_pcie2x1l0";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		enable-active-high;
+		regulator-boot-on;
+		regulator-always-on;
+		gpios = <&gpio1 RK_PD3 GPIO_ACTIVE_HIGH>;
+		startup-delay-us = <50000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vcc_3v3_s0: pldo-reg4 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_3v3_s0";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-ramp-delay = <12500>;
+
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+};
+
+&combphy0_ps {
+	status = "okay";
+};
+
+&combphy2_psu {
+	status = "okay";
+};
+
+&hdmi0_in {
+	hdmi0_in_vp0: endpoint {
+		remote-endpoint = <&vp0_out_hdmi0>;
+	};
+};
+
+&hdmi0_out {
+	hdmi0_out_con: endpoint {
+		remote-endpoint = <&hdmi_con_in>;
+	};
+};
+
+&hdptxphy0 {
+	status = "okay";
+};
+
+&i2c6 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c6m3_xfer>;
+	status = "okay";
+
+	fusb302: usb-typec@22 {
+		compatible = "fcs,fusb302";
+		reg = <0x22>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PC4 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usbc0_int>;
+		vbus-supply = <&vbus5v0_typec>;
+
+		connector {
+			compatible = "usb-c-connector";
+			data-role = "dual";
+			label = "USB-C";
+			power-role = "dual";
+			try-power-role = "sink";
+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			sink-pdos = <PDO_FIXED(5000, 1000, PDO_FIXED_USB_COMM)>;
+			op-sink-microwatt = <1000000>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					usbc0_orientation_switch: endpoint {
+						remote-endpoint = <&usbdp_phy0_orientation_switch>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					usbc0_role_switch: endpoint {
+						remote-endpoint = <&usb_host0_xhci_role_switch>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+					usbc0_dp_altmode_mux: endpoint {
+						remote-endpoint = <&usbdp_phy0_dp_altmode_mux>;
+					};
+				};
+			};
+		};
+	};
+};
+
+&pcie2x1l2 {
+	reset-gpios = <&gpio3 RK_PD1 GPIO_ACTIVE_HIGH>;
+	vpcie3v3-supply = <&vcc3v3_pcie>;
+	status = "okay";
+};
+
+&pinctrl {
+	fusb302 {
+		vbus5v0_typec_en: vbus5v0-typec-en {
+			rockchip,pins = <0 RK_PD5 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		usbc0_int: usbc0-int {
+			rockchip,pins = <0 RK_PC4 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
+	usb {
+		vcc5v0_host_en: vcc5v0-host-en {
+			rockchip,pins = <1 RK_PA0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
+
+&sdhci {
+	status = "okay";
+};
+
+&sdmmc {
+	bus-width = <4>;
+	cap-mmc-highspeed;
+	cap-sd-highspeed;
+	disable-wp;
+	max-frequency = <200000000>;
+	no-sdio;
+	no-mmc;
+	sd-uhs-sdr104;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdmmc_bus4 &sdmmc_clk &sdmmc_cmd &sdmmc_det>;
+	vmmc-supply = <&vcc_3v3_s3>;
+	vqmmc-supply = <&vccio_sd_s0>;
+	status = "okay";
+};
+
+&spi2 {
+	assigned-clocks = <&cru CLK_SPI2>;
+	assigned-clock-rates = <200000000>;
+	num-cs = <1>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi2m2_cs0 &spi2m2_pins>;
+	status = "okay";
+
+	pmic@0 {
+		compatible = "rockchip,rk806";
+		reg = <0x0>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <7 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pmic_pins>, <&rk806_dvs1_null>,
+			    <&rk806_dvs2_null>, <&rk806_dvs3_null>;
+		spi-max-frequency = <1000000>;
+		system-power-controller;
+
+		vcc1-supply = <&vcc5v0_sys>;
+		vcc2-supply = <&vcc5v0_sys>;
+		vcc3-supply = <&vcc5v0_sys>;
+		vcc4-supply = <&vcc5v0_sys>;
+		vcc5-supply = <&vcc5v0_sys>;
+		vcc6-supply = <&vcc5v0_sys>;
+		vcc7-supply = <&vcc5v0_sys>;
+		vcc8-supply = <&vcc5v0_sys>;
+		vcc9-supply = <&vcc5v0_sys>;
+		vcc10-supply = <&vcc5v0_sys>;
+		vcc11-supply = <&vcc_2v0_pldo_s3>;
+		vcc12-supply = <&vcc5v0_sys>;
+		vcc13-supply = <&vdd2_ddr_s3>;
+		vcc14-supply = <&vdd2_ddr_s3>;
+		vcca-supply = <&vcc5v0_sys>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		rk806_dvs1_null: dvs1-null-pins {
+			pins = "gpio_pwrctrl1";
+			function = "pin_fun0";
+		};
+
+		rk806_dvs2_null: dvs2-null-pins {
+			pins = "gpio_pwrctrl2";
+			function = "pin_fun0";
+		};
+
+		rk806_dvs3_null: dvs3-null-pins {
+			pins = "gpio_pwrctrl3";
+			function = "pin_fun0";
+		};
+
+		regulators {
+			vdd_gpu_s0: dcdc-reg1 {
+				regulator-name = "vdd_gpu_s0";
+				regulator-boot-on;
+				regulator-enable-ramp-delay = <400>;
+				regulator-min-microvolt = <550000>;
+				regulator-max-microvolt = <950000>;
+				regulator-ramp-delay = <12500>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdd_cpu_lit_s0: dcdc-reg2 {
+				regulator-name = "vdd_cpu_lit_s0";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <550000>;
+				regulator-max-microvolt = <950000>;
+				regulator-ramp-delay = <12500>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vccio_sd_s0: pldo-reg5 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vccio_sd_s0";
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdd2_ddr_s3: dcdc-reg6 {
+				regulator-name = "vdd2_ddr_s3";
+				regulator-always-on;
+				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+				};
+			};
+
+			vcc_2v0_pldo_s3: dcdc-reg7 {
+				regulator-name = "vdd_2v0_pldo_s3";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <2000000>;
+				regulator-max-microvolt = <2000000>;
+				regulator-ramp-delay = <12500>;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <2000000>;
+				};
+			};
+
+			vcc_3v3_s3: dcdc-reg8 {
+				regulator-name = "vcc_3v3_s3";
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
+		};
+	};
+};
+
+&u2phy0 {
+	status = "okay";
+};
+
+&u2phy0_otg {
+	status = "okay";
+};
+
+&u2phy2 {
+	status = "okay";
+};
+
+&u2phy2_host {
+	status = "okay";
+};
+
+&u2phy3 {
+	status = "okay";
+};
+
+&u2phy3_host {
+	status = "okay";
+};
+
+&uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart2m0_xfer>;
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
+&usb_host0_xhci {
+	dr_mode = "otg";
+	usb-role-switch;
+	status = "okay";
+
+	port {
+		usb_host0_xhci_role_switch: endpoint {
+			remote-endpoint = <&usbc0_role_switch>;
+		};
+	};
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
+&usbdp_phy0 {
+	mode-switch;
+	orientation-switch;
+	sbu1-dc-gpios = <&gpio3 RK_PC4 GPIO_ACTIVE_HIGH>;
+	sbu2-dc-gpios = <&gpio3 RK_PD4 GPIO_ACTIVE_HIGH>;
+	status = "okay";
+
+	port {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		usbdp_phy0_orientation_switch: endpoint@0 {
+			reg = <0>;
+			remote-endpoint = <&usbc0_orientation_switch>;
+		};
+
+		usbdp_phy0_dp_altmode_mux: endpoint@1 {
+			reg = <1>;
+			remote-endpoint = <&usbc0_dp_altmode_mux>;
+		};
+	};
+};
+
+&vop {
+	status = "okay";
+};
+
+&vop_mmu {
+	status = "okay";
+};
+
+&vp0 {
+	vp0_out_hdmi0: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
+		reg = <ROCKCHIP_VOP2_EP_HDMI0>;
+		remote-endpoint = <&hdmi0_in_vp0>;
+	};
+};

-- 
2.49.0

