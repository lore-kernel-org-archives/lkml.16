Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB48222FE05;
	Wed, 21 May 2025 09:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747818997; cv=none; b=jEuioOu1MwprAgXWoqBEQ9flro1paYBjwKjUar39xzCMAy1ubwWXKAN0UgxgiZydTFg//f5iSHcbNF1K0kTqm9xE5IjPHuCzX5BDbuxJv1i7uKUiWtEGxNxPe39prdxFHtkbIjI2juQxSs9u7M3p5dVC1q8++yx8zwoBop6JDlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747818997; c=relaxed/simple;
	bh=Os5BEGhbo5Ro+n3pseQorKPw4DP+SMKPlJFHFThCZ3Y=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UKMRKg7vt2D/Sbl5gZIohGvH5cdbZBbQBmIrQ2IXN2yICatoxRqrljfFA0VnsTgkYy+R0eqQdWECNSBo3RG4Sb33F//3WTIQs1hv21pPKla3F0K4xbKice4TXr9Y4GIubS7lbgnRMrJHkHDx5mwXZ+OZvgIzXWEf7LkpUVeGZTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=mEufUaEH; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="mEufUaEH"
X-UUID: 47bb8aee362411f0813e4fe1310efc19-20250521
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=xooKwfqKZPpKfPYNFtOO33yjWX3ExswTqq8/C09VJ7U=;
	b=mEufUaEHEu/GyMqip8M0lCENxgktP8osa2gQaCWjQzRjfVr9Jr2Djbm0c2oEEf4OCnbVIahcgFvRmT+VJshIcFgq1dYBUz5VaXnp2fwmruGcqn40tUO1dQtlUY9p0vO7PxJhnD+TVutl5RnUiMlI4lYH8AEQ3jd47pXu21No3XU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:78413b1b-2c89-47f2-9721-a765069505d1,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:c34ed057-abad-4ac2-9923-3af0a8a9a079,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 47bb8aee362411f0813e4fe1310efc19-20250521
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <friday.yang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1239329957; Wed, 21 May 2025 17:16:29 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 21 May 2025 17:16:27 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 21 May 2025 17:16:26 +0800
From: Friday Yang <friday.yang@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Krzysztof Kozlowski <krzk@kernel.org>, Rob
 Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Philipp Zabel
	<p.zabel@pengutronix.de>
CC: Friday Yang <friday.yang@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v1] memory: mtk-smi: Add ostd setting for mt8186
Date: Wed, 21 May 2025 17:16:16 +0800
Message-ID: <20250521091626.4283-1-friday.yang@mediatek.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add initial ostd setting for mt8186. All the settings come from DE.
These settings help adjust Multimedia HW's bandwidth limits to achieve
a balanced bandwidth requirement. Without this, the VENC HW works
abnormal while stress testing.

Fixes: 86a010bfc739 ("memory: mtk-smi: mt8186: Add smi support")
Signed-off-by: Friday Yang <friday.yang@mediatek.com>
---
 drivers/memory/mtk-smi.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index c086c22511f7..733e22f695ab 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -320,6 +320,38 @@ static const u8 mtk_smi_larb_mt6893_ostd[][SMI_LARB_PORT_NR_MAX] = {
 	[20] = {0x9, 0x9, 0x5, 0x5, 0x1, 0x1},
 };

+static const u8 mtk_smi_larb_mt8186_ostd[][SMI_LARB_PORT_NR_MAX] = {
+	[0] = {0x2, 0x1, 0x8, 0x1,},
+	[1] = {0x1, 0x3, 0x1, 0x1,},
+	[2] = {0x6, 0x1, 0x4, 0x1,},
+	[3] = {},
+	[4] = {0xf, 0x1, 0x5, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1,
+	       0x1, 0x1, 0x1,},
+	[5] = {},
+	[6] = {},
+	[7] = {0x1, 0x3, 0x1, 0x1, 0x1, 0x3, 0x2, 0xd, 0x7, 0x5, 0x3,
+	       0x1, 0x5,},
+	[8] = {0x1, 0x2, 0x2,},
+	[9] = {0x9, 0x7, 0xf, 0x8, 0x1, 0x8, 0x9, 0x3, 0x3, 0xb, 0x7, 0x4,
+	       0x9, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1,
+	       0x1, 0x1, 0x1, 0x1, 0x1,},
+	[10] = {},
+	[11] = {0x9, 0x7, 0xf, 0x8, 0x1, 0x8, 0x9, 0x3, 0x3, 0xb, 0x7, 0x4,
+		0x9, 0x1, 0x1, 0x1, 0x1, 0x1, 0x8, 0x7, 0x7, 0x1, 0x6, 0x2,
+		0xf, 0x8, 0x1, 0x1, 0x1,},
+	[12] = {},
+	[13] = {0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x6, 0x6, 0x6, 0x1, 0x1, 0x1,},
+	[14] = {0x1, 0x1, 0x1, 0x1, 0x1, 0x1,},
+	[15] = {},
+	[16] = {0x28, 0x14, 0x2, 0xc, 0x18, 0x1, 0x14, 0x1, 0x4, 0x4, 0x4,
+		0x2, 0x4, 0x2, 0x8, 0x4, 0x4,},
+	[17] = {0x28, 0x14, 0x2, 0xc, 0x18, 0x1, 0x14, 0x1, 0x4, 0x4, 0x4,
+		0x2, 0x4, 0x2, 0x8, 0x4, 0x4,},
+	[18] = {},
+	[19] = {0x1, 0x1, 0x1, 0x1,},
+	[20] = {0x2, 0x2, 0x2, 0x2, 0x1, 0x1,},
+};
+
 static const u8 mtk_smi_larb_mt8188_ostd[][SMI_LARB_PORT_NR_MAX] = {
 	[0] = {0x02, 0x18, 0x22, 0x22, 0x01, 0x02, 0x0a,},
 	[1] = {0x12, 0x02, 0x14, 0x14, 0x01, 0x18, 0x0a,},
@@ -491,6 +523,7 @@ static const struct mtk_smi_larb_gen mtk_smi_larb_mt8183 = {
 static const struct mtk_smi_larb_gen mtk_smi_larb_mt8186 = {
 	.config_port                = mtk_smi_larb_config_port_gen2_general,
 	.flags_general	            = MTK_SMI_FLAG_SLEEP_CTL,
+	.ostd			    = mtk_smi_larb_mt8186_ostd,
 };

 static const struct mtk_smi_larb_gen mtk_smi_larb_mt8188 = {
--
2.46.0

