Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D4B1C36;
	Thu, 15 May 2025 09:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747301707; cv=none; b=BXgChI5Uht+mN6K6/q3LhUg+vUKcPP3/eGHXK6Ei31QAEGdylziNQ+XFpm4bpgCPQ+LUG1WF5A1xlmGjyaBNBeZ7kIhmzpkoEGiSLr5OEUwaA3N25W4lZfo51uHHV37EVvTba0d8C8k598HsM1ucG2RyvBUI4S8BRadn7ovz/0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747301707; c=relaxed/simple;
	bh=DYEe+8Bwkdg5wn1d1OT7+KVA7NN08JAzfBVgd7KXo+k=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Hvfr9vSQlWoD4g6q07/d5Vpvh7HNMEkhclwkE13XCF4oWAj2zZ4QOadskffa2LDTxm9xL4xNfJbEKFaJBfsJTmlYJI2GJRjttj6vN1r8epEdlRUZiVVYC+dfsN0obBxQ8XAGrmIXkiF6f0zUT8dWyJPHmYzG1wMDvo6eSxaclRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=OVRp1OgE; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="OVRp1OgE"
X-UUID: dc945218316f11f082f7f7ac98dee637-20250515
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=nDOj/MDr5bhf2pOGQc4uKu3LALz2SIDwKqvmkIbeuSk=;
	b=OVRp1OgE6Qdo0l6kC+Xikquam26OY8Wt+f+bRIVcVyo+enclx4ESdSP+qcWFNOzzgT5ZYlrZ3Hw+1L2I/ecp8SpidxIetdPriQpFe6za9LqgCf6jsltiRTpAll3l+vU10GDraxlz/y3U8HzrcYRZZbDbil3JmfwZSlh+bCcBArg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:4b5a5002-0795-474b-a470-b31d0af5d0a2,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:b994cb73-805e-40ad-809d-9cec088f3bd8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: dc945218316f11f082f7f7ac98dee637-20250515
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <paul-pl.chen@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 378703092; Thu, 15 May 2025 17:34:56 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 15 May 2025 17:34:54 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 15 May 2025 17:34:54 +0800
From: paul-pl.chen <paul-pl.chen@mediatek.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<chunkuang.hu@kernel.org>, <angelogioacchino.delregno@collabora.com>
CC: <matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>,
	<jason-jh.lin@mediatek.com>, <nancy.lin@mediatek.com>,
	<singo.chang@mediatek.com>, <xiandong.wang@mediatek.com>,
	<sirius.wang@mediatek.com>, <paul-pl.chen@mediatek.com>,
	<sunny.shen@mediatek.com>, <fshao@chromium.org>, <treapking@chromium.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3 00/17] Add MediaTek SoC DRM support for MT8196
Date: Thu, 15 May 2025 17:34:12 +0800
Message-ID: <20250515093454.1729720-1-paul-pl.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Paul-pl Chen <paul-pl.chen@mediatek.com>

This patch series adds support for the MediaTek MT8196 SoC's display
subsystem in the DRM driver.

Changes in v3:

- [PATCH v3 06/17] 
  Refine runtime PM, top clocks and async controls for MMSYS 
- [PATCH v3 08/17]
  Refactor SOF settings by adding mtk_mutex_get_output_comp_sof() and
  extracting SOF logic from mtk_mutex_add_comp() 
  and mtk_mutex_remove_comp()
- [PATCH v3 10/17]
  Export OVL format definitions and format 
  conversion API
- [PATCH v3 11/17]
  Export OVL ignore pixel alpha logic
- [PATCH v3 12/17] 
  Refactor exdma_config setup to reduce complexity 
  and consolidate duplicate settings in exdma_layer_config()
- [PATCH v3 13/17]
  Refine blender's layer_config driver for improved efficiency
- [PATCH v3 14/17] Refine outproc driver: use readl() and writel() to 
  replace mtk_ddp_write_mask() for normal mode settings
- [PATCH v3 15/17]
  Refine ovlsys_adaptor driver:Use path instead of ovl_adaptor_comp for 
  searching component type. Improve efficiency of config, start, stop, 
  and layer_config functions
- [PATCH v3 16/17] 
  Refine mtk_find_possible_crtcs() function

Changes in v2:
- add support for MT8196's new hardware components (EXDMA, BLENDER, 
  OUTPROC) following the previous MTK OVL software architecture.
- reuse mtk_ovl drivers in MediaTek DRM display to support the new 
  MT8196 SoC.
- implement support for multiple mmsys instances within a single 
  mediatek-drm driver, improving flexibility and scalability.
- refactor existing components (mutex, OVL) to accommodate the new 
  architecture and improve code reusability.
- update component matching, binding logic, and data structures to 
  support the new multi-mmsys design.
Nancy Lin (10):
  dt-bindings: soc: mediatek: add mutex yaml for MT8196
  soc: mediatek: Add runtime PM and top clocks and async controls for
    MMSYS
  soc: mediatek: add mmsys support for MT8196
  soc: mediatek: mutex: add mutex support for MT8196
  drm/mediatek: Export OVL formats definitions and format conversion API
  drm/mediatek: drm/mediatek: Export OVL ignore pixel alpha function
  drm/mediatek: add EXDMA support for MT8196
  drm/mediatek: add OUTPROC support for MT8196
  drm/mediatek: add ovlsys_adaptor support for MT8196
  drm/mediatek: Add support for MT8196 multiple mmsys

Paul-pl Chen (7):
  dt-bindings: display: mediatek: add EXDMA yaml for MT8196
  dt-bindings: display: mediatek: add BLENDER yaml for MT8196
  dt-bindings: display: mediatek: add OUTPROC yaml for MT8196
  soc: mediatek: mutex: Reused the switch case for SOF ID
  soc: mediatek: mutex: refactor SOF settings for output components
  drm/mediatek: add BLENDER support for MT8196
  drm/mediatek: Add support for multiple mmsys in the one mediatek-drm
    driver

 .../display/mediatek/mediatek,blender.yaml    |  47 ++
 .../display/mediatek/mediatek,outproc.yaml    |  54 ++
 .../bindings/dma/mediatek,exdma.yaml          |  68 ++
 .../bindings/soc/mediatek/mediatek,mutex.yaml |   2 +
 drivers/gpu/drm/mediatek/Makefile             |   4 +
 drivers/gpu/drm/mediatek/mtk_crtc.c           | 342 ++++++--
 drivers/gpu/drm/mediatek/mtk_crtc.h           |   6 +-
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c       | 136 +++-
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h       |   6 +
 drivers/gpu/drm/mediatek/mtk_disp_blender.c   | 264 +++++++
 drivers/gpu/drm/mediatek/mtk_disp_blender.h   |  10 +
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  67 ++
 drivers/gpu/drm/mediatek/mtk_disp_exdma.c     | 349 +++++++++
 drivers/gpu/drm/mediatek/mtk_disp_outproc.c   | 240 ++++++
 drivers/gpu/drm/mediatek/mtk_disp_outproc.h   |  22 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c       | 238 +++---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.h       |  29 +
 .../drm/mediatek/mtk_disp_ovlsys_adaptor.c    | 729 ++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        | 277 +++++--
 drivers/gpu/drm/mediatek/mtk_drm_drv.h        |  27 +-
 drivers/soc/mediatek/mt8196-mmsys.h           | 396 ++++++++++
 drivers/soc/mediatek/mtk-mmsys.c              | 206 ++++-
 drivers/soc/mediatek/mtk-mmsys.h              |  18 +
 drivers/soc/mediatek/mtk-mutex.c              | 257 ++++--
 include/linux/soc/mediatek/mtk-mmsys.h        |  60 ++
 include/linux/soc/mediatek/mtk-mutex.h        |   4 +
 26 files changed, 3555 insertions(+), 303 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,blender.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,outproc.yaml
 create mode 100644 Documentation/devicetree/bindings/dma/mediatek,exdma.yaml
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_blender.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_blender.h
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_exdma.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_outproc.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_outproc.h
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_ovl.h
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_ovlsys_adaptor.c
 create mode 100644 drivers/soc/mediatek/mt8196-mmsys.h

-- 
2.45.2

