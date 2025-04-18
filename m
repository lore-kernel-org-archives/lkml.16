Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C874F268C6F;
	Fri, 18 Apr 2025 06:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744959218; cv=none; b=GaQaOQqMpsMNDbiERcDQI19iJRF8Pgt44AA8jKkNv7M+wi1XHfG2K6LBvf0Q6OSdKScwpuQZSK7GsZIc/ic4MV55yWGE2CFJdPoWZKxlAWd9vrMiLCozmI+qU/S2wvNmRRa5FrfPKnE4dhRp7bMwErhWdT4lBpasOldduEMc2jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744959218; c=relaxed/simple;
	bh=8DRQcjETAh73+uSdh9HICm/6bDWCcItxwNGGJVyypxo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NF1FN+vt4JV3xRC3GJSMSJEoKRYOGmQsH4ohsUzHt01bx2jCOqBckjGNmyGHwPM+Lssdcipe1tvZMySN0BTtCIFkD9MQpumgBRiAfEDpi5ESI0aXAThyOhAhuZ/XjMN13+1dD9d5g0/XkR6/pFvceizy/sspDlssgiF15hhBN8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=JETgk1bO; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="JETgk1bO"
X-UUID: d069ea061c2111f08eb9c36241bbb6fb-20250418
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=vP/pmjYB/UEc9jBjVVzZ4eruBcoBstw0sXKps7+hEW0=;
	b=JETgk1bOq9I+bfN0qa37MTkSaYf8vRtD+HneZIQNFOPrbb0SVErqT7nssAaiVwQ42xPhV6ojtSn8MgaaJdxdAm0VmvqqZAnTxfF35r6bzzb2sszr2M/l0c+sgiw/+MZ52zxb0mQrkAASOzgyXjJj8wcAB3NZEhPMvQICM30B8Iw=;
X-CID-CACHE: Type:Local,Time:202504181451+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:f4cf5a3e-aeb1-41c5-b9f1-47e4c5077365,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:2c3e668b-0afe-4897-949e-8174746b1932,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: d069ea061c2111f08eb9c36241bbb6fb-20250418
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <bincai.liu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 343564215; Fri, 18 Apr 2025 14:53:20 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 18 Apr 2025 14:53:19 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 18 Apr 2025 14:53:18 +0800
From: Bincai Liu <bincai.liu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Simona Vetter
	<simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Chunfeng Yun
	<chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, Kishon Vijay
 Abraham I <kishon@kernel.org>, Jitao shi <jitao.shi@mediatek.com>, CK Hu
	<ck.hu@mediatek.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-phy@lists.infradead.org>,
	Bincai Liu <bincai.liu@mediatek.com>
Subject: [PATCH 0/5] eDP driver for mt8196
Date: Fri, 18 Apr 2025 14:52:27 +0800
Message-ID: <20250418065313.8972-1-bincai.liu@mediatek.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain


Bincai Liu (5):
  dt-bindings: eDP: mediatek: add eDP yaml for mt8196
  dt-bindings: dvo: mediatek: add dvo yaml for mt8196
  drm/mediatek: Add dvo driver for mt8196
  drm/mediatek: Add eDP driver for mt8196
  drm/mediatek: Add eDP phy driver for mt8196

 .../display/mediatek/mediatek,dp.yaml         |   2 +
 .../display/mediatek/mediatek,dpi.yaml        |   1 +
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c       |   5 +-
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h       |   1 +
 drivers/gpu/drm/mediatek/mtk_dp.c             | 484 +++++++++++++++---
 drivers/gpu/drm/mediatek/mtk_dp_reg.h         | 126 +++++
 drivers/gpu/drm/mediatek/mtk_dpi.c            | 240 +++++++--
 drivers/gpu/drm/mediatek/mtk_dpi_regs.h       |  66 +++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |   5 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h        |   1 +
 drivers/phy/mediatek/Makefile                 |   1 +
 drivers/phy/mediatek/phy-mtk-edp.c            | 262 ++++++++++
 12 files changed, 1100 insertions(+), 94 deletions(-)
 create mode 100644 drivers/phy/mediatek/phy-mtk-edp.c

-- 
2.45.2

