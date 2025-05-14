Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A6017A318;
	Wed, 14 May 2025 14:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747231788; cv=none; b=bty9waplZQdMdpBuex//LCTiFsB5Bbj72doqbVhimHj2nqvUSYCEn1QjIXY4MlHjumx7ve7o+HhrJxiHU82UCSS1YmldZcT6QrYDNgHj/JGxihT+3J6Z9+LnSf78t/QbFs4/FmMSiRxMygRb/SYKWFi4Li3xEpf575ZzgEPbMpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747231788; c=relaxed/simple;
	bh=2l9puRER1Pp0VZPro4jEP5PJtO4HgNp0oKnRKQXugKE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gz63qwoFxyqNp5vDZ74D8ZEq7sRLv6T0SmDy5Ko8iohukuLCfW/u0fqSr+J8ehQY3agFrFgEHkdLyLsmKDmxm4vfgMg2f+Ke49B85ZLLgGdvsQSkh/hc7yhfBj4d1op9LB468inca9x5E27Cttn2TvF0KHUqt2qYNTtAy4kCkus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BEPBvZ7D; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BEPBvZ7D"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22e45088d6eso85775015ad.0;
        Wed, 14 May 2025 07:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747231786; x=1747836586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l/tDDOsxJs07YQDlwg9apBuNhXsPbs8Zot7rURIZI90=;
        b=BEPBvZ7DI4kljOVD0GpxpslOlby5U+o8Zt9cIp59s8+64M8ET6/qRaFEHP6RTiiO6h
         W4jKSqMyJVelCQxeFZY4YwEWK8W3o3xGC8AK3DI8WJAvzMKCw3I0rP5GzsXcVP9x58VQ
         FxfQw4NVC5BR/e8Jdqy0w8WSV10I212hwoU1ziSrk2WhceID788PsfOi+LTdJahAC3sr
         nP8OE3BEzDaVRzua3ll9zde+s5yshtHuXpkd8E7f2BZev8LoTp7A/YZmOQNxqKGYHj2y
         GKwgVb2TQgY+6jHmqfNu3E8c+S96C9nhBTaDWIld3IIeBS9oozkIWSXLmXLXrfsSLkws
         WRNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747231786; x=1747836586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l/tDDOsxJs07YQDlwg9apBuNhXsPbs8Zot7rURIZI90=;
        b=faSTU2bWt59pSTNJHAaCY+0/ALmfIBkGBVjiSnbQOvvnVikb8gDzczMAyHBVFfldw6
         q2IR/fimZMt48mKURZJgTMp4gTD5I6nxGjLPdN0Vr0E/Nq/KHTKCNt0pry9E3x4tsf0j
         KVzrXTnmkdCMJh01pYog4j1ShPSz8+wh0JcYBN4PB4HuuoVRPNpH+4Jja9hQE+VqyUtw
         926WBjGKzu287S50L160LrVfOhhgLkLI5pD+g2wdH1EFy8wbeOdqlGZV1f/Pg4RC6//N
         vIo6TLPK5CKjaDr4Gy3HIqsj4JTMUjvgqpcFgxR9NcUrc+AzVcmlCGnhjVqn8yCEqxy2
         O9nA==
X-Forwarded-Encrypted: i=1; AJvYcCUwbkdpslCd0VRGC1HvcoMFeM6avTHw6+VVVTcTfwTUwEsrr2TyY1ehjq1yoEKm5IFyTpwFxgzyGiZIRzQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzG/hwWGxsE4sfgd85tPglzIOw1WS5QoMI2/eBI3y9kqhl+0QHG
	ex/HwQytarqiPbiRQG8VoU6iXwGNz8pDeq+SXJs/DkhNmGYpLYk62tzWnRBhwMipwg==
X-Gm-Gg: ASbGncsYTSC+r1BeocEOmTmuc7RzKE30LmIujtkDMfOupJceZhU0LFe0QpvXRLnucBM
	6kS/Wqk4RYHO1flfXg8RcKFPfDwuuPbnvAY5VD4yr6Twhxa2kMm4QJtoxxD4IgkPldp0n04t3M3
	Y9OL6QCOyamgn88benApK9IRa/+J2xWzI9ILdH7CG555A5SGo10rkPaTWbg28YWQtUu1SYk1M2z
	LxuSvLnJPIzPJ75D81B7V6uS4Z2GnuIbSjWBmp9CmTH+hrzRYqFQv7lxBBGvDlOL5ESNAeKjtv7
	sruWkWRz+VBKSbAH4gZwoG0i3U9MQ3wmQkXZgZLCWEBba7bvGcMN69x2kjL3+g==
X-Google-Smtp-Source: AGHT+IGzNLrdYqEU43CSK9rgesMbr8KRwQz5fJHtv47C5HKikvyw5qElXCaTEkikOXWVLKIEBEZUBA==
X-Received: by 2002:a17:903:1109:b0:223:635d:3e38 with SMTP id d9443c01a7336-231980cf7c1mr51388775ad.15.1747231785418;
        Wed, 14 May 2025 07:09:45 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271ae0sm100407975ad.128.2025.05.14.07.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 07:09:45 -0700 (PDT)
From: Han Gao <rabenda.cn@gmail.com>
To: devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Han Gao <rabenda.cn@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Guo Ren <guoren@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] riscv: dts: sophgo: add Sophgo SG2042_EVB_V1.X board device tree
Date: Wed, 14 May 2025 22:09:00 +0800
Message-ID: <4f5eaf5285dbeb0de1c8aa4700ca0910273e7674.1747231254.git.rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1747231254.git.rabenda.cn@gmail.com>
References: <cover.1747231254.git.rabenda.cn@gmail.com>
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
 arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts | 247 +++++++++++++++++++
 2 files changed, 248 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts

diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
index 47d4243a8f35..2470e30ae901 100644
--- a/arch/riscv/boot/dts/sophgo/Makefile
+++ b/arch/riscv/boot/dts/sophgo/Makefile
@@ -3,3 +3,4 @@ dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-licheerv-nano-b.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v1.dtb
diff --git a/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts b/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts
new file mode 100644
index 000000000000..4f39a2575b8e
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts
@@ -0,0 +1,247 @@
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
+
+/ {
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
-- 
2.47.2

