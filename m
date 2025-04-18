Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4D6269CE0;
	Fri, 18 Apr 2025 06:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744957881; cv=none; b=aoyJfJWxSWehscC4spaOWCJrhD+TWkEciKw/NxsXJwi0LVjKJYn1NQ4bQthUGCrbc6adus4dLcV+3vel/Lx1/Ay4IRendmZZ+c6U3YCtPiF/cOQkzb2rZT/12B1JoMKfaaM7/9MR6G3hk9kjuFy6yLpkjXeGS2R5KrT59PKnbMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744957881; c=relaxed/simple;
	bh=czEifRXtuXv/MScU5i3qsqJJSHlfcCJZD1A52T08nY0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bYuU9NPMmHbqxXzn0ipAn9lU0AbwNg4O/U5nR1yQa/gPkIVqf8H0i2XN/ylV2f2NXZfQgmmbRYUqCM6ChlxkQYkZEhhcotklVcbDIJWciXd7WxsYKKp1vii272F9G4wq/v3x6jqmlqahDxZ54P7lZSW+rqq8DYrosg6xRS7jpGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=T9+4b4s0; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="T9+4b4s0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=3OHF7VWnUsmRHKIb7G4FIttYmy5mYhiEGvrpZInhnF8=; b=T9+4b4s0o58bwqI9YJEZ5EYU84
	EXydDYA8Z6k/ae+242/xejMhvzZ38OlOuOywYMLUPx5bmVaojuN9KBbIRJs4lfRLm+AKsFD+bivYP
	YMf6I5dWhJ1mVAyzMEyMoj3ICkDoK6YpfyQyxfxbhPxYwHAcb4C15enPH0lKHZQC6SZNZicmMAku+
	elRYShI3b3kBWs8hXWc+o9njKdTPn+OQFkpPYAArI9MiWmXgIAf5zRt6xDr53/Vb2JCfV5QvdjG21
	J9DxlxX9xJnwNi/8bzbVewJVhBoVw9P+QrgntBGe9oTPjDKUvY8h3/LttAa4wcY2/qRd/fHmXPj9r
	dhxqaG+Q==;
Received: from [89.212.21.243] (port=56446 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u5fFt-00AbM0-03;
	Fri, 18 Apr 2025 08:31:16 +0200
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
Subject: [PATCH v3 11/15] arm64: dts: freescale: imx93-phyboard-segin: Add CAN support
Date: Fri, 18 Apr 2025 08:31:00 +0200
Message-Id: <20250418063104.2202085-12-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250418063104.2202085-1-primoz.fiser@norik.com>
References: <20250418063104.2202085-1-primoz.fiser@norik.com>
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v3:
- add Reviewed-by tag

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

