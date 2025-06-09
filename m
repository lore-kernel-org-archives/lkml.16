Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33221547D2;
	Mon,  9 Jun 2025 14:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749478049; cv=none; b=U4N2OAjI2Y/HbIopfTZ1xH7hHVP3n2EPbb5NzJ6xH6Zpyk6tJMeyI2OHkg1Ts19ecJIxdnAz5fIWArEPfFXAvaPk48YNK/QZZ170QyWyw3UEO/x1xHrjIAs9G+eusIR3uWin7B1NW/xFNo8+3Q6JY3mas/XkAd5SN7Kmpq44R60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749478049; c=relaxed/simple;
	bh=wAAJY/HrK/nuKtAaod/22OhduwbiOhuK1jiKS/alY2U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LgF+IQxZeV7pzF8CHIqjTE4JOeQsuDpT+U7H/E73KhOutcoMWT3B7mZWVpjcvrI03y3o+n0s37jTTfxOXASmCHHQYQgKKgzWNiwBlitglLb/HCBt9+R5lxt2VTVVnC/RGdoNIwtr72DgoSKXq5kp0TaLDw9HAGvbiUFW/bvmdhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TTjl0zAZ; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TTjl0zAZ"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a50956e5d3so3628336f8f.1;
        Mon, 09 Jun 2025 07:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749478046; x=1750082846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wp465GBd29bhYSADM6T0VGSuzx4l+sqGwpURc4OujX4=;
        b=TTjl0zAZKkCDAs6YO47kAl569t1b7RnhXlM3cqYZ8NqThu7ysKACbHM54pd4uhgLMs
         RjiJl6gahVeLgARev80xjSXZYAZUsZczNQl0kGmlZtdLaK8hdio1Haif5ml8fDJfCI08
         l45/HwvcgO9/KZJ2vnCh8MKDEMPwux5hRqjsDVrVnhGBTuyY3GPhIwZ3V2sZDn3EkdEE
         uJbZ2xoYgjW/iMZqfPMylkGfiofGv703jfAn5lD9y+t3nxztrH/HzwliVEuiwiAv7rxw
         /S5G9lqiiJnwvCOANKyH34YudyqfD3e8BYUBEfQp1KDJUbU3+WiBqPSm9t/ql/URzWj5
         w3VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749478046; x=1750082846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wp465GBd29bhYSADM6T0VGSuzx4l+sqGwpURc4OujX4=;
        b=Qbjqdo3hEdNfPa8kVUbbAEmrcOh8GOFUgG6pJO70RyV2K/Zib1cUnlDnBP12Gsgvk8
         e89vqbYCuqvz3x5EIg+dR9ctvLS6VF9ThGUMQQ1m/Gj9/pQNojhuN2NE/mNB8Bqpo0uq
         J5TayiFxCAuPi+ZJtopPRFnh2RKpFauDZtB8f5ffHXL+BWUulP0FRYPbGIEpXLCXpWUv
         HZ0QcHxYf+DKjwJ2jcRBuHwflHzP3pPH7Zub4fwusNqhrcim9Qhe5Sld+Z1dbac6drBG
         jyv5lm2woarajvfmkM0aqGB3tUKzt9Kk+/v4F3OWbdYqXSjqJVrwcfw2S40epIvwazJI
         HuEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUV5jMPznKGVA124rKnbvYl92E50mwfZrOVV5AKHAuAO9tzowhimYaFJY5jSjOm3MBbW0pVaNUtdTZwUng=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/HSy83FTTf0/ZuQSmuvv7wj6zFSYlTseQSTl3mVBHMADrjUDY
	13wHWhzHgmKmiHj2WnSIDI5QBX6AN+ihcJJ11tl65y49HDm9WwlTw/DNsrs2pYH/
X-Gm-Gg: ASbGncvbqauxxMh0RbZ990JXy//qf5mLU0WEvNT9/0PtShtxo4sc6jtG/HDKQar/Qf1
	OHuToKQGC1AFik6MEOFeR+ZDOj4rR2modtgZ2Q1FGqje5QZFlGDOCnAcQJfyoQFWhed6fsEAN2E
	i319s8rZom/KtsZodDuYh0FkVI3HGPnI80H+mKe1EKq5kbyHVTze2SCcg6e0H1ctSXT9MhJqS3n
	vQVL7uy7VdXfHkdYkGgyqaoaet+M3+QUqyIpFXbNG9l60GW/RyV/Ic1eu5C8EEDP/a6k7kXPFeo
	tobG1NgGQ9kXdzYSRIEjZQm246XaOKefoJ5Nw1WDM2keqQHQGIYMazkyljdvYIct8jmyaDJAQjG
	JINugHlPYZPfYKG02Axa3t2VHrP4spGRYgkQ=
X-Google-Smtp-Source: AGHT+IG0REgGH1fHd+dkuiR3Fo6WREiMEfAZe6OZVVichjBI/5GBIj0dx+h9EBokmXQjt5fQUEHrXA==
X-Received: by 2002:a05:6000:401e:b0:3a4:fb33:85ce with SMTP id ffacd0b85a97d-3a531caf7f1mr11598279f8f.46.1749478045626;
        Mon, 09 Jun 2025 07:07:25 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-70-53-177.cust.vodafonedsl.it. [93.70.53.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229d9e9sm9803060f8f.13.2025.06.09.07.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 07:07:25 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: andrew@lunn.ch,
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
Subject: [PATCH v1] arm64: dts: freescale: imx8mp-var-som: Add EQoS support with MaxLinear PHY
Date: Mon,  9 Jun 2025 16:06:42 +0200
Message-ID: <20250609140643.26270-1-stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the EQoS Ethernet controller on the i.MX8MP VAR-SOM with the
integrated Maxlinear MXL86110 PHY. The PHY is connected to the EQOS
MDIO bus at address 4.

This patch adds:
- EQOS controller configuration with RGMII interface.
- Proper reset timings.
- PHY power supply regulators.
- RGMII pinmux configuration for all data, control and clock signals.
- LED configuration for link status indication via the LED subsystem
  under /sys/class/leds/, leveraging the support implemented in the.
  mxl86110 PHY driver (drivers/net/phy/mxl-86110.c).
  Two LEDs are defined to match the LED configuration on the Variscite
  VAR-SOM Carrier Boards:
    * LED@0: Yellow, netdev trigger.
    * LED@1: Green, netdev trigger.

The RGMII TX/RX delays are implemented in SOM via PCB passive
delays, so no software delay configuration is required.

Signed-off-by: Stefano Radaelli <stefano.radaelli21@gmail.com>
---
 .../boot/dts/freescale/imx8mp-var-som.dtsi    | 87 +++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
index b59da91fdd04..3be59692849f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
@@ -55,6 +55,24 @@ reg_usdhc2_vqmmc: regulator-usdhc2-vqmmc {
 		states = <3300000 0x0 1800000 0x1>;
 		vin-supply = <&ldo5>;
 	};
+
+	reg_phy_supply: regulator-phy-supply {
+		compatible = "regulator-fixed";
+		regulator-name = "phy-supply";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-enable-ramp-delay = <20000>;
+		gpio = <&gpio2 20 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	reg_phy_vddio: regulator-phy-vddio {
+		compatible = "regulator-fixed";
+		regulator-name = "vddio-1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
 };
 
 &A53_0 {
@@ -73,6 +91,54 @@ &A53_3 {
 	cpu-supply = <&buck2>;
 };
 
+&eqos {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_eqos>;
+	/*
+	 * The required RGMII TX and RX 2ns delays are implemented directly
+	 * in hardware via passive delay elements on the SOM PCB.
+	 * No delay configuration is needed in software via PHY driver.
+	 */
+	phy-mode = "rgmii";
+	phy-handle = <&ethphy0>;
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy0: ethernet-phy@4 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <4>;
+			at803x,eee-disabled;
+			eee-broken-1000t;
+			reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <100000>;
+			vddio-supply = <&reg_phy_vddio>;
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
+		};
+	};
+};
+
 &i2c1 {
 	clock-frequency = <400000>;
 	pinctrl-names = "default";
@@ -239,6 +305,27 @@ &wdog1 {
 
 &iomuxc {
 
+	pinctrl_eqos: eqosgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ENET_MDC__ENET_QOS_MDC				0x2
+			MX8MP_IOMUXC_ENET_MDIO__ENET_QOS_MDIO				0x2
+			MX8MP_IOMUXC_ENET_RD0__ENET_QOS_RGMII_RD0			0x90
+			MX8MP_IOMUXC_ENET_RD1__ENET_QOS_RGMII_RD1			0x90
+			MX8MP_IOMUXC_ENET_RD2__ENET_QOS_RGMII_RD2			0x90
+			MX8MP_IOMUXC_ENET_RD3__ENET_QOS_RGMII_RD3			0x90
+			MX8MP_IOMUXC_ENET_RXC__CCM_ENET_QOS_CLOCK_GENERATE_RX_CLK	0x90
+			MX8MP_IOMUXC_ENET_RX_CTL__ENET_QOS_RGMII_RX_CTL			0x90
+			MX8MP_IOMUXC_ENET_TD0__ENET_QOS_RGMII_TD0			0x16
+			MX8MP_IOMUXC_ENET_TD1__ENET_QOS_RGMII_TD1			0x16
+			MX8MP_IOMUXC_ENET_TD2__ENET_QOS_RGMII_TD2			0x16
+			MX8MP_IOMUXC_ENET_TD3__ENET_QOS_RGMII_TD3			0x16
+			MX8MP_IOMUXC_ENET_TX_CTL__ENET_QOS_RGMII_TX_CTL			0x16
+			MX8MP_IOMUXC_ENET_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x16
+			MX8MP_IOMUXC_SD2_WP__GPIO2_IO20					0x10
+			MX8MP_IOMUXC_GPIO1_IO10__GPIO1_IO10				0x150
+		>;
+	};
+
 	pinctrl_i2c1: i2c1grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_SD1_DATA4__I2C1_SCL				0x400001c2

base-commit: e271ed52b344ac02d4581286961d0c40acc54c03
prerequisite-patch-id: 2335ebcc90360b008c840e7edf7e34a595880edf
-- 
2.43.0

