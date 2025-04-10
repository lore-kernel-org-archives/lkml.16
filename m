Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E0726B95D;
	Thu, 10 Apr 2025 10:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744279208; cv=none; b=hb02d1KcCCGLy7g0jr18D8Ct/vthIi6O4wGBuNGw9pgw8X+LNybXJMxSuScLCrthHXu2N+0lGQG/jri0MH1EYRT6nONxc2e+hAv8PEpWCwI8rbkhgxUSWk568n4DeNzviWFfOpdfwhysvAbMh9WWVnB7CP6Pxqn+fZ+hcuWBU9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744279208; c=relaxed/simple;
	bh=Gz97Qoer89GiLdUWT49uLO4v0+FCcvUFBVeyl2AyT/Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BcuXDeqoKISQAoAfYoPCctZw3OsHWr3z2Owum3n40QskzWUf4MEA8FTN4EDQEMYjPsrxlupnBdjsJtRE9XsxIEc8h5FWKzz0ZsGBVzYG2TVPTVtL9TDExsTfmAb2albcX6umus0kE1DObxxCJLS1/PvVG/XVHTJ2EM/J640aU/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=DFmHEiJE; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="DFmHEiJE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=UUluvWeckUAyIMO0n90rKe4B0+Hl1W+NbGV3iYYSIyM=; b=DFmHEiJEdIa64ZOPI25T66lyOz
	fut4hhdpRI6AmW3u0pDmg3n+cyv5TvJSv2i4aOkbrnDfmXweowXwMNpIlKeEKodr3jOqC6aDqxbzo
	0BNbSyKwlRpcvKicHfolrFTMhYH5vgv3v3Sz50osPd3OV1+8H+fZB0XVBKQLhepum6ypsKla0X5cG
	hIgwXjmLZW9CqbnwEYD82LXuW9d49rV6Ex7DBQApmcEUIjeDkb9FMyi5wr9y/tSFNi+PBO1nNIRrl
	2Orweu2cYOhLtHS76H9UQ3N5jR4bvxgy2FSM/trWmRFtiHJgoAnPww1plRFOWWvhcHHS+WkID3OZf
	KPhpa0ew==;
Received: from [89.212.21.243] (port=41926 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u2noF-000Djj-13;
	Thu, 10 Apr 2025 11:02:54 +0200
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
Subject: [PATCH 04/13] arm64: dts: freescale: imx93-phycore-som: Enhance eMMC pinctrl
Date: Thu, 10 Apr 2025 11:02:42 +0200
Message-Id: <20250410090251.1103979-5-primoz.fiser@norik.com>
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

Improve eMMC on phyCORE-i.MX93 SOM by adding 100MHz and 200MHz pinctrl
modes. This enables to use eMMC at enhanced data rates (e.g. HS400).

While at it, apply a workaround for the i.MX93 chip errata ERR052021.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 .../boot/dts/freescale/imx93-phycore-som.dtsi | 57 +++++++++++++++----
 1 file changed, 47 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
index 82f680d891c2..3d84eed33074 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
@@ -166,8 +166,10 @@ eeprom@50 {
 
 /* eMMC */
 &usdhc1 {
-	pinctrl-names = "default";
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
 	pinctrl-0 = <&pinctrl_usdhc1>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
 	bus-width = <8>;
 	non-removable;
 	status = "okay";
@@ -213,18 +215,53 @@ MX93_PAD_ENET2_RD3__GPIO4_IO27		0x31e
 		>;
 	};
 
+	/* need to config the SION for data and cmd pad, refer to ERR052021 */
 	pinctrl_usdhc1: usdhc1grp {
 		fsl,pins = <
 			MX93_PAD_SD1_CLK__USDHC1_CLK		0x179e
-			MX93_PAD_SD1_CMD__USDHC1_CMD		0x1386
-			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x138e
-			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x1386
-			MX93_PAD_SD1_DATA2__USDHC1_DATA2	0x138e
-			MX93_PAD_SD1_DATA3__USDHC1_DATA3	0x1386
-			MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x1386
-			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x1386
-			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x1386
-			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x1386
+			MX93_PAD_SD1_CMD__USDHC1_CMD		0x40001386
+			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x4000138e
+			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x40001386
+			MX93_PAD_SD1_DATA2__USDHC1_DATA2	0x4000138e
+			MX93_PAD_SD1_DATA3__USDHC1_DATA3	0x40001386
+			MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x40001386
+			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x40001386
+			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x40001386
+			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x40001386
+			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x179e
+		>;
+	};
+
+	/* need to config the SION for data and cmd pad, refer to ERR052021 */
+	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
+		fsl,pins = <
+			MX93_PAD_SD1_CLK__USDHC1_CLK		0x17be
+			MX93_PAD_SD1_CMD__USDHC1_CMD		0x4000139e
+			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x4000138e
+			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x4000139e
+			MX93_PAD_SD1_DATA2__USDHC1_DATA2	0x400013be
+			MX93_PAD_SD1_DATA3__USDHC1_DATA3	0x4000139e
+			MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x4000139e
+			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x4000139e
+			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x4000139e
+			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x4000139e
+			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x179e
+		>;
+	};
+
+	/* need to config the SION for data and cmd pad, refer to ERR052021 */
+	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
+		fsl,pins = <
+			MX93_PAD_SD1_CLK__USDHC1_CLK		0x17be
+			MX93_PAD_SD1_CMD__USDHC1_CMD		0x4000139e
+			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x4000139e
+			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x400013be
+			MX93_PAD_SD1_DATA2__USDHC1_DATA2	0x400013be
+			MX93_PAD_SD1_DATA3__USDHC1_DATA3	0x400013be
+			MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x400013be
+			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x400013be
+			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x400013be
+			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x400013be
 			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x179e
 		>;
 	};
-- 
2.34.1

