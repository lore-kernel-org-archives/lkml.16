Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313F224CEF1
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 12:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743684184; cv=none; b=Vi5zKtLekEjQiCnJaVGkBffHgye6A6ghWQbwt2eYZMb3aaKkmp7b8zi/bwlI/+W/eLNjqcADPF1zRtljv7kE3poGkpA+fDWWK3ja1Vp7bHaKNQ4s0mWYiWxEfgtVLJpnxF3t+xz/qjP7jCLo4g1Dd8Yth16NlDIlTcNDALl0jJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743684184; c=relaxed/simple;
	bh=D3YRzj3mCAmvwT1dNDp/XxMgwKsjJtdp0ijI+8PtraA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bhg07WquiQu7q25DUKLsnLNRh9wEs6gfKYkMkLrVk5mgaMgQPgk0IucwyQYbmgbOzBpwnFTLuLoE6pTxWm8Eq6U5K7s2WFMk7e/ROxlCz+A/G9XKdv1Wg5Vny4T6oPh8tTl1sxJU6G66D75eLSa62BLMKiNH2IDk3LQf7+kgaEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vbG62oQW; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vbG62oQW"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39c1efc457bso518478f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 05:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743684179; x=1744288979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K8Lmy7xC4akxbC/rSRpm6p7I4pTGlGcGr5of77/sByw=;
        b=vbG62oQWlblgZWd4xgjQtNUMurIWjhC/katsMMcEcC1xnBLmgEOdUFS3U0X6n/i2M+
         k8Rdw0Id3N7hv6abG/HQlf19iohMIEZitGvv85XSYjUvam3DRPSLUEKyHd19iuPPNs0l
         u19/6eSu+A2n6qF9NC/BrY2ZtrXJiuiAXt8Za0yZLUSQhWHvDEyHVXQdk/ANabsh7Qi1
         KJ9jYJQxyRWwkwnF8280jXqjflnaza5HSjaI5almeZlj4lhCIYuX1ufbG1xP2JsTllcf
         R+1rUhYT817Tpx3ONKMOLVcq56HfX420ydO+VSCv8DtiYpXShnz52BNCNWAJPInGjYMC
         bgKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743684179; x=1744288979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K8Lmy7xC4akxbC/rSRpm6p7I4pTGlGcGr5of77/sByw=;
        b=E/E45sQBku83lBtju3X98Or5gmabnRHBixcS0pBCLNA1w2PPrfNbNjibwB/CW4tHns
         69gyyhoDOPqhBb5QDcKe8n1GgUj04aSPD0zV4g80feBwTip8JxEkoo33+73zhBBKGCPx
         bGZRBn/ljFKA8XhZK1U9s3+mWXf3YEpeI8bIN/IyZGepVHpsRTl62c246b31rsEdtP8D
         I3dk+MEhY7I0uV/sVT7upAS9uAMhOeIHDo+wHQXUm0KuiGDhZeUkgh7d2rUE6ojqsl36
         MFTba6ZKNG1CZ267qOlc/UrxdlqgCprmz4tOEiuRQT4H93ys7iKl+C6ZW4C1ImSVBGHP
         gT9w==
X-Forwarded-Encrypted: i=1; AJvYcCU9Q02pbB5dSlMELQ0xQzciLVopE/h6DrMwS5xk2UMosL0ztxJXqC4VLkL1JVWs2OQPpkVa8UGLf3Bb6vk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz75VJKaLyTsVBgGtSf2rtD6pmwNmoxBMT3NLshhh669oYM86RE
	/L5+jRAeet86fmKyrfvZw1uf9Gx0H472TtZoqmYQ0Ihat7C3BUCzDRo1soaN0e8=
X-Gm-Gg: ASbGncvXbuF1HgGIxA0IG2jn0PB1ZaNmCfq/Gltl26XJ/JxucH3pCqrhY74DVEAfv2y
	9cIWj2UOrfe3uAAJtp053hnPUfO2rajOfs04adlyACt7dx/fXqT4YHg60FUTMHOGGks3FKT+XGB
	tXoxuzHG13PZp7h761zU4CQpJ9dTFB+Z0JJSLtxNkbFkyQYWbTukg/7MDaWqBPv9Q98Pg7ZtQKq
	ZWohKWEdpENIFxj2AlonfBVW0ShGF0DsHYUqnKPkcNsWqtCsftUnpVxK1JXSLnq7Dh8waxhfjU2
	5PGIIX4C0aFCF4qJGx0iblpEOSqh1lDJpGmm4C50m8OIjHKoU2XKco30dOXZt4dI5w00rg==
X-Google-Smtp-Source: AGHT+IGE6xylVZSZ796+4B1DhKJi0ahGSGLaNKAnwgsZ5gCFYnuPC7oaNBPI8qkRDECC2cthkSTB+g==
X-Received: by 2002:a05:6000:144b:b0:39a:ca0c:fb0c with SMTP id ffacd0b85a97d-39c2f8e1369mr2190659f8f.28.1743684179389;
        Thu, 03 Apr 2025 05:42:59 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34a7615sm17312505e9.9.2025.04.03.05.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 05:42:58 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	pierre-louis.bossart@linux.dev,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH v3 1/2] ASoC: codecs:lpass-wsa-macro: Fix vi feedback rate
Date: Thu,  3 Apr 2025 13:42:46 +0100
Message-Id: <20250403124247.7313-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250403124247.7313-1-srinivas.kandagatla@linaro.org>
References: <20250403124247.7313-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Currently the VI feedback rate is set to fixed 8K, fix this by getting
the correct rate from params_rate.

Without this patch incorrect rate will be set on the VI feedback
recording resulting in rate miss match and audio artifacts.

Fixes: 2c4066e5d428 ("ASoC: codecs: lpass-wsa-macro: add dapm widgets and route")
Cc: stable@vger.kernel.org
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-wsa-macro.c | 39 +++++++++++++++++++++++++++---
 1 file changed, 36 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index c989d82d1d3c..ac119847bc22 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -63,6 +63,10 @@
 #define CDC_WSA_TX_SPKR_PROT_CLK_DISABLE	0
 #define CDC_WSA_TX_SPKR_PROT_PCM_RATE_MASK	GENMASK(3, 0)
 #define CDC_WSA_TX_SPKR_PROT_PCM_RATE_8K	0
+#define CDC_WSA_TX_SPKR_PROT_PCM_RATE_16K	1
+#define CDC_WSA_TX_SPKR_PROT_PCM_RATE_24K	2
+#define CDC_WSA_TX_SPKR_PROT_PCM_RATE_32K	3
+#define CDC_WSA_TX_SPKR_PROT_PCM_RATE_48K	4
 #define CDC_WSA_TX0_SPKR_PROT_PATH_CFG0		(0x0248)
 #define CDC_WSA_TX1_SPKR_PROT_PATH_CTL		(0x0264)
 #define CDC_WSA_TX1_SPKR_PROT_PATH_CFG0		(0x0268)
@@ -407,6 +411,7 @@ struct wsa_macro {
 	int ear_spkr_gain;
 	int spkr_gain_offset;
 	int spkr_mode;
+	u32 pcm_rate_vi;
 	int is_softclip_on[WSA_MACRO_SOFTCLIP_MAX];
 	int softclip_clk_users[WSA_MACRO_SOFTCLIP_MAX];
 	struct regmap *regmap;
@@ -1280,6 +1285,7 @@ static int wsa_macro_hw_params(struct snd_pcm_substream *substream,
 			       struct snd_soc_dai *dai)
 {
 	struct snd_soc_component *component = dai->component;
+	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
 	int ret;
 
 	switch (substream->stream) {
@@ -1291,6 +1297,11 @@ static int wsa_macro_hw_params(struct snd_pcm_substream *substream,
 				__func__, params_rate(params));
 			return ret;
 		}
+		break;
+	case SNDRV_PCM_STREAM_CAPTURE:
+		if (dai->id == WSA_MACRO_AIF_VI)
+			wsa->pcm_rate_vi = params_rate(params);
+
 		break;
 	default:
 		break;
@@ -1465,6 +1476,28 @@ static int wsa_macro_enable_vi_feedback(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
 	u32 tx_reg0, tx_reg1;
+	u32 rate_val;
+
+	switch (wsa->pcm_rate_vi) {
+	case 8000:
+		rate_val = CDC_WSA_TX_SPKR_PROT_PCM_RATE_8K;
+		break;
+	case 16000:
+		rate_val = CDC_WSA_TX_SPKR_PROT_PCM_RATE_16K;
+		break;
+	case 24000:
+		rate_val = CDC_WSA_TX_SPKR_PROT_PCM_RATE_24K;
+		break;
+	case 32000:
+		rate_val = CDC_WSA_TX_SPKR_PROT_PCM_RATE_32K;
+		break;
+	case 48000:
+		rate_val = CDC_WSA_TX_SPKR_PROT_PCM_RATE_48K;
+		break;
+	default:
+		rate_val = CDC_WSA_TX_SPKR_PROT_PCM_RATE_8K;
+		break;
+	}
 
 	if (test_bit(WSA_MACRO_TX0, &wsa->active_ch_mask[WSA_MACRO_AIF_VI])) {
 		tx_reg0 = CDC_WSA_TX0_SPKR_PROT_PATH_CTL;
@@ -1476,7 +1509,7 @@ static int wsa_macro_enable_vi_feedback(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
-			/* Enable V&I sensing */
+		/* Enable V&I sensing */
 		snd_soc_component_update_bits(component, tx_reg0,
 					      CDC_WSA_TX_SPKR_PROT_RESET_MASK,
 					      CDC_WSA_TX_SPKR_PROT_RESET);
@@ -1485,10 +1518,10 @@ static int wsa_macro_enable_vi_feedback(struct snd_soc_dapm_widget *w,
 					      CDC_WSA_TX_SPKR_PROT_RESET);
 		snd_soc_component_update_bits(component, tx_reg0,
 					      CDC_WSA_TX_SPKR_PROT_PCM_RATE_MASK,
-					      CDC_WSA_TX_SPKR_PROT_PCM_RATE_8K);
+					      rate_val);
 		snd_soc_component_update_bits(component, tx_reg1,
 					      CDC_WSA_TX_SPKR_PROT_PCM_RATE_MASK,
-					      CDC_WSA_TX_SPKR_PROT_PCM_RATE_8K);
+					      rate_val);
 		snd_soc_component_update_bits(component, tx_reg0,
 					      CDC_WSA_TX_SPKR_PROT_CLK_EN_MASK,
 					      CDC_WSA_TX_SPKR_PROT_CLK_ENABLE);
-- 
2.39.5

