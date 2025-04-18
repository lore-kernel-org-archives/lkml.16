Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A43C26988C;
	Fri, 18 Apr 2025 06:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744957880; cv=none; b=C8HvZij4qp6+5k3kd63nB8ULo607n5T4Ibg8Lxm2ZIqIcOKIDmEIpyxoHqYeHxJ5ANVn7tyLxL/ru+laN3rbNiLVNsgWL/toYPHmZ13XxnhShXHkAAqB4NpS6Mvfcq0n89fP+vCxMvFZbespM6ZH6/RFc09hcj628pMB7tUN980=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744957880; c=relaxed/simple;
	bh=sLh/Th8Uh3JR5mnHjVmIWh8vSfS6Nk+RgtRpnffkBno=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=n4+a6Bj4VKJx5ztJopGBNazF02d7MGSldwTBXt/i3XUYvB78ZPPLwBl2hpo/Hi9o6sH97ZdyI2eBE6I3ZnKEjo4ZDI4gqPvZPX4szOaTfG/gZlp96c0aH7Ek4RC11W+PQOG2yN/MVim/8Nyk212dFFh6RafobFxm1/SyDiI+Hxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=Jy8Mi28a; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="Jy8Mi28a"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Dy2RzqWiPQ/3SOizXSjTaUnMOtpy5JNfDjjPJHM24fU=; b=Jy8Mi28ai7YsnPGMKTpp8kjyXF
	TOh7n8z8J/cJ7P63pIKuJMFadHL3QnJylAVrExRg5t+3Szt2UXuBIE301v5Tc12LPFoU/zRBbfh2B
	P/ekWcOHlCG+Dg70iBDHu0jlnfmRMlG1AXXc1tUtY0B8waAeutUgJNEFhhpuE3u3vXvMTpYmhu8uN
	YGXngUQTFgPnmjV9aTbKmiiDuAfXjDhJMyDj/iNGYr9pGjfNcMlQWWiJFBqygHGMfNcDwAthh6+mC
	OqXLu8xiyKZ+kL5NxFG2EOSJLsTKSBqry9c6yF+3GJI+aEp8drD2WirPLwVun5S3UJs7Qgt8lynyF
	2usO9a0Q==;
Received: from [89.212.21.243] (port=56446 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u5fFn-00AbM0-1Z;
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
Subject: [PATCH v3 06/15] arm64: dts: freescale: imx93-phyboard-segin: Drop eMMC no-1-8-v flag
Date: Fri, 18 Apr 2025 08:30:55 +0200
Message-Id: <20250418063104.2202085-7-primoz.fiser@norik.com>
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

Drop redundant 'no-1-8-v' flag from usdhc1 (eMMC) node. Flag is now set
by default in the SOM include file (imx93-phycore-som.dtsi).

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v3:
- no changes

 arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
index 85fb188b057f..902b523fc92c 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
@@ -40,11 +40,6 @@ &lpuart1 {
 	status = "okay";
 };
 
-/* eMMC */
-&usdhc1 {
-	no-1-8-v;
-};
-
 /* SD-Card */
 &usdhc2 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
-- 
2.34.1

