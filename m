Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94491DF75D;
	Mon,  5 May 2025 07:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746431472; cv=none; b=c64wkhxWh1Ke/GjYKRkuureHALqqYTdSLMAxUOnLR3HLyZWFHGWfV/S6Y0VzWB8JzOdLCNoYJvDhl4OwWLiGcXdgmBwxZwmcXWhq7WOzRS7mwJLq4IgPPeyLsLS9CQ6C79YrmlnM97xwGQod+Ic1kfjVShLvPrdjNkmF5opHKjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746431472; c=relaxed/simple;
	bh=ekkXZr/XQuNLHSGTyUWTo+m7wlIRrqIqRDpRWGBerOM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hPkEWTe/iwj2m2UEmlJ+y4p9BQ1Z+v8ECyyWGqYPZ5//doeDuUdHAiyIPvxLjXqv08U/SM/JnBGoYFkWcNblKdphPFioWkgEE4i8Mo4S1hfOPdCSrC+LeGovaEEu2O6Doq5UfAvZvoF/U0k/PMiSPm1vy00ZjoJrdxJ+8bnK/Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=g0aI6aKU; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="g0aI6aKU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=W8dw99Gm2MjCZCGOQPkYh4fdAw0NQcG5zRqV453oVro=; b=g0aI6aKUKJkBsmqjqc7jEd2WF0
	SXmUgqnOVFP5Vfkzywqi2+A2IJ16Tg2UuGhcjNksYbFQPEZT//yHtz6YKH3GLbtKpXXys7Wg6iie+
	LyUGCm5+Gw+2oO1tuA6GsJ/I/tR2SlzYrGQObfkpM+CYVFvxeNXWNEnmOXQxRE4DbjczqpMWhKDbx
	P/sF1C8LsASqZaYhKsiHNxHkHhAbb4ovHu510l5aCodkMWfedZ9a9HQw9r0mIsMYIwWMwUNGqlmzl
	btflI91CGqog8Ealw9nXHooivZRIxnnPNc/zEdIWftLG7lrucf58Yw+gpmEl92nk6J164lrOc3IJw
	CKmhxaaw==;
Received: from [89.212.21.243] (port=45262 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1uBqbV-00BnPr-28;
	Mon, 05 May 2025 09:51:08 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	upstream@lists.phytec.de
Subject: [PATCH v2 1/2] bindings: arm: fsl: Add PHYTEC phyBOARD-Nash-i.MX93 board
Date: Mon,  5 May 2025 09:51:06 +0200
Message-Id: <20250505075107.2579801-1-primoz.fiser@norik.com>
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

Add devicetree bindings for PHYTEC phyBOARD-Nash-i.MX93 board based on
the existing PHYTEC phyCORE-i.MX93 SoM (System-on-Module).

Adjust the compatibles for the existing phyBOARD-Segin-i.MX93 board, to
be able to add additional board based on the phyCORE-i.MX93 SoM.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes in v2:
- add Reviewed-by:

 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 1b90870958a2..6abb58d599a6 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1387,8 +1387,10 @@ properties:
 
       - description: PHYTEC phyCORE-i.MX93 SoM based boards
         items:
-          - const: phytec,imx93-phyboard-segin # phyBOARD-Segin with i.MX93
-          - const: phytec,imx93-phycore-som    # phyCORE-i.MX93 SoM
+          - enum:
+              - phytec,imx93-phyboard-nash  # phyBOARD-Nash-i.MX93
+              - phytec,imx93-phyboard-segin # phyBOARD-Segin with i.MX93
+          - const: phytec,imx93-phycore-som # phyCORE-i.MX93 SoM
           - const: fsl,imx93
 
       - description: Variscite VAR-SOM-MX93 based boards
-- 
2.34.1

