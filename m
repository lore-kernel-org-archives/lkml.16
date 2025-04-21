Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C8F266581
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 13:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745242744; cv=none; b=Ed6rLt5eaSqBY/b54ZCpx3VppnIfYWs8jzBf9BDgeQqzpv1aVzv7il1zP4rjVNdsA6p0Gc1tYc2hrLgifUg6KE3Q0ei+9hEyLZrYGXGDvSna8F9A1Q56a3YTxUBQs43FPFmSt1qNoaWTuJKBChPt5KXT28j/5lHjhb+65/W96I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745242744; c=relaxed/simple;
	bh=2K1uSHZagX7lD/Q9BgY1Kv2Q7qZI7XHohobvPJOqbbI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SVbSWotSomZ18tvvVfQ+wqWsiBv9zcM+g2f3nwfaAhsn+OMYK4vdtsvo1SK2eNDBC5yeNd/FzF7a8WQ+ggqDDkbswbGwqS7PS+u0tzvtSb//A8Zy+aA91jeezhhmRDYqKqh7KDB6aFwQ0NMG+Su3+aGi3f19aQd4siJC7d4MSHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=jEPkEK14; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="jEPkEK14"
X-UUID: f815658a1eb511f0980a8d1746092496-20250421
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=nsCVpY7/Uvm0yDYeDIAoS8Xqn+DAacrFu0NfOVTRztk=;
	b=jEPkEK14Zdjq3d7j2XOtyPBbsEpG7gxk3/pPWB+GdBEE1lEIVBThGg0Urp2ghFtsBBsPHF64mbotPUmBI+jksqU1BtpcwFbVqt9O/6OKRiT1K93i9+yETjFxNRFk1zR5+gE7rI60+3Co/02AF0OWfXkE8TlRqxT9KGaUF+fkStA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:5bdec457-ff2a-4aeb-bc63-323e701612bc,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:783edc8d-f5b8-47d5-8cf3-b68fe7530c9a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: f815658a1eb511f0980a8d1746092496-20250421
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <sunny.shen@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 209466076; Mon, 21 Apr 2025 21:38:54 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 21 Apr 2025 21:38:53 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 21 Apr 2025 21:38:53 +0800
From: Sunny Shen <sunny.shen@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Fei Shao <fshao@chromium.org>, Pin-yen Lin
	<treapking@chromium.org>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Nancy
 Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, "Paul
 Chen --cc=devicetree @ vger . kernel . org" <paul-pl.chen@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Sunny Shen
	<sunny.shen@mediatek.com>, CK Hu <ck.hu@mediatek.com>
Subject: [PATCH v2 5/5] drm/mediatek: Change main display path to support PQ for MT8196
Date: Mon, 21 Apr 2025 21:38:32 +0800
Message-ID: <20250421133835.508863-6-sunny.shen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250421133835.508863-1-sunny.shen@mediatek.com>
References: <20250421133835.508863-1-sunny.shen@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Due to the path mux design of the MT8196, the following components
need to be added to support Picture Quality (PQ) in the main display
path: CCORR0, CCORR1, DITHER0, GAMMA0, MDP_RSZ0, POSTMASK0, TDSHP0.

Signed-off-by: Sunny Shen <sunny.shen@mediatek.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
---
The method of using OF graph for display path is still under investigation.
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index aa7eec1fc7e6..5ca2b9badbe0 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -242,6 +242,13 @@ static const unsigned int mt8196_mtk_ddp_ovl0_main[] = {
 
 static const unsigned int mt8196_mtk_ddp_disp0_main[] = {
 	DDP_COMPONENT_DLI_ASYNC0,
+	DDP_COMPONENT_MDP_RSZ0,
+	DDP_COMPONENT_TDSHP0,
+	DDP_COMPONENT_CCORR0,
+	DDP_COMPONENT_CCORR1,
+	DDP_COMPONENT_GAMMA0,
+	DDP_COMPONENT_POSTMASK0,
+	DDP_COMPONENT_DITHER0,
 	DDP_COMPONENT_DLO_ASYNC1,
 };
 
-- 
2.45.2

