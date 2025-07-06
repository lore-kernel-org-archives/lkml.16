Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1511DB34B;
	Sun,  6 Jul 2025 04:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751775866; cv=none; b=GIfCdfs7O2rc9QITJpmxzP49InTtX3hnP1IZ5HB2CPsU6/0IBJIFZrT2Cfcj6hsebAOQ8vF4fNUEzbHcM2/I29D/tB4zYBdeNxfoFiuD4PZg1OjQkeM/Y3ei6dMjMwf0JiWNhHYmt74zNaacqVbv2+QMcVrPewAoGvvkxKakiTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751775866; c=relaxed/simple;
	bh=D6tBicJNJluhKT13rAUtqeS21FA/xXWDFgXQN4qNCt8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PR0WNtjaaXH15FFlza9srJxzyWIyXRJ2e31yIXOm8wEdWjXz3mJPMVhQowiHu4N3uopTnoMEbvWTg/OZl9E7S9pLK66lhTOEkdQTDRo1AZLXw6eGmpYCnepUlbr/6K8Y5DQSEvBdgLk1KAxiT8ZM6uHBFnwkIYZT2DjX99E7VDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AVgsosmA; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AVgsosmA"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-74b56b1d301so1206331b3a.1;
        Sat, 05 Jul 2025 21:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751775864; x=1752380664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dfn1RaDZ/VoXGBlX+/NPIiA54a4d4cEOfZQVkuaZdk4=;
        b=AVgsosmAeIyxPPCqVDxom4GwdnqEVE+gmokJ2qTrW4sPTuXaJYuBgkld4cBv1ovbTg
         BuRJKMBqHSAGvpfvwCCay2DG4z+tgeFUDhT+IAVnBbSC2uYSjHIaFDmsJAM/YMRQ08Lw
         tyRmQreMq0RI/4QPBMNd+gUc0fa4IplSx16NGMx9iCBBto58fg0lnsuv6aA183FjXbuj
         Y96Tq1JKgWgTWd2nfPPC/i45SP3H90T5VoOUr1dLAhTqmEkprOMkIxzCB57+6QTLAZPT
         Y42P3eXbCl2v2fMbMtOOVEJyuYMMRbm5c0FxZYAl8em13irMWhwhnJqUgZ9GK7bj9bYe
         NeAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751775864; x=1752380664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dfn1RaDZ/VoXGBlX+/NPIiA54a4d4cEOfZQVkuaZdk4=;
        b=TeP5iYxJ1lQES+GJSzCSZ125nYuEJlk4+M4he8w7EnzUHD0p5HHC5ZMD/ncOk5+KAn
         LaNfSolcrOMnQxeKt0pUT7uN4KmC19bMFtnm/m7LZOMhyz4MbT7wv0gyStzWD6T6WMGb
         vTRL1FftNw5hPqagX4R7VLB6DL6jPniOrIkuVAhI/ZkPsJqe+hs47Y1IFy553eJ/RrSA
         l/BGjN4bY5/5/9/476/7hpezODBn60OcMyL3oEWAB302jxMucYuhsnYxgauSQmGYVAaI
         bVItv2J9k247sA1s6RMAs0GAujlmOxbYEFx467xItR3Yt2eEijCaqNw1J3rWaNwq2PRY
         SrUQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9oMl7/0kvDR0IY7esC4R0dyuUyVzlijzLV1xURcF1yln2qjPUk+Mh6xIKLOub081cJh+6cnIcYIU5sXdd@vger.kernel.org, AJvYcCXBIJrPm9bL8DJicXiLOEMXuiETkqa+9p/QVN777Tka7b/YAoMPXha6s4OZFFmCZiSh0JGC+EBfvkiN@vger.kernel.org
X-Gm-Message-State: AOJu0YyFdSSdvic35BM0F2e2Dp2jKXRMJscCxhJaBANQ4+f0mh27ivmb
	PPa9defrmChXxn2uerZfqeCOe3jtp3v3a2+DazHJGhxK7jFKN1uC6w9N
X-Gm-Gg: ASbGnctmaXRa7th77zLYBPMrsMbnbHRf4GbmKyTP25HfEXWI3yi/IhdeS8xKIdPZ21j
	ThHIQ0BYh2bsszVLsI/za7RsYimGrrbNb6NDNghO8nT3pvOnEB8lMtb+AfIRqxzBAcXBZ6hkJEr
	Y2OIckJCVeo/qSMYetWT7nj3MpEdUVZd0gxLQHdzzLvxmX7TLsObywAx5hqHTsPgVAgE2nmEnuJ
	VH6bQWIlsrxmHiYqu/ztYKqsfiKfU+dl5mFOu9svsTChzjRwNDj5nc93GH0tlg0Gg5M/qD2wzJg
	5FQt9MjsMdpeMTqc/hUHU3w6ihqw/Q1BQDadoyr4WGhTxSZVWHaQhwnozENHxZiGokFhsbAPhAd
	wXQ8f6E9y7rB2Xg8dT84e+qV+K0d6nQKyZ74kSAs=
X-Google-Smtp-Source: AGHT+IFLx/ecv0fzT4aq24Vp/6Qjs2Ymni61ExjnL6k5yrrhyuTQDQe/9YeSrYCfZz3y6aBbWrlwew==
X-Received: by 2002:a05:6a00:1493:b0:742:a02e:dd8d with SMTP id d2e1a72fcca58-74ce8acd787mr10488800b3a.20.1751775863981;
        Sat, 05 Jul 2025 21:24:23 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce417f206sm5287067b3a.76.2025.07.05.21.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 21:24:23 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Tao Ren <taoren@meta.com>
Cc: Tao Ren <rentao.bupt@gmail.com>
Subject: [PATCH v2 9/9] ARM: dts: aspeed: Add Facebook Darwin (AST2600) BMC
Date: Sat,  5 Jul 2025 21:23:59 -0700
Message-ID: <20250706042404.138128-10-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250706042404.138128-1-rentao.bupt@gmail.com>
References: <20250706042404.138128-1-rentao.bupt@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tao Ren <rentao.bupt@gmail.com>

Add initial device tree for the Meta (Facebook) Darwin AST2600 BMC.

Darwin is Meta's rack switch platform with an AST2600 BMC integrated for
health monitoring purpose.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
Changes in v2:
  - Removed mac3 controller.
  - Fixed DTB warnings.

 arch/arm/boot/dts/aspeed/Makefile             |  1 +
 .../dts/aspeed/aspeed-bmc-facebook-darwin.dts | 78 +++++++++++++++++++
 2 files changed, 79 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dts

diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
index 2e5f4833a073..debbfc0151f8 100644
--- a/arch/arm/boot/dts/aspeed/Makefile
+++ b/arch/arm/boot/dts/aspeed/Makefile
@@ -20,6 +20,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-facebook-bletchley.dtb \
 	aspeed-bmc-facebook-catalina.dtb \
 	aspeed-bmc-facebook-cmm.dtb \
+	aspeed-bmc-facebook-darwin.dtb \
 	aspeed-bmc-facebook-elbert.dtb \
 	aspeed-bmc-facebook-fuji.dtb \
 	aspeed-bmc-facebook-galaxy100.dtb \
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dts
new file mode 100644
index 000000000000..e2e71b1d02c4
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dts
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright (c) 2021 Facebook Inc.
+
+/dts-v1/;
+
+#include "ast2600-facebook-netbmc-common.dtsi"
+
+/ {
+	model = "Facebook Darwin BMC";
+	compatible = "facebook,darwin-bmc", "aspeed,ast2600";
+
+	aliases {
+		serial0 = &uart5;
+		serial1 = &uart1;
+		serial2 = &uart2;
+		serial3 = &uart3;
+	};
+
+	chosen {
+		stdout-path = &uart5;
+	};
+
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&adc0 0>, <&adc0 1>, <&adc0 2>, <&adc0 3>,
+			      <&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
+			      <&adc1 0>, <&adc1 1>, <&adc1 2>, <&adc1 3>,
+			      <&adc1 4>, <&adc1 5>, <&adc1 6>, <&adc1 7>;
+	};
+
+	spi_gpio: spi {
+		num-chipselects = <1>;
+		cs-gpios = <&gpio0 ASPEED_GPIO(X, 0) GPIO_ACTIVE_LOW>;
+	};
+};
+
+&fmc {
+	flash@0 {
+#include "facebook-bmc-flash-layout-128.dtsi"
+	};
+};
+
+&i2c0 {
+	eeprom@50 {
+		compatible = "atmel,24c512";
+		reg = <0x50>;
+	};
+};
+
+&adc0 {
+	status = "okay";
+
+	pinctrl-0 = <&pinctrl_adc0_default &pinctrl_adc1_default
+		     &pinctrl_adc2_default &pinctrl_adc3_default
+		     &pinctrl_adc4_default &pinctrl_adc5_default
+		     &pinctrl_adc6_default &pinctrl_adc7_default>;
+};
+
+&adc1 {
+	status = "okay";
+
+	pinctrl-0 = <&pinctrl_adc8_default &pinctrl_adc9_default
+		     &pinctrl_adc10_default &pinctrl_adc11_default
+		     &pinctrl_adc12_default &pinctrl_adc13_default
+		     &pinctrl_adc14_default &pinctrl_adc15_default>;
+};
+
+&emmc_controller {
+	status = "okay";
+};
+
+&emmc {
+	status = "okay";
+
+	non-removable;
+	max-frequency = <25000000>;
+	bus-width = <4>;
+};
-- 
2.47.1

