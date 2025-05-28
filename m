Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1462221736;
	Wed, 28 May 2025 22:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748470714; cv=none; b=VsYX+bTpPaZUoYDpdLhyyJMMX0pSMAmeS9cQbcu2n/IK3NJXUC3sJyLNKLN3e1Tb8RGZ6gDNwjZcC5odmINp0EhoQLPjsbigo9n1MeEFQh24rauQMODcTd71pAxuYMHR+DPTpzn5fbrurzJEl79LBQp6X7UeZkV6CewQum2Tl04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748470714; c=relaxed/simple;
	bh=GZp5vVfYQIwNCZLdzIL+zpvypZff2ZQ2Gkp+xscJF6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fzQLtBW7VlLIwP2jLVDkj9qDkCgm+SIXy6gyXw/dKAwV4vQoFaasRyz5sDdZjsM8BrWhw/qYHXa7ibWMGYsRJ6RSQcQonTIUUmGsuA3cgX+N8L7LBqvy1JY9JvDBnzKcvtUCktHjte3JzJNRi+qZGnYz4dfyxXhO7rxBmQYwGeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fs6ZuKF2; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fs6ZuKF2"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-742c5eb7d1cso189977b3a.3;
        Wed, 28 May 2025 15:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748470712; x=1749075512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zCiLjriu6eNKGmo02lwUhcTPnLY+tJxl9X0S8ytmR7g=;
        b=fs6ZuKF27xXSPS3onblXq6nukqXYLfRbdJ4ku2hrhTU93gqX2hohHIjWmGoJZ2JHLP
         7k8SrhkqjMQViSqVpYkk0q4yKOKtd9GLIhdHcZTPCfF4y3MdN/EMQ5psleDvGRRchjAv
         eMFhPOWqEFhDPN3nCkvcSpunZY/Ib4ROcPVDFD/5GCBSHSTyEcV3jBsdW4Yseffy6s7R
         8xk6oa/I7UuCwkxPAR3pBKg/+l+BF8LSq747y0P8u7iQHuFJ1iusrvXnx69GqAU9tu6c
         PWfRspexXQrUE2MuJvf+J9xONWQ/ZgCNTkPAjjXad8WazCs6Drus846bMRKLnsRNB+PG
         FUjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748470712; x=1749075512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zCiLjriu6eNKGmo02lwUhcTPnLY+tJxl9X0S8ytmR7g=;
        b=d56htv7IdZrkH6FxkkNd+Ib3/W+TZXLgaxmDR1HBbtIl2l8m7Nk8i5Hmi7kfErsFr3
         PeDncgLr+Pn/tsLRaq9q+CLwPZNreWbtoPHIqizswTTHMQHhld7IlGodvjA8vX0KTcov
         5hZ3ZHUhPt4UoPt2vjwtfwChDi9a12bI/aOS/S974zY3mmAP4WCA77X51Tv7O4Z2EhCI
         NcA7StIbi2o6YYsRhJF6xPynTpqowLsj1dpqElSiTY+Yb5Pvw77ZqaBEFTKd4CpNVL7e
         S2R5dqcPOGT0U0DpGzoQ0FO6PhpOh1JyYTH0r3ErL+519OtpftQzvRGtEeEun4aoG0gf
         pkbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVevi6ArWAavRX0ZlDx7csqXWTJiBAdKcmIKmNZKrqmkcZB3qjuSIui0foe5DZx/3Fn6yXM21jtfy1Voont@vger.kernel.org, AJvYcCWPmgkRoNpwv2KrNx6SAtghVQWsG9bauX5OdVsZBwcRZef1+xGjitBHiAwTphC3cAvD8N3Jj53T4jxm@vger.kernel.org
X-Gm-Message-State: AOJu0YxH4WE9534RLJw6NwrUt66WXLcP3BYYqDKVs8tRbvVY5rP9tTak
	RN8Mgw9I+PC9FU4NcI6djemRvsNP2BAOPuhs48WKnKHL6pXYbkSav5If
X-Gm-Gg: ASbGnctxtfG+RMzUVQmTHIUdaAHNZ0ojeovRHGucWGZ8q0mdOM8QRl1rRyJSvdBpjqZ
	Cr0T8+7ExcDefV4oq1eYfSzmiOdqLZbSgrktYfNfqWIUW36vS5S9IqzAUn5F90dhz3cz3g/I2qe
	BN2TCSldQpbtV76jwyXM9oWl9DvrWFXM2m2TRaAsbk7tuftBFNh9hw2zGJk3oVoqGHFlVTukT+w
	FcHwgzu1vvtfCDDvpU6Cks7lU6yoftQpGv9wnX4yf6HreUTEPNO3e4ZuIsAYfC1Uu5w8BCXc6vB
	hivIeSo6+I1RTRJ1cSBizDXSOv9xGF1XWw9HsX0hBbZ8oyHC0k8G+lbpbgrXCj+APg==
X-Google-Smtp-Source: AGHT+IE/92darp9RSRYQNumGk+P+BoJ3eElhSyaMFH30Cpxz8CP/2zlblPMCvwPhIjoncjLZm+Hybw==
X-Received: by 2002:a05:6a20:439e:b0:218:c01:ddce with SMTP id adf61e73a8af0-2188c3b4625mr31533430637.40.1748470711762;
        Wed, 28 May 2025 15:18:31 -0700 (PDT)
Received: from localhost.localdomain ([50.46.184.91])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afff71fbsm81015b3a.165.2025.05.28.15.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 15:18:31 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Steve deRosier <derosier@cal-sierra.com>,
	Joseph Kogut <joseph.kogut@gmail.com>
Subject: [PATCH v3 2/3] arm64: dts: rockchip: Add rk3588 based Radxa CM5
Date: Wed, 28 May 2025 15:18:22 -0700
Message-ID: <20250528221823.2974653-3-joseph.kogut@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250528221823.2974653-1-joseph.kogut@gmail.com>
References: <174735136138.1544989.11909422896170025756.robh@kernel.org>
 <20250528221823.2974653-1-joseph.kogut@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add initial support for the Radxa Compute Module 5 (CM5).

Specification:
- Rockchip RK3588
- Up to 32 GB LPDDR4X
- Up to 128 GB eMMC
- 1x HDMI TX up to 8k@60 hz
- 1x eDP TX up to 4k@60 hz
- Gigabit Ethernet PHY

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 .../boot/dts/rockchip/rk3588s-radxa-cm5.dtsi  | 156 ++++++++++++++++++
 1 file changed, 156 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5.dtsi

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5.dtsi
new file mode 100644
index 000000000000..d7946fe2bb4e
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

