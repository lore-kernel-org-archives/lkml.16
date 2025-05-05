Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4BB199931
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 17:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746467596; cv=none; b=bKV1fxTzMBuGtniipbboTaVG0VxTsSkaAn9WbAC1FYYvj5FGzVTelSSHBgedybk0XyjCwhFGFBH74bLOJvc6pP9lUo3ArMdtsrl7ogq9OsdUuqzbq1AYCMiSX/6igepswIfBWk0KCA5H+cd+D870LlytWMKg24BnsTwfHbX5GiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746467596; c=relaxed/simple;
	bh=PB5Fp54bJa+r3bYxl1gPK2+wal+UWWfSGN4P2ziupo8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gHOLMxH8zyM9OYz3iV/jNDxK3VlKXt9R6/ahcsGJD/qTmaiVpFhN66LmqpFS7UlhRorK9DBrgvxhyiCY7hIZGce/fswHvwVbGB48Ct+cZZSfc0ZC4PnAQXLhAZlqT3w4nLCMcIDFIuSAHRg2hJUmofi5IQ8eNngE+ckqhAbecmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Mon, 5 May 2025 13:53:07 -0400
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ben Collins <bcollins@kernel.org>
To: dmaengine@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Vinod Koul <vkoul@kernel.org>, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] fsldma: Set correct dma_mask based on hw capability
Message-ID: <2025050513-complex-crane-2babb6@boujee-and-buff>
Mail-Followup-To: dmaengine@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Vinod Koul <vkoul@kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Migadu-Flow: FLOW_OUT

The driver currently hardcodes DMA_BIT_MASK to 36-bits, which is only
correct on eloplus:

elo3		supports 40-bits
eloplus		supports 36-bits
elo		supports 32-bits

This is based on 0x08 cdar register documention in the respective
reference manuals. Set the dma mask accordingly.

Feedback from Arnd Bergmann:

- Use match data to set address bit mask

Signed-off-by: Ben Collins <bcollins@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: dmaengine@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/dma/fsldma.c | 20 ++++++++++++++++----
 drivers/dma/fsldma.h |  1 +
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index b5e7d18b97669..566db5a1b0bab 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -1226,6 +1226,8 @@ static int fsldma_of_probe(struct platform_device *op)
 
 	fdev->dev = &op->dev;
 	INIT_LIST_HEAD(&fdev->common.channels);
+	/* The DMA address bits supported for this device. */
+	fdev->addr_bits = (long)device_get_match_data(fdev->dev);
 
 	/* ioremap the registers for use */
 	fdev->regs = of_iomap(op->dev.of_node, 0);
@@ -1254,7 +1256,7 @@ static int fsldma_of_probe(struct platform_device *op)
 	fdev->common.directions = BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO_DEV);
 	fdev->common.residue_granularity = DMA_RESIDUE_GRANULARITY_DESCRIPTOR;
 
-	dma_set_mask(&(op->dev), DMA_BIT_MASK(36));
+	dma_set_mask(&(op->dev), DMA_BIT_MASK(fdev->addr_bits));
 
 	platform_set_drvdata(op, fdev);
 
@@ -1387,10 +1389,20 @@ static const struct dev_pm_ops fsldma_pm_ops = {
 };
 #endif
 
+/* The .data field is used for dma-bit-mask. */
 static const struct of_device_id fsldma_of_ids[] = {
-	{ .compatible = "fsl,elo3-dma", },
-	{ .compatible = "fsl,eloplus-dma", },
-	{ .compatible = "fsl,elo-dma", },
+	{
+		.compatible = "fsl,elo3-dma",
+		.data = (void *)40,
+	},
+	{
+		.compatible = "fsl,eloplus-dma",
+		.data = (void *)36,
+	},
+	{
+		.compatible = "fsl,elo-dma",
+		.data = (void *)32,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, fsldma_of_ids);
diff --git a/drivers/dma/fsldma.h b/drivers/dma/fsldma.h
index 308bed0a560ac..2ea57df9b7f7d 100644
--- a/drivers/dma/fsldma.h
+++ b/drivers/dma/fsldma.h
@@ -124,6 +124,7 @@ struct fsldma_device {
 	struct fsldma_chan *chan[FSL_DMA_MAX_CHANS_PER_DEVICE];
 	u32 feature;		/* The same as DMA channels */
 	int irq;		/* Channel IRQ */
+	int addr_bits;		/* DMA addressing bits supported */
 };
 
 /* Define macros for fsldma_chan->feature property */
-- 
2.49.0


-- 
 Ben Collins
 https://libjwt.io
 https://github.com/benmcollins
 --
 3EC9 7598 1672 961A 1139  173A 5D5A 57C7 242B 22CF
