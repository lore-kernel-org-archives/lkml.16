Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F01C2192E3;
	Tue, 15 Apr 2025 04:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744691607; cv=none; b=uz2wwPMzXWZ2i+/nD0EYrIVmQO1OqPqJIXDpM4l0aLCSAx+gV9tiCfbnZhs6ScQPz2SSqPJibup6Pj+yiNQj+9Gk3uqYuyNbC1L9mLSRXhxCVoKfqdi+IN5cZxa4KXglH4Lmf6GO1qefW6jR8w3DMswzlwXMui0hsrktWLedjRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744691607; c=relaxed/simple;
	bh=FgNxbDpfmSoc1qEXpeTHcL16GEbfnCfWQUlHrHALqHk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hQu06XhCN6BV3jj4oPl8WuBedU3mvClCkh3wCrgGlu0QglSJ+bnI400eVSijMerSorC2uLiAVSIYSIjVSGMbGbxQogTcqpGHAdrA6IFtQ3L12Hwn9TwEprzxJtsoOkR/r+l9qYhLpFemCNeNMx6dJD61V5BSjSa8xcLbwOBDj3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Received: from [89.212.21.243] (port=52324 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u4Xz5-00Gb4I-1N;
	Tue, 15 Apr 2025 06:33:18 +0200
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
Subject: [PATCH v2 08/15] arm64: dts: freescale: imx93-phyboard-segin: Fix SD-card pinctrl
Date: Tue, 15 Apr 2025 06:33:04 +0200
Message-Id: <20250415043311.3385835-9-primoz.fiser@norik.com>
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

Until now, all usdhc2 (SD-card) pinctrl labels pointed to one pinctrl
group "usdhc2grp" which was overwritten twice by the 100 and 200 MHz
modes. Fix this by using unique pinctrl names.

Additionally, adjust MX93_PAD_SD2_CLK__USDHC2_CLK pad drive-strength
according to values obtained by measurements from the PHYTEC hardware
department to improve signal integrity.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
Changes in v2:
- reword commit msg
- split errata changes into separate patch

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

