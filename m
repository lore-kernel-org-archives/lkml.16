Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4FF235BF1
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 10:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745490348; cv=none; b=NAKHlY9hDrtnSoJaiDnE7QxKNgu2vPhGV75jKgTXiodhGKPMkugZYWXFApv/QFB/EUn07ygbKQpFFeolHS3sqavWyeXu4l4VI52EouFBBfxnPi9M+yeXeDuGT7BzIQfjse/V8qdUJxndBg5eZrqXInwL7rh5yTcrgCWqrjuKG7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745490348; c=relaxed/simple;
	bh=gnsNUIE5fVMgm1yzsatCfzS1CVhAuzl2OFSf1bbgvqg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lG6iDj2ISA3Msn6zY45K7IHvNqk2fy8wk2cciVYjngZKHAofKsQlIwM/Sw1zrI/1tOnoa7oMDRrtW/6ZFS5r7R1WguR0l1q/p2cGWMswWjUE6s/3oL6lDEsyQkCpcZWz4bfwWMDSRQsr2dYzYVlu+udVVNVCKfo8b3RSfqOXMbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gZwqnAhL; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gZwqnAhL"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2ff6e91cff5so800241a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 03:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745490346; x=1746095146; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IE7aKSxABLvt9Zl1mpyqzpBOR0S+DjSniaX8iFCPAyw=;
        b=gZwqnAhLXhyO4Xis3QTZdVMCx4pp3/qI8adTIraxc88BY2vZUaUEA/ZFfel+ajb736
         7MktRFF5SArRt1a40MLr5wYLub3TteKeSlJhZqw7DG64zcsp2IIUCBy/7TeC9qwtsVY5
         IMBpHBQR2wheUkg/flK6P5Dk9gGYiK1S8Fu8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745490346; x=1746095146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IE7aKSxABLvt9Zl1mpyqzpBOR0S+DjSniaX8iFCPAyw=;
        b=oGcDzNNkGJLf8cpZPYx0HhVoQx6zggt2559QkFHTiT84gVwFQgLZ9it2XBTspfZP0m
         +mg/LZanCq443RiGg6YIUwJtJ39v1dTUXeDOZO1vYC4qCscjX0qMlnbW/bdh6DGTpjJ6
         4+IDcvsFdKu5+ON/TUGc7vcNAHL1qsSTrzZLZSsUkDjj5I0UiqrRUT6O3pus7ytm4rji
         7dH2X4Ubc1EpgfhoJCsefyv5UkRXUoYp+ckmpvCMmpxDttjSm8nHlDhWnnhY1zH12pN9
         gVxeX0O95on1hlB64LdlyHZ7kDA2O6iJF7HsE2VopQ7pHgGNQOqjgjDPPltzT2u661jH
         813A==
X-Forwarded-Encrypted: i=1; AJvYcCW03KQP+4TPWk+ur/lAdIw4ziPmWZ5qXmvoomE7vXmGL7XiE9tshCb2ODVv+bns62XAsR456pypgcdJCEc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0YzGyY99Nc83FyrcBdtVI+h0r0B6o3xlTep9tt6DzvIY5efad
	OOS2JrL7D/rz5f41fEr3tB85OGLnBh7l1eDF7H7AIGT/T5KVbQIZ7n9zG3gX9Q==
X-Gm-Gg: ASbGncv+1xOb7Co4sUOm5NQnerwUwYEGJbwxyU5u76YhCko8tu8eATvRbv9ffLLyvuJ
	qypRPPJ9b3Z0MtpPWvrPL6ZeMuoP9w12ugzbj+dVD7V98WYFqe6EPdetyOf//VZDielkFuBpA1v
	EPLMUdyRyfQAil1rGtt8fpko55UeqtkLWMR5shiS0bqSeNN7TCDQ2E7yTbbiuqzfyoS+g+vjpI0
	y+b3yg9o0mUFAOn0OXAEacf4i3zQoOF5i/wazLXdz5JJxtsGpDZSpX6D7u3DqeVLfgsBjrBN/Nj
	LPkDjirg2wK3OVOGvOrQ+WNZfX7zNL9qgsjEeySILxBguhsNcYDtv3t1tg==
X-Google-Smtp-Source: AGHT+IEXiipgjpnZjo9b641rUil17G3O4+rk2vLeF36iNimZzjzuklvaviqehXQCV3mCF6B2BIqVZg==
X-Received: by 2002:a17:90b:224a:b0:2fe:d766:ad8e with SMTP id 98e67ed59e1d1-309ed24bc78mr3343313a91.4.1745490345566;
        Thu, 24 Apr 2025 03:25:45 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:fa13:e633:684b:257])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dda40fsm9680305ad.104.2025.04.24.03.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:25:45 -0700 (PDT)
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
Subject: [PATCH v2 08/13] ASoC: mediatek: mt8173-afe-pcm: use local `dev` pointer in driver callbacks
Date: Thu, 24 Apr 2025 18:25:02 +0800
Message-ID: <20250424102509.1083185-9-wenst@chromium.org>
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
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c | 63 +++++++++++-----------
 1 file changed, 32 insertions(+), 31 deletions(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
index f93d6348fdf8..c0fa623e0b17 100644
--- a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
+++ b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
@@ -1054,26 +1054,26 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 	struct mtk_base_afe *afe;
 	struct mt8173_afe_private *afe_priv;
 	struct snd_soc_component *comp_pcm, *comp_hdmi;
+	struct device *dev = &pdev->dev;
 
-	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(33));
+	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(33));
 	if (ret)
 		return ret;
 
-	afe = devm_kzalloc(&pdev->dev, sizeof(*afe), GFP_KERNEL);
+	afe = devm_kzalloc(dev, sizeof(*afe), GFP_KERNEL);
 	if (!afe)
 		return -ENOMEM;
 
-	afe->platform_priv = devm_kzalloc(&pdev->dev, sizeof(*afe_priv),
-					  GFP_KERNEL);
+	afe->platform_priv = devm_kzalloc(dev, sizeof(*afe_priv), GFP_KERNEL);
 	afe_priv = afe->platform_priv;
 	if (!afe_priv)
 		return -ENOMEM;
 
-	afe->dev = &pdev->dev;
+	afe->dev = dev;
 
-	ret = of_reserved_mem_device_init(&pdev->dev);
+	ret = of_reserved_mem_device_init(dev);
 	if (ret) {
-		dev_info(&pdev->dev, "no reserved memory found, pre-allocating buffers instead\n");
+		dev_info(dev, "no reserved memory found, pre-allocating buffers instead\n");
 		afe->preallocate_buffers = true;
 	}
 
@@ -1085,27 +1085,27 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 	if (IS_ERR(afe->base_addr))
 		return PTR_ERR(afe->base_addr);
 
-	afe->regmap = devm_regmap_init_mmio(&pdev->dev, afe->base_addr,
-		&mt8173_afe_regmap_config);
+	afe->regmap = devm_regmap_init_mmio(dev, afe->base_addr,
+					    &mt8173_afe_regmap_config);
 	if (IS_ERR(afe->regmap))
 		return PTR_ERR(afe->regmap);
 
 	/* initial audio related clock */
 	ret = mt8173_afe_init_audio_clk(afe);
 	if (ret) {
-		dev_err(afe->dev, "mt8173_afe_init_audio_clk fail\n");
+		dev_err(dev, "mt8173_afe_init_audio_clk fail\n");
 		return ret;
 	}
 
 	/* memif % irq initialize*/
 	afe->memif_size = MT8173_AFE_MEMIF_NUM;
-	afe->memif = devm_kcalloc(afe->dev, afe->memif_size,
+	afe->memif = devm_kcalloc(dev, afe->memif_size,
 				  sizeof(*afe->memif), GFP_KERNEL);
 	if (!afe->memif)
 		return -ENOMEM;
 
 	afe->irqs_size = MT8173_AFE_IRQ_NUM;
-	afe->irqs = devm_kcalloc(afe->dev, afe->irqs_size,
+	afe->irqs = devm_kcalloc(dev, afe->irqs_size,
 				 sizeof(*afe->irqs), GFP_KERNEL);
 	if (!afe->irqs)
 		return -ENOMEM;
@@ -1124,9 +1124,9 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, afe);
 
-	pm_runtime_enable(&pdev->dev);
-	if (!pm_runtime_enabled(&pdev->dev)) {
-		ret = mt8173_afe_runtime_resume(&pdev->dev);
+	pm_runtime_enable(dev);
+	if (!pm_runtime_enabled(dev)) {
+		ret = mt8173_afe_runtime_resume(dev);
 		if (ret)
 			goto err_pm_disable;
 	}
@@ -1136,13 +1136,12 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 	afe->runtime_resume = mt8173_afe_runtime_resume;
 	afe->runtime_suspend = mt8173_afe_runtime_suspend;
 
-	ret = devm_snd_soc_register_component(&pdev->dev,
-					 &mtk_afe_pcm_platform,
-					 NULL, 0);
+	ret = devm_snd_soc_register_component(dev, &mtk_afe_pcm_platform,
+					      NULL, 0);
 	if (ret)
 		goto err_pm_disable;
 
-	comp_pcm = devm_kzalloc(&pdev->dev, sizeof(*comp_pcm), GFP_KERNEL);
+	comp_pcm = devm_kzalloc(dev, sizeof(*comp_pcm), GFP_KERNEL);
 	if (!comp_pcm) {
 		ret = -ENOMEM;
 		goto err_pm_disable;
@@ -1150,7 +1149,7 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	ret = snd_soc_component_initialize(comp_pcm,
 					   &mt8173_afe_pcm_dai_component,
-					   &pdev->dev);
+					   dev);
 	if (ret)
 		goto err_pm_disable;
 
@@ -1164,7 +1163,7 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_pm_disable;
 
-	comp_hdmi = devm_kzalloc(&pdev->dev, sizeof(*comp_hdmi), GFP_KERNEL);
+	comp_hdmi = devm_kzalloc(dev, sizeof(*comp_hdmi), GFP_KERNEL);
 	if (!comp_hdmi) {
 		ret = -ENOMEM;
 		goto err_cleanup_components;
@@ -1172,7 +1171,7 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	ret = snd_soc_component_initialize(comp_hdmi,
 					   &mt8173_afe_hdmi_dai_component,
-					   &pdev->dev);
+					   dev);
 	if (ret)
 		goto err_cleanup_components;
 
@@ -1186,30 +1185,32 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_cleanup_components;
 
-	ret = devm_request_irq(afe->dev, irq_id, mt8173_afe_irq_handler,
+	ret = devm_request_irq(dev, irq_id, mt8173_afe_irq_handler,
 			       0, "Afe_ISR_Handle", (void *)afe);
 	if (ret) {
-		dev_err(afe->dev, "could not request_irq\n");
+		dev_err(dev, "could not request_irq\n");
 		goto err_cleanup_components;
 	}
 
-	dev_info(&pdev->dev, "MT8173 AFE driver initialized.\n");
+	dev_info(dev, "MT8173 AFE driver initialized.\n");
 	return 0;
 
 err_cleanup_components:
-	snd_soc_unregister_component(&pdev->dev);
+	snd_soc_unregister_component(dev);
 err_pm_disable:
-	pm_runtime_disable(&pdev->dev);
+	pm_runtime_disable(dev);
 	return ret;
 }
 
 static void mt8173_afe_pcm_dev_remove(struct platform_device *pdev)
 {
-	snd_soc_unregister_component(&pdev->dev);
+	struct device *dev = &pdev->dev;
 
-	pm_runtime_disable(&pdev->dev);
-	if (!pm_runtime_status_suspended(&pdev->dev))
-		mt8173_afe_runtime_suspend(&pdev->dev);
+	snd_soc_unregister_component(dev);
+
+	pm_runtime_disable(dev);
+	if (!pm_runtime_status_suspended(dev))
+		mt8173_afe_runtime_suspend(dev);
 }
 
 static const struct of_device_id mt8173_afe_pcm_dt_match[] = {
-- 
2.49.0.805.g082f7c87e0-goog

