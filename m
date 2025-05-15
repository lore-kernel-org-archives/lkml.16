Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA18327E7F3
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 07:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747294717; cv=none; b=DIsX0VdiX4BhuOwC6rebe5lEv2T+SBuHbCugRHIELe73kt9FQYU0LvMP9FIIU0YA8g6UmvgWW3rkdqnJrNUD8h71E94F4q8GrfVOt7vGE76oDQ24r3rqbl8+Rz5CUhP/sMkeIj6BUNarexcezMdhJTwX/isWKaQ0oJFCaKdrDpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747294717; c=relaxed/simple;
	bh=Ingfuo0h6fBMePKfCdsejuw4gdmtDKy4x/AMpfDfe4M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qt/oKnw/8lxWTTqN4fuR/V32NamX4etfVGbXXy5JmvBhgVUWRS/epImH814qxJXekl25MXMLKf1u0ev57r6KnRoZiIFWFxgbu49cjSkXkKZ6vm/kHMS6qL1ajgKH16835ch88CaG/r/mwhmZbbrhOyuwOih0EDz8XujuwxtDRdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=U02+W4be; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="U02+W4be"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22e6880d106so4506685ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 00:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747294715; x=1747899515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=79ms8c2FnuEoP2QG4BxhZzqQ6Y78M53niO7yuu/SbRQ=;
        b=U02+W4bezyHzv8CdaXcO7Uzgaws0HEF3r/AnUjaEENHLkdp+mBHfYeYAPX4AZPEfNR
         kNhTLlCp6yzYH8kjOEmyzBm9WXryeGcGeZRrB8EAStVHx2mhvkAL/Qj/f0n5S8vYwAXH
         aQZDnKjkKKRQln3zYolSPVaLVymFm2X6CNVyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747294715; x=1747899515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=79ms8c2FnuEoP2QG4BxhZzqQ6Y78M53niO7yuu/SbRQ=;
        b=ChLfk04CQkyMkc5ri5YXeojsgKogU9cNn/fvjOSjOwwp2RA8M3S9Tqq6uk6R4Lb6T+
         nXi+wwYH4Tncdw58rVeYc7Fexi5eNlGZENWWPQm5LHv+BTdT0w29pknMVHs5Xuc8FPCr
         r2nxXKVlFj+9ihedX5lAfZTgJ/QTZvIVVi/kNFHXqp8oAWIE9D5wFkKYPtUHMnAjfMOz
         ZWgn1TWDVGgxQokaTxUEGUYG0VDiWgUcOPhSVyuziUK9Q5aGYWtl4mgTWsIjglZBrP/P
         F3OvbGuULoUNOwnhGQihbNQloZ5zl5LPCEs61xmR2mDpBjJNhXfyG2ydbr5FzPQDW9hS
         cF5A==
X-Forwarded-Encrypted: i=1; AJvYcCXMgu+skrqM1QfMByDB13mFoKybkxDL5JIxr7QEVnPu4sVSRGJHApxiVX+lXbX0JmWAaFqp96/t6qpX2qQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9vMh3hpPcACWbu4DLKJvsxPDhNgkWNebsxaTkDOgTRBtMuOnN
	5z22IXRwja0vjHHsKtl9TAf4EbP/W+gmJxZTkgKZEe1ahqtmWol4J94aTTwU5A==
X-Gm-Gg: ASbGncvugwDoW4YVvHIby7Dp0AfgZf/bjc9oHNd2tYrYOjMzwOWkO7Jyl4jrvlQYsuF
	qPcn4kTkyg2m+aHrgC8a0dbwjES7ruBWjg4fbuyui7apFE6LgrPG/RObTogu0WrLVc4dW20OUIR
	eZkF9/DJq1A2PXUn1NIplrjO0QWgky6wlVBPnv2+HDGIWKwMlTQ7O6wpEO8qCXTn2iR0Tp66bZn
	SB2GthI7Pv1iAxOtFqYUId7D9W0EZ5TXKtNDNFe0IDRBm1zhhYWV64UmyCXDNWB7l7v/1ybxNIK
	f3lyk4dHco0QLkxZemyxC1LYuKe+ZVysYYN/KdpoqsIpa/OtMY5HMrSd6TEP4EzJeQTy+g==
X-Google-Smtp-Source: AGHT+IE+oWnqezIF5QTQ7EIBKtLTRzikzPqtq43CZyZeO14t1RTBDnr586S2uXPfRLUc6SCZYpMdRg==
X-Received: by 2002:a17:903:1984:b0:21f:6a36:7bf3 with SMTP id d9443c01a7336-231b5e67c01mr20669115ad.12.1747294715147;
        Thu, 15 May 2025 00:38:35 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:c43a:aaea:5f52:5763])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271f61sm109750825ad.142.2025.05.15.00.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 00:38:34 -0700 (PDT)
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
Subject: [PATCH v2 1/3] ASoC: mediatek: mt8183-afe-pcm: Shorten memif_data table using macros
Date: Thu, 15 May 2025 15:38:21 +0800
Message-ID: <20250515073825.4155297-2-wenst@chromium.org>
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

The memif_data table describes all the supported PCM channels for the
audio frontend. Most of the fields are either the same or can be derived
from the interface's name. This results in a very long table (in source
code) that can be shortened with macros.

Do just that. Some "convenience" macros were added to cover non-existent
register fields that would otherwise require multiple layers of macros
to handle.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
Changes since v1:
- Rebased onto -next, dropping bits for DMA address MSB registers
---
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 243 +++++----------------
 1 file changed, 54 insertions(+), 189 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index d083b4bf0f95..a4bed8e335d8 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -424,196 +424,61 @@ static const struct snd_soc_component_driver mt8183_afe_pcm_dai_component = {
 	.name = "mt8183-afe-pcm-dai",
 };
 
+#define MT8183_MEMIF_BASE(_id, _en_reg, _fs_reg, _mono_reg)    \
+	[MT8183_MEMIF_##_id] = { \
+		.name = #_id,				\
+		.id = MT8183_MEMIF_##_id,		\
+		.reg_ofs_base = AFE_##_id##_BASE,	\
+		.reg_ofs_cur = AFE_##_id##_CUR,		\
+		.reg_ofs_end = AFE_##_id##_END,		\
+		.fs_reg = (_fs_reg),			\
+		.fs_shift = _id##_MODE_SFT,		\
+		.fs_maskbit = _id##_MODE_MASK,		\
+		.mono_reg = (_mono_reg),		\
+		.mono_shift = _id##_DATA_SFT,		\
+		.enable_reg = (_en_reg),		\
+		.enable_shift = _id##_ON_SFT,		\
+		.hd_reg = AFE_MEMIF_HD_MODE,		\
+		.hd_align_reg = AFE_MEMIF_HDALIGN,	\
+		.hd_shift = _id##_HD_SFT,		\
+		.hd_align_mshift = _id##_HD_ALIGN_SFT,	\
+		.agent_disable_reg = -1,		\
+		.agent_disable_shift = -1,		\
+		.msb_reg = -1,				\
+		.msb_shift = -1,			\
+	}
+
+#define MT8183_MEMIF(_id, _fs_reg, _mono_reg) \
+		MT8183_MEMIF_BASE(_id, AFE_DAC_CON0, _fs_reg, _mono_reg)
+
+/* For convenience with macros: missing register fields */
+#define MOD_DAI_DATA_SFT	-1
+#define HDMI_MODE_SFT		-1
+#define HDMI_MODE_MASK		-1
+#define HDMI_DATA_SFT		-1
+#define HDMI_ON_SFT		-1
+
+/* For convenience with macros: register name differences */
+#define AFE_VUL12_BASE		AFE_VUL_D2_BASE
+#define AFE_VUL12_CUR		AFE_VUL_D2_CUR
+#define AFE_VUL12_END		AFE_VUL_D2_END
+#define AWB2_HD_ALIGN_SFT	AWB2_ALIGN_SFT
+#define VUL12_DATA_SFT		VUL12_MONO_SFT
+#define AFE_HDMI_BASE		AFE_HDMI_OUT_BASE
+#define AFE_HDMI_CUR		AFE_HDMI_OUT_CUR
+#define AFE_HDMI_END		AFE_HDMI_OUT_END
+
 static const struct mtk_base_memif_data memif_data[MT8183_MEMIF_NUM] = {
-	[MT8183_MEMIF_DL1] = {
-		.name = "DL1",
-		.id = MT8183_MEMIF_DL1,
-		.reg_ofs_base = AFE_DL1_BASE,
-		.reg_ofs_cur = AFE_DL1_CUR,
-		.fs_reg = AFE_DAC_CON1,
-		.fs_shift = DL1_MODE_SFT,
-		.fs_maskbit = DL1_MODE_MASK,
-		.mono_reg = AFE_DAC_CON1,
-		.mono_shift = DL1_DATA_SFT,
-		.enable_reg = AFE_DAC_CON0,
-		.enable_shift = DL1_ON_SFT,
-		.hd_reg = AFE_MEMIF_HD_MODE,
-		.hd_align_reg = AFE_MEMIF_HDALIGN,
-		.hd_shift = DL1_HD_SFT,
-		.hd_align_mshift = DL1_HD_ALIGN_SFT,
-		.agent_disable_reg = -1,
-		.agent_disable_shift = -1,
-		.msb_reg = -1,
-		.msb_shift = -1,
-	},
-	[MT8183_MEMIF_DL2] = {
-		.name = "DL2",
-		.id = MT8183_MEMIF_DL2,
-		.reg_ofs_base = AFE_DL2_BASE,
-		.reg_ofs_cur = AFE_DL2_CUR,
-		.fs_reg = AFE_DAC_CON1,
-		.fs_shift = DL2_MODE_SFT,
-		.fs_maskbit = DL2_MODE_MASK,
-		.mono_reg = AFE_DAC_CON1,
-		.mono_shift = DL2_DATA_SFT,
-		.enable_reg = AFE_DAC_CON0,
-		.enable_shift = DL2_ON_SFT,
-		.hd_reg = AFE_MEMIF_HD_MODE,
-		.hd_align_reg = AFE_MEMIF_HDALIGN,
-		.hd_shift = DL2_HD_SFT,
-		.hd_align_mshift = DL2_HD_ALIGN_SFT,
-		.agent_disable_reg = -1,
-		.agent_disable_shift = -1,
-		.msb_reg = -1,
-		.msb_shift = -1,
-	},
-	[MT8183_MEMIF_DL3] = {
-		.name = "DL3",
-		.id = MT8183_MEMIF_DL3,
-		.reg_ofs_base = AFE_DL3_BASE,
-		.reg_ofs_cur = AFE_DL3_CUR,
-		.fs_reg = AFE_DAC_CON2,
-		.fs_shift = DL3_MODE_SFT,
-		.fs_maskbit = DL3_MODE_MASK,
-		.mono_reg = AFE_DAC_CON1,
-		.mono_shift = DL3_DATA_SFT,
-		.enable_reg = AFE_DAC_CON0,
-		.enable_shift = DL3_ON_SFT,
-		.hd_reg = AFE_MEMIF_HD_MODE,
-		.hd_align_reg = AFE_MEMIF_HDALIGN,
-		.hd_shift = DL3_HD_SFT,
-		.hd_align_mshift = DL3_HD_ALIGN_SFT,
-		.agent_disable_reg = -1,
-		.agent_disable_shift = -1,
-		.msb_reg = -1,
-		.msb_shift = -1,
-	},
-	[MT8183_MEMIF_VUL2] = {
-		.name = "VUL2",
-		.id = MT8183_MEMIF_VUL2,
-		.reg_ofs_base = AFE_VUL2_BASE,
-		.reg_ofs_cur = AFE_VUL2_CUR,
-		.fs_reg = AFE_DAC_CON2,
-		.fs_shift = VUL2_MODE_SFT,
-		.fs_maskbit = VUL2_MODE_MASK,
-		.mono_reg = AFE_DAC_CON2,
-		.mono_shift = VUL2_DATA_SFT,
-		.enable_reg = AFE_DAC_CON0,
-		.enable_shift = VUL2_ON_SFT,
-		.hd_reg = AFE_MEMIF_HD_MODE,
-		.hd_align_reg = AFE_MEMIF_HDALIGN,
-		.hd_shift = VUL2_HD_SFT,
-		.hd_align_mshift = VUL2_HD_ALIGN_SFT,
-		.agent_disable_reg = -1,
-		.agent_disable_shift = -1,
-		.msb_reg = -1,
-		.msb_shift = -1,
-	},
-	[MT8183_MEMIF_AWB] = {
-		.name = "AWB",
-		.id = MT8183_MEMIF_AWB,
-		.reg_ofs_base = AFE_AWB_BASE,
-		.reg_ofs_cur = AFE_AWB_CUR,
-		.fs_reg = AFE_DAC_CON1,
-		.fs_shift = AWB_MODE_SFT,
-		.fs_maskbit = AWB_MODE_MASK,
-		.mono_reg = AFE_DAC_CON1,
-		.mono_shift = AWB_DATA_SFT,
-		.enable_reg = AFE_DAC_CON0,
-		.enable_shift = AWB_ON_SFT,
-		.hd_reg = AFE_MEMIF_HD_MODE,
-		.hd_align_reg = AFE_MEMIF_HDALIGN,
-		.hd_shift = AWB_HD_SFT,
-		.hd_align_mshift = AWB_HD_ALIGN_SFT,
-		.agent_disable_reg = -1,
-		.agent_disable_shift = -1,
-		.msb_reg = -1,
-		.msb_shift = -1,
-	},
-	[MT8183_MEMIF_AWB2] = {
-		.name = "AWB2",
-		.id = MT8183_MEMIF_AWB2,
-		.reg_ofs_base = AFE_AWB2_BASE,
-		.reg_ofs_cur = AFE_AWB2_CUR,
-		.fs_reg = AFE_DAC_CON2,
-		.fs_shift = AWB2_MODE_SFT,
-		.fs_maskbit = AWB2_MODE_MASK,
-		.mono_reg = AFE_DAC_CON2,
-		.mono_shift = AWB2_DATA_SFT,
-		.enable_reg = AFE_DAC_CON0,
-		.enable_shift = AWB2_ON_SFT,
-		.hd_reg = AFE_MEMIF_HD_MODE,
-		.hd_align_reg = AFE_MEMIF_HDALIGN,
-		.hd_shift = AWB2_HD_SFT,
-		.hd_align_mshift = AWB2_ALIGN_SFT,
-		.agent_disable_reg = -1,
-		.agent_disable_shift = -1,
-		.msb_reg = -1,
-		.msb_shift = -1,
-	},
-	[MT8183_MEMIF_VUL12] = {
-		.name = "VUL12",
-		.id = MT8183_MEMIF_VUL12,
-		.reg_ofs_base = AFE_VUL_D2_BASE,
-		.reg_ofs_cur = AFE_VUL_D2_CUR,
-		.fs_reg = AFE_DAC_CON0,
-		.fs_shift = VUL12_MODE_SFT,
-		.fs_maskbit = VUL12_MODE_MASK,
-		.mono_reg = AFE_DAC_CON0,
-		.mono_shift = VUL12_MONO_SFT,
-		.enable_reg = AFE_DAC_CON0,
-		.enable_shift = VUL12_ON_SFT,
-		.hd_reg = AFE_MEMIF_HD_MODE,
-		.hd_align_reg = AFE_MEMIF_HDALIGN,
-		.hd_shift = VUL12_HD_SFT,
-		.hd_align_mshift = VUL12_HD_ALIGN_SFT,
-		.agent_disable_reg = -1,
-		.agent_disable_shift = -1,
-		.msb_reg = -1,
-		.msb_shift = -1,
-	},
-	[MT8183_MEMIF_MOD_DAI] = {
-		.name = "MOD_DAI",
-		.id = MT8183_MEMIF_MOD_DAI,
-		.reg_ofs_base = AFE_MOD_DAI_BASE,
-		.reg_ofs_cur = AFE_MOD_DAI_CUR,
-		.fs_reg = AFE_DAC_CON1,
-		.fs_shift = MOD_DAI_MODE_SFT,
-		.fs_maskbit = MOD_DAI_MODE_MASK,
-		.mono_reg = -1,
-		.mono_shift = 0,
-		.enable_reg = AFE_DAC_CON0,
-		.enable_shift = MOD_DAI_ON_SFT,
-		.hd_reg = AFE_MEMIF_HD_MODE,
-		.hd_align_reg = AFE_MEMIF_HDALIGN,
-		.hd_shift = MOD_DAI_HD_SFT,
-		.hd_align_mshift = MOD_DAI_HD_ALIGN_SFT,
-		.agent_disable_reg = -1,
-		.agent_disable_shift = -1,
-		.msb_reg = -1,
-		.msb_shift = -1,
-	},
-	[MT8183_MEMIF_HDMI] = {
-		.name = "HDMI",
-		.id = MT8183_MEMIF_HDMI,
-		.reg_ofs_base = AFE_HDMI_OUT_BASE,
-		.reg_ofs_cur = AFE_HDMI_OUT_CUR,
-		.fs_reg = -1,
-		.fs_shift = -1,
-		.fs_maskbit = -1,
-		.mono_reg = -1,
-		.mono_shift = -1,
-		.enable_reg = -1,	/* control in tdm for sync start */
-		.enable_shift = -1,
-		.hd_reg = AFE_MEMIF_HD_MODE,
-		.hd_align_reg = AFE_MEMIF_HDALIGN,
-		.hd_shift = HDMI_HD_SFT,
-		.hd_align_mshift = HDMI_HD_ALIGN_SFT,
-		.agent_disable_reg = -1,
-		.agent_disable_shift = -1,
-		.msb_reg = -1,
-		.msb_shift = -1,
-	},
+	MT8183_MEMIF(DL1, AFE_DAC_CON1, AFE_DAC_CON1),
+	MT8183_MEMIF(DL2, AFE_DAC_CON1, AFE_DAC_CON1),
+	MT8183_MEMIF(DL3, AFE_DAC_CON2, AFE_DAC_CON1),
+	MT8183_MEMIF(VUL2, AFE_DAC_CON2, AFE_DAC_CON2),
+	MT8183_MEMIF(AWB, AFE_DAC_CON1, AFE_DAC_CON1),
+	MT8183_MEMIF(AWB2, AFE_DAC_CON2, AFE_DAC_CON2),
+	MT8183_MEMIF(VUL12, AFE_DAC_CON0, AFE_DAC_CON0),
+	MT8183_MEMIF(MOD_DAI, AFE_DAC_CON1, -1),
+	/* enable control in tdm for sync start */
+	MT8183_MEMIF_BASE(HDMI, -1, -1, -1),
 };
 
 static const struct mtk_base_irq_data irq_data[MT8183_IRQ_NUM] = {
-- 
2.49.0.1045.g170613ef41-goog

