Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34AD81F3B9E
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 09:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748251882; cv=none; b=KHXI3Jg2nLKCD15gSMCKvBxlCJWgjwFB106XpGev0f8oJUSFz7oH/srooO2Uh1kcyNcKGy9+PCGu1QjU0sc8KF5ccGEeVt/Nmm2RAMsTOifXwYW5U4sOsyVX26YtypLig2sjhE8YGECOOXPrMtKEhEbAxG7q0ynnrzAKF42adN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748251882; c=relaxed/simple;
	bh=BfGckkaQnw2luP/9LBMeXxDonwSoHkPB73mAHs3LDUM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qgzn2BF49nvQKbYcVUTXVWI8C4yHvxVd2vaQT+/A8j2rAmgCC5uJohNxk5g5k6cRJecigkuhGheS91chqpI/k0e+bCCsTl/yu8zRMNwL3Oo0Zkw1GdiP/X4iYjtnLCl5khvxm9K4jr8oga7mvnaIMaQin75s7vgwIT00VOS05w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=nLoyAINq; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="nLoyAINq"
X-UUID: 2b5f4d4c3a1411f082f7f7ac98dee637-20250526
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=TsqK265oLm/0uarem/Dreqj8T9Zp1mnl8bMAWmwVf4E=;
	b=nLoyAINqk5euZ/l3XLC8uZDRUlp23WGCo19j7ADwSF3hCPgkPN/OXq/hUfRKA41n4uLI/XJ8vJ4UeS/7p5ODob8tshvFLaiTEZTbS2UUehKnHIT1BIEuOXtyCGmP90i9eZIDWW2uhK3FHJ1fqipf9KKcQITL7d/rXONsagR0l0k=;
X-CID-CACHE: Type:Local,Time:202505261718+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:354275f5-f53d-45b7-ac9a-6a93ac65be33,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:b0ae49f1-2ded-45ed-94e2-b3e9fa87100d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:-7|-6|0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,USB|NGT
X-CID-BAS: 2,USB|NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 2b5f4d4c3a1411f082f7f7ac98dee637-20250526
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <jianhua.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 939124715; Mon, 26 May 2025 17:31:14 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 26 May 2025 17:31:12 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 26 May 2025 17:31:12 +0800
From: Jianhua Lin <jianhua.lin@mediatek.com>
To: <mchehab@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jianhua Lin
	<jianhua.lin@mediatek.com>
Subject:
Date: Mon, 26 May 2025 17:31:09 +0800
Message-ID: <20250526093109.4681-1-jianhua.lin@mediatek.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Jianhua Lin <jianhua.lin@mediatek.com>
Date: Thu, 17 Apr 2025 11:28:00 +0800
Subject: [PATCH v3 1/1] media: mediatek: jpeg: fix buffer alignment

The JPEG encoder image stride register must be MCU aligned.
For YUV422, it's 32-byte aligned, and for YUV420, it's
16-byte aligned.

The minimal DCT block size is 8x8, so the vertical buffer
alignment for YUV422 is 8-byte aligned, and for YUV420,
it's 16-byte aligned.

Signed-off-by: Jianhua Lin <jianhua.lin@mediatek.com>
---
Changes compared with v2:
- Add missing subject

Changes compared with v1:
- Fix the side effects of v1
  when encoding YUV420 with resolution 720x480, the ouput image is abnormal.
- Fix signed-off-by

 .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 44 ++++++++++++-------
 1 file changed, 29 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 834d2a354692..f01a81feb692 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -40,8 +40,8 @@ static struct mtk_jpeg_fmt mtk_jpeg_enc_formats[] = {
 		.h_sample	= {4, 4},
 		.v_sample	= {4, 2},
 		.colplanes	= 2,
-		.h_align	= 4,
-		.v_align	= 4,
+		.h_align	= 16,
+		.v_align	= 16,
 		.flags		= MTK_JPEG_FMT_FLAG_OUTPUT,
 	},
 	{
@@ -50,8 +50,8 @@ static struct mtk_jpeg_fmt mtk_jpeg_enc_formats[] = {
 		.h_sample	= {4, 4},
 		.v_sample	= {4, 2},
 		.colplanes	= 2,
-		.h_align	= 4,
-		.v_align	= 4,
+		.h_align	= 16,
+		.v_align	= 16,
 		.flags		= MTK_JPEG_FMT_FLAG_OUTPUT,
 	},
 	{
@@ -60,8 +60,8 @@ static struct mtk_jpeg_fmt mtk_jpeg_enc_formats[] = {
 		.h_sample	= {8},
 		.v_sample	= {4},
 		.colplanes	= 1,
-		.h_align	= 5,
-		.v_align	= 3,
+		.h_align	= 32,
+		.v_align	= 8,
 		.flags		= MTK_JPEG_FMT_FLAG_OUTPUT,
 	},
 	{
@@ -70,8 +70,8 @@ static struct mtk_jpeg_fmt mtk_jpeg_enc_formats[] = {
 		.h_sample	= {8},
 		.v_sample	= {4},
 		.colplanes	= 1,
-		.h_align	= 5,
-		.v_align	= 3,
+		.h_align	= 32,
+		.v_align	= 8,
 		.flags		= MTK_JPEG_FMT_FLAG_OUTPUT,
 	},
 };
@@ -87,8 +87,8 @@ static struct mtk_jpeg_fmt mtk_jpeg_dec_formats[] = {
 		.h_sample	= {4, 2, 2},
 		.v_sample	= {4, 2, 2},
 		.colplanes	= 3,
-		.h_align	= 5,
-		.v_align	= 4,
+		.h_align	= 16,
+		.v_align	= 16,
 		.flags		= MTK_JPEG_FMT_FLAG_CAPTURE,
 	},
 	{
@@ -96,8 +96,8 @@ static struct mtk_jpeg_fmt mtk_jpeg_dec_formats[] = {
 		.h_sample	= {4, 2, 2},
 		.v_sample	= {4, 4, 4},
 		.colplanes	= 3,
-		.h_align	= 5,
-		.v_align	= 3,
+		.h_align	= 32,
+		.v_align	= 8,
 		.flags		= MTK_JPEG_FMT_FLAG_CAPTURE,
 	},
 };
@@ -260,6 +260,7 @@ static int mtk_jpeg_try_fmt_mplane(struct v4l2_pix_format_mplane *pix_mp,
 				   struct mtk_jpeg_fmt *fmt)
 {
 	int i;
+	u32 h_align;
 
 	pix_mp->field = V4L2_FIELD_NONE;
 
@@ -283,9 +284,15 @@ static int mtk_jpeg_try_fmt_mplane(struct v4l2_pix_format_mplane *pix_mp,
 	}
 
 	/* other fourcc */
+	if (pix_mp->pixelformat == V4L2_PIX_FMT_YUYV ||
+	    pix_mp->pixelformat == V4L2_PIX_FMT_YVYU)
+		h_align = fmt->h_align / 2;
+	else
+		h_align = fmt->h_align;
+
 	pix_mp->height = clamp(round_up(pix_mp->height, fmt->v_align),
 			       MTK_JPEG_MIN_HEIGHT, MTK_JPEG_MAX_HEIGHT);
-	pix_mp->width = clamp(round_up(pix_mp->width, fmt->h_align),
+	pix_mp->width = clamp(round_up(pix_mp->width, h_align),
 			      MTK_JPEG_MIN_WIDTH, MTK_JPEG_MAX_WIDTH);
 
 	for (i = 0; i < fmt->colplanes; i++) {
@@ -293,8 +300,15 @@ static int mtk_jpeg_try_fmt_mplane(struct v4l2_pix_format_mplane *pix_mp,
 		u32 stride = pix_mp->width * fmt->h_sample[i] / 4;
 		u32 h = pix_mp->height * fmt->v_sample[i] / 4;
 
-		pfmt->bytesperline = stride;
-		pfmt->sizeimage = stride * h;
+		if (pix_mp->pixelformat == V4L2_PIX_FMT_YUYV ||
+		    pix_mp->pixelformat == V4L2_PIX_FMT_YVYU) {
+			stride = round_up(stride, fmt->h_align);
+			pfmt->bytesperline = stride;
+			pfmt->sizeimage = stride * h;
+		} else {
+			pfmt->bytesperline = stride;
+			pfmt->sizeimage = stride * h;
+		}
 	}
 	return 0;
 }
-- 
2.46.0

