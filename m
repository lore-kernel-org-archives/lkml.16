Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4928B25F98B;
	Tue,  8 Apr 2025 03:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744083143; cv=none; b=ka4JCRANfGfLqu6T1a8H6loq34tjr7ewj6AebTycWTnOKGFl2xXj0L2r8TWkCZDM9DcFiiSvV7ewaXaJT38GLK6d1KFPO6gUPZCmoqrwjDGW6ocmAQO4j6FEWESqmPbo2X3bG6WNaV2+YGqiQTrjNY6QEhbrl4+Id/ZBP2+KviY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744083143; c=relaxed/simple;
	bh=pNJcKQzCiYnJtCW+Hyd8L7/lj4N4d1+BBAZNV5m3Vww=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ayBT+ofruYmd4696XEJQngxpGV/de8V44W6EEi9ClDEB6NYSdnolky9FbgvLaHPx52esbTAUkHNPFIV9b8jQYEj09/cMVKGQPT9yO5wfXGooHUpuArjvd36ttsxV2NpZpHs/XHMMTdtU2xHSgDZO3SX7iRyuFKrBlJBZ7QnFtLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=WTyExuL2; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="WTyExuL2"
X-UUID: 1111524c142a11f0aae1fd9735fae912-20250408
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=NRKbm8MkDmyaqkiaP1DwdDeOmQ+erOodCBiH4VJGyeM=;
	b=WTyExuL2ITQfMt/vXMRwbKapmtOL2J/tVZtyJKVQR4dgYh/XJjEd4iDSHmiRtlviKOMIK+XbSmjLxFxazMsFeNXriJW+E3Vq3LhajFAuQtAeKxvHEA8z8sDLeNeaPia3zmdAGYAMLaCH/L1QujEimKjqkGZ04KPIiYwiqFJ34mI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:2a408710-98f1-4b03-bef8-c8fa7d234b68,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:d57a114b-a527-43d8-8af6-bc8b32d9f5e9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1111524c142a11f0aae1fd9735fae912-20250408
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <friday.yang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1708660130; Tue, 08 Apr 2025 11:32:15 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 8 Apr 2025 11:32:14 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 8 Apr 2025 11:32:13 +0800
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
Subject: [PATCH v6 3/3] memory: mtk-smi: mt8188: Use devm_pm_runtime_enable
Date: Tue, 8 Apr 2025 11:31:56 +0800
Message-ID: <20250408033206.12176-4-friday.yang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250408033206.12176-1-friday.yang@mediatek.com>
References: <20250408033206.12176-1-friday.yang@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Replace pm_runtime_enable with the devres-enabled version which
can trigger pm_runtime_disable.

Signed-off-by: Friday Yang <friday.yang@mediatek.com>
---
 drivers/memory/mtk-smi.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index f25d46d2ef33..daef6d350419 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -713,16 +713,17 @@ static int mtk_smi_larb_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_link_remove;

-	pm_runtime_enable(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		goto err_link_remove;
+
 	platform_set_drvdata(pdev, larb);
 	ret = component_add(dev, &mtk_smi_larb_component_ops);
 	if (ret)
-		goto err_pm_disable;
+		goto err_link_remove;

 	return 0;

-err_pm_disable:
-	pm_runtime_disable(dev);
 err_link_remove:
 	device_link_remove(dev, larb->smi_common_dev);
 	return ret;
@@ -733,7 +734,6 @@ static void mtk_smi_larb_remove(struct platform_device *pdev)
 	struct mtk_smi_larb *larb = platform_get_drvdata(pdev);

 	device_link_remove(&pdev->dev, larb->smi_common_dev);
-	pm_runtime_disable(&pdev->dev);
 	component_del(&pdev->dev, &mtk_smi_larb_component_ops);
 }

@@ -954,7 +954,10 @@ static int mtk_smi_common_probe(struct platform_device *pdev)
 			return ret;
 	}

-	pm_runtime_enable(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
 	platform_set_drvdata(pdev, common);
 	return 0;
 }
@@ -965,7 +968,6 @@ static void mtk_smi_common_remove(struct platform_device *pdev)

 	if (common->plat->type == MTK_SMI_GEN2_SUB_COMM)
 		device_link_remove(&pdev->dev, common->smi_common_dev);
-	pm_runtime_disable(&pdev->dev);
 }

 static int __maybe_unused mtk_smi_common_resume(struct device *dev)
--
2.46.0

