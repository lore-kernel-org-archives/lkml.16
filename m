Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B402221FBC;
	Tue, 22 Apr 2025 10:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745319429; cv=none; b=uaP6vRNzSXIg2yk0ApPhoddHGkeeJnNOGtNFB3WAs6+skStY+P8vf0yTBKeWNa+7/HFUF/nUQjlpdMr51azUscaUAhcWGITdIV8V3Y4ozQlQUJaUgD0NGM4YO7Fu3uoAJOvsUx1OqR0FB9IbI0CpTsho93yi0cVmWVhybshH3EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745319429; c=relaxed/simple;
	bh=LxmglyXu4QUqIIMBksElwmI0m/qR/ym4qiKNKxHJgSQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YlgwMzgaM/LLDWQoOMwK9k+jKqTppbLUGy6XGxGmmG1xKKaxDUk/cwWvA9yP10Xw68h3IldcuaVPsfIR8q+TE7Cko3kH+C1RxW7cT97v+I7odhsbQFUjEWUXC6V8NLtf10e6yjaMH7YjTd2NH4nRdv083gOS4YRJot2AC9o+t64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=X5E8Mq7a; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="X5E8Mq7a"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=i5okm8uoPz+8WNSFkmNfoiYJAYCsIf58am62AWYoUyw=; b=X5E8Mq7afcyHhQKgIGA2GXj9Qt
	RheJEEAbda9R1ZUFqO5pzm2yJW4GJMsGceFyDKkjD++pA2ZxJJPdrbeVpCg2wKCR321UZhkJ6sPFd
	+MNAa7wHMT3r3LrHv2of71UGLB3hPmtAdMLmOdw3vpe2G9O2g3BcHwEnUQEOFuhlIOMHZ5SnEz7rl
	iuMAsYwZXzhJjMQ0g6YAfm/VQFuPSgrdNIygoEbj9deaGODvE7tawnG0Vv1GOzAcnTd40/Aspos5n
	TqComNi771UbvmTThdowtag21z6yBYhIjYju5DXKEEuCheKNHkC1Szv9+xUUujDJrFag0dhe4O2X1
	jTOpl3jg==;
Received: from [89.212.21.243] (port=36562 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u7BJI-008kyr-10;
	Tue, 22 Apr 2025 12:57:04 +0200
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
Subject: [PATCH v4 14/15] arm64: dts: freescale: imx93-phyboard-segin: Add EQOS Ethernet
Date: Tue, 22 Apr 2025 12:56:43 +0200
Message-Id: <20250422105644.2725168-15-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250422105644.2725168-1-primoz.fiser@norik.com>
References: <20250422105644.2725168-1-primoz.fiser@norik.com>
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

Add support for the carrier-board Micrel KSZ8081 Ethernet PHY. This is a
10/100Mbit PHY connected to the EQOS interface and shares MDIO bus with
the Ethernet PHY located on the SoM (FEC interface).

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v4:
- no changes

 .../dts/freescale/imx93-phyboard-segin.dts    | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
index 54e084e69706..c62cc06fad4b 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
@@ -89,6 +89,28 @@ dailink_master: simple-audio-card,codec {
 	};
 };
 
+/* Ethernet */
+&eqos {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_eqos>;
+	phy-mode = "rmii";
+	phy-handle = <&ethphy2>;
+	assigned-clock-parents = <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>,
+				 <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>;
+	assigned-clock-rates = <100000000>, <50000000>;
+	status = "okay";
+};
+
+&mdio {
+	ethphy2: ethernet-phy@2 {
+		compatible = "ethernet-phy-id0022.1561";
+		reg = <2>;
+		clocks = <&clk IMX93_CLK_ENET_REF_PHY>;
+		clock-names = "rmii-ref";
+		micrel,led-mode = <1>;
+	};
+};
+
 /* CAN */
 &flexcan1 {
 	pinctrl-names = "default";
@@ -173,6 +195,19 @@ &usdhc2 {
 };
 
 &iomuxc {
+	pinctrl_eqos: eqosgrp {
+		fsl,pins = <
+			MX93_PAD_ENET1_TD2__CCM_ENET_QOS_CLOCK_GENERATE_REF_CLK	0x4000050e
+			MX93_PAD_ENET1_RD0__ENET_QOS_RGMII_RD0		0x57e
+			MX93_PAD_ENET1_RD1__ENET_QOS_RGMII_RD1		0x57e
+			MX93_PAD_ENET1_TD0__ENET_QOS_RGMII_TD0		0x50e
+			MX93_PAD_ENET1_TD1__ENET_QOS_RGMII_TD1		0x50e
+			MX93_PAD_ENET1_RX_CTL__ENET_QOS_RGMII_RX_CTL	0x57e
+			MX93_PAD_ENET1_TX_CTL__ENET_QOS_RGMII_TX_CTL	0x50e
+			MX93_PAD_ENET1_RXC__ENET_QOS_RX_ER		0x57e
+		>;
+	};
+
 	pinctrl_flexcan1: flexcan1grp {
 		fsl,pins = <
 			MX93_PAD_PDM_BIT_STREAM0__CAN1_RX	0x139e
-- 
2.34.1

