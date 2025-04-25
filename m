Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C711C22B8D1;
	Fri, 25 Apr 2025 06:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745563277; cv=none; b=JkbYV0k9wnmTl6JG/CAV5Id7Px+ywvz6Qgxu49WPnZJxrOEbcAc8pt6aiXae0sKQfgz2bgVmsT4KQZPis3BJ1IQTmk8NmIpXORDsXxpJmFQAg3kEX/uDwXJskYSEPAJ4FpIxIDabNc4vDWDPUxRxEBCMCi5+8jhjjzwjqm2Rpvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745563277; c=relaxed/simple;
	bh=hni/YGOnmk6EIDEZoTzkqJiPLBiEgC+Ux6gESW/4r+o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TRZZ1nZhInQI4g1uTQZyUi9UchGgxFV25VsEeir6raCQO2rLTSM9AOouIDM2HxaoGH2gAlo1vea/NxgUuiheFih7HYY63+WAIa7zb1YVewnrwwrXEU/x284/SJyEBevO3GFwVScBogklJ1GkYvhWHgWgOdZxISGlRIWeYKW00wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=asR+UFJY; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="asR+UFJY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=LFvB5wzEMrSQ5SEmlL4zPr1Syx49SD71KlRZNLYPV0c=; b=asR+UFJY+1Q9qDM9twRX747NWI
	gAXQSD9SP/IrnVZ4Hs8a7I634qamOEB+bY8YpJzfuywiHdUKar/z68DhmsgAiJM11liRNIT11rCkt
	dpg+gDE3rC9HsX+PCdivBqI4nAhOlYt0VvOplaqMn2jmaUDnLdTRCsgz4rTUmtLRIXNyjoqSr3opE
	AN7olXUFcPRyFXGPu1B5j+aI5oSGQnpV5/ETxqDAsZrEkIffsh8AQp5r6SY2SrpNlHo4zR51nKRaX
	kpAYZGHGhJWUAu/lWQPuLmOrRVX4aRAvNKoOCTHw4xBh+ea9qiRFf0AI551vGVz/DQMVIyor7enos
	2J5LKUnA==;
Received: from [89.212.21.243] (port=50196 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u8CkH-003PCA-1N;
	Fri, 25 Apr 2025 08:41:08 +0200
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
Subject: [PATCH 1/2] bindings: arm: fsl: Add PHYTEC phyBOARD-Nash-i.MX93 board
Date: Fri, 25 Apr 2025 08:41:06 +0200
Message-Id: <20250425064107.174548-1-primoz.fiser@norik.com>
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
---
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

