Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED331BA36
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 03:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745207821; cv=none; b=Q1RO9CQiDOueh+Zz9OmQCNuNgpZc7QFmZcobcF3DVztlEWawbmqg102nEn9Dt7bZfnORPtL3G1ngemSshKAnXVXrAmHb/BKGO0zbpgbXwL+8ZYsSqvAJtZue/+Dhi9NswT1+Go9Ahi7EARHGYUpAoz57pxfyv1w9SfkjxRcCuNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745207821; c=relaxed/simple;
	bh=qkPzZXkMUThgzD0HD+qQ/HclVAEa2ofo3SQJJNjLthk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pzL/knVlC1ST4FMwok5AhcG4VoUeiCM8DGNxBJ/LA6/GkdufUuVDr21Gm+R47mPm4JaTNhyY5wFjuYZ41pYjF8EJXTa/8Ng0IjTCKmQbYUB/2yrN994jE1NEadQKuwqLZa65jqrB1mEg0VFr4LWRv7WPsVKL+C5iQNNgQZoAXDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=VnpKC4sa; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="VnpKC4sa"
X-UUID: a893ba761e6411f09b6713c7f6bde12e-20250421
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=/1VmN4dVZC6QitL81EwDWdsbp7Ol4HqNNMgrSzo39II=;
	b=VnpKC4sab2ypsBi0hMYsQYiyYoC8zrZAm+j7DNbQJpPyv3r+k3H7vy4Yooc3S3Qw4Yzw+qQLBCcUq2mEoFvnKhma5eXnkev1Eu0nYCtSFbbcndIPF7kQGFUQ+TtxJM3wkLQ/BTHleTWklBB+iBnGIRbF4Ft4ZzVbBX5cxL0m0ls=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:034e18ea-0618-41ac-8921-ec73221ea491,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:ffe2cdc7-16da-468a-87f7-8ca8d6b3b9f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a893ba761e6411f09b6713c7f6bde12e-20250421
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 216296205; Mon, 21 Apr 2025 11:56:52 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 21 Apr 2025 11:56:51 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 21 Apr 2025 11:56:51 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Jason-JH Lin
	<jason-jh.lin@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Xavier Chang <xavier.chang@mediatek.com>,
	Xiandong Wang <xiandong.wang@mediatek.com>, Sirius Wang
	<sirius.wang@mediatek.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v3] mailbox: mtk-cmdq: Refine GCE_GCTL_VALUE setting
Date: Mon, 21 Apr 2025 11:55:47 +0800
Message-ID: <20250421035650.441383-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

Add cmdq_gctl_value_toggle() to configure GCE_CTRL_BY_SW and GCE_DDR_EN
together in the same GCE_GCTL_VALUE register.

For the SoCs whose GCE is located in MMINFRA and uses MMINFRA_AO power,
this allows it to be written without enabling the clocks. Otherwise, all
GCE registers should be written after the GCE clocks are enabled.
Move this function into cmdq_runtime_resume() and cmdq_runtime_suspend()
to ensure it is called when the GCE clock is enabled.

Fixes: 7abd037aa581 ("mailbox: mtk-cmdq: add gce ddr enable support flow")
Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---

Change in v3:
- Move cmdq_gctl_value_toggle() after the public API cmdq_get_shift_pa().

---
 drivers/mailbox/mtk-cmdq-mailbox.c | 51 +++++++++++++-----------------
 1 file changed, 22 insertions(+), 29 deletions(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index d186865b8dce..ab4e8d1954a1 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -92,18 +92,6 @@ struct gce_plat {
 	u32 gce_num;
 };
 
-static void cmdq_sw_ddr_enable(struct cmdq *cmdq, bool enable)
-{
-	WARN_ON(clk_bulk_enable(cmdq->pdata->gce_num, cmdq->clocks));
-
-	if (enable)
-		writel(GCE_DDR_EN | GCE_CTRL_BY_SW, cmdq->base + GCE_GCTL_VALUE);
-	else
-		writel(GCE_CTRL_BY_SW, cmdq->base + GCE_GCTL_VALUE);
-
-	clk_bulk_disable(cmdq->pdata->gce_num, cmdq->clocks);
-}
-
 u8 cmdq_get_shift_pa(struct mbox_chan *chan)
 {
 	struct cmdq *cmdq = container_of(chan->mbox, struct cmdq, mbox);
@@ -112,6 +100,19 @@ u8 cmdq_get_shift_pa(struct mbox_chan *chan)
 }
 EXPORT_SYMBOL(cmdq_get_shift_pa);
 
+static void cmdq_gctl_value_toggle(struct cmdq *cmdq, bool ddr_enable)
+{
+	u32 val = cmdq->pdata->control_by_sw ? GCE_CTRL_BY_SW : 0;
+
+	if (!cmdq->pdata->control_by_sw && !cmdq->pdata->sw_ddr_en)
+		return;
+
+	if (cmdq->pdata->sw_ddr_en && ddr_enable)
+		val |= GCE_DDR_EN;
+
+	writel(val, cmdq->base + GCE_GCTL_VALUE);
+}
+
 static int cmdq_thread_suspend(struct cmdq *cmdq, struct cmdq_thread *thread)
 {
 	u32 status;
@@ -140,16 +141,10 @@ static void cmdq_thread_resume(struct cmdq_thread *thread)
 static void cmdq_init(struct cmdq *cmdq)
 {
 	int i;
-	u32 gctl_regval = 0;
 
 	WARN_ON(clk_bulk_enable(cmdq->pdata->gce_num, cmdq->clocks));
-	if (cmdq->pdata->control_by_sw)
-		gctl_regval = GCE_CTRL_BY_SW;
-	if (cmdq->pdata->sw_ddr_en)
-		gctl_regval |= GCE_DDR_EN;
 
-	if (gctl_regval)
-		writel(gctl_regval, cmdq->base + GCE_GCTL_VALUE);
+	cmdq_gctl_value_toggle(cmdq, true);
 
 	writel(CMDQ_THR_ACTIVE_SLOT_CYCLES, cmdq->base + CMDQ_THR_SLOT_CYCLES);
 	for (i = 0; i <= CMDQ_MAX_EVENT; i++)
@@ -315,14 +310,21 @@ static irqreturn_t cmdq_irq_handler(int irq, void *dev)
 static int cmdq_runtime_resume(struct device *dev)
 {
 	struct cmdq *cmdq = dev_get_drvdata(dev);
+	int ret;
 
-	return clk_bulk_enable(cmdq->pdata->gce_num, cmdq->clocks);
+	ret = clk_bulk_enable(cmdq->pdata->gce_num, cmdq->clocks);
+	if (ret)
+		return ret;
+
+	cmdq_gctl_value_toggle(cmdq, true);
+	return 0;
 }
 
 static int cmdq_runtime_suspend(struct device *dev)
 {
 	struct cmdq *cmdq = dev_get_drvdata(dev);
 
+	cmdq_gctl_value_toggle(cmdq, false);
 	clk_bulk_disable(cmdq->pdata->gce_num, cmdq->clocks);
 	return 0;
 }
@@ -347,9 +349,6 @@ static int cmdq_suspend(struct device *dev)
 	if (task_running)
 		dev_warn(dev, "exist running task(s) in suspend\n");
 
-	if (cmdq->pdata->sw_ddr_en)
-		cmdq_sw_ddr_enable(cmdq, false);
-
 	return pm_runtime_force_suspend(dev);
 }
 
@@ -360,9 +359,6 @@ static int cmdq_resume(struct device *dev)
 	WARN_ON(pm_runtime_force_resume(dev));
 	cmdq->suspended = false;
 
-	if (cmdq->pdata->sw_ddr_en)
-		cmdq_sw_ddr_enable(cmdq, true);
-
 	return 0;
 }
 
@@ -370,9 +366,6 @@ static void cmdq_remove(struct platform_device *pdev)
 {
 	struct cmdq *cmdq = platform_get_drvdata(pdev);
 
-	if (cmdq->pdata->sw_ddr_en)
-		cmdq_sw_ddr_enable(cmdq, false);
-
 	if (!IS_ENABLED(CONFIG_PM))
 		cmdq_runtime_suspend(&pdev->dev);
 
-- 
2.43.0

