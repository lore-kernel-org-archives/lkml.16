Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E5F2698BF;
	Fri, 18 Apr 2025 06:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744957881; cv=none; b=kQF59vWicZP89mvPJOKvNgmGUgtsreUl3nYqitLZEaxrSbiHXSSZhAz1wwVyckJsJs7pS5z+/tQ0ua9z9EPlcyZBa7P/WZcGWxtOzIsMWxXiaE0uAKhUWztpjuh5+iolyscGR05+MNtByQDrXz3bqKBzMp/CPEHYzNIo9Wt8tfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744957881; c=relaxed/simple;
	bh=DXp+lu4qz9ZdV0R758pBrziBgcXNHJFNp0Zdjl+WMlY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=R/dfTsy3deyvI8q7F4NNDlD/khGScHNqGc4gqfBi/aaKiWcOvHL5bd84gBWbv4zb7zHCc/LvKHzQNoyFkV4aCYnnvz0kbl3GBGLMtFwGgAxiSkfARTsOhu7KsL3r+qnQHuwpnDDmxE0uz5zofRyYIRzwvC17U0+T9jZZ4KKq684=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=L5b2WDGm; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="L5b2WDGm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=pFoM8NGxDUpybx1zeU+jqOplsaQouEb94conW7AIwoQ=; b=L5b2WDGm0/K83FCrfHe3nfud+z
	gpYjTA+vHvrg4E6JQyY3LRCmp6e0invhhgnJlUnX5j1MZNrDH3xu9qS9pkxSy59smWIFP18Vp8VYw
	uMmtPya8ZCoW8K/yD0d6/xjW02ReB/CHhB8+ji9tYDrxrrU4fXFiodqJr1GZMeQqZN3AcnEnnryFy
	OHt48D0SY9ehVZ68d0J5IBE/70/jUJk0wIuLr5vWHVEJmHZbwA4WrMAw1R3yr4Y5iOEs0T55BaElL
	Of43CKaGIbKl8b8SNiboLHRSovU7yxrFSLdmFx6ZGIO86Hfoz3GrVtHBwx0/uszk+wdrUWD71EtXD
	0qWs6NOQ==;
Received: from [89.212.21.243] (port=56446 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u5fFn-00AbM0-25;
	Fri, 18 Apr 2025 08:31:11 +0200
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
Subject: [PATCH v3 08/15] arm64: dts: freescale: imx93-phyboard-segin: Fix SD-card pinctrl
Date: Fri, 18 Apr 2025 08:30:57 +0200
Message-Id: <20250418063104.2202085-9-primoz.fiser@norik.com>
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

Until now, all usdhc2 (SD-card) pinctrl labels pointed to one pinctrl
group "usdhc2grp" which was overwritten twice by the 100 and 200 MHz
modes. Fix this by using unique pinctrl names.

Additionally, adjust MX93_PAD_SD2_CLK__USDHC2_CLK pad drive-strength
according to values obtained by measurements from the PHYTEC hardware
department to improve signal integrity.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v3:
- add Reviewed-by tag

 arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
index 3d5cd0561362..541297052b62 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
@@ -77,7 +77,7 @@ MX93_PAD_SD2_CD_B__GPIO3_IO00		0x31e
 
 	pinctrl_usdhc2_default: usdhc2grp {
 		fsl,pins = <
-			MX93_PAD_SD2_CLK__USDHC2_CLK		0x179e
+			MX93_PAD_SD2_CLK__USDHC2_CLK		0x159e
 			MX93_PAD_SD2_CMD__USDHC2_CMD		0x139e
 			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x138e
 			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x138e
@@ -87,9 +87,9 @@ MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
 		>;
 	};
 
-	pinctrl_usdhc2_100mhz: usdhc2grp {
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
 		fsl,pins = <
-			MX93_PAD_SD2_CLK__USDHC2_CLK            0x179e
+			MX93_PAD_SD2_CLK__USDHC2_CLK		0x159e
 			MX93_PAD_SD2_CMD__USDHC2_CMD            0x139e
 			MX93_PAD_SD2_DATA0__USDHC2_DATA0        0x138e
 			MX93_PAD_SD2_DATA1__USDHC2_DATA1        0x138e
@@ -99,9 +99,9 @@ MX93_PAD_SD2_VSELECT__USDHC2_VSELECT    0x51e
 		>;
 	};
 
-	pinctrl_usdhc2_200mhz: usdhc2grp {
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
 		fsl,pins = <
-			MX93_PAD_SD2_CLK__USDHC2_CLK            0x178e
+			MX93_PAD_SD2_CLK__USDHC2_CLK		0x158e
 			MX93_PAD_SD2_CMD__USDHC2_CMD            0x139e
 			MX93_PAD_SD2_DATA0__USDHC2_DATA0        0x139e
 			MX93_PAD_SD2_DATA1__USDHC2_DATA1        0x139e
-- 
2.34.1

