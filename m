Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A282B1DFD95
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 15:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739199704; cv=none; b=N9hxhEtMOpHjaYV5SBuDWQj2LusvlXEba4UrslLZe+llkZwVM/Yc8ftIqQngSNpnLRfKGw690WhRIxMiMhef2C8bsQ28gDUwMiSd1s80N97b31upa5OnoDA12X7uenEC9DQBzLu4N8ux03Lsmbv9c14NKK91O+WsFhrmsxKTFag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739199704; c=relaxed/simple;
	bh=JHSdrOB1847/diwCu0IhOhb7TlH5udaxU1UYwzwnahw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PmG8VUAJBoF4+k/dKfbR77q5WjCQSrHbqKQmkzdBILVzAnJRK+XSHWU2WS92Y09myr1HeitBK3Kie3lpbnxYNjGTbO0WBSa+VFdLqD9bVepxoqqeuvqxsUcsP4aX9sFMUnbgSWdANUt/+hzIgOFGdi/P+Xf6rLLUQVh8zkfEAoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=i309+eWr; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="i309+eWr"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ab7c6fc35b3so149506466b.2
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 07:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739199698; x=1739804498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IVD5Ahyv/b3Ko22+0ZGNasjR9VpgBzuxVGD+jcQGn9E=;
        b=i309+eWrVlHf3+vGEwcy9SmMAkPR6gdsOUMeoa6i+N+5TrECHz7avXBCUL1uFaiEWF
         CFFK+Nc2sJ+mSvPUT1jfjN/OIRkbibktz8e5DFEXWqwWkcoAZ6jlr5vDUx3pEKAaC4Oq
         1P/c+9i8hGFeANHV1UaqyfPC7/2rn9bhX80AGU06nJA2h58iwiIjIfKVcffTiE5qiNvw
         S6PyhWzQ9H2AsMQHIhtBfbElNUEPx6Qht11umrgTbE+N78X8YsI7je3CRVuh3ciGWeiT
         3HHvfjoULmEIGbsIXjdH1T/zvDFUFNm8l55CIb1rPtl7zCCWIWeb01cX1fUyU90dcuH+
         058A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739199698; x=1739804498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IVD5Ahyv/b3Ko22+0ZGNasjR9VpgBzuxVGD+jcQGn9E=;
        b=hRy7Ic2pasnX01HXt1xuvkyqrEWOKIi42QQJKbIWvtzCEn+ugYSInAfwz886S2CS8C
         3u9alQ4AhobuOU6Ilpr4MI7lIa38psl+Uz+Aywv5GyUaAekwRYfmYOq7Jjc9LErUQnAQ
         qQZr69UYj0tVtCeCxe9WZOXO/x71TpqyrAoTiqH1yeIHMVU0iYX3SG0/yLxhNn89Qz12
         dVlk4vG4CMHVbYh/nci+s9rj2EJ0FWqglem7fHnjgFLsIzCQhhGQssbN69uW5rEVf0UC
         cbs7JY2Z4eh7hueJhk/IOA70iSz4+cKC/347H0sDFslWxFHRgfO/EZVMfLwQT3depMpb
         32kQ==
X-Gm-Message-State: AOJu0YwCEtjOI2OR1EGogH0iad2+e3PsH9QezTSwZz/znrqYSHnLvb62
	YByGqlIbRgpBlH4+MsvvK85qyoGPysp2G6ipkh3lRbBpy4ozbIf+mDJLb1DWOHo=
X-Gm-Gg: ASbGncs95H3gGshqBP7JA8HODeyJPAS43MQRrt72uqx+cyHz5SUubPRGtCs7EmyJ3IJ
	VmXT4AyxfU7hQ+KmTajjRcPEHqf2owi31XuSwb4Z0LRCMGsf++ppecRFcK7CTN1Vuq/8O2zAFuS
	VsVdRanVkY85PSUVGoaNUVGROwN/Gl7NXog3GsJgGxjjeuZALCCAx5YbiaBJJ9h4i+7Zi9LUfaO
	/Y2ysEtxX/yH44TS3Sr6T5MRhgoO1SflrJ254El2qgHMP0uOb6ykaU49CbwoN5DamMJ1kFTAYYi
	5HERxKu2tJPw83gufr29BkAo2Goe
X-Google-Smtp-Source: AGHT+IFOHn3m4ICp9bqFmWrQqHtCVAGtZ0JqR6Zgx3LJqCU/fvhBcOVOBrgQkgqRXXGPCL413lvStg==
X-Received: by 2002:a17:907:1c9c:b0:aab:ee4a:6788 with SMTP id a640c23a62f3a-ab789c52c06mr1656549266b.57.1739199697949;
        Mon, 10 Feb 2025 07:01:37 -0800 (PST)
Received: from localhost.localdomain ([151.41.218.186])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7bec717f7sm250400466b.81.2025.02.10.07.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 07:01:37 -0800 (PST)
From: Valerio Setti <vsetti@baylibre.com>
To: jbrunet@baylibre.com,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-amlogic@lists.infradead.org,
	linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Valerio Setti <vsetti@baylibre.com>
Subject: [PATCH RFC 3/6] ASoC: meson: add AUDIN driver
Date: Mon, 10 Feb 2025 16:01:26 +0100
Message-Id: <20250210150129.40248-4-vsetti@baylibre.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250210150129.40248-1-vsetti@baylibre.com>
References: <20250210150129.40248-1-vsetti@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the AUDIN driver which provides audio input capabilities
to the Amlogic GXBB platform. As of now it is composed by:
- I2S decoder which receives I2S audio samples from some external codec;
- toddr module which transfers collected audio samples to an internal
  FIFO first and then to RAM.

I2S is the only supported audio source as of now, but others are possible
and can be added in the future.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/Kconfig             |   6 +
 sound/soc/meson/Makefile            |   4 +
 sound/soc/meson/aiu-encoder-i2s.c   |   2 +-
 sound/soc/meson/audin-decoder-i2s.c | 247 +++++++++++++++++
 sound/soc/meson/audin-toddr.c       | 403 ++++++++++++++++++++++++++++
 sound/soc/meson/audin.c             | 321 ++++++++++++++++++++++
 sound/soc/meson/audin.h             | 119 ++++++++
 7 files changed, 1101 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/meson/audin-decoder-i2s.c
 create mode 100644 sound/soc/meson/audin-toddr.c
 create mode 100644 sound/soc/meson/audin.c
 create mode 100644 sound/soc/meson/audin.h

diff --git a/sound/soc/meson/Kconfig b/sound/soc/meson/Kconfig
index 6458d5dc4902..3a86c6be08aa 100644
--- a/sound/soc/meson/Kconfig
+++ b/sound/soc/meson/Kconfig
@@ -12,6 +12,12 @@ config SND_MESON_AIU
 	  Select Y or M to add support for the Audio output subsystem found
 	  in the Amlogic Meson8, Meson8b and GX SoC families
 
+config SND_MESON_AUDIN
+	tristate "Amlogic AUDIN"
+	help
+	  Select Y or M to add support for the Audio input subsystem found
+	  in the Amlogic GXBB SoC family.
+
 config SND_MESON_AXG_FIFO
 	tristate
 	select REGMAP_MMIO
diff --git a/sound/soc/meson/Makefile b/sound/soc/meson/Makefile
index af75f386feda..e4869af72811 100644
--- a/sound/soc/meson/Makefile
+++ b/sound/soc/meson/Makefile
@@ -9,6 +9,9 @@ snd-soc-meson-aiu-y += aiu-encoder-spdif.o
 snd-soc-meson-aiu-y += aiu-fifo.o
 snd-soc-meson-aiu-y += aiu-fifo-i2s.o
 snd-soc-meson-aiu-y += aiu-fifo-spdif.o
+snd-soc-meson-audin-y := audin.o
+snd-soc-meson-audin-y += audin-toddr.o
+snd-soc-meson-audin-y += audin-decoder-i2s.o
 snd-soc-meson-axg-fifo-y := axg-fifo.o
 snd-soc-meson-axg-frddr-y := axg-frddr.o
 snd-soc-meson-axg-toddr-y := axg-toddr.o
@@ -28,6 +31,7 @@ snd-soc-meson-g12a-tohdmitx-y := g12a-tohdmitx.o
 snd-soc-meson-t9015-y := t9015.o
 
 obj-$(CONFIG_SND_MESON_AIU) += snd-soc-meson-aiu.o
+obj-$(CONFIG_SND_MESON_AUDIN) += snd-soc-meson-audin.o
 obj-$(CONFIG_SND_MESON_AXG_FIFO) += snd-soc-meson-axg-fifo.o
 obj-$(CONFIG_SND_MESON_AXG_FRDDR) += snd-soc-meson-axg-frddr.o
 obj-$(CONFIG_SND_MESON_AXG_TODDR) += snd-soc-meson-axg-toddr.o
diff --git a/sound/soc/meson/aiu-encoder-i2s.c b/sound/soc/meson/aiu-encoder-i2s.c
index d469ff429177..b4d5311eb3c5 100644
--- a/sound/soc/meson/aiu-encoder-i2s.c
+++ b/sound/soc/meson/aiu-encoder-i2s.c
@@ -240,7 +240,7 @@ static int aiu_encoder_i2s_hw_free(struct snd_pcm_substream *substream,
 	struct aiu *aiu = snd_soc_component_get_drvdata(dai->component);
 
 	clk_disable_unprepare(aiu->i2s_extra.clks[AOCLK_DIV_GATE].clk);
-	
+
 	return 0;
 }
 
diff --git a/sound/soc/meson/audin-decoder-i2s.c b/sound/soc/meson/audin-decoder-i2s.c
new file mode 100644
index 000000000000..a6c01399af0c
--- /dev/null
+++ b/sound/soc/meson/audin-decoder-i2s.c
@@ -0,0 +1,247 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (c) 2025 BayLibre, SAS.
+// Author: Valerio Setti <vsetti@baylibre.com>
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/soc-dai.h>
+
+#include "audin.h"
+
+static int audin_decoder_i2s_setup_desc(struct snd_pcm_hw_params *params,
+					struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	int val;
+
+	/* I2S decoder always outputs 24bits to the FIFO according to the
+	 * manual. The only thing we can do is mask some bits as follows:
+	 * - 0: 16 bit
+	 * - 1: 18 bits (not exposed as supported format)
+	 * - 2: 20 bits (not exposed as supported format)
+	 * - 3: 24 bits
+	 *
+	 * We force 24 bit output here and filter unnecessary ones at the FIFO
+	 * stage.
+	 * Note: data is left-justified, so in case of 16 bits samples, this
+	 *       means that the LSB is to be discarded at FIFO level and the
+	 *       relevant part is in bits [23:8].
+	 */
+	switch (params_width(params)) {
+	case 16:
+	case 24:
+		val = 3;
+		break;
+	default:
+		dev_err(dai->dev, "Error: wrong sample width %d",
+			params_physical_width(params));
+		return -EINVAL;
+	}
+	val = FIELD_PREP(AUDIN_I2SIN_CTRL_I2SIN_SIZE_MASK, val);
+	snd_soc_component_update_bits(component, AUDIN_I2SIN_CTRL,
+				      AUDIN_I2SIN_CTRL_I2SIN_SIZE_MASK, val);
+
+	/* The manual claims that this platform supports up to 4 streams
+	 * (8 channels), but only 1 stream (2 channels) is supported ATM.
+	 */
+	val = FIELD_PREP(AUDIN_I2SIN_CTRL_I2SIN_CHAN_EN_MASK, 1);
+	snd_soc_component_update_bits(component, AUDIN_I2SIN_CTRL,
+				      AUDIN_I2SIN_CTRL_I2SIN_CHAN_EN_MASK, val);
+
+	return 0;
+}
+
+static int audin_decoder_i2s_set_clocks(struct snd_soc_component *component,
+					struct snd_pcm_hw_params *params,
+					struct snd_soc_dai *dai)
+{
+	struct audin *audin = snd_soc_component_get_drvdata(component);
+	unsigned int sample_rate = params_rate(params);
+	unsigned long mclk;
+	int ret;
+
+	mclk = clk_get_rate(audin->bulk_clks[MCLK].clk);
+
+	/* Set mclk to bclk ratio.
+	 * We're going to use the new/finer clock divider (BCLK_MORE_DIV) for
+	 * this, so let's keep the legacy one (BCLK_DIV) as passthrough.
+	 */
+	ret = clk_set_rate(audin->aoclk_basic_div, mclk);
+	if (ret) {
+		dev_err(dai->dev, "Failed to set aoclk_basic_div %d\n", ret);
+		return ret;
+	}
+
+	/* We're going for a fixed bclk to lrclk ratio of 64. */
+	ret = clk_set_rate(audin->aoclk_more_div, sample_rate * 64UL);
+	if (ret) {
+		dev_err(dai->dev, "Failed to set aoclk_more_div %d\n", ret);
+		return ret;
+	}
+
+	ret = clk_set_rate(audin->lrclk_div, sample_rate);
+	if (ret) {
+		dev_err(dai->dev, "Failed to set lrclk_div %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int audin_decoder_i2s_hw_params(struct snd_pcm_substream *substream,
+				       struct snd_pcm_hw_params *params,
+				       struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct audin *audin = snd_soc_component_get_drvdata(component);
+	int ret;
+
+	ret = audin_decoder_i2s_setup_desc(params, dai);
+	if (ret) {
+		dev_err(dai->dev, "setting i2s desc failed\n");
+		return ret;
+	}
+
+	ret = audin_decoder_i2s_set_clocks(component, params, dai);
+	if (ret) {
+		dev_err(dai->dev, "setting i2s clocks failed\n");
+		return ret;
+	}
+
+	ret = clk_prepare_enable(audin->aoclk_div_gate);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int audin_decoder_i2s_hw_free(struct snd_pcm_substream *substream,
+				     struct snd_soc_dai *dai)
+{
+	struct audin *audin = snd_soc_component_get_drvdata(dai->component);
+
+	clk_disable_unprepare(audin->aoclk_div_gate);
+
+	return 0;
+}
+
+static int audin_decoder_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
+{
+	struct snd_soc_component *component = dai->component;
+	unsigned int val = 0;
+
+	/* Only CPU Master / Codec Slave supported ATM */
+	if ((fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) != SND_SOC_DAIFMT_BP_FP)
+		return -EINVAL;
+
+	/* Use clocks from AIU and not from the pads since we only want to
+	 * support master mode.
+	 */
+	val = AUDIN_I2SIN_CTRL_I2SIN_CLK_SEL |
+	      AUDIN_I2SIN_CTRL_I2SIN_LRCLK_SEL |
+	      AUDIN_I2SIN_CTRL_I2SIN_DIR;
+	snd_soc_component_update_bits(component, AUDIN_I2SIN_CTRL, val, val);
+
+	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
+	case SND_SOC_DAIFMT_IB_NF:
+		val = AUDIN_I2SIN_CTRL_I2SIN_POS_SYNC;
+		break;
+	case SND_SOC_DAIFMT_NB_NF:
+		val = 0;
+		break;
+	default:
+		dev_err(dai->dev, "Error: unsupported format %x", fmt);
+		return -EINVAL;
+	}
+	snd_soc_component_update_bits(component, AUDIN_I2SIN_CTRL,
+				      AUDIN_I2SIN_CTRL_I2SIN_POS_SYNC, val);
+
+	/* MSB data starts 1 clock cycle after LRCLK transition, as per I2S
+	 * specs.
+	 */
+	val = FIELD_PREP(AUDIN_I2SIN_CTRL_I2SIN_LRCLK_SKEW_MASK, 1);
+	snd_soc_component_update_bits(component, AUDIN_I2SIN_CTRL,
+				      AUDIN_I2SIN_CTRL_I2SIN_LRCLK_INV |
+				      AUDIN_I2SIN_CTRL_I2SIN_LRCLK_SKEW_MASK,
+				      val);
+
+	return 0;
+}
+
+static int audin_decoder_i2s_trigger(struct snd_pcm_substream *substream,
+				     int cmd, struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		snd_soc_component_update_bits(component, AUDIN_I2SIN_CTRL,
+					      AUDIN_I2SIN_CTRL_I2SIN_EN,
+					      AUDIN_I2SIN_CTRL_I2SIN_EN);
+		break;
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+	case SNDRV_PCM_TRIGGER_STOP:
+		snd_soc_component_update_bits(component, AUDIN_I2SIN_CTRL,
+					      AUDIN_I2SIN_CTRL_I2SIN_EN, 0);
+		break;
+	default:
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static int audin_decoder_i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id,
+					unsigned int freq, int dir)
+{
+	struct audin *audin = snd_soc_component_get_drvdata(dai->component);
+	int ret;
+
+	if (WARN_ON(clk_id != 0))
+		return -EINVAL;
+
+	if (dir == SND_SOC_CLOCK_IN)
+		return 0;
+
+	ret = clk_set_rate(audin->bulk_clks[MCLK].clk, freq);
+	if (ret)
+		dev_err(dai->dev, "Failed to set sysclk %d", ret);
+
+	return ret;
+}
+
+static int audin_decoder_i2s_startup(struct snd_pcm_substream *substream,
+				   struct snd_soc_dai *dai)
+{
+	struct audin *audin = snd_soc_component_get_drvdata(dai->component);
+	int ret;
+
+	ret = clk_bulk_prepare_enable(audin->bulk_clks_num, audin->bulk_clks);
+	if (ret)
+		dev_err(dai->dev, "Failed to enable bulk clocks %d\n", ret);
+
+	return ret;
+}
+
+static void audin_decoder_i2s_shutdown(struct snd_pcm_substream *substream,
+				     struct snd_soc_dai *dai)
+{
+	struct audin *audin = snd_soc_component_get_drvdata(dai->component);
+
+	clk_bulk_disable_unprepare(audin->bulk_clks_num, audin->bulk_clks);
+}
+
+const struct snd_soc_dai_ops audin_decoder_i2s_dai_ops = {
+	.hw_params	= audin_decoder_i2s_hw_params,
+	.hw_free	= audin_decoder_i2s_hw_free,
+	.set_fmt	= audin_decoder_i2s_set_fmt,
+	.set_sysclk	= audin_decoder_i2s_set_sysclk,
+	.startup	= audin_decoder_i2s_startup,
+	.shutdown	= audin_decoder_i2s_shutdown,
+	.trigger	= audin_decoder_i2s_trigger,
+};
diff --git a/sound/soc/meson/audin-toddr.c b/sound/soc/meson/audin-toddr.c
new file mode 100644
index 000000000000..14db8b9587e8
--- /dev/null
+++ b/sound/soc/meson/audin-toddr.c
@@ -0,0 +1,403 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (c) 2025 BayLibre, SAS.
+// Author: Valerio Setti <vsetti@baylibre.com>
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <sound/pcm_params.h>
+#include <linux/dma-mapping.h>
+#include <linux/hrtimer.h>
+#include <sound/soc.h>
+#include <sound/soc-dai.h>
+#include <dt-bindings/sound/meson-audin.h>
+
+#include "audin.h"
+
+struct fifo_regs {
+	unsigned int start;
+	unsigned int end;
+	unsigned int ptr;
+	unsigned int intr;
+	unsigned int rdptr;
+	unsigned int ctrl;
+	unsigned int ctrl1;
+	unsigned int wrap;
+};
+
+struct fifo_regs_bit_masks {
+	unsigned int overflow_en;
+	unsigned int addr_trigger_en;
+	unsigned int overflow_set;
+	unsigned int addr_trigger_set;
+};
+
+#define AUDIN_FIFO_COUNT	3
+
+struct fifo_regs audin_fifo_regs[AUDIN_FIFO_COUNT] = {
+	[0] = {
+		.start	= AUDIN_FIFO0_START,
+		.end	= AUDIN_FIFO0_END,
+		.ptr	= AUDIN_FIFO0_PTR,
+		.intr	= AUDIN_FIFO0_INTR,
+		.rdptr	= AUDIN_FIFO0_RDPTR,
+		.ctrl	= AUDIN_FIFO0_CTRL,
+		.ctrl1	= AUDIN_FIFO0_CTRL1,
+		.wrap	= AUDIN_FIFO0_WRAP,
+	},
+	[1] = {
+		.start	= AUDIN_FIFO1_START,
+		.end	= AUDIN_FIFO1_END,
+		.ptr	= AUDIN_FIFO1_PTR,
+		.intr	= AUDIN_FIFO1_INTR,
+		.rdptr	= AUDIN_FIFO1_RDPTR,
+		.ctrl	= AUDIN_FIFO1_CTRL,
+		.ctrl1	= AUDIN_FIFO1_CTRL1,
+		.wrap	= AUDIN_FIFO1_WRAP,
+	},
+	[2] = {
+		.start	= AUDIN_FIFO2_START,
+		.end	= AUDIN_FIFO2_END,
+		.ptr	= AUDIN_FIFO2_PTR,
+		.intr	= AUDIN_FIFO2_INTR,
+		.rdptr	= AUDIN_FIFO2_RDPTR,
+		.ctrl	= AUDIN_FIFO2_CTRL,
+		.ctrl1	= AUDIN_FIFO2_CTRL1,
+		.wrap	= AUDIN_FIFO2_WRAP,
+	}
+};
+
+struct fifo_regs_bit_masks audin_fifo_regs_bit_masks[AUDIN_FIFO_COUNT] = {
+	[0] = {
+		.overflow_en = AUDIN_INT_CTRL_FIFO0_OVERFLOW,
+		.addr_trigger_en = AUDIN_INT_CTRL_FIFO0_ADDR_TRIG,
+		.overflow_set = AUDIN_FIFO_INT_FIFO0_OVERFLOW,
+		.addr_trigger_set = AUDIN_FIFO_INT_FIFO0_ADDR_TRIG,
+	},
+	[1] = {
+		.overflow_en = AUDIN_INT_CTRL_FIFO1_OVERFLOW,
+		.addr_trigger_en = AUDIN_INT_CTRL_FIFO1_ADDR_TRIG,
+		.overflow_set = AUDIN_FIFO_INT_FIFO1_OVERFLOW,
+		.addr_trigger_set = AUDIN_FIFO_INT_FIFO1_ADDR_TRIG,
+	},
+	[2] = {
+		.overflow_en = AUDIN_INT_CTRL_FIFO2_OVERFLOW,
+		.addr_trigger_en = AUDIN_INT_CTRL_FIFO2_ADDR_TRIG,
+		.overflow_set = AUDIN_FIFO_INT_FIFO2_OVERFLOW,
+		.addr_trigger_set = AUDIN_FIFO_INT_FIFO2_ADDR_TRIG,
+	},
+
+};
+
+/* This is the size of the FIFO (i.e. 64*64 bytes). */
+#define AUDIN_FIFO_I2S_BLOCK		4096
+
+static struct snd_pcm_hardware toddr_pcm_hw = {
+	.info = (SNDRV_PCM_INFO_INTERLEAVED |
+		 SNDRV_PCM_INFO_MMAP |
+		 SNDRV_PCM_INFO_MMAP_VALID |
+		 SNDRV_PCM_INFO_PAUSE),
+	.formats = AUDIN_FORMATS,
+	.rate_min = 5512,
+	.rate_max = 192000,
+	.channels_min = 2,
+	.channels_max = 2,
+	.period_bytes_min = 2*AUDIN_FIFO_I2S_BLOCK,
+	.period_bytes_max = AUDIN_FIFO_I2S_BLOCK * USHRT_MAX,
+	.periods_min = 2,
+	.periods_max = UINT_MAX,
+
+	/* No real justification for this */
+	.buffer_bytes_max = 1 * 1024 * 1024,
+};
+
+struct audin_fifo {
+	const struct fifo_regs *reg;
+	const struct fifo_regs_bit_masks *reg_bit_masks;
+	struct snd_pcm_hardware *pcm_hw;
+	struct clk *pclk;
+
+	/* The AUDIN peripheral has an IRQ to signal when data is received, but
+	 * it cannot grant a periodic behavior. The reason is that the register
+	 * which holds the address which triggers the IRQ must be updated
+	 * continuously. Therefore we use a periodic timer.
+	 */
+	struct hrtimer polling_timer;
+	int poll_time_ns;
+	struct snd_pcm_substream *substream;
+};
+
+static int audin_toddr_trigger(struct snd_pcm_substream *substream, int cmd,
+				struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct audin_fifo *fifo = snd_soc_dai_dma_data_get_capture(dai);
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		snd_soc_component_update_bits(component, fifo->reg->ctrl,
+					      AUDIN_FIFO_CTRL_EN,
+					      AUDIN_FIFO_CTRL_EN);
+		break;
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+	case SNDRV_PCM_TRIGGER_STOP:
+		snd_soc_component_update_bits(component, fifo->reg->ctrl,
+					      AUDIN_FIFO_CTRL_EN, 0);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int audin_toddr_prepare(struct snd_pcm_substream *substream,
+			       struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct audin_fifo *fifo = snd_soc_dai_dma_data_get_capture(dai);
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	dma_addr_t dma_end = runtime->dma_addr + runtime->dma_bytes - 8;
+	unsigned int val;
+
+	/* Setup memory boundaries */
+	snd_soc_component_write(component, fifo->reg->start, runtime->dma_addr);
+	snd_soc_component_write(component, fifo->reg->ptr, runtime->dma_addr);
+	snd_soc_component_write(component, fifo->reg->end, dma_end);
+
+	/* Load new addresses */
+	val = AUDIN_FIFO_CTRL_LOAD | AUDIN_FIFO_CTRL_UG;
+	snd_soc_component_update_bits(component, fifo->reg->ctrl, val, val);
+
+	/* Reset */
+	snd_soc_component_update_bits(dai->component, fifo->reg->ctrl,
+				      AUDIN_FIFO_CTRL_RST,
+				      AUDIN_FIFO_CTRL_RST);
+
+	return 0;
+}
+
+static int audin_toddr_hw_params(struct snd_pcm_substream *substream,
+				 struct snd_pcm_hw_params *params,
+				 struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct audin_fifo *fifo = snd_soc_dai_dma_data_get_capture(dai);
+	unsigned int val;
+
+	switch (params_width(params)) {
+	case 16:
+		/* FIFO is filled line by line and each of them is 8 bytes. The
+		 * problem is that each line is filled starting from the end,
+		 * so we need to properly reorder them before moving to the
+		 * RAM. This is the value required to properly re-order 16 bits
+		 * samples.
+		 */
+		val = FIELD_PREP(AUDIN_FIFO_CTRL_ENDIAN_MASK, 6);
+		snd_soc_component_update_bits(component, fifo->reg->ctrl,
+					      AUDIN_FIFO_CTRL_ENDIAN_MASK, val);
+
+		/* The I2S input decoder passed 24 bits of left-justified data
+		 * but samples were 16 bits. Therefore we drop the LSB.
+		 */
+		val = FIELD_PREP(AUDIN_FIFO_CTRL1_DIN_POS_01_MASK, 1);
+		snd_soc_component_update_bits(component, fifo->reg->ctrl1,
+					      AUDIN_FIFO_CTRL1_DIN_POS_01_MASK,
+					      val);
+
+		/* Set sample size to 2 bytes (16 bit) */
+		val = FIELD_PREP(AUDIN_FIFO_CTRL1_DIN_BYTE_NUM_MASK, 1);
+		snd_soc_component_update_bits(component, fifo->reg->ctrl1,
+					      AUDIN_FIFO_CTRL1_DIN_BYTE_NUM_MASK,
+					      val);
+		break;
+	case 24:
+		/* The same as above but in this case we need to reorder 32 bits
+		 * samples (because 24 bits samples are stored as 32 bits).
+		 */
+		val = FIELD_PREP(AUDIN_FIFO_CTRL_ENDIAN_MASK, 4);
+		snd_soc_component_update_bits(component, fifo->reg->ctrl,
+					      AUDIN_FIFO_CTRL_ENDIAN_MASK,
+					      val);
+
+		val = FIELD_PREP(AUDIN_FIFO_CTRL1_DIN_POS_01_MASK, 0);
+		snd_soc_component_update_bits(component, fifo->reg->ctrl1,
+					      AUDIN_FIFO_CTRL1_DIN_POS_01_MASK,
+					      val);
+
+		/* Set sample size to 3 bytes (24 bit) */
+		val = FIELD_PREP(AUDIN_FIFO_CTRL1_DIN_BYTE_NUM_MASK, 2);
+		snd_soc_component_update_bits(component, fifo->reg->ctrl1,
+					      AUDIN_FIFO_CTRL1_DIN_BYTE_NUM_MASK,
+					      val);
+		break;
+	default:
+		dev_err(dai->dev, "Unsupported physical width %u\n",
+			params_physical_width(params));
+		return -EINVAL;
+	}
+
+	/* This is a bit counterintuitive. Even though the platform has a single pin
+	 * for I2S input which would mean that we can only support 2 channels,
+	 * doing so would cause samples to be stored in a weird way into the FIFO:
+	 * all the samples from the 1st channel on the 1st half of the FIFO, then
+	 * samples from the 2nd channel in the other half. Of course extra work
+	 * would be required to properly interleave them before returning to the
+	 * userspace.
+	 * Setting a single channel mode instead solves the problem: samples from
+	 * 1st and 2nd channel are stored interleaved and sequentially in the FIFO.
+	 */
+	val = FIELD_PREP(AUDIN_FIFO_CTRL_CHAN_MASK, 1);
+	snd_soc_component_update_bits(component, fifo->reg->ctrl,
+				      AUDIN_FIFO_CTRL_CHAN_MASK, val);
+
+	/* Setup the period for the polling timer. */
+	fifo->poll_time_ns = 1000000000 / params_rate(params) *
+			     params_period_size(params);
+
+	return 0;
+}
+
+static enum hrtimer_restart timer_cb(struct hrtimer *timer)
+{
+	struct audin_fifo *fifo = container_of(timer, struct audin_fifo,
+				  polling_timer);
+	snd_pcm_period_elapsed(fifo->substream);
+	hrtimer_forward_now(timer, fifo->poll_time_ns);
+	return HRTIMER_RESTART;
+}
+
+static int audin_toddr_startup(struct snd_pcm_substream *substream,
+				struct snd_soc_dai *dai)
+{
+	struct audin_fifo *fifo = snd_soc_dai_dma_data_get_capture(dai);
+	int ret;
+
+	snd_soc_set_runtime_hwparams(substream, fifo->pcm_hw);
+
+	/* Check runtime parameters */
+	ret = snd_pcm_hw_constraint_step(substream->runtime, 0,
+					 SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
+					 AUDIN_FIFO_I2S_BLOCK);
+	if (ret) {
+		dev_err(dai->dev, "Failed to set runtime constraint %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_pcm_hw_constraint_step(substream->runtime, 0,
+					 SNDRV_PCM_HW_PARAM_PERIOD_BYTES,
+					 AUDIN_FIFO_I2S_BLOCK);
+	if (ret) {
+		dev_err(dai->dev, "Failed to set runtime constraint %d\n", ret);
+		return ret;
+	}
+
+	ret = clk_prepare_enable(fifo->pclk);
+	if (ret) {
+		dev_err(dai->dev, "Failed to enable PCLK %d\n", ret);
+		return ret;
+	}
+
+	/* Start the reporting timer */
+	fifo->substream = substream;
+	hrtimer_start(&fifo->polling_timer, fifo->poll_time_ns,
+		      HRTIMER_MODE_REL);
+
+	return ret;
+}
+
+static void audin_toddr_shutdown(struct snd_pcm_substream *substream,
+				struct snd_soc_dai *dai)
+{
+	struct audin_fifo *fifo = snd_soc_dai_dma_data_get_capture(dai);
+
+	hrtimer_cancel(&fifo->polling_timer);
+	clk_disable_unprepare(fifo->pclk);
+}
+
+snd_pcm_uframes_t audin_toddr_pointer(struct snd_soc_component *component,
+				      struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct audin_fifo *fifo = snd_soc_dai_dma_data_get_capture(dai);
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	unsigned int start, ptr;
+
+	start = snd_soc_component_read(component, fifo->reg->start);
+	ptr = snd_soc_component_read(component, fifo->reg->ptr);
+
+	return bytes_to_frames(runtime, ptr - start);
+}
+
+static int audin_toddr_dai_probe(struct snd_soc_dai *dai)
+{
+	struct audin *audin = snd_soc_component_get_drvdata(dai->component);
+	struct audin_fifo *fifo;
+
+	fifo = kzalloc(sizeof(*fifo), GFP_KERNEL);
+	if (!fifo)
+		return -ENOMEM;
+
+	if (dai->id >= AUDIN_FIFO_COUNT) {
+		dev_err(dai->dev, "Invalid DAI ID %d\n", dai->id);
+		kfree(fifo);
+		return -EINVAL;
+	}
+
+	fifo->reg = &audin_fifo_regs[dai->id];
+	fifo->reg_bit_masks = &audin_fifo_regs_bit_masks[dai->id];
+	fifo->pcm_hw = &toddr_pcm_hw;
+	fifo->pclk = audin->bulk_clks[PCLK].clk;
+	hrtimer_init(&fifo->polling_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
+	fifo->polling_timer.function = timer_cb;
+
+	snd_soc_dai_dma_data_set_capture(dai, fifo);
+
+	return 0;
+}
+
+static int audin_toddr_dai_remove(struct snd_soc_dai *dai)
+{
+	kfree(snd_soc_dai_dma_data_get_capture(dai));
+
+	return 0;
+}
+
+static int audin_toddr_pcm_new(struct snd_soc_pcm_runtime *rtd,
+				struct snd_soc_dai *dai)
+{
+	struct snd_card *card = rtd->card->snd_card;
+	struct audin_fifo *fifo = snd_soc_dai_dma_data_get_capture(dai);
+	size_t size = fifo->pcm_hw->buffer_bytes_max;
+	int ret;
+
+	ret = dma_coerce_mask_and_coherent(card->dev, DMA_BIT_MASK(32));
+	if (ret) {
+		dev_err(dai->dev, "Failed to set DMA mask %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_pcm_set_managed_buffer_all(rtd->pcm, SNDRV_DMA_TYPE_DEV,
+					     card->dev, size, size);
+	if (ret) {
+		dev_err(dai->dev, "Failed to set PCM managed buffer %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+const struct snd_soc_dai_ops audin_toddr_dai_ops = {
+	.trigger	= audin_toddr_trigger,
+	.prepare	= audin_toddr_prepare,
+	.hw_params	= audin_toddr_hw_params,
+	.startup	= audin_toddr_startup,
+	.shutdown	= audin_toddr_shutdown,
+	.pcm_new	= audin_toddr_pcm_new,
+	.probe		= audin_toddr_dai_probe,
+	.remove		= audin_toddr_dai_remove,
+};
diff --git a/sound/soc/meson/audin.c b/sound/soc/meson/audin.c
new file mode 100644
index 000000000000..254d646260f1
--- /dev/null
+++ b/sound/soc/meson/audin.c
@@ -0,0 +1,321 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (c) 2025 BayLibre, SAS.
+// Author: Valerio Setti <vsetti@baylibre.com>
+
+#include <linux/clk.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/regmap.h>
+#include <linux/reset.h>
+#include <sound/soc.h>
+#include <sound/soc-dai.h>
+#include <dt-bindings/sound/meson-audin.h>
+
+#include "audin.h"
+
+static const char * const audin_fifo_input_sel_texts[] = {
+	"SPDIF", "I2S", "PCM", "HDMI", "Demodulator"
+};
+
+static SOC_ENUM_SINGLE_DECL(audin_fifo0_input_sel_enum, AUDIN_FIFO0_CTRL,
+			    AUDIN_FIFO_CTRL_DIN_SEL_OFF,
+			    audin_fifo_input_sel_texts);
+
+static const struct snd_kcontrol_new audin_fifo0_input_sel_mux =
+	SOC_DAPM_ENUM("FIFO0 SRC SEL", audin_fifo0_input_sel_enum);
+
+static SOC_ENUM_SINGLE_DECL(audin_fifo1_input_sel_enum, AUDIN_FIFO1_CTRL,
+			    AUDIN_FIFO_CTRL_DIN_SEL_OFF,
+			    audin_fifo_input_sel_texts);
+
+static const struct snd_kcontrol_new audin_fifo1_input_sel_mux =
+	SOC_DAPM_ENUM("FIFO1 SRC SEL", audin_fifo1_input_sel_enum);
+
+static SOC_ENUM_SINGLE_DECL(audin_fifo2_input_sel_enum, AUDIN_FIFO2_CTRL,
+			    AUDIN_FIFO_CTRL_DIN_SEL_OFF,
+			    audin_fifo_input_sel_texts);
+
+static const struct snd_kcontrol_new audin_fifo2_input_sel_mux =
+	SOC_DAPM_ENUM("FIFO2 SRC SEL", audin_fifo2_input_sel_enum);
+
+static const struct snd_soc_dapm_widget audin_cpu_dapm_widgets[] = {
+	SND_SOC_DAPM_MUX("FIFO0 SRC SEL", SND_SOC_NOPM, 0, 0,
+			 &audin_fifo0_input_sel_mux),
+	SND_SOC_DAPM_MUX("FIFO1 SRC SEL", SND_SOC_NOPM, 0, 0,
+			 &audin_fifo1_input_sel_mux),
+	SND_SOC_DAPM_MUX("FIFO2 SRC SEL", SND_SOC_NOPM, 0, 0,
+			 &audin_fifo2_input_sel_mux),
+};
+
+static const struct snd_soc_dapm_route audin_cpu_dapm_routes[] = {
+	{ "FIFO0 SRC SEL", "I2S", "I2S Decoder Capture" },
+	{ "FIFO1 SRC SEL", "I2S", "I2S Decoder Capture" },
+	{ "FIFO2 SRC SEL", "I2S", "I2S Decoder Capture" },
+	{ "TODDR 0 Capture", NULL, "FIFO0 SRC SEL" },
+	{ "TODDR 1 Capture", NULL, "FIFO1 SRC SEL" },
+	{ "TODDR 2 Capture", NULL, "FIFO2 SRC SEL" },
+};
+
+static int audin_cpu_of_xlate_dai_name(struct snd_soc_component *component,
+				       const struct of_phandle_args *args,
+				       const char **dai_name)
+{
+	struct snd_soc_dai *dai;
+	int id;
+
+	if (args->args_count != 1) {
+		dev_err(component->dev, "Wrong number of arguments %d\n",
+			args->args_count);
+		return -EINVAL;
+	}
+
+	id = args->args[0];
+
+	if (id < 0 || id >= component->num_dai) {
+		dev_err(component->dev, "Invalid ID %d\n", id);
+		return -EINVAL;
+	}
+
+	for_each_component_dais(component, dai) {
+		if (id == 0)
+			break;
+		id--;
+	}
+
+	*dai_name = dai->driver->name;
+
+	return 0;
+}
+
+static int audin_cpu_component_probe(struct snd_soc_component *component)
+{
+	struct audin *audin = snd_soc_component_get_drvdata(component);
+
+	/* Required for the FIFO Source control operation */
+	return clk_prepare_enable(audin->bulk_clks[INPUT].clk);
+}
+
+static void audin_cpu_component_remove(struct snd_soc_component *component)
+{
+	struct audin *audin = snd_soc_component_get_drvdata(component);
+
+	clk_disable_unprepare(audin->bulk_clks[INPUT].clk);
+}
+
+static const struct snd_soc_component_driver audin_cpu_component = {
+	.name			= "AUDIN CPU",
+	.dapm_widgets		= audin_cpu_dapm_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(audin_cpu_dapm_widgets),
+	.dapm_routes		= audin_cpu_dapm_routes,
+	.num_dapm_routes	= ARRAY_SIZE(audin_cpu_dapm_routes),
+	.of_xlate_dai_name	= audin_cpu_of_xlate_dai_name,
+	.pointer		= audin_toddr_pointer,
+	.probe			= audin_cpu_component_probe,
+	.remove			= audin_cpu_component_remove,
+#ifdef CONFIG_DEBUG_FS
+	.debugfs_prefix		= "audin-cpu",
+#endif
+};
+
+static struct snd_soc_dai_driver audin_cpu_dai_drv[] = {
+	[CPU_AUDIN_TODDR_0] = {
+		.name = "TODDR 0",
+		.capture = {
+			.stream_name	= "TODDR 0 Capture",
+			.channels_min	= 2,
+			.channels_max	= 2,
+			.rates		= SNDRV_PCM_RATE_CONTINUOUS,
+			.rate_min	= 5512,
+			.rate_max	= 192000,
+			.formats	= AUDIN_FORMATS,
+		},
+		.ops = &audin_toddr_dai_ops,
+	},
+	[CPU_AUDIN_TODDR_1] = {
+		.name = "TODDR 1",
+		.capture = {
+			.stream_name	= "TODDR 1 Capture",
+			.channels_min	= 2,
+			.channels_max	= 2,
+			.rates		= SNDRV_PCM_RATE_CONTINUOUS,
+			.rate_min	= 5512,
+			.rate_max	= 192000,
+			.formats	= AUDIN_FORMATS,
+		},
+		.ops = &audin_toddr_dai_ops,
+	},
+	[CPU_AUDIN_TODDR_2] = {
+		.name = "TODDR 2",
+		.capture = {
+			.stream_name	= "TODDR 2 Capture",
+			.channels_min	= 2,
+			.channels_max	= 2,
+			.rates		= SNDRV_PCM_RATE_CONTINUOUS,
+			.rate_min	= 5512,
+			.rate_max	= 192000,
+			.formats	= AUDIN_FORMATS,
+		},
+		.ops = &audin_toddr_dai_ops,
+	},
+	[CPU_I2S_DECODER] = {
+		.name = "I2S Decoder",
+		.capture = {
+			.stream_name = "I2S Decoder Capture",
+			.channels_min = 2,
+			.channels_max = 2,
+			.rates = SNDRV_PCM_RATE_8000_192000,
+			.formats = AUDIN_FORMATS,
+		},
+		.ops = &audin_decoder_i2s_dai_ops,
+	},
+};
+
+static const struct regmap_config audin_regmap_cfg = {
+	.reg_bits	= 32,
+	.val_bits	= 32,
+	.reg_stride	= 4,
+	.max_register	= 0x308,
+};
+
+static const char * const clk_bulk_ids[] = {
+	"i2s_pclk",
+	"i2s_aoclk",
+	"i2s_mclk",
+	"i2s_mixer",
+	"i2s_input_clk",
+};
+
+static int audin_clk_single_get(struct device *dev, const unsigned char *id,
+				bool enable, struct clk **clk)
+{
+	*clk = devm_clk_get(dev, id);
+	if (IS_ERR(*clk)) {
+		dev_err(dev, "Failed to get %s clock %ld\n", id, PTR_ERR(*clk));
+		return PTR_ERR(*clk);
+	}
+
+	if (enable)
+		return clk_prepare_enable(*clk);
+
+	return 0;
+}
+
+static int audin_clk_get(struct device *dev)
+{
+	struct audin *audin = dev_get_drvdata(dev);
+	struct clk *pclk;
+	int i, ret;
+
+	ret = audin_clk_single_get(dev, "pclk", true, &pclk);
+	if (ret)
+		return ret;
+
+	audin->bulk_clks_num = ARRAY_SIZE(clk_bulk_ids);
+	audin->bulk_clks = devm_kcalloc(dev, audin->bulk_clks_num,
+					sizeof(struct clk_bulk_data),
+					GFP_KERNEL);
+	if (!audin->bulk_clks)
+		return -ENOMEM;
+
+	for (i = 0; i < ARRAY_SIZE(clk_bulk_ids); i++)
+		audin->bulk_clks[i].id = clk_bulk_ids[i];
+
+	ret = devm_clk_bulk_get(dev, ARRAY_SIZE(clk_bulk_ids),
+				audin->bulk_clks);
+	if (ret) {
+		dev_err(dev, "Failed to get bulk clocks %d\n", ret);
+		return ret;
+	}
+
+	ret = audin_clk_single_get(dev, "i2s_aoclk_div_gate", false,
+				   &audin->aoclk_div_gate);
+	if (ret)
+		return ret;
+
+	ret = audin_clk_single_get(dev, "i2s_aoclk_basic_div", false,
+				   &audin->aoclk_basic_div);
+	if (ret)
+		return ret;
+
+	ret = audin_clk_single_get(dev, "i2s_aoclk_more_div", false,
+				   &audin->aoclk_more_div);
+	if (ret)
+		return ret;
+
+	ret = audin_clk_single_get(dev, "i2s_lrclk_div", false,
+				   &audin->lrclk_div);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int audin_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	void __iomem *regs;
+	struct regmap *map;
+	struct audin *audin;
+	int ret;
+
+	audin = devm_kzalloc(dev, sizeof(*audin), GFP_KERNEL);
+	if (!audin)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, audin);
+
+	ret = device_reset(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to reset device\n");
+
+	regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+
+	map = devm_regmap_init_mmio(dev, regs, &audin_regmap_cfg);
+	if (IS_ERR(map)) {
+		dev_err(dev, "failed to init regmap: %ld\n",
+			PTR_ERR(map));
+		return PTR_ERR(map);
+	}
+
+	ret = audin_clk_get(dev);
+	if (ret)
+		return ret;
+
+	ret = snd_soc_register_component(dev, &audin_cpu_component,
+					 audin_cpu_dai_drv,
+					 ARRAY_SIZE(audin_cpu_dai_drv));
+	if (ret) {
+		dev_err(dev, "Failed to register cpu component\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static void audin_remove(struct platform_device *pdev)
+{
+	snd_soc_unregister_component(&pdev->dev);
+}
+
+static const struct of_device_id audin_of_match[] = {
+	{ .compatible = "amlogic,audin-gxbb", .data = NULL },
+	{}
+};
+MODULE_DEVICE_TABLE(of, audin_of_match);
+
+static struct platform_driver audin_pdrv = {
+	.probe = audin_probe,
+	.remove = audin_remove,
+	.driver = {
+		.name = "meson-audin",
+		.of_match_table = audin_of_match,
+	},
+};
+module_platform_driver(audin_pdrv);
+
+MODULE_DESCRIPTION("Meson AUDIN Driver");
+MODULE_AUTHOR("Valerio Setti <vsetti@baylibre.com>");
+MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/meson/audin.h b/sound/soc/meson/audin.h
new file mode 100644
index 000000000000..eb1dbbaeabcc
--- /dev/null
+++ b/sound/soc/meson/audin.h
@@ -0,0 +1,119 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
+/*
+ * Copyright (c) 2025 BayLibre, SAS.
+ * Author: Valerio Setti <vsetti@baylibre.com>
+ */
+
+#ifndef _MESON_AUDIN_H
+#define _MESON_AUDIN_H
+
+struct clk;
+struct clk_bulk_data;
+struct device;
+struct of_phandle_args;
+struct snd_soc_dai;
+struct snd_soc_dai_ops;
+
+enum audin_bulk_clks_id {
+	PCLK = 0,
+	AOCLK,
+	MCLK,
+	MIXER,
+	INPUT,
+};
+
+struct audin {
+	struct clk_bulk_data *bulk_clks;
+	unsigned int bulk_clks_num;
+	struct clk *aoclk_div_gate;
+	struct clk *aoclk_basic_div;
+	struct clk *aoclk_more_div;
+	struct clk *lrclk_div;
+};
+
+/* I2SIN_CTRL register and bits */
+#define AUDIN_I2SIN_CTRL	0x040	/* Reg index = 0x10 */
+	#define AUDIN_I2SIN_CTRL_I2SIN_DIR		BIT(0)
+	#define AUDIN_I2SIN_CTRL_I2SIN_CLK_SEL		BIT(1)
+	#define AUDIN_I2SIN_CTRL_I2SIN_LRCLK_SEL	BIT(2)
+	#define AUDIN_I2SIN_CTRL_I2SIN_POS_SYNC		BIT(3)
+	#define AUDIN_I2SIN_CTRL_I2SIN_LRCLK_SKEW_MASK	GENMASK(6, 4)
+	#define AUDIN_I2SIN_CTRL_I2SIN_LRCLK_INV	BIT(7)
+	#define AUDIN_I2SIN_CTRL_I2SIN_SIZE_MASK	GENMASK(9, 8)
+	#define AUDIN_I2SIN_CTRL_I2SIN_CHAN_EN_MASK	GENMASK(13, 10)
+	#define AUDIN_I2SIN_CTRL_I2SIN_EN		BIT(15)
+
+/* FIFO0 registers */
+#define AUDIN_FIFO0_START	0x080	/* Reg index = 0x20 */
+#define AUDIN_FIFO0_END		0x084	/* Reg index = 0x21 */
+#define AUDIN_FIFO0_PTR		0x088	/* Reg index = 0x22 */
+#define AUDIN_FIFO0_INTR	0x08C	/* Reg index = 0x23 */
+#define AUDIN_FIFO0_RDPTR	0x090	/* Reg index = 0x24 */
+#define AUDIN_FIFO0_WRAP	0x0C4	/* Reg index = 0x31 */
+
+/* FIFO1 registers */
+#define AUDIN_FIFO1_START	0x0CC	/* Reg index = 0x33 */
+#define AUDIN_FIFO1_END		0x0D0	/* Reg index = 0x34 */
+#define AUDIN_FIFO1_PTR		0x0D4	/* Reg index = 0x35 */
+#define AUDIN_FIFO1_INTR	0x0D8	/* Reg index = 0x36 */
+#define AUDIN_FIFO1_RDPTR	0x0DC	/* Reg index = 0x37 */
+#define AUDIN_FIFO1_WRAP	0x110	/* Reg index = 0x44 */
+
+/* FIFO2 registers */
+#define AUDIN_FIFO2_START	0x114	/* Reg index = 0x45 */
+#define AUDIN_FIFO2_END		0x118	/* Reg index = 0x46 */
+#define AUDIN_FIFO2_PTR		0x11C	/* Reg index = 0x47 */
+#define AUDIN_FIFO2_INTR	0x120	/* Reg index = 0x48 */
+#define AUDIN_FIFO2_RDPTR	0x124	/* Reg index = 0x49 */
+#define AUDIN_FIFO2_WRAP	0x140	/* Reg index = 0x50 */
+
+/* FIFOx CTRL registers and bits */
+#define AUDIN_FIFO0_CTRL	0x094	/* Reg index = 0x25 */
+#define AUDIN_FIFO1_CTRL	0x0E0	/* Reg index = 0x38 */
+#define AUDIN_FIFO2_CTRL	0x128	/* Reg index = 0x4a */
+	#define AUDIN_FIFO_CTRL_EN		BIT(0)
+	#define AUDIN_FIFO_CTRL_RST		BIT(1)
+	#define AUDIN_FIFO_CTRL_LOAD		BIT(2)
+	#define AUDIN_FIFO_CTRL_DIN_SEL_OFF	3
+	#define AUDIN_FIFO_CTRL_DIN_SEL_MASK	GENMASK(5, 3)
+	#define AUDIN_FIFO_CTRL_ENDIAN_MASK	GENMASK(10, 8)
+	#define AUDIN_FIFO_CTRL_CHAN_MASK	GENMASK(14, 11)
+	#define AUDIN_FIFO_CTRL_UG		BIT(15)
+
+/* FIFOx_CTRL1 registers and bits */
+#define AUDIN_FIFO0_CTRL1	0x098	/* Reg index = 0x26 */
+#define AUDIN_FIFO1_CTRL1	0x0E4	/* Reg index = 0x39 */
+#define AUDIN_FIFO2_CTRL1	0x12C	/* Reg index = 0x4b */
+	#define AUDIN_FIFO_CTRL1_DIN_POS_2		BIT(7)
+	#define AUDIN_FIFO_CTRL1_DIN_BYTE_NUM_MASK	GENMASK(3, 2)
+	#define AUDIN_FIFO_CTRL1_DIN_POS_01_MASK	GENMASK(1, 0)
+
+/* INT_CTRL register and bits */
+#define AUDIN_INT_CTRL		0x144	/* Reg index = 0x51 */
+	#define AUDIN_INT_CTRL_FIFO0_OVERFLOW		BIT(0)
+	#define AUDIN_INT_CTRL_FIFO0_ADDR_TRIG		BIT(1)
+	#define AUDIN_INT_CTRL_FIFO1_OVERFLOW		BIT(2)
+	#define AUDIN_INT_CTRL_FIFO1_ADDR_TRIG		BIT(3)
+	#define AUDIN_INT_CTRL_FIFO2_OVERFLOW		BIT(11)
+	#define AUDIN_INT_CTRL_FIFO2_ADDR_TRIG		BIT(12)
+
+/* FIFO_INT register and bits */
+#define AUDIN_FIFO_INT		0x148	/* Reg index = 0x52 */
+	#define AUDIN_FIFO_INT_FIFO0_OVERFLOW		BIT(0)
+	#define AUDIN_FIFO_INT_FIFO0_ADDR_TRIG		BIT(1)
+	#define AUDIN_FIFO_INT_FIFO1_OVERFLOW		BIT(2)
+	#define AUDIN_FIFO_INT_FIFO1_ADDR_TRIG		BIT(3)
+	#define AUDIN_FIFO_INT_FIFO2_OVERFLOW		BIT(11)
+	#define AUDIN_FIFO_INT_FIFO2_ADDR_TRIG		BIT(12)
+
+#define AUDIN_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | \
+		       SNDRV_PCM_FMTBIT_S24_LE)
+
+extern const struct snd_soc_dai_ops audin_toddr_dai_ops;
+extern const struct snd_soc_dai_ops audin_decoder_i2s_dai_ops;
+extern struct device_attribute dev_attr_dump_regs;
+
+snd_pcm_uframes_t audin_toddr_pointer(struct snd_soc_component *component,
+				   struct snd_pcm_substream *substream);
+
+#endif /* _MESON_AUDIN_H */
-- 
2.39.5

