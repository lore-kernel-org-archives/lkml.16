Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8F1199FAB;
	Wed, 14 May 2025 14:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747231799; cv=none; b=BFZboAavWLhGPNweP31tRaDUawYKqlVbN7m6H2kA1fIGKCmp5NgMKDsALF0QGR8G8lr7hnS+q7PRacTkJ66mwyy/OTQvZkJoHQRN6KX+N59MuXrCMBQPXhdWbmmbvNGFvuO1hkTGzLemWeFeNDvglLYUU9oB2oe2krFqOua/ZPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747231799; c=relaxed/simple;
	bh=OhmavDCHy1k6lDJhugGir92mjOwdOw63nJrZTQmSt/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i5HvWdrOlL/UzCGTVzpzaQ6M1gGgueeucpkYLeeXrAOIpkFsBCEVdT8TAqjAkzi74u9ws4ZK6NxqFqWCA4jsiP4rlSwaaU3T5t/A20MdBcwuN1gh/BacuwZDXo6YeKUuLe1V4TXgTVpNzQ/ctmJoIdoQ2t21A0AGae4dX6aFSt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k+/PTnFx; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k+/PTnFx"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22e033a3a07so75399155ad.0;
        Wed, 14 May 2025 07:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747231797; x=1747836597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1rdKmRSuyPb6NIx8nY+1zDs9F4SWcGDkRxiLAkC20C8=;
        b=k+/PTnFxSbicmVBGeGgo1KWZlbMSDi4IAu0ghS+hGfRAQqjzv0s1sR3tpRZ3lAVO31
         lf5ugd1WEpBt0SC+L+fcBlMhPXeM2UzwKFcuPWUszRZWbktaV1UuQvOWE1oSYKrxRtFC
         NrSJgdzU0L6e/1viVKkCsdsHhaaZy4s6bxeI69ckDtmVA+Fi6GiqId3hwtWTWTuxBC6f
         7gP2k+mQ3pmm1zgruApnql2QHQMVi+ubfkYyJXeQ/KDIqG6riTZVlD1w/rRwEVgO35I3
         RSbNIuiVo/07GTHjAhhaw+NtRnnUjHj3U+QoT0Dtb4Dslth4oq3mEa4j/yBIOpe/sPbA
         YvcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747231797; x=1747836597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1rdKmRSuyPb6NIx8nY+1zDs9F4SWcGDkRxiLAkC20C8=;
        b=FsSiCLGNAtLu/MYfP+e+9b+ZUH+HfhflYRaui3T3ZIqy7Lu/oLCJcdiSVKiQI0jyzn
         /LKDJP6i/gTdAmbReuSKcxiJ5XBM3SdYfQvZzkl4Q2IVo8XWBTVBd2t0laMS/WTQovNd
         YqguQX3EY+seY3zwDadDKMtLkcVz2PlE5Wg64kY44inC8ZCYXOQQTDiadv9KzuNHl7k3
         d08+cON6tBRHpB3tNSEaLC+fK80gazXAuRtNBcEy1pNEqfOpNpusKVig7KdLj0eyLI02
         hjn8QdkKfrlun3DKOK2f0zuCc2T8EEhCsK+TyXDDkwPeBGw6UNp50C/aUddmYxyxZ0ty
         ObVw==
X-Forwarded-Encrypted: i=1; AJvYcCU02t8NsoWfELW7toPyz6klXsBKX86GM1Ws1H9C+MKAUu3NmYKIwnPLvLARx2U0c8/dcLJ8CZDGP72daUc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgENa56JpKc1nf1TQvQxJJ1ds16YndlgUAUxVMqaB6WfGSxUYa
	iTipyUujDTfBQfuD18VJr7IytuuGQXUQAj5+oaj1fsXQzyFqIYCkTnMO+YzchvWv2w==
X-Gm-Gg: ASbGncuK0ZlOCDG0/82tJXEFCqa0fqAZqcF0BR5oFB/fKN6npeyNbFDg03lT9iq/5MP
	2u6kk/W1w5vyIpBOSlb/NHAhfKC7g6n0QV0AAvAry+1pCM8HkiLkgH7rJHRnJHYvy65QnyYlNCQ
	iNx94iZHcU3TWcvTYvqgVKsYQrN00t9Sg4RY+vkZxmI1D4VK9XgYeUOCBqLmljuD1L3SH4xbYnJ
	HRzyxGN7Y5ZDlC4J7hPQ/VsN6Vb4Gym8B8NXsVwMcsSay86X+8UuonILTfuq3qU/LODtaKOl+zq
	fgq0NuNOgWZBswiy8sd0HPB1U5gFK+tsnjebDtoL/Onoli1NTjUanhx1XjOXZg==
X-Google-Smtp-Source: AGHT+IGqfxH9wcWonGS/XzWU03rDStXfIqzHF3ukgWS0gRVxFE/c9T2Pr76UvBAkI0eaUZGD7u71uw==
X-Received: by 2002:a17:903:1cd:b0:220:e156:63e0 with SMTP id d9443c01a7336-231980ce4b4mr46290725ad.8.1747231796258;
        Wed, 14 May 2025 07:09:56 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271ae0sm100407975ad.128.2025.05.14.07.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 07:09:55 -0700 (PDT)
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
Subject: [PATCH v2 4/4] riscv: dts: sophgo: add Sophgo SG2042_EVB_V2.0 board device tree
Date: Wed, 14 May 2025 22:09:02 +0800
Message-ID: <53a9a794641af697be9170e6d0af464a39d862ae.1747231254.git.rabenda.cn@gmail.com>
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

Sophgo SG2042_EVB_V2.0 [1] is a prototype development board based on SG2042

Currently supports serial port, sdcard/emmc, pwm, fan speed control.

Link: https://github.com/sophgo/sophgo-hardware/tree/master/SG2042/SG2042-x4-EVB [1]

Signed-off-by: Han Gao <rabenda.cn@gmail.com>
---
 arch/riscv/boot/dts/sophgo/Makefile          |   1 +
 arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts | 235 +++++++++++++++++++
 2 files changed, 236 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts

diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
index 2470e30ae901..31fa46ef3bf6 100644
--- a/arch/riscv/boot/dts/sophgo/Makefile
+++ b/arch/riscv/boot/dts/sophgo/Makefile
@@ -4,3 +4,4 @@ dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-licheerv-nano-b.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v1.dtb
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v2.dtb
diff --git a/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts b/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
new file mode 100644
index 000000000000..8eba1a4ab1ee
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
@@ -0,0 +1,235 @@
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
+	model = "Sophgo SG2042 EVB V2.0";
+	compatible = "sophgo,sg2042-evb-v2", "sophgo,sg2042";
+
+	chosen {
+		stdout-path = "serial0";
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

