Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9E232C85;
	Thu,  6 Feb 2025 01:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738806042; cv=none; b=GFv0J0clA3CVCT7AwLNa3Zbh5fagUUxoSY7Y3406FjKL7fJEjsbAUIPFW4oVh7TVBxOSVNltYLK61M2f1eEsKscqdAcZnrOD/lVaVw06GRVc1SHKR9vkm28AUjT+3iuz9BU9zAiMt47CtN1x673jpBmt3O6ZQBsaegLYZr5uqn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738806042; c=relaxed/simple;
	bh=YWKlvXYHWOC/CHe8tuph4iFa9t7105fEA0rrUltBLbY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FfVHgcY4YTZLSSPMKTFUPW6Mf/rxmro0loJL98ImyEdfwrnsyF2FnFvg8DAxOIKNJDhMxVtM7IrIolnNESOSSIVltSw6dfsHYu22D/zYeTyaASHxQi0qGdRQYvfiX2n9qb1zlXshQdDmJ2q1mSPrii0UZDrn7be8qniS4rCUCmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=rtcAF/UO; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="rtcAF/UO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=xO8GKg14rdVcQiYhVd953yc4D8d7fV5o/+Fei2DJjHc=; b=rtcAF/UOamg2nGMB
	jIQHvZpO4Fv9WjkEvlVa0HskXdSIfspoBKcRyi8ebF4xshRIhh+gFk96K4zIqXwq4ZjcceCLkq3G+
	QvoiMs68+Cb4pMZ1wcHkOKv6qb+txb03G8ypyhyqS80qelnwrwUTxwnnswT6vZkFPqsqPMyG9t/vr
	CCiYgyWCAIiMqE99hi5Q4CRA8/OAmaHvSt/5F55f4bswdy/k3XEXoYFNLiL5eSY3VovdInNnX0cPl
	71cJ2gotJokf75bafOhAUlVf2svUEYaUUEjyz2cUgskzFQc1TN+NXN2WOiVU1Lx+lfks3kxjiPguZ
	/XZM3kB9ugtmNTnNiw==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1tfqsX-00DsqW-1N;
	Thu, 06 Feb 2025 01:40:29 +0000
From: linux@treblig.org
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] ASoC: mediatek: mt8186: Remove unused mt8186_afe_(suspend|resume)_clock
Date: Thu,  6 Feb 2025 01:40:28 +0000
Message-ID: <20250206014028.237423-1-linux@treblig.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

mt8186_afe_resume_clock() and mt8186_afe_suspend_clock() were
added in 2022 by
commit 55b423d5623c ("ASoC: mediatek: mt8186: support audio clock control
in platform driver")

but have remained unused.

Remove them.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 sound/soc/mediatek/mt8186/mt8186-afe-clk.c | 55 ----------------------
 sound/soc/mediatek/mt8186/mt8186-afe-clk.h |  2 -
 2 files changed, 57 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
index 70ec101890d3..daaca36a2d08 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
@@ -329,61 +329,6 @@ void mt8186_afe_disable_clock(struct mtk_base_afe *afe)
 	clk_disable_unprepare(afe_priv->clk[CLK_INFRA_SYS_AUDIO]);
 }
 
-int mt8186_afe_suspend_clock(struct mtk_base_afe *afe)
-{
-	struct mt8186_afe_private *afe_priv = afe->platform_priv;
-	int ret;
-
-	/* set audio int bus to 26M */
-	ret = clk_prepare_enable(afe_priv->clk[CLK_MUX_AUDIOINTBUS]);
-	if (ret) {
-		dev_info(afe->dev, "%s clk_prepare_enable %s fail %d\n",
-			 __func__, aud_clks[CLK_MUX_AUDIOINTBUS], ret);
-		goto clk_mux_audio_intbus_err;
-	}
-	ret = mt8186_set_audio_int_bus_parent(afe, CLK_CLK26M);
-	if (ret)
-		goto clk_mux_audio_intbus_parent_err;
-
-	clk_disable_unprepare(afe_priv->clk[CLK_MUX_AUDIOINTBUS]);
-
-	return 0;
-
-clk_mux_audio_intbus_parent_err:
-	mt8186_set_audio_int_bus_parent(afe, CLK_TOP_MAINPLL_D2_D4);
-clk_mux_audio_intbus_err:
-	clk_disable_unprepare(afe_priv->clk[CLK_MUX_AUDIOINTBUS]);
-	return ret;
-}
-
-int mt8186_afe_resume_clock(struct mtk_base_afe *afe)
-{
-	struct mt8186_afe_private *afe_priv = afe->platform_priv;
-	int ret;
-
-	/* set audio int bus to normal working clock */
-	ret = clk_prepare_enable(afe_priv->clk[CLK_MUX_AUDIOINTBUS]);
-	if (ret) {
-		dev_info(afe->dev, "%s clk_prepare_enable %s fail %d\n",
-			 __func__, aud_clks[CLK_MUX_AUDIOINTBUS], ret);
-		goto clk_mux_audio_intbus_err;
-	}
-	ret = mt8186_set_audio_int_bus_parent(afe,
-					      CLK_TOP_MAINPLL_D2_D4);
-	if (ret)
-		goto clk_mux_audio_intbus_parent_err;
-
-	clk_disable_unprepare(afe_priv->clk[CLK_MUX_AUDIOINTBUS]);
-
-	return 0;
-
-clk_mux_audio_intbus_parent_err:
-	mt8186_set_audio_int_bus_parent(afe, CLK_CLK26M);
-clk_mux_audio_intbus_err:
-	clk_disable_unprepare(afe_priv->clk[CLK_MUX_AUDIOINTBUS]);
-	return ret;
-}
-
 int mt8186_apll1_enable(struct mtk_base_afe *afe)
 {
 	struct mt8186_afe_private *afe_priv = afe->platform_priv;
diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-clk.h b/sound/soc/mediatek/mt8186/mt8186-afe-clk.h
index a9d59e506d9a..e524833ce780 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-clk.h
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-clk.h
@@ -85,8 +85,6 @@ int mt8186_afe_enable_cgs(struct mtk_base_afe *afe);
 void mt8186_afe_disable_cgs(struct mtk_base_afe *afe);
 int mt8186_afe_enable_clock(struct mtk_base_afe *afe);
 void mt8186_afe_disable_clock(struct mtk_base_afe *afe);
-int mt8186_afe_suspend_clock(struct mtk_base_afe *afe);
-int mt8186_afe_resume_clock(struct mtk_base_afe *afe);
 
 int mt8186_apll1_enable(struct mtk_base_afe *afe);
 void mt8186_apll1_disable(struct mtk_base_afe *afe);
-- 
2.48.1

