Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB74233726
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 08:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745569561; cv=none; b=eewrZkwFurxiGq5z0o2nO96RJBPfThWhMZQH24X8RBFZ0bMH6O4PBCEJpYGLmVhgUyVNG7p7wEjH3y45IzVtmau+1je/g5v7Ey9TWfIGRybsRiLml+tapJcEythuoj1stm4JeNNRcS+0XfhnFkaf7O+7Z89yRPbJg+kRjb/YvAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745569561; c=relaxed/simple;
	bh=GLP5hS6CDk/+L4P/jcgnQZSM93friczxp/UuwcJO1+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QDJwA2Iz6sNQEecjFZ/8SVHITWz/c4reGqkl3rPD+mSPNLZ6aajceZByATZzjVuagEF7Itaf690BrupXvHc74JW2B+Cfq9pLgbTfymiFYYJ46MrO3tm9FX2+nyp4JFci2DtEjZab7MDKAnMJAtqqXTvklsjfxQQyzVau/dgiq14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DqQxPDhl; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DqQxPDhl"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-301302a328bso2708169a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 01:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745569559; x=1746174359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1QWTCwsCkON7D9p2NqkONHnIokN090rDxDsakY/JET4=;
        b=DqQxPDhlAD/GLSSLkTkuWg19LqWj39tR6kyTTdf4fLNkxL20wDk9dW+WR/8LfiSdY+
         PqRmIT8JceKzXahj824rI4l5FIqkR9bsx3NzGdS+S6FH1+qoaUoYYHwpZ4u3lUr244M/
         IqBLUo9GKQsW3c8adu/5O4clZPCa053fvpaVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745569559; x=1746174359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1QWTCwsCkON7D9p2NqkONHnIokN090rDxDsakY/JET4=;
        b=II9YTvcvCLzwTPy5cMqfZQ5emKY62aWkigVb/GaML1FIv3Zz1httQE5upXzuzDZrRl
         6to+V32iGgvH9rcgmoEJSe4XelWApD9HN2MbLwu/yBCjwJI+TceO5rpGEv8m9ktCQAdd
         YFS6BDiEeRe0LDxrY0BYpTBS+UFdqh6vSED/bvyqyOxAUqj+s1Adn4utycbXVSaT81bB
         LJn8FzXZ+HWIlNvB0qXsRJqY5bJGBQX4YjE3jiWf+tgKMziz2n5CqYP6wIfsdRpXecGZ
         8SHTdYHspOcxxKWLPKqNrHOZMDR/Onj6mpPiTvGBQa/ktOz6l6IuC6SMCUtrbkDGnwq2
         91sw==
X-Forwarded-Encrypted: i=1; AJvYcCUXHAEA4f9Lbs5bxZcUM+JbihIQKJGDkMi4noezjazrNoRE6e2KZYBYQPt5viy6UKt8N60ttKIYg9dtz2I=@vger.kernel.org
X-Gm-Message-State: AOJu0YygkAlMIgy/NpwW17I26Qcwp/Z/LUfRzqJKwCFhhexFx6WEYV6P
	/33lHeU3//yB/K13x6y4zAfwi7Ey03dsxOYo9HJU+DuCXr8yNcfDv/p34aQeeg==
X-Gm-Gg: ASbGncubzp+0Wf9O87Dh3hmDcN4P0JXfJm7IbwDILNZKt17ZdinS2b5jPAR4anpE6/r
	DYSzgx3UhZI/Er2mbAc4rl267Ybb07UdOPdU3PBllukWNSiebGWkoaS5xOxkqzCwoYwYJ4q6+Z0
	GhMufGWCtQBibKmaHGm6OSV7/6HwW5QMve/05Ec6dN70iQgwzJu40I3LbDr0++wX3rcHBpQPjbB
	Du6OYkZbaPzjs6i/o9qiWhZAdvVKZVo8IJnxK7iPQPLAKVftUpNJuZGTFY968ELQUpFBDu8DBFV
	oZJojU14IJrz/7p7vZJPKXTOJVmjuU6z0P6g6QDetdNcgzEjtLr6TGjBR+E=
X-Google-Smtp-Source: AGHT+IFybSCsPFfxF++sK/Z7wtOshvn1WkPymz+jT8LlvhjQX5Y8GqTxdDgqrS2p9gJDnRLpKRkWMA==
X-Received: by 2002:a17:90b:3941:b0:2ff:69d4:6fe2 with SMTP id 98e67ed59e1d1-309f7df2d4bmr2675303a91.16.1745569558786;
        Fri, 25 Apr 2025 01:25:58 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:4b10:d9aa:98d0:5bb5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f77417d6sm1019179a91.4.2025.04.25.01.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 01:25:58 -0700 (PDT)
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
Subject: [PATCH 1/3] ASoC: mediatek: mt8183-afe-pcm: Shorten memif_data table using macros
Date: Fri, 25 Apr 2025 16:25:48 +0800
Message-ID: <20250425082551.1467042-2-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.850.g28803427d3-goog
In-Reply-To: <20250425082551.1467042-1-wenst@chromium.org>
References: <20250425082551.1467042-1-wenst@chromium.org>
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
---
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 288 +++++----------------
 1 file changed, 63 insertions(+), 225 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index d63b7fe19fbf..3e2334e9324b 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -426,232 +426,70 @@ static const struct snd_soc_component_driver mt8183_afe_pcm_dai_component = {
 	.name = "mt8183-afe-pcm-dai",
 };
 
+#define MT8183_MEMIF_BASE(_id, _en_reg, _fs_reg, _mono_reg)    \
+	[MT8183_MEMIF_##_id] = { \
+		.name = #_id,				\
+		.id = MT8183_MEMIF_##_id,		\
+		.reg_ofs_base = AFE_##_id##_BASE,	\
+		.reg_ofs_cur = AFE_##_id##_CUR,		\
+		.reg_ofs_end = AFE_##_id##_END,		\
+		.reg_ofs_base_msb = AFE_##_id##_BASE_MSB,	\
+		.reg_ofs_cur_msb = AFE_##_id##_CUR_MSB,	\
+		.reg_ofs_end_msb = AFE_##_id##_END_MSB,	\
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
+#define AFE_VUL12_BASE_MSB	AFE_VUL_D2_BASE_MSB
+#define AFE_VUL12_CUR_MSB	AFE_VUL_D2_CUR_MSB
+#define AFE_VUL12_END_MSB	AFE_VUL_D2_END_MSB
+#define AWB2_HD_ALIGN_SFT	AWB2_ALIGN_SFT
+#define VUL12_DATA_SFT		VUL12_MONO_SFT
+#define AFE_HDMI_BASE		AFE_HDMI_OUT_BASE
+#define AFE_HDMI_CUR		AFE_HDMI_OUT_CUR
+#define AFE_HDMI_END		AFE_HDMI_OUT_END
+#define AFE_HDMI_BASE_MSB	AFE_HDMI_OUT_BASE_MSB
+#define AFE_HDMI_CUR_MSB	AFE_HDMI_OUT_CUR_MSB
+#define AFE_HDMI_END_MSB	AFE_HDMI_OUT_END_MSB
+
 static const struct mtk_base_memif_data memif_data[MT8183_MEMIF_NUM] = {
-	[MT8183_MEMIF_DL1] = {
-		.name = "DL1",
-		.id = MT8183_MEMIF_DL1,
-		.reg_ofs_base = AFE_DL1_BASE,
-		.reg_ofs_cur = AFE_DL1_CUR,
-		.reg_ofs_end = AFE_DL1_END,
-		.reg_ofs_base_msb = AFE_DL1_BASE_MSB,
-		.reg_ofs_cur_msb = AFE_DL1_CUR_MSB,
-		.reg_ofs_end_msb = AFE_DL1_END_MSB,
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
-		.reg_ofs_end = AFE_DL2_END,
-		.reg_ofs_base_msb = AFE_DL2_BASE_MSB,
-		.reg_ofs_cur_msb = AFE_DL2_CUR_MSB,
-		.reg_ofs_end_msb = AFE_DL2_END_MSB,
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
-		.reg_ofs_end = AFE_DL3_END,
-		.reg_ofs_base_msb = AFE_DL3_BASE_MSB,
-		.reg_ofs_cur_msb = AFE_DL3_CUR_MSB,
-		.reg_ofs_end_msb = AFE_DL3_END_MSB,
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
-		.reg_ofs_end = AFE_VUL2_END,
-		.reg_ofs_base_msb = AFE_VUL2_BASE_MSB,
-		.reg_ofs_cur_msb = AFE_VUL2_CUR_MSB,
-		.reg_ofs_end_msb = AFE_VUL2_END_MSB,
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
-		.reg_ofs_end = AFE_AWB_END,
-		.reg_ofs_base_msb = AFE_AWB_BASE_MSB,
-		.reg_ofs_cur_msb = AFE_AWB_CUR_MSB,
-		.reg_ofs_end_msb = AFE_AWB_END_MSB,
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
-		.reg_ofs_end = AFE_AWB2_END,
-		.reg_ofs_base_msb = AFE_AWB2_BASE_MSB,
-		.reg_ofs_cur_msb = AFE_AWB2_CUR_MSB,
-		.reg_ofs_end_msb = AFE_AWB2_END_MSB,
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
-		.reg_ofs_end = AFE_VUL_D2_END,
-		.reg_ofs_base_msb = AFE_VUL_D2_BASE_MSB,
-		.reg_ofs_cur_msb = AFE_VUL_D2_CUR_MSB,
-		.reg_ofs_end_msb = AFE_VUL_D2_END_MSB,
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
-		.reg_ofs_end = AFE_MOD_DAI_END,
-		.reg_ofs_base_msb = AFE_MOD_DAI_BASE_MSB,
-		.reg_ofs_cur_msb = AFE_MOD_DAI_CUR_MSB,
-		.reg_ofs_end_msb = AFE_MOD_DAI_END_MSB,
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
-		.reg_ofs_end = AFE_HDMI_OUT_END,
-		.reg_ofs_base_msb = AFE_HDMI_OUT_BASE_MSB,
-		.reg_ofs_cur_msb = AFE_HDMI_OUT_CUR_MSB,
-		.reg_ofs_end_msb = AFE_HDMI_OUT_END_MSB,
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
2.49.0.850.g28803427d3-goog

