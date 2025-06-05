Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2740F1DFE12;
	Thu,  5 Jun 2025 08:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749113984; cv=none; b=cIGJBAc0x24tFvZt1htIiOUWwTbMaoVF8Ul2+II8Qfg6Pl+4uUDWggKf92QZnhYMwM5MtLixmMJZHIStgyMsP5mKQhtU3lEduGnqR2i4PzP7t7EOIkK909aJjMpYRyTTJcpgOUUrdJXbbUhFbghi2nLlDcEvQKqwkLRKmcwh+F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749113984; c=relaxed/simple;
	bh=1IQrU1iDuiWW/Hfm8bkjda3OSF3yBkVGdgW8iJKSHIg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dbq4oXK5DqZZO+auQPdHloyQNwLNNXq6iWNZ8cdBys/vn7w5kCeZVhl6QnjkBiOibom6y/S3gX69GrdaIzGBT0IWvH6oAjyL8zW6jhWsDZQFka+RUNiVarYDe6sl8fp2Uy7jdeybaRHmaqLsbQzndyCpYsd1Rf2RFoo4j4uqgdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UjGA85JP; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UjGA85JP"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a507e88b0aso697502f8f.1;
        Thu, 05 Jun 2025 01:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749113981; x=1749718781; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ogjVDhDiMnU/s3WI4h7hVLm4gcfXJF8zSM1Pe2+EESo=;
        b=UjGA85JPkVvWWdkjrDb/iMSaWXI2aAHfkzfZj0jdRnGoxUcG2ealUruOMoAsW9eRzN
         D6QmeenWcOgy9t/kIZXA+u0N3n79B3V7hY60JNbGZA3zeei3D5j/kIqWgdIpA8MdlpfO
         kF9J18I4aV0+EmFGi/+pHgdYmrxLvxAMxPJXRk0NKOkYGMcz0Rf8YPRkAPHiQ/4yhzRV
         hh2fMvkKNBj11Y5hrvY+m5aV8gXE37EbIPFf4ejRY4nXCRsW+iX1xuKhNhlgIdN3nluU
         cKvv5UQzVJfaDrNw+x2h5vpLunmQW3q8+YSzMB6F2JgEXvBz2pCQ9BmfpVdaQxn1Rd36
         uxWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749113981; x=1749718781;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ogjVDhDiMnU/s3WI4h7hVLm4gcfXJF8zSM1Pe2+EESo=;
        b=r7pcSGcUgASbaZWKdlmGqZ5w73efmimzcVy6nm4K9VI23YCD5W0I0RzdPrJNAvS7V8
         QiuTrrbJVeqdLxSmg0xoU9A/SF+j4ptnwtjpLknF1n49t/UIZZvIdQWZMF9j53Nsoho9
         /N0UYjMM4aZbQ04XVUeTKTNxVxpfqq8Lg42EKUGyQnu+aRviyzoRMDA19KZ/CM3Bunci
         pSL3fjKV5DfQc8aWzpqEEHnR7jUr19mjncrXv8S4xTpwssR179zr2dLmA+ujM/LrkDpF
         kaKYOoyMlOLYdlF8Fo061xsNX5n85/ofxIlYaFrM/yZpBrDIYYZ2EQQMYxckcKx7RdpO
         VXUg==
X-Forwarded-Encrypted: i=1; AJvYcCUxn4YeQTDkpU0j0YVSezrA5lLfSlgX6jey73YBD3gkrntbJIc0+kbaHFalWLsfgALUDZEYG80r4/T50Ig=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpYY/9o+2lZgqnncSMTCjHywU2kaP0rSvzS+SfDayvLpZDI6gj
	NccvNoLB5C6ech47e/3loUsSAV7YeKeqwApwHYTodygsdXqCoJ5TrO+Js1bXlwuT
X-Gm-Gg: ASbGncv+pW4a8No9Uz7qQxVsD+kNRs3V7GtT7NhDqX25ixLUemvZb2EP6kDe79leg9s
	ZnWBFT4WIkBc65CUff+9nO+m4s7QRzBopAnKRrIh14HKGEkvIvxST3FgcGTkaFsrbVzkTa91/+t
	kBQINMyDxS5F/i6tHOGMvjD/z4vnE5EiAsQH3PKFdIE+ivcbyG0nvL5UPeGy3t9ZzldtfdD7fTr
	i7bOZOeu7lGi3ESEVTcH9KQsbEz3z2n//U/IhA3ICAodHXN0Iv2RWX4ZD5DhT3IWPF6x8j5lh4H
	suQ+NjCxNnjKwExdWq6nTykWHm7z4/CVM4fQtuNqZnH7xWmIom5/jpD8yYi6G5B9Pq6T9U2u3H3
	jW2AeFhFk8zAf2wLxaLU1lwuG56g8+mZhUMU=
X-Google-Smtp-Source: AGHT+IEzo/+1PtqXUJzfqQ4rzJBMvCxovxZsMpL2szL116m7MitSuowtYBLWA/qIIb6W6jeKzOII8w==
X-Received: by 2002:adf:edc3:0:b0:3a5:2465:c0a4 with SMTP id ffacd0b85a97d-3a52465c359mr3054884f8f.20.1749113981006;
        Thu, 05 Jun 2025 01:59:41 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-70-53-177.cust.vodafonedsl.it. [93.70.53.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f00a00d4sm24281167f8f.92.2025.06.05.01.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 01:59:40 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: othacehe@gnu.org,
	andrew@lunn.ch,
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
Subject: [PATCH v3] arm64: dts: freescale: imx93-var-som: update eqos support for MaxLinear PHY
Date: Thu,  5 Jun 2025 10:59:04 +0200
Message-ID: <20250605085904.12199-1-stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Variscite has updated the Ethernet PHY on the VAR-SOM-MX93 from the
ADIN1300BCPZ to the MaxLinear MXL86110, as documented in the
August 2023 revision changelog.
Link: https://variwiki.com/index.php?title=VAR-SOM-MX93_rev_changelog

Update the device tree accordingly:
- Drop the regulator node used to power the previously PHY.
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
v3:
  - Add "PATCH" to subject line.
  - Fix wrong reference to previous PHY in commit message.

v2: https://lore.kernel.org/imx/20250604153510.55689-1-stefano.radaelli21@gmail.com/
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

