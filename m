Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB20121127D;
	Thu, 10 Apr 2025 09:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744275788; cv=none; b=FHVOtv9xLSPo2a7W527bNtUO0o+qw9CUWMcsdhPkd7jOd9eAKIpR/yIis/wHSnKTQR6g/37gfucHAtZJrbZlGgQi+HE9Xj6agWemyp9Ar5nueHBh84eUeHiXxH19Jmyqj35MemL+qA7u+LJZIXoDOUIUm8kvwi8a8d6FA3aqBj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744275788; c=relaxed/simple;
	bh=PA37M9pXkDMI+w3wqojDkq6hpl8ttS+pFUTk3+tZccY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QRPZRme/F80FnF5on93ZoLMW5kwo0U1ySgE/9IEdZjRty5lIMFNC6DbJl5bv+sHDMB/H2p7FC0+yn76NTiFQgiezV2tZZZakqxcFFOxjcEvF5YSzs2lqQeujMw+9B145U2QEFHIs0M432VQ9osi1SreZ6a2NRX4yXqQ7S3BSows=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=apt/Z0km; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="apt/Z0km"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=auMZjdpxCvKTX4lfbE8M58UMBkU5s6BuRcALq6wShSQ=; b=apt/Z0kmof7VIyQ53HOV9KOhtu
	4fdr3Dc5ZeX+Ccwbf2UoFV8odqT65BbMzcg3JKzdvqvukUQxasGmdgMlnDJBSxU34DkKkK9/XOgSc
	QoqSX8Oq0DuWyiUDFIQm614p+DWQV4ZUZOpg8SmTHVewu4v0Xp8ogUXPhjJlFmUNH8pJ6TK1+gXRo
	RJV+UuUZmzYVgkFLKoYDQbw/2uGaT+noVdq8ubRDI9pb/N0ofAMfLzarbk5JeD9iEtjhQgyJ+HsI0
	XVZAcWtOiLGVwfMVD1Yc27V2BAqe2aNGWNQ/tdRR+o5Z0tHfpoMuwO5tmrCU5AYPK/CoyVryh+JFP
	jYcFHVvw==;
Received: from [89.212.21.243] (port=41926 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u2noP-000Djj-39;
	Thu, 10 Apr 2025 11:03:05 +0200
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
Subject: [PATCH 09/13] arm64: dts: freescale: imx93-phyboard-segin: Add RTC support
Date: Thu, 10 Apr 2025 11:02:47 +0200
Message-Id: <20250410090251.1103979-10-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250410090251.1103979-1-primoz.fiser@norik.com>
References: <20250410090251.1103979-1-primoz.fiser@norik.com>
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

Add support for RTC clock connected via I2C on phyBOARD-Segin-i.MX93.
Make I2C RTC the default clock by configuring the aliases.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 .../dts/freescale/imx93-phyboard-segin.dts    | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
index 525f52789f8b..38b89398e646 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
@@ -17,6 +17,11 @@ /{
 	compatible = "phytec,imx93-phyboard-segin", "phytec,imx93-phycore-som",
 		     "fsl,imx93";
 
+	aliases {
+		rtc0 = &i2c_rtc;
+		rtc1 = &bbnsm_rtc;
+	};
+
 	chosen {
 		stdout-path = &lpuart1;
 	};
@@ -33,6 +38,24 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
 	};
 };
 
+/* I2C2 */
+&lpi2c2 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpi2c2>;
+	status = "okay";
+
+	/* RTC */
+	i2c_rtc: rtc@68 {
+		compatible = "microcrystal,rv4162";
+		reg = <0x68>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_rtc>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
 /* Console */
 &lpuart1 {
 	pinctrl-names = "default";
@@ -56,6 +79,13 @@ &usdhc2 {
 };
 
 &iomuxc {
+	pinctrl_lpi2c2: lpi2c2grp {
+		fsl,pins = <
+			MX93_PAD_I2C2_SCL__LPI2C2_SCL		0x40000b9e
+			MX93_PAD_I2C2_SDA__LPI2C2_SDA		0x40000b9e
+		>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			MX93_PAD_UART1_RXD__LPUART1_RX		0x31e
@@ -69,6 +99,12 @@ MX93_PAD_SD2_RESET_B__GPIO3_IO07	0x31e
 		>;
 	};
 
+	pinctrl_rtc: rtcgrp {
+		fsl,pins = <
+			MX93_PAD_ENET2_RD2__GPIO4_IO26		0x31e
+		>;
+	};
+
 	pinctrl_usdhc2_cd: usdhc2cdgrp {
 		fsl,pins = <
 			MX93_PAD_SD2_CD_B__GPIO3_IO00		0x31e
-- 
2.34.1

