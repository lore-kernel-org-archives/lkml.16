Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F3D1FF5F9;
	Mon,  9 Jun 2025 16:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749485469; cv=none; b=mpX+u+IbmEVkj6GvG2/EuJjCCkoqWhXNMcDol2mYgyKGc8nkjbniQY7KWaosj0DcbBoThZr7djrLy+/GMHsT3yj4cnD536+91k6hY6nmhgmdhuurxRIVojRk2NbUvJjGQuKjfben3Zevx+dW/6ClF7J3V0onmbpZgDwch506PVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749485469; c=relaxed/simple;
	bh=wiyfyKZkAvjiIH0sQ6CKhOpwqQ5AbUsck26jxZvg1i0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iVuo1nUtl0Bs3zPVqaZH8kuEqGddYNW1Ehmmsnjukhea5YHuh1Nmx+fpWym3uqHM9v080/wvFOxCkkSsD+d4+ffB29ZTGWJ6DlY/1cA+10bj3UUJZQWJrVnk434l5BwNVV853HG/6xLAg3Vg0dcEkAgKADalNoxyPmLyzjWU8gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fHy3Evux; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fHy3Evux"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-450cf2291bbso16536685e9.0;
        Mon, 09 Jun 2025 09:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749485466; x=1750090266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TzSqzq1VrgA990PGl630TsjWDpOUagJtIkeks6UeTe4=;
        b=fHy3Evuxlscp3e+u7wd78nhRFt8XSiEjJlhwNx+glY0T6dHNZmXvNPdfy1xFWA5jdL
         lajsVrFTbc6QmzRxcjg8XnF69/RY6LAS8c2fjWYYzx/0cJC1wlfQDI+ajXZtsleooB+6
         rfrU+rM/XfH7/H53QWXfAT2D9+XcDE9/QKy9JCsvLsX3zWPahpS2hM0pyZXTZqazw0bO
         Md2g7UPHX32SaSEFKpLDg1+xR+9uTtZJbqvzVQ0Px/rTQGcIwNvrE2fjtQC92SIFPhfW
         5Sd1OwwEj4ECv8k4SVvJoBFaP1VlNp4GRdNYPoNGJtmogEq/3GIKzKtibwYRu8xvEVYw
         EQxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749485466; x=1750090266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TzSqzq1VrgA990PGl630TsjWDpOUagJtIkeks6UeTe4=;
        b=ZoXV3D5eBbrCesn1swZZsN2gReDEvQAt8DOQ4DLyK36oKSE1kK/+sE/1Y4kAb0TiEg
         HViWTb8+10sQikprUbKqypho0k98tfB0SSvBmWWxsDE+QvDe6fszvfSqCEckafWoMP2P
         XCRsse0ji3OwHhu8/qhTR9gvr0DsUvHyBDa5+WW25fc/xdU8qNqC/+OUssV3YUTMkHYl
         +MpecZlqAAsl9cWOFSvVy0fnNJf6gqJGD3veNC5xMRVlt0AqriyQk7D7ocmmHX4gCMed
         xgMYItZ4KqHoU72RvQkHZ9TUMno3+fYhZQe6uhCm5RIOoNrokZ9YWS3LOFWW8gHQWfYh
         yD5g==
X-Forwarded-Encrypted: i=1; AJvYcCW8xeFGx0nwFPgzTNYoG6r3LJiYHlHyLBUrrxUTtF9cIK2tRHMcIxn6rqfA1dnTk4XFm3uigvVJ0DhGpfg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiD59BI3t+YAWcgtpHeq7yVhwqutOPGCxRyDizz3VlinJspc1F
	w7X3sdMUWv/l7kRf585rItXFtDWbze0rcHZlLKqGkSFFkCQoHfRbiBf9fKR4+wBx
X-Gm-Gg: ASbGncvD1gSkix+ucO2mIU6TWm16hpduk57ULEX9G6npkwuF6HX6wvIxxdEUjNYWqED
	9bn4BEkjPX+axjQ3FmcK613Xg/eMkHLSO0lgrLOzsZtEyuv+sPJiMK0YmUnGlTsvj8OMGUxZ81a
	5dVxcWONK/c/Yey5AKlD7F5oFomO7ZhEhqSPJk4uHqlNVS5fc8SAJCvovCvbOcF1d2WPD0cAYbu
	6xAEJZfsRD//OGr9snG6/g2UDCSF+KEt6L6n0PiLI1bY5SrKOSLL6oYcxy+AnkHomai1wsMI2ZL
	zXmxc8YP93dUP6+tvxuLSbNlKZ1h7RbN82aTHcfzMXfN3RsLeDx+iwFgAdxYH13Avu1oPK9G5DG
	DGxqhSVOSAmuMjm3SyXoP3GIwMZUaUOi+7xLqMspyv85RuQ==
X-Google-Smtp-Source: AGHT+IHtIAm+CgeogJ80QF3mkNurNdrFEg3E5GnfvWjyLoDvXRNtPRfHKHTN4qOmq57RWOY/L62rDQ==
X-Received: by 2002:a05:600c:4e09:b0:442:c993:6f94 with SMTP id 5b1f17b1804b1-452013510famr130923885e9.12.1749485465033;
        Mon, 09 Jun 2025 09:11:05 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-70-53-177.cust.vodafonedsl.it. [93.70.53.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45209bc6d3esm115098115e9.6.2025.06.09.09.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 09:11:04 -0700 (PDT)
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
Subject: [PATCH v2] arm64: dts: freescale: imx8mp-var-som: Add EQoS support with MaxLinear PHY
Date: Mon,  9 Jun 2025 18:09:48 +0200
Message-ID: <20250609160949.35654-1-stefano.radaelli21@gmail.com>
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
v2:
  - Removed 'eee' properties.

v1: https://lore.kernel.org/imx/20250609140643.26270-1-stefano.radaelli21@gmail.com/

 .../boot/dts/freescale/imx8mp-var-som.dtsi    | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
index b59da91fdd04..29f080904482 100644
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
@@ -73,6 +91,53 @@ &A53_3 {
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
+			reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <100000>;
+			vddio-supply = <&reg_phy_vddio>;
+
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
@@ -239,6 +304,27 @@ &wdog1 {
 
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

