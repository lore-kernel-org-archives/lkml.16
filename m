Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01652505BB
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 07:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745739863; cv=none; b=NY+khIrB82LPp1T/rdql8Mxy6G9zk0IICWzpygzOQaRkJAxeWVHgTAreCsA5CyXHpqBVw7wJWv8CKho2HdjWbyJMC7qYUd1t06ofpxA9GO6SV4hH0E0Ew3IS/Pch6MIV0Vo4PmAI7HaRn/b+aA3n8hmxePYOwkWRjr9rGIigmoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745739863; c=relaxed/simple;
	bh=phnwd0O60U4lr0EG7WdQognU1cNvwoFrIb091/AmUGI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LxCMLWpJ/Hr6owd2ylhfcvbw18cyaZvVRlZT4XJAmyaHCWNuMbP4eMYr7E3Edi/zBGjGqXhf4x0Puj2VJRjDqN6YQdJwnCdr7pun7OgyktDXpXPkcanJYTmbfjUtMyf0dm5ss5HITEFM+HNBY6mObvHbKGQecE6Y/sds0dwcQFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=ko9/MfU5; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="ko9/MfU5"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso23337605e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 00:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745739860; x=1746344660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pL4EuVBd+kCprRkzB/cjMf7Bv+31ykO+OuQZllzhxds=;
        b=ko9/MfU5rtNpp/8kus1w5aJwJSnlSOAs8wYZgqC9Q2psi67NIXsSEnptgdcCcVpjcU
         fnGSvvd6v0ngc9LXSEI2NtK20TJUx9nzmSoL4vLs/Hwbs9ama06daBFECSyhdF/1ZTYc
         f6vbRtIHbyMK/uxv8sQ9yY/076a/sJXhiwT4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745739860; x=1746344660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pL4EuVBd+kCprRkzB/cjMf7Bv+31ykO+OuQZllzhxds=;
        b=q4i4bLbMhH1AreCEywocVNa/uLVks8xN8qoKprL+5BHqX6NWolNqI4MQZI6hZWFBSR
         uMbwdD7dplPQovFngfKNq+Uhb9PnutUdKh9nQm3lawRCR1Ra0YFWCFI7b9/p1naEuZFO
         fnhF9whzuoF+An3JU74Uai8mwV0HPCgg1pmTBoWYIjYUkCcKRF+o8OoZlyvqjv+swPcR
         3w2u/4xKPpcvDNJ3HlE2SvjIRiMNGT5+CsrX+/HYaiH2/gyrznQnPJF6BTcVJOE+zciX
         JbvmoDGz+vBDJWh7hklFhVMZa0+O9Wwt8KcytSqcAnDHFJ/UtFe1EP7TFx567k4O15Yf
         8MDQ==
X-Gm-Message-State: AOJu0YzcwAJA+Q/tpcMoP1nj8qcFYq5FB8/SpaRh9JoteDL7l9MnO6uf
	D4PazzdvurDzoyfYVZ95ILFNa/8HUjijZXrzw+/HDAfroAPPoP1VxF/LKkBwYFOMUhif4GdZ0ni
	w
X-Gm-Gg: ASbGncsHENxkqU5zTvA4rU9YxhSKwD2OQoVAiE/ARBidrxGy+xCmCZmTyc8Q3o+Ccz4
	/apUF7QMpYotRtHntAKDjk+307sV6EJFdLT/YELMhSx2vsRgPi3mSvcYlSY4hkpKjJwoB8loMsa
	VDGTKmPOHHBBiDZuWGyfNdLYxgGYXdhHYUapFwrlSV5x9ptOoPqerAy9emDzYStfXd1F4kpSZx5
	eedMcLF3r+KEiMPs+yTCFKcbTunZlDIvLUyWJhowgkRXvbpdKmDpK/lv9osetkDqfi6obxBA5ph
	oUNwXbfUDGW1hmdciEf62mTdxpMWpH1huouhd1XBSMS8+DQJBslXL1ae7Ej1gblLnsPkvAjICnY
	jPhup3g==
X-Google-Smtp-Source: AGHT+IEL/lT85jIG57Q0JOnH775/lJ5IzNoIu0Chk+nAgHGI/dfLdbqsRa7ZO7X6xN8mOHy3m7EIgA==
X-Received: by 2002:a05:600c:58d7:b0:43d:fa5f:7d04 with SMTP id 5b1f17b1804b1-4409c52a44dmr92109645e9.16.1745739859798;
        Sun, 27 Apr 2025 00:44:19 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a52f8915sm87682015e9.7.2025.04.27.00.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 00:44:19 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Jander <david@protonic.nl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Marek Vasut <marex@denx.de>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Roan van Dijk <roan@protonic.nl>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 8/8] ARM: dts: stm32: support STM32h747i-disco board
Date: Sun, 27 Apr 2025 09:43:27 +0200
Message-ID: <20250427074404.3278732-9-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250427074404.3278732-1-dario.binacchi@amarulasolutions.com>
References: <20250427074404.3278732-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The board includes an STM32H747XI SoC with the following resources:
 - 2 Mbytes Flash
 - 1 Mbyte SRAM
 - LCD-TFT controller
 - MIPI-DSI interface
 - FD-CAN
 - USB 2.0 high-speed/full-speed
 - Ethernet MAC
 - camera interface

Detailed information can be found at:
https://www.st.com/en/evaluation-tools/stm32h747i-disco.html

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 arch/arm/boot/dts/st/Makefile             |   1 +
 arch/arm/boot/dts/st/stm32h747i-disco.dts | 136 ++++++++++++++++++++++
 2 files changed, 137 insertions(+)
 create mode 100644 arch/arm/boot/dts/st/stm32h747i-disco.dts

diff --git a/arch/arm/boot/dts/st/Makefile b/arch/arm/boot/dts/st/Makefile
index 60d55516f723..c66959edac12 100644
--- a/arch/arm/boot/dts/st/Makefile
+++ b/arch/arm/boot/dts/st/Makefile
@@ -28,6 +28,7 @@ dtb-$(CONFIG_ARCH_STM32) += \
 	stm32746g-eval.dtb \
 	stm32h743i-eval.dtb \
 	stm32h743i-disco.dtb \
+	stm32h747i-disco.dtb \
 	stm32h750i-art-pi.dtb \
 	stm32mp133c-prihmb.dtb \
 	stm32mp135f-dhcor-dhsbc.dtb \
diff --git a/arch/arm/boot/dts/st/stm32h747i-disco.dts b/arch/arm/boot/dts/st/stm32h747i-disco.dts
new file mode 100644
index 000000000000..99f0255dae8e
--- /dev/null
+++ b/arch/arm/boot/dts/st/stm32h747i-disco.dts
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025 Amarula Solutions, Dario Binacchi <dario.binacchi@amarulasolutions.com>
+ */
+
+/dts-v1/;
+#include "stm32h743.dtsi"
+#include "stm32h7-pinctrl.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+
+/ {
+	model = "STMicroelectronics STM32H747i-Discovery board";
+	compatible = "st,stm32h747i-disco", "st,stm32h747";
+
+	chosen {
+		bootargs = "root=/dev/ram";
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@d0000000 {
+		device_type = "memory";
+		reg = <0xd0000000 0x2000000>;
+	};
+
+	aliases {
+		serial0 = &usart1;
+		serial1 = &uart8;
+	};
+
+	v3v3: regulator-v3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "v3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		led-green {
+			gpios = <&gpioi 12 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "heartbeat";
+		};
+		led-orange {
+			gpios = <&gpioi 13 GPIO_ACTIVE_LOW>;
+		};
+		led-red {
+			gpios = <&gpioi 14 GPIO_ACTIVE_LOW>;
+		};
+		led-blue {
+			gpios = <&gpioi 15 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		autorepeat;
+		button-0 {
+			label = "User";
+			linux,code = <KEY_WAKEUP>;
+			gpios = <&gpioc 13 GPIO_ACTIVE_HIGH>;
+		};
+		button-1 {
+			label = "JoySel";
+			linux,code = <KEY_ENTER>;
+			gpios = <&gpiok 2 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+		};
+		button-2 {
+			label = "JoyDown";
+			linux,code = <KEY_DOWN>;
+			gpios = <&gpiok 3 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+		};
+		button-3 {
+			label = "JoyUp";
+			linux,code = <KEY_UP>;
+			gpios = <&gpiok 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+		};
+		button-4 {
+			label = "JoyLeft";
+			linux,code = <KEY_LEFT>;
+			gpios = <&gpiok 4 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+		};
+		button-5 {
+			label = "JoyRight";
+			linux,code = <KEY_RIGHT>;
+			gpios = <&gpiok 5 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+		};
+	};
+};
+
+&clk_hse {
+	clock-frequency = <25000000>;
+};
+
+&mac {
+	status = "disabled";
+	pinctrl-0 = <&ethernet_rmii>;
+	pinctrl-names = "default";
+	phy-mode = "rmii";
+	phy-handle = <&phy0>;
+
+	mdio0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "snps,dwmac-mdio";
+		phy0: ethernet-phy@0 {
+			reg = <0>;
+		};
+	};
+};
+
+&sdmmc1 {
+	pinctrl-names = "default", "opendrain", "sleep";
+	pinctrl-0 = <&sdmmc1_b4_pins_a>;
+	pinctrl-1 = <&sdmmc1_b4_od_pins_a>;
+	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
+	cd-gpios = <&gpioi 8 GPIO_ACTIVE_LOW>;
+	broken-cd;
+	st,neg-edge;
+	bus-width = <4>;
+	vmmc-supply = <&v3v3>;
+	status = "okay";
+};
+
+&usart1 {
+	pinctrl-0 = <&usart1_pins_b>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&uart8 {
+	pinctrl-0 = <&uart8_pins_a>;
+	pinctrl-names = "default";
+	status = "okay";
+};
-- 
2.43.0

