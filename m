Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5879924DFF6
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 12:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743684184; cv=none; b=f3OLVX4QMEDtM8IQBUjmIw1jspVA9rv5FqBzJ3xApmTdyFBvf/VfTlGkgIsWD+s574osHNlHLAlo/0R+D8J13RuCmlZJJLc1c5SE1Ot9bCACvFA9sFcRjUwFAmAjU8okVWVdCfSREcJ8Kc8UTVgP+LjdZmsDRmfXXlG9SCoVUGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743684184; c=relaxed/simple;
	bh=sb2QRnB7188NOtda5DPHBASrexKmkSX9VEuesDDtB+M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DnQyPFMiMrk6770YsXjRK3x7bPCtudF0i2Yh35xEmaywB7w8WPmAPy7zyURFH7ma8NN/ztFIwQ4uvujkPhkloqxp1FGJs2QmoxsZY256SXtCC/RmAVVuiGEROdeRcQ/p/No8Y0/gweAsqs8850QSNzjJH1CZwYQnm/AXpC9k1QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uuUdfwDM; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uuUdfwDM"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4394345e4d5so5338345e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 05:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743684180; x=1744288980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X2gzGEzgiKIa4EMF6KQg0t5+kh4IPdUUyGlnfc/EwEw=;
        b=uuUdfwDMWKADYPr6aBZDzW3ukiuKhdz/AoR2O2HkWY0WBxV2FWYAaQQJdsR0ZwvuDG
         tKBKbuBsHjIbYAaKlSq1hx4nxfpVQemL3ZCAzUiPw92zwqI5vPnWtm3N+2qkmqJH7wbA
         D0bFQBbBbcbMJlatV8xv4r1CzRnDY2oOP054TDP3tYkfG2bMb9lZ0rDe+w5S+QbDDI1v
         xZntQCEHIcHKkcnZIVUZCoxZzK/KymKE+UESvZV52oF/ZtwzkWn/HbWfQINUvg3Z3D1q
         mCCqku6yhH0aA7P7q0q9RrU1maCoWdpIrK+LC3sfJYQQhMP8n9ACWdqmz69GOx062YQe
         5kww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743684180; x=1744288980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X2gzGEzgiKIa4EMF6KQg0t5+kh4IPdUUyGlnfc/EwEw=;
        b=VhgNi7ez5XD++mK4fuerrCTiZtv7C+SsWaI9ehxr+biGnAqC0Eu2gh3yIfqvvhBF1m
         8Kz5Ek9vf35UVxgY5LQb9+IlHRENESQubOJLqrYuvgd8jAMojINX753TK7Iu1FRGqAlh
         PV9zLkDA/RWViMqNKqrVNq0YO66FZOeS9QuS10YKrgsK9j5KH7LYWuNMfdcZy9dztZES
         oFdyoIfKGizl4+dSnOnRenTbyG6r0byneuUhJ1AK022EeHweSFejkKDjjTj79G+TdA4T
         GapaCgSbmSYpGs2nnJdoVDOV75mknqCLGpCzsK5Zc/5QsNy8dkbTR6JEdhNhAhhL51UO
         mFVg==
X-Forwarded-Encrypted: i=1; AJvYcCU8APp7TezWIYjmB+p4L5jtDyHzNgLUk0GoZd4WUJubpYxMjZ6BiNLXFPkdRZX95p5+zA+0FmcwFm8Dukk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9IwGLlhRBxj9ELCSpgE0J4v2Rtk7up6DP0bhw2ESZWXPmo0GG
	q+Df8zUS3AmP2Z9OlIa2kuksabX2NQVSZhMkdn+XpaMvgP05M/bTioq28bGUMCo=
X-Gm-Gg: ASbGncsGpATIvIeZg2UHtOv31T/Wo/qZrmHpPINr7sWF4q8sGfXSQk4YPO7UQDrzVa1
	94ED5dR0T6wa49nYjd/nEi4flijpM6p6qfgf4gnMXFq2ubVn2P00WG/8q23a4GPa2eya/v2ox9p
	ep1rwljt/9upoPLCeRNfyULRnl9RwcxlsY6O/yI2R4ODk4V2+trX/UornvLxnQeqHsXnLDQkf3x
	07T9a59ghytUDNchTApMXE4vpOaTQTSY1WKvXWGJN4s46CTE4ah2ySycKd2zNL75PCZE3GuG22u
	17gB9zMeEhgvsZ9PU85eeRU5uejvVFEN2zRMK/55Kll4xtpEGQmmTdNn5WMJ9+V7RRZocwCAO8c
	MnGRM
X-Google-Smtp-Source: AGHT+IEbPg8+OB+t29rOtNL2QkkFRiJ5r3Z4JpZaekYA6Sh1gaBggQto/hs6PTOfMoriK53k96kgHg==
X-Received: by 2002:a05:6000:4023:b0:39c:119f:27c4 with SMTP id ffacd0b85a97d-39c29767c83mr5503332f8f.30.1743684180601;
        Thu, 03 Apr 2025 05:43:00 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34a7615sm17312505e9.9.2025.04.03.05.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 05:42:59 -0700 (PDT)
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
	stable@vger.kernel.org,
	Manikantan R <quic_manrav@quicinc.com>
Subject: [PATCH v3 2/2] ASoC: codecs:lpass-wsa-macro: Fix logic of enabling vi channels
Date: Thu,  3 Apr 2025 13:42:47 +0100
Message-Id: <20250403124247.7313-3-srinivas.kandagatla@linaro.org>
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

Existing code only configures one of WSA_MACRO_TX0 or WSA_MACRO_TX1
paths eventhough we enable both of them. Fix this bug by adding proper
checks and rearranging some of the common code to able to allow setting
both TX0 and TX1 paths

Without this patch only one channel gets enabled in VI path instead of 2
channels. End result would be 1 channel recording instead of 2.

Fixes: 2c4066e5d428 ("ASoC: codecs: lpass-wsa-macro: add dapm widgets and route")
Cc: stable@vger.kernel.org
Co-developed-by: Manikantan R <quic_manrav@quicinc.com>
Signed-off-by: Manikantan R <quic_manrav@quicinc.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-wsa-macro.c | 112 +++++++++++++++++------------
 1 file changed, 68 insertions(+), 44 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index ac119847bc22..c9e7f185f2bc 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -1469,46 +1469,11 @@ static int wsa_macro_mclk_event(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
-static int wsa_macro_enable_vi_feedback(struct snd_soc_dapm_widget *w,
-					struct snd_kcontrol *kcontrol,
-					int event)
-{
-	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
-	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
-	u32 tx_reg0, tx_reg1;
-	u32 rate_val;
 
-	switch (wsa->pcm_rate_vi) {
-	case 8000:
-		rate_val = CDC_WSA_TX_SPKR_PROT_PCM_RATE_8K;
-		break;
-	case 16000:
-		rate_val = CDC_WSA_TX_SPKR_PROT_PCM_RATE_16K;
-		break;
-	case 24000:
-		rate_val = CDC_WSA_TX_SPKR_PROT_PCM_RATE_24K;
-		break;
-	case 32000:
-		rate_val = CDC_WSA_TX_SPKR_PROT_PCM_RATE_32K;
-		break;
-	case 48000:
-		rate_val = CDC_WSA_TX_SPKR_PROT_PCM_RATE_48K;
-		break;
-	default:
-		rate_val = CDC_WSA_TX_SPKR_PROT_PCM_RATE_8K;
-		break;
-	}
-
-	if (test_bit(WSA_MACRO_TX0, &wsa->active_ch_mask[WSA_MACRO_AIF_VI])) {
-		tx_reg0 = CDC_WSA_TX0_SPKR_PROT_PATH_CTL;
-		tx_reg1 = CDC_WSA_TX1_SPKR_PROT_PATH_CTL;
-	} else if (test_bit(WSA_MACRO_TX1, &wsa->active_ch_mask[WSA_MACRO_AIF_VI])) {
-		tx_reg0 = CDC_WSA_TX2_SPKR_PROT_PATH_CTL;
-		tx_reg1 = CDC_WSA_TX3_SPKR_PROT_PATH_CTL;
-	}
-
-	switch (event) {
-	case SND_SOC_DAPM_POST_PMU:
+static void wsa_macro_enable_disable_vi_sense(struct snd_soc_component *component, bool enable,
+						u32 tx_reg0, u32 tx_reg1, u32 val)
+{
+	if (enable) {
 		/* Enable V&I sensing */
 		snd_soc_component_update_bits(component, tx_reg0,
 					      CDC_WSA_TX_SPKR_PROT_RESET_MASK,
@@ -1518,10 +1483,10 @@ static int wsa_macro_enable_vi_feedback(struct snd_soc_dapm_widget *w,
 					      CDC_WSA_TX_SPKR_PROT_RESET);
 		snd_soc_component_update_bits(component, tx_reg0,
 					      CDC_WSA_TX_SPKR_PROT_PCM_RATE_MASK,
-					      rate_val);
+					      val);
 		snd_soc_component_update_bits(component, tx_reg1,
 					      CDC_WSA_TX_SPKR_PROT_PCM_RATE_MASK,
-					      rate_val);
+					      val);
 		snd_soc_component_update_bits(component, tx_reg0,
 					      CDC_WSA_TX_SPKR_PROT_CLK_EN_MASK,
 					      CDC_WSA_TX_SPKR_PROT_CLK_ENABLE);
@@ -1534,9 +1499,7 @@ static int wsa_macro_enable_vi_feedback(struct snd_soc_dapm_widget *w,
 		snd_soc_component_update_bits(component, tx_reg1,
 					      CDC_WSA_TX_SPKR_PROT_RESET_MASK,
 					      CDC_WSA_TX_SPKR_PROT_NO_RESET);
-		break;
-	case SND_SOC_DAPM_POST_PMD:
-		/* Disable V&I sensing */
+	} else {
 		snd_soc_component_update_bits(component, tx_reg0,
 					      CDC_WSA_TX_SPKR_PROT_RESET_MASK,
 					      CDC_WSA_TX_SPKR_PROT_RESET);
@@ -1549,6 +1512,67 @@ static int wsa_macro_enable_vi_feedback(struct snd_soc_dapm_widget *w,
 		snd_soc_component_update_bits(component, tx_reg1,
 					      CDC_WSA_TX_SPKR_PROT_CLK_EN_MASK,
 					      CDC_WSA_TX_SPKR_PROT_CLK_DISABLE);
+	}
+}
+
+static void wsa_macro_enable_disable_vi_feedback(struct snd_soc_component *component,
+						 bool enable, u32 rate)
+{
+	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
+	u32 tx_reg0, tx_reg1;
+
+	if (test_bit(WSA_MACRO_TX0, &wsa->active_ch_mask[WSA_MACRO_AIF_VI])) {
+		tx_reg0 = CDC_WSA_TX0_SPKR_PROT_PATH_CTL;
+		tx_reg1 = CDC_WSA_TX1_SPKR_PROT_PATH_CTL;
+		wsa_macro_enable_disable_vi_sense(component, enable, tx_reg0, tx_reg1, rate);
+	}
+
+	if (test_bit(WSA_MACRO_TX1, &wsa->active_ch_mask[WSA_MACRO_AIF_VI])) {
+		tx_reg0 = CDC_WSA_TX2_SPKR_PROT_PATH_CTL;
+		tx_reg1 = CDC_WSA_TX3_SPKR_PROT_PATH_CTL;
+		wsa_macro_enable_disable_vi_sense(component, enable, tx_reg0, tx_reg1, rate);
+
+	}
+
+}
+
+static int wsa_macro_enable_vi_feedback(struct snd_soc_dapm_widget *w,
+					struct snd_kcontrol *kcontrol,
+					int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
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
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		/* Enable V&I sensing */
+		wsa_macro_enable_disable_vi_feedback(component, true, rate_val);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		/* Disable V&I sensing */
+		wsa_macro_enable_disable_vi_feedback(component, false, rate_val);
 		break;
 	}
 
-- 
2.39.5

