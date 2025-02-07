Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D12B2417D2;
	Fri,  7 Feb 2025 01:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738892692; cv=none; b=soxAMF5rezAf8PWlug60/i7QvGSn4xwP97asF9X/0sZMitBoUu4FXw23VJrmauvZG2Tz6Y4QebALl+EuRYBOujnjaRT3H3r5taHwQITsDGIq6rW2D6tPOaETCjhCO6sOkFKdBmyAroeAipcBCN9hzleIeARZFnYra2iZd4NqJVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738892692; c=relaxed/simple;
	bh=VGQICd1FgDDP1ugXFU5SSrCIJzyt2NYD9y65jRYQPVw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=O1IBS7TAGyOr/DFZA2/FXgl+llA8a10VFhtJ33N1ibgP+oVICZ9BiTq/QkHi4xo4qmY6xYvjbH5vmlUKBWMeDo3LqND722FXxwbgWbCttyyBjN+J2Why8uZZMCrpTknmliSPbuo93Wlo7Qsy//6IG8dt9YVjpLeo+8jymrMKEPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=AA4VZzrC; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="AA4VZzrC"
X-UUID: 1a8b0b10e4f511efbd192953cf12861f-20250207
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=C269Snjlx9b6eymcjtSvUmDEAyVpwqFen8FaGwcU0Uc=;
	b=AA4VZzrC6dN58Sih6kXC+LMnzxdh7P5cX/7R1YrZ8nBThn1OjKkniVtyuf/Plj9iMCfagtc9Z+wA8LFLzFN4TXtGj2NcWViYtRlYZgJVZVwSdyRfMlqlTTYiNHrRI3LLTWpO71r9bY5+93Od719DpCcSaifVheSlOpPxJSC36cU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:8170fea8-9df7-4ce2-ac9c-0a18e02bb010,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:60aa074,CLOUDID:19f62a3e-da39-4471-8a46-23da908abe46,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 1a8b0b10e4f511efbd192953cf12861f-20250207
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <crystal.guo@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 203299421; Fri, 07 Feb 2025 09:44:43 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 7 Feb 2025 09:44:43 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 7 Feb 2025 09:44:42 +0800
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
Date: Fri, 7 Feb 2025 09:42:46 +0800
Message-ID: <20250207014437.17920-1-crystal.guo@mediatek.com>
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

 .../memory-controllers/mediatek,dramc.yaml    |  44 ++++
 drivers/memory/Kconfig                        |   1 +
 drivers/memory/Makefile                       |   1 +
 drivers/memory/mediatek/Kconfig               |  21 ++
 drivers/memory/mediatek/Makefile              |   2 +
 drivers/memory/mediatek/mtk-dramc.c           | 196 ++++++++++++++++++
 6 files changed, 265 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,dramc.yaml
 create mode 100644 drivers/memory/mediatek/Kconfig
 create mode 100644 drivers/memory/mediatek/Makefile
 create mode 100644 drivers/memory/mediatek/mtk-dramc.c

-- 
2.18.0

