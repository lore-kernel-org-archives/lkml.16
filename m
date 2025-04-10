Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1D221128D;
	Thu, 10 Apr 2025 09:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744275788; cv=none; b=iFSvwc8E1s9kbSUIFIisdAeCnbBb5bcjQv1Ft8o2CEUALNlgW7C7fHx0cDwvAZhhp9UVAbNhn8wZs35RE6SkBXZiboeF+Nu3Umkwx7qkgEabaCBQ11rqcy6BKr81DOBhttVXi3t7SJvDTQYqn64H1EVJj82lKMwhgu8oyauAvZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744275788; c=relaxed/simple;
	bh=QhAoL6oiFIo6mZDLeclMvsqn/KQ2g/zZ7jdp+vEniNQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uUGiHE2jG2n6aiTWmcOMMhJ1AFqxBElfxWTYClaqeO+sSRocSrzzaudt4N1QVjD9twAId6Iqf7JCYAyKXcNayC1CtwNjr8+CNYYzOGTUK/lWdzOcjZxu88tJ/JxFw1u055r/kOSnk0e331qNolShfaqmkqUEpnLY3KxveSMRu8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=hOz2zvqz; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="hOz2zvqz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=VsLwM3GjTE+cMq4utkZa1cXt/uI0yHj5dF2fek5gyAo=; b=hOz2zvqzENUnd8oPe5Fc0bmLuX
	h+jhxH5j9PfCxGmubSZjFAoigq+2E+uZLw73K6BT2cMIxyEmlEgb9zoDvQcKFbzpET78ykC4yufnY
	QjQjrwYOMci1kSRCUZdGiv2Z0yB/dIX56hJiM+6Er0MieHEJ0Or3ypLbh3DXOtnXqFMrkgS4OAfB6
	bS5qMUKiAdeQoD1SHfhIsNDgt/NfAElpoZ9sYOvqGzdseXRKBDwZLft3/iCr86dYDrYhGHuAjmKks
	owe9He2yFHP9x7Db0DodwpjUo5AqBEdrOSjK0hg2SszqxM0Io3CcK308VfXw+w2u9NmM7vevYF/J9
	NTE4rbPw==;
Received: from [89.212.21.243] (port=41926 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u2noQ-000Djj-0G;
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
Subject: [PATCH 10/13] arm64: dts: freescale: imx93-phyboard-segin: Add CAN support
Date: Thu, 10 Apr 2025 11:02:48 +0200
Message-Id: <20250410090251.1103979-11-primoz.fiser@norik.com>
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

Add support for CAN networking on phyBOARD-Segin-i.MX93 via the flexcan1
interface. The CAN1_EN regulator enables the SN65HVD234 CAN transceiver
chip.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 .../dts/freescale/imx93-phyboard-segin.dts    | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
index 38b89398e646..027a34dbaf04 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
@@ -26,6 +26,17 @@ chosen {
 		stdout-path = &lpuart1;
 	};
 
+	reg_flexcan1_en: regulator-flexcan1-en {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio4 16 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_reg_flexcan1_en>;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "CAN1_EN";
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2 {
 		compatible = "regulator-fixed";
 		enable-active-high;
@@ -38,6 +49,14 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
 	};
 };
 
+/* CAN */
+&flexcan1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexcan1>;
+	xceiver-supply = <&reg_flexcan1_en>;
+	status = "okay";
+};
+
 /* I2C2 */
 &lpi2c2 {
 	clock-frequency = <400000>;
@@ -79,6 +98,19 @@ &usdhc2 {
 };
 
 &iomuxc {
+	pinctrl_flexcan1: flexcan1grp {
+		fsl,pins = <
+			MX93_PAD_PDM_BIT_STREAM0__CAN1_RX	0x139e
+			MX93_PAD_PDM_CLK__CAN1_TX		0x139e
+		>;
+	};
+
+	pinctrl_reg_flexcan1_en: regflexcan1engrp {
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

