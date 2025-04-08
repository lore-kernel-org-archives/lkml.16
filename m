Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F87204F9B;
	Tue,  8 Apr 2025 23:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744154326; cv=none; b=RdluPCqdpo0JL1HftCfORDA4iXWbj8P5MrNfdfRuklpKd9MeDCZ2ndcEPvf242/cLS7p6j1OizDUBHOnXMUDYOSo0iCGuYQ8yNT1wRLhMM/T59TsRhWpAMw/wrOgBj2F5sKW+5R/L1HkclvSfUSBbxSC7vwgXM3V6E0e5YcPlBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744154326; c=relaxed/simple;
	bh=dX39lqsXKzyHSmuLwDimKQG/bO2EMIxHg0N3gdL8gYs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YjLHHOmO1Kuw2HsAGW/LIj7sJH/KfkuIBe5jV+0nF6wx0HYZJ5q7T+TTUxy5nsVaLvVYGvNLHyq8tuE0WY6zOwpTb5z0H7xcvz60a1ZhlgByc3UNlvtSmGxS8Li4d3G4nXu/8ooadvCGwDYb9x6jyReutpDbXzETvtzO5NDg5lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HPXqRIF2; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HPXqRIF2"
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-86142446f3fso65283439f.2;
        Tue, 08 Apr 2025 16:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744154323; x=1744759123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3he1cNFX+tF1rEerCr+qRpTP/ZJe20EHw41Kf/s7zwA=;
        b=HPXqRIF2vba5n4PL4lRo+o4TjiuEA+03byGhqYAaZ7PNBPAOAuX68Ge/r0An9oQN9x
         BwcGj8wdfUkdeNkUEvyGbagYLZRSBjBa0LN1vu40CFldQtchaIC8dd8axeKP8xf2+MKa
         th5QiJxLycMiGyIhNLhp3riEyKzWkuknNXG5xOIZadfW41oWB7bmuiIf0tXuai78sqdA
         JTKy67ZlS2lw/N4bVYI9WYmZjsm888zNNaNGK+DCGGXTMhmBvDoRm2RDEgLIai1DCmWr
         jIdyDOozOK7E1CFWOfOK9+jaNK175Uh5d/J6IBVKkk/Ew3WVh87Sh8QmOv7/Fo7mfJUd
         iWuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744154323; x=1744759123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3he1cNFX+tF1rEerCr+qRpTP/ZJe20EHw41Kf/s7zwA=;
        b=n1ytnqeQm3hPuNIZNUVfC4l+3zU2rxD8gee1VaJuRtkAeCblVYtoiBXR/x8MOa9KgR
         419O+lTCu7v0W7ehRntIf8R+LQzsbw2KLaP9oy8wjljcs1XblKFy1o0gic9pD60UAUn7
         +G533UITzMew2XZbqAyYJMHi26FfBaFZgNKcSwinA6jpvA6+bAm93cCzpTsBt0SXjCrl
         AQxGG0TAF+hqImXqjBAV81t7RHFY+v2g3v7vTejIS6BSsUgjSkC8uPxUjDsku21KMSOX
         FBsAlzOszZR98Uvt8quIpFmXGl4WR5X60LmIw2FeieilsQ+ygMnIHFMPV/8CKdi2uBOy
         l2rg==
X-Forwarded-Encrypted: i=1; AJvYcCUQC5puKMop2AkZG/EaL2ggjhRX+zudjrSNDpQAeRanErKDbrjnfB6VywLUO1lRpdUzlcFab5JejBUY@vger.kernel.org, AJvYcCXBPN+1E6E3DRxNfW3zloA5R+2YzbB+RE2X7kAoaAHPWQIWUpmOO7+xI9tgWDbYDDM6NXRz1Sb6vdQYGEbr@vger.kernel.org
X-Gm-Message-State: AOJu0YyvForUd7tMdKk7/kmbXp2A1SZp+cQCDtaG255Vo9L4sgp0STBp
	dvv5b7noKXF43ghv0BC3c7YCn3/ry3RZ9zcsXsSSYj3w5J/MjX5G
X-Gm-Gg: ASbGncv6kOIXgP2jrOg2GCJoStrrK0F3XddM0xfryU4xCIcqe44YpFCIedcyGK/AGDZ
	P3s918mJTE/VaqyIbkNvBctzx4lqhl0B5hjviqMy5Z0yxY+JUPgQ9J53onJHO7UHcuZSrUvzC8I
	Vx226/IvJfT/KLyGAushzdIKnTcgzXzjCn+tsvrNLT4rJ9lv8jDFB5lSqt/Qhhs8qpxO6jiYgFp
	ydo8UMV/i6xj/YAePq22FzEz8K//Sq8Q+MEp68rSrHB4VMJ7uMw3T9PIGn/MUeWA6cGvr1D7mcj
	yGKdQkLSjgMOTFjxsFHlg6rjX06cFgnkYXhRrvs/fXt38pnawN2dcMsG8QOkltnxO+xoZeMCY2Z
	wH8wPOxoX3snBV00=
X-Google-Smtp-Source: AGHT+IHOnEUm49QzqTz8vJZ4+Ws94J0w/Imp6qR2hwe2CXCyj0Qm5aSKpUGiKZHaWv64uC5h3hWOqQ==
X-Received: by 2002:a05:6e02:2186:b0:3d6:cbed:3305 with SMTP id e9e14a558f8ab-3d776c964b2mr9177755ab.10.1744154323460;
        Tue, 08 Apr 2025 16:18:43 -0700 (PDT)
Received: from hestia.. (24-220-158-153-dynamic.midco.net. [24.220.158.153])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f4f44e2759sm724244173.128.2025.04.08.16.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 16:18:42 -0700 (PDT)
From: Robert Nelson <robertcnelson@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Robert Nelson <robertcnelson@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Nishanth Menon <nm@ti.com>,
	Andrew Davis <afd@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Judith Mendez <jm@ti.com>,
	Andrei Aldea <a-aldea@ti.com>,
	Dhruva Gole <d-gole@ti.com>,
	Jason Kridner <jkridner@beagleboard.org>,
	Deepak Khatri <lorforlinux@beagleboard.org>,
	Ayush Singh <ayush@beagleboard.org>
Subject: [PATCH v2 2/2] arm64: dts: ti: Add k3-am62-pocketbeagle2
Date: Tue,  8 Apr 2025 18:18:23 -0500
Message-ID: <20250408231823.826163-2-robertcnelson@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250408231823.826163-1-robertcnelson@gmail.com>
References: <20250408231823.826163-1-robertcnelson@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

BeagleBoard.org PocketBeagle 2 is an upgraded version of the popular
PocketBeagle.  It is based on Texas Instruments AM6232 or AM6254 SoC.
Its dual or quad A53 cores can provide higher performance than classic
PocketBeagle. The new design comes with pre-soldered headers, a 3-pin
JST-SH 1.00mm UART debug port, a USB-C port, Texas Instruments
MSPM0L1105 Cortex-M0+ MCU for ADC, 512MB RAM, and a LiPo Battery charger.

https://www.beagleboard.org/boards/pocketbeagle-2
https://openbeagle.org/pocketbeagle/pocketbeagle-2

Signed-off-by: Robert Nelson <robertcnelson@gmail.com>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Vignesh Raghavendra <vigneshr@ti.com>
CC: Nishanth Menon <nm@ti.com>
CC: Andrew Davis <afd@ti.com>
CC: Roger Quadros <rogerq@kernel.org>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>
CC: Judith Mendez <jm@ti.com>
CC: Andrei Aldea <a-aldea@ti.com>
CC: Dhruva Gole <d-gole@ti.com>
CC: Jason Kridner <jkridner@beagleboard.org>
CC: Deepak Khatri <lorforlinux@beagleboard.org>
CC: Ayush Singh <ayush@beagleboard.org>
---
Changes since v1:
 - fix '_' in main-i2c2-default-pins
 - aliases i2c match original pocketbeagle
 - add mcu_m4fss with reseved memory and mailbox
 - drop unused main_gpio0_pins_default pinmux
 - drop unused main_gpio1_pins_default pinmux
 - drop unused main_spi2_pins_gpio pinmux
 - Reserve 128MiB of global CMA
---
 arch/arm64/boot/dts/ti/Makefile               |   1 +
 .../boot/dts/ti/k3-am62-pocketbeagle2.dts     | 528 ++++++++++++++++++
 2 files changed, 529 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 03d4cecfc001..4f8fcb69a2c1 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -27,6 +27,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62x-phyboard-lyra-gpio-fan.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am62-lp-sk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62-lp-sk-nand.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am62-pocketbeagle2.dtb
 
 # Boards with AM62Ax SoC
 dtb-$(CONFIG_ARCH_K3) += k3-am62a7-sk.dtb
diff --git a/arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts b/arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts
new file mode 100644
index 000000000000..65000ed8196f
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts
@@ -0,0 +1,528 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * https://www.beagleboard.org/boards/pocketbeagle-2
+ *
+ * Copyright (C) 2025 Texas Instruments Incorporated - https://www.ti.com/
+ * Copyright (C) 2025 Robert Nelson, BeagleBoard.org Foundation
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include "k3-am625.dtsi"
+
+/ {
+	compatible = "beagle,am62-pocketbeagle2", "ti,am625";
+	model = "BeagleBoard.org PocketBeagle2";
+
+	aliases {
+		serial0 = &wkup_uart0;
+		serial1 = &main_uart1;
+		serial2 = &main_uart6;
+		serial3 = &main_uart3;
+		serial4 = &main_uart4;
+		serial5 = &main_uart5;
+		serial6 = &main_uart2;
+		serial7 = &main_uart0;
+		mmc0 = &sdhci0;
+		mmc1 = &sdhci1;
+		usb0 = &usb0;
+		usb1 = &usb1;
+		i2c1 = &main_i2c1;
+		i2c2 = &main_i2c2;
+		i2c3 = &wkup_i2c0;
+	};
+
+	chosen {
+		stdout-path = &main_uart6;
+	};
+
+	memory@80000000 {
+		/* 512MB RAM */
+		reg = <0x00000000 0x80000000 0x00000000 0x20000000>;
+		device_type = "memory";
+		bootph-pre-ram;
+	};
+
+	reserved_memory: reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		/* global cma region */
+		linux,cma {
+			compatible = "shared-dma-pool";
+			reusable;
+			size = <0x00 0x8000000>;
+			linux,cma-default;
+		};
+
+		mcu_m4fss_dma_memory_region: m4f-dma-memory@9cb00000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9cb00000 0x00 0x100000>;
+			no-map;
+		};
+
+		mcu_m4fss_memory_region: m4f-memory@9cc00000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9cc00000 0x00 0xe00000>;
+			no-map;
+		};
+
+		secure_tfa_ddr: tfa@9e780000 {
+			reg = <0x00 0x9e780000 0x00 0x80000>;
+			alignment = <0x1000>;
+			no-map;
+		};
+
+		secure_ddr: optee@9e800000 {
+			reg = <0x00 0x9e800000 0x00 0x01800000>;
+			alignment = <0x1000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9db00000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9db00000 0x00 0xc00000>;
+			no-map;
+		};
+	};
+
+	vsys_5v0: regulator-1 {
+		compatible = "regulator-fixed";
+		regulator-name = "vsys_5v0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		regulator-boot-on;
+		bootph-all;
+	};
+
+	vdd_3v3: regulator-2 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vsys_5v0>;
+		regulator-always-on;
+		regulator-boot-on;
+		bootph-all;
+	};
+
+	vdd_mmc1: regulator-3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_mmc1";
+		pinctrl-names = "default";
+		pinctrl-0 = <&vdd_3v3_sd_pins_default>;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		enable-active-high;
+		regulator-always-on;
+		vin-supply = <&vdd_3v3>;
+		gpio = <&main_gpio0 0 GPIO_ACTIVE_HIGH>;
+		bootph-all;
+	};
+
+	vdd_sd_dv: regulator-4 {
+		compatible = "regulator-gpio";
+		regulator-name = "sd_hs200_switch";
+		pinctrl-names = "default";
+		pinctrl-0 = <&vdd_sd_dv_pins_default>;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		vin-supply = <&vdd_3v3>;
+		gpios = <&main_gpio1 49 GPIO_ACTIVE_HIGH>;
+		states = <1800000 0x0>,
+			 <3300000 0x1>;
+		bootph-all;
+	};
+
+	adc_vref: regulator-5 {
+		compatible = "regulator-fixed";
+		regulator-name = "default";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+	};
+
+	leds {
+		bootph-all;
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&led_pins_default>;
+
+		led-1 {
+			bootph-all;
+			gpios = <&main_gpio0 6 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_GREEN>;
+			linux,default-trigger = "heartbeat";
+			function = LED_FUNCTION_HEARTBEAT;
+			default-state = "on";
+		};
+
+		led-2 {
+			bootph-all;
+			gpios = <&main_gpio0 5 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_DISK_ACTIVITY;
+			linux,default-trigger = "mmc1";
+		};
+
+		led-3 {
+			bootph-all;
+			gpios = <&main_gpio0 4 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_GREEN>;
+		};
+
+		led-4 {
+			bootph-all;
+			gpios = <&main_gpio0 3 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_INDICATOR;
+			default-state = "off";
+		};
+	};
+};
+
+&main_pmx0 {
+	led_pins_default: led-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x000c, PIN_OUTPUT, 7) /* (E25) OSPI0_D0.GPIO0_3 */
+			AM62X_IOPAD(0x0010, PIN_OUTPUT, 7) /* (G24) OSPI0_D1.GPIO0_4 */
+			AM62X_IOPAD(0x0014, PIN_OUTPUT, 7) /* (F25) OSPI0_D2.GPIO0_5 */
+			AM62X_IOPAD(0x0018, PIN_OUTPUT, 7) /* (F24) OSPI0_D3.GPIO0_6 */
+		>;
+		bootph-all;
+	};
+
+	main_i2c0_pins_default: main-i2c0-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x01e0, PIN_INPUT_PULLUP, 0) /* (B16) I2C0_SCL */
+			AM62X_IOPAD(0x01e4, PIN_INPUT_PULLUP, 0) /* (A16) I2C0_SDA */
+		>;
+		bootph-all;
+	};
+
+	main_i2c2_pins_default: main-i2c2-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x00b0, PIN_INPUT_PULLUP, 1) /* (K22) GPMC0_CSn2.I2C2_SCL */
+			AM62X_IOPAD(0x00b4, PIN_INPUT_PULLUP, 1) /* (K24) GPMC0_CSn3.I2C2_SDA */
+		>;
+		bootph-all;
+	};
+
+	main_uart0_pins_default: main-uart0-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x1c8, PIN_INPUT, 0) /* (D14/A13) UART0_RXD */
+			AM62X_IOPAD(0x1cc, PIN_OUTPUT, 0) /* (E14/E11) UART0_TXD */
+		>;
+		bootph-all;
+	};
+
+	main_uart1_pins_default: main-uart1-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x194, PIN_INPUT, 2) /* (B19/B18) MCASP0_AXR3.UART1_CTSn */
+			AM62X_IOPAD(0x198, PIN_OUTPUT, 2) /* (A19/B17) MCASP0_AXR2.UART1_RTSn */
+			AM62X_IOPAD(0x1ac, PIN_INPUT, 2) /* (E19/D15) MCASP0_AFSR.UART1_RXD */
+			AM62X_IOPAD(0x1b0, PIN_OUTPUT, 2) /* (A20/D16) MCASP0_ACLKR.UART1_TXD */
+		>;
+		bootph-all;
+	};
+
+	main_uart6_pins_default: main-uart6-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x001c, PIN_INPUT, 3) /* (J23) OSPI0_D4.UART6_RXD */
+			AM62X_IOPAD(0x0020, PIN_OUTPUT, 3) /* (J25) OSPI0_D5.UART6_TXD */
+		>;
+	};
+
+	main_mmc1_pins_default: main-mmc1-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x23c, PIN_INPUT, 0) /* (A21/C18) MMC1_CMD */
+			AM62X_IOPAD(0x234, PIN_INPUT, 0) /* (B22/A20) MMC1_CLK */
+			AM62X_IOPAD(0x230, PIN_INPUT, 0) /* (A22/A19) MMC1_DAT0 */
+			AM62X_IOPAD(0x22c, PIN_INPUT, 0) /* (B21/B19) MMC1_DAT1 */
+			AM62X_IOPAD(0x228, PIN_INPUT, 0) /* (C21/B20) MMC1_DAT2 */
+			AM62X_IOPAD(0x224, PIN_INPUT, 0) /* (D22/C19) MMC1_DAT3 */
+			AM62X_IOPAD(0x240, PIN_INPUT, 7) /* (D17/C15) MMC1_SDCD.GPIO1_48 */
+		>;
+		bootph-all;
+	};
+
+	vdd_sd_dv_pins_default: vdd-sd-dv-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x0244, PIN_OUTPUT, 7) /* (P25) GPMC0_CLK.GPIO1_49 */
+		>;
+		bootph-all;
+	};
+
+	pmic_irq_pins_default: pmic-irq-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x01f4, PIN_INPUT_PULLUP, 0) /* (D16) EXTINTn */
+		>;
+		bootph-all;
+	};
+
+	vdd_3v3_sd_pins_default: vdd-3v3-sd-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x0000, PIN_OUTPUT, 7) /* (H24) OSPI0_CLK.GPIO0_0 */
+		>;
+		bootph-all;
+	};
+
+	usb1_pins_default: usb1-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x0258, PIN_INPUT, 0) /* (F18) USB1_DRVVBUS */
+		>;
+		bootph-all;
+	};
+
+	epwm2_pins_default: epwm2-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x01e8, PIN_OUTPUT, 8) /* (B17) I2C1_SCL.EHRPWM2_A */
+		>;
+	};
+};
+
+&cpsw3g {
+	status = "disabled";
+};
+
+&cpsw_port1 {
+	status = "disabled";
+};
+
+&cpsw_port2 {
+	status = "disabled";
+};
+
+&epwm2 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&epwm2_pins_default>;
+};
+
+&mailbox0_cluster0 {
+	mbox_m4_0: mbox-m4-0 {
+		ti,mbox-rx = <0 0 0>;
+		ti,mbox-tx = <1 0 0>;
+	};
+};
+
+&main_uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_uart0_pins_default>;
+	bootph-all;
+	status = "okay";
+};
+
+&main_uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_uart1_pins_default>;
+	bootph-pre-ram;
+	status = "reserved";
+};
+
+&main_uart6 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_uart6_pins_default>;
+	bootph-all;
+	status = "okay";
+};
+
+&main_i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_i2c0_pins_default>;
+	clock-frequency = <400000>;
+	bootph-all;
+	status = "okay";
+
+	ad7291: adc@20 {
+		compatible = "adi,ad7291";
+		reg = <0x20>;
+		vref-supply = <&adc_vref>;
+	};
+
+	eeprom: eeprom@50 {
+		compatible = "atmel,24c32";
+		reg = <0x50>;
+	};
+};
+
+&main_i2c2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_i2c2_pins_default>;
+	clock-frequency = <400000>;
+	bootph-all;
+	status = "okay";
+};
+
+&mcu_m4fss {
+	mboxes = <&mailbox0_cluster0 &mbox_m4_0>;
+	memory-region = <&mcu_m4fss_dma_memory_region>,
+			<&mcu_m4fss_memory_region>;
+	status = "okay";
+};
+
+&mcu_pmx0 {
+	wkup_uart0_pins_default: wkup-uart0-default-pins {
+		pinctrl-single,pins = <
+			AM62X_MCU_IOPAD(0x02c, PIN_INPUT, 0)	/* (C6/A7) WKUP_UART0_CTSn */
+			AM62X_MCU_IOPAD(0x030, PIN_OUTPUT, 0)	/* (A4/B4) WKUP_UART0_RTSn */
+			AM62X_MCU_IOPAD(0x024, PIN_INPUT, 0)	/* (B4/B5) WKUP_UART0_RXD */
+			AM62X_MCU_IOPAD(0x028, PIN_OUTPUT, 0)	/* (C5/C6) WKUP_UART0_TXD */
+		>;
+		bootph-all;
+	};
+
+	wkup_i2c0_pins_default: wkup-i2c0-default-pins {
+		pinctrl-single,pins = <
+			AM62X_MCU_IOPAD(0x004c, PIN_INPUT_PULLUP, 0)	/* (B9) WKUP_I2C0_SCL */
+			AM62X_MCU_IOPAD(0x0050, PIN_INPUT_PULLUP, 0)	/* (A9) WKUP_I2C0_SDA */
+		>;
+		bootph-all;
+	};
+};
+
+&sdhci1 {
+	/* SD/MMC */
+	vmmc-supply = <&vdd_mmc1>;
+	vqmmc-supply = <&vdd_sd_dv>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_mmc1_pins_default>;
+	disable-wp;
+	cd-gpios = <&main_gpio1 48 GPIO_ACTIVE_LOW>;
+	cd-debounce-delay-ms = <100>;
+	bootph-all;
+	ti,fails-without-test-cd;
+	status = "okay";
+};
+
+&usbss0 {
+	bootph-all;
+	ti,vbus-divider;
+	status = "okay";
+};
+
+&usb0 {
+	bootph-all;
+	dr_mode = "peripheral";
+};
+
+&usbss1 {
+	ti,vbus-divider;
+	status = "okay";
+};
+
+&usb1 {
+	dr_mode = "host";
+	pinctrl-names = "default";
+	pinctrl-0 = <&usb1_pins_default>;
+};
+
+&wkup_uart0 {
+	/* WKUP UART0 is used by Device Manager firmware */
+	pinctrl-names = "default";
+	pinctrl-0 = <&wkup_uart0_pins_default>;
+	bootph-all;
+	status = "reserved";
+};
+
+&wkup_i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&wkup_i2c0_pins_default>;
+	clock-frequency = <100000>;
+	bootph-all;
+	status = "okay";
+
+	tps65219: pmic@30 {
+		compatible = "ti,tps65219";
+		reg = <0x30>;
+		buck1-supply = <&vsys_5v0>;
+		buck2-supply = <&vsys_5v0>;
+		buck3-supply = <&vsys_5v0>;
+		ldo1-supply = <&vdd_3v3>;
+		ldo2-supply = <&buck2_reg>;
+		ldo3-supply = <&vdd_3v3>;
+		ldo4-supply = <&vdd_3v3>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&pmic_irq_pins_default>;
+		interrupt-parent = <&gic500>;
+		interrupts = <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-controller;
+		#interrupt-cells = <1>;
+
+		bootph-all;
+		system-power-controller;
+		ti,power-button;
+
+		regulators {
+			buck1_reg: buck1 {
+				regulator-name = "VDD_CORE";
+				regulator-min-microvolt = <850000>;
+				regulator-max-microvolt = <850000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			buck2_reg: buck2 {
+				regulator-name = "VDD_1V8";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			buck3_reg: buck3 {
+				regulator-name = "VDD_1V2";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo1_reg: ldo1 {
+				/*
+				 * Regulator is left as is unused, vdd_sd
+				 * is controlled via GPIO with bypass config
+				 * as per the NVM configuration
+				 */
+				regulator-name = "VDD_SD_3V3";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-allow-bypass;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo2_reg: ldo2 {
+				regulator-name = "VDDA_0V85";
+				regulator-min-microvolt = <850000>;
+				regulator-max-microvolt = <850000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo3_reg: ldo3 {
+				regulator-name = "VDDA_1V8";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo4_reg: ldo4 {
+				regulator-name = "VDD_2V5";
+				regulator-min-microvolt = <2500000>;
+				regulator-max-microvolt = <2500000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+		};
+	};
+};
-- 
2.47.2

