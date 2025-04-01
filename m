Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C67B1EB1BC
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 08:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743497826; cv=none; b=Bkq+SwiUHfDvI7jXwsNEbZ9s7cxUlgXfzSKLv58upO4nW0e0rB3T+9DHwiy0RbSircydN8uw7JZDbr4t9/DFRqsYlNeO72AH7+guP2hzh4QQf6YkEfQbDJ0N6GtwjpglNgjmpVlDQk5OAkGYiXB+A10Ji2WJSMaMR6gDJ5eE2Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743497826; c=relaxed/simple;
	bh=dUCkBFacp8UJ8QjqcofhauhM4wz+Tj2ggrizreMINHs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PQsqE6tCuM1Wy5B+SKMyVBGD9+5CCgeAW8yA1XUr2oJD3cglLyayIS52x1JohBvDwahUPcHmQ5JINkqtD8jJBfaVKRFWclmUCMgdKN6oViVRlK83S5RkKhMa0J8M4zYT0EtMaawOKMhKPYc9M3LwH9ffKNB14+yHYCMhWnanw0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Efwc8y+1; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Efwc8y+1"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-300fefb8e06so8612600a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 01:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743497824; x=1744102624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qxufKce8+6rFq47Dsd+IWCpPIS7gkHkiCqEgue9+foQ=;
        b=Efwc8y+1JMdzusfuG7ekaJYY6uWeA+ybvbsj3CN9/KwoZWOQS4wKjlyo8Lx5SJYMe5
         vonfHMM2xmSuBn9VYcz9pFYS2N9Hzeg7vlCpWOiTMg2ktUk5tLkrOja7Y6z4Bq+1kgrH
         EbExn24ntbJE1vr7DGKR6tVvH3833VIhXtPqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743497824; x=1744102624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qxufKce8+6rFq47Dsd+IWCpPIS7gkHkiCqEgue9+foQ=;
        b=oYKoMiRpQ0RGQrag2BfkjiDC5BuOhH4BxmTQ9PvcKSc2L0G+YtQuytarLxdCti3OQX
         wmV42AOmOdxqZ0YpN0dVT4LbaqA3W9FJEoH7iH/N9DhU7F9hXZdehuSqoK8TYrXfge/Z
         INS7LQr7afnjdMjmo+q3c+xc/DHXYtRKNwCRYaDcjuZe06G7zlvHkJFzGns6C2kClOtL
         C1Jso8ZcfHii+NY3m9mmketznq/r0JG8kb6t6omPn/r9JqZUy7JCetxd3OeuX+qZvBTG
         /tGFAWOX9xBkvRAdqucq3vI9YJfHJ1vNRwK7xMhADTt0rPEgqBmxZOlON5gGDt3UZiRS
         GqPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUP9Es87NdRRm6D8cwHmQaxOlNNinRjBJPzRt2nRbDg05QhPzzROibBtT9X6eucM4ybVht3or4e8Svwd5Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyO/eSUZH7rIUbPQ/rKPenEe5Q9xj6vsxrr6t6dhLEOErmkV1e2
	04wwHF0/noTjhenONJwpki9LeK3TuhXhmMxGr4MAy5ET+pfYVq7ZlsZITE6tuw==
X-Gm-Gg: ASbGncuxN+vA2fdOV6IFAlOruCasK016xOm5qexWuP/1EgYbHQim97RYRgzQVJjngvY
	oLpgZhK/r9y8Iiqz5HXKF+UbzSS6uZlbVDNF7JEdNsc8KY2JeeF8L2eGeFqgVhf8SO3nPsze9SE
	7xrwv00nQ9jKW7BA1JuWYQ2yZ9vywl+58mc1ITuOGdjTC975OF9jINqaY028sy1lJij48PumyD2
	Qb1nQpWU3KuD10Ohbrta+8VhKOQMO4fc3pbkyuZQAOWBBCLJwZLZif5AQUV4GDWW6t8SLjiWdOV
	MKKG2G8p3zbw7nt7YhOCeqBFTFOpTOEFsXGmwjLDxBK/lvpQ6bXpZJdtrEYHGXh0q5Dsmp83FQ=
	=
X-Google-Smtp-Source: AGHT+IEGnyXdQQaEtEc12iqZVx24nt1bNnc7msMFARFnIYDLX4DR4C5RKsaUHtsIKRjop94QRdf+PA==
X-Received: by 2002:a17:90b:5690:b0:2fe:9e6c:add9 with SMTP id 98e67ed59e1d1-305608ab182mr4183384a91.18.1743497824504;
        Tue, 01 Apr 2025 01:57:04 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:ad70:9e5d:51fd:567e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-305166caa77sm8756803a91.0.2025.04.01.01.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 01:57:04 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-sound@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	treapking@chromium.org,
	yuanhsinte@chromium.org
Subject: [PATCH] ASoC: mediatek: re-enable buffer pre-allocation on some platforms
Date: Tue,  1 Apr 2025 16:56:57 +0800
Message-ID: <20250401085659.1222008-1-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In commit 32c9c06adb5b ("ASoC: mediatek: disable buffer pre-allocation")
buffer pre-allocation was disabled to accommodate newer platforms that
have a limited reserved memory region for the audio frontend.

Turns out disabling pre-allocation across the board impacts platforms
that don't have this reserved memory region. Buffer allocation failures
have been observed on MT8173 and MT8183 based Chromebooks under low
memory conditions, which results in no audio playback for the user.

Reinstate the original policy of pre-allocating audio buffers at probe
time on MT8173, MT8183, and MT8186 platforms. These platforms do not
have reserved memory for the audio frontend.

Fixes: 32c9c06adb5b ("ASoC: mediatek: disable buffer pre-allocation")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 sound/soc/mediatek/common/mtk-afe-platform-driver.c | 4 +++-
 sound/soc/mediatek/common/mtk-base-afe.h            | 1 +
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c          | 1 +
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c          | 1 +
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c          | 1 +
 5 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/common/mtk-afe-platform-driver.c b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
index 6b6330583941..70fd05d5ff48 100644
--- a/sound/soc/mediatek/common/mtk-afe-platform-driver.c
+++ b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
@@ -120,7 +120,9 @@ int mtk_afe_pcm_new(struct snd_soc_component *component,
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
 
 	size = afe->mtk_afe_hardware->buffer_bytes_max;
-	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, afe->dev, 0, size);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, afe->dev,
+				       afe->preallocate_buffers ? size : 0,
+				       size);
 
 	return 0;
 }
diff --git a/sound/soc/mediatek/common/mtk-base-afe.h b/sound/soc/mediatek/common/mtk-base-afe.h
index f51578b6c50a..a406f2e3e7a8 100644
--- a/sound/soc/mediatek/common/mtk-base-afe.h
+++ b/sound/soc/mediatek/common/mtk-base-afe.h
@@ -117,6 +117,7 @@ struct mtk_base_afe {
 	struct mtk_base_afe_irq *irqs;
 	int irqs_size;
 	int memif_32bit_supported;
+	bool preallocate_buffers;
 
 	struct list_head sub_dais;
 	struct snd_soc_dai_driver *dai_drivers;
diff --git a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
index 04ed0cfec174..37b20ec80829 100644
--- a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
+++ b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
@@ -1114,6 +1114,7 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 	afe->mtk_afe_hardware = &mt8173_afe_hardware;
 	afe->memif_fs = mt8173_memif_fs;
 	afe->irq_fs = mt8173_irq_fs;
+	afe->preallocate_buffers = true;
 
 	platform_set_drvdata(pdev, afe);
 
diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index d083b4bf0f95..0ef07fb2898d 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -1214,6 +1214,7 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 	afe->mtk_afe_hardware = &mt8183_afe_hardware;
 	afe->memif_fs = mt8183_memif_fs;
 	afe->irq_fs = mt8183_irq_fs;
+	afe->preallocate_buffers = true;
 
 	afe->runtime_resume = mt8183_afe_runtime_resume;
 	afe->runtime_suspend = mt8183_afe_runtime_suspend;
diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
index db7c93401bee..c588a68d672d 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
@@ -2935,6 +2935,7 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
 	afe->irq_fs = mt8186_irq_fs;
 	afe->get_dai_fs = mt8186_get_dai_fs;
 	afe->get_memif_pbuf_size = mt8186_get_memif_pbuf_size;
+	afe->preallocate_buffers = true;
 
 	afe->runtime_resume = mt8186_afe_runtime_resume;
 	afe->runtime_suspend = mt8186_afe_runtime_suspend;
-- 
2.49.0.472.ge94155a9ec-goog

