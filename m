Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCA235977;
	Thu, 22 May 2025 15:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747926286; cv=none; b=Lns4jeU3sNwNo88UlHraz7xnFVydQNhJA7+445YOTVfjIWZhpVAMFyrc2k6CyjjB69rfUatCmOABHOO40e3G924CLyK6tBw9aw5ZOICnudcTHdOASflbhByDPyEP6fGtvlTdML0oVoPsrzH3FIVJ9ViN1qQwYSLhyxzp3zw+hf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747926286; c=relaxed/simple;
	bh=6E8wv9eurwoMDP4eN6gRjgxZADkeqaRbzVLPVnnCE/0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nU7jcJn4I33VZY+LB4UYFdb076aUcY85x/A1y7IV120F3Dq+VIECUSGR1MqnLM0SfvN35hlKd+v8IST9EGMbSAVKXDM5vyzr59G+xhKJnfUf3fM9FP1eicVj2f0qnkKw8QT67bgz5phKeACf33xSu2+aLWQRA+NgF97rBT2ofFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=pzTiSvHc; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="pzTiSvHc"
X-UUID: 13b98f16371e11f0813e4fe1310efc19-20250522
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=cPUaMSMEx0OFqwycv8XXQw9CFu0jRQY3FjVb+3D5Lz4=;
	b=pzTiSvHcy0JuSVP6HzOY9uDzo48dLfjz6+n3mlk+nH4A0o8TXltZa3yLQg4SztGzn48z0yzN0I3uGLpuGwA9hK/WegRrpKrgijNtP//SMDTlnebqxNE6TxfkaiKHlB9TkTkecL3os6/vdEd6+AJjf1RvD+T+erkeg8ZiGjb4c6A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:4d911028-1e3e-4676-aae2-8994795b36c4,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:0ef645f,CLOUDID:36d12bf1-2ded-45ed-94e2-b3e9fa87100d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 13b98f16371e11f0813e4fe1310efc19-20250522
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <nancy.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 960148057; Thu, 22 May 2025 23:04:36 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 22 May 2025 23:04:34 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 22 May 2025 23:04:34 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Liam Girdwood
	<lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Mark Brown <broonie@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<jason-jh.lin@mediatek.com>, <singo.chang@mediatek.com>,
	<paul-pl.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>
Subject: [PATCH 0/2] Add MT8196 VMM driver support
Date: Thu, 22 May 2025 23:03:32 +0800
Message-ID: <20250522150426.3418225-1-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

From: Nancy Lin <nancy.lin@mediatek.com>

Add a driver for the MediaTek MT8196 VMM (Vcore for MultiMedia)
controller.

Nancy Lin (2):
  dt-bindings: regulator: mediatek: Add MT8196 vmm controller
  soc: mediatek: Add MT8196 VMM driver support

 .../mediatek,mt8196-vmm-regulator.yaml        |  70 +++
 drivers/soc/mediatek/Kconfig                  |  12 +
 drivers/soc/mediatek/Makefile                 |   1 +
 drivers/soc/mediatek/mtk-vmm-drv.c            | 471 ++++++++++++++++++
 4 files changed, 554 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt8196-vmm-regulator.yaml
 create mode 100644 drivers/soc/mediatek/mtk-vmm-drv.c

-- 
2.45.2

