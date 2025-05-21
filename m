Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C0E233D88;
	Wed, 21 May 2025 06:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747809244; cv=none; b=HydxCi6Vxs27adXDkP7F39D+ia30yk9GYQkUCJqCxRoyQsChKfW+WiuwkaEhbpdPFIOkvW99pZtKa8ViKzEmwKtWWqdPOX+O+2HOxYvALU6xHScaNXnLlVgYJ0r1cSv8Ehjj3etc5DBhYnBt1UEvJF8AgT7Y9z/BWo52k3WjeUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747809244; c=relaxed/simple;
	bh=kROxZMu/nh6HWdn2287ETRvS/NrNq1Dh6NlPCnmP4ck=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OphsT5sOYmgjjNrJ/922P2HR+rUtBgTt4VGs6S1rc+qA6K6qgXnWcatkzGmI55T4NHBQ8Vs8QIL/NGQeUMFojt5X7m78JHh0FWGxBsPT8iKQSNVszPq9czorCjD//cflV6+m4TdWBAc7AvFHTWHCcjX86Qgh+EJFbtYkMZb+Yr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=lfySYCtq; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="lfySYCtq"
X-UUID: 8f72bad6360d11f0813e4fe1310efc19-20250521
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=/h4DXeSlHBOHr57ehL6D/b100MsQndsK0xj/jOkD2Ew=;
	b=lfySYCtqZ525CdCtqNeKUjBQ2icdqIb5HVx+6hP1hjvSB9W5i12b0mHV5FpJqMEc/VpBEVqIUFnAHxGK3fljp0iW6EYMeyyAnZKXLQ7EzpFcXuLuT41vmoMM/9Fxjxu9gE8MFnay2j/PlpBCbzOOb+Pq+XRAhY1FYWlyINJn9OI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:d65b8953-4de1-40f7-9088-9d8711477c3b,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:b8958e47-ee4f-4716-aedb-66601021a588,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 8f72bad6360d11f0813e4fe1310efc19-20250521
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <friday.yang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1630861245; Wed, 21 May 2025 14:33:51 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 21 May 2025 14:33:50 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 21 May 2025 14:33:48 +0800
From: Friday Yang <friday.yang@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Krzysztof Kozlowski <krzk@kernel.org>, Rob
 Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Philipp Zabel
	<p.zabel@pengutronix.de>
CC: Friday Yang <friday.yang@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v8 0/2] Add SMI reset and clamp for MediaTek MT8188 SoC
Date: Wed, 21 May 2025 14:33:34 +0800
Message-ID: <20250521063347.31578-1-friday.yang@mediatek.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Based on tag: next-20250521, linux-next/master

On the MediaTek MT8188 SoC platform, we encountered power-off failures
and SMI bus hang issues during camera stress tests. The issue arises
because bus glitches are sometimes produced when MTCMOS powers on or
off. While this is fairly normal, the software must handle these
glitches to avoid mistaking them for transaction signals. What's
more, this issue emerged only after the initial upstreaming of SMI
driver.

The software solutions can be summarized as follows:

1. Use CLAMP to disable the SMI sub-common port after turning off the
   LARB CG and before turning off the LARB MTCMOS.
2. Use CLAMP to disable/enable the SMI sub-common port.
3. Implement an AXI reset for SMI LARBs.

Changes v8:
- We replaced 'pm_runtime_enable' with 'devm_pm_runtime_enable' in the
  v6 patch. This changed the order of cleanup, and reviewers expressed
  concerns that it could introduce unexpected issues. So I discard this
  change and continue using 'pm_runtime_enable'. We need to conduct
  further investigation to determine if there are any issues related
  to the cleanup order. This might be resolved in the future, but for
  now, we just maintain the current status.

v7:
https://lore.kernel.org/lkml/20250430094545.23932-2-friday.yang@mediatek.com/
https://lore.kernel.org/lkml/20250430094545.23932-3-friday.yang@mediatek.com/

friday.yang (2):
  dt-bindings: memory: mediatek: Add SMI reset and clamp for MT8188
  memory: mtk-smi: mt8188: Add SMI reset and clamp for MT8188

 .../mediatek,smi-common.yaml                  |   2 +
 .../memory-controllers/mediatek,smi-larb.yaml |  19 +++
 drivers/memory/mtk-smi.c                      | 133 ++++++++++++++++++
 3 files changed, 154 insertions(+)

--
2.46.0

