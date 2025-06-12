Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A3A22541B
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 07:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749714581; cv=none; b=dScpEqPIRgP7QTUgNIljwIWomdWMR38MT4d5eCgyBEtxT+jlqtmkl1Fiy1+djWL3l34YO6AocjucWKSZ5G9W4KEhg8QRJOL7OXsXhtmx5GxIHTdO8wfcsQyj7FNofQEL/PTU6jIfJSfvFUuMp+xyJBEVOMDDmzt8rvFKD1es3IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749714581; c=relaxed/simple;
	bh=buSIZ3mUEgzHTw13z6E0J1/Ujd8OUrdascAOzkTqqhI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rm/P1zGuKb93nNteglHStGiWI02qSEUKGFEsnDOUV8tSLjsMemMCLZzBLTQq0kY0BPplUjPOdmPA/6NI8U/RLanc9sWKqx9E7BR/82X99p3vPDU5meQS3Bojxxr2exeLAUXw2joJSggbME75qhZiOdCBo17P/EuNysMyCAt6io4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=i+vd/MFS; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="i+vd/MFS"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2350b1b9129so4873755ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 00:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749714579; x=1750319379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iMKg3AJWHj8JObjZ77FIwuRQDDLq0jFSD2L3C+IDYm4=;
        b=i+vd/MFSZtba3F3E5NLPCBgK1kTXOAcpAlOo17hxTT2PGNnM/QjjVuPnl46Uwo4Qc5
         gLqNVS1esdsUVJjIMIgx8S1N/OFeSb+tg/Jgd0iu9wDFTie3yuIBjfNFXp2Vc5O1+yIC
         dk9Tj8xno2oWx5DhfHTmEpuspzxdE4DeqoH1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749714579; x=1750319379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iMKg3AJWHj8JObjZ77FIwuRQDDLq0jFSD2L3C+IDYm4=;
        b=sjZkqfJ3mZNOyG7pDaeBraUPJTCocMkqAUwJfm/7DnCAHmoK6/T4mP/EB00OyvnpWM
         YgB7Bfz5ldghiNLQy9Y4XELrOT0h6pCgYOpIVriqUXH7vTtNKo7+sEEn1AY/supOM9ho
         jlfZswCBSRFiwDY4AbYTfsLggAfoCdEIC2lFZvcFDmTDLLM2tCoGjgUSKBBSKWToCgH2
         aN92P9UoiDB5bGJbH1EnntU5xU20/9fQjMHgelaFp7VWOxIB5dNAZtIY6sAhROO55cP5
         HjVuPcF+E5TeUm8b6rmuBpXATfuNBciz8m8X8in/JEZ9biXs406/JAPP4sXQL40Xc8Iy
         7ouQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJV5s6rQEW8HgusCec0Oxu4SVdqDUa+b357V/FCLZeI1/yLSYlQynKJoGthJCXYlzJWPBM+MAoyxIof4M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbnIjb7mepQkaljQDQM+qYwxliaVgzrfKnxjnkjiGUiDB0rawk
	FMC3NJvgJBfE7ULCtBZttuhOFfAPwBCFDa61J7OM5FWo8E6McZBVNVAUkG/Zl2i5Wg==
X-Gm-Gg: ASbGncvYx7as9Y7dKpA4AhQPVsuYQPQ17v4OjFi0FxnvwDAtMIb16F6I7Eg2Qp5wKzN
	tugMOWAWL+3DzBBPsISYgYxyp+V6njyMuxfg9VdvhwdA+oqkNlQ+kLWLBbio7Kg4TWvJvC1+idJ
	Mn5hALvMB5Jl1QPywUo41uNRg8hQI+iXUw+AbupeFKSyWKYwYWeM5Tb7+BJmUP2T0ssRoaatD+8
	WhTmYpsNF4rpJUx8ijX9zpZypG4Ebn0lvevBhWsXmaARPLYStY2riziGlsGbmK48Khdt48JDztE
	sb+ESr+NRt11Hw9EIkEOI6/Xtbuic42T0a+TcI80YeYjvI0SO+8p4fu93rtbGCRNPq92W8o3qsl
	r9WU=
X-Google-Smtp-Source: AGHT+IFFR598oT7VAz4Mzmjghx/G16LP2D1CuewctVbUf6JSejNRvGbYfC7QtwuZY6nk2c5HrvbdeA==
X-Received: by 2002:a17:902:ced0:b0:234:c549:da0e with SMTP id d9443c01a7336-2364ca8e826mr35303785ad.47.1749714578786;
        Thu, 12 Jun 2025 00:49:38 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:5b9:e73a:2e58:5a47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2364e63d42esm7893295ad.74.2025.06.12.00.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 00:49:38 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 8/9] ASoC: mediatek: mt8173-afe-pcm: use local `dev` pointer in driver callbacks
Date: Thu, 12 Jun 2025 15:48:59 +0800
Message-ID: <20250612074901.4023253-9-wenst@chromium.org>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
In-Reply-To: <20250612074901.4023253-1-wenst@chromium.org>
References: <20250612074901.4023253-1-wenst@chromium.org>
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

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
2.50.0.rc1.591.g9c95f17f64-goog

