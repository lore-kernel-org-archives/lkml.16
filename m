Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B8A28D8EC
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 10:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749549723; cv=none; b=JrrEAWTOvdKcNQU64Y/AvCqA40spw2vRJeAbtKv99iv4C6N0Zc1x56TFLP2Re+ifRKwqcfzawfGb9KUe7xpF8sqFvihiyH5CWNufSRLFHIIZXxohbXPO/0ZzQ+hZH+DvKaYCknugfArN3NtfrnTXLKGSqEJd/VjY0SGCeJPT2yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749549723; c=relaxed/simple;
	bh=sUY8Qm2rT225RsjUKHgiJWexr6mDGTPhcZ8PJQwOxr8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IoV6BbLe3zDm0627aebo+9u+Qzy+PX4jtUpkQq3x1XchH6ez5cO6YQX09nomiZU3C+0xSMdtj9fuui88ugThG9HZtaagJAAYgAfF5dIV2EeUnLSS5kwtKNfcW5nwVBT7Q60g6hkE0h6Jz9inytWUHO3Z2yg9mQ23V4zMZTwEFH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=XvS1PXEL; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="XvS1PXEL"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-607c5715ef2so4132134a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 03:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749549720; x=1750154520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KzzLaojZq6S39goZRBGJmPMmLZK8oRVTymDDUaNmjK8=;
        b=XvS1PXELdevvRvgQ0BR6TEOkKlf78dIQ3wIm6DlShYUBTNpRy486lD2EQs/GadY4jo
         yViqdi/lJrymduJoWXgrl5yqAU5PkNELarht9aaenffLKj5kTYM01C9A0DBP1VvEVjQd
         wfQeKVx6EwZx17UD9oK7LdVxFkyne4v7zW7O0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749549720; x=1750154520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KzzLaojZq6S39goZRBGJmPMmLZK8oRVTymDDUaNmjK8=;
        b=D5JO7cgBt+EepfBhqa4iR0gbrNiTUQ7cBwfOAUL8kjOB0jS1GV4+IsO/kAkzjgCvp2
         4rSb653VMGgpagtqg52KXrPdIrpfJ5xcug8rVjcmNhiGY16m3yk/84t4+rmSnUiQycx4
         lZS8lloVogVLDP+mkHsFxoqfPCcfNU3E6vFc4Iqg8Km1cHqni7WexzFM9cVqQqIXKflK
         4LxnxeIhc0u7g8vw6xYeHzWaPOAepR6qWKo03E1U4zuKAxPstR578LZACzVyITulFFML
         yltNNs6Ko682vuyfJUxI+GfuactRvOwwabincx2p7taQY7BWQ/8t2+i7AvtJuHGLjFxR
         ByLQ==
X-Gm-Message-State: AOJu0Yw1fLs28iSmrVMJSzmLgM4OgJzWiV4ugtx4SVZ1C+XBZoFwbLmD
	PqdvAN1LxM8592s1OxAMzlCZPSo/2fv1iw1CUO7lQCtKFnFaAbEOLBRXeVBijG12zbPQvSrqOzx
	xMpwM
X-Gm-Gg: ASbGncs5OEjQE28X27TEwS1wlnzezfUTtdYJpLa5XqxsM2cUi4C8pJGKOXtWHBz2nZw
	J5jK8A+7UkCKMYtNVgqxZSyiKEAFSPW9sb6g5SGMapMIMHjAFnmN2E7IiXFzf0Up9LJKHQFH9eW
	d2rpiXIhQlateV6sGlhpnhOGbLqakUjsSES3pVDwNewhdAZ8a4YKo+dakdCxlefUbVG3Ll7HxtR
	Do9ur7Ju9ls6BB2DUtti4FG8YGrkOMYQWFHNHILTtkCoDqjwV5WqYaTD5ukriwDEqGOgPr4o/M2
	UDu1iumJNV9NWKqrTe8KLOLeYA4RHdSjuTio/Jh09oRiXYKsnsnasGz+eSO4nY2FNQyIpJVfTPD
	yZulxdJV5y2qZiXeN7SgqH1ycCIE=
X-Google-Smtp-Source: AGHT+IH2dLOiWE95kMS36GEMfR3+nsxWqc34N4l1VIXOOEfkgDPGuvDfAP3EITz6N3UYOwZQN8jeag==
X-Received: by 2002:a05:6402:350e:b0:5e6:17e6:9510 with SMTP id 4fb4d7f45d1cf-6077341892cmr13964073a12.6.1749549720073;
        Tue, 10 Jun 2025 03:02:00 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.179])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6077837ed0bsm5953438a12.36.2025.06.10.03.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 03:01:59 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Matteo Lisi <matteo.lisi@engicam.com>,
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
Subject: [PATCH v3 09/10] ARM: dts: imx6ul: support Engicam MicroGEA GTW board
Date: Tue, 10 Jun 2025 12:00:22 +0200
Message-ID: <20250610100139.2476555-10-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610100139.2476555-1-dario.binacchi@amarulasolutions.com>
References: <20250610100139.2476555-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support Engicam MicroGEA GTW board with:

- 256 Mbytes NAND Flash
- 512 Mbytes DRAM DDR2
- Buttons
- LEDs
- Micro SD card connector
- USB 2.0 high-speed/full-speed
- Ethernet MAC

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v3:
- Drop an extra blank line from the iomuxc node.

Changes in v2:
- Drop an extra blank line
- Move iomuxc and iomuxc_snvs nodes to the end of the DTS file.

 arch/arm/boot/dts/nxp/imx/Makefile            |   1 +
 .../nxp/imx/imx6ull-engicam-microgea-gtw.dts  | 162 ++++++++++++++++++
 2 files changed, 163 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-gtw.dts

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 32dfd69b8d8b..de4142e8f3ce 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -357,6 +357,7 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
 	imx6ull-dhcom-picoitx.dtb \
 	imx6ull-dhcor-maveo-box.dtb \
 	imx6ull-engicam-microgea-bmm.dtb \
+	imx6ull-engicam-microgea-gtw.dtb \
 	imx6ull-engicam-microgea-rmm.dtb \
 	imx6ull-jozacp.dtb \
 	imx6ull-kontron-bl.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-gtw.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-gtw.dts
new file mode 100644
index 000000000000..d500f8839102
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-gtw.dts
@@ -0,0 +1,162 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025 Amarula Solutions, Dario Binacchi <dario.binacchi@amarulasolutions.com>
+ * Copyright (C) 2025 Engicam srl
+ */
+
+/dts-v1/;
+
+#include "imx6ull-engicam-microgea.dtsi"
+
+/ {
+	compatible = "engicam,microgea-imx6ull-gtw",
+		     "engicam,microgea-imx6ull", "fsl,imx6ull";
+	model = "Engicam MicroGEA i.MX6ULL GTW Board";
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
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_keys>;
+
+		user-button {
+			label = "User button";
+			gpios = <&gpio1 13 GPIO_ACTIVE_LOW>;
+			linux,code = <BTN_MISC>;
+			wakeup-source;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_leds>, <&pinctrl_pwrled>;
+
+		led-0 {
+			gpios = <&gpio5 7 GPIO_ACTIVE_HIGH>;
+			default-state = "on";
+		};
+
+		led-1 {
+			gpios = <&gpio1 14 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-2 {
+			gpios = <&gpio1 15 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-3 {
+			gpios = <&gpio1 12 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	usb_hub: usb-hub {
+		compatible = "smsc,usb3503a";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_usb_hub>;
+		reset-gpios = <&gpio5 6 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart1>;
+	status = "okay";
+};
+
+&uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart2>;
+	status = "okay";
+};
+
+&usbotg1 {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&usbotg2 {
+	dr_mode = "host";
+	disable-over-current;
+	status = "okay";
+};
+
+/* MicroSD */
+&usdhc1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usdhc1>;
+	vmmc-supply = <&reg_3v3>;
+	bus-width = <4>;
+	non-removable;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_gpio_keys: gpio_keysgrp {
+		fsl,pins = <
+			MX6UL_PAD_JTAG_TDI__GPIO1_IO13		0x0b0b0
+		>;
+	};
+
+	pinctrl_leds: ledsgrp {
+		fsl,pins = <
+			MX6UL_PAD_JTAG_TCK__GPIO1_IO14		0x130b0
+			MX6UL_PAD_JTAG_TRST_B__GPIO1_IO15	0x130b0
+			MX6UL_PAD_JTAG_TDO__GPIO1_IO12		0x130b0
+		>;
+	};
+
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX6UL_PAD_UART1_TX_DATA__UART1_DCE_TX	0x1b0b1
+			MX6UL_PAD_UART1_RX_DATA__UART1_DCE_RX	0x1b0b1
+		>;
+	};
+
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			MX6UL_PAD_UART2_TX_DATA__UART2_DCE_TX	0x1b0b1
+			MX6UL_PAD_UART2_RX_DATA__UART2_DCE_RX	0x1b0b1
+			MX6UL_PAD_UART2_RTS_B__UART2_DCE_RTS	0x1b0b1
+			MX6UL_PAD_UART2_CTS_B__UART2_DCE_CTS	0x1b0b1
+		>;
+	};
+
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <
+			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x17059
+			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x10059
+			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x17059
+			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x17059
+			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x17059
+			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x17059
+		>;
+	};
+};
+
+&iomuxc_snvs {
+	pinctrl_pwrled: ledsgrp {
+		fsl,pins = <
+			MX6ULL_PAD_SNVS_TAMPER7__GPIO5_IO07	0x130b0
+		>;
+	};
+
+	pinctrl_usb_hub: usb_hubgrp {
+		fsl,pins = <
+			MX6ULL_PAD_SNVS_TAMPER6__GPIO5_IO06	0x17059
+		>;
+	};
+};
-- 
2.43.0

