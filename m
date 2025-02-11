Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3213250BF8;
	Tue, 11 Feb 2025 14:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739284446; cv=none; b=ftT55MieFy2/5gmE1HTXnosHQN+TLVsg2agagn0f3itadLYgtRaRCQyNIY3niMppO4ugl7GN4VmOXKwi3iJURtKYdc11kDEH7ZfChJqcSSZ4vp16YEw6Vo1PQ+KTet95RrlJSH5xxArLD/MmqYP1Lym9XYaEm5dSRr8/vw+Kg5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739284446; c=relaxed/simple;
	bh=UoZYGY1/CNTKkir6gRGx13md5BbvfRyVSNo4KoboVp4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZMbwEVX39dKT1C/K7v8XJvlE+roJs5v1/uGWwW0HDTGgQOtMlDRZh4XCejHxHxDKKonpCamVV1HliKPjtxJdw44jdgn0QRJqqkG2U2pCreViDO0V5YQ1jR07++Jde/3Cnny+N/aaAiRfHNuXSeOC/lT04Do/aER+Bf5RmXGIJmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=Oapr5mi+; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="Oapr5mi+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1739284445; x=1770820445;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UoZYGY1/CNTKkir6gRGx13md5BbvfRyVSNo4KoboVp4=;
  b=Oapr5mi+b6ygYSbsuiippemJynutLh8Nbt5D0vOiQnpCcBm8sUEjNRTe
   F1EA2BU0xV0sDCu7DYbyfKUhu1iAm0617GndjKRzlh64LXt+KmhfvgZiE
   y+Gupz0hZcg+MY9Pnr16v1JlNDf3eszfbog5Syx3VEYAivZEtomsVMf45
   6e1tKD8sChyswMDoCBo7Qq7tfDDa2tnVYgI3t4RnKFSby3WPyDsE+vhG6
   CUrGZwZA6V6jUzi0jn0eQmvYcIldiadXL0pxXUvAbIBaobc4ewbheslzS
   dSyvb8GrvGd66wfdn88notdKQnmx+4f/2mQQB4pz7DkoElFUpeUyi986D
   A==;
X-CSE-ConnectionGUID: 35UA5pLrQAmrHtJwTcQ8OA==
X-CSE-MsgGUID: sd0yBW3qQJiEvKv5khqFFA==
X-IronPort-AV: E=Sophos;i="6.13,277,1732604400"; 
   d="scan'208";a="37535231"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Feb 2025 07:33:57 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 11 Feb 2025 07:33:30 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 11 Feb 2025 07:33:28 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH 2/2] ARM: dts: microchip: sama7d65_curiosity: Add power monitor support
Date: Tue, 11 Feb 2025 16:33:02 +0200
Message-ID: <20250211143302.4102-3-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250211143302.4102-1-mihai.sain@microchip.com>
References: <20250211143302.4102-1-mihai.sain@microchip.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add PAC1934 support in order to monitor the board power consumption.
Device is connected on flexcom10 in twi mode.

[root@SAMA7D65 ~]$ awk -f pac1934.awk
VDD3V3   current: 146.173 mA, voltage: 3302.73 mV
VDDIODDR current: 62.1356 mA, voltage: 1353.96 mV
VDDCORE  current: 242.248 mA, voltage: 1204.36 mV
VDDCPU   current: 213.565 mA, voltage: 1303.05 mV

Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
---
 .../dts/microchip/at91-sama7d65_curiosity.dts | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
index 0f86360fb733..8d826ec4c66c 100644
--- a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
+++ b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
@@ -43,6 +43,52 @@ &uart6 {
 	status = "okay";
 };
 
+&flx10 {
+	atmel,flexcom-mode = <ATMEL_FLEXCOM_MODE_TWI>;
+	status = "okay";
+};
+
+&i2c10 {
+	dmas = <0>, <0>;
+	i2c-analog-filter;
+	i2c-digital-filter;
+	i2c-digital-filter-width-ns = <35>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c10_default>;
+	status = "okay";
+
+	power-monitor@10 {
+		compatible = "microchip,pac1934";
+		reg = <0x10>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		channel@1 {
+			reg = <0x1>;
+			shunt-resistor-micro-ohms = <47000>;
+			label = "VDD3V3";
+		};
+
+		channel@2 {
+			reg = <0x2>;
+			shunt-resistor-micro-ohms = <47000>;
+			label = "VDDIODDR";
+		};
+
+		channel@3 {
+			reg = <0x3>;
+			shunt-resistor-micro-ohms = <47000>;
+			label = "VDDCORE";
+		};
+
+		channel@4 {
+			reg = <0x4>;
+			shunt-resistor-micro-ohms = <47000>;
+			label = "VDDCPU";
+		};
+	};
+};
+
 &main_xtal {
 	clock-frequency = <24000000>;
 };
@@ -75,6 +121,12 @@ pinctrl_uart6_default: uart6-default {
 			 <PIN_PD19__FLEXCOM6_IO1>;
 		bias-disable;
 	};
+
+	pinctrl_i2c10_default: i2c10-default{
+		pinmux = <PIN_PB19__FLEXCOM10_IO1>,
+			 <PIN_PB20__FLEXCOM10_IO0>;
+		bias-pull-up;
+	};
 };
 
 &sdmmc1 {
-- 
2.48.1

