Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2755F15A848;
	Thu,  6 Feb 2025 12:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738844203; cv=none; b=FkSmwYUgDn7+zrcz0pW03GMIYYvazhoafFGmuCVxJGdkp/rP4OuwtW+1gJHh4CVnDnubWcs2avD2gT8zH0FDCcdEblwXY51UFXl6LHls4dItKwzAasrC04I9GJObxxxUaOeT4z5N8i1xLsswI59s9Yah0cbrl/otUNEUwDSAqbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738844203; c=relaxed/simple;
	bh=ZZQ4eVwpNoJZBEkBr25sY2Cnb3pdcjzPMZv0YztOYNg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nMnmfx0J+91PiRkIoObczIRtNv5X5s8oQI5+keZbF8GQI1+iBHHj5laqdsZTwgFD/h5vkFx8jZCG7lDgazQ6ejcVchkaiOZOkr+2v/BoWqpr5h8QE47ZZX8d3SmHT9fm6x2EnRLNQvdzYTAp0bygP87x7GGbbGl69l3gLB/4JWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=S2QZBAuZ; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="S2QZBAuZ"
X-UUID: 34354e0ce48411efb8f9918b5fc74e19-20250206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=4GGW6iInM2fXnbOa6e7rwuDhnJObhpRoaaocsvZJX4w=;
	b=S2QZBAuZHpoiA6hBUFAOcWRc62ATxW1+QGZZwneoA7i9aua/pIwAYk77N9Nxg/L5RB5SqbLYZ36FsgGs6G7SMECWMQwT5zNkt6g/qhifdVZvpSHloRpKn2S6L/BnbOmAwFQ9xtKuJX5mLZKZ/LBVYSwY3XnGKAksZY5dvP7BVHQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:4399c504-0a78-4266-b58e-6b4dd7a63e99,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:60aa074,CLOUDID:d63a3fff-c190-4cfe-938d-595d7f10e0dc,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 34354e0ce48411efb8f9918b5fc74e19-20250206
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <crystal.guo@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 352297892; Thu, 06 Feb 2025 20:16:33 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Thu, 6 Feb 2025 20:16:32 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Thu, 6 Feb 2025 20:16:31 +0800
From: Crystal Guo <crystal.guo@mediatek.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Crystal Guo
	<crystal.guo@mediatek.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [v2,0/2] Add an interface to get current DDR data rate
Date: Thu, 6 Feb 2025 20:16:07 +0800
Message-ID: <20250206121629.12186-1-crystal.guo@mediatek.com>
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

*** BLURB HERE ***
This series is based on linux-next, tag: next-20250206.

Vcore DVFS feature need know the current DDR data rate.
Add MediaTek DRAMC driver to provide an interface that can
obtain current DDR data rate.

---
Changes in v2:
- Remove pr_info and pr_err, use dev_err or dev_err_probe to print
  error message;
- Replace module_init by module_platform_driver;
- Remove unnecessary global variables;
- Change fmeter-verison to platform data;
- Remove mtk-dramc.h;
- Refine compatible to "mediatek,mt8196-dramc";
- Refine CONFIG name to MEDIATEK_MC;
- Fix yaml build errors, remove unnecessary properties on yaml file.

Link to v1:
https://patchwork.kernel.org/patch/13904862

Crystal Guo (2):
  memory/mediatek: Add an interface to get current DDR data rate
  dt-bindings: memory-controllers: Add MediaTek DRAM controller
    interface

 .../mediatek,common-dramc.yaml                | 129 ------
 .../memory-controllers/mediatek,dramc.yaml    |  44 ++
 drivers/memory/Makefile                       |   2 +-
 drivers/memory/mediatek/Kconfig               |   6 +-
 drivers/memory/mediatek/mtk-dramc.c           | 415 ++++++------------
 include/linux/soc/mediatek/mtk-dramc.h        |  41 --
 6 files changed, 191 insertions(+), 446 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,common-dramc.yaml
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,dramc.yaml
 delete mode 100644 include/linux/soc/mediatek/mtk-dramc.h

-- 
2.18.0

