Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B29C29D0D
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 03:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744946809; cv=none; b=URhCQGiWNlpYS1vW8TSQa3+R7MjcR7uxoiJ+tlvOP7b/q3mM9KOu5JeBrGFbSPebsOeoO54HCB4TOftJPU23sENKosJiDz8GIQCGjL8+v/lbrw9OF5H1cJxbOa3R9QzsxmGdTkHDtFPRf8Dw4HUPpzUeMWV5EAaNDhAuNwOUFcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744946809; c=relaxed/simple;
	bh=lI8K1BUHclic9B55IA+Vg0JEWzLrNCYEjU1aEINtaBc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ed+c7XuSKmI/V1eut3OGptmXjk7jOqMC9PlHHhvCmHWgmdTv8WXKvcMESVgIVSQa4hUrEtTiqTR3O+18pX5pUoRShfCJ4YzkNA8yzII6g6hzM9Z9REeYDvnWZPl7rVZcaw5mwyy8uQfNhb46hz1xTtBg/LvSMTjGvwutwBuZCj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=tCNXBx7a; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="tCNXBx7a"
X-UUID: f0ea600c1c0411f0aae1fd9735fae912-20250418
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=InrEQrVqp3K1hemQqa6thTPxGOdQwWfEnlDdHiKCcgk=;
	b=tCNXBx7a67tEHKvYIOGq4zeCeeWKHsQ6bqfOhUiCSFeJfhIzDeuYggwiOwdFB11UJ8d/hxU3Xg3HSHve+qi8D4uWRCz2HyV0pzaRBIkQKnTkG4egdORkjF5LxorgGeFmbAwRMTzx99k/KVuU0LIoboa8RAzpKbBzPwJz2u6Jwig=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:85ebb040-edb3-4d8b-8b63-4d352ef96571,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:ec5bc08d-f5b8-47d5-8cf3-b68fe7530c9a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: f0ea600c1c0411f0aae1fd9735fae912-20250418
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <jianhua.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 665217415; Fri, 18 Apr 2025 11:26:39 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 18 Apr 2025 11:26:38 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 18 Apr 2025 11:26:37 +0800
From: Jianhua Lin <jianhua.lin@mediatek.com>
To: <mchehab@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, jianhua.lin
	<jianhua.lin@mediatek.com>
Subject: [PATCH 1/1] media: mediatek: jpeg: fix buffer alignment
Date: Fri, 18 Apr 2025 11:25:59 +0800
Message-ID: <20250418032559.31043-1-jianhua.lin@mediatek.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: "jianhua.lin" <jianhua.lin@mediatek.com>

The JPEG encoder image stride register must be MCU aligned.
For YUV422, it's 32-byte aligned, and for YUV420, it's
16-byte aligned.

The minimal DCT block size is 8x8, so the vertical buffer
alignment for YUV422 is 8-byte aligned, and for YUV420,
it's 16-byte aligned.

Signed-off-by: jianhua.lin <jianhua.lin@mediatek.com>
---
 .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 24 +++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 834d2a354692..7dd652e5b6d4 100644
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
-- 
2.46.0

