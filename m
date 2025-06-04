Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4AE18A6DF;
	Wed,  4 Jun 2025 15:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749051406; cv=none; b=qrlJErJFdmT+k4C06ZDzfec8myZRb0qUkdP8lnGHdzK0iOdofQVvwuew74VUaqiBYajZJCr1WInKel2oVFo5I7kMROrkUFX2tvhjc1sJypP/kkc3EVLYzeI0PXzUmxAASXwPWscmQI87sruJAkf+b5dzOHYm2YNm6U4Y4ZdVi3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749051406; c=relaxed/simple;
	bh=VAVBXJfyud+eYn9s3sAYWNbfc3RcXs5f9i6EwU+Eguk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EpGaxnEUKI8yyXZ1x5IRYlL6uaZnW7ZU0rBI+JseJ0zWCGGO4QpnLy2XvEvvroe/OBw7sbpUqUK0iUQTNRVyedhYvfeDTs+9avY+tRFdsWGALQxTTj3WWAZqjV7pyCNyj7DWh5F2kVHIAUfIYbHsIMZGBYZhY3LTKNZgNpRjIcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gXBTY03Z; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gXBTY03Z"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-451e2f0d9c2so194305e9.1;
        Wed, 04 Jun 2025 08:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749051402; x=1749656202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=po4hRDSGCZuh9pjG/L2z6feCTEmaDMC+4+ptAw6xPXg=;
        b=gXBTY03ZWKa+yDVJZmToZ8R6mJBCzRI9GlR+wcgEcJmXAQ3LCzYAaldxgkX8j1yK/D
         XjNXXcXyOfnuYR/t5wuV44/4kxTH8R2knEgqNYYXJLLjYSJWoCPEYj329mXI37al9tqA
         C9OIAa7lcen8yCUJt9wGCr6/bpNN4ndT/0B8QPdKBp5klRG5Br62mHLXUatTjCiN4FjA
         LDkM86rhFkqt2YHsuAtKDTOwgDaYMbe50ZT3loIiktVFTEDnngodhZYQKGfZDT+FCBcA
         O573KwFa/sFp1vAS2NvlPPhik/yEIAG4MaiWY7B6IvnYLbSyQ21MSCG1PADki+/437zE
         /G2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749051402; x=1749656202;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=po4hRDSGCZuh9pjG/L2z6feCTEmaDMC+4+ptAw6xPXg=;
        b=baZFjT54vNrSUrPSXn587KGXOKAuPe7g2u4aRCq52CfFg5e7zCotmJtThIsVnnwO8g
         6+mWz1Zv+P96g19gnQxwrBQIgyHHLvjAoWkwS9OQf2AZ3OqPqxDeO7DYEwpxqtdGOKO0
         JUZaU5/04kn9aDt4PWp22tWE8RQqzyKTiZYepD7wOGHgwpbbLSslmQ8aKi4xK4eWMajZ
         YTfgIus0HDfslkyN8gcRtTv0Gt2HGlZz8cBTJuLIxf5SNN4KroOP95uo4KDBnhYWFhtZ
         qx+lnfmtJ8T4uM544foEW4RpG3/10UtkAgsOR5evSqxaoFQfInkzWPguXdXz6qOEc0Rp
         0quA==
X-Forwarded-Encrypted: i=1; AJvYcCX3xRIR+P0UCoknz9o1Adi15PVwrwxSCfscby0OWE0d80MGYctvaSwq0QHy9qSgDjQJdQbcRBr+yvXhdto=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOoBlgNnZ0tPn3XGJnDHYyOBGu924r8dD+jR9Gs4vp9dwjlFRh
	t7Kp5/sLU+mRYvLjWTcXhHqJaN4FQ++Cfx2AIK9wDHflQ2eAa/GHTd9p3Mk47j6k
X-Gm-Gg: ASbGncvmZP2f6BEo83CCc4mK0K3EjRRJWFyvWPMURvR/X5nCeX+wgwDPtiz4MAo4WjT
	h8KZSrhyoTMoW1nuOHd9laAdk41+JpTc8yb1yZR4JQP7jKnhXix1MfYzkhPeu+VvQn4PqaIMi43
	KP/bRxiIFvLeqfLua5jnBuAXNqD3BjkpUo9Ea/Tg/i3rA4kMCZx9Ijjeu4MouVNZ590PobjaD/M
	L+4FNpdMYTwfsEzkYTwJhMVWNnU4WvmOVSd3oz9Ihm4IJujoaEVRNxImLSLbytjYsYS5JvWSSui
	etNMedefLU5jxzbd8InMTXv9dtZi5nAn8Nd/+vnnjxG9MVBVaHEwfoK9AbTBCOnXOx7f8Mj4VPi
	2tXr7uiF5dqGGeMsugBEaVgIyEzDslIwOVdScJOvNDarFDQ==
X-Google-Smtp-Source: AGHT+IEiuiACGB5AsupJRC8pwPtzuBvDCDBA2W8wfZMmUi90dxJ20Ue6vRcyhVvfN7K/S5TF5w2O8g==
X-Received: by 2002:a05:600c:8b26:b0:43b:c6a7:ac60 with SMTP id 5b1f17b1804b1-451efe946acmr30208025e9.10.1749051401531;
        Wed, 04 Jun 2025 08:36:41 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-70-53-177.cust.vodafonedsl.it. [93.70.53.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d8012b09sm200711165e9.37.2025.06.04.08.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 08:36:41 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: othacehe@gnu.org,
	Stefano Radaelli <stefano.radaelli21@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [v2] arm64: dts: freescale: imx93-var-som: update eqos support for MaxLinear PHY
Date: Wed,  4 Jun 2025 17:35:09 +0200
Message-ID: <20250604153510.55689-1-stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Variscite has updated the Ethernet PHY on the VAR-SOM-MX93 from the
Murata CYW43353 to the MaxLinear MXL86110, as documented in the
August 2023 revision changelog.
Link: https://variwiki.com/index.php?title=VAR-SOM-MX93_rev_changelog

Update the device tree accordingly:
- Drop the unused regulator node previously used to power the Murata PHY.
- Add support for the reset line using GPIO1_IO07 with proper timings.
- Configure the PHY LEDs via the LED subsystem under /sys/class/leds/,
  leveraging the support implemented in the mxl86110 PHY driver
  (drivers/net/phy/mxl-86110.c).
  Two LEDs are defined to match the LED configuration on the Variscite
  VAR-SOM Carrier Boards:
    * LED@0: Yellow, netdev trigger.
    * LED@1: Green, netdev trigger.
- Adjust the RGMII clock pad control settings to match the updated PHY
  requirements.

These changes ensure proper PHY initialization and LED status indication
for the new MaxLinear MXL86110, improving board compatibility with the
latest hardware revision.

Signed-off-by: Stefano Radaelli <stefano.radaelli21@gmail.com>
---
v2:
  - Clarified the use of 'rgmii' mode by adding a comment in the DT,
    explaining that hardware delays are already implemented on the SOM PCB.

v1: https://lore.kernel.org/imx/20250603221416.74523-1-stefano.radaelli21@gmail.com/

 .../boot/dts/freescale/imx93-var-som.dtsi     | 45 ++++++++++++-------
 1 file changed, 30 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
index 783938245e4f..cea8d792328c 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
@@ -19,26 +19,19 @@ mmc_pwrseq: mmc-pwrseq {
 		reset-gpios = <&gpio4 14 GPIO_ACTIVE_LOW>,	/* WIFI_RESET */
 			      <&gpio3 7 GPIO_ACTIVE_LOW>;	/* WIFI_PWR_EN */
 	};
-
-	reg_eqos_phy: regulator-eqos-phy {
-		compatible = "regulator-fixed";
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_reg_eqos_phy>;
-		regulator-name = "eth_phy_pwr";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio1 7 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-		startup-delay-us = <100000>;
-		regulator-always-on;
-	};
 };
 
 &eqos {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_eqos>;
+	/*
+	 * The required RGMII TX and RX 2ns delays are implemented directly
+	 * in hardware via passive delay elements on the SOM PCB.
+	 * No delay configuration is needed in software via PHY driver.
+	 */
 	phy-mode = "rgmii";
 	phy-handle = <&ethphy0>;
+	snps,clk-csr = <5>;
 	status = "okay";
 
 	mdio {
@@ -51,6 +44,27 @@ ethphy0: ethernet-phy@0 {
 			compatible = "ethernet-phy-ieee802.3-c22";
 			reg = <0>;
 			eee-broken-1000t;
+			reset-gpios = <&gpio1 7 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <100000>;
+			leds {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				led@0 {
+					reg = <0>;
+					color = <LED_COLOR_ID_YELLOW>;
+					function = LED_FUNCTION_LAN;
+					linux,default-trigger = "netdev";
+				};
+
+				led@1 {
+					reg = <1>;
+					color = <LED_COLOR_ID_GREEN>;
+					function = LED_FUNCTION_LAN;
+					linux,default-trigger = "netdev";
+				};
+			};
 		};
 	};
 };
@@ -75,14 +89,15 @@ MX93_PAD_ENET1_RD0__ENET_QOS_RGMII_RD0			0x57e
 			MX93_PAD_ENET1_RD1__ENET_QOS_RGMII_RD1			0x57e
 			MX93_PAD_ENET1_RD2__ENET_QOS_RGMII_RD2			0x57e
 			MX93_PAD_ENET1_RD3__ENET_QOS_RGMII_RD3			0x57e
-			MX93_PAD_ENET1_RXC__CCM_ENET_QOS_CLOCK_GENERATE_RX_CLK	0x5fe
+			MX93_PAD_ENET1_RXC__CCM_ENET_QOS_CLOCK_GENERATE_RX_CLK	0x58e
 			MX93_PAD_ENET1_RX_CTL__ENET_QOS_RGMII_RX_CTL		0x57e
 			MX93_PAD_ENET1_TD0__ENET_QOS_RGMII_TD0			0x57e
 			MX93_PAD_ENET1_TD1__ENET_QOS_RGMII_TD1			0x57e
 			MX93_PAD_ENET1_TD2__ENET_QOS_RGMII_TD2			0x57e
 			MX93_PAD_ENET1_TD3__ENET_QOS_RGMII_TD3			0x57e
-			MX93_PAD_ENET1_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x5fe
+			MX93_PAD_ENET1_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x58e
 			MX93_PAD_ENET1_TX_CTL__ENET_QOS_RGMII_TX_CTL		0x57e
+			MX93_PAD_UART2_TXD__GPIO1_IO07				0x51e
 		>;
 	};
 

base-commit: a9dfb7db96f7bc1f30feae673aab7fdbfbc94e9c
prerequisite-patch-id: 2335ebcc90360b008c840e7edf7e34a595880edf
-- 
2.43.0

