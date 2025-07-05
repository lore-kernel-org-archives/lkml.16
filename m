Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7252927FB07;
	Sat,  5 Jul 2025 07:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751701232; cv=none; b=rHLXlViWkL2SZlE2XQmLIWOdirvJpte+JFpSv3MTab9z/gGl6szf++czwdEtkF9Y0ts9ix7vd9IXRAWyLKKTdJj6sK7F7pCoQ4LpKHpuEBAJrs7hn5I8wpxXb+QCqO8BSayuiAn1ujow+tfUXawj0t+vzNYaNekyFUPN/MqJX9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751701232; c=relaxed/simple;
	bh=VLpxtPX1ppZB3v3pbhsZvB/9zPts4e7SPwTP5FNhhg8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IM0nCAGJSdiJK/m0FPQXRJFK/ydCIu1nSJx8lC42dtigf4JkNPXJnlcPakCJM9qPqe7ltwLaZUu3LdUfGsP8AGOqM5FwRtMvNSjluKhjAhfqQcD8ZdR7+kzhzJqq7alwJOd5HubWauWXz5z/B3iUJtUA2sxeIUQ7qMIHWj3QFvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JHpkL1Tz; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JHpkL1Tz"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-74b50c71b0aso839343b3a.0;
        Sat, 05 Jul 2025 00:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751701230; x=1752306030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jmNEezpRloOjJ1XA5ZHok3ZVRRcPJg09tTrd/q1+ELE=;
        b=JHpkL1TzGzM3l1lxOtKA5vjU7zRxaM3oEEYKsZM+SVi4zIu97Rshz8OqYJUkLE1sMa
         3ZKs7AHBke2Gr++c7ysHZbfWhcuBHKNkPudXXaDgeeIGdQLLuhIeU6joF1az3HQQP2yx
         qALZ4cSFhCOOVHISDaIOAmIzxclahiuct079J8BebmtIXf7ywZdHW5KXEQiQGabn5ce6
         uIrOvL8MVdlKUM59H0T+mIqFwjBwuPh/21qhIvZtBHN7ADzRhBagvd6urqKWV6aaww/3
         YsPrhqt4SF45EFQ5CE9m2Lwczg82rnXMTPCWHFAtQ4N/41Ev4aQrlxSIt2CCR6s0/+QQ
         GNpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751701230; x=1752306030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jmNEezpRloOjJ1XA5ZHok3ZVRRcPJg09tTrd/q1+ELE=;
        b=oZEy4diYZHNHDqxs/S9C4TaeFr50eAK7zM1X1hUkbEQqf4ROKv2EOHc1e7xeXj9rrV
         5Cx53DEVHZeNmoC8Tfaez5uXpSNmwf+kCu8r0uQICBrlABw8OfgdwAb5/EZXNIeM8VqE
         qV+DFt3DFe2tQ3QCm+I7CFgwMTG+2GHlIcbHO7oFrm9sLGCGkrLOC9/f/DXEPOxokwZB
         s9+dgujNR8/OzeglFT/1VzaDJ4FpNogvlKIDd1lRZZ8Phevm3DjgfDF3831cfPtZd+DX
         vU+sTark0tlQG4chuAmEaFytZysUhXpySkXqw1/Xz4Fafb9bqiCWk8B2ad+9bu90LmFb
         xb2g==
X-Forwarded-Encrypted: i=1; AJvYcCW+GPGR1Xlyg/c2LyGUbSSFBGSKRTXy9fbn1xD1Tecprv7boYgPudk+4rKal6KgmNm8Exa4j2hIWBHLMPw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx78vEueLwE7RFhd+w5v0QeJC4nMrGqzvGxaIP/wmqLCCbOYgI1
	UPUxK1cFnSDmF2XOuY9CuniFikhBw8vlCNMie3dMJoKn3Ktn+qN4CC2dEVjvDYwVMsY9eQ==
X-Gm-Gg: ASbGncs67x30etG85DMrYKRsnJaBpXrXAzq9hDt9fhg1R20ahWm266sR+XgmUC0LZnJ
	1IlmHGL8NCuRMFWBAInin06QaaaWXCBA3ZW9j/G4oC0/mYEiCl2s+1KgdS3SDD04wTlR/FFfbwa
	Q5YmynuQXimoX8sljw31QJ5dm6ATZX9E2a8Qe0eSv9RC+3m5k/jm7RtdStpLAXGzkqPOt/ZHaJs
	zmB1m8q4Iov4o1tkM4M2Q5qDpuahcWqoXM4016U2ZHuZD0ojFWqKY3VF7CvtcjXdMGYQzbID0tg
	Wag4EebE4hm60cPkD6yBXvb0uSh59h2u5IQ0tQmMqBL8ocPn4p8AKoaDTHFaqPxhz7BcbyhK
X-Google-Smtp-Source: AGHT+IEWPPOF2x85dNlyqkl6KGAF0hJCqYC/MuMMyXCXQDACKIzhBOs8cP+9xAeVsasrbcf8U8MyBw==
X-Received: by 2002:a05:6a00:1412:b0:748:fe3a:49f2 with SMTP id d2e1a72fcca58-74ce8ae79dbmr6487010b3a.21.1751701229085;
        Sat, 05 Jul 2025 00:40:29 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce417e852sm3993616b3a.85.2025.07.05.00.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 00:40:28 -0700 (PDT)
From: Han Gao <rabenda.cn@gmail.com>
To: devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Guo Ren <guoren@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] riscv: dts: sophgo: add Sophgo SG2042_EVB_V1.X board device tree
Date: Sat,  5 Jul 2025 15:39:55 +0800
Message-ID: <27091134ce1f8a6541a349afc324d6f7402ea606.1751700954.git.rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1751700954.git.rabenda.cn@gmail.com>
References: <cover.1751700954.git.rabenda.cn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sophgo SG2042_EVB_V1.X [1] is a prototype development board based on SG2042

Currently supports serial port, sdcard/emmc, pwm, fan speed control.

Link: https://github.com/sophgo/sophgo-hardware/tree/master/SG2042/SG2042-x8-EVB [1]

Signed-off-by: Han Gao <rabenda.cn@gmail.com>
---
 arch/riscv/boot/dts/sophgo/Makefile          |   1 +
 arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts | 245 +++++++++++++++++++
 2 files changed, 246 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts

diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
index 85966306801e..6c9b29681cad 100644
--- a/arch/riscv/boot/dts/sophgo/Makefile
+++ b/arch/riscv/boot/dts/sophgo/Makefile
@@ -3,4 +3,5 @@ dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-licheerv-nano-b.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v1.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2044-sophgo-srd3-10.dtb
diff --git a/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts b/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts
new file mode 100644
index 000000000000..3320bc1dd2c6
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts
@@ -0,0 +1,245 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (C) 2025 Sophgo Technology Inc. All rights reserved.
+ */
+
+#include "sg2042.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+
+/ {
+	model = "Sophgo SG2042 EVB V1.X";
+	compatible = "sophgo,sg2042-evb-v1", "sophgo,sg2042";
+
+	chosen {
+		stdout-path = "serial0";
+	};
+
+	gpio-power {
+		compatible = "gpio-keys";
+
+		key-power {
+			label = "Power Key";
+			linux,code = <KEY_POWER>;
+			gpios = <&port0a 22 GPIO_ACTIVE_HIGH>;
+			linux,input-type = <EV_KEY>;
+			debounce-interval = <100>;
+		};
+	};
+
+	pwmfan: pwm-fan {
+		compatible = "pwm-fan";
+		cooling-levels = <103 128 179 230 255>;
+		pwms = <&pwm 0 40000 0>;
+		#cooling-cells = <2>;
+	};
+
+	thermal-zones {
+		soc-thermal {
+			polling-delay-passive = <1000>;
+			polling-delay = <1000>;
+			thermal-sensors = <&mcu 0>;
+
+			trips {
+				soc_active1: soc-active1 {
+					temperature = <30000>;
+					hysteresis = <8000>;
+					type = "active";
+				};
+
+				soc_active2: soc-active2 {
+					temperature = <58000>;
+					hysteresis = <12000>;
+					type = "active";
+				};
+
+				soc_active3: soc-active3 {
+					temperature = <70000>;
+					hysteresis = <10000>;
+					type = "active";
+				};
+
+				soc_hot: soc-hot {
+					temperature = <80000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&soc_active1>;
+					cooling-device = <&pwmfan 0 1>;
+				};
+
+				map1 {
+					trip = <&soc_active2>;
+					cooling-device = <&pwmfan 1 2>;
+				};
+
+				map2 {
+					trip = <&soc_active3>;
+					cooling-device = <&pwmfan 2 3>;
+				};
+
+				map3 {
+					trip = <&soc_hot>;
+					cooling-device = <&pwmfan 3 4>;
+				};
+			};
+		};
+
+		board-thermal {
+			polling-delay-passive = <1000>;
+			polling-delay = <1000>;
+			thermal-sensors = <&mcu 1>;
+
+			trips {
+				board_active: board-active {
+					temperature = <75000>;
+					hysteresis = <8000>;
+					type = "active";
+				};
+			};
+
+			cooling-maps {
+				map4 {
+					trip = <&board_active>;
+					cooling-device = <&pwmfan 3 4>;
+				};
+			};
+		};
+	};
+};
+
+&cgi_main {
+	clock-frequency = <25000000>;
+};
+
+&cgi_dpll0 {
+	clock-frequency = <25000000>;
+};
+
+&cgi_dpll1 {
+	clock-frequency = <25000000>;
+};
+
+&emmc {
+	pinctrl-0 = <&emmc_cfg>;
+	pinctrl-names = "default";
+	bus-width = <4>;
+	no-sdio;
+	no-sd;
+	non-removable;
+	wp-inverted;
+	status = "okay";
+};
+
+&i2c1 {
+	pinctrl-0 = <&i2c1_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	mcu: syscon@17 {
+		compatible = "sophgo,sg2042-hwmon-mcu";
+		reg = <0x17>;
+		#thermal-sensor-cells = <1>;
+	};
+};
+
+&gmac0 {
+	phy-handle = <&phy0>;
+	phy-mode = "rgmii-id";
+	status = "okay";
+
+	mdio {
+		phy0: phy@0 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0>;
+			reset-gpios = <&port0a 27 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <100000>;
+			reset-deassert-us = <100000>;
+		};
+	};
+};
+
+&pinctrl {
+	emmc_cfg: sdhci-emmc-cfg {
+		sdhci-emmc-wp-pins {
+			pinmux = <PINMUX(PIN_EMMC_WP, 0)>;
+			bias-disable;
+			drive-strength-microamp = <26800>;
+			input-schmitt-disable;
+		};
+
+		sdhci-emmc-cd-pins {
+			pinmux = <PINMUX(PIN_EMMC_CD, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <26800>;
+			input-schmitt-enable;
+		};
+
+		sdhci-emmc-rst-pwr-pins {
+			pinmux = <PINMUX(PIN_EMMC_RST, 0)>,
+				 <PINMUX(PIN_EMMC_PWR_EN, 0)>;
+			bias-disable;
+			drive-strength-microamp = <26800>;
+			input-schmitt-disable;
+		};
+	};
+
+	i2c1_cfg: i2c1-cfg {
+		i2c1-pins {
+			pinmux = <PINMUX(PIN_IIC1_SDA, 0)>,
+				 <PINMUX(PIN_IIC1_SCL, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <26800>;
+			input-schmitt-enable;
+		};
+	};
+
+	sd_cfg: sdhci-sd-cfg {
+		sdhci-sd-cd-wp-pins {
+			pinmux = <PINMUX(PIN_SDIO_CD, 0)>,
+				 <PINMUX(PIN_SDIO_WP, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <26800>;
+			input-schmitt-enable;
+		};
+
+		sdhci-sd-rst-pwr-pins {
+			pinmux = <PINMUX(PIN_SDIO_RST, 0)>,
+				 <PINMUX(PIN_SDIO_PWR_EN, 0)>;
+			bias-disable;
+			drive-strength-microamp = <26800>;
+			input-schmitt-disable;
+		};
+	};
+
+	uart0_cfg: uart0-cfg {
+		uart0-rx-pins {
+			pinmux = <PINMUX(PIN_UART0_TX, 0)>,
+				 <PINMUX(PIN_UART0_RX, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <26800>;
+			input-schmitt-enable;
+		};
+	};
+};
+
+&sd {
+	pinctrl-0 = <&sd_cfg>;
+	pinctrl-names = "default";
+	bus-width = <4>;
+	no-sdio;
+	no-mmc;
+	wp-inverted;
+	status = "okay";
+};
+
+&uart0 {
+	pinctrl-0 = <&uart0_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+};
-- 
2.47.2

