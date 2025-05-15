Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0C3270552;
	Thu, 15 May 2025 22:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747346643; cv=none; b=udmuW34t+3eoOhUGah04/qSAunEEwNYZWvZ7a9PdPUAbX7hMIsv0hU+M/IvkiM2IQynAinZAeb1nMrPHwr/WhmsGYEADeIG42pi61omv6QO4lpdivFeIqFpoY35IuRI+lj8X9t2HdNPKX3xTrH9zms5AcNSRSr+DTK8WETqWuaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747346643; c=relaxed/simple;
	bh=J+jPcrkQCsJPV+GVvA4s8dS9pyf1b89QpC4ZQzeTpvw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cK8cS7DoRT/6UYqyBXS8hgeyAxCnv/rjoyGIKj9olFziEVXQG4wpzL3vUeI4bd8FW3xTvMhXnC/fcZrnLo3umbd1LyGliXgXte3bUdQY6bVK6HQt4MKCl31jc9JpMF+57dZ0e/3qR3NUwklEXWKyIcXeWv8znUbjz5+nc4pVuc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DjH6kWBT; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DjH6kWBT"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-73972a54919so1647875b3a.3;
        Thu, 15 May 2025 15:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747346641; x=1747951441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hm36XRukGYLxdexbfbacJ3WtYmDk+767jDqKiPUoXxc=;
        b=DjH6kWBT9aC4hJvnfS1uft01Sp5l6GbK+55z6ifm/SRgWcp37i9L1Ji9/g9XFsGIE5
         kklpEsvkBHi9Pgy9YfYNSu92wISg9QiEOUV/Pwqr5UUhhn3YSK9chZGZBYCvg634RNc8
         vBlkweW+WgcArqG+g/CY0dy4tq5gwjHwAgov0B7MGHvrHiLxptkqvrTgj/fGTFx0urxo
         jhbdVCiZ6aTKo2XGAfvvlWTbYP87MqbCkYOuGF/qhjCMRFtua0tWwwA3cPClgrFMeOYR
         95gy/9+FPSQfmDzMFRE9vBMLmzQIbeSsD8rRwjOI7NA0cN/GLjoxyUVciK2iR3Ymim/B
         lJjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747346641; x=1747951441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hm36XRukGYLxdexbfbacJ3WtYmDk+767jDqKiPUoXxc=;
        b=K9gURw0Zhi54mKTWyY4jWAFnyszBAd2jV2oA0RaJzf9vcpyiStLsMotYRNcVPU/QF0
         sAOlmpgpNIzOH6gS3xqXN+PaT6PpL90E0jf/GFjHhCmNGkSjxF92OszpBpLA3XSmtjoJ
         ESMx6tLD2bdTtExlGX+M5izSgsGQUcOW1yAgazXrsVbrahWrnitDbndf0pYFAt4j5aQC
         QwJN2Hv1TEt9xgZelceNJqO+V0fwI3ThcYR9dZHR2LtTN9NxpLS68VGGjjdEXvS5gYZn
         XkTm9h5qMlKNfKZDwRFLXRJQz8RXsYTqXKP+lbVeRNI/1bl0rgZkecPQ4a8qUMcsxFkC
         NYqg==
X-Forwarded-Encrypted: i=1; AJvYcCUSalMZ3OrHcmPpw7DNgpPIwlr5dSffA7WWUE11QHmDek354mQqw1Y9Ry02EEI9q0ZCiWiUzkHXSevf/CS1@vger.kernel.org, AJvYcCUz3V+4nZ8/3UMtM4/tYzDXPGQT7GTJVCZVFNgRScxmbic2/GMUXRcXgbe7xDF5b+Rs3IQwuXvKAKwj@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4Ps2lRxadVAD/zi6KZiUnI/7zkz4hNTLPflhCFLt+ERJ8eUkc
	FPkDbbQaflzZ6KihGJbXLtY9UhPuNOapMgmGmGV8PzPB22d6NGozNevi
X-Gm-Gg: ASbGncu2Pbd5ktSmgGGLNmkhljSAxS4VVk4eZ3lnRayfiJyztHvu1YfeuYFC1WstHId
	eBkM6iJrZv9RcwJWlKPsI1JEd51yuL7EMgomrwLu7MaK0CHwLgBVGHQbPyMYRBZ5D2YMQfSJGKJ
	T/M0PyDsawJW0KGeo6/RL+lVB2int6rkiixLMY/mkgI8wQfZ4f5/Msno0AlozZerohBqB/WWWft
	Y4O7Nw9gvEoa9WSrUh33zcNqtlmo2HgU8N60Ff43+Uq9VIDWYNI4lMM7EBsyzzx+tpoCndplCON
	K86/HhXhIbgsRG1IbmxQYqGl+AkRGaMjSw100AsIjcxQINbBeR2HGiXPOtkYfVzbTA==
X-Google-Smtp-Source: AGHT+IHD0k3lA3QSvyyXU+HobYolSStB01M3HON2KvHWlbykIpiLx+7SwHgYjSU79uXlZ0YujPan5w==
X-Received: by 2002:a05:6a20:d70a:b0:206:a9bd:ad7f with SMTP id adf61e73a8af0-2162188b80amr1513521637.6.1747346640883;
        Thu, 15 May 2025 15:04:00 -0700 (PDT)
Received: from localhost.localdomain ([50.46.184.91])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a986d8d7sm284352b3a.130.2025.05.15.15.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 15:04:00 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Steve deRosier <derosier@cal-sierra.com>,
	Joseph Kogut <joseph.kogut@gmail.com>
Subject: [PATCH v2 2/2] arm64: dts: rockchip: add Radxa CM5 and IO board
Date: Thu, 15 May 2025 15:00:34 -0700
Message-ID: <20250515220034.393303-2-joseph.kogut@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515220034.393303-1-joseph.kogut@gmail.com>
References: <20250515220034.393303-1-joseph.kogut@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add initial support for the Radxa CM5 and the accompanying IO board,
including ethernet, USB 2.0/3.0, PCIe 2.1 x1, HDMI output, UART2 console,
SD/eMMC, PMIC.

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
V1 -> V2:
  - Added copyright header and data sheet links
  - Removed non-existent property
  - Sorted alphabetically
  - Removed errant whitespace
  - Moved status to the end of each node
  - Removed pinctrl-names property from leds (indicated by CHECK_DTBS)
  - Removed delays from gmac with internal delay

 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3588s-radxa-cm5-io.dts     | 454 ++++++++++++++++++
 .../boot/dts/rockchip/rk3588s-radxa-cm5.dtsi  | 156 ++++++
 3 files changed, 611 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5-io.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5.dtsi

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 3e8771ef69ba..bc09420cacde 100644
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
index 000000000000..28d74e390a3c
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
+			try-power-role = "source";
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
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5.dtsi
new file mode 100644
index 000000000000..c966da4626b7
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5.dtsi
@@ -0,0 +1,156 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2025 Joseph Kogut <joseph.kogut@gmail.com>
+ */
+
+/*
+ * CM5 data sheet
+ * https://dl.radxa.com/cm5/v2210/radxa_cm5_v2210_schematic.pdf
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/soc/rockchip,vop2.h>
+#include <dt-bindings/usb/pd.h>
+
+/ {
+	compatible = "radxa,cm5", "rockchip,rk3588s";
+
+	aliases {
+		mmc0 = &sdmmc;
+		mmc1 = &sdhci;
+		mmc2 = &sdio;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led_sys: led-0 {
+			color = <LED_COLOR_ID_BLUE>;
+			default-state = "on";
+			function = LED_FUNCTION_HEARTBEAT;
+			gpios = <&gpio4 RK_PB4 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+		};
+	};
+};
+
+&cpu_b0 {
+	cpu-supply = <&vdd_cpu_big0_s0>;
+};
+
+&cpu_b1 {
+	cpu-supply = <&vdd_cpu_big0_s0>;
+};
+
+&cpu_b2 {
+	cpu-supply = <&vdd_cpu_big1_s0>;
+};
+
+&cpu_b3 {
+	cpu-supply = <&vdd_cpu_big1_s0>;
+};
+
+&cpu_l0 {
+	cpu-supply = <&vdd_cpu_lit_s0>;
+};
+
+&cpu_l1 {
+	cpu-supply = <&vdd_cpu_lit_s0>;
+};
+
+&cpu_l2 {
+	cpu-supply = <&vdd_cpu_lit_s0>;
+};
+
+&cpu_l3 {
+	cpu-supply = <&vdd_cpu_lit_s0>;
+};
+
+&gmac1 {
+	clock_in_out = "output";
+	phy-handle = <&rgmii_phy1>;
+	phy-mode = "rgmii-id";
+	phy-supply = <&vcc_3v3_s0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&gmac1_miim
+		     &gmac1_tx_bus2
+		     &gmac1_rx_bus2
+		     &gmac1_rgmii_clk
+		     &gmac1_rgmii_bus
+		     &gmac1_clkinout>;
+	status = "okay";
+};
+
+&gpu {
+	mali-supply = <&vdd_gpu_s0>;
+	status = "okay";
+};
+
+&hdmi0 {
+	status = "okay";
+};
+
+&i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c0m2_xfer>;
+	status = "okay";
+	
+	vdd_cpu_big0_s0: regulator@42 {
+		compatible = "rockchip,rk8602";
+		reg = <0x42>;
+		fcs,suspend-voltage-selector = <1>;
+		regulator-name = "vdd_cpu_big0_s0";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <550000>;
+		regulator-max-microvolt = <1050000>;
+		regulator-ramp-delay = <2300>;
+		vin-supply = <&vcc5v0_sys>;
+
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+
+	vdd_cpu_big1_s0: regulator@43 {
+		compatible = "rockchip,rk8602";
+		reg = <0x43>;
+		fcs,suspend-voltage-selector = <1>;
+		regulator-name = "vdd_cpu_big1_s0";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <550000>;
+		regulator-max-microvolt = <1050000>;
+		regulator-ramp-delay = <2300>;
+		vin-supply = <&vcc5v0_sys>;
+
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+};
+
+&mdio1 {
+	rgmii_phy1: phy@1 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0x1>;
+	};
+};
+
+&pd_gpu {
+	domain-supply = <&vdd_gpu_s0>;
+};
+
+&sdhci {
+	bus-width = <8>;
+	no-sdio;
+	no-sd;
+	non-removable;
+	max-frequency = <200000000>;
+	mmc-hs400-1_8v;
+	mmc-hs400-enhanced-strobe;
+	mmc-hs200-1_8v;
+	status = "okay";
+};
+
-- 
2.49.0

