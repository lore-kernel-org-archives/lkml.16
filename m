Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE38419CC28
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 02:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750387398; cv=none; b=SlIKrrs2pHkRnrJ9wQPdCiwNWQlTeJ3PDr6KNnuz4vQwVUGboDOcHupoROPvOuxHPz9je03CqpPTcKT/pQIFT6Lb873/vVfCS3OoPv4sAHI7CwPjncVWmbtr7LxHul1wQOszkU65S80LpfZ+sWW6Ab0fdd3/7CcUwfN1O0d4oYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750387398; c=relaxed/simple;
	bh=ntRXlQbRlzbJ2TN6w8EB5YisNDNmzTBncSv6l1sNq/M=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=s2Fo6uvjrJqPa6k86ZywIy2nO+iWjiJ19AweeyOENvuVaFbufXWQ45qRdooaWbunXRK83a65FCKUYViIHaXdXjDuFhQpkojf79fWg+zy5fGNvDgAU3S9sevGjxzMW3Z/j5ghEY7XU194oAfjY1fWUGmr2aZb41TjMZRQ3pDdAh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=IJLRmqXe; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="IJLRmqXe"
X-UUID: 4d6c91d64d8011f0b33aeb1e7f16c2b6-20250620
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=/oiy3GhiSWtAVndt7S57VEPB3oDTFIIzIGasDLA5Khk=;
	b=IJLRmqXelBxLLiiCphkcjZF8En8vba/bVcyapMo0VV1kb5H2aRsu6oQUWJ+Y+41TnhPd7SrGUEiHE5kwv3r2yW8RAcc6k8WONWcH6GaxXHCsk1X6/9dYUzh2F1FdC/94GEiEyBxgHGdsS5wgHJIVhq0ri6eRRigpbahFJVacvRY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.3,REQID:3b250f45-1b25-4f4c-83a2-7e4fc80dbb2b,IP:0,UR
	L:0,TC:0,Content:0,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-30
X-CID-META: VersionHash:09905cf,CLOUDID:e445e258-abad-4ac2-9923-3af0a8a9a079,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:2,IP:nil
	,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:
	1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4d6c91d64d8011f0b33aeb1e7f16c2b6-20250620
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 229595471; Fri, 20 Jun 2025 10:43:09 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 20 Jun 2025 10:43:07 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 20 Jun 2025 10:43:07 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Jason-JH Lin
	<jason-jh.lin@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Paul-PL Chen <paul-pl.chen@mediatek.com>,
	Yongqiang Niu <yongqiang.niu@mediatek.com>, Zhenxing Qin
	<zhenxing.qin@mediatek.com>, Xiandong Wang <xiandong.wang@mediatek.com>,
	Sirius Wang <sirius.wang@mediatek.com>, Xavier Chang
	<xavier.chang@mediatek.com>, Jarried Lin <jarried.lin@mediatek.com>, Fei Shao
	<fshao@chromium.org>, Chen-yu Tsai <wenst@chromium.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH] soc: mediatek: mtk-mutex: Fix confusing usage of MUTEX_MOD2
Date: Fri, 20 Jun 2025 10:40:23 +0800
Message-ID: <20250620024305.2303935-1-jason-jh.lin@mediatek.com>
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

The usage of MUTEX_MOD1 and MUTEX_MOD2 for calculating mod settings
over 32 has been confusing. To improve consistency and clarity, these
defines need to fit into the same MUTEX_MOD define as possible.

However, MUTEX_MOD1 cannot be directly used for all SoCs because,
for example, the mod1 register (0x34) of MT2712 is not adjacent to
its mod0 register (0x2c). To address this, a `mutex_mod1_reg` field
is introduced in the mutex driver data structure. This allows all
SoCs to use a unified MUTEX_MOD to determine their register offsets.

With this change, the separate usage of MUTEX_MOD1 and MUTEX_MOD2 is
eliminated, simplifying the logic for obtaining offsets and mod IDs.

Fixes: e1e4f7fea375 ("soc / drm: mediatek: Move mtk mutex driver to soc folder")
Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
---
 drivers/soc/mediatek/mtk-mutex.c | 109 ++++++++++++++++---------------
 1 file changed, 56 insertions(+), 53 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index aaa965d4b050..38179e8cd98f 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -17,16 +17,35 @@
 
 #define MT2701_MUTEX0_MOD0			0x2c
 #define MT2701_MUTEX0_SOF0			0x30
+#define MT2701_MUTEX0_MOD1			0x34
+
 #define MT8183_MUTEX0_MOD0			0x30
+#define MT8183_MUTEX0_MOD1			0x34
 #define MT8183_MUTEX0_SOF0			0x2c
 
 #define DISP_REG_MUTEX_EN(n)			(0x20 + 0x20 * (n))
 #define DISP_REG_MUTEX(n)			(0x24 + 0x20 * (n))
 #define DISP_REG_MUTEX_RST(n)			(0x28 + 0x20 * (n))
-#define DISP_REG_MUTEX_MOD(mutex_mod_reg, n)	(mutex_mod_reg + 0x20 * (n))
-#define DISP_REG_MUTEX_MOD1(mutex_mod_reg, n)	((mutex_mod_reg) + 0x20 * (n) + 0x4)
+/*
+ * Some SoCs may have multiple MUTEX_MOD registers as more than 32 mods
+ * are present, hence requiring multiple 32-bits registers.
+ *
+ * The mutex_table_mod fully represents that by defining the number of
+ * the mod sequentially, later used as a bit number, which can be more
+ * than 0..31.
+ *
+ * In order to retain compatibility with older SoCs, we perform R/W on
+ * the single 32 bits registers, but this requires us to translate the
+ * mutex ID bit accordingly.
+ */
+#define DISP_REG_MUTEX_MOD(mutex, id, n) ({ \
+	const typeof(mutex) _mutex = (mutex); \
+	u32 _offset = (id) < 32 ? \
+		      _mutex->data->mutex_mod_reg : \
+		      _mutex->data->mutex_mod1_reg; \
+	_offset + 0x20 * (n); \
+})
 #define DISP_REG_MUTEX_SOF(mutex_sof_reg, n)	(mutex_sof_reg + 0x20 * (n))
-#define DISP_REG_MUTEX_MOD2(n)			(0x34 + 0x20 * (n))
 
 #define INT_MUTEX				BIT(1)
 
@@ -334,6 +353,7 @@ struct mtk_mutex_data {
 	const u8 *mutex_table_mod;
 	const u16 *mutex_sof;
 	const u16 mutex_mod_reg;
+	const u16 mutex_mod1_reg;
 	const u16 mutex_sof_reg;
 	const bool no_clk;
 };
@@ -714,6 +734,7 @@ static const struct mtk_mutex_data mt2701_mutex_driver_data = {
 	.mutex_mod = mt2701_mutex_mod,
 	.mutex_sof = mt2712_mutex_sof,
 	.mutex_mod_reg = MT2701_MUTEX0_MOD0,
+	.mutex_mod1_reg = MT2701_MUTEX0_MOD1,
 	.mutex_sof_reg = MT2701_MUTEX0_SOF0,
 };
 
@@ -721,6 +742,7 @@ static const struct mtk_mutex_data mt2712_mutex_driver_data = {
 	.mutex_mod = mt2712_mutex_mod,
 	.mutex_sof = mt2712_mutex_sof,
 	.mutex_mod_reg = MT2701_MUTEX0_MOD0,
+	.mutex_mod1_reg = MT2701_MUTEX0_MOD1,
 	.mutex_sof_reg = MT2701_MUTEX0_SOF0,
 };
 
@@ -728,6 +750,7 @@ static const struct mtk_mutex_data mt6795_mutex_driver_data = {
 	.mutex_mod = mt8173_mutex_mod,
 	.mutex_sof = mt6795_mutex_sof,
 	.mutex_mod_reg = MT2701_MUTEX0_MOD0,
+	.mutex_mod1_reg = MT2701_MUTEX0_MOD1,
 	.mutex_sof_reg = MT2701_MUTEX0_SOF0,
 };
 
@@ -735,6 +758,7 @@ static const struct mtk_mutex_data mt8167_mutex_driver_data = {
 	.mutex_mod = mt8167_mutex_mod,
 	.mutex_sof = mt8167_mutex_sof,
 	.mutex_mod_reg = MT2701_MUTEX0_MOD0,
+	.mutex_mod1_reg = MT2701_MUTEX0_MOD1,
 	.mutex_sof_reg = MT2701_MUTEX0_SOF0,
 	.no_clk = true,
 };
@@ -743,6 +767,7 @@ static const struct mtk_mutex_data mt8173_mutex_driver_data = {
 	.mutex_mod = mt8173_mutex_mod,
 	.mutex_sof = mt2712_mutex_sof,
 	.mutex_mod_reg = MT2701_MUTEX0_MOD0,
+	.mutex_mod1_reg = MT2701_MUTEX0_MOD1,
 	.mutex_sof_reg = MT2701_MUTEX0_SOF0,
 };
 
@@ -750,6 +775,7 @@ static const struct mtk_mutex_data mt8183_mutex_driver_data = {
 	.mutex_mod = mt8183_mutex_mod,
 	.mutex_sof = mt8183_mutex_sof,
 	.mutex_mod_reg = MT8183_MUTEX0_MOD0,
+	.mutex_mod1_reg = MT8183_MUTEX0_MOD1,
 	.mutex_sof_reg = MT8183_MUTEX0_SOF0,
 	.mutex_table_mod = mt8183_mutex_table_mod,
 	.no_clk = true,
@@ -757,6 +783,7 @@ static const struct mtk_mutex_data mt8183_mutex_driver_data = {
 
 static const struct mtk_mutex_data mt8186_mdp_mutex_driver_data = {
 	.mutex_mod_reg = MT8183_MUTEX0_MOD0,
+	.mutex_mod1_reg = MT8183_MUTEX0_MOD1,
 	.mutex_sof_reg = MT8183_MUTEX0_SOF0,
 	.mutex_table_mod = mt8186_mdp_mutex_table_mod,
 };
@@ -765,6 +792,7 @@ static const struct mtk_mutex_data mt8186_mutex_driver_data = {
 	.mutex_mod = mt8186_mutex_mod,
 	.mutex_sof = mt8186_mutex_sof,
 	.mutex_mod_reg = MT8183_MUTEX0_MOD0,
+	.mutex_mod1_reg = MT8183_MUTEX0_MOD1,
 	.mutex_sof_reg = MT8183_MUTEX0_SOF0,
 };
 
@@ -772,12 +800,14 @@ static const struct mtk_mutex_data mt8188_mutex_driver_data = {
 	.mutex_mod = mt8188_mutex_mod,
 	.mutex_sof = mt8188_mutex_sof,
 	.mutex_mod_reg = MT8183_MUTEX0_MOD0,
+	.mutex_mod1_reg = MT8183_MUTEX0_MOD1,
 	.mutex_sof_reg = MT8183_MUTEX0_SOF0,
 };
 
 static const struct mtk_mutex_data mt8188_vpp_mutex_driver_data = {
 	.mutex_sof = mt8188_mutex_sof,
 	.mutex_mod_reg = MT8183_MUTEX0_MOD0,
+	.mutex_mod1_reg = MT8183_MUTEX0_MOD1,
 	.mutex_sof_reg = MT8183_MUTEX0_SOF0,
 	.mutex_table_mod = mt8188_mdp_mutex_table_mod,
 };
@@ -786,6 +816,7 @@ static const struct mtk_mutex_data mt8192_mutex_driver_data = {
 	.mutex_mod = mt8192_mutex_mod,
 	.mutex_sof = mt8183_mutex_sof,
 	.mutex_mod_reg = MT8183_MUTEX0_MOD0,
+	.mutex_mod1_reg = MT8183_MUTEX0_MOD1,
 	.mutex_sof_reg = MT8183_MUTEX0_SOF0,
 };
 
@@ -793,12 +824,14 @@ static const struct mtk_mutex_data mt8195_mutex_driver_data = {
 	.mutex_mod = mt8195_mutex_mod,
 	.mutex_sof = mt8195_mutex_sof,
 	.mutex_mod_reg = MT8183_MUTEX0_MOD0,
+	.mutex_mod1_reg = MT8183_MUTEX0_MOD1,
 	.mutex_sof_reg = MT8183_MUTEX0_SOF0,
 };
 
 static const struct mtk_mutex_data mt8195_vpp_mutex_driver_data = {
 	.mutex_sof = mt8195_mutex_sof,
 	.mutex_mod_reg = MT8183_MUTEX0_MOD0,
+	.mutex_mod1_reg = MT8183_MUTEX0_MOD1,
 	.mutex_sof_reg = MT8183_MUTEX0_SOF0,
 	.mutex_table_mod = mt8195_mutex_table_mod,
 };
@@ -807,6 +840,7 @@ static const struct mtk_mutex_data mt8365_mutex_driver_data = {
 	.mutex_mod = mt8365_mutex_mod,
 	.mutex_sof = mt8183_mutex_sof,
 	.mutex_mod_reg = MT8183_MUTEX0_MOD0,
+	.mutex_mod1_reg = MT8183_MUTEX0_MOD1,
 	.mutex_sof_reg = MT8183_MUTEX0_SOF0,
 	.no_clk = true,
 };
@@ -859,7 +893,7 @@ void mtk_mutex_add_comp(struct mtk_mutex *mutex,
 	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
 						 mutex[mutex->id]);
 	unsigned int reg;
-	unsigned int sof_id;
+	unsigned int sof_id, mod_id;
 	unsigned int offset;
 
 	WARN_ON(&mtx->mutex[mutex->id] != mutex);
@@ -890,18 +924,11 @@ void mtk_mutex_add_comp(struct mtk_mutex *mutex,
 		sof_id = MUTEX_SOF_DP_INTF1;
 		break;
 	default:
-		if (mtx->data->mutex_mod[id] < 32) {
-			offset = DISP_REG_MUTEX_MOD(mtx->data->mutex_mod_reg,
-						    mutex->id);
-			reg = readl_relaxed(mtx->regs + offset);
-			reg |= 1 << mtx->data->mutex_mod[id];
-			writel_relaxed(reg, mtx->regs + offset);
-		} else {
-			offset = DISP_REG_MUTEX_MOD2(mutex->id);
-			reg = readl_relaxed(mtx->regs + offset);
-			reg |= 1 << (mtx->data->mutex_mod[id] - 32);
-			writel_relaxed(reg, mtx->regs + offset);
-		}
+		offset = DISP_REG_MUTEX_MOD(mtx, mtx->data->mutex_mod[id], mutex->id);
+		mod_id = mtx->data->mutex_mod[id] % 32;
+		reg = readl_relaxed(mtx->regs + offset);
+		reg |= BIT(mod_id);
+		writel_relaxed(reg, mtx->regs + offset);
 		return;
 	}
 
@@ -917,6 +944,7 @@ void mtk_mutex_remove_comp(struct mtk_mutex *mutex,
 	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
 						 mutex[mutex->id]);
 	unsigned int reg;
+	unsigned int mod_id;
 	unsigned int offset;
 
 	WARN_ON(&mtx->mutex[mutex->id] != mutex);
@@ -936,18 +964,11 @@ void mtk_mutex_remove_comp(struct mtk_mutex *mutex,
 						  mutex->id));
 		break;
 	default:
-		if (mtx->data->mutex_mod[id] < 32) {
-			offset = DISP_REG_MUTEX_MOD(mtx->data->mutex_mod_reg,
-						    mutex->id);
-			reg = readl_relaxed(mtx->regs + offset);
-			reg &= ~(1 << mtx->data->mutex_mod[id]);
-			writel_relaxed(reg, mtx->regs + offset);
-		} else {
-			offset = DISP_REG_MUTEX_MOD2(mutex->id);
-			reg = readl_relaxed(mtx->regs + offset);
-			reg &= ~(1 << (mtx->data->mutex_mod[id] - 32));
-			writel_relaxed(reg, mtx->regs + offset);
-		}
+		offset = DISP_REG_MUTEX_MOD(mtx, mtx->data->mutex_mod[id], mutex->id);
+		mod_id = mtx->data->mutex_mod[id] % 32;
+		reg = readl_relaxed(mtx->regs + offset);
+		reg &= ~BIT(mod_id);
+		writel_relaxed(reg, mtx->regs + offset);
 		break;
 	}
 }
@@ -1023,7 +1044,7 @@ int mtk_mutex_write_mod(struct mtk_mutex *mutex,
 	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
 						 mutex[mutex->id]);
 	unsigned int reg;
-	u32 reg_offset, id_offset = 0;
+	u32 offset, mod_id;
 
 	WARN_ON(&mtx->mutex[mutex->id] != mutex);
 
@@ -1033,34 +1054,16 @@ int mtk_mutex_write_mod(struct mtk_mutex *mutex,
 		return -EINVAL;
 	}
 
-	/*
-	 * Some SoCs may have multiple MUTEX_MOD registers as more than 32 mods
-	 * are present, hence requiring multiple 32-bits registers.
-	 *
-	 * The mutex_table_mod fully represents that by defining the number of
-	 * the mod sequentially, later used as a bit number, which can be more
-	 * than 0..31.
-	 *
-	 * In order to retain compatibility with older SoCs, we perform R/W on
-	 * the single 32 bits registers, but this requires us to translate the
-	 * mutex ID bit accordingly.
-	 */
-	if (mtx->data->mutex_table_mod[idx] < 32) {
-		reg_offset = DISP_REG_MUTEX_MOD(mtx->data->mutex_mod_reg,
-						mutex->id);
-	} else {
-		reg_offset = DISP_REG_MUTEX_MOD1(mtx->data->mutex_mod_reg,
-						 mutex->id);
-		id_offset = 32;
-	}
+	offset = DISP_REG_MUTEX_MOD(mtx, mtx->data->mutex_table_mod[idx], mutex->id);
+	mod_id = mtx->data->mutex_table_mod[idx] % 32;
 
-	reg = readl_relaxed(mtx->regs + reg_offset);
+	reg = readl_relaxed(mtx->regs + offset);
 	if (clear)
-		reg &= ~BIT(mtx->data->mutex_table_mod[idx] - id_offset);
+		reg &= ~BIT(mod_id);
 	else
-		reg |= BIT(mtx->data->mutex_table_mod[idx] - id_offset);
+		reg |= BIT(mod_id);
 
-	writel_relaxed(reg, mtx->regs + reg_offset);
+	writel_relaxed(reg, mtx->regs + offset);
 
 	return 0;
 }
-- 
2.43.0

