Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F2A2144B7;
	Thu, 10 Apr 2025 10:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744279266; cv=none; b=NpS4XnsO4xs7IjOoQbLDfDKgnUrcMt40KzYM6SMbwXvgsABZoyE8oMaNaDY6F1H3K5IoPicYYCmXPJYHQSqbqu7Qna+ensCqwSVZ0ILiqHge5GOSuaqXK2trOQg5kavWXxcudMiN1SgtT9yzyhXtkLY+gqJ3wBqwUC2eyWD5bPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744279266; c=relaxed/simple;
	bh=CuzwSRjIjB++UW1NXXcwKxjTcrmJ81BeSSs8ect0bII=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZCFAo8CSACR4m8FwSOVHLhgnAIgVtefLGGfwMTOMOmupkZRrv1VvV2765mhQQx5Id/CwdzKWyQTw4X8oFN0U8B1kGCGzbhmPuRGKFJmjPCDVx1OUYMEHGYcaJ5OZWKdRHPbPs+MCCpLnW+RUdP9EPc5Mhd9YPDnd7j8hnmCBYck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=PW5/4B8F; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="PW5/4B8F"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=KcfXboWvRClaopQK1Ywk6QojNldDv/qICGsRE6ZbcuI=; b=PW5/4B8FmgYCrfJDfOC32JoDkG
	bwrjRQRtDsuOQBCUe2WSVVcXtKWrPf76CSoRhd0SGPfe2Twl5Ncm0m9juNCqR3Ib4jhujJEL8ZN19
	tSG0n3/P8myntkd+aNC4Ikz4soxUpbJ426GCNAXa3HBphD7l2TQmWPkiAmK0m1VKTRN9ieHpCjpqc
	qBBI8HeVqztFuEYjtgHlrgSOJfPnQO3C1XeCMIGCCtObygMaot3I4JkocBx6115TtqS+V2B2ZOWv3
	F+YPONWJ2K91JQru2eq4ZVROU39M3tdQhFSISoOORYFPi3DvB+6EmDSnIK2QI8LVVgXl6nTCwT8tR
	oQ8erJng==;
Received: from [89.212.21.243] (port=41926 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u2noF-000Djj-0j;
	Thu, 10 Apr 2025 11:02:54 +0200
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
Subject: [PATCH 03/13] arm64: dts: freescale: imx93-phycore-som: Disable LED pull-up
Date: Thu, 10 Apr 2025 11:02:41 +0200
Message-Id: <20250410090251.1103979-4-primoz.fiser@norik.com>
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

There is already an external pull-down resistor on the LED output line.
It makes no sense to have both pull-down and pull-up resistors enabled
at the same time. Thus disable the internal pull-down.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
index 442ee067a047..82f680d891c2 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
@@ -196,7 +196,7 @@ MX93_PAD_ENET2_TD2__ENET1_TX_CLK		0x4000050e
 
 	pinctrl_leds: ledsgrp {
 		fsl,pins = <
-			MX93_PAD_I2C1_SDA__GPIO1_IO01		0x31e
+			MX93_PAD_I2C1_SDA__GPIO1_IO01		0x11e
 		>;
 	};
 
-- 
2.34.1

