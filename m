Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D811DD0F2;
	Sun, 20 Apr 2025 23:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745191664; cv=none; b=jgw+nJeaaILgzUbIXAV8Lgv6CMV0OJWP+xSbeWuFA6N7nUh74ZAjGaG8e4Fu8x5dF3oO2z+TtMsl5P9Kf1++VJHEd4enMMo2ugXkS1ofMJUtj32l4X/MKI5YXp/w5j+xri+EhqzSAVIoJCcSJWD2x0XrbUGVozy94RUHuAueS3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745191664; c=relaxed/simple;
	bh=aLrT+Ui+faChf8Zuy/64i/Seqf6twImS6GoSOCadXqA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GYnS781Wbjw/+Z59+LllTUaeVQlNmdrjAd60oqTzsGSx9Cgf+XahkF4UmUz1C4S4BFZJid5zzDTWe95NpAXnMSclBXhC/NaEUGZeLVsDQcomm6tyJNAJo+S57rgxWI+ypMNBEbJH421hACH+LzdcotHqpCw6sLht6JEVzqweKr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=WhGBGfCa; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="WhGBGfCa"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=WXKIlxFCERVyzYNMkGoSWDr/fiBxpxoP3/WtJFnoIlg=; b=WhGBGfCaDTfmfrNc
	Q20w8ure+y8nylGAlM8M2FbzcP5E8secRFNFVAUuHy6/7WEnnYYzlrBtpTD0+w2ooaIreCJEubv8v
	tSbLmcXmrF7cZDNNjLUmvG5T9Y63czjibnEaLv7rNJKlrttrc87KfbT4TnofYw8rgk1q18jPYuSfy
	Ei0rJLYrtmHeqnvrvbpnOAFYChY9cRhex9nUJEyGLPUMBtzkvSAUQIo2XdXG0o8KEu39WRvscWgzT
	pqR35rC+WyB+Zbj8a/SPREagjeF66GSUs6a7k3/YJMOan+GmKqd6J3Cjp5MI6pAJYezyXaACsDjZ6
	PLni3QDaW4exMYMncg==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1u6e4U-00CkbO-12;
	Sun, 20 Apr 2025 23:27:34 +0000
From: linux@treblig.org
To: oder_chiou@realtek.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] ASoC: codecs: Remove unused rt566[58]_sel_asrc_clk_src
Date: Mon, 21 Apr 2025 00:27:33 +0100
Message-ID: <20250420232733.182802-1-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

rt5665_sel_asrc_clk_src() was added in 2016 by
commit 33ada14a26c8 ("ASoC: add rt5665 codec driver")

rt5668_sel_asrc_clk_src() was added in 2018 by
commit d59fb2856223 ("ASoC: rt5668: add rt5668B codec driver")

Neither have been used.

Remove them.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 sound/soc/codecs/rt5665.c | 96 ---------------------------------------
 sound/soc/codecs/rt5665.h |  3 --
 sound/soc/codecs/rt5668.c | 43 ------------------
 sound/soc/codecs/rt5668.h |  3 --
 4 files changed, 145 deletions(-)

diff --git a/sound/soc/codecs/rt5665.c b/sound/soc/codecs/rt5665.c
index bcb6d7c6f301..b16b2c66e754 100644
--- a/sound/soc/codecs/rt5665.c
+++ b/sound/soc/codecs/rt5665.c
@@ -1022,102 +1022,6 @@ static int rt5665_mono_vol_put(struct snd_kcontrol *kcontrol,
 	return ret;
 }
 
-/**
- * rt5665_sel_asrc_clk_src - select ASRC clock source for a set of filters
- * @component: SoC audio component device.
- * @filter_mask: mask of filters.
- * @clk_src: clock source
- *
- * The ASRC function is for asynchronous MCLK and LRCK. Also, since RT5665 can
- * only support standard 32fs or 64fs i2s format, ASRC should be enabled to
- * support special i2s clock format such as Intel's 100fs(100 * sampling rate).
- * ASRC function will track i2s clock and generate a corresponding system clock
- * for codec. This function provides an API to select the clock source for a
- * set of filters specified by the mask. And the codec driver will turn on ASRC
- * for these filters if ASRC is selected as their clock source.
- */
-int rt5665_sel_asrc_clk_src(struct snd_soc_component *component,
-		unsigned int filter_mask, unsigned int clk_src)
-{
-	unsigned int asrc2_mask = 0;
-	unsigned int asrc2_value = 0;
-	unsigned int asrc3_mask = 0;
-	unsigned int asrc3_value = 0;
-
-	switch (clk_src) {
-	case RT5665_CLK_SEL_SYS:
-	case RT5665_CLK_SEL_I2S1_ASRC:
-	case RT5665_CLK_SEL_I2S2_ASRC:
-	case RT5665_CLK_SEL_I2S3_ASRC:
-	case RT5665_CLK_SEL_SYS2:
-	case RT5665_CLK_SEL_SYS3:
-	case RT5665_CLK_SEL_SYS4:
-		break;
-
-	default:
-		return -EINVAL;
-	}
-
-	if (filter_mask & RT5665_DA_STEREO1_FILTER) {
-		asrc2_mask |= RT5665_DA_STO1_CLK_SEL_MASK;
-		asrc2_value = (asrc2_value & ~RT5665_DA_STO1_CLK_SEL_MASK)
-			| (clk_src << RT5665_DA_STO1_CLK_SEL_SFT);
-	}
-
-	if (filter_mask & RT5665_DA_STEREO2_FILTER) {
-		asrc2_mask |= RT5665_DA_STO2_CLK_SEL_MASK;
-		asrc2_value = (asrc2_value & ~RT5665_DA_STO2_CLK_SEL_MASK)
-			| (clk_src << RT5665_DA_STO2_CLK_SEL_SFT);
-	}
-
-	if (filter_mask & RT5665_DA_MONO_L_FILTER) {
-		asrc2_mask |= RT5665_DA_MONOL_CLK_SEL_MASK;
-		asrc2_value = (asrc2_value & ~RT5665_DA_MONOL_CLK_SEL_MASK)
-			| (clk_src << RT5665_DA_MONOL_CLK_SEL_SFT);
-	}
-
-	if (filter_mask & RT5665_DA_MONO_R_FILTER) {
-		asrc2_mask |= RT5665_DA_MONOR_CLK_SEL_MASK;
-		asrc2_value = (asrc2_value & ~RT5665_DA_MONOR_CLK_SEL_MASK)
-			| (clk_src << RT5665_DA_MONOR_CLK_SEL_SFT);
-	}
-
-	if (filter_mask & RT5665_AD_STEREO1_FILTER) {
-		asrc3_mask |= RT5665_AD_STO1_CLK_SEL_MASK;
-		asrc3_value = (asrc2_value & ~RT5665_AD_STO1_CLK_SEL_MASK)
-			| (clk_src << RT5665_AD_STO1_CLK_SEL_SFT);
-	}
-
-	if (filter_mask & RT5665_AD_STEREO2_FILTER) {
-		asrc3_mask |= RT5665_AD_STO2_CLK_SEL_MASK;
-		asrc3_value = (asrc2_value & ~RT5665_AD_STO2_CLK_SEL_MASK)
-			| (clk_src << RT5665_AD_STO2_CLK_SEL_SFT);
-	}
-
-	if (filter_mask & RT5665_AD_MONO_L_FILTER) {
-		asrc3_mask |= RT5665_AD_MONOL_CLK_SEL_MASK;
-		asrc3_value = (asrc3_value & ~RT5665_AD_MONOL_CLK_SEL_MASK)
-			| (clk_src << RT5665_AD_MONOL_CLK_SEL_SFT);
-	}
-
-	if (filter_mask & RT5665_AD_MONO_R_FILTER)  {
-		asrc3_mask |= RT5665_AD_MONOR_CLK_SEL_MASK;
-		asrc3_value = (asrc3_value & ~RT5665_AD_MONOR_CLK_SEL_MASK)
-			| (clk_src << RT5665_AD_MONOR_CLK_SEL_SFT);
-	}
-
-	if (asrc2_mask)
-		snd_soc_component_update_bits(component, RT5665_ASRC_2,
-			asrc2_mask, asrc2_value);
-
-	if (asrc3_mask)
-		snd_soc_component_update_bits(component, RT5665_ASRC_3,
-			asrc3_mask, asrc3_value);
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(rt5665_sel_asrc_clk_src);
-
 static int rt5665_button_detect(struct snd_soc_component *component)
 {
 	int btn_type, val;
diff --git a/sound/soc/codecs/rt5665.h b/sound/soc/codecs/rt5665.h
index 12ab28e5f10d..089e4078d37a 100644
--- a/sound/soc/codecs/rt5665.h
+++ b/sound/soc/codecs/rt5665.h
@@ -1999,7 +1999,4 @@ enum {
 	RT5665_CLK_SEL_SYS4,
 };
 
-int rt5665_sel_asrc_clk_src(struct snd_soc_component *component,
-		unsigned int filter_mask, unsigned int clk_src);
-
 #endif /* __RT5665_H__ */
diff --git a/sound/soc/codecs/rt5668.c b/sound/soc/codecs/rt5668.c
index f626453f332b..8442dd09cfaf 100644
--- a/sound/soc/codecs/rt5668.c
+++ b/sound/soc/codecs/rt5668.c
@@ -799,49 +799,6 @@ static void rt5668_reset(struct regmap *regmap)
 	regmap_write(regmap, RT5668_RESET, 0);
 	regmap_write(regmap, RT5668_I2C_MODE, 1);
 }
-/**
- * rt5668_sel_asrc_clk_src - select ASRC clock source for a set of filters
- * @component: SoC audio component device.
- * @filter_mask: mask of filters.
- * @clk_src: clock source
- *
- * The ASRC function is for asynchronous MCLK and LRCK. Also, since RT5668 can
- * only support standard 32fs or 64fs i2s format, ASRC should be enabled to
- * support special i2s clock format such as Intel's 100fs(100 * sampling rate).
- * ASRC function will track i2s clock and generate a corresponding system clock
- * for codec. This function provides an API to select the clock source for a
- * set of filters specified by the mask. And the component driver will turn on
- * ASRC for these filters if ASRC is selected as their clock source.
- */
-int rt5668_sel_asrc_clk_src(struct snd_soc_component *component,
-		unsigned int filter_mask, unsigned int clk_src)
-{
-
-	switch (clk_src) {
-	case RT5668_CLK_SEL_SYS:
-	case RT5668_CLK_SEL_I2S1_ASRC:
-	case RT5668_CLK_SEL_I2S2_ASRC:
-		break;
-
-	default:
-		return -EINVAL;
-	}
-
-	if (filter_mask & RT5668_DA_STEREO1_FILTER) {
-		snd_soc_component_update_bits(component, RT5668_PLL_TRACK_2,
-			RT5668_FILTER_CLK_SEL_MASK,
-			clk_src << RT5668_FILTER_CLK_SEL_SFT);
-	}
-
-	if (filter_mask & RT5668_AD_STEREO1_FILTER) {
-		snd_soc_component_update_bits(component, RT5668_PLL_TRACK_3,
-			RT5668_FILTER_CLK_SEL_MASK,
-			clk_src << RT5668_FILTER_CLK_SEL_SFT);
-	}
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(rt5668_sel_asrc_clk_src);
 
 static int rt5668_button_detect(struct snd_soc_component *component)
 {
diff --git a/sound/soc/codecs/rt5668.h b/sound/soc/codecs/rt5668.h
index 6b851ddcc58a..b34a61d2109c 100644
--- a/sound/soc/codecs/rt5668.h
+++ b/sound/soc/codecs/rt5668.h
@@ -1309,7 +1309,4 @@ enum {
 	RT5668_CLK_SEL_I2S2_ASRC,
 };
 
-int rt5668_sel_asrc_clk_src(struct snd_soc_component *component,
-		unsigned int filter_mask, unsigned int clk_src);
-
 #endif /* __RT5668_H__ */
-- 
2.49.0

