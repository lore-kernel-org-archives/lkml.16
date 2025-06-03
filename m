Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0746424BC1A;
	Tue,  3 Jun 2025 22:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748988885; cv=none; b=LTcDk+TnbR2bIyNj3UhimzU7DT2/3mGTAKxykH0SPeEtk4RXNloJoj79egczlSymoUAQq5K3RHhID5iaqqTO+89dVr26oODs+OlydmmcAoIaKFzHC65CuugZhoIn8c775fmwiqExdcOxPAPuUjfQpn0uanPG8IMuWjruQPXM/Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748988885; c=relaxed/simple;
	bh=xot+A+rklvBXet1Bsm8MIUc2wvIyDqpj0p5Oekge+mo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C5rmL5nqyXAHN2OQGjGZCoH5HlJwUQE+nB1f2I4HMzaHzKgGV5oWsXWMiquIsKHFLjze4ku/Dz1z5jvtkwh8GOzPI5wfwg9jttqJ91ajupSpeew0giFngohWKNbMvGTHsJa9/n92dwIg7JS5wJ1xc7Ugn/dEOTw/4dZpWyNQnu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fwskD/kM; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fwskD/kM"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45024721cbdso49312595e9.2;
        Tue, 03 Jun 2025 15:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748988882; x=1749593682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AasV4AhfzhQyQlDU4kMPcfNlkriRO1pkLB0grduEWyk=;
        b=fwskD/kMwL9AWaQ/eEAiVJdoq0PocnmyREh1Vs8L1dMBRDX1WWCCyvs1mtpk8mF//m
         BFMKUVWbsfxZ/l7npA/HgZgK3UQqPwuW0hMXSs0aV+rMp9RwzaIQlKcVU0KKu3rQHUFp
         3jGuDwYvZklWta5VG6Or7ZRO3ifpisyfgS9I+wWG3PtAwYbPUytisJZmuvJwdx2hUdpl
         T3qncDrQJ5yOCMc2gvGX2/zQCe/DFlSUjcjjqvV+FiUB41Zcs2/vhluFoGKdQln3cY9y
         OzYdpUdqAlY8DdSd+Kan8ionIJbgQIt4YSTKD25mPVfhffBnGnStQ4Ee5N+zb7gkA55Z
         o/EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748988882; x=1749593682;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AasV4AhfzhQyQlDU4kMPcfNlkriRO1pkLB0grduEWyk=;
        b=scdIOErA5nHpkPB8mSh9QFvM2DBl7ebWiF3R41HUFylEhHW92e/XUj/upJKwAX6A6C
         SLFg8Skdkj8UmYdw8Kr8oFgTWlEMlDv0Q02Z7hdHc5LMBnKW7dgk+/E8W7tXd0nvppyL
         dWEONtYmL/zE6SR9jUoi6Cx+7bWIqlPqiCrSJutVZUNCiTk8VeT8HSLSRcvFvpYrUwsA
         P1XZUItnhKyt28hvV+6BEZJ4YfJWyIkKoLuhrQDf9HYET06D1UWQkqWMJ7DeXyXe46dd
         PbNCqdnUgnKVngRLvrvN4l8QalxUzFdtg2TTgruC6dVHTGATubOJafuXgjREDM9TWjRd
         fjzA==
X-Forwarded-Encrypted: i=1; AJvYcCWxkmd09QdgocbUIissHkRQPF9BajnoOptl7MGrXHZUNmijuEfWYNXFMxhRPA3b16ASStZ86z4a2hlPpI4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJOSCZ7LE3IYMQy7aRbC+gLx5UOBLDArqCIYGHQ8e4UL3ckm/Y
	uSUT8Anv42+0jKodTOAYnTktdYzNf63/bR2kdzEgAPgFmTcVYW1zOLh4eyJCUuVd
X-Gm-Gg: ASbGncu0/Hlk/QxB3YkPcpJf0qYTX4BKHPlFYSRti+5IiIKXEmILPOIOCxl8m57de1/
	2UQTleswYQApCv8X9bX3e8qPChU0gC+R1vOd2/2XSYuvmhHGegXas2Nhvy+I1BUCr8cqdqX4Qpe
	qvU4FSsNHpo6/sJ/u6Y4QlFbwbe65Na40fGsYRiKcqeLjC5UVatsGk2Hcx8XdP3xEpwQmTgqw8L
	RsTuU9Vkm8cH0a0sLna6fMkBPisnWWgwrm2+dPiePfi4LoMfVU2GUtRc9wNVlpqgWtOuWuoocsu
	CK50Yz6lhbtk89LzX6KJMZiJr+VdsvNuP1kNKVKGyDxKwMxMpYPoqertwRaQshEklLSCulRRWxE
	Q6T1AvSU4wFsN39OZpTg/l8cHJiFh96tqsKh79vBOvwDPAQ8=
X-Google-Smtp-Source: AGHT+IGQNvReqdBMLwSisULLtaJXvRqZHVZBjcgTB3FTflxOyIo48suFe1T2k8yCJFnJA8gYjQjHew==
X-Received: by 2002:a05:600c:1e89:b0:44b:eb56:1d45 with SMTP id 5b1f17b1804b1-451f0aa7ff9mr3002575e9.15.1748988881667;
        Tue, 03 Jun 2025 15:14:41 -0700 (PDT)
Received: from Lord-Beerus.tastitalia.local (net-93-70-53-177.cust.vodafonedsl.it. [93.70.53.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7f8f1c6sm179832435e9.8.2025.06.03.15.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 15:14:41 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stefano.radaelli21@gmail.com,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [v1] arm64: dts: freescale: imx93-var-som: update eqos support for MaxLinear PHY
Date: Wed,  4 Jun 2025 00:14:15 +0200
Message-ID: <20250603221416.74523-1-stefano.radaelli21@gmail.com>
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
 .../boot/dts/freescale/imx93-var-som.dtsi     | 40 ++++++++++++-------
 1 file changed, 25 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
index 783938245e4f..402a28d0ed8d 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
@@ -19,19 +19,6 @@ mmc_pwrseq: mmc-pwrseq {
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
@@ -39,6 +26,7 @@ &eqos {
 	pinctrl-0 = <&pinctrl_eqos>;
 	phy-mode = "rgmii";
 	phy-handle = <&ethphy0>;
+	snps,clk-csr = <5>;
 	status = "okay";
 
 	mdio {
@@ -51,6 +39,27 @@ ethphy0: ethernet-phy@0 {
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
@@ -75,14 +84,15 @@ MX93_PAD_ENET1_RD0__ENET_QOS_RGMII_RD0			0x57e
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

