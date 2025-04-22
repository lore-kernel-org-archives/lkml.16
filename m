Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFED20E00A;
	Tue, 22 Apr 2025 10:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745319422; cv=none; b=LgpzOHbjQnTNx/ntyGkicpaEXGOVDmMrMjf5NSO5p/YLYOCVsCGUEc+uC9eFmbM6f36yWmaQCtb/0bNJ82f90Mj/kOtGUaaAaR/5/KHztb2L9JfOVTwPn1h21glpDAM/1sVeLr5GZf3NbZZf1ULa0zdzwlpB5eJIfo3K5bbrXWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745319422; c=relaxed/simple;
	bh=w5GAOfWwXmPGLNH6tlb9zfPjt5txaFHQGo+j1YCoGII=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G5QyOVSLj2L0es+Elm19ba2qmeeuIVVSlB9001Qk0vNgfiVZQkhV+BY3L7wg6BjHLMQzdaK+H6BRjwdLhxw0Af8RvqwZpQ1tgya5+tKKqKyNfFGPsdmdxUnLgrUVP+LyJfbMEJgqfKZmulj4+tcmdyyHFCjTzmRyZXniLPJXkHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=Z8nU5k65; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="Z8nU5k65"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=akYobPBjEeHMIFIRw4JqGTLr2GotsTaKSSfvZXGM18Q=; b=Z8nU5k65wDtstofk+CaFEm1yAW
	Ttf2cALdJyrGX5VRNe8SRT+lgq/iGQbHlnrNAU8rUwlhrhIU9cU69SPKVOeT8FV5SAYxgzhBGGN7z
	Zy90srTww+ZbXja1aglUoRHjgzwphtffwPH9W+zNSXsXX8rDI+0iGdPPeCGwezMGVz97/mAAXXq1X
	nfYKI3UNyQ1zMq5Y+7LxlfwANqqBMC49AWfywHV2vcnxLoyoC/PbCA6FhiNQrICxdrWLbMoxq2o6j
	aQUtgNkAP4h8vmayF/U6t2QwEkI65qPw5LKKLNBhIAtvI2aWMOTfywFMXVNU5YvSigh5TJ2RQlgy3
	HJ3TfHjw==;
Received: from [89.212.21.243] (port=36562 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u7BJC-008kyr-2E;
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
Subject: [PATCH v4 08/15] arm64: dts: freescale: imx93-phyboard-segin: Fix SD-card pinctrl
Date: Tue, 22 Apr 2025 12:56:37 +0200
Message-Id: <20250422105644.2725168-9-primoz.fiser@norik.com>
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

Until now, all usdhc2 (SD-card) pinctrl labels pointed to one pinctrl
group "usdhc2grp" which was overwritten twice by the 100 and 200 MHz
modes. Fix this by using unique pinctrl names.

Additionally, adjust MX93_PAD_SD2_CLK__USDHC2_CLK pad drive-strength
according to values obtained by measurements from the PHYTEC hardware
department to improve signal integrity.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v4:
- no changes

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

