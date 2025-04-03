Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1FF206F03;
	Thu,  3 Apr 2025 06:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743663050; cv=none; b=ke7rW4qRxSgEAlLIi67t3HBep4Vg7JjqvnkVkpgn7c0hDyagg3uarOdIkZspLFx8DDlLT3EbFmsl/m2V0tq8BvbfLrU77z01fOGigUNCJcTJk6URPfd+1ERyay0dS/uLyXFKXJPKPhsYU0TrmE+1bKFxxkXT3J0VOVHvPzE7gFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743663050; c=relaxed/simple;
	bh=NFq5MdVkeEC3JGmDCriNI4BhC93MRdZYpm7N/k1kvck=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Hu/B1wH/ni6KdY+X8uW/2Y41pXueOE+ckjMKGxhD6OrRN5NCSDuwXcMo85k8JWkjYZ2JKvlWUvF++QMhETH8hgZCInNDoJKCkeTlRo/8N8ult3MHCl6Kpy6GBr7kXh20AfB1O3tQEg2uWfMbIviDMdenaqObQ72XWYKSmAPfdmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=WbCGvL+R; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="WbCGvL+R"
X-UUID: f1a2f04e105711f08eb9c36241bbb6fb-20250403
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=QDJ27iW4X63WdVZOkwgFkljRednxU+tqzHABvD19+JY=;
	b=WbCGvL+RZiolFP4pFPm4S3d977RHOkvCRefveBKOtha+ABg8whoQo8c1SE3dDZ2rqFS2hFcNT8HrdkqAcA6fKTVUpcW+ZvKlebf4uPorD2WC21ldWsTVXx5z2eepk2bl5XVxLO5h3bIEuO4A9wXbHnRotxegT1muiSs2accJamk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:9ffc742e-f57d-4dfc-982f-ed94c4d5a6ec,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:0ef645f,CLOUDID:5a22e94a-a527-43d8-8af6-bc8b32d9f5e9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: f1a2f04e105711f08eb9c36241bbb6fb-20250403
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <crystal.guo@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 378322673; Thu, 03 Apr 2025 14:50:35 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 3 Apr 2025 14:50:33 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 3 Apr 2025 14:50:33 +0800
From: Crystal Guo <crystal.guo@mediatek.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Crystal Guo
	<crystal.guo@mediatek.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4 0/2] Add an interface to get current DDR data rate
Date: Thu, 3 Apr 2025 14:48:46 +0800
Message-ID: <20250403065030.22761-1-crystal.guo@mediatek.com>
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

This series is based on linux-next, tag: next-20250402.

Vcore DVFS feature need know the current DDR data rate.
Add MediaTek DRAMC driver to provide an interface that can
obtain current DDR data rate.

---
Changes in v4:
- Rename "mediatek,dramc.yaml" to "mediatek,mt8196-dramc.yaml";
- Refine Kconfig for MediaTek memory controller by removing the
  redundant explanation;
- Move the function 'read_reg_field()' to before mtk_dramc_probe();
- Rename struct 'mtk_dramc_dev_t' to 'mtk_dramc';
- Align the comments to kerneldoc;
- Simplify the function 'mtk_dramc_get_data_rate' by removing the
  redundant error handling process.

---
Changes in v3:
- Move register offset, register mask and other SoC-dependent variables
  to the platform data;
- Correct the spelling error.

Link to v3:
https://patchwork.kernel.org/patch/14029756

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

Link to v2:
https://patchwork.kernel.org/patch/13964208

Crystal Guo (2):
  dt-bindings: memory-controllers: Add MediaTek DRAM controller
    interface
  memory/mediatek: Add an interface to get current DDR data rate

 .../mediatek,mt8196-dramc.yaml                |  44 ++++
 drivers/memory/Kconfig                        |   1 +
 drivers/memory/Makefile                       |   1 +
 drivers/memory/mediatek/Kconfig               |  20 ++
 drivers/memory/mediatek/Makefile              |   2 +
 drivers/memory/mediatek/mtk-dramc.c           | 223 ++++++++++++++++++
 6 files changed, 291 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,mt8196-dramc.yaml
 create mode 100644 drivers/memory/mediatek/Kconfig
 create mode 100644 drivers/memory/mediatek/Makefile
 create mode 100644 drivers/memory/mediatek/mtk-dramc.c

-- 
2.18.0

