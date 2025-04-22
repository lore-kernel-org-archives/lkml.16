Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B37E21D00D;
	Tue, 22 Apr 2025 10:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745319427; cv=none; b=sTSNTR39vW7hq/Ibevc0nznDOm5iN9MElp0RAwHuFylQyhosOaxHHax55OGQrDwekashHC32wgzVAO+NIpDhJcgvnintHszQqmUef6eeVw5CP3qSLp2sVa4dL9SIw1oZuBURmn/JMv/OjuCOk2/AHFKWpzJfauyN9iBK+zqiCjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745319427; c=relaxed/simple;
	bh=wtiMc4Tm9dYz2cnN7DXp5buNVR+ck7DtpAKgUAa6iCY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZtCmvZii0XP44njMTIAOr6foTEC/0/sEe+XzsSmugcrFEaE5cH/iJIiYPuVy+JKZ6RMJ6R19eMdDI9iMo66U8PpcRcD2lVYDVNdHLhA0mJ+OG8WocR5D/q0ZZ+6KgeHuGuAjsS2gt6NCy+EIwXBN2tu3Ok/7bmOioN43I412qyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=H0DcErfm; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="H0DcErfm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ydYFm/FUsFx5X9T7/U5z2I68LQJOkf4oPfk8ZkMTUdE=; b=H0DcErfmkzi63zHbzFn7LE1CrN
	BqJzK0jntvcuh7f8NILx61Bthlyx68PiyKtSzzyB+U6nCwnlcHNPmq/hZZ2PB6tzIFQSj+SHfR4VD
	mG83HTTht7Dgrtq1t9yiaG4KoHszMQJrTTaiB1x7GsjBm49v7Iv2oV+VSTSMnHr6OZIv3vSCD2j61
	iWqjbTLqj81xMGbsQcCiyKKRR1gRZFxU/U2MgwIB6Z+p4vUNoryvyz1ZXtGRtzhFsIqlerhXdU6pG
	aDLh7y/5qDJPyh3QMYaHGoVKm4XQyDY5d9szHTDTaLEGERpdzPecYscSytrjWzWStx2aqz2k0Zj3F
	v/iZ8pnw==;
Received: from [89.212.21.243] (port=36562 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u7BJD-008kyr-0E;
	Tue, 22 Apr 2025 12:56:59 +0200
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
Subject: [PATCH v4 12/15] arm64: dts: freescale: imx93-phyboard-segin: Add USB support
Date: Tue, 22 Apr 2025 12:56:41 +0200
Message-Id: <20250422105644.2725168-13-primoz.fiser@norik.com>
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

Add support for both USB controllers. Set first controller in OTG mode
(USB micro-AB connector X8) and the second one in host mode (USB type A
connector X7) by default.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v4:
- no changes

 .../boot/dts/freescale/imx93-phyboard-segin.dts     | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
index be9c0a436734..e4f959f665b2 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
@@ -80,6 +80,19 @@ &lpuart1 {
 	status = "okay";
 };
 
+/* USB  */
+&usbotg1 {
+	disable-over-current;
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&usbotg2 {
+	disable-over-current;
+	dr_mode = "host";
+	status = "okay";
+};
+
 /* SD-Card */
 &usdhc2 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
-- 
2.34.1

