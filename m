Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B4322FF39;
	Tue, 15 Apr 2025 04:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744691612; cv=none; b=O7j4MN99pxmYK5aD8SkAbhV++ThyKXJVHQDS7NRmHEZaBagWQjdtCv9AxqsOdqTU+j1snIFixgyes2/8R4saPYEbJMpscFsJzVGlSSgGSGN+rFTYUB7R0RCgY6ztMoEBRj4yZrLbKOvcSLnTiv4XbjeH3qFU67SNZyvG7RltcVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744691612; c=relaxed/simple;
	bh=0vZ2tcPq+9PMQbyLZX0F3s2gsYWhzDniuU6+g1McWyY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MrJ/QmwLi6tx2KpngftZaDry6dXgt3VDEoO6YhH2ni9Lzc2CO41O7hiIX4GssKRsOuX5dWiQ9VPXr2kL75aRX958gh3PA2aTsK/I7yV2IYrIzyzFQr/AbPwBbWJSk3dAn6GjenoP+5g2AUhAdndD0iqxXV47b6UaL+Z/6+xR1M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Received: from [89.212.21.243] (port=52324 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u4XzF-00Gb4I-2v;
	Tue, 15 Apr 2025 06:33:29 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH v2 13/15] arm64: dts: freescale: imx93-phyboard-segin: Add I2S audio
Date: Tue, 15 Apr 2025 06:33:09 +0200
Message-Id: <20250415043311.3385835-14-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250415043311.3385835-1-primoz.fiser@norik.com>
References: <20250415043311.3385835-1-primoz.fiser@norik.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Add support for I2S audio found on phyBOARD-Segin-i.MX93. Audio codec
TLV320AIC3007 is connected to SAI1 interface as a DAI master. MCLK is
provided from the SAI's internal audio PLL (19.2 MHz).

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v2:
- add Reviewed-by tag
- remove empty line

 .../dts/freescale/imx93-phyboard-segin.dts    | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
index e4f959f665b2..54e084e69706 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
@@ -35,6 +35,20 @@ flexcan1_tc: can-phy0 {
 		enable-gpios = <&gpio4 16 GPIO_ACTIVE_HIGH>;
 	};
 
+	reg_sound_1v8: regulator-sound-1v8 {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <1800000>;
+		regulator-name = "VCC1V8_AUDIO";
+	};
+
+	reg_sound_3v3: regulator-sound-3v3 {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "VCC3V3_ANALOG";
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2 {
 		compatible = "regulator-fixed";
 		enable-active-high;
@@ -45,6 +59,34 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
 		regulator-max-microvolt = <3300000>;
 		regulator-name = "VCC_SD";
 	};
+
+	sound: sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "phyBOARD-Segin-TLV320AIC3007";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,bitclock-master = <&dailink_master>;
+		simple-audio-card,frame-master = <&dailink_master>;
+		simple-audio-card,widgets =
+			"Line", "Line In",
+			"Line", "Line Out",
+			"Speaker", "Speaker";
+		simple-audio-card,routing =
+			"Line Out", "LLOUT",
+			"Line Out", "RLOUT",
+			"Speaker", "SPOP",
+			"Speaker", "SPOM",
+			"LINE1L", "Line In",
+			"LINE1R", "Line In";
+
+		simple-audio-card,cpu {
+			sound-dai = <&sai1>;
+		};
+
+		dailink_master: simple-audio-card,codec {
+			sound-dai = <&audio_codec>;
+			clocks = <&clk IMX93_CLK_SAI1>;
+		};
+	};
 };
 
 /* CAN */
@@ -62,6 +104,17 @@ &lpi2c2 {
 	pinctrl-0 = <&pinctrl_lpi2c2>;
 	status = "okay";
 
+	/* Codec */
+	audio_codec: audio-codec@18 {
+		compatible = "ti,tlv320aic3007";
+		reg = <0x18>;
+		#sound-dai-cells = <0>;
+		AVDD-supply = <&reg_sound_3v3>;
+		IOVDD-supply = <&reg_sound_3v3>;
+		DRVDD-supply = <&reg_sound_3v3>;
+		DVDD-supply = <&reg_sound_1v8>;
+	};
+
 	/* RTC */
 	i2c_rtc: rtc@68 {
 		compatible = "microcrystal,rv4162";
@@ -80,6 +133,17 @@ &lpuart1 {
 	status = "okay";
 };
 
+/* Audio */
+&sai1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai1>;
+	assigned-clocks = <&clk IMX93_CLK_SAI1>;
+	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
+	assigned-clock-rates = <19200000>;
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
 /* USB  */
 &usbotg1 {
 	disable-over-current;
@@ -148,6 +212,16 @@ MX93_PAD_ENET2_RD2__GPIO4_IO26		0x31e
 		>;
 	};
 
+	pinctrl_sai1: sai1grp {
+		fsl,pins = <
+			MX93_PAD_UART2_RXD__SAI1_MCLK		0x1202
+			MX93_PAD_SAI1_TXFS__SAI1_TX_SYNC	0x1202
+			MX93_PAD_SAI1_TXC__SAI1_TX_BCLK		0x1202
+			MX93_PAD_SAI1_TXD0__SAI1_TX_DATA00	0x1402
+			MX93_PAD_SAI1_RXD0__SAI1_RX_DATA00	0x1402
+		>;
+	};
+
 	pinctrl_usdhc2_cd: usdhc2cdgrp {
 		fsl,pins = <
 			MX93_PAD_SD2_CD_B__GPIO3_IO00		0x31e
-- 
2.34.1

