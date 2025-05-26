Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2171876
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 06:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748241061; cv=none; b=AW/cauaxOsgow9sN2yTSNlsj6rqLAvYt95zHcoLfYpkKZRWxdAIFQyoKvVnkgnhsoUyFmylqqyy2poNZfBGPsAs/Ku/IACP6SZppjXmzXvqoQYNDpSZh/eGaZXbFI4xFfE5xQefqrYmbhKPKL+uln+dnEJEZPd/Osa5C+SXnYz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748241061; c=relaxed/simple;
	bh=dtYjwa1A2COHdCpsGsm63N0yHtj+3ULwh9NDl3jsP7I=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uQxX5JpvZHdfHA3DIxyOEjF3hpQhLjOOyeDoq5Qs+FQYnm65iA5Jj1AkaZxIn3dJvccfTtpCX59Tn1w8svV6k3vX2K65kb1MZJUWIA7jK/glzKA8CSPyZKShaYIsr5dcg2npw9TnIFUIbZbdhHwGUpKj0qw9RZseUciQrFlKJY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=bXHgzdra; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="bXHgzdra"
X-UUID: fa65d3f039fa11f082f7f7ac98dee637-20250526
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=RSrUR1DGD47JXZdimmoByInAoeHNIlKhw1JAx4cj1B0=;
	b=bXHgzdraeOWzHhNrsfyZmzX4MJu57Im6qbUMiS/S7F1WXkTzJOGUZhjgmxFO/iBrBm1pFRbDLAIcrZoyIbUnVA3EYrifrPlmXJgmZsxgm4dGO16CtpqpeH51thBVwMgD1aIdWGWsYX3BpA1+1mTwI5OgyLwydS8cmH8CbDNjlPc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:78c11253-a1e1-4ea8-b3df-3d977892a1fd,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:d01fba47-ee4f-4716-aedb-66601021a588,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-UUID: fa65d3f039fa11f082f7f7ac98dee637-20250526
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <jianhua.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1692202911; Mon, 26 May 2025 14:30:55 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 26 May 2025 14:30:53 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 26 May 2025 14:30:52 +0800
From: Jianhua Lin <jianhua.lin@mediatek.com>
To: <mchehab@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jianhua Lin
	<jianhua.lin@mediatek.com>
Subject: [PATCH v2 1/1] media: mediatek: jpeg: add compatible for MT8188 SoC
Date: Mon, 26 May 2025 14:30:44 +0800
Message-ID: <20250526063044.1513-1-jianhua.lin@mediatek.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add jpeg decoder and encoder compatible for MediaTek MT8188 SoC,
and enable support_34bit.

Signed-off-by: Jianhua Lin <jianhua.lin@mediatek.com>
---
Changes compared with v1:
- Update the dependent commit information only.

This patch depends on the following commit:
[1]
Commit: https://git.linuxtv.org/media.git/commit/?id=7560349ee0d9441642da6d38c3822d08fffdd2fb
Title: [PATCH] media: mediatek: jpeg: support 34bits

The above commit introduces a new variable 'support_34bit', that is required 
for enable 34-bit iova support in this patch. Without the changes in this commit,
it will not work and cause compile error.

 .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 23692cd91e2c..0ed1c352bc0f 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1869,6 +1869,10 @@ static struct clk_bulk_data mtk_jpeg_clocks[] = {
 	{ .id = "jpgenc" },
 };
 
+static struct clk_bulk_data mtk_jpeg_dec_clocks[] = {
+	{ .id = "jpgdec" },
+};
+
 static struct clk_bulk_data mt8173_jpeg_dec_clocks[] = {
 	{ .id = "jpgdec-smi" },
 	{ .id = "jpgdec" },
@@ -1931,6 +1935,38 @@ static const struct mtk_jpeg_variant mtk8195_jpegdec_drvdata = {
 	.jpeg_worker = mtk_jpegdec_worker,
 };
 
+static const struct mtk_jpeg_variant mtk8188_jpegenc_drvdata = {
+	.clks = mtk_jpeg_clocks,
+	.num_clks = ARRAY_SIZE(mtk_jpeg_clocks),
+	.formats = mtk_jpeg_enc_formats,
+	.num_formats = MTK_JPEG_ENC_NUM_FORMATS,
+	.qops = &mtk_jpeg_enc_qops,
+	.irq_handler = mtk_jpeg_enc_irq,
+	.hw_reset = mtk_jpeg_enc_reset,
+	.m2m_ops = &mtk_jpeg_enc_m2m_ops,
+	.dev_name = "mtk-jpeg-enc",
+	.ioctl_ops = &mtk_jpeg_enc_ioctl_ops,
+	.out_q_default_fourcc = V4L2_PIX_FMT_YUYV,
+	.cap_q_default_fourcc = V4L2_PIX_FMT_JPEG,
+	.support_34bit = true,
+};
+
+static const struct mtk_jpeg_variant mtk8188_jpegdec_drvdata = {
+	.clks = mtk_jpeg_dec_clocks,
+	.num_clks = ARRAY_SIZE(mtk_jpeg_dec_clocks),
+	.formats = mtk_jpeg_dec_formats,
+	.num_formats = MTK_JPEG_DEC_NUM_FORMATS,
+	.qops = &mtk_jpeg_dec_qops,
+	.irq_handler = mtk_jpeg_dec_irq,
+	.hw_reset = mtk_jpeg_dec_reset,
+	.m2m_ops = &mtk_jpeg_dec_m2m_ops,
+	.dev_name = "mtk-jpeg-dec",
+	.ioctl_ops = &mtk_jpeg_dec_ioctl_ops,
+	.out_q_default_fourcc = V4L2_PIX_FMT_JPEG,
+	.cap_q_default_fourcc = V4L2_PIX_FMT_YUV420M,
+	.support_34bit = true,
+};
+
 static const struct of_device_id mtk_jpeg_match[] = {
 	{
 		.compatible = "mediatek,mt8173-jpgdec",
@@ -1952,6 +1988,14 @@ static const struct of_device_id mtk_jpeg_match[] = {
 		.compatible = "mediatek,mt8195-jpgdec",
 		.data = &mtk8195_jpegdec_drvdata,
 	},
+	{
+		.compatible = "mediatek,mt8188-jpgenc",
+		.data = &mtk8188_jpegenc_drvdata,
+	},
+	{
+		.compatible = "mediatek,mt8188-jpgdec",
+		.data = &mtk8188_jpegdec_drvdata,
+	},
 	{},
 };
 
-- 
2.46.0

