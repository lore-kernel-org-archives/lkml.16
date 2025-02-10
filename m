Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7D07082E
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 15:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739199702; cv=none; b=WT+N+DK4jXdjF2UWFeJaBG5DGeFoi3KlGHoe42TwvmH4Ug0Z9EyET89v2B2YaNFWoAh9EL4PjYinQ6AndjGEreu0yHz1RsoRLQnZ9uCzPbHE4sysC+i0V3kdL2AdGvVu5ufMKZMox7YCcV5Sb22MhurTtnt9imk78Au6zYflJac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739199702; c=relaxed/simple;
	bh=QohpDMnGYyXpIbehK5ugOZmdwa7aGVXW0sC1wvKj0Bo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oldXuHSJxOpuXEKKUjoTcTVxe5KVL6g1gbVjzKyT7pOlazRIRlaYbmKp/XfBvPj+1dQpo3EZF/bKqXHTbllDvoT9RNt6tk4/iWjlukk9LwvnFhqAV9gCfIbOBHs1zZaiKRWveXJgZl3x+nDsJqihgYQenfwaWT5tGVC9V2J3uWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=IS9YF3IW; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="IS9YF3IW"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aaeec07b705so705364866b.2
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 07:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739199697; x=1739804497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GoW4ElKxbzHPd1HAYMzIAS62vLOcPOeAwiyP6knEeRE=;
        b=IS9YF3IWtq+477poqmr72PeYcmhcGrO24Xdz6tl2zwge4srnt/jtDRCgnlCDljt2HD
         0grRI2CTy1iCjejxYzFlpki9+6WbX/imk0nfWjGm7UDJBeXdPA+ZvTeCA3VQdm9pfGrd
         +WG/PZg7edlmm37/RLRrZ3dF10HxSXIebX5ZMFZX2Nv2WTIYTb/slKJ59Wqhu8/AE6Sw
         6NiO8RUcfrOq3MOtCtvyPClLTppvdQpN7o5q23IRqEHhQdsHtklHDlOByM2dGchj9tgn
         ioz0BAvmBGpYBXRZA8keQgwDRr24tn1gyCFuBbF1GER0x5SXTC2B7L6UqAtEre4HU57G
         IQdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739199697; x=1739804497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GoW4ElKxbzHPd1HAYMzIAS62vLOcPOeAwiyP6knEeRE=;
        b=i53wfyLTnL+VthfHy1JAZABE3qOEYs5HBEQixmu3rtbDB7ik1+7GXT0iyyPBzSvI90
         8MWSU7RtBO8qewFBooqd20Cled7pjeZv1L0uYZhsHpFDeXtMSlzR5B9ENhVR7qhoH0Cx
         zDpz1iwhvBkY5SdjvhlY1/fPxEIeoRCA4+CaC0C3N5C1nAdsvIE/VhCgSCrrtvmwTjiq
         ZWIxPwtBekixJA7qWb/c7lwxlee721gj7zW++yCLMzwOZbhhWPmHAV2iINQxbSPdlOuL
         9mFjZJ1f/QGyentKLNWW8mawTAgYlD9s5oV4RPqqSAFNje3fs/7ATxjU1jfDoItxO+nw
         Uygg==
X-Gm-Message-State: AOJu0Yykjy8UkYA1CLDhMViuRbNggE3j7Yyh/lX/EJzuyRmhKf6JG8Gi
	IS9GtC+JiO9+zSFdrRyihzj+kOJV+5JKHMPmu0YL3CnDL4d/bjKDeYObEqsEdGU5jpSfe/kSj0C
	7o2ogjA==
X-Gm-Gg: ASbGncuXas9UFDLhV2H2WdYs8hhsfOSlQ1Y9d614VtCelVcSNGCu1NXuG0dYoN8cDDE
	0ufB3yNZr1hthlxx7mCA8C7lGRffDNY9QmfCsrLf9Eze8ApIDeQZkyGoqSKeOf6kfhG1VlPrUfn
	4Zut8A2t4mF+SsNzJUJam8LuW4aAfGO+ev0kaCmGdA5sZ/ibSIHnOtd2PWfBnuX2yURmMDmStxR
	lgkViOEL+FO/dKo/Vs6eUMzeK129nX2Uu6UJNSZK5+Z0i8JNv0M7R8y/wFPLaA2Zq1TKJkbfkZh
	xZFoFnfW1tEYQXNQSeepbl3PrsZG
X-Google-Smtp-Source: AGHT+IFSb4PN0v3r+wCwmVC4SXfkndG2iRcZotOXajDb40L/GlsWSOnpyQvs1PhoQNE6v2oFkgxGPA==
X-Received: by 2002:a17:907:3fa5:b0:aab:c78c:a7ed with SMTP id a640c23a62f3a-ab789c2d7aemr1556998866b.49.1739199696088;
        Mon, 10 Feb 2025 07:01:36 -0800 (PST)
Received: from localhost.localdomain ([151.41.218.186])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7bec717f7sm250400466b.81.2025.02.10.07.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 07:01:35 -0800 (PST)
From: Valerio Setti <vsetti@baylibre.com>
To: jbrunet@baylibre.com,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-amlogic@lists.infradead.org,
	linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Valerio Setti <vsetti@baylibre.com>
Subject: [PATCH RFC 1/6] ASoC: meson: [HACK] let AIU export its clocks through clk-regmap
Date: Mon, 10 Feb 2025 16:01:24 +0100
Message-Id: <20250210150129.40248-2-vsetti@baylibre.com>
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

Make AIU export its clocks gates and dividers through the clk-regmap
interface. The advantage is that other periperals, such as AUDIN (audio
input) which requires some clocks owned by AIU, can easily
use them.

Since clk-regmap interface is not public yet, this commit is
marked as HACK, but it is necessary to build and test the following
commits that introduce support for AUDIN driver.

Being an HACK commit, I took the liberty to condense all the changes
(driver, dt-bindings, DT) in a single commit. Once clk-regmap interace
will be public, I can rework this by splitting it into a proper
commit sequence.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi |  14 ++-
 include/dt-bindings/sound/meson-aiu.h       |   5 +
 sound/soc/meson/Makefile                    |   1 +
 sound/soc/meson/aiu-clocks.c                | 123 ++++++++++++++++++++
 sound/soc/meson/aiu-encoder-i2s.c           | 121 +++++++++++--------
 sound/soc/meson/aiu.c                       |  22 ++++
 sound/soc/meson/aiu.h                       |  10 ++
 7 files changed, 245 insertions(+), 51 deletions(-)
 create mode 100644 sound/soc/meson/aiu-clocks.c

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index ed00e67e6923..e2026b7aa03f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/clock/gxbb-clkc.h>
 #include <dt-bindings/clock/gxbb-aoclkc.h>
 #include <dt-bindings/reset/gxbb-aoclkc.h>
+#include <dt-bindings/sound/meson-aiu.h>
 
 / {
 	compatible = "amlogic,meson-gxbb";
@@ -62,6 +63,7 @@ usb1: usb@c9100000 {
 };
 
 &aiu {
+	#clock-cells = <1>;
 	compatible = "amlogic,aiu-gxbb", "amlogic,aiu";
 	clocks = <&clkc CLKID_AIU_GLUE>,
 		 <&clkc CLKID_I2S_OUT>,
@@ -71,7 +73,11 @@ &aiu {
 		 <&clkc CLKID_IEC958>,
 		 <&clkc CLKID_IEC958_GATE>,
 		 <&clkc CLKID_CTS_MCLK_I958>,
-		 <&clkc CLKID_CTS_I958>;
+		 <&clkc CLKID_CTS_I958>,
+		 <&aiu AIU_AOCLK_DIV_GATE>,
+		 <&aiu AIU_AOCLK_BASIC_DIV>,
+		 <&aiu AIU_AOCLK_MORE_DIV>,
+		 <&aiu AIU_LRCLK_DIV>;
 	clock-names = "pclk",
 		      "i2s_pclk",
 		      "i2s_aoclk",
@@ -80,7 +86,11 @@ &aiu {
 		      "spdif_pclk",
 		      "spdif_aoclk",
 		      "spdif_mclk",
-		      "spdif_mclk_sel";
+		      "spdif_mclk_sel",
+		      "i2s_aoclk_div_gate",
+		      "i2s_aoclk_basic_div",
+		      "i2s_aoclk_more_div",
+		      "i2s_lrclk_div";
 	resets = <&reset RESET_AIU>;
 };
 
diff --git a/include/dt-bindings/sound/meson-aiu.h b/include/dt-bindings/sound/meson-aiu.h
index 1051b8af298b..8e8834273fe6 100644
--- a/include/dt-bindings/sound/meson-aiu.h
+++ b/include/dt-bindings/sound/meson-aiu.h
@@ -15,4 +15,9 @@
 #define CTRL_PCM		1
 #define CTRL_OUT		2
 
+#define AIU_AOCLK_DIV_GATE	0
+#define AIU_AOCLK_BASIC_DIV	1
+#define AIU_AOCLK_MORE_DIV	2
+#define AIU_LRCLK_DIV		3
+
 #endif /* __DT_MESON_AIU_H */
diff --git a/sound/soc/meson/Makefile b/sound/soc/meson/Makefile
index 24078e4396b0..af75f386feda 100644
--- a/sound/soc/meson/Makefile
+++ b/sound/soc/meson/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0 OR MIT)
 
 snd-soc-meson-aiu-y := aiu.o
+snd-soc-meson-aiu-y += aiu-clocks.o
 snd-soc-meson-aiu-y += aiu-acodec-ctrl.o
 snd-soc-meson-aiu-y += aiu-codec-ctrl.o
 snd-soc-meson-aiu-y += aiu-encoder-i2s.o
diff --git a/sound/soc/meson/aiu-clocks.c b/sound/soc/meson/aiu-clocks.c
new file mode 100644
index 000000000000..ec4b4846b0de
--- /dev/null
+++ b/sound/soc/meson/aiu-clocks.c
@@ -0,0 +1,123 @@
+#include <linux/clk.h>
+#include <linux/of_platform.h>
+#include <linux/regmap.h>
+#include <linux/clk-provider.h>
+#include "../../../drivers/clk/meson/clk-regmap.h"
+#include <sound/soc.h>
+#include <sound/soc-dai.h>
+
+#include <dt-bindings/sound/meson-aiu.h>
+#include "aiu.h"
+
+static struct clk_regmap i2s_aoclk_div_gate = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = AIU_CLK_CTRL,
+		.bit_idx = 0,
+		.flags = 0,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "i2s_aoclk_div_gate",
+		.ops = &clk_regmap_gate_ops,
+		.parent_names = (const char *[]) {
+			"cts_amclk",
+		},
+		.num_parents = 1,
+		.flags = 0,
+	},
+};
+
+static struct clk_regmap i2s_aoclk_basic_divider = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = AIU_CLK_CTRL,
+		.shift = 2,
+		.width = 2,
+		.flags = CLK_DIVIDER_POWER_OF_TWO,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "i2s_aoclk_basic_divider",
+		.ops = &clk_regmap_divider_ops,
+		.parent_names = (const char *[]) {
+			"i2s_aoclk_div_gate",
+		},
+		.num_parents = 1,
+		.flags = CLK_DIVIDER_POWER_OF_TWO,
+	},
+};
+
+static struct clk_regmap i2s_aoclk_more_divider = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = AIU_CLK_CTRL_MORE,
+		.shift = 0,
+		.width = 6,
+		.flags = 0,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "i2s_aoclk_more_divider",
+		.ops = &clk_regmap_divider_ops,
+		.parent_names = (const char *[]) {
+			"i2s_aoclk_basic_divider",
+		},
+		.num_parents = 1,
+		.flags = 0,
+	},
+};
+
+static struct clk_regmap i2s_lrclk_divider = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = AIU_CODEC_DAC_LRCLK_CTRL,
+		.shift = 0,
+		.width = 12,
+		.flags = 0,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "i2s_lrlk_divider",
+		.ops = &clk_regmap_divider_ops,
+		.parent_names = (const char *[]) {
+			"i2s_aoclk_more_divider",
+		},
+		.num_parents = 1,
+		.flags = 0,
+	},
+};
+
+struct clk_regmap *const aiu_clk_regmaps[] = {
+	&i2s_aoclk_div_gate,
+	&i2s_aoclk_basic_divider,
+	&i2s_aoclk_more_divider,
+	&i2s_lrclk_divider,
+};
+
+static struct clk_hw *aiu_clk_hw_get(struct of_phandle_args *clkspec, void *clk_hw_data)
+{
+	struct clk_regmap **const aiu_clk_regmaps_ptr = clk_hw_data;
+	unsigned int idx = clkspec->args[0];
+
+	if (idx >= ARRAY_SIZE(aiu_clk_regmaps)) {
+		pr_err("%s: invalid index %u\n", __func__, idx);
+		return ERR_PTR(-EINVAL);
+	}
+
+	return &(aiu_clk_regmaps_ptr[idx]->hw);
+}
+
+int aiu_register_clocks(struct device *dev, struct regmap *map)
+{
+	int i, ret;
+
+	for (i = 0; i < ARRAY_SIZE(aiu_clk_regmaps); i++) {
+		aiu_clk_regmaps[i]->map = map;
+		ret = devm_clk_hw_register(dev, &(aiu_clk_regmaps[i]->hw));
+		if (ret) {
+			dev_err(dev, "Failed to register AIU clock %d\n", i);
+			return ret;
+		}
+	}
+
+	ret = devm_of_clk_add_hw_provider(dev, aiu_clk_hw_get, (void *)&aiu_clk_regmaps);
+	if (ret) {
+		dev_err(dev, "devm_of_clk_add_hw_provider failed\n");
+		return ret;
+	}
+
+	return 0;
+}
diff --git a/sound/soc/meson/aiu-encoder-i2s.c b/sound/soc/meson/aiu-encoder-i2s.c
index a0dd914c8ed1..d469ff429177 100644
--- a/sound/soc/meson/aiu-encoder-i2s.c
+++ b/sound/soc/meson/aiu-encoder-i2s.c
@@ -18,22 +18,10 @@
 #define AIU_RST_SOFT_I2S_FAST		BIT(0)
 
 #define AIU_I2S_DAC_CFG_MSB_FIRST	BIT(2)
-#define AIU_CLK_CTRL_I2S_DIV_EN		BIT(0)
-#define AIU_CLK_CTRL_I2S_DIV		GENMASK(3, 2)
 #define AIU_CLK_CTRL_AOCLK_INVERT	BIT(6)
 #define AIU_CLK_CTRL_LRCLK_INVERT	BIT(7)
 #define AIU_CLK_CTRL_LRCLK_SKEW		GENMASK(9, 8)
 #define AIU_CLK_CTRL_MORE_HDMI_AMCLK	BIT(6)
-#define AIU_CLK_CTRL_MORE_I2S_DIV	GENMASK(5, 0)
-#define AIU_CODEC_DAC_LRCLK_CTRL_DIV	GENMASK(11, 0)
-
-static void aiu_encoder_i2s_divider_enable(struct snd_soc_component *component,
-					   bool enable)
-{
-	snd_soc_component_update_bits(component, AIU_CLK_CTRL,
-				      AIU_CLK_CTRL_I2S_DIV_EN,
-				      enable ? AIU_CLK_CTRL_I2S_DIV_EN : 0);
-}
 
 static int aiu_encoder_i2s_setup_desc(struct snd_soc_component *component,
 				      struct snd_pcm_hw_params *params)
@@ -80,8 +68,13 @@ static int aiu_encoder_i2s_setup_desc(struct snd_soc_component *component,
 
 static int aiu_encoder_i2s_set_legacy_div(struct snd_soc_component *component,
 					  struct snd_pcm_hw_params *params,
-					  unsigned int bs)
+					  unsigned long mclk_rate,
+					  unsigned long aoclk_rate)
 {
+	struct aiu *aiu = snd_soc_component_get_drvdata(component);
+	unsigned long bs = mclk_rate / aoclk_rate;
+	int ret;
+
 	switch (bs) {
 	case 1:
 	case 2:
@@ -91,27 +84,38 @@ static int aiu_encoder_i2s_set_legacy_div(struct snd_soc_component *component,
 		break;
 
 	default:
-		dev_err(component->dev, "Unsupported i2s divider: %u\n", bs);
+		dev_err(component->dev, "Unsupported i2s divider: %lu\n", bs);
 		return -EINVAL;
 	}
 
-	snd_soc_component_update_bits(component, AIU_CLK_CTRL,
-				      AIU_CLK_CTRL_I2S_DIV,
-				      FIELD_PREP(AIU_CLK_CTRL_I2S_DIV,
-						 __ffs(bs)));
+	/* Use AOCLK_BASIC divider, i.e. set AOCLK_MORE to the same rate as
+	 * its parent so that it acts as a passthrough.
+	 */
+	ret = clk_set_rate(aiu->i2s_extra.clks[AOCLK_BASIC_DIV].clk,
+			   aoclk_rate);
+	if (ret) {
+		dev_err(component->dev, "failed to set AOCLK_BASIC_DIV\n");
+		return ret;
+	}
 
-	snd_soc_component_update_bits(component, AIU_CLK_CTRL_MORE,
-				      AIU_CLK_CTRL_MORE_I2S_DIV,
-				      FIELD_PREP(AIU_CLK_CTRL_MORE_I2S_DIV,
-						 0));
+	ret = clk_set_rate(aiu->i2s_extra.clks[AOCLK_MORE_DIV].clk, aoclk_rate);
+	if (ret) {
+		dev_err(component->dev, "failed to set AOCLK_MORE_DIV\n");
+		return ret;
+	}
 
 	return 0;
 }
 
 static int aiu_encoder_i2s_set_more_div(struct snd_soc_component *component,
 					struct snd_pcm_hw_params *params,
-					unsigned int bs)
+					unsigned long mclk_rate,
+					unsigned long aoclk_rate)
 {
+	struct aiu *aiu = snd_soc_component_get_drvdata(component);
+	unsigned long bs = mclk_rate / aoclk_rate;
+	int ret;
+
 	/*
 	 * NOTE: this HW is odd.
 	 * In most configuration, the i2s divider is 'mclk / blck'.
@@ -126,31 +130,41 @@ static int aiu_encoder_i2s_set_more_div(struct snd_soc_component *component,
 			return -EINVAL;
 		}
 		bs += bs / 2;
+		aoclk_rate = mclk_rate / bs;
 	}
 
-	/* Use CLK_MORE for mclk to bclk divider */
-	snd_soc_component_update_bits(component, AIU_CLK_CTRL,
-				      AIU_CLK_CTRL_I2S_DIV,
-				      FIELD_PREP(AIU_CLK_CTRL_I2S_DIV, 0));
+	/* Use AOCLK_MORE divider, i.e. set AOCLK_BASIC to the same rate as
+	 * its parent so that it acts as a passthough.
+	 */
+	ret = clk_set_rate(aiu->i2s_extra.clks[AOCLK_BASIC_DIV].clk, mclk_rate);
+	if (ret) {
+		dev_err(component->dev, "failed to set AOCLK_BASIC_DIV\n");
+		return ret;
+	}
 
-	snd_soc_component_update_bits(component, AIU_CLK_CTRL_MORE,
-				      AIU_CLK_CTRL_MORE_I2S_DIV,
-				      FIELD_PREP(AIU_CLK_CTRL_MORE_I2S_DIV,
-						 bs - 1));
+	ret = clk_set_rate(aiu->i2s_extra.clks[AOCLK_MORE_DIV].clk, aoclk_rate);
+	if (ret) {
+		dev_err(component->dev, "failed to set AOCLK_MORE_DIV\n");
+		return ret;
+	}
 
 	return 0;
 }
 
 static int aiu_encoder_i2s_set_clocks(struct snd_soc_component *component,
-				      struct snd_pcm_hw_params *params)
+				      struct snd_pcm_hw_params *params,
+				      struct snd_soc_dai *dai)
 {
 	struct aiu *aiu = snd_soc_component_get_drvdata(component);
 	unsigned int srate = params_rate(params);
-	unsigned int fs, bs;
+	unsigned int fs;
+	unsigned long mclk_rate, aoclk_rate;
 	int ret;
 
+	mclk_rate = clk_get_rate(aiu->i2s.clks[MCLK].clk);
+
 	/* Get the oversampling factor */
-	fs = DIV_ROUND_CLOSEST(clk_get_rate(aiu->i2s.clks[MCLK].clk), srate);
+	fs = DIV_ROUND_CLOSEST(mclk_rate, srate);
 
 	if (fs % 64)
 		return -EINVAL;
@@ -160,22 +174,26 @@ static int aiu_encoder_i2s_set_clocks(struct snd_soc_component *component,
 				      AIU_I2S_DAC_CFG_MSB_FIRST,
 				      AIU_I2S_DAC_CFG_MSB_FIRST);
 
-	/* Set bclk to lrlck ratio */
-	snd_soc_component_update_bits(component, AIU_CODEC_DAC_LRCLK_CTRL,
-				      AIU_CODEC_DAC_LRCLK_CTRL_DIV,
-				      FIELD_PREP(AIU_CODEC_DAC_LRCLK_CTRL_DIV,
-						 64 - 1));
-
-	bs = fs / 64;
+	/* aoclk rate is 64 times the sample rate */
+	aoclk_rate = srate * 64;
 
 	if (aiu->platform->has_clk_ctrl_more_i2s_div)
-		ret = aiu_encoder_i2s_set_more_div(component, params, bs);
+		ret = aiu_encoder_i2s_set_more_div(component, params,
+						   mclk_rate, aoclk_rate);
 	else
-		ret = aiu_encoder_i2s_set_legacy_div(component, params, bs);
+		ret = aiu_encoder_i2s_set_legacy_div(component, params,
+						     mclk_rate, aoclk_rate);
 
 	if (ret)
 		return ret;
 
+	/* lrclk rate is equal to the sample rate */
+	ret = clk_set_rate(aiu->i2s_extra.clks[LRCLK_DIV].clk, srate);
+	if (ret) {
+		dev_err(dai->dev, "failed to set LRCLK_DIV\n");
+		return ret;
+	}
+
 	/* Make sure amclk is used for HDMI i2s as well */
 	snd_soc_component_update_bits(component, AIU_CLK_CTRL_MORE,
 				      AIU_CLK_CTRL_MORE_HDMI_AMCLK,
@@ -189,10 +207,11 @@ static int aiu_encoder_i2s_hw_params(struct snd_pcm_substream *substream,
 				     struct snd_soc_dai *dai)
 {
 	struct snd_soc_component *component = dai->component;
+	struct aiu *aiu = snd_soc_component_get_drvdata(dai->component);
 	int ret;
 
 	/* Disable the clock while changing the settings */
-	aiu_encoder_i2s_divider_enable(component, false);
+	// clk_disable_unprepare(aiu->i2s_extra.clks[AOCLK_DIV_GATE].clk);
 
 	ret = aiu_encoder_i2s_setup_desc(component, params);
 	if (ret) {
@@ -200,13 +219,17 @@ static int aiu_encoder_i2s_hw_params(struct snd_pcm_substream *substream,
 		return ret;
 	}
 
-	ret = aiu_encoder_i2s_set_clocks(component, params);
+	ret = aiu_encoder_i2s_set_clocks(component, params, dai);
 	if (ret) {
 		dev_err(dai->dev, "setting i2s clocks failed\n");
 		return ret;
 	}
 
-	aiu_encoder_i2s_divider_enable(component, true);
+	ret = clk_prepare_enable(aiu->i2s_extra.clks[AOCLK_DIV_GATE].clk);
+	if (ret) {
+		dev_err(dai->dev, "failed to enable AOCLK_DIV_GATE\n");
+		return ret;
+	}
 
 	return 0;
 }
@@ -214,10 +237,10 @@ static int aiu_encoder_i2s_hw_params(struct snd_pcm_substream *substream,
 static int aiu_encoder_i2s_hw_free(struct snd_pcm_substream *substream,
 				   struct snd_soc_dai *dai)
 {
-	struct snd_soc_component *component = dai->component;
-
-	aiu_encoder_i2s_divider_enable(component, false);
+	struct aiu *aiu = snd_soc_component_get_drvdata(dai->component);
 
+	clk_disable_unprepare(aiu->i2s_extra.clks[AOCLK_DIV_GATE].clk);
+	
 	return 0;
 }
 
diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
index f2890111c1d2..ef3365348aa1 100644
--- a/sound/soc/meson/aiu.c
+++ b/sound/soc/meson/aiu.c
@@ -9,6 +9,8 @@
 #include <linux/of_platform.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
+#include <linux/clk-provider.h>
+#include "../../../drivers/clk/meson/clk-regmap.h"
 #include <sound/soc.h>
 #include <sound/soc-dai.h>
 
@@ -203,6 +205,13 @@ static const char * const aiu_i2s_ids[] = {
 	[MIXER]	= "i2s_mixer",
 };
 
+static const char * const aiu_i2s_extra_ids[] = {
+	[AOCLK_DIV_GATE]	= "i2s_aoclk_div_gate",
+	[AOCLK_BASIC_DIV]	= "i2s_aoclk_basic_div",
+	[AOCLK_MORE_DIV]	= "i2s_aoclk_more_div",
+	[LRCLK_DIV]		= "i2s_lrclk_div",
+};
+
 static const char * const aiu_spdif_ids[] = {
 	[PCLK]	= "spdif_pclk",
 	[AOCLK]	= "spdif_aoclk",
@@ -229,6 +238,13 @@ static int aiu_clk_get(struct device *dev)
 	if (ret)
 		return dev_err_probe(dev, ret, "Can't get the i2s clocks\n");
 
+	ret = aiu_clk_bulk_get(dev, aiu_i2s_extra_ids,
+			       ARRAY_SIZE(aiu_i2s_extra_ids),
+			       &aiu->i2s_extra);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Can't get the i2s extra clocks\n");
+
 	ret = aiu_clk_bulk_get(dev, aiu_spdif_ids, ARRAY_SIZE(aiu_spdif_ids),
 			       &aiu->spdif);
 	if (ret)
@@ -278,6 +294,12 @@ static int aiu_probe(struct platform_device *pdev)
 	if (aiu->spdif.irq < 0)
 		return aiu->spdif.irq;
 
+	ret = aiu_register_clocks(dev, map);
+	if (ret) {
+		dev_err(dev, "Failed to register AIU clocks\n");
+		return ret;
+	}
+
 	ret = aiu_clk_get(dev);
 	if (ret)
 		return ret;
diff --git a/sound/soc/meson/aiu.h b/sound/soc/meson/aiu.h
index 0f94c8bf6081..847466c02408 100644
--- a/sound/soc/meson/aiu.h
+++ b/sound/soc/meson/aiu.h
@@ -21,6 +21,13 @@ enum aiu_clk_ids {
 	MIXER
 };
 
+enum aiu_i2s_extra_clk_ids {
+	AOCLK_DIV_GATE = 0,
+	AOCLK_BASIC_DIV,
+	AOCLK_MORE_DIV,
+	LRCLK_DIV,
+};
+
 struct aiu_interface {
 	struct clk_bulk_data *clks;
 	unsigned int clk_num;
@@ -35,6 +42,7 @@ struct aiu_platform_data {
 struct aiu {
 	struct clk *spdif_mclk;
 	struct aiu_interface i2s;
+	struct aiu_interface i2s_extra;
 	struct aiu_interface spdif;
 	const struct aiu_platform_data *platform;
 };
@@ -54,6 +62,8 @@ int aiu_acodec_ctrl_register_component(struct device *dev);
 int aiu_fifo_i2s_dai_probe(struct snd_soc_dai *dai);
 int aiu_fifo_spdif_dai_probe(struct snd_soc_dai *dai);
 
+int aiu_register_clocks(struct device *dev, struct regmap *map);
+
 extern const struct snd_soc_dai_ops aiu_fifo_i2s_dai_ops;
 extern const struct snd_soc_dai_ops aiu_fifo_spdif_dai_ops;
 extern const struct snd_soc_dai_ops aiu_encoder_i2s_dai_ops;
-- 
2.39.5

