Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DD4298245;
	Thu, 15 May 2025 09:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747301714; cv=none; b=c2m0DZOrjGRd74mqSwouCxgLAmTfp4Qg1TuZX2pBmNVXcieSEyjrIFa8wp6X/Q4IXU8Oc0kclxe/bjESi2pg5wAL4URS4jjXU5mAvneiHwEKGtTpMRMv9zB5QnymmtK8BVpZqOxvvz7+kt52HHM/f68VWq9QvBDbRftZ/1GmU+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747301714; c=relaxed/simple;
	bh=gkS3fY0yUtakWsEClR9Oj7imW0u/HL6V6CiGi08HJcs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=izC+3VfVT6puFOlaIP3BhlgfRtdmWMMKRSmrwG50y0kwqqFc9pzLMy9k0vVxsBlt9X+AwOdr8NPB6z4yW0HrFmMbNVne1bhUigj7buU+QepLkxvOtWs5bc/0AMsMUPwuZe/FBsLhKVBZT4jJscNR/LIADI2gc2zHJPT5guKhQAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=C5qW2hua; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="C5qW2hua"
X-UUID: e3ad1e40316f11f082f7f7ac98dee637-20250515
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=uANE6YtuOzoDy4yZ+j82kd7aME3T0hDL7pX3USXZ8FQ=;
	b=C5qW2huaI9F2AeSMU16Ta6g1caYMulghx+rAzdBHVNln60g+EMj8+r7vUIhVyJ7kLExpxVIMV9LhE2G6AuBdSYcH349MMCqL6IlbUKGLRiZjIwqtZKb4JrKVXtKtxC4fx5+KLZ+q1yHrKrzqOxBB2/0+y2agSGBjJN10CD78hXQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:dbf7ca47-2a28-4646-9242-dc3c9110b567,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:6795cb73-805e-40ad-809d-9cec088f3bd8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e3ad1e40316f11f082f7f7ac98dee637-20250515
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <paul-pl.chen@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1777004406; Thu, 15 May 2025 17:35:07 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 15 May 2025 17:35:06 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 15 May 2025 17:35:06 +0800
From: paul-pl.chen <paul-pl.chen@mediatek.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<chunkuang.hu@kernel.org>, <angelogioacchino.delregno@collabora.com>
CC: <matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>,
	<jason-jh.lin@mediatek.com>, <nancy.lin@mediatek.com>,
	<singo.chang@mediatek.com>, <xiandong.wang@mediatek.com>,
	<sirius.wang@mediatek.com>, <paul-pl.chen@mediatek.com>,
	<sunny.shen@mediatek.com>, <fshao@chromium.org>, <treapking@chromium.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3 07/17] soc: mediatek: mutex: Reused the switch case for SOF ID
Date: Thu, 15 May 2025 17:34:19 +0800
Message-ID: <20250515093454.1729720-8-paul-pl.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250515093454.1729720-1-paul-pl.chen@mediatek.com>
References: <20250515093454.1729720-1-paul-pl.chen@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Paul-pl Chen <paul-pl.chen@mediatek.com>

Reused the switch case for SOF IDs.

Signed-off-by: Nancy Lin <nancy.lin@mediatek.com>
Signed-off-by: Paul-pl Chen <paul-pl.chen@mediatek.com>
---
 drivers/soc/mediatek/mtk-mutex.c | 81 ++++++++++++++------------------
 1 file changed, 36 insertions(+), 45 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index aaa965d4b050..47f4d9ae4bfc 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -853,43 +853,45 @@ void mtk_mutex_unprepare(struct mtk_mutex *mutex)
 }
 EXPORT_SYMBOL_GPL(mtk_mutex_unprepare);
 
-void mtk_mutex_add_comp(struct mtk_mutex *mutex,
-			enum mtk_ddp_comp_id id)
+static int mtk_mutex_get_output_comp_sof(enum mtk_ddp_comp_id id)
 {
-	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
-						 mutex[mutex->id]);
-	unsigned int reg;
-	unsigned int sof_id;
-	unsigned int offset;
-
-	WARN_ON(&mtx->mutex[mutex->id] != mutex);
-
 	switch (id) {
 	case DDP_COMPONENT_DSI0:
-		sof_id = MUTEX_SOF_DSI0;
-		break;
+		return MUTEX_SOF_DSI0;
 	case DDP_COMPONENT_DSI1:
-		sof_id = MUTEX_SOF_DSI0;
-		break;
+		return MUTEX_SOF_DSI1;
 	case DDP_COMPONENT_DSI2:
-		sof_id = MUTEX_SOF_DSI2;
-		break;
+		return MUTEX_SOF_DSI2;
 	case DDP_COMPONENT_DSI3:
-		sof_id = MUTEX_SOF_DSI3;
-		break;
+		return MUTEX_SOF_DSI3;
 	case DDP_COMPONENT_DPI0:
-		sof_id = MUTEX_SOF_DPI0;
-		break;
+		return MUTEX_SOF_DPI0;
 	case DDP_COMPONENT_DPI1:
-		sof_id = MUTEX_SOF_DPI1;
-		break;
+		return MUTEX_SOF_DPI1;
 	case DDP_COMPONENT_DP_INTF0:
-		sof_id = MUTEX_SOF_DP_INTF0;
-		break;
+		return MUTEX_SOF_DP_INTF0;
 	case DDP_COMPONENT_DP_INTF1:
-		sof_id = MUTEX_SOF_DP_INTF1;
-		break;
+		return MUTEX_SOF_DP_INTF1;
 	default:
+		break;
+	}
+
+	return -EINVAL;
+}
+
+void mtk_mutex_add_comp(struct mtk_mutex *mutex,
+			enum mtk_ddp_comp_id id)
+{
+	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
+						 mutex[mutex->id]);
+	unsigned int reg;
+	unsigned int sof_id;
+	unsigned int offset;
+	int sof_id = mtk_mutex_get_output_comp_sof(id);
+
+	WARN_ON(&mtx->mutex[mutex->id] != mutex);
+
+	if (sof_id < 0) {
 		if (mtx->data->mutex_mod[id] < 32) {
 			offset = DISP_REG_MUTEX_MOD(mtx->data->mutex_mod_reg,
 						    mutex->id);
@@ -905,8 +907,7 @@ void mtk_mutex_add_comp(struct mtk_mutex *mutex,
 		return;
 	}
 
-	writel_relaxed(mtx->data->mutex_sof[sof_id],
-		       mtx->regs +
+	writel_relaxed(mtx->data->mutex_sof[sof_id], mtx->regs +
 		       DISP_REG_MUTEX_SOF(mtx->data->mutex_sof_reg, mutex->id));
 }
 EXPORT_SYMBOL_GPL(mtk_mutex_add_comp);
@@ -918,24 +919,10 @@ void mtk_mutex_remove_comp(struct mtk_mutex *mutex,
 						 mutex[mutex->id]);
 	unsigned int reg;
 	unsigned int offset;
-
+	int sof_id = mtk_mutex_get_output_comp_sof(id);
 	WARN_ON(&mtx->mutex[mutex->id] != mutex);
 
-	switch (id) {
-	case DDP_COMPONENT_DSI0:
-	case DDP_COMPONENT_DSI1:
-	case DDP_COMPONENT_DSI2:
-	case DDP_COMPONENT_DSI3:
-	case DDP_COMPONENT_DPI0:
-	case DDP_COMPONENT_DPI1:
-	case DDP_COMPONENT_DP_INTF0:
-	case DDP_COMPONENT_DP_INTF1:
-		writel_relaxed(MUTEX_SOF_SINGLE_MODE,
-			       mtx->regs +
-			       DISP_REG_MUTEX_SOF(mtx->data->mutex_sof_reg,
-						  mutex->id));
-		break;
-	default:
+	if (sof_id < 0) {
 		if (mtx->data->mutex_mod[id] < 32) {
 			offset = DISP_REG_MUTEX_MOD(mtx->data->mutex_mod_reg,
 						    mutex->id);
@@ -948,8 +935,12 @@ void mtk_mutex_remove_comp(struct mtk_mutex *mutex,
 			reg &= ~(1 << (mtx->data->mutex_mod[id] - 32));
 			writel_relaxed(reg, mtx->regs + offset);
 		}
-		break;
+		return;
 	}
+
+	writel_relaxed(MUTEX_SOF_SINGLE_MODE,
+		       mtx->regs + DISP_REG_MUTEX_SOF(mtx->data->mutex_sof_reg,
+		       mutex->id));
 }
 EXPORT_SYMBOL_GPL(mtk_mutex_remove_comp);
 
-- 
2.45.2

