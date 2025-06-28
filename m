Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFA8221FCD;
	Sat, 28 Jun 2025 07:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751094906; cv=none; b=TvgNm1nAfERFtUmZxVImrsoO2GwwPEZdtNjC9pyS2uybIGTl7yg1cag7VfXtk2zBBOZOd8T2PnjI8fxf8EukTT5WoGdFLmPsmslpxnlVEMct5u0fuN5cDaoPQ3xVdJ/b3QP410gZuxbSaeBhbT11NK/pyt0E+72NqAIiRPoSm/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751094906; c=relaxed/simple;
	bh=7+dEeb6jcmjmVP0wDZ2p6s41yJb0ur7Sepgppc9cvC8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JHQCQtT8xoPCxkHLReWwi9l2mZ1qCJHAGZqPHOtUpl/sNlKqidzKhirfVPrGaLaJogTs5GUOhlAYMp3Khyjafo2qynBd41VyTItnLpu3PjrbQ2byQ9QYa1LrDUIfLZH8p3Rzw8aSaQmhbcmJAs2k80qROd0VuRTlRNNd3TDhI0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=IReTKqKD; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="IReTKqKD"
X-UUID: 95d7d0d253ef11f0b1510d84776b8c0b-20250628
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=wr/d3mkVcIoO68e+iXWZrGiDIAbDgPh6tkygVbU4mqU=;
	b=IReTKqKDk/1PLUy+q5OfM0eH4y1QJszXpJjg4zqig7/LZ7cBShCu3GdAgeVex2nNuykXEM4jiRQq04aRCdt9Haspyio1kPaw9rcMXE+k3BGEPQqzt4bn5dq+Bs5Yk3iI6yxoPnECWUcri8tVX9Nr/u1AQlGWN6/eDmjUAJb5994=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:c3610517-be73-439a-843d-1dbd93577aef,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:74feb95f-2aa0-4c76-8faa-804d844c7164,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 95d7d0d253ef11f0b1510d84776b8c0b-20250628
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <cyril.chao@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1374343043; Sat, 28 Jun 2025 15:14:52 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Sat, 28 Jun 2025 15:14:51 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Sat, 28 Jun 2025 15:14:50 +0800
From: Cyril <Cyril.Chao@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<cyril.chao@mediatek.com>, Cyril Chao <Cyril.Chao@mediatek.com>
Subject: [PATCH 02/10] ASoC: mediatek: mt8189: support audio clock control
Date: Sat, 28 Jun 2025 15:14:10 +0800
Message-ID: <20250628071442.31155-3-Cyril.Chao@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250628071442.31155-1-Cyril.Chao@mediatek.com>
References: <20250628071442.31155-1-Cyril.Chao@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

From: Cyril Chao <Cyril.Chao@mediatek.com>

Add audio clock wrapper and audio tuner control.

Signed-off-by: Cyril Chao <Cyril.Chao@mediatek.com>
---
 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 763 +++++++++++++++++++++
 sound/soc/mediatek/mt8189/mt8189-afe-clk.h | 109 +++
 2 files changed, 872 insertions(+)
 create mode 100644 sound/soc/mediatek/mt8189/mt8189-afe-clk.c
 create mode 100644 sound/soc/mediatek/mt8189/mt8189-afe-clk.h

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
new file mode 100644
index 000000000..655a2cacf
--- /dev/null
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
@@ -0,0 +1,763 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *  mt8189-afe-clk.c  --  Mediatek 8189 afe clock ctrl
+ *
+ *  Copyright (c) 2025 MediaTek Inc.
+ *  Author: Darren Ye <darren.ye@mediatek.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/regmap.h>
+#include <linux/mfd/syscon.h>
+
+#include "mt8189-afe-common.h"
+#include "mt8189-afe-clk.h"
+
+/* mck */
+struct mt8189_mck_div {
+	int m_sel_id;
+	int div_clk_id;
+};
+
+static const struct mt8189_mck_div mck_div[MT8189_MCK_NUM] = {
+	[MT8189_I2SIN0_MCK] = {
+		.m_sel_id = MT8189_CLK_TOP_I2SIN0_M_SEL,
+		.div_clk_id = MT8189_CLK_TOP_APLL12_DIV_I2SIN0,
+	},
+	[MT8189_I2SIN1_MCK] = {
+		.m_sel_id = MT8189_CLK_TOP_I2SIN1_M_SEL,
+		.div_clk_id = MT8189_CLK_TOP_APLL12_DIV_I2SIN1,
+	},
+	[MT8189_FMI2S_MCK] = {
+		.m_sel_id = MT8189_CLK_TOP_FMI2S_M_SEL,
+		.div_clk_id = MT8189_CLK_TOP_APLL12_DIV_FMI2S,
+	},
+	[MT8189_TDMOUT_MCK] = {
+		.m_sel_id = MT8189_CLK_TOP_TDMOUT_M_SEL,
+		.div_clk_id = MT8189_CLK_TOP_APLL12_DIV_TDMOUT_M,
+	},
+	[MT8189_TDMOUT_BCK] = {
+		.m_sel_id = -1,
+		.div_clk_id = MT8189_CLK_TOP_APLL12_DIV_TDMOUT_B,
+	},
+};
+
+static const char *aud_clks[MT8189_CLK_NUM] = {
+	[MT8189_CLK_TOP_MUX_AUDIOINTBUS] = "top_aud_intbus",
+	[MT8189_CLK_TOP_MUX_AUD_ENG1] = "top_aud_eng1",
+	[MT8189_CLK_TOP_MUX_AUD_ENG2] = "top_aud_eng2",
+	[MT8189_CLK_TOP_MUX_AUDIO_H] = "top_aud_h",
+	/* pll */
+	[MT8189_CLK_TOP_APLL1_CK] = "apll1",
+	[MT8189_CLK_TOP_APLL2_CK] = "apll2",
+	/* divider */
+	[MT8189_CLK_TOP_APLL1_D4] = "apll1_d4",
+	[MT8189_CLK_TOP_APLL2_D4] = "apll2_d4",
+	[MT8189_CLK_TOP_APLL12_DIV_I2SIN0] = "apll12_div_i2sin0",
+	[MT8189_CLK_TOP_APLL12_DIV_I2SIN1] = "apll12_div_i2sin1",
+	[MT8189_CLK_TOP_APLL12_DIV_FMI2S] = "apll12_div_fmi2s",
+	[MT8189_CLK_TOP_APLL12_DIV_TDMOUT_M] = "apll12_div_tdmout_m",
+	[MT8189_CLK_TOP_APLL12_DIV_TDMOUT_B] = "apll12_div_tdmout_b",
+	/* mux */
+	[MT8189_CLK_TOP_MUX_AUD_1] = "top_apll1",
+	[MT8189_CLK_TOP_MUX_AUD_2] = "top_apll2",
+	[MT8189_CLK_TOP_I2SIN0_M_SEL] = "top_i2sin0",
+	[MT8189_CLK_TOP_I2SIN1_M_SEL] = "top_i2sin1",
+	[MT8189_CLK_TOP_FMI2S_M_SEL] = "top_fmi2s",
+	[MT8189_CLK_TOP_TDMOUT_M_SEL] = "top_dptx",
+	/* top 26m*/
+	[MT8189_CLK_TOP_CLK26M] = "clk26m",
+	/* peri */
+	[MT8189_CLK_PERAO_AUDIO_SLV_CK_PERI] = "aud_slv_ck_peri",
+	[MT8189_CLK_PERAO_AUDIO_MST_CK_PERI] = "aud_mst_ck_peri",
+	[MT8189_CLK_PERAO_INTBUS_CK_PERI] = "aud_intbus_ck_peri",
+};
+
+int mt8189_afe_enable_clk(struct mtk_base_afe *afe, struct clk *clk)
+{
+	int ret;
+
+	if (clk) {
+		ret = clk_prepare_enable(clk);
+		if (ret) {
+			dev_dbg(afe->dev, "failed to enable clk\n");
+			return ret;
+		}
+	} else {
+		dev_dbg(afe->dev, "NULL clk\n");
+	}
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mt8189_afe_enable_clk);
+
+void mt8189_afe_disable_clk(struct mtk_base_afe *afe, struct clk *clk)
+{
+	if (clk)
+		clk_disable_unprepare(clk);
+	else
+		dev_dbg(afe->dev, "NULL clk\n");
+}
+EXPORT_SYMBOL_GPL(mt8189_afe_disable_clk);
+
+static int mt8189_afe_set_clk_rate(struct mtk_base_afe *afe, struct clk *clk,
+				   unsigned int rate)
+{
+	int ret;
+
+	if (clk) {
+		ret = clk_set_rate(clk, rate);
+		if (ret) {
+			dev_dbg(afe->dev, "failed to set clk rate\n");
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int mt8189_afe_set_clk_parent(struct mtk_base_afe *afe, struct clk *clk,
+				     struct clk *parent)
+{
+	int ret;
+
+	if (clk && parent) {
+		ret = clk_set_parent(clk, parent);
+		if (ret) {
+			dev_dbg(afe->dev, "failed to set clk parent %d\n", ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static unsigned int get_top_cg_reg(unsigned int cg_type)
+{
+	switch (cg_type) {
+	case MT8189_AUDIO_26M_EN_ON:
+	case MT8189_AUDIO_F3P25M_EN_ON:
+	case MT8189_AUDIO_APLL1_EN_ON:
+	case MT8189_AUDIO_APLL2_EN_ON:
+		return AUDIO_ENGEN_CON0;
+	case MT8189_CG_AUDIO_HOPPING_CK:
+	case MT8189_CG_AUDIO_F26M_CK:
+	case MT8189_CG_APLL1_CK:
+	case MT8189_CG_APLL2_CK:
+	case MT8189_PDN_APLL_TUNER2:
+	case MT8189_PDN_APLL_TUNER1:
+		return AUDIO_TOP_CON4;
+	default:
+		return 0;
+	}
+}
+
+static unsigned int get_top_cg_mask(unsigned int cg_type)
+{
+	switch (cg_type) {
+	case MT8189_AUDIO_26M_EN_ON:
+		return AUDIO_26M_EN_ON_MASK_SFT;
+	case MT8189_AUDIO_F3P25M_EN_ON:
+		return AUDIO_F3P25M_EN_ON_MASK_SFT;
+	case MT8189_AUDIO_APLL1_EN_ON:
+		return AUDIO_APLL1_EN_ON_MASK_SFT;
+	case MT8189_AUDIO_APLL2_EN_ON:
+		return AUDIO_APLL2_EN_ON_MASK_SFT;
+	case MT8189_CG_AUDIO_HOPPING_CK:
+		return CG_AUDIO_HOPPING_CK_MASK_SFT;
+	case MT8189_CG_AUDIO_F26M_CK:
+		return CG_AUDIO_F26M_CK_MASK_SFT;
+	case MT8189_CG_APLL1_CK:
+		return CG_APLL1_CK_MASK_SFT;
+	case MT8189_CG_APLL2_CK:
+		return CG_APLL2_CK_MASK_SFT;
+	case MT8189_PDN_APLL_TUNER2:
+		return PDN_APLL_TUNER2_MASK_SFT;
+	case MT8189_PDN_APLL_TUNER1:
+		return PDN_APLL_TUNER1_MASK_SFT;
+	default:
+		return 0;
+	}
+}
+
+static unsigned int get_top_cg_on_val(unsigned int cg_type)
+{
+	switch (cg_type) {
+	case MT8189_AUDIO_26M_EN_ON:
+	case MT8189_AUDIO_F3P25M_EN_ON:
+	case MT8189_AUDIO_APLL1_EN_ON:
+	case MT8189_AUDIO_APLL2_EN_ON:
+		return get_top_cg_mask(cg_type);
+	case MT8189_CG_AUDIO_HOPPING_CK:
+	case MT8189_CG_AUDIO_F26M_CK:
+	case MT8189_CG_APLL1_CK:
+	case MT8189_CG_APLL2_CK:
+	case MT8189_PDN_APLL_TUNER2:
+	case MT8189_PDN_APLL_TUNER1:
+		return 0;
+	default:
+		return 0;
+	}
+}
+
+static unsigned int get_top_cg_off_val(unsigned int cg_type)
+{
+	switch (cg_type) {
+	case MT8189_AUDIO_26M_EN_ON:
+	case MT8189_AUDIO_F3P25M_EN_ON:
+	case MT8189_AUDIO_APLL1_EN_ON:
+	case MT8189_AUDIO_APLL2_EN_ON:
+		return 0;
+	case MT8189_CG_AUDIO_HOPPING_CK:
+	case MT8189_CG_AUDIO_F26M_CK:
+	case MT8189_CG_APLL1_CK:
+	case MT8189_CG_APLL2_CK:
+	case MT8189_PDN_APLL_TUNER2:
+	case MT8189_PDN_APLL_TUNER1:
+		return get_top_cg_mask(cg_type);
+	default:
+		return get_top_cg_mask(cg_type);
+	}
+}
+
+static int mt8189_afe_enable_top_cg(struct mtk_base_afe *afe, unsigned int cg_type)
+{
+	unsigned int reg = get_top_cg_reg(cg_type);
+	unsigned int mask = get_top_cg_mask(cg_type);
+	unsigned int val = get_top_cg_on_val(cg_type);
+
+	if (!afe->regmap) {
+		dev_warn(afe->dev, "skip regmap\n");
+		return 0;
+	}
+
+	dev_dbg(afe->dev, "reg: 0x%x, mask: 0x%x, val: 0x%x\n", reg, mask, val);
+
+	return regmap_update_bits(afe->regmap, reg, mask, val);
+}
+
+static void mt8189_afe_disable_top_cg(struct mtk_base_afe *afe, unsigned int cg_type)
+{
+	unsigned int reg = get_top_cg_reg(cg_type);
+	unsigned int mask = get_top_cg_mask(cg_type);
+	unsigned int val = get_top_cg_off_val(cg_type);
+
+	if (!afe->regmap) {
+		dev_warn(afe->dev, "skip regmap\n");
+		return;
+	}
+
+	dev_dbg(afe->dev, "reg: 0x%x, mask: 0x%x, val: 0x%x\n", reg, mask, val);
+	regmap_update_bits(afe->regmap, reg, mask, val);
+}
+
+static int apll1_mux_setting(struct mtk_base_afe *afe, bool enable)
+{
+	struct mt8189_afe_private *afe_priv = afe->platform_priv;
+	int ret;
+
+	dev_dbg(afe->dev, "enable: %d\n", enable);
+
+	if (enable) {
+		ret = mt8189_afe_enable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUD_1]);
+		if (ret)
+			return ret;
+
+		ret = mt8189_afe_set_clk_parent(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUD_1],
+						afe_priv->clk[MT8189_CLK_TOP_APLL1_CK]);
+		if (ret)
+			goto clk_ck_mux_aud1_parent_err;
+
+		/* 180.6336 / 4 = 45.1584MHz */
+		ret = mt8189_afe_enable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUD_ENG1]);
+		if (ret)
+			goto clk_ck_mux_eng1_err;
+
+		ret = mt8189_afe_set_clk_parent(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUD_ENG1],
+						afe_priv->clk[MT8189_CLK_TOP_APLL1_D4]);
+		if (ret)
+			goto clk_ck_mux_eng1_parent_err;
+
+		ret = mt8189_afe_enable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIO_H]);
+		if (ret)
+			goto clk_ck_mux_audio_h_err;
+
+		ret = mt8189_afe_set_clk_parent(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIO_H],
+						afe_priv->clk[MT8189_CLK_TOP_APLL1_CK]);
+		if (ret)
+			goto clk_ck_mux_audio_h_parent_err;
+	} else {
+		mt8189_afe_set_clk_parent(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUD_ENG1],
+					  afe_priv->clk[MT8189_CLK_TOP_CLK26M]);
+
+		mt8189_afe_disable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUD_ENG1]);
+
+		mt8189_afe_set_clk_parent(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUD_1],
+					  afe_priv->clk[MT8189_CLK_TOP_CLK26M]);
+
+		mt8189_afe_disable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUD_1]);
+		mt8189_afe_set_clk_parent(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIO_H],
+					  afe_priv->clk[MT8189_CLK_TOP_CLK26M]);
+		mt8189_afe_disable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIO_H]);
+	}
+
+	return 0;
+
+clk_ck_mux_audio_h_parent_err:
+	mt8189_afe_disable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIO_H]);
+clk_ck_mux_audio_h_err:
+	mt8189_afe_set_clk_parent(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUD_ENG1],
+				  afe_priv->clk[MT8189_CLK_TOP_CLK26M]);
+clk_ck_mux_eng1_parent_err:
+	mt8189_afe_disable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUD_ENG1]);
+clk_ck_mux_eng1_err:
+	mt8189_afe_set_clk_parent(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUD_1],
+				  afe_priv->clk[MT8189_CLK_TOP_CLK26M]);
+clk_ck_mux_aud1_parent_err:
+	mt8189_afe_disable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUD_1]);
+
+	return ret;
+}
+
+static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
+{
+	struct mt8189_afe_private *afe_priv = afe->platform_priv;
+	int ret;
+
+	dev_dbg(afe->dev, "enable: %d\n", enable);
+
+	if (enable) {
+		ret = mt8189_afe_enable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUD_2]);
+		if (ret)
+			return ret;
+
+		ret = mt8189_afe_set_clk_parent(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUD_2],
+						afe_priv->clk[MT8189_CLK_TOP_APLL2_CK]);
+		if (ret)
+			goto clk_ck_mux_aud2_parent_err;
+
+		/* 196.608 / 4 = 49.152MHz */
+		ret = mt8189_afe_enable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUD_ENG2]);
+		if (ret)
+			goto clk_ck_mux_eng2_err;
+
+		ret = mt8189_afe_set_clk_parent(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUD_ENG2],
+						afe_priv->clk[MT8189_CLK_TOP_APLL2_D4]);
+		if (ret)
+			goto clk_ck_mux_eng2_parent_err;
+
+		ret = mt8189_afe_enable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIO_H]);
+		if (ret)
+			goto clk_ck_mux_audio_h_err;
+
+		ret = mt8189_afe_set_clk_parent(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIO_H],
+						afe_priv->clk[MT8189_CLK_TOP_APLL2_CK]);
+		if (ret)
+			goto clk_ck_mux_audio_h_parent_err;
+	} else {
+		mt8189_afe_set_clk_parent(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUD_ENG2],
+					  afe_priv->clk[MT8189_CLK_TOP_CLK26M]);
+
+		mt8189_afe_disable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUD_ENG2]);
+
+		mt8189_afe_set_clk_parent(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUD_2],
+					  afe_priv->clk[MT8189_CLK_TOP_CLK26M]);
+
+		mt8189_afe_disable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUD_2]);
+		mt8189_afe_set_clk_parent(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIO_H],
+					  afe_priv->clk[MT8189_CLK_TOP_CLK26M]);
+		mt8189_afe_disable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIO_H]);
+	}
+
+	return 0;
+
+clk_ck_mux_audio_h_parent_err:
+	mt8189_afe_disable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIO_H]);
+clk_ck_mux_audio_h_err:
+	mt8189_afe_set_clk_parent(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUD_ENG2],
+				  afe_priv->clk[MT8189_CLK_TOP_CLK26M]);
+clk_ck_mux_eng2_parent_err:
+	mt8189_afe_disable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUD_ENG2]);
+clk_ck_mux_eng2_err:
+	mt8189_afe_set_clk_parent(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUD_2],
+				  afe_priv->clk[MT8189_CLK_TOP_CLK26M]);
+clk_ck_mux_aud2_parent_err:
+	mt8189_afe_disable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUD_2]);
+
+	return ret;
+}
+
+static int mt8189_afe_disable_apll(struct mtk_base_afe *afe)
+{
+	struct mt8189_afe_private *afe_priv = afe->platform_priv;
+	int ret;
+
+	ret = mt8189_afe_enable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIO_H]);
+	if (ret)
+		return ret;
+
+	ret = mt8189_afe_enable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUD_1]);
+	if (ret)
+		goto clk_ck_mux_aud1_err;
+
+	ret = mt8189_afe_set_clk_parent(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUD_1],
+					afe_priv->clk[MT8189_CLK_TOP_CLK26M]);
+	if (ret)
+		goto clk_ck_mux_aud1_parent_err;
+
+	ret = mt8189_afe_enable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUD_2]);
+	if (ret)
+		goto clk_ck_mux_aud2_err;
+
+	ret = mt8189_afe_set_clk_parent(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUD_2],
+					afe_priv->clk[MT8189_CLK_TOP_CLK26M]);
+	if (ret)
+		goto clk_ck_mux_aud2_parent_err;
+
+	mt8189_afe_disable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUD_1]);
+	mt8189_afe_disable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUD_2]);
+	mt8189_afe_set_clk_parent(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIO_H],
+				  afe_priv->clk[MT8189_CLK_TOP_CLK26M]);
+	mt8189_afe_disable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIO_H]);
+	return 0;
+
+clk_ck_mux_aud2_parent_err:
+	mt8189_afe_disable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUD_2]);
+clk_ck_mux_aud2_err:
+	mt8189_afe_set_clk_parent(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUD_1],
+				  afe_priv->clk[MT8189_CLK_TOP_APLL1_CK]);
+clk_ck_mux_aud1_parent_err:
+	mt8189_afe_disable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUD_1]);
+clk_ck_mux_aud1_err:
+	mt8189_afe_disable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIO_H]);
+
+	return ret;
+}
+
+static void mt8189_afe_apll_init(struct mtk_base_afe *afe)
+{
+	struct mt8189_afe_private *afe_priv = afe->platform_priv;
+
+	if (!afe_priv->apmixed) {
+		dev_warn(afe->dev, "apmixed regmap is null ptr\n");
+		return;
+	}
+
+	regmap_write(afe_priv->apmixed, APLL1_TUNER_CON0, APLL1_TUNER_CON0_VALUE);
+	regmap_write(afe_priv->apmixed, APLL2_TUNER_CON0, APLL2_TUNER_CON0_VALUE);
+}
+
+int mt8189_apll1_enable(struct mtk_base_afe *afe)
+{
+	int ret;
+
+	/* setting for APLL */
+	ret = apll1_mux_setting(afe, true);
+	if (ret)
+		return ret;
+
+	ret = mt8189_afe_enable_top_cg(afe, MT8189_CG_APLL1_CK);
+	if (ret)
+		return ret;
+
+	ret = mt8189_afe_enable_top_cg(afe, MT8189_PDN_APLL_TUNER1);
+	if (ret)
+		return ret;
+
+	/* sel 44.1kHz:1, apll_div:7, upper bound:3 */
+	regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
+			   XTAL_EN_128FS_SEL_MASK_SFT | APLL_DIV_MASK_SFT | UPPER_BOUND_MASK_SFT,
+			   (0x1 << XTAL_EN_128FS_SEL_SFT) | (7 << APLL_DIV_SFT) |
+			   (3 << UPPER_BOUND_SFT));
+
+	/* apll1 freq tuner enable */
+	regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
+			   FREQ_TUNER_EN_MASK_SFT,
+			   0x1 << FREQ_TUNER_EN_SFT);
+
+	/* audio apll1 on */
+	ret = mt8189_afe_enable_top_cg(afe, MT8189_AUDIO_APLL1_EN_ON);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+void mt8189_apll1_disable(struct mtk_base_afe *afe)
+{
+	/* audio apll1 off */
+	mt8189_afe_disable_top_cg(afe, MT8189_AUDIO_APLL1_EN_ON);
+
+	/* apll1 freq tuner disable */
+	regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
+			   FREQ_TUNER_EN_MASK_SFT,
+			   0x0);
+
+	mt8189_afe_disable_top_cg(afe, MT8189_PDN_APLL_TUNER1);
+	mt8189_afe_disable_top_cg(afe, MT8189_CG_APLL1_CK);
+	apll1_mux_setting(afe, false);
+}
+
+int mt8189_apll2_enable(struct mtk_base_afe *afe)
+{
+	int ret;
+
+	/* setting for APLL */
+	ret = apll2_mux_setting(afe, true);
+	if (ret)
+		return ret;
+
+	ret = mt8189_afe_enable_top_cg(afe, MT8189_CG_APLL2_CK);
+	if (ret)
+		return ret;
+
+	ret = mt8189_afe_enable_top_cg(afe, MT8189_PDN_APLL_TUNER2);
+	if (ret)
+		return ret;
+
+	/* sel 48kHz: 2, apll_div: 7, upper bound: 3*/
+	regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
+			   XTAL_EN_128FS_SEL_MASK_SFT | APLL_DIV_MASK_SFT | UPPER_BOUND_MASK_SFT,
+			   (0x2 << XTAL_EN_128FS_SEL_SFT) | (7 << APLL_DIV_SFT) |
+			   (3 << UPPER_BOUND_SFT));
+
+	/* apll2 freq tuner enable */
+	regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
+			   FREQ_TUNER_EN_MASK_SFT,
+			   0x1 << FREQ_TUNER_EN_SFT);
+
+	/* audio apll2 on */
+	ret = mt8189_afe_enable_top_cg(afe, MT8189_AUDIO_APLL2_EN_ON);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+void mt8189_apll2_disable(struct mtk_base_afe *afe)
+{
+	/* audio apll2 off */
+	mt8189_afe_disable_top_cg(afe, MT8189_AUDIO_APLL2_EN_ON);
+
+	/* apll2 freq tuner disable */
+	regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
+			   FREQ_TUNER_EN_MASK_SFT,
+			   0x0);
+
+	mt8189_afe_disable_top_cg(afe, MT8189_PDN_APLL_TUNER2);
+	mt8189_afe_disable_top_cg(afe, MT8189_CG_APLL2_CK);
+	apll2_mux_setting(afe, false);
+}
+
+int mt8189_get_apll_rate(struct mtk_base_afe *afe, int apll)
+{
+	struct mt8189_afe_private *afe_priv = afe->platform_priv;
+	int clk_id;
+
+	if (apll < MT8189_APLL1 || apll > MT8189_APLL2) {
+		dev_warn(afe->dev, "invalid clk id %d\n", apll);
+		return 0;
+	}
+
+	if (apll == MT8189_APLL1)
+		clk_id = MT8189_CLK_TOP_APLL1_CK;
+	else
+		clk_id = MT8189_CLK_TOP_APLL2_CK;
+
+	return clk_get_rate(afe_priv->clk[clk_id]);
+}
+
+int mt8189_get_apll_by_rate(struct mtk_base_afe *afe, int rate)
+{
+	return (rate % 8000) ? MT8189_APLL1 : MT8189_APLL2;
+}
+
+int mt8189_get_apll_by_name(struct mtk_base_afe *afe, const char *name)
+{
+	if (strcmp(name, APLL1_W_NAME) == 0)
+		return MT8189_APLL1;
+
+	return MT8189_APLL2;
+}
+
+int mt8189_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
+{
+	struct mt8189_afe_private *afe_priv = afe->platform_priv;
+	int apll = mt8189_get_apll_by_rate(afe, rate);
+	int apll_clk_id = apll == MT8189_APLL1 ?
+			  MT8189_CLK_TOP_MUX_AUD_1 : MT8189_CLK_TOP_MUX_AUD_2;
+	int m_sel_id;
+	int div_clk_id;
+	int ret;
+
+	dev_dbg(afe->dev, "mck_id: %d, rate: %d\n", mck_id, rate);
+
+	if (mck_id >= MT8189_MCK_NUM || mck_id < 0)
+		return -EINVAL;
+
+	m_sel_id = mck_div[mck_id].m_sel_id;
+	div_clk_id = mck_div[mck_id].div_clk_id;
+
+	/* select apll */
+	if (m_sel_id >= 0) {
+		ret = mt8189_afe_enable_clk(afe, afe_priv->clk[m_sel_id]);
+		if (ret)
+			return ret;
+
+		ret = mt8189_afe_set_clk_parent(afe, afe_priv->clk[m_sel_id],
+						afe_priv->clk[apll_clk_id]);
+		if (ret)
+			return ret;
+	}
+
+	/* enable div, set rate */
+	if (div_clk_id < 0) {
+		dev_err(afe->dev, "invalid div_clk_id %d\n", div_clk_id);
+		return -EINVAL;
+	}
+
+	ret = mt8189_afe_enable_clk(afe, afe_priv->clk[div_clk_id]);
+	if (ret)
+		return ret;
+
+	ret = mt8189_afe_set_clk_rate(afe, afe_priv->clk[div_clk_id], rate);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+int mt8189_mck_disable(struct mtk_base_afe *afe, int mck_id)
+{
+	struct mt8189_afe_private *afe_priv = afe->platform_priv;
+	int m_sel_id;
+	int div_clk_id;
+
+	dev_dbg(afe->dev, "mck_id: %d.\n", mck_id);
+
+	if (mck_id < 0) {
+		dev_err(afe->dev, "mck_id = %d < 0\n", mck_id);
+		return -EINVAL;
+	}
+
+	m_sel_id = mck_div[mck_id].m_sel_id;
+	div_clk_id = mck_div[mck_id].div_clk_id;
+
+	if (div_clk_id < 0) {
+		dev_err(afe->dev, "div_clk_id = %d < 0\n",
+			div_clk_id);
+		return -EINVAL;
+	}
+
+	mt8189_afe_disable_clk(afe, afe_priv->clk[div_clk_id]);
+
+	if (m_sel_id >= 0)
+		mt8189_afe_disable_clk(afe, afe_priv->clk[m_sel_id]);
+
+	return 0;
+}
+
+int mt8189_afe_enable_reg_rw_clk(struct mtk_base_afe *afe)
+{
+	struct mt8189_afe_private *afe_priv = afe->platform_priv;
+
+	/* bus clock for AFE internal access, like AFE SRAM */
+	mt8189_afe_enable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIOINTBUS]);
+	mt8189_afe_set_clk_parent(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIOINTBUS],
+				  afe_priv->clk[MT8189_CLK_TOP_CLK26M]);
+	/* enable audio clock source */
+	mt8189_afe_enable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIO_H]);
+	mt8189_afe_set_clk_parent(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIO_H],
+				  afe_priv->clk[MT8189_CLK_TOP_CLK26M]);
+
+	return 0;
+}
+
+int mt8189_afe_disable_reg_rw_clk(struct mtk_base_afe *afe)
+{
+	struct mt8189_afe_private *afe_priv = afe->platform_priv;
+
+	mt8189_afe_set_clk_parent(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIO_H],
+				  afe_priv->clk[MT8189_CLK_TOP_CLK26M]);
+	mt8189_afe_disable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIO_H]);
+	mt8189_afe_set_clk_parent(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIOINTBUS],
+				  afe_priv->clk[MT8189_CLK_TOP_CLK26M]);
+	mt8189_afe_disable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIOINTBUS]);
+	return 0;
+}
+
+int mt8189_afe_enable_main_clock(struct mtk_base_afe *afe)
+{
+	return mt8189_afe_enable_top_cg(afe, MT8189_AUDIO_26M_EN_ON);
+}
+
+void mt8189_afe_disable_main_clock(struct mtk_base_afe *afe)
+{
+	mt8189_afe_disable_top_cg(afe, MT8189_AUDIO_26M_EN_ON);
+}
+
+static int mt8189_afe_enable_ao_clock(struct mtk_base_afe *afe)
+{
+	struct mt8189_afe_private *afe_priv = afe->platform_priv;
+	int ret;
+
+	/* Peri clock AO enable */
+	ret = mt8189_afe_enable_clk(afe, afe_priv->clk[MT8189_CLK_PERAO_INTBUS_CK_PERI]);
+	if (ret)
+		return ret;
+
+	ret = mt8189_afe_enable_clk(afe, afe_priv->clk[MT8189_CLK_PERAO_AUDIO_SLV_CK_PERI]);
+	if (ret)
+		goto err_clk_perao_slv;
+
+	ret = mt8189_afe_enable_clk(afe, afe_priv->clk[MT8189_CLK_PERAO_AUDIO_MST_CK_PERI]);
+	if (ret)
+		goto err_clk_perao_mst;
+
+	return 0;
+
+err_clk_perao_mst:
+	mt8189_afe_disable_clk(afe, afe_priv->clk[MT8189_CLK_PERAO_AUDIO_SLV_CK_PERI]);
+err_clk_perao_slv:
+	mt8189_afe_disable_clk(afe, afe_priv->clk[MT8189_CLK_PERAO_INTBUS_CK_PERI]);
+
+	return ret;
+}
+
+int mt8189_init_clock(struct mtk_base_afe *afe)
+{
+	struct mt8189_afe_private *afe_priv = afe->platform_priv;
+	int ret;
+	int i;
+
+	afe_priv->clk = devm_kcalloc(afe->dev, MT8189_CLK_NUM, sizeof(*afe_priv->clk),
+				     GFP_KERNEL);
+	if (!afe_priv->clk)
+		return -ENOMEM;
+
+	for (i = 0; i < MT8189_CLK_NUM; i++) {
+		afe_priv->clk[i] = devm_clk_get(afe->dev, aud_clks[i]);
+		if (IS_ERR(afe_priv->clk[i])) {
+			dev_err(afe->dev, "devm_clk_get %s fail\n", aud_clks[i]);
+			return PTR_ERR(afe_priv->clk[i]);
+		}
+	}
+
+	afe_priv->apmixed = syscon_regmap_lookup_by_phandle(afe->dev->of_node,
+							    "mediatek,apmixedsys");
+	if (IS_ERR(afe_priv->apmixed)) {
+		dev_err(afe->dev, "Cannot find apmixeds\n");
+		return PTR_ERR(afe_priv->apmixed);
+	}
+
+	mt8189_afe_apll_init(afe);
+
+	ret = mt8189_afe_disable_apll(afe);
+	if (ret)
+		return ret;
+
+	ret = mt8189_afe_enable_ao_clock(afe);
+	if (ret)
+		return ret;
+
+	return 0;
+}
diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-clk.h b/sound/soc/mediatek/mt8189/mt8189-afe-clk.h
new file mode 100644
index 000000000..3a7a36d07
--- /dev/null
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-clk.h
@@ -0,0 +1,109 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * mt8189-afe-clk.h  --  Mediatek 8189 afe clock ctrl definition
+ *
+ * Copyright (c) 2025 MediaTek Inc.
+ * Author: Darren Ye <darren.ye@mediatek.com>
+ */
+
+#ifndef _MT8189_AFE_CLOCK_CTRL_H_
+#define _MT8189_AFE_CLOCK_CTRL_H_
+
+#define APLL1_TUNER_CON0 0x0040
+#define APLL2_TUNER_CON0 0x0044
+/* apll1 tuner default value*/
+#define APLL1_TUNER_CON0_VALUE 0x6f28bd4d
+/* apll2 tuner default value + 1*/
+#define APLL2_TUNER_CON0_VALUE 0x78fd5265
+
+#define AP_PLL_CON3 0x000c
+#define PLLEN_ALL 0x0070
+
+#define APLL1_CON0 0x0334
+#define APLL1_CON1 0x0338
+#define APLL1_CON2 0x033c
+#define APLL1_CON4 0x0344
+
+#define APLL2_CON0 0x0348
+#define APLL2_CON1 0x034c
+#define APLL2_CON2 0x0350
+#define APLL2_CON4 0x0358
+
+#define CLK_CFG_6 0x0070
+#define CLK_CFG_7 0x0080
+#define CLK_CFG_9 0x00a0
+#define CLK_CFG_10 0x00b0
+#define CLK_CFG_11 0x00c0
+#define CLK_CFG_12 0x00d0
+#define CLK_CFG_13 0x00e0
+#define CLK_CFG_UPDATE 0x004
+#define CLK_CFG_UPDATE1 0x008
+
+#define CLK_AUDDIV_0 0x0320
+#define CLK_AUDDIV_1 0x0324
+#define CLK_AUDDIV_2 0x0328
+#define CLK_AUDDIV_3 0x0334
+#define CLK_AUDDIV_4 0x0338
+#define CLK_AUDDIV_5 0x033c
+
+/* APLL */
+#define APLL1_W_NAME "APLL1"
+#define APLL2_W_NAME "APLL2"
+
+enum {
+	MT8189_APLL1 = 0,
+	MT8189_APLL2,
+};
+
+enum {
+	MT8189_CLK_TOP_MUX_AUDIOINTBUS,
+	MT8189_CLK_TOP_MUX_AUD_ENG1,
+	MT8189_CLK_TOP_MUX_AUD_ENG2,
+	MT8189_CLK_TOP_MUX_AUDIO_H,
+	/* pll */
+	MT8189_CLK_TOP_APLL1_CK,
+	MT8189_CLK_TOP_APLL2_CK,
+	/* divider */
+	MT8189_CLK_TOP_APLL1_D4,
+	MT8189_CLK_TOP_APLL2_D4,
+	MT8189_CLK_TOP_APLL12_DIV_I2SIN0,
+	MT8189_CLK_TOP_APLL12_DIV_I2SIN1,
+	MT8189_CLK_TOP_APLL12_DIV_FMI2S,
+	MT8189_CLK_TOP_APLL12_DIV_TDMOUT_M,
+	MT8189_CLK_TOP_APLL12_DIV_TDMOUT_B,
+	/* mux */
+	MT8189_CLK_TOP_MUX_AUD_1,
+	MT8189_CLK_TOP_MUX_AUD_2,
+	MT8189_CLK_TOP_I2SIN0_M_SEL,
+	MT8189_CLK_TOP_I2SIN1_M_SEL,
+	MT8189_CLK_TOP_FMI2S_M_SEL,
+	MT8189_CLK_TOP_TDMOUT_M_SEL,
+	/* top 26m */
+	MT8189_CLK_TOP_CLK26M,
+	/* peri */
+	MT8189_CLK_PERAO_AUDIO_SLV_CK_PERI,
+	MT8189_CLK_PERAO_AUDIO_MST_CK_PERI,
+	MT8189_CLK_PERAO_INTBUS_CK_PERI,
+	MT8189_CLK_NUM,
+};
+
+struct mtk_base_afe;
+
+int mt8189_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate);
+int mt8189_mck_disable(struct mtk_base_afe *afe, int mck_id);
+int mt8189_get_apll_rate(struct mtk_base_afe *afe, int apll);
+int mt8189_get_apll_by_rate(struct mtk_base_afe *afe, int rate);
+int mt8189_get_apll_by_name(struct mtk_base_afe *afe, const char *name);
+int mt8189_init_clock(struct mtk_base_afe *afe);
+int mt8189_afe_enable_clk(struct mtk_base_afe *afe, struct clk *clk);
+void mt8189_afe_disable_clk(struct mtk_base_afe *afe, struct clk *clk);
+int mt8189_apll1_enable(struct mtk_base_afe *afe);
+void mt8189_apll1_disable(struct mtk_base_afe *afe);
+int mt8189_apll2_enable(struct mtk_base_afe *afe);
+void mt8189_apll2_disable(struct mtk_base_afe *afe);
+int mt8189_afe_enable_main_clock(struct mtk_base_afe *afe);
+void mt8189_afe_disable_main_clock(struct mtk_base_afe *afe);
+int mt8189_afe_enable_reg_rw_clk(struct mtk_base_afe *afe);
+int mt8189_afe_disable_reg_rw_clk(struct mtk_base_afe *afe);
+
+#endif
-- 
2.46.0

