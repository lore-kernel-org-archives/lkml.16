Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F66A2E92A1
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 11:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750074866; cv=none; b=P2ITIBGNirLkhiOUe/DQBtewlimqHEvvKvvGpFU3hnATsY90wF14QPprapYfmsSNTLL+joI1IitjcnaRch6wWNlVgMTEosHn434IqvLMPD7kDvllCieLONOMuRDrkk0Jy8+WqrVpOR8Wfjy6PR7fqzAy38pFgTKd+7g+RU9jGmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750074866; c=relaxed/simple;
	bh=wQD0VM9G7FvPvCnA3WbzQeuuI9ByecZFuAoduaJaoKM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nx42hwYNpkZVf1qHRnFdpxGdXa30rbNzhRDczTMg2oXjEo0G3giIex/+4uzbC0nKU0zxyErEx4ghwL8h2iFHmRhiIYcKfqkCaG9JxAt2M5M29km4Sf/Mue+160dujecjJDwCWBxL7iyJRIDOI011GYUe/c/3RX7PfwNQ4ug9p8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DvYA5TF5; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DvYA5TF5"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a4f64cdc2dso356027f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 04:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750074862; x=1750679662; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kxuY0rNktojawI74xu67ZDRUpldYQhaik2TjoTmqjhg=;
        b=DvYA5TF5zRVHBKwt/+p74aDuYjakaNutbVuUkUS8TjU49pNte123/Zs84K7IpDVG8e
         GehOewS54QWbEUUr/piSuxtUZ0qnmAyzISkIKOrEUTeWie1dymKZZhUHaK30jpiY+0as
         RpCIuONik6PzCeaktsNkM6NatMLp5olLqMdG8XCg6iOYLDo5lT8QVYuIjI1sfFv8kJBU
         TT8VVkGOOrkJc84LwCgfV1qlnVHmpkHFG+gqbZkos3z1WOUABU+hQnodPJ96OFIeJQYF
         qYpgQIQiZpRZ9OrUr/NfxwilqlyA8E/IUmDSR4ucRt7X9dQnmPAU/cTGofBksQlgOvfI
         q/Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750074862; x=1750679662;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kxuY0rNktojawI74xu67ZDRUpldYQhaik2TjoTmqjhg=;
        b=K1wEe7Bgpxw5e5VarIFslmHFLjWDSacvQsE18kAEkyneERTI931pbrW7nmbJsUgr/U
         e4OOY+mZuWJJN60BIvIbEJ7gx7qnLiQpvaPKD3UzHOVc6vfWxniunKnhgmYk0YKdqGsi
         Dwq3nk4gkhlgCoz+oantk0L6E77L9xjmcWW89sklWaBHkMFpSixX5AlX0EcC60o2CMU1
         clfpFpVXWyv20QN/SKT83bJ5XiCZ41o1IZseQCalzTdZDyUhttGLdb+v3X+SOhxE+8Nu
         2W7XISfrg5RToRfEC9cnuBBLs1ZqfseQ/bND2CqZekWyD002j6WNg6YR5mqT+kVcwGNp
         Oyog==
X-Forwarded-Encrypted: i=1; AJvYcCW4THbYYI+uSrGj+qhwA9wBPgMbxYYPLWcMJ2QiZE9Zrz01eFc/NvUzWiuVub+9eK7zGlcF9iQ3RAH3p6A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWhcFk4OEE0LquBnxeAVWa/jQZRjsW7fO/PoeXpkhBfPCl3TRg
	vaMwEXIUxH6F6RKwBwhsjnlTAajv6KiXXuyC87w+NvQPDNU/xwbJlin2Nm8frTwMJ9mOMZrHjIj
	uB/qUAvMqNA==
X-Gm-Gg: ASbGncsvLpn7opASk7C5hkMewd1HVemZr0klg0WXg0TvjdW6N28xU1x/oa9tMhqMEJ4
	OurlE6tVSNJJFM2RHfgA7cRyKZqKUH1jHMpzxsV+5nu+zAAWyc7C7ZaCdSpAkab7es2DOtC1NCe
	j9tnB7sZh/FBncLT64AVKRiC5WX92+ldL12xDgxLRoH5KKaM8AzS1jNbqe0OkLf+U3qiYPcQFBG
	fTXAINBMk3JA7r23HIJs+O8gDf6CE/o2EwJfPE6X/gfrtBn6XPkKCqe+X6wV7X4ZsMBvKoLKi/a
	fsrL0q0NfFh2Isru5KMF5o53fj/E4tYj55+5uY1SnM9J3sknrMZgSZh1Y7BMMZEtn3kCevWFPzw
	2ATRbP2Q=
X-Google-Smtp-Source: AGHT+IE/uypUYBrtwLuK0ZJnxv8FZRSLfV5+7+cqEFi6k+t+x3Cu8YNCPzj4gbCZ8ch/ks7SHt3yOA==
X-Received: by 2002:a05:6000:188d:b0:3a5:28f9:7175 with SMTP id ffacd0b85a97d-3a572e7a00cmr2559415f8f.9.1750074862418;
        Mon, 16 Jun 2025 04:54:22 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4534172d2b0sm73485315e9.35.2025.06.16.04.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 04:54:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 16 Jun 2025 13:54:10 +0200
Subject: [PATCH 3/4] ASoC: codecs: wcd939x: Use simple defines for chipid
 register value
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-asoc-wcd93xx-enum-v1-3-a20a1b538509@linaro.org>
References: <20250616-asoc-wcd93xx-enum-v1-0-a20a1b538509@linaro.org>
In-Reply-To: <20250616-asoc-wcd93xx-enum-v1-0-a20a1b538509@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2102;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=wQD0VM9G7FvPvCnA3WbzQeuuI9ByecZFuAoduaJaoKM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoUAXmUb0Sj8yAJGR79L6XHvLQKiPbQta/JCPr2
 D+N1aJFX7qJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaFAF5gAKCRDBN2bmhouD
 11IzD/9fr45oouoUk9Yj6Z+upATb4MHF2Tk3Zv5A28ia88TOok0d6+TBtG5xn71dvYGmqEPlBMT
 qc1QZADj5tswjvAcsO5xDqhUIuKOlfcj8X5cbra+SGRG3wm6/LQ+dB8hQ/QUObWa1jYCqDYXU8O
 0aR/Yn2xDAtI77BiWndxySOsccIAyuaWl3y+kOhCwXINctaYZ+C8GcF+i8/tLLesREiFUIAgVvO
 aRVUaAUftfYknyqpnXzccWPW+DU0FzCPVv0AIFyOaF1p7XofLvB9N86wXD9vzvbCl5A5wwUDpNr
 cfDWtIj/5dQskUwL5XGYKmGSQBSEzE4Q8pA1otnZBC9RgEvXcKokZyd7zUewDuO0lti2roQCaTn
 ET6BtDPjvX4l6GN1LDU544Wn6of4rm01rqUyVac3/mQAKk73FXHMm3HrAE7C67E2Cj9kPmHrZ+/
 NdHK4/kf2BhTV8rLtQa3DBR87Gge1pC7B7DIalIHyfZOin6As6SneCLTXJqhiwjszetHX4M/BeD
 2lpWEq0PYqdFWeTBDwRLuj0ieEFr8gguEB9Ilu+yNn8ikW3E2KANuxq5oWXnzxMvzzGEdFgFTTg
 VGGkSUckWcXVhX9lhRHIMrVwTdEmTu5//eKewlEAJ98lN3tpWiZSlT6mYVpQN6DXOMoJ/XuaPt4
 CMl6Ny+sSr2vEsQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

The value used to identify chip variant is not an enumeration, but raw
value used to compare registers with.  The 'enum' is not used in the
code at all, so simplify and make it a raw hex value define, so
intention will be explicit.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd939x.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/wcd939x.c b/sound/soc/codecs/wcd939x.c
index 45645abe3085662f7c4c6d76a590b98ad71fc56f..7ec751a6cd2610dd3c4eb2bb6556e8700b62427c 100644
--- a/sound/soc/codecs/wcd939x.c
+++ b/sound/soc/codecs/wcd939x.c
@@ -36,6 +36,9 @@
 #define TX_ADC_MAX			(4)
 #define WCD_MBHC_HS_V_MAX		1600
 
+#define CHIPID_WCD9390			0x0
+#define CHIPID_WCD9395			0x5
+
 enum {
 	WCD939X_VERSION_1_0 = 0,
 	WCD939X_VERSION_1_1,
@@ -85,11 +88,6 @@ enum {
 /* Z value compared in milliOhm */
 #define WCD939X_ANA_MBHC_ZDET_CONST	(1018 * 1024)
 
-enum {
-	WCD9390 = 0,
-	WCD9395 = 5,
-};
-
 enum {
 	/* INTR_CTRL_INT_MASK_0 */
 	WCD939X_IRQ_MBHC_BUTTON_PRESS_DET = 0,
@@ -1483,7 +1481,7 @@ static int wcd939x_rx_hph_mode_put(struct snd_kcontrol *kcontrol,
 	if (mode_val == wcd939x->hph_mode)
 		return 0;
 
-	if (wcd939x->variant == WCD9390) {
+	if (wcd939x->variant == CHIPID_WCD9390) {
 		switch (mode_val) {
 		case CLS_H_NORMAL:
 		case CLS_H_LP:
@@ -3065,7 +3063,7 @@ static int wcd939x_soc_codec_probe(struct snd_soc_component *component)
 	disable_irq_nosync(wcd939x->ear_pdm_wd_int);
 
 	switch (wcd939x->variant) {
-	case WCD9390:
+	case CHIPID_WCD9390:
 		ret = snd_soc_add_component_controls(component, wcd9390_snd_controls,
 						     ARRAY_SIZE(wcd9390_snd_controls));
 		if (ret < 0) {
@@ -3075,7 +3073,7 @@ static int wcd939x_soc_codec_probe(struct snd_soc_component *component)
 			goto err_free_ear_pdm_wd_int;
 		}
 		break;
-	case WCD9395:
+	case CHIPID_WCD9395:
 		ret = snd_soc_add_component_controls(component, wcd9395_snd_controls,
 						     ARRAY_SIZE(wcd9395_snd_controls));
 		if (ret < 0) {

-- 
2.45.2

