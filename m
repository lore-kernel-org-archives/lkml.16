Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547822E645;
	Thu, 24 Apr 2025 01:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745458578; cv=none; b=BQWS/KRp/AWHVur0VUF+ZIYEr9Y5oa24tAttNMqhBBmA3ET4Bk2awPSKqWr2U2WKNOaG4DNBCk5SvkRFpGyD3L9bHCHpno1Fn2jEJDvlnY+3ksiUAG68HOWdcHWGJBuQ3m6EtIdFhI15WQdaufdzV1ledUg01u07+Py7gluMbxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745458578; c=relaxed/simple;
	bh=II8yhQG59KTOlomoJ0OvT2JSPCWJ+frYZMsFDdjzKFg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tktGu8JBizT0z7iBUxmYen7Qo6HnY1ShzMaDMsgLpFAUdDBimZutYdKUV1YHXfE7Sh70oxfkfkTm60PZJOz9Vz/GysEOFtNxrXGJpB+Ou0BXuZA370uE0jgykfmCuwUXke/bBSAhpIDDuLEh4J8czvGZ1xCRb/xSRz4bpTZbphQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=a4ikG8du; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="a4ikG8du"
X-UUID: 7ed7357420ac11f0980a8d1746092496-20250424
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=jTuuCpBbCKlfv4XuI4H/Clo2iT9msY0YoeaAABY+yvM=;
	b=a4ikG8du3HfHEVSFPOHe24Ov8XR1wgDsXBNYOVJkHvkjgMCy6xMfhKcDehWg+F6wOj/CZgjif2kvC86zdBhOjvGykAGyEVOnt1yke/V3uEyJgkdRB0uFIC3URPisLb76cNsok5wzxG+DMZkg6r/gDEsuhaNJHAIKKu4nJc8gzjc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:12b959c0-acdd-46af-abf9-8a0f3ce46769,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:b7968a2a-2448-4c17-a688-fd64fca576d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7ed7357420ac11f0980a8d1746092496-20250424
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <axe.yang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1051560134; Thu, 24 Apr 2025 09:36:08 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 24 Apr 2025 09:36:06 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 24 Apr 2025 09:36:06 +0800
From: Axe Yang <axe.yang@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <yong.mao@mediatek.com>,
	<qingliang.li@mediatek.com>, <andy-ld.lu@mediatek.com>, Wenbin Mei
	<wenbin.mei@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Axe Yang
	<axe.yang@mediatek.com>
Subject: [RESEND] arm64: dts: mediatek: mt8186-corsola: make SDIO card removable
Date: Thu, 24 Apr 2025 09:34:35 +0800
Message-ID: <20250424013603.32351-1-axe.yang@mediatek.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

Under specific conditions, the SDIO function driver needs to
remove/add SDIO card to perform a reset. Remove the non-removable
property to support this scenario.

Signed-off-by: Axe Yang <axe.yang@mediatek.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
index cebb134331fb..fc78a79d96e9 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
@@ -518,7 +518,6 @@ &mmc1 {
 	cap-sdio-irq;
 	no-mmc;
 	no-sd;
-	non-removable;
 	vmmc-supply = <&pp3300_s3>;
 	vqmmc-supply = <&mt6366_vio18_reg>;
 	mmc-pwrseq = <&wifi_pwrseq>;
-- 
2.46.0

