Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7387C204C30
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 23:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744327384; cv=none; b=l4oS6FSLFBtAqC9jaVDezfhOcJeMEEzmAC0uzabwrrecygU8OvA5xgtjWVa43W3CEPPCnFpD9/W2UZKBTZkJ0vdl9FxNEwv9lfK/5nRbTW6Hl3f7hQuGUZFGo0T3L2ifY0XSRTtDOJUVInszMCZZbNyMhch5HdvqN9QlUAVSxdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744327384; c=relaxed/simple;
	bh=Ag1W4qx4ObWxvU5wIkALiGD3Ap0ZT/8sMDoHafbWzXE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KT85lsysM7168tTLn6rLy5bEE/xip92wGdvc2B03S2Rvv/QA+5zbClcphLh7TWlp1dXTBkLn0WwhfJYcUT2W3mB13GA3BaRGuftlT6r9OpSc6gTHCcn/3hBonCvgmgAyqLJp6vMnV6ghkVGplgmyeYUV0yzZXU12IXmFG/lfVNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1u31EU-0003vb-AG; Fri, 11 Apr 2025 01:22:54 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: kernel@pengutronix.de,
	"vkoul@kernel.org, shawnguo@kernel.org, Sascha Hauer" <s.hauer@pengutronix.de>
Cc: dmaengine@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 01/10] dmaengine: imx-sdma: drop legacy device_node np check
Date: Fri, 11 Apr 2025 01:22:36 +0200
Message-Id: <20250410232247.1434659-2-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250410232247.1434659-1-m.felsch@pengutronix.de>
References: <20250410232247.1434659-1-m.felsch@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

The legacy 'if (np)' was required in past where we had pdata and dt.
Nowadays the driver binds only to dt platforms. So using a new kernel
but still use pdata is not possible, therefore we can drop the legacy
'if' code path.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/dma/imx-sdma.c | 32 ++++++++++++++------------------
 1 file changed, 14 insertions(+), 18 deletions(-)

diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
index 3449006cd14b..699f0c6b5ae5 100644
--- a/drivers/dma/imx-sdma.c
+++ b/drivers/dma/imx-sdma.c
@@ -2326,11 +2326,9 @@ static int sdma_probe(struct platform_device *pdev)
 			vchan_init(&sdmac->vc, &sdma->dma_device);
 	}
 
-	if (np) {
-		sdma->iram_pool = of_gen_pool_get(np, "iram", 0);
-		if (sdma->iram_pool)
-			dev_info(&pdev->dev, "alloc bd from iram.\n");
-	}
+	sdma->iram_pool = of_gen_pool_get(np, "iram", 0);
+	if (sdma->iram_pool)
+		dev_info(&pdev->dev, "alloc bd from iram.\n");
 
 	ret = sdma_init(sdma);
 	if (ret)
@@ -2370,21 +2368,19 @@ static int sdma_probe(struct platform_device *pdev)
 		goto err_init;
 	}
 
-	if (np) {
-		ret = of_dma_controller_register(np, sdma_xlate, sdma);
-		if (ret) {
-			dev_err(&pdev->dev, "failed to register controller\n");
-			goto err_register;
-		}
+	ret = of_dma_controller_register(np, sdma_xlate, sdma);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to register controller\n");
+		goto err_register;
+	}
 
-		spba_bus = of_find_compatible_node(NULL, NULL, "fsl,spba-bus");
-		ret = of_address_to_resource(spba_bus, 0, &spba_res);
-		if (!ret) {
-			sdma->spba_start_addr = spba_res.start;
-			sdma->spba_end_addr = spba_res.end;
-		}
-		of_node_put(spba_bus);
+	spba_bus = of_find_compatible_node(NULL, NULL, "fsl,spba-bus");
+	ret = of_address_to_resource(spba_bus, 0, &spba_res);
+	if (!ret) {
+		sdma->spba_start_addr = spba_res.start;
+		sdma->spba_end_addr = spba_res.end;
 	}
+	of_node_put(spba_bus);
 
 	/*
 	 * Because that device tree does not encode ROM script address,
-- 
2.39.5

