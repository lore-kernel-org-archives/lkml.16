Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42EF0285419
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 07:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747294723; cv=none; b=T1Ao+4HzyapcIguIZjZApQyocMRrAGif6WW+7NcLqh5PbjxdrZ3OaIhLwLvBmCC7sIs5x87y4lMhxk85bxJ84j/k9Mn8DjBBtZiBopwh789Ebw5vBex+htBHJ9zBIFBpxcA+5fDQNsp4qJO3o7csyO+JcgwhTPS55F/mM4FSh3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747294723; c=relaxed/simple;
	bh=HJFU1pobyGKIRjhv6sWs+4KE/Eb7e+JkMbmBP8ECP0M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nPs+7Wtjk6dxdsEXqOIhhFw4rapVadkhKpzRBwKlPglw8ghCelsjeKnwlWDf1mB9bQ+0CB2GPmMMhIfMfOh+ZCejuGEhkdAuPM9bmmzNcULi+mYdfeJCJm7lACDwz4QZQ4o8zQnjHBmO0sIJ/TlvOPvKfmD8XEkMFKc97/KZlm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ns0JczSi; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ns0JczSi"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-231bf5851b7so1307465ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 00:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747294720; x=1747899520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RlgroavkFNmhZvJ2omBGrXCrXVWCsbUHz4C2BYIxmqs=;
        b=Ns0JczSi53YZeZenB2k2D6/CVD8GsSNtn9HlzYyo3ujvAAhXk92uKNEzKtDj5Nlemt
         Yaf95u98jQigNOMWy5+FaIHLphlIZXASooiGTJzr/Wb+upA6qGSg1+WIgTOtQRH/jvoo
         5W0WdsBVuenjWHjRaIRMEutggw+GcSO7JLDK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747294720; x=1747899520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RlgroavkFNmhZvJ2omBGrXCrXVWCsbUHz4C2BYIxmqs=;
        b=ip5/c88S9PXh+rmwR21se8CHD18s50+MQ9YuXyGlJIUwna2oyjq1ITTRDvtTWVJjxO
         IGTukfIw8bVeI2PdZCneg82A97uS17XaBBSDBvxJ4MPT6MJ7PbJibVnog2ymnxLDDP19
         S+Nj8b51yQGO+liCQ+Hkx6hnvkHa0KzEAro5CSg+YrVDAx8p6nE6QBvA0H1DyvvkpNVx
         fD07TDvSVm/QGM+97xmZirGYtuXRo4tKQorudAKSoovasAJepiTlCy/Aw6OSBa+nl0aN
         4TAjXIuA9vDaHl4Adp2LEaCgW1U+pbLAiHbdpzFzRL2I5aSdNDvJro/+gj2FusL9Y/Xj
         zLOA==
X-Forwarded-Encrypted: i=1; AJvYcCUSKR++FDcivWto0BYD4s9H7oLdT6xYr5xfwRLDInAeyWTc+507hMgFXmzgBwZMS12uvQzdesQUxLPR5ow=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYa8JLvAL0EduxMG/YhCwK/DqtdqNIaWsxgUO/yh0B2ON37e+W
	jWwDHUAVhj7WNCi4knDWwb3ong2onYv7fJXrEzb+qOkrGFXj79SdnC17HnErKQ==
X-Gm-Gg: ASbGncv9yYdOew0ATkmrg3hNSVlthquaMhW38L/fMi4hmE49nampEzLbmGGvEix63fP
	Ql1ucN0bkhnEIblyIH1/pOM9KxhB1rDdlrl2kNgRUwgiwfJ6yIC5mzjFUa6JnZggrD/tAuDc0ps
	/OJOh3emv3RlIFDEuejHXDyp4Ahbp8ngOPSPiiAo8Yg/Oa6KIymeQpZ6icZGatbGfqRAQSFyVCZ
	Q3yBiWrV61iawuiI2uHzXg+Arf5na8oC3Oo9DLstlOVJbMMyrdDZzNoKeOL622VRqiP+CkmiLPn
	QgijDq7P8JfCaIBOd4H/YPo3lSiQpKrDcFx6EsbGhhJI8CAj1qApajZDsKyF4vR4ddnE0w==
X-Google-Smtp-Source: AGHT+IGzxgKY4oRrN3kg0KvYeYGnTZCcfiHd8Yeu2SNTcwdxoN/9aBTg+QD8HzFianQMbmpb40NBpg==
X-Received: by 2002:a17:903:190d:b0:223:669f:ca2d with SMTP id d9443c01a7336-231981453e0mr102895825ad.35.1747294720320;
        Thu, 15 May 2025 00:38:40 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:c43a:aaea:5f52:5763])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271f61sm109750825ad.142.2025.05.15.00.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 00:38:39 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Darren Ye <darren.ye@mediatek.com>
Subject: [PATCH v2 3/3] ASoC: mediatek: mt8183-afe-pcm: shorten mt8183_is_volatile_reg()
Date: Thu, 15 May 2025 15:38:23 +0800
Message-ID: <20250515073825.4155297-4-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.1045.g170613ef41-goog
In-Reply-To: <20250515073825.4155297-1-wenst@chromium.org>
References: <20250515073825.4155297-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mt8183_is_volatile_reg() is a large switch-case block that lists out
every register that is volatile. Since many pairs of registers have
consecutive addresses, the cases can be compressed down with the
ellipsis, i.e. GCC extension "case ranges" [1] to cover more addresses
in one case, shortening the source code.

This is not completely the same, since the addresses are 4-byte aligned,
and using the case ranges feature adds all unaligned addresses in
between. In practice this doesn't matter since the unaligned addresses
are blocked by the regmap core. This also ends up compiling slightly
smaller with a reduction of 128 bytes in the text section.

[1] https://gcc.gnu.org/onlinedocs/gcc/Case-Ranges.html

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 152 ++++++---------------
 1 file changed, 40 insertions(+), 112 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index fe315224a259..e8884354995c 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -522,86 +522,46 @@ static bool mt8183_is_volatile_reg(struct device *dev, unsigned int reg)
 	/* these auto-gen reg has read-only bit, so put it as volatile */
 	/* volatile reg cannot be cached, so cannot be set when power off */
 	switch (reg) {
-	case AUDIO_TOP_CON0:	/* reg bit controlled by CCF */
-	case AUDIO_TOP_CON1:	/* reg bit controlled by CCF */
+	case AUDIO_TOP_CON0 ... AUDIO_TOP_CON1:	/* reg bit controlled by CCF */
 	case AUDIO_TOP_CON3:
-	case AFE_DL1_CUR:
-	case AFE_DL1_END:
-	case AFE_DL2_CUR:
-	case AFE_DL2_END:
-	case AFE_AWB_END:
-	case AFE_AWB_CUR:
-	case AFE_VUL_END:
-	case AFE_VUL_CUR:
-	case AFE_MEMIF_MON0:
-	case AFE_MEMIF_MON1:
-	case AFE_MEMIF_MON2:
-	case AFE_MEMIF_MON3:
-	case AFE_MEMIF_MON4:
-	case AFE_MEMIF_MON5:
-	case AFE_MEMIF_MON6:
-	case AFE_MEMIF_MON7:
-	case AFE_MEMIF_MON8:
-	case AFE_MEMIF_MON9:
-	case AFE_ADDA_SRC_DEBUG_MON0:
-	case AFE_ADDA_SRC_DEBUG_MON1:
-	case AFE_ADDA_UL_SRC_MON0:
-	case AFE_ADDA_UL_SRC_MON1:
+	case AFE_DL1_CUR ... AFE_DL1_END:
+	case AFE_DL2_CUR ... AFE_DL2_END:
+	case AFE_AWB_END ... AFE_AWB_CUR:
+	case AFE_VUL_END ... AFE_VUL_CUR:
+	case AFE_MEMIF_MON0 ... AFE_MEMIF_MON9:
+	case AFE_ADDA_SRC_DEBUG_MON0 ... AFE_ADDA_SRC_DEBUG_MON1:
+	case AFE_ADDA_UL_SRC_MON0 ... AFE_ADDA_UL_SRC_MON1:
 	case AFE_SIDETONE_MON:
-	case AFE_SIDETONE_CON0:
-	case AFE_SIDETONE_COEFF:
+	case AFE_SIDETONE_CON0 ... AFE_SIDETONE_COEFF:
 	case AFE_BUS_MON0:
-	case AFE_MRGIF_MON0:
-	case AFE_MRGIF_MON1:
-	case AFE_MRGIF_MON2:
-	case AFE_I2S_MON:
+	case AFE_MRGIF_MON0 ... AFE_I2S_MON:
 	case AFE_DAC_MON:
-	case AFE_VUL2_END:
-	case AFE_VUL2_CUR:
-	case AFE_IRQ0_MCU_CNT_MON:
-	case AFE_IRQ6_MCU_CNT_MON:
-	case AFE_MOD_DAI_END:
-	case AFE_MOD_DAI_CUR:
-	case AFE_VUL_D2_END:
-	case AFE_VUL_D2_CUR:
-	case AFE_DL3_CUR:
-	case AFE_DL3_END:
+	case AFE_VUL2_END ... AFE_VUL2_CUR:
+	case AFE_IRQ0_MCU_CNT_MON ... AFE_IRQ6_MCU_CNT_MON:
+	case AFE_MOD_DAI_END ... AFE_MOD_DAI_CUR:
+	case AFE_VUL_D2_END ... AFE_VUL_D2_CUR:
+	case AFE_DL3_CUR ... AFE_DL3_END:
 	case AFE_HDMI_OUT_CON0:
-	case AFE_HDMI_OUT_CUR:
-	case AFE_HDMI_OUT_END:
-	case AFE_IRQ3_MCU_CNT_MON:
-	case AFE_IRQ4_MCU_CNT_MON:
-	case AFE_IRQ_MCU_STATUS:
-	case AFE_IRQ_MCU_CLR:
+	case AFE_HDMI_OUT_CUR ... AFE_HDMI_OUT_END:
+	case AFE_IRQ3_MCU_CNT_MON... AFE_IRQ4_MCU_CNT_MON:
+	case AFE_IRQ_MCU_STATUS ... AFE_IRQ_MCU_CLR:
 	case AFE_IRQ_MCU_MON2:
-	case AFE_IRQ1_MCU_CNT_MON:
-	case AFE_IRQ2_MCU_CNT_MON:
-	case AFE_IRQ1_MCU_EN_CNT_MON:
-	case AFE_IRQ5_MCU_CNT_MON:
+	case AFE_IRQ1_MCU_CNT_MON ... AFE_IRQ5_MCU_CNT_MON:
 	case AFE_IRQ7_MCU_CNT_MON:
 	case AFE_GAIN1_CUR:
 	case AFE_GAIN2_CUR:
 	case AFE_SRAM_DELSEL_CON0:
-	case AFE_SRAM_DELSEL_CON2:
-	case AFE_SRAM_DELSEL_CON3:
-	case AFE_ASRC_2CH_CON12:
-	case AFE_ASRC_2CH_CON13:
+	case AFE_SRAM_DELSEL_CON2 ... AFE_SRAM_DELSEL_CON3:
+	case AFE_ASRC_2CH_CON12 ... AFE_ASRC_2CH_CON13:
 	case PCM_INTF_CON2:
-	case FPGA_CFG0:
-	case FPGA_CFG1:
-	case FPGA_CFG2:
-	case FPGA_CFG3:
-	case AUDIO_TOP_DBG_MON0:
-	case AUDIO_TOP_DBG_MON1:
-	case AFE_IRQ8_MCU_CNT_MON:
-	case AFE_IRQ11_MCU_CNT_MON:
-	case AFE_IRQ12_MCU_CNT_MON:
+	case FPGA_CFG0 ... FPGA_CFG1:
+	case FPGA_CFG2 ... FPGA_CFG3:
+	case AUDIO_TOP_DBG_MON0 ... AUDIO_TOP_DBG_MON1:
+	case AFE_IRQ8_MCU_CNT_MON ... AFE_IRQ12_MCU_CNT_MON:
 	case AFE_CBIP_MON0:
-	case AFE_CBIP_SLV_MUX_MON0:
-	case AFE_CBIP_SLV_DECODER_MON0:
+	case AFE_CBIP_SLV_MUX_MON0 ... AFE_CBIP_SLV_DECODER_MON0:
 	case AFE_ADDA6_SRC_DEBUG_MON0:
-	case AFE_ADD6A_UL_SRC_MON0:
-	case AFE_ADDA6_UL_SRC_MON1:
+	case AFE_ADD6A_UL_SRC_MON0... AFE_ADDA6_UL_SRC_MON1:
 	case AFE_DL1_CUR_MSB:
 	case AFE_DL2_CUR_MSB:
 	case AFE_AWB_CUR_MSB:
@@ -611,55 +571,23 @@ static bool mt8183_is_volatile_reg(struct device *dev, unsigned int reg)
 	case AFE_VUL_D2_CUR_MSB:
 	case AFE_DL3_CUR_MSB:
 	case AFE_HDMI_OUT_CUR_MSB:
-	case AFE_AWB2_END:
-	case AFE_AWB2_CUR:
+	case AFE_AWB2_END ... AFE_AWB2_CUR:
 	case AFE_AWB2_CUR_MSB:
-	case AFE_ADDA_DL_SDM_FIFO_MON:
-	case AFE_ADDA_DL_SRC_LCH_MON:
-	case AFE_ADDA_DL_SRC_RCH_MON:
-	case AFE_ADDA_DL_SDM_OUT_MON:
-	case AFE_CONNSYS_I2S_MON:
-	case AFE_ASRC_2CH_CON0:
-	case AFE_ASRC_2CH_CON2:
-	case AFE_ASRC_2CH_CON3:
-	case AFE_ASRC_2CH_CON4:
-	case AFE_ASRC_2CH_CON5:
-	case AFE_ASRC_2CH_CON7:
-	case AFE_ASRC_2CH_CON8:
-	case AFE_MEMIF_MON12:
-	case AFE_MEMIF_MON13:
-	case AFE_MEMIF_MON14:
-	case AFE_MEMIF_MON15:
-	case AFE_MEMIF_MON16:
-	case AFE_MEMIF_MON17:
-	case AFE_MEMIF_MON18:
-	case AFE_MEMIF_MON19:
-	case AFE_MEMIF_MON20:
-	case AFE_MEMIF_MON21:
-	case AFE_MEMIF_MON22:
-	case AFE_MEMIF_MON23:
-	case AFE_MEMIF_MON24:
-	case AFE_ADDA_MTKAIF_MON0:
-	case AFE_ADDA_MTKAIF_MON1:
+	case AFE_ADDA_DL_SDM_FIFO_MON ... AFE_ADDA_DL_SDM_OUT_MON:
+	case AFE_CONNSYS_I2S_MON ... AFE_ASRC_2CH_CON0:
+	case AFE_ASRC_2CH_CON2 ... AFE_ASRC_2CH_CON5:
+	case AFE_ASRC_2CH_CON7 ... AFE_ASRC_2CH_CON8:
+	case AFE_MEMIF_MON12 ... AFE_MEMIF_MON24:
+	case AFE_ADDA_MTKAIF_MON0 ... AFE_ADDA_MTKAIF_MON1:
 	case AFE_AUD_PAD_TOP:
 	case AFE_GENERAL1_ASRC_2CH_CON0:
-	case AFE_GENERAL1_ASRC_2CH_CON2:
-	case AFE_GENERAL1_ASRC_2CH_CON3:
-	case AFE_GENERAL1_ASRC_2CH_CON4:
-	case AFE_GENERAL1_ASRC_2CH_CON5:
-	case AFE_GENERAL1_ASRC_2CH_CON7:
-	case AFE_GENERAL1_ASRC_2CH_CON8:
-	case AFE_GENERAL1_ASRC_2CH_CON12:
-	case AFE_GENERAL1_ASRC_2CH_CON13:
+	case AFE_GENERAL1_ASRC_2CH_CON2 ... AFE_GENERAL1_ASRC_2CH_CON5:
+	case AFE_GENERAL1_ASRC_2CH_CON7 ... AFE_GENERAL1_ASRC_2CH_CON8:
+	case AFE_GENERAL1_ASRC_2CH_CON12 ... AFE_GENERAL1_ASRC_2CH_CON13:
 	case AFE_GENERAL2_ASRC_2CH_CON0:
-	case AFE_GENERAL2_ASRC_2CH_CON2:
-	case AFE_GENERAL2_ASRC_2CH_CON3:
-	case AFE_GENERAL2_ASRC_2CH_CON4:
-	case AFE_GENERAL2_ASRC_2CH_CON5:
-	case AFE_GENERAL2_ASRC_2CH_CON7:
-	case AFE_GENERAL2_ASRC_2CH_CON8:
-	case AFE_GENERAL2_ASRC_2CH_CON12:
-	case AFE_GENERAL2_ASRC_2CH_CON13:
+	case AFE_GENERAL2_ASRC_2CH_CON2 ... AFE_GENERAL2_ASRC_2CH_CON5:
+	case AFE_GENERAL2_ASRC_2CH_CON7 ... AFE_GENERAL2_ASRC_2CH_CON8:
+	case AFE_GENERAL2_ASRC_2CH_CON12 ... AFE_GENERAL2_ASRC_2CH_CON13:
 		return true;
 	default:
 		return false;
-- 
2.49.0.1045.g170613ef41-goog

