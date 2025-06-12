Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFD923771C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 09:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749719324; cv=none; b=CjxrdKEhXqZR4slbnmAREGhuYBULTTXTWROSkOCQeOTQlZWHeyLRcGM96SRNSi3Cmf6CZAEXw7iGPHnJeRS5PUWeelbPpimdedA4uytohJA6t+4rnGNnenHMkW9bku5G1K6RKgyMOCeFrFIi3kL/iKp8lpK/uyx2n8de2rVXfdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749719324; c=relaxed/simple;
	bh=LlJGcEz9mTLbDxR3Qqs5f/RJJVnu0uru4pS0PLwKA8k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B3sbBtbg+CHFMOuaQ7zRezTvjaPD5K82fiaMql6awUnr17Hbn35oKLBtNN1WyM8iZkNrXntogP4ED4UbqfN3We9lt71dHMX1KQja7i758DD01wm3qJxrBTO1tkAC87NGVLNKCr75JNE6WR3jUqR21IIxDKZ6MCfaYdQ+KVi3+ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=VDRpn9KG; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="VDRpn9KG"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6084dfb4cd5so3189033a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 02:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749719321; x=1750324121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0e2lyscbGTEpgjA+Tcmkq75W9+66FuZZqCaAVTn3nUE=;
        b=VDRpn9KGOjMovm9FupBYBzwpUFa17kWlj1Z3zgq4aa2y7sRk0RK87JOeoh4N+0hf3O
         g5erA23C977D7oy6o2oPsY4Gs4To/zi/9H3h2d9aCKKccR1zcDzOVGnNV7pdRLTBXKVu
         DsJ+wtTiWzNDJk9FACDO4yIKIQKfrPEdJGyMs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749719321; x=1750324121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0e2lyscbGTEpgjA+Tcmkq75W9+66FuZZqCaAVTn3nUE=;
        b=G3/MCgDMmYbS3YUBKkCsyMC45JNdGy0KhMUWD2aU9SETWlYzSReEhYyUUWRUujLTBY
         rDxuNviqRlzWIXAdyMvVMXADiZHxKsDRyq0N7+ILnMN1vSf2LFxFbzhCD75+7cR+tIDX
         LBRy2U4qGtJheGV65n5u3S0MoWcRaeAviJ1iQfHkiyncYAUQLNaGbxQnV5i7CMr9MP/c
         p7/7iWsylBa8tH1VTGagCMftx414lQmu6Ff0nRipiTFJifVtYR/ED4cmu3pojma1YNAR
         I2KPlrxmcJajeXtPg2veYkIVuXlTT4l8DqSGc4wM3EckW+6KbhcJM6sot1lVF3i81sj0
         FFhg==
X-Gm-Message-State: AOJu0YzmGa6WXi1y9zhMr2wQdHYQGLml3CAnEl10lm0/lIF8zGJmJ6w3
	tOaObmV2IgE1azNMBlmLH9kzq7VCxQsHSa9B4aOj3xYTUt9fnddjhd2dIS7CmyfORS88ss1JMqs
	rQN2a
X-Gm-Gg: ASbGncvY9gEi9r1J9Ocuphg/j++3qozpBu3BO9J03oLD58reDyCuUiW8zDvuCaZlu3I
	PfZTCfKpiKwiVLwJ6+yk0j0hADP8uZXdht0vwiePNSsGj6MbrrXXrRdehuWfngq9oB83hHtuAvr
	Bg5IPaYtWNcMKxJxNZdvk6saVo4K0AeEw4SGgYDUN8d0rXJKUGbFLxmF7IQuDo8lFGTd8Hv3rTa
	1n5eiJYlqkOkkGVRKb9TtwEgvTXOI/sP9/77LDgRcyufSIhlxohMNMdI94XpkxTvngerNlK3i7t
	iAg2x8EbkTjyQxdwd7ThU5sCKOqjHX8iYDOneCFr4y+/6rn3Mc+aR8IA4pwKZeEwC59vomcsLZt
	foELvUjPh4quKGdKWUcoiq2k6Eg==
X-Google-Smtp-Source: AGHT+IGD0uwuwW/CU0Mqju/lT59H/tBc/6GgQq2Oak3Rd1d0+MeMDo7RKy+/oH3hKEDgeIrjUO+llg==
X-Received: by 2002:a17:907:6d1a:b0:ad2:2fdb:b0ab with SMTP id a640c23a62f3a-adea56d1e61mr253704666b.29.1749719321062;
        Thu, 12 Jun 2025 02:08:41 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.38])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adead4cf274sm99933366b.31.2025.06.12.02.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 02:08:40 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Matteo Lisi <matteo.lisi@engicam.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Frank Li <Frank.Li@nxp.com>,
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
Subject: [PATCH v4 09/10] ARM: dts: imx6ul: support Engicam MicroGEA GTW board
Date: Thu, 12 Jun 2025 11:07:54 +0200
Message-ID: <20250612090823.2519183-10-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250612090823.2519183-1-dario.binacchi@amarulasolutions.com>
References: <20250612090823.2519183-1-dario.binacchi@amarulasolutions.com>
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>

---

Changes in v4:
- Add Reviewed-by tag of Frank Li

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

