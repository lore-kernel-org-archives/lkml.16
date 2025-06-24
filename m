Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FBC1BC9E2;
	Tue, 24 Jun 2025 06:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750745614; cv=none; b=pt94rtmHTAKA3oKhaAlUbKXZjLArdMbphklJ1oidNf2c6bfm4FqRIAc9HwuAXhKdz8eKwm1UhotrKD4T3JYKkMYBGT0pSre7uuJ7loyu9OTZBNrJLCURgyFc1yqDM3kEP9JmI9EjcYs2eYJKnCfb1x7bpKSduEAZ69xf7hZ9Sqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750745614; c=relaxed/simple;
	bh=iQKW8jtVQ5hokU5L9keV/DmzueNNXB3lLUmIeed/Q0E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iHdu7jhGq5LvCJnb4oRT0UlbGlpVue3zrDMcUwYxbXdtVg4pHFhHrzK9L+kna885njcpkQkaHmXfuolaLKy1bmcyRLCzJt1sg4pLNLq39bmQgofrKHov4nRBWetQGDsMd0QIh3r5Dr9TsOKgWvLPQw0aacOcITIrYCRT3ukjmY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Received: from [89.212.21.243] (port=55180 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1uTwuL-002jD9-0R;
	Tue, 24 Jun 2025 08:13:24 +0200
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
Subject: [PATCH] arm64: dts: freescale: imx93-phycore-som: Fix watchdog reset
Date: Tue, 24 Jun 2025 08:13:23 +0200
Message-Id: <20250624061323.601550-1-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
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

On phyCORE-i.MX93 SoM, the SoC WDOG_ANY output line is connected to the
external pca9451a PMIC WDOG_B input. Apply pinctrl and set the property
"fsl,ext-reset-output" for watchdog to trigger board reset via PMIC on
timeout/reset.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
index 5ee52774e7bf..729c26f9ac94 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
@@ -191,6 +191,9 @@ &usdhc1 {
 
 /* Watchdog */
 &wdog3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_wdog>;
+	fsl,ext-reset-output;
 	status = "okay";
 };
 
@@ -279,4 +282,10 @@ MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x400013be
 			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x179e
 		>;
 	};
+
+	pinctrl_wdog: wdoggrp {
+		fsl,pins = <
+			MX93_PAD_WDOG_ANY__WDOG1_WDOG_ANY	0x31e
+		>;
+	};
 };
-- 
2.34.1

