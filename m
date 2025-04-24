Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6439D2367D3
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 10:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745490351; cv=none; b=R6NloTZ6uTYfhAWQNHraINWtimEfwElObkj3f3my98PDZAF6p1MIKNdm9HoM+SztE6L375R+AyB7TMjJLnFzUwLFDNSbcp1Q+3d+rR9xM+eECaO5o0lw72OmKNNdvpMWMnl1WFp4U8uoyiIZdyO/141b0EgV3V1sfz2/kFEm+3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745490351; c=relaxed/simple;
	bh=yNzcBctBcltIk7fjKHzagNkU6eRehLtyrLorREA22po=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mVj+YhPckyFOk45MpYKApqZ8iUjkP9fCGQYSzPwcP0nQUdCR/p1BlrDcYhLpb0xVtCJnLTZuFiDMmqgIb9165oV7SAmBgV6VqOJ82OrQYB+OXUyW7ZNFqPCayXJgZOlYPQ9V/wo+r8udw30HirHoF8jh2C48garcMuV4rvBdmCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=En950whm; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="En950whm"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22c3407a87aso13021745ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 03:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745490349; x=1746095149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AyQBxT8N1LOd0tBT65hxZtJpAp/ZMeB2TPzFU7H3X0U=;
        b=En950whmll4GhabL/ns8fO8k6VSAV4yLyjTKgZrQWULnkYbZTinJ+S2N1ebXqlvUSl
         mvkInZivgsbL6q7x+IF0A7khK/4vmMQQtJv7n0dDfnJjatkeZ4O4+AH0pWWmFtKS7PjX
         c0uPEfuAaOESuWkGKmmLLMd123HFOay3oAsRs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745490349; x=1746095149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AyQBxT8N1LOd0tBT65hxZtJpAp/ZMeB2TPzFU7H3X0U=;
        b=ePNpKM/qVc7og2vV8WB5cou6+ylL8zdcfCg9XD92xxVkqow5nyv2kENgLsRDkRyV10
         7n9Pw1dIlmR9+1UsJ2T1cszVm3Y+5HOzfV9LE+4DI6b7lwOEFXFpxClgvEKI8Cu2FHi9
         jc9FiuhUFd1NAQ019n43J2fEdxHDtQmxSoDDyFXiCva6B1vpLCiavo4lblA+Gus9+dQj
         OdmCk+qRhTxGRdyKLCKePmJLVNnFeB6JKD7qPz762K64gZ9sVaAXEvBDJ7jXiIKCz+Mg
         ZlCteJzuqilOqkhJ0SW3LlKRsuQkT7wnQjFDJ643eSqCEvOLFwrolwORPGVCEDQYhg7i
         ABfw==
X-Forwarded-Encrypted: i=1; AJvYcCUYEMu4XEjVWCcqLszPeHnOMxiz7GAt6Fg8OGFEMyvFLIXpC9R/ufjmjPyEhh2fUfAZLsHoHJrXvtbdVqk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYoRLplqwjm7sHBPPPQWVwsySI2sv01VvzVktkIpQC/5Dd+c54
	sFOItUW/rGdJINnjkiEG1hN6S/yja62v5aO6ABFxDD1fvP3TtC9IoIvQZQ9smw==
X-Gm-Gg: ASbGncvLs1nhPTRC8/oTSMtYo2AnolctMYVrKvWLRQVxFU7cprPflKuk2KORg7BmsS4
	epqI1C1uj9C0wVfPBMp9cESbvP2WEBSMaxw0ASB0Z/yJSTNuHZdZAvVKxmJGqARVymoQmvt4+zb
	LfxvOnxeeeIRjvntLpdcchVgoYHoMaP4JfFL2syhXQZRnFvMmlwMO2HD5gkX/h/fpCwZ5Qn6q2J
	y2TPMDf6Ip9LzLefyYxycb/SxLxESxzKSX+vOdhsUB2/DhdL+UJo41HZApuPyjm3JchwFad2v1M
	SOQN5OeLNFy1jZJjuULLS21mBWHRWwhyQXroCpzi2YKOaYao7cK/HXbzkQ==
X-Google-Smtp-Source: AGHT+IFt0XUOGJk3Ud4+wtbFjwGwTHDAiFvZxN/Xk3zgndqYjVRMpy5Cx4zWYWH17RjjMOdqNLFarQ==
X-Received: by 2002:a17:903:183:b0:223:8256:533d with SMTP id d9443c01a7336-22db3dd0a8cmr28683815ad.46.1745490348905;
        Thu, 24 Apr 2025 03:25:48 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:fa13:e633:684b:257])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dda40fsm9680305ad.104.2025.04.24.03.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:25:48 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/13] ASoC: mediatek: mt8183-afe-pcm: use local `dev` pointer in driver callbacks
Date: Thu, 24 Apr 2025 18:25:03 +0800
Message-ID: <20250424102509.1083185-10-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
In-Reply-To: <20250424102509.1083185-1-wenst@chromium.org>
References: <20250424102509.1083185-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The probe and remove functions in the mt8183-afe-pcm driver repeatedly uses
`&pdev->dev` for |struct device *|, but then assigns this value to
`afe->dev` and uses that in other places in the same function.

Store `&pdev->dev` in a local pointer and use that exclusively to avoid
the numerous dereferences and to make the code more consistent. Lines
are reflowed where it makes sense.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 37 ++++++++++------------
 1 file changed, 17 insertions(+), 20 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index a3c8054a434f..d63b7fe19fbf 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -1114,27 +1114,25 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 {
 	struct mtk_base_afe *afe;
 	struct mt8183_afe_private *afe_priv;
-	struct device *dev;
+	struct device *dev = &pdev->dev;
 	struct reset_control *rstc;
 	int i, irq_id, ret;
 
-	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(34));
+	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(34));
 	if (ret)
 		return ret;
 
-	afe = devm_kzalloc(&pdev->dev, sizeof(*afe), GFP_KERNEL);
+	afe = devm_kzalloc(dev, sizeof(*afe), GFP_KERNEL);
 	if (!afe)
 		return -ENOMEM;
 	platform_set_drvdata(pdev, afe);
 
-	afe->platform_priv = devm_kzalloc(&pdev->dev, sizeof(*afe_priv),
-					  GFP_KERNEL);
+	afe->platform_priv = devm_kzalloc(dev, sizeof(*afe_priv), GFP_KERNEL);
 	if (!afe->platform_priv)
 		return -ENOMEM;
 
 	afe_priv = afe->platform_priv;
-	afe->dev = &pdev->dev;
-	dev = afe->dev;
+	afe->dev = dev;
 
 	ret = of_reserved_mem_device_init(dev);
 	if (ret) {
@@ -1179,7 +1177,7 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* enable clock for regcache get default value from hw */
 	afe_priv->pm_runtime_bypass_reg_ctl = true;
-	pm_runtime_get_sync(&pdev->dev);
+	pm_runtime_get_sync(dev);
 
 	ret = regmap_reinit_cache(afe->regmap, &mt8183_afe_regmap_config);
 	if (ret) {
@@ -1187,7 +1185,7 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 		goto err_pm_disable;
 	}
 
-	pm_runtime_put_sync(&pdev->dev);
+	pm_runtime_put_sync(dev);
 	afe_priv->pm_runtime_bypass_reg_ctl = false;
 
 	regcache_cache_only(afe->regmap, true);
@@ -1245,7 +1243,7 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 	for (i = 0; i < ARRAY_SIZE(dai_register_cbs); i++) {
 		ret = dai_register_cbs[i](afe);
 		if (ret) {
-			dev_warn(afe->dev, "dai register i %d fail, ret %d\n",
+			dev_warn(dev, "dai register i %d fail, ret %d\n",
 				 i, ret);
 			goto err_pm_disable;
 		}
@@ -1254,8 +1252,7 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 	/* init dai_driver and component_driver */
 	ret = mtk_afe_combine_sub_dai(afe);
 	if (ret) {
-		dev_warn(afe->dev, "mtk_afe_combine_sub_dai fail, ret %d\n",
-			 ret);
+		dev_warn(dev, "mtk_afe_combine_sub_dai fail, ret %d\n", ret);
 		goto err_pm_disable;
 	}
 
@@ -1267,16 +1264,14 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 	afe->runtime_suspend = mt8183_afe_runtime_suspend;
 
 	/* register component */
-	ret = devm_snd_soc_register_component(&pdev->dev,
-					      &mtk_afe_pcm_platform,
+	ret = devm_snd_soc_register_component(dev, &mtk_afe_pcm_platform,
 					      NULL, 0);
 	if (ret) {
 		dev_warn(dev, "err_platform\n");
 		goto err_pm_disable;
 	}
 
-	ret = devm_snd_soc_register_component(afe->dev,
-					      &mt8183_afe_pcm_dai_component,
+	ret = devm_snd_soc_register_component(dev, &mt8183_afe_pcm_dai_component,
 					      afe->dai_drivers,
 					      afe->num_dai_drivers);
 	if (ret) {
@@ -1287,15 +1282,17 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 	return ret;
 
 err_pm_disable:
-	pm_runtime_disable(&pdev->dev);
+	pm_runtime_disable(dev);
 	return ret;
 }
 
 static void mt8183_afe_pcm_dev_remove(struct platform_device *pdev)
 {
-	pm_runtime_disable(&pdev->dev);
-	if (!pm_runtime_status_suspended(&pdev->dev))
-		mt8183_afe_runtime_suspend(&pdev->dev);
+	struct device *dev = &pdev->dev;
+
+	pm_runtime_disable(dev);
+	if (!pm_runtime_status_suspended(dev))
+		mt8183_afe_runtime_suspend(dev);
 }
 
 static const struct of_device_id mt8183_afe_pcm_dt_match[] = {
-- 
2.49.0.805.g082f7c87e0-goog

