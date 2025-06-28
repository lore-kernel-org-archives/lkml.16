Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20E18635D;
	Sat, 28 Jun 2025 07:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751094900; cv=none; b=KFFQwCL37Spy43bTTY9IlWkuPe4kq20R7dkBkpcoonhK/QHucda6iWgRJ26MbVhFch6XfXDILolDOZEoZvvknzrPWX8zdmxgm05rQ28BlNrMyK3+492nJPkEVhZz91BkSCwWqNJqRfl4ZCVJsyTQZvhI0Kwsmb4XBmLfYF/AKsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751094900; c=relaxed/simple;
	bh=r8l+tu5sugQIvxlQ0MnusMGkdx0A7k8EXAmrJyIyqCA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=d+GysJ57LQ2zRWPmzPD3xDtcK96L3PGo6dXGoL28b3rzUlSSyLERxn/D6SzDQ126Szk0hkWvrG5YjMqJECeLgz8tkwHM7ppQ0PjKSbsI3lxUoOa8euF9SPuMNmGmRvi4geHhRTJVpupENzwnG5nZsn5iRW3+MrphW3/5JaCeyeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=PHQzhf4k; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="PHQzhf4k"
X-UUID: 9312295653ef11f0b33aeb1e7f16c2b6-20250628
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=V6Z/4K6Yt+prO9BrSpsKqwbnEWAEKzGbOjbsOQhnb3g=;
	b=PHQzhf4k8O8kDrovyVrSlv5biV2etqm6lqCdEszB+smfwKlrZDsncT46fRvPUXIvMV1LArylq5mFiHz9jrXSnahZqlEZ730OQtk2Dk0WqHCqJEySW9NJFbERR6zbHqhzMRboArcqFeoKRseEvbXlzLslf1EKRYMwx934gve34Ps=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:a15e549e-8ff4-4233-a6ee-148f015c0860,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:200ba714-6a0e-4a76-950f-481909c914a4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9312295653ef11f0b33aeb1e7f16c2b6-20250628
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <cyril.chao@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 140594530; Sat, 28 Jun 2025 15:14:47 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Sat, 28 Jun 2025 15:14:43 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Sat, 28 Jun 2025 15:14:44 +0800
From: Cyril <Cyril.Chao@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<cyril.chao@mediatek.com>, Cyril <Cyril.Chao@mediatek.com>
Subject: [PATCH 00/10] ASoC: mediatek: Add support for MT8189 SoC
Date: Sat, 28 Jun 2025 15:14:08 +0800
Message-ID: <20250628071442.31155-1-Cyril.Chao@mediatek.com>
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

Based on tag: next-20250626, linux-next/master

This series of patches adds support for Mediatek AFE of MT8189 SoC.
Patches are based on broonie tree "for-next" branch.

Cyril Chao (10):
  ASoC: mediatek: mt8189: add common header
  ASoC: mediatek: mt8189: support audio clock control
  ASoC: mediatek: mt8189: support ADDA in platform driver
  ASoC: mediatek: mt8189: support I2S in platform driver
  ASoC: mediatek: mt8189: support TDM in platform driver
  ASoC: mediatek: mt8189: support PCM in platform driver
  ASoC: mediatek: mt8189: add platform driver
  ASoC: dt-bindings: mediatek,mt8189-afe-pcm: add audio afe document
  ASoC: mediatek: mt8189: add machine driver with nau8825
  ASoC: dt-bindings: mediatek,mt8189-nau8825: add mt8189-nau8825
    document

 .../sound/mediatek,mt8189-afe-pcm.yaml        |   162 +
 .../sound/mediatek,mt8189-nau8825.yaml        |   103 +
 sound/soc/mediatek/Kconfig                    |    28 +
 sound/soc/mediatek/Makefile                   |     1 +
 sound/soc/mediatek/mt8189/Makefile            |    18 +
 sound/soc/mediatek/mt8189/mt8189-afe-clk.c    |   763 ++
 sound/soc/mediatek/mt8189/mt8189-afe-clk.h    |   109 +
 sound/soc/mediatek/mt8189/mt8189-afe-common.h |   294 +
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c    |  2682 ++++
 sound/soc/mediatek/mt8189/mt8189-dai-adda.c   |  1327 ++
 sound/soc/mediatek/mt8189/mt8189-dai-i2s.c    |  1795 +++
 sound/soc/mediatek/mt8189/mt8189-dai-pcm.c    |   337 +
 sound/soc/mediatek/mt8189/mt8189-dai-tdm.c    |   828 ++
 .../mediatek/mt8189/mt8189-interconnection.h  |    97 +
 sound/soc/mediatek/mt8189/mt8189-nau8825.c    |  1054 ++
 sound/soc/mediatek/mt8189/mt8189-reg.h        | 10773 ++++++++++++++++
 16 files changed, 20371 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8189-afe-pcm.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8189-nau8825.yaml
 create mode 100644 sound/soc/mediatek/mt8189/Makefile
 create mode 100644 sound/soc/mediatek/mt8189/mt8189-afe-clk.c
 create mode 100644 sound/soc/mediatek/mt8189/mt8189-afe-clk.h
 create mode 100644 sound/soc/mediatek/mt8189/mt8189-afe-common.h
 create mode 100644 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
 create mode 100644 sound/soc/mediatek/mt8189/mt8189-dai-adda.c
 create mode 100644 sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
 create mode 100644 sound/soc/mediatek/mt8189/mt8189-dai-pcm.c
 create mode 100644 sound/soc/mediatek/mt8189/mt8189-dai-tdm.c
 create mode 100644 sound/soc/mediatek/mt8189/mt8189-interconnection.h
 create mode 100644 sound/soc/mediatek/mt8189/mt8189-nau8825.c
 create mode 100644 sound/soc/mediatek/mt8189/mt8189-reg.h

-- 
2.46.0

