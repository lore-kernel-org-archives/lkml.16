Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329E5279785;
	Wed, 28 May 2025 09:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748426362; cv=none; b=EYN05mOs7I2IVawfTgiY9kQzH9w5DedgayxDGPK8YmiLO7BTrgf9ML7uw8X02Lhyss9Vxj5dYVIl/AD026LspX/gTtiJGmByLeFLP1o3qcWokrnzoF5G4ZuktCVfdbfltPtfMmpiVVRrfr4tuZwO72/D7H9Gw09m8+0nsFj5wdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748426362; c=relaxed/simple;
	bh=GFa5vZhRv5F2GMJAt1tQEFe0rx951lfdEMR+nvzQwKE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MmBWzS9JYdfqNz/JvEEVPvR1BF2qkXetGEBek50/wEZrRp+eujDqHWUgUq5IsOQd7Y2lCRDfIN4/gEl7RWHE6Z9MgAiNjAE1ovO3YTwJd9jvH57VMozyOhmf/wkikwducPfGSz7HKrUDEgij4jyBHfTRoNI02sz7BEW/W5pj64w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=tdk0rGzV; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="tdk0rGzV"
X-UUID: 69b53cae3baa11f082f7f7ac98dee637-20250528
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=9B6feVEkzDZb0WiiyR1UVAxjlgd9mBvDC5TxNZRpR5E=;
	b=tdk0rGzViVFrqpeXDV5Z+T8o8/dznz9Xii+Q106Dxm45zTcIJfB2uMZ/Kny/BNueShj3VBElo77ZFV7toheNtJcauMIppAxXlFz495UrPRU6jWfgs+H/2AFq5VkQQRXsY+x1tQw46LvH1bSbhk5y7f9Hh7jtYs2TYx5RIz6fUc0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:6a6b35f6-b682-4096-8232-e6e951ffbd6b,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:4bab3459-eac4-4b21-88a4-d582445d304a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 69b53cae3baa11f082f7f7ac98dee637-20250528
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <jianhua.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1508653084; Wed, 28 May 2025 17:59:15 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 28 May 2025 17:59:13 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 28 May 2025 17:59:12 +0800
From: Jianhua Lin <jianhua.lin@mediatek.com>
To: <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jianhua Lin
	<jianhua.lin@mediatek.com>
Subject: [PATCH 2/2] dt-bindings: media: mediatek-jpeg-decoder: Add MT8189 compatible string
Date: Wed, 28 May 2025 17:57:48 +0800
Message-ID: <20250528095748.17485-3-jianhua.lin@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250528095748.17485-1-jianhua.lin@mediatek.com>
References: <20250528095748.17485-1-jianhua.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add compatible for MT8189 jpeg decoder.

Signed-off-by: Jianhua Lin <jianhua.lin@mediatek.com>
---
 .../devicetree/bindings/media/mediatek-jpeg-decoder.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
index a4aacd3eb189..33e7a6e5a069 100644
--- a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
@@ -23,6 +23,7 @@ properties:
           - enum:
               - mediatek,mt7623-jpgdec
               - mediatek,mt8188-jpgdec
+              - mediatek,mt8189-jpgdec
           - const: mediatek,mt2701-jpgdec
 
   reg:
-- 
2.46.0

