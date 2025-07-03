Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20DE199938;
	Thu,  3 Jul 2025 07:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751529408; cv=none; b=j60iIQso25HolhRo5sjIefHu15NPFTYS6U8NggLbTI6UVaFWazXf4l4awH4lAWmdZVuH3aeE9ZT+/RylY3g8EiMwoTVNIsvEh5cL8t2zdOMNNQBiU/vxFVP/QY6zNdu/mozz6YkcKc0vlErA7tFrLbSX8wo7TWgYiYTuGXLMsx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751529408; c=relaxed/simple;
	bh=tMvExFBCJhiPwCKPlHnG8ssMfvxZVNy1RKAI6xnb0vE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=peIlmUTNqqtCqe8h6tljoztYgQgxPBirsx+aQZoYumiCKZjP6NqWIWG3INhlFqLHgO/JPNpSVRQsHj0AsYS/+wSOw1x9PEItcfVbXBzwrnqYa58ndb3/jW9fX5S+8Vwnf6QTFCvq+hJcYzMe9hxaxsFEBeK3p9szuXMycxp1bF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=heLqocMH; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="heLqocMH"
X-UUID: 3eabd0e057e311f0b33aeb1e7f16c2b6-20250703
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=SA99F68Gvyu1KWTj0/viDoHSk80kTdTfBAzHsy9w0dE=;
	b=heLqocMHVOoeHbIqCim1byVclO7d+pVUlU9eHWSacpons7a7mwIa/A8w9GBLkqfKhS4rV590/3knL15QOz5JlPY9SAd52MBi/unnL3UL/kdUTNE9a38xqHY1MVtAJD+y+P68eyTwyYEQJ7WMe48YWN3hLh72kafNpIMwARHxjWA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:3a42823d-a2e2-486b-8e6a-f90175c9b2f1,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:d8f7e75f-2aa0-4c76-8faa-804d844c7164,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3eabd0e057e311f0b33aeb1e7f16c2b6-20250703
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <hailong.fan@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1301690587; Thu, 03 Jul 2025 15:56:36 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 3 Jul 2025 15:56:33 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 3 Jul 2025 15:56:32 +0800
From: hailong.fan <hailong.fan@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, "Bard
 Liao" <yung-chuan.liao@linux.intel.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, Mark Brown <broonie@kernel.org>, "Jaroslav
 Kysela" <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<sound-open-firmware@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Hailong Fan
	<hailong.fan@mediatek.com>
Subject: [PATCH v2 0/2] ASoC: mediatek: Add support of SOF on Mediatek mt8196 SoC.
Date: Thu, 3 Jul 2025 15:56:22 +0800
Message-ID: <20250703075632.20758-1-hailong.fan@mediatek.com>
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

From: Hailong Fan <hailong.fan@mediatek.com>

Sorry for late reply.

Add support of MediaTek mt8196 SoC DSP to SOF.
This series is based on linux-next, tag: next-20250702.

---
Changes in v2:
- Rebase onto https://lore.kernel.org/all/20250320115300.137410-1-angelogioacchino.delregno@collabora.com/
- Link to v1: https://lore.kernel.org/lkml/20250320031753.13669-1-hailong.fan@mediatek.com/

This series patches dependent on:
[1]
https://lore.kernel.org/all/20250307032942.10447-1-guangjie.song@mediatek.com/
[2]
https://lore.kernel.org/all/20250307034454.12243-1-guangjie.song@mediatek.com/

Hailong Fan (2):
  dt-bindings: dsp: mediatek: add mt8196 dsp document
  ASoC: SOF: MediaTek: Add mt8196 hardware support

 .../bindings/sound/mediatek,mt8196-dsp.yaml   |  95 +++
 sound/soc/sof/mediatek/Kconfig                |   9 +
 sound/soc/sof/mediatek/Makefile               |   1 +
 sound/soc/sof/mediatek/mt8196/Makefile        |   3 +
 sound/soc/sof/mediatek/mt8196/mt8196-clk.c    |  98 +++
 sound/soc/sof/mediatek/mt8196/mt8196-clk.h    |  23 +
 sound/soc/sof/mediatek/mt8196/mt8196-loader.c |  60 ++
 sound/soc/sof/mediatek/mt8196/mt8196.c        | 556 ++++++++++++++++++
 sound/soc/sof/mediatek/mt8196/mt8196.h        | 124 ++++
 9 files changed, 969 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8196-dsp.yaml
 create mode 100644 sound/soc/sof/mediatek/mt8196/Makefile
 create mode 100644 sound/soc/sof/mediatek/mt8196/mt8196-clk.c
 create mode 100644 sound/soc/sof/mediatek/mt8196/mt8196-clk.h
 create mode 100644 sound/soc/sof/mediatek/mt8196/mt8196-loader.c
 create mode 100644 sound/soc/sof/mediatek/mt8196/mt8196.c
 create mode 100644 sound/soc/sof/mediatek/mt8196/mt8196.h

-- 
2.45.2

