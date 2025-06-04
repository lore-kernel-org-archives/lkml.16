Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F3423F429;
	Wed,  4 Jun 2025 03:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749006828; cv=none; b=eURQB0aNRramOc4v8pZZ+dkjXG3i51BmkFqXvbg2/mBVDlNZO1GxbMWjZKFGcVMZ43ZMkHfs6BP/oQqFXM3VNV/4q/hsdVIPAB8sJCLX2sG1WdWXJ1y4dETO0s+XMf1I3f96ls5CyxHJxS9+v67IRYUjp5s/n24uZoRfCBI08a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749006828; c=relaxed/simple;
	bh=Egejy1cjtgeMootf9LfxQgTqohRO+XITsbpL949YiX4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=O133h1GG2DZyxWFt4Bf+kHfF07EfSII2SS0iZUlFcjjME1jvwQKsLnOcWKiHaSGX9a6GxegcA10lKKNuPhqRSlXEmJVNJVrAyIsFd37Q2ocU73VK8+NeLp63frgxT7iQ4UGNN5/abzDD8wYOWIErJqlX0bd975ly3UyeOHb/ieU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: e9d6c1a440f111f0b29709d653e92f7d-20250604
X-CTIC-Tags:
	HR_CC_AS_FROM, HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_DIGIT_LEN
	HR_FROM_NAME, HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER
	HR_SJ_NOR_SYM, HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT
	HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED
	SA_TRUSTED, SA_EXISTED, SN_TRUSTED, SN_EXISTED, SPF_NOPASS
	DKIM_NOPASS, DMARC_NOPASS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:20a17d1e-75ba-47a2-ba7d-a6d74aa42065,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:15
X-CID-INFO: VERSION:1.1.45,REQID:20a17d1e-75ba-47a2-ba7d-a6d74aa42065,IP:0,URL
	:0,TC:0,Content:-5,EDM:25,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:15
X-CID-META: VersionHash:6493067,CLOUDID:6caa1a8caebfa93cf8e8ac62306754ce,BulkI
	D:250604111342F3O22LJQ,BulkQuantity:0,Recheck:0,SF:17|19|38|66|78|81|82|10
	2,TC:nil,Content:0|50,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,B
	EC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-UUID: e9d6c1a440f111f0b29709d653e92f7d-20250604
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1678508614; Wed, 04 Jun 2025 11:13:40 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: nicolas.frattaroli@collabora.com,
	linux-rockchip@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH 2/2] ASOC: rockchip: Use helper function devm_clk_get_enabled()
Date: Wed,  4 Jun 2025 11:13:30 +0800
Message-Id: <3b3d8f60e553af09a51b501b8ff5406fa5e898dd.1749006565.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1749006565.git.xiaopei01@kylinos.cn>
References: <cover.1749006565.git.xiaopei01@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prepared
and enabled clocks"), devm_clk_get() and clk_prepare_enable() can now be
replaced by devm_clk_get_enabled() when driver enables the clocks for the
whole lifetime of the device. Moreover, it is no longer necessary to
unprepare and disable the clocks explicitly.

Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 sound/soc/rockchip/rockchip_sai.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_sai.c b/sound/soc/rockchip/rockchip_sai.c
index 79b04770da1c..2ec675708681 100644
--- a/sound/soc/rockchip/rockchip_sai.c
+++ b/sound/soc/rockchip/rockchip_sai.c
@@ -1448,16 +1448,12 @@ static int rockchip_sai_probe(struct platform_device *pdev)
 				     "Failed to get mclk\n");
 	}
 
-	sai->hclk = devm_clk_get(&pdev->dev, "hclk");
+	sai->hclk = devm_clk_get_enabled(&pdev->dev, "hclk");
 	if (IS_ERR(sai->hclk)) {
 		return dev_err_probe(&pdev->dev, PTR_ERR(sai->hclk),
 				     "Failed to get hclk\n");
 	}
 
-	ret = clk_prepare_enable(sai->hclk);
-	if (ret)
-		return dev_err_probe(&pdev->dev, ret, "Failed to enable hclk\n");
-
 	regmap_read(sai->regmap, SAI_VERSION, &sai->version);
 
 	ret = rockchip_sai_init_dai(sai, res, &dai);
@@ -1512,8 +1508,6 @@ static int rockchip_sai_probe(struct platform_device *pdev)
 	if (pm_runtime_put(&pdev->dev))
 		rockchip_sai_runtime_suspend(&pdev->dev);
 err_disable_hclk:
-	clk_disable_unprepare(sai->hclk);
-
 	return ret;
 }
 
-- 
2.25.1

