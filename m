Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E05221D00D;
	Tue, 22 Apr 2025 10:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745319422; cv=none; b=f4f6AZ9kgdr4/qRsQjja9QRdmCnsDmy5YrUq5ZtgYCw150YwgCxXCImAF9Di0ktVhiLc8fO01A1GEcFpHOOeEcaYQ4JXvc1qEITTTUw9zPErlk30GRDRQJShu8ES8k9a0iY7Q9MN6kO+n6JY4NT1Pc82OI0PUb25uBWxlsOYZ3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745319422; c=relaxed/simple;
	bh=TUH2gZJtNytScAtsAAg8uxQf2R65xTLJzMGHqbOSvWI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LTd32t4wtSG9Te8xKnHgHY7FXsBvlM6/ZUTgD2PIter0p2cq7ZK/2kmYkz53XCYrBnWryKnDgMQcA3x6MGIGSKcsGUHwR3LcGf/r8+xSTZnBpLrok2HK9I1Bj6Gzldk7X4ZnT/sFwrjwh/2VzE0gvFGY1deZBex90HRURHC3Uvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=mBbu0BWM; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="mBbu0BWM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=yBjOTHYTAnSAYjYErf6BUa4a2uxiS8PF4Sok5L6HtX8=; b=mBbu0BWM5tPNFwxLjyJKHHpDNL
	OiAIKpSUn7mcKCFTLe6IvhIq2orRmAjKFkJQWD1fKryaD7s9ZI/i0Y0OKkCJmSglFerfoxDUM8TZe
	5t3Z0Rq7IcXVvLn3hTpHbkf0rqgDV752NCl2hoC4l7wMNqd0zfx5CG4b4WSbhLSV/yHNM2cmqYXPD
	ad62++6c0OUsk90AYOGEdAQEn0dtAKrPWflMObREYCTje8tBIQ5//tU6AY+w1NzHrSQUazE/XxMrm
	M9nNK/AykrwVz7p6ag4rJebMBxOKSXUPmDt5bjZBCAYZnsJ3g9rBDG3tFUp4DOJldQ1VCPZat1JOc
	IFf/mHqQ==;
Received: from [89.212.21.243] (port=36562 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u7BJC-008kyr-2X;
	Tue, 22 Apr 2025 12:56:58 +0200
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
Subject: [PATCH v4 09/15] arm64: dts: freescale: imx93-phyboard-segin: Set CMD/DATA SION bit to fix ERR052021
Date: Tue, 22 Apr 2025 12:56:38 +0200
Message-Id: <20250422105644.2725168-10-primoz.fiser@norik.com>
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

Implement fix for i.MX 93 silicon errata ERR052021.

ERR052021 uSDHC: Sometimes uSDHC does not work under VDD_SOC low
		 drive mode and nominal mode
Description:
  uSDHC PADs have one integration issue.
  When CMD/DATA lines direction change from output to input, uSDHC
  controller begin sampling, the integration issue will make input
  enable signal from uSDHC propagated to the PAD with a long delay,
  thus the new input value on the pad comes to uSDHC lately. The
  uSDHC sampled the old input value and the sampling result is wrong.

Workaround:
  Set uSDHC CMD/DATA PADs iomux register SION bit to 1, then PADs will
  propagate input to uSDHC with no delay, so correct value is sampled.

This issue will wrongly trigger the start bit when sample the USDHC
command response, cause the USDHC trigger command CRC/index/endbit
error, which will finally impact the tuning pass window, especially
will impact the standard tuning logic, and can't find a correct delay
cell to get the best timing.

Based on commit bb89601282fc ("arm64: dts: imx93-11x11-evk: set SION for
cmd and data pad of USDHC").

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
Changes in v4:
- no changes

 .../dts/freescale/imx93-phyboard-segin.dts    | 37 ++++++++++---------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
index 541297052b62..525f52789f8b 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
@@ -75,39 +75,42 @@ MX93_PAD_SD2_CD_B__GPIO3_IO00		0x31e
 		>;
 	};
 
+	/* need to config the SION for data and cmd pad, refer to ERR052021 */
 	pinctrl_usdhc2_default: usdhc2grp {
 		fsl,pins = <
 			MX93_PAD_SD2_CLK__USDHC2_CLK		0x159e
-			MX93_PAD_SD2_CMD__USDHC2_CMD		0x139e
-			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x138e
-			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x138e
-			MX93_PAD_SD2_DATA2__USDHC2_DATA2	0x138e
-			MX93_PAD_SD2_DATA3__USDHC2_DATA3	0x139e
+			MX93_PAD_SD2_CMD__USDHC2_CMD		0x4000139e
+			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x4000138e
+			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x4000138e
+			MX93_PAD_SD2_DATA2__USDHC2_DATA2	0x4000138e
+			MX93_PAD_SD2_DATA3__USDHC2_DATA3	0x4000139e
 			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
 		>;
 	};
 
+	/* need to config the SION for data and cmd pad, refer to ERR052021 */
 	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
 		fsl,pins = <
 			MX93_PAD_SD2_CLK__USDHC2_CLK		0x159e
-			MX93_PAD_SD2_CMD__USDHC2_CMD            0x139e
-			MX93_PAD_SD2_DATA0__USDHC2_DATA0        0x138e
-			MX93_PAD_SD2_DATA1__USDHC2_DATA1        0x138e
-			MX93_PAD_SD2_DATA2__USDHC2_DATA2        0x139e
-			MX93_PAD_SD2_DATA3__USDHC2_DATA3        0x139e
-			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT    0x51e
+			MX93_PAD_SD2_CMD__USDHC2_CMD		0x4000139e
+			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x4000138e
+			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x4000138e
+			MX93_PAD_SD2_DATA2__USDHC2_DATA2	0x4000139e
+			MX93_PAD_SD2_DATA3__USDHC2_DATA3	0x4000139e
+			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
 		>;
 	};
 
+	/* need to config the SION for data and cmd pad, refer to ERR052021 */
 	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
 		fsl,pins = <
 			MX93_PAD_SD2_CLK__USDHC2_CLK		0x158e
-			MX93_PAD_SD2_CMD__USDHC2_CMD            0x139e
-			MX93_PAD_SD2_DATA0__USDHC2_DATA0        0x139e
-			MX93_PAD_SD2_DATA1__USDHC2_DATA1        0x139e
-			MX93_PAD_SD2_DATA2__USDHC2_DATA2        0x139e
-			MX93_PAD_SD2_DATA3__USDHC2_DATA3        0x139e
-			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT    0x51e
+			MX93_PAD_SD2_CMD__USDHC2_CMD		0x4000139e
+			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x4000139e
+			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x4000139e
+			MX93_PAD_SD2_DATA2__USDHC2_DATA2	0x4000139e
+			MX93_PAD_SD2_DATA3__USDHC2_DATA3	0x4000139e
+			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
 		>;
 	};
 };
-- 
2.34.1

