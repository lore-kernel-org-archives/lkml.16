Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F33422256E;
	Tue, 15 Apr 2025 04:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744691607; cv=none; b=S4VRVsQPpIS8SArNraGjn6lZS+5MRhRuiP/1LjGFelcW9f8oCJQ0TxYOJqJyPcbnDivez/ZLNC5NyaCUltD+Hnlk3kZnVxOKTL6q6kuErTBG7ckqzaltV3AS4iPUoi58y2LQ77oTFq1Poxy0bp1a839mWLs5izsUlE4HxzkzsMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744691607; c=relaxed/simple;
	bh=tIG8vwSuRloETWjN8KHStfV/v0IeQ/xpYwHXlWkA7hs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IV1jvFFSgRb0hMamHFCtUQzSiOfwAk7ORDX8RF3lowKP6lPDgLEz4gfHco2Uv9rGYmRx9IXGP/tmRMkGqZPEj47Mr3P3l64NWfzdu4lzSbWEMBbWQYTz+FoIEG0z5nBFTAKfkkFZ4PKL6rF+Lsv2ypLxdAygkfQ5jzUd07iGaPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Received: from [89.212.21.243] (port=52324 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u4XzA-00Gb4I-2N;
	Tue, 15 Apr 2025 06:33:23 +0200
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
Subject: [PATCH v2 11/15] arm64: dts: freescale: imx93-phyboard-segin: Add CAN support
Date: Tue, 15 Apr 2025 06:33:07 +0200
Message-Id: <20250415043311.3385835-12-primoz.fiser@norik.com>
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

Add support for CAN networking on phyBOARD-Segin-i.MX93 via the flexcan1
interface. The CAN PHY chip SN65HVD234D used on the board is compatible
with the TCAN1043 driver using the generic "can-transceiver-phy" and is
capable of up to 1Mbps data rate.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
Changes in v2:
- drop CAN regulator hack in favor or "can-transceiver-phy" mechanism
- reword commit message

 .../dts/freescale/imx93-phyboard-segin.dts    | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
index 38b89398e646..be9c0a436734 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
@@ -26,6 +26,15 @@ chosen {
 		stdout-path = &lpuart1;
 	};
 
+	flexcan1_tc: can-phy0 {
+		compatible = "ti,tcan1043";
+		#phy-cells = <0>;
+		max-bitrate = <1000000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_flexcan1_tc>;
+		enable-gpios = <&gpio4 16 GPIO_ACTIVE_HIGH>;
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2 {
 		compatible = "regulator-fixed";
 		enable-active-high;
@@ -38,6 +47,14 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
 	};
 };
 
+/* CAN */
+&flexcan1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexcan1>;
+	phys = <&flexcan1_tc>;
+	status = "okay";
+};
+
 /* I2C2 */
 &lpi2c2 {
 	clock-frequency = <400000>;
@@ -79,6 +96,19 @@ &usdhc2 {
 };
 
 &iomuxc {
+	pinctrl_flexcan1: flexcan1grp {
+		fsl,pins = <
+			MX93_PAD_PDM_BIT_STREAM0__CAN1_RX	0x139e
+			MX93_PAD_PDM_CLK__CAN1_TX		0x139e
+		>;
+	};
+
+	pinctrl_flexcan1_tc: flexcan1tcgrp {
+		fsl,pins = <
+			MX93_PAD_ENET2_TD3__GPIO4_IO16		0x31e
+		>;
+	};
+
 	pinctrl_lpi2c2: lpi2c2grp {
 		fsl,pins = <
 			MX93_PAD_I2C2_SCL__LPI2C2_SCL		0x40000b9e
-- 
2.34.1

