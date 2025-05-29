Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761D721C176
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 08:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748507537; cv=none; b=f4OqI/DRW8ycP5vIDuZbbOiHJqIX1JNAYDEq2Sg5wq1hrRBeQa8Hgig2PO+KefBmYRpMYIkFLnzAGf5K5z1kUQUth3FWi2sN+iS7/AyRoVmmpqOPe62PJZ3xr3eAZSqXg2Hxfe4lbqWQpd1FDLUFHL7esssrxsLp62Mpd+sBKQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748507537; c=relaxed/simple;
	bh=FN0vODHV506AuaoFFdrL/yzRzQtnpZglcVSCkCKMPE0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=beXYhm1GadicDaTpeOpUzCZSqD36TjX82sBvnVRZTjGjdSWfOqBgypGnUs6aOmzDWxGw7lwscf+8/crALoSLqWLT1wVWPMGmVf1/t+a8eZ8faLeFcaPDiSmbyVANdkO1mZUVh8XxXHVy3P+Y554I8E8zJ12U3SPqZSQyTALerbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=aMgd13wp; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="aMgd13wp"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-604533a2f62so1121134a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 01:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1748507533; x=1749112333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZgN9AVJjp38qn//MPJ9bGqWJk/ibzEBx7kgTbrCvNV8=;
        b=aMgd13wp/CN1zCvHvtWGwsT5aCm41KRDhaC+WcOsjUrnIn5iJDyGaFfQhBbio2K9xW
         P2JH9oq9/5TLzBhju6ZqH9tsR0KzrZWah9SYb2nV4Ens6nbCAXbZrzY+r/0oYI4I07wE
         8btPkAfkgpmXX7B9jMyMzuGmvQ/wrt1TwweGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748507533; x=1749112333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZgN9AVJjp38qn//MPJ9bGqWJk/ibzEBx7kgTbrCvNV8=;
        b=G+oTWjqW2o23iFgppaPcnUSs1h14I0GPs+WwarIvnU+MwBT4khGqdE/iXQ8h4Zeqwq
         HhAmFGMZRfBJWAjbJBDH738nfUWMedSZswg22SJPfNSkuQQc7OZc2gfYAe+hbD9nbgwS
         xvPIIexjtk92XUMy8e4U3wWqYc+hDe8uMJcnHULqeKcqIbvsylxBGX5NnmdPY+nN7A6g
         36xqsfOwg4oE4yrwWLuArv8x4Lg0eM7Nk7nIcK3NYn5kJI7KY0bThRU3oMjCBvkpAKq+
         msXpLAjqv+r9kpWe0GpHOHeqNU/rcUeAS5zJ67Rb9bhgzSKLtH6nxlU5wuKKKg0j4gSE
         E7Rg==
X-Gm-Message-State: AOJu0YxILClNCX5KhEBCyC7V9WZ97UOTBHUMBIeJVUJTz+a5c0KatDwE
	clpTYoUhTHCvDsnRXIBC9dHXGNugRyfCC0AKu5s/rLSkdof5Tgweeo8/HAaXoW73adRPR0mFI2O
	IEsts
X-Gm-Gg: ASbGnctHKW/lGBemFYNolO+y37n5xkXRQ35tnw6yJpXu1FebhY6oh36Mfp8Hbd15qr+
	IbGgmOv9PBzLtR9rMdxXms2J16+rSlaIC7ol0mjgVnW4CjZhtZb3gCelSIK1Oim5Thw3uMgvRjv
	n+bwMY4CW4JCbShlwwOcPBoOWwtkSf6zZXngXcnRJJMbH8Z+NfD1yerKtYvlkTvEvRMhkENEioG
	1q290sB8sLzfM2CaYliIsXf2w+Bj2dxUQSJ/1MF2dDVeK5KP2Ay+eKHVW/zmohCREWatItJdaXQ
	SYVRGam7RKNHfGGoSw7QTKWHYbVm1p+LZKmhKbTY1hivdkJ3JUboccywo4/nOOHS50IMT43u5B6
	UKAoXNkhoeBcyJZVJI/6yk3ndaoY=
X-Google-Smtp-Source: AGHT+IHrwgHwBZEwqgmdfFcvMdKs/R/4FvKMtsdtQta3AkpUWAE/0fmR4c4NoqV2g+YZPRTfCoNmvg==
X-Received: by 2002:a17:907:3d42:b0:ad8:e477:970c with SMTP id a640c23a62f3a-ad8e486d957mr262287266b.23.1748507533480;
        Thu, 29 May 2025 01:32:13 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d82e87esm100609866b.63.2025.05.29.01.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 01:32:13 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 4/4] ARM: dts: mxs: support i.MX28 Amarula rmm board
Date: Thu, 29 May 2025 10:31:07 +0200
Message-ID: <20250529083201.2286915-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250529083201.2286915-1-dario.binacchi@amarulasolutions.com>
References: <20250529083201.2286915-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The board includes the following resources:
 - 256 Mbytes NAND Flash
 - 128 Mbytes DRAM DDR2
 - CAN
 - USB 2.0 high-speed/full-speed
 - Ethernet MAC

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v3:
- In imx28-amarula-rmm.dts:
  - Drop xceiver-supply property from can0 node.
  - Rearrange the order of specific nodes and properties
    alphabetically.

Changes in v2:
- In imx28-amarula-rmm.dts:
  - Replace '-' with '@' for the pinctrl sub-nodes.
  - Replace edt,edt-ft5x06 with edt,edt-ft5306.
  - Drop LCD reset hog pin.
  - Add correct #address-cells and #size-cells to gpmi node.
  - Replace edt-ft5x06@38 with touchscreen@38.
- Drop from commit messages all references to LCD display.
- Add patch [1/4] "dt-bindings: mfd: convert mxs-lradc bindings to
  json-schema".

 arch/arm/boot/dts/nxp/mxs/Makefile            |   1 +
 .../boot/dts/nxp/mxs/imx28-amarula-rmm.dts    | 303 ++++++++++++++++++
 2 files changed, 304 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts

diff --git a/arch/arm/boot/dts/nxp/mxs/Makefile b/arch/arm/boot/dts/nxp/mxs/Makefile
index 96dd31ea19ba..d72ba702b6fa 100644
--- a/arch/arm/boot/dts/nxp/mxs/Makefile
+++ b/arch/arm/boot/dts/nxp/mxs/Makefile
@@ -5,6 +5,7 @@ dtb-$(CONFIG_ARCH_MXS) += \
 	imx23-sansa.dtb \
 	imx23-stmp378x_devb.dtb \
 	imx23-xfi3.dtb \
+	imx28-amarula-rmm.dtb \
 	imx28-apf28.dtb \
 	imx28-apf28dev.dtb \
 	imx28-apx4devkit.dtb \
diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts b/arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts
new file mode 100644
index 000000000000..5824eb9e9557
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts
@@ -0,0 +1,303 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025 Amarula Solutions, Dario Binacchi <dario.binacchi@amarulasolutions.com>
+ */
+
+/dts-v1/;
+
+#include "imx28.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	compatible = "amarula,imx28-rmm", "fsl,imx28";
+	model = "Amarula i.MX28 rmm";
+
+	memory@40000000 {
+		reg = <0x40000000 0x08000000>;
+		device_type = "memory";
+	};
+
+	backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pwm 4 5000000 0>;
+		brightness-levels = <0 255>;
+		num-interpolated-steps = <255>;
+		default-brightness-level = <255>;
+		power-supply = <&reg_5v>;
+	};
+
+	beeper {
+		compatible = "pwm-beeper";
+		pwms = <&pwm 7 100000 0>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&leds_pins>;
+
+		led-0 {
+			label = "status";
+			gpios = <&gpio2 7 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		led-1 {
+			label = "x22_5";
+			gpios = <&gpio3 16 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		led-2 {
+			label = "x22_4";
+			gpios = <&gpio3 17 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+	};
+
+	reg_1v8: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	reg_3v3: regulator-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	reg_5v: regulator-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "5v";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
+	reg_fec_3v3: regulator-fec-3v3 {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&fec_3v3_enable_pin>;
+		regulator-name = "fec-3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpios = <&gpio3 27 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		startup-delay-us = <300000>;
+		vin-supply = <&reg_5v>;
+	};
+
+	reg_usb0_vbus: regulator-usb0-vbus {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb0_vbus_enable_pin>;
+		regulator-name = "usb0_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio2 5 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	reg_usb1_vbus: regulator-usb1-vbus {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb1_vbus_enable_pin>;
+		regulator-name = "usb1_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio2 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+};
+
+&auart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&auart0_2pins_a>;
+	status = "okay";
+};
+
+&auart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&auart1_pins_a>;
+	status = "okay";
+};
+
+&can0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&can0_pins_a>;
+	status = "okay";
+};
+
+&duart {
+	pinctrl-names = "default";
+	pinctrl-0 = <&duart_pins_b>;
+	status = "okay";
+};
+
+&duart_pins_b {
+	fsl,voltage = <MXS_VOLTAGE_LOW>;
+};
+
+&gpmi {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&gpmi_pins_a &gpmi_status_cfg>;
+	status = "okay";
+};
+
+&i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c0_pins_a>;
+	status = "okay";
+
+	touchscreen: touchscreen@38 {
+		compatible = "edt,edt-ft5306";
+		reg = <0x38>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&edt_ft5x06_pins &edt_ft5x06_wake_pin>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <19 IRQ_TYPE_EDGE_RISING>;
+		reset-gpios = <&gpio0 21 GPIO_ACTIVE_LOW>;
+		wake-gpios = <&gpio0 18 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&lradc {
+	status = "okay";
+};
+
+&mac0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mac0_pins_a>;
+	phy-mode = "rmii";
+	phy-supply = <&reg_fec_3v3>;
+	phy-handle = <&ethphy>;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy: ethernet-phy@0 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0>;
+			max-speed = <100>;
+			reset-gpios = <&gpio3 28 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <4000>;
+			reset-deassert-us = <4000>;
+		};
+	};
+};
+
+&pinctrl {
+	pinctrl-names = "default";
+	pinctrl-0 = <&hog_pins_a>;
+
+	edt_ft5x06_pins: edt-ft5x06@0 {
+		reg = <0>;
+		fsl,pinmux-ids = <
+			MX28_PAD_GPMI_RDY1__GPIO_0_21 /* Reset */
+			MX28_PAD_GPMI_CE3N__GPIO_0_19 /* Interrupt */
+		>;
+		fsl,drive-strength = <MXS_DRIVE_4mA>;
+		fsl,pull-up = <MXS_PULL_ENABLE>;
+		fsl,voltage = <MXS_VOLTAGE_HIGH>;
+	};
+
+	edt_ft5x06_wake_pin: edt-ft5x06-wake@0 {
+		reg = <0>;
+		fsl,pinmux-ids = <MX28_PAD_GPMI_CE2N__GPIO_0_18>;
+		fsl,drive-strength = <MXS_DRIVE_16mA>;
+		fsl,pull-up = <MXS_PULL_DISABLE>;
+		fsl,voltage = <MXS_VOLTAGE_HIGH>;
+	};
+
+	fec_3v3_enable_pin: fec-3v3-enable@0 {
+		reg = <0>;
+		fsl,pinmux-ids = <MX28_PAD_SPDIF__GPIO_3_27>;
+		fsl,drive-strength = <MXS_DRIVE_4mA>;
+		fsl,pull-up = <MXS_PULL_DISABLE>;
+		fsl,voltage = <MXS_VOLTAGE_HIGH>;
+	};
+
+	hog_pins_a: hog@0 {
+		reg = <0>;
+		fsl,pinmux-ids = <
+			MX28_PAD_SSP2_SS1__GPIO_2_20  /* External power */
+		>;
+		fsl,drive-strength = <MXS_DRIVE_4mA>;
+		fsl,pull-up = <MXS_PULL_DISABLE>;
+		fsl,voltage = <MXS_VOLTAGE_HIGH>;
+	};
+
+	leds_pins: leds@0 {
+		reg = <0>;
+		fsl,pinmux-ids = <
+			MX28_PAD_SSP0_DATA7__GPIO_2_7
+			MX28_PAD_PWM0__GPIO_3_16
+			MX28_PAD_PWM1__GPIO_3_17
+		>;
+		fsl,drive-strength = <MXS_DRIVE_4mA>;
+		fsl,pull-up = <MXS_PULL_DISABLE>;
+		fsl,voltage = <MXS_VOLTAGE_HIGH>;
+	};
+
+	usb0_vbus_enable_pin: usb0-vbus-enable@0 {
+		reg = <0>;
+		fsl,pinmux-ids = <MX28_PAD_SSP0_DATA5__GPIO_2_5>;
+		fsl,drive-strength = <MXS_DRIVE_4mA>;
+		fsl,pull-up = <MXS_PULL_DISABLE>;
+		fsl,voltage = <MXS_VOLTAGE_HIGH>;
+	};
+
+	usb1_vbus_enable_pin: usb1-vbus-enable@0 {
+		reg = <0>;
+		fsl,pinmux-ids = <MX28_PAD_SSP0_DATA6__GPIO_2_6>;
+		fsl,drive-strength = <MXS_DRIVE_4mA>;
+		fsl,pull-up = <MXS_PULL_DISABLE>;
+		fsl,voltage = <MXS_VOLTAGE_HIGH>;
+	};
+};
+
+&pwm {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pwm4_pins_a &pwm7_pins_a>;
+	status = "okay";
+};
+
+&ssp0 {
+	compatible = "fsl,imx28-mmc";
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc0_4bit_pins_a &mmc0_sck_cfg>;
+	broken-cd;
+	bus-width = <4>;
+	status = "okay";
+};
+
+&usb0 {
+	dr_mode = "host";
+	vbus-supply = <&reg_usb0_vbus>;
+	status = "okay";
+};
+
+&usb1 {
+	dr_mode = "host";
+	vbus-supply = <&reg_usb1_vbus>;
+	status = "okay";
+};
+
+&usbphy0 {
+	status = "okay";
+};
+
+&usbphy1 {
+	status = "okay";
+};
-- 
2.43.0

