Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DF313C918;
	Thu, 19 Jun 2025 05:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750311943; cv=none; b=bxRuZURxfazBxbWHeN5vYVHjxGueYr0vYcPIf4Vx82QmaJ5+27cZ/pT+MS2dPcU3UdGBTduBDN1fohrU4cyUDadDjx5bfI62tptDxMXrf91qsNYgpWTgziDr+ov2vZfulQn36UZt3TlakS5pexTc0qV1en9ZhCNZr4XUQLikUzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750311943; c=relaxed/simple;
	bh=LykC/4ZBPOzMHeLKUB04c2lnziFde8GRpsGni+7FcUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=isvUgryjoZKyc4vOFUP9uVI24kOgJIHDVj1ZHZlWDD9bTcQkNi7Oe5ub9bFv7b9Qvo44CrF0spsV1ZTOn9YCQKrMoBfrj1HzshNjGWY4vjm18MGQAYO0BIqb38K3NdIlAiofNZiK8Eod49TxusSmEdNrKolhYuKIUDUTQH4eYFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=SC3gmsLK; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=EA0qTvV8 reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="SC3gmsLK";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="EA0qTvV8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1750311939; x=1781847939;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=TTVupIh3/NLv+xYBDsRvUPwD/5Acjy4PdaTxo3ztWzE=;
  b=SC3gmsLKDueN/M9IBwJiIWhC9WIj5Mb+gPmbE2L80QL7RBlkM44Y9PLY
   CHUg9wIqPOC2ksrfvbReUv/lsEWcTWtXswmcIZY+KCMHskXXWg6bskdxs
   u4oJXebDyrsekqFttNJnGmjnsQBS+c8nWMY4m2BtEnyM2IP91jNNaeBBt
   TrXSJ3W/8TxudCinAuynFHFoUicerIDenfklQnvZwyDY1omBVfgdlQU44
   Iyxm9mEaWgq7aSa45K0PMJMLf9NGq2qnpyWjKhThcEG0/gJZ7rKzZEP0p
   JuHiSP0hOVom1YVpTjSHi3b1AqGz65LdxKTSV+vpL9CH3xC+7jnFNVG0T
   g==;
X-CSE-ConnectionGUID: WD3UMgvQRs+EzjKKO2jI5Q==
X-CSE-MsgGUID: KE/UAAHXQ5mhrNJ2FGrXVw==
X-IronPort-AV: E=Sophos;i="6.16,247,1744063200"; 
   d="scan'208";a="44731634"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 19 Jun 2025 07:45:30 +0200
X-CheckPoint: {6853A3FA-3-569BE4A0-ECC5EE08}
X-MAIL-CPID: 034B6BD5CF42ADFF2113C74676D88493_3
X-Control-Analysis: str=0001.0A006378.6853A411.0009,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EE378160EBC;
	Thu, 19 Jun 2025 07:45:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1750311925;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TTVupIh3/NLv+xYBDsRvUPwD/5Acjy4PdaTxo3ztWzE=;
	b=EA0qTvV8oKUkp8vUNmNET8RoIKQnfWcJ7ND4g4sdTre5HFh8HpcjS3ujQM6PLu6Ap1neEe
	KnZuaRTuykMQJyx2rgzo4nuOOLVjaS2ujXq22i1wBOTMNXQdchKVOQFP5uwXXX5vuzJaN/
	B1LLafpTbxHiLnEnK6+plKU1R9Yu4rrF0PNOkgG+zbKEmI0j+v0HXSprIesp7QHn7s8P1e
	jzX3SxQ8VvKN4uUPIDd8+wScrB0Fad7Qb7VooDycqFlnuFPozJ7NCxXGu/dpBkgJkov7Lt
	J4souz3Xnw6AGOe/HbdKOFH7MkasIaJLYmzIiwtRmHw/kFzeX/acFEpa5p2mzA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v2 1/1] arm64: dts: tqma8mpql-mba8mpxl-lvds: Rename overlay to include display name
Date: Thu, 19 Jun 2025 07:45:11 +0200
Message-ID: <20250619054513.2134620-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

This platform supports several displays, so rename the overlay to reflect
the actual display being used. This also aligns the name to the other
TQMa8M* modules. Apply the same change for MBa8MP-RAS314 as well, as it
uses the same overlay.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v2:
* Rebase to next-20250618
* Include MBa8MP-RAS314 as well (uses the same overlay)
* Fix DT order

 arch/arm64/boot/dts/freescale/Makefile               | 12 ++++++------
 ... imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtso} |  0
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename arch/arm64/boot/dts/freescale/{imx8mp-tqma8mpql-mba8mpxl-lvds.dtso => imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtso} (100%)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 0b473a23d1200..8403253eadb9f 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -260,16 +260,16 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-lvds1-imx-lvds-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-mx8-dlvds-lcd1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-pcie-ep.dtb
 
-imx8mp-tqma8mpql-mba8mpxl-lvds-dtbs += imx8mp-tqma8mpql-mba8mpxl.dtb imx8mp-tqma8mpql-mba8mpxl-lvds.dtbo
+imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33-dtbs += imx8mp-tqma8mpql-mba8mpxl.dtb imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtbo
 imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01-dtbs += imx8mp-tqma8mpql-mba8mpxl.dtb imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtbo
 imx8mp-tqma8mpql-mba8mp-ras314-imx219-dtbs += imx8mp-tqma8mpql-mba8mp-ras314.dtb imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtbo
-imx8mp-tqma8mpql-mba8mp-ras314-lvds-dtbs += imx8mp-tqma8mpql-mba8mp-ras314.dtb imx8mp-tqma8mpql-mba8mpxl-lvds.dtbo
-imx8mp-tqma8mpql-mba8mp-ras314-lvds-imx219-dtbs += imx8mp-tqma8mpql-mba8mp-ras314.dtb imx8mp-tqma8mpql-mba8mpxl-lvds.dtbo imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtbo
-dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl-lvds.dtb
+imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33-dtbs += imx8mp-tqma8mpql-mba8mp-ras314.dtb imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtbo
+imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33-imx219-dtbs += imx8mp-tqma8mpql-mba8mp-ras314.dtb imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtbo imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtb
-dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314-lvds.dtb
-dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314-lvds-imx219.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33-imx219.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx8mq-evk.dtb
 imx8mq-evk-pcie1-ep-dtbs += imx8mq-evk.dtb imx-pcie1-ep.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds.dtso b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtso
similarity index 100%
rename from arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds.dtso
rename to arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtso
-- 
2.43.0

