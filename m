Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E83A7A13A
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 08:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745655646; cv=none; b=qtX3bRn+2CmE9pTRaRIeA431+T1HOhzUyXoZHLQYs2JExaPDcs+iuodbZXzZgJURQJ/L9pmkEgt1L9tmyYhfyV/T4pPxH7OkasAFh+338y1hX3SPGXiYdAE6OnSlZd4b5X+rVGypCk4XUgNT0/fwEdj5EpxjKhlhP9gZdKP3UKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745655646; c=relaxed/simple;
	bh=Dwwxhsf3DrUXH4HjRvabs4xjdIBB4OscvZ7siV62Lz4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TOxMhvn0UJeB4/vrXdyCpE64H23UJn4b/4OIRHH84vPoEVOTGCheRkEeDzK8wkxFF0FTTPdWoVZXaKWXN7Sa88pfHpc6ZypeeqNAnpzLi1wz3ETZUVhGMyckcAfqxHA9d5zChbc5AtHFuUoqI9QEaqNaERi174Dt96JySD+gcgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=riU3YVVc; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="riU3YVVc"
X-UUID: 5129deac227711f09b6713c7f6bde12e-20250426
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=QUmW/UxxLiRthI3rc4btwWDIo6V+L0AVY/1vBn7MiLA=;
	b=riU3YVVchC+JDvnHU401sXW69UvXvcJkdfLjR5UVvIRWPjOnhOsrn8p/VMQNtuHR3JH3jVUG1WpYjVubUpAyl8f+4VstS1GYLJDxsorFD7w29VwISGo9G3OjdrG3H4x4R/fOhr/Kn9KM92BF+DiAJSP9QgqVkwKCII+OIsCFN3g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:194811e5-388d-4220-80ae-79d32305ef66,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:05eed176-5fec-4b3e-b8cb-933843551e81,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 5129deac227711f09b6713c7f6bde12e-20250426
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <jianhua.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1949021144; Sat, 26 Apr 2025 16:20:30 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Sat, 26 Apr 2025 16:20:29 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Sat, 26 Apr 2025 16:20:28 +0800
From: Jianhua Lin <jianhua.lin@mediatek.com>
To: <mchehab@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jianhua Lin
	<jianhua.lin@mediatek.com>
Subject: [PATCH 1/1] media: mediatek: jpeg: add compatible for MT8188 SoC
Date: Sat, 26 Apr 2025 16:19:28 +0800
Message-ID: <20250426081928.27351-1-jianhua.lin@mediatek.com>
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
This series patches dependent on:
[1]
https://patchwork.linuxtv.org/project/linux-media/patch/20250424090824.5309-1-jianhua.lin@mediatek.com/

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

