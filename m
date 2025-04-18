Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86CE1E9B1A;
	Fri, 18 Apr 2025 06:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744959217; cv=none; b=qKcDSRwQgmcgwyGii/kqBTJgjLsUd+91zQDTzRxFfZbE9OdbSMHoG4v+pl2EqB/yjCUiFjPKTBpFns+vZFbuy4dSiKKdrkoXMvi2nAdx2VKWrVa7dB1aDkv0Eu48JLLfmmsFy2KeBVzEYCwmL90+oIqK05UtgKHCThUR4f1rclA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744959217; c=relaxed/simple;
	bh=77GnwZO6tyv+ullnDjFGbZzp8Ehs9NW6juKp3MwdNFM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I8X5SOEISOrI3psUBK7zftXzRwe1A4SUA3cAWEiXrY7bkscd5A9cH9zVMcoSYLOuG7mpoN2DVrOUb3qQo13Oge/wt0QzeDocbPghphhBoh1CKIFUtYxXT2bDY22uEjz3zr0HfSOCL4FpP47/BfHIF7neyPZzfcZbg+xxRloaXYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=MqFUuWsa; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="MqFUuWsa"
X-UUID: d0e624181c2111f08eb9c36241bbb6fb-20250418
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ZJZ9/2LTXaosBvqhgXGtFoXMiGALopKAYRwsPTF6+U8=;
	b=MqFUuWsah2GDZJUfO74lFA492zkmJ7rZins2i7ixMW5qF5BJMEn8JC9Uvel7ZGv1wh87qPe30NeCKAKa+SNNblLgo9L+9tflF5scaUB/X2W+DZmnYpne6cywKcx+S//OZd+zfhE6dDs2r+oYI6h8e0Ugf9JObin4pMimMBQ01oE=;
X-CID-CACHE: Type:Local,Time:202504181451+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:6649ec34-9e81-4dd4-b4e9-51793eaba10c,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:705cc28d-f5b8-47d5-8cf3-b68fe7530c9a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: d0e624181c2111f08eb9c36241bbb6fb-20250418
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <bincai.liu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1439583621; Fri, 18 Apr 2025 14:53:21 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 18 Apr 2025 14:53:19 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 18 Apr 2025 14:53:19 +0800
From: Bincai Liu <bincai.liu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Simona Vetter
	<simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Chunfeng Yun
	<chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, "Kishon Vijay
 Abraham I" <kishon@kernel.org>, Jitao shi <jitao.shi@mediatek.com>, CK Hu
	<ck.hu@mediatek.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-phy@lists.infradead.org>,
	Bincai Liu <bincai.liu@mediatek.com>
Subject: [PATCH 1/5] dt-bindings: eDP: mediatek: add eDP yaml for mt8196
Date: Fri, 18 Apr 2025 14:52:28 +0800
Message-ID: <20250418065313.8972-2-bincai.liu@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250418065313.8972-1-bincai.liu@mediatek.com>
References: <20250418065313.8972-1-bincai.liu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add compatible string to support eDP for MT8196.

Signed-off-by: Bincai Liu <bincai.liu@mediatek.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,dp.yaml       | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
index 75ce92f4a5fd..26997feba66b 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
@@ -25,6 +25,7 @@ properties:
       - mediatek,mt8188-edp-tx
       - mediatek,mt8195-dp-tx
       - mediatek,mt8195-edp-tx
+      - mediatek,mt8196-edp-tx
 
   reg:
     maxItems: 1
@@ -98,6 +99,7 @@ allOf:
               enum:
                 - mediatek,mt8188-dp-tx
                 - mediatek,mt8195-dp-tx
+                - mediatek,mt8196-edp-tx
     then:
       properties:
         '#sound-dai-cells': false
-- 
2.45.2

