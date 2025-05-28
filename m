Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53BD221F14
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 20:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748462419; cv=none; b=PYH6TQ3QddCX4dyoC/1o2IrDTBOc3uLc/0dbk1NkGX+9FTyKiUiVgIti/JxmDuyW2fOTDLZ3l/unWDgVDJmz5t6PTMysKA6u/mntQTdeF5fK8Buf54Rb8oPKZOFlk4kD87nn503wHeb78FsIcydzoXUX4EaTFacpvES+9RGByD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748462419; c=relaxed/simple;
	bh=lT1m78a5qGVOKbZAbB7diz61bVOOaiAaHoKCKGNWh50=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lU3XzXlEUg9AD5xE9qc4BOy/SG3UwuppaX0W1z2qHAztr4u9/nBeJ+QvC268TOosy4FEfo2gm+tHYrNIBtdMqvq6vNuW1wFpUwAiYfkKfqz92NjJJHCapHT3lCsPdgMjtlZNU+T1hfxD8vSHxdI4hf+8bcDueKNX8I0uROyr0mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GO3qH29h; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GO3qH29h"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-441c0d8eb3bso253745e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 13:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748462416; x=1749067216; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZDDwbVrb+Lr3lW3ZnLKgMm/1vI4UvBgyIYgvCQObe8g=;
        b=GO3qH29hydK+KHOrUtMiKKK6AirTwswZhwRee7CPp1ccN7JN3g1HkZ4AFRg0mzoUDu
         bpRTzCpIm90myFSVu28JeXkxGTSXcNWM/5xu/GRElH9jXutwjbH0hny+soDwR+wQxTrH
         Sof3wpn4OPM2Tnj8rxOUhyweVxHAR6U2n3QPXSQw/vbg54GJEyommTnlMp2y5lOP5BjD
         ZrrftRPO9vtUyGfgmJBFW4qsQwxvAE2fo2tyGk0dx7JTR9qzI/6vkHBmUc9VUJxdZB2b
         1f04ZbPEtADYxgv+Q7ZpMvVgDesFf34YJ/TN76faVny6bU0FV4g1UvwPtlOjsv0jTrSa
         2HQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748462416; x=1749067216;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZDDwbVrb+Lr3lW3ZnLKgMm/1vI4UvBgyIYgvCQObe8g=;
        b=fVyGIgBmHNJvmrAbIgLoRrXLRTU/Jcc6w1Wm/lH9Q03rWr24ZSS4EpiSbGhoMH6/Fs
         Qua39NLRb1jQlTxlt2ZtzMsqLqOgMXapFgRYu0wKF8BjPjXvxvO+a+EwTuAPyIGIC57v
         y7TgD20sofsXqtUOqSeaWmLHYgoz6vLWCZSONRDBY5Omk1/6ejiDnOl64gHp/8vG00IB
         FvAmB2GjRdYAQJakrX3q6v8U6O0X9NWh9ng/zpNPtTa3TTwLHdgTxxiZ6r2flEfPX0Oc
         YmE1ONFxmkJlzJ1B3RLNijItLk4/0+rCZjQFytuerUrSJImWlXai4+l6gPRrDqD2OZ/T
         mRgw==
X-Forwarded-Encrypted: i=1; AJvYcCWXR78kmNkHRJjB/zhOYE4K/qA+Gc/3MsK5BUHnqpyJGE5ValPHcl6MKaoLafgoOgZJUlI9htuqEjSd4a0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzI0e3eM/AIOiyOzQGpFaCzo5yY138sBxNWIBfzUe9Wwt+QPcp0
	9/UQ4O9YMG9ebhwSRhQ1ZdnRLuSyJqAkj6MOnHwSiek49pu+k+KJXjH9t86KiuKRj18=
X-Gm-Gg: ASbGnct+WuNI0I8oo/xB0wN2kiz2JlksJxgcQXC2NRqGzWKjeuh9zpaFKnIfnKiQ+4C
	lo1swFVUlj3JaiSyrbqTptxxMG5MLMFpJg96Dv1HpzzoJ4LdE1T8i3wJl4c7HeygI0vjBVi7KCt
	s93e8ZZPixFfcS86h/d0WQ80RZxyPRbkiF1jeLHfR+ul23wR0mEpzgbEojoSMyfIca6ubisag1P
	SSRmeCLwo/tzmrZCSSQz1rAa3ckgM6VEshqZ6qAB+lmh9gWy8BoKoiUnWUN3jdPElZAIvRazmd4
	5DiAATWjQG+F3j3j3zJn0gYAizAJ34YEYFx1awhSPXf27T02x5LYAlIYzO5hZY/sBhzDKDQ=
X-Google-Smtp-Source: AGHT+IEUp9P1Rdo95+j/qcn/d1qWkR9KlqEdDyLtA2WNzV3fonyT5InSDZh/G4WeFsVOslvd6Hfk+w==
X-Received: by 2002:a05:600c:4e8e:b0:43d:fa5e:50e6 with SMTP id 5b1f17b1804b1-44c93caf3f6mr63270165e9.9.1748462415869;
        Wed, 28 May 2025 13:00:15 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-44fcbd61553sm53347665e9.0.2025.05.28.13.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 13:00:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 May 2025 21:59:59 +0200
Subject: [PATCH 5/8] ASoC: codecs: wcd937x: Drop unused 'struct
 wcd937x_priv' fields
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-asoc-const-unused-v1-5-19a5d07b9d5c@linaro.org>
References: <20250528-asoc-const-unused-v1-0-19a5d07b9d5c@linaro.org>
In-Reply-To: <20250528-asoc-const-unused-v1-0-19a5d07b9d5c@linaro.org>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Oder Chiou <oder_chiou@realtek.com>, Srinivas Kandagatla <srini@kernel.org>, 
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=911;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=lT1m78a5qGVOKbZAbB7diz61bVOOaiAaHoKCKGNWh50=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoN2tAX+wAD12p4wigYDY2/hz3QwOsbso9X89lR
 Ng5mcXQlruJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDdrQAAKCRDBN2bmhouD
 11AFD/9Si+7Fm+Q9EnVv70UQBi958XlJvg081OyT55YpIa1hxdhWjvtPv9J/Tye5eA3z4M6f6uH
 ne2XxAWlpsZ6axzmSaGie4ev6B8SA8VjFw+WJ9S+35z+X96cXo1U20WxWfFEYOpPuVPQ6JJuwEC
 j+SjJosdkFzjQmnk8vCjAa49kAcoj1JNwx/7UfGV6zqldKw5KoWcuPd/SQijswZYH322lHgAX4g
 tjQXn9iAiLMjbk6hJEir6vuX4KW2O0QyBSV57xXbG6WoLRU/wB7pQaazNbmscfplHfdky0k9f9H
 X+MhRxj7Qu9E7+Z7yaD2LMsY/NNpXCd5P9amcRD5H4qw+lgutinstXm2B0Sta+CRcNkZ41mME5/
 ZSJWzxzya2xMJLRzMNXbMNoA2RF+igv9pGmV58qc7vuvOBJpgRLP35kzauyyyBTTXH98KjMpN2S
 /h96NKtr8WlY1OQHyqo4ht122F7EbXOZaZUjnPIdJyw6QEkLZgjG4rDJhNfPQMPiub/hNA2t6j+
 c7UeNznq5hoiDPS6gZd+Xa5n7RI3iqp+xYLrhhxmINw3lC0XfkhcDg20CgFd9iUZH6NHD5FsG0D
 LFaUlKgXuxHXeK/uKHGbMlSiAvlqasEmdqAx9OswqTLn4b0k/dDqNPuftnlmU20Fikt6/UanITc
 a1ICln+E/ZwXwFg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

'wcd_regmap_irq_chip' and 'jack' in 'struct wcd937x_priv' are not used
at all.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd937x.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
index b9df58b86ce953427e01ffb8c7eb7e52f9c2392a..126a29e0b3ff96c12fdaba2b9344a3040b455e44 100644
--- a/sound/soc/codecs/wcd937x.c
+++ b/sound/soc/codecs/wcd937x.c
@@ -88,10 +88,8 @@ struct wcd937x_priv {
 	struct wcd_mbhc_intr intr_ids;
 	struct wcd_clsh_ctrl *clsh_info;
 	struct irq_domain *virq;
-	struct regmap_irq_chip *wcd_regmap_irq_chip;
 	struct regmap_irq_chip_data *irq_chip;
 	struct regulator_bulk_data supplies[WCD937X_MAX_BULK_SUPPLY];
-	struct snd_soc_jack *jack;
 	unsigned long status_mask;
 	s32 micb_ref[WCD937X_MAX_MICBIAS];
 	s32 pullup_ref[WCD937X_MAX_MICBIAS];

-- 
2.45.2

