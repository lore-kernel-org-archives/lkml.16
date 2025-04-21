Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B9C263F59
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 13:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745242743; cv=none; b=dknAJDapr0olOrr11q0/wLp21VF0HhAlFegz51VJcnSbcpvUrKtvBSTULnXwg1xhyngogVCuIrq/aY9PRziiKth1xv4UTNebGhvyb4AFtb/sbPhdxURO6ZUYSshyEQZtJ1FWvD5KhvW+IQxf2AiXIkvLpuoMO4NU9jz06fNxC8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745242743; c=relaxed/simple;
	bh=yDyo5ynOhFjKFFMmBkp1K0CYMnpds/uGVocTcV8sjA8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HUvJPznr9JgAzbGwUeZrXelnp8jJ3QEbXHWe+v6qqpWWsD5mn+nnnJ4kbUpl1oIj2r+nIBZsUOyPMR0s/Gle/F6e+Fs1x9U1FthiwPedwRJoZpILYSO/817DWXNDAJ7dPMgl00bxXL4XLyolxUTi3MSzh+NRK3H33yN4CVKjPDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=oWVEMLur; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="oWVEMLur"
X-UUID: f79824081eb511f0980a8d1746092496-20250421
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=b3U5qKs7ZZQMPyNRE7SU8rjw10yJuWPqYkkMERYBa1o=;
	b=oWVEMLurbVeZpKmfgiDHS1bUhpYTF0vvBq0H044Wqpm6b+dWjTerpvKGlHr3pl+3wlNmIixHosYBVt2JN353I2mqMqUoEuutx0OolEr7q7mE71aWNB1qmS8KiVkwliDmYvSYXM3b8AJ/A5u0S3W1ENh9P21FkInqLVO9JtBnjTo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:c69fab2f-0098-4717-a2f2-cdc78f670f87,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:9375d3c7-16da-468a-87f7-8ca8d6b3b9f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: f79824081eb511f0980a8d1746092496-20250421
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <sunny.shen@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 165133504; Mon, 21 Apr 2025 21:38:54 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 21 Apr 2025 21:38:52 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 21 Apr 2025 21:38:52 +0800
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
	<sunny.shen@mediatek.com>
Subject: [PATCH v2 0/5] Add components to support PQ in display path for MT8196
Date: Mon, 21 Apr 2025 21:38:27 +0800
Message-ID: <20250421133835.508863-1-sunny.shen@mediatek.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Due to the path mux design of the MT8196, the following components need to be configured to support Picture Quality (PQ) in the display path:CCORR0, CCORR1, DITHER0, GAMMA0, MDP_RSZ0, POSTMASK0, TDSHP0.

Change in v2:
- Update compatible name of mt8196-mdp-rsz.
- Update clocks and examples in mdp-rsz dt-bindings.
- Update subject of postmask dt-bindings.
- Remove DISP_REG_MDP_RSZ_EN.
- Add comment for MDP_RSZ size settings.

This patch series is based on [1]
[1] Add MediaTek SoC DRM support for MT8196
    - https://patchwork.kernel.org/project/linux-mediatek/list/?series=946188

Sunny Shen (5):
  dt-bindings: display: mediatek: mdp-rsz: Add rules for MT8196
  dt-bindings: display: mediatek: postmask: Add compatible string for
    MT8196
  soc: mediatek: Add components to support PQ in display path for MT8196
  drm/mediatek: Add MDP-RSZ component support for MT8196
  drm/mediatek: Change main display path to support PQ for MT8196

 .../display/mediatek/mediatek,mdp-rsz.yaml    | 45 ++++++++++++
 .../display/mediatek/mediatek,postmask.yaml   |  1 +
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c       | 24 +++++++
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h       |  1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  9 +++
 drivers/soc/mediatek/mt8196-mmsys.h           | 70 ++++++++++++++++++-
 drivers/soc/mediatek/mtk-mutex.c              | 17 +++++
 include/linux/soc/mediatek/mtk-mmsys.h        |  5 ++
 8 files changed, 170 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rsz.yaml

-- 
2.45.2

