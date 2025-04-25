Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C6A235345
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 08:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745569563; cv=none; b=d3R6xmNpeojqzNDc+OE20P/6OQM5Yo9ekQUs8RNsxs040P/FrXToS3I7x94XsrecsGz4qF5kT3pSZXQ71IyvLhF19p9sqQHuZ/XSJvnNlBso4ltZV+j/HayhMEqBPNkYnKb0yujPViSibnt6g3Rx3K6AtDDKFW7T0WdlChyaoRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745569563; c=relaxed/simple;
	bh=d43mG7XLHUOysc4w/HBnmO/fwY95tEB61g+ax9MdlSA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a+pJUIoerzTlZTqE2q8FfQI8uu7aNUjTtMmMpY0dqVMP65oy0qLUxAVF+2sRQyceHguGe+6j/rbi7tkSHXsq0YSYAHWSnm9C/BFWo7L0k2bQ5xMrz46+zRGTcK/hm4rVKc2YuuAIr4wben46vcsuM77zKTLe2mtOALHJDogFPq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HX0PliiB; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HX0PliiB"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b03bc416962so1402909a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 01:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745569561; x=1746174361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=25qtAe27NbS9Sy8H+gEjhudVwNOOMd+NsbpUa5zlVyE=;
        b=HX0PliiBGkdiJLvZTgUza6hA3vn2Abf+Sozd+fTi3hdbuzaXwWNfYwjXonUP6+YLeP
         xMZdScDapIV+CtRLaOj0Ffaj/uY+uaT7jDkxCOr+CFov7VcwQopD5zbAEk+ULQIc8QAa
         VfnyvD8X5HFlZ1srtDHE92u5U4pZs5cbo68ME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745569561; x=1746174361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=25qtAe27NbS9Sy8H+gEjhudVwNOOMd+NsbpUa5zlVyE=;
        b=DwdVW51pWipGsvHSOi2KNk0hrYvwM2hSuuOmcVXGoNT3Ta/ygbkE7/yP3cFioHr7In
         q8pmn+KkgIOcKvLlj/dKnTlrMc0+zgrpW4KJM0/w1mrtpt72y9avwGa5i5hBjUBKnWI4
         /naM0rf2FJuT1bhaZTew/CBw2L4tZzYI3pqJQFwZVzd41XV7DzSxmaaxxTMDiUMqzqQm
         5Mddz2dKdWtY/GoApAfqnlf1B2BGkQEy+jzmtaxeKY6MCO6+MHyzzsl2Asi+jBYjCq7U
         zjMahlak1l8ijhznwQ7Rf6TIjfd/UgxHtqEwAcXYR0TY8LsjOczyg3agxzgmwewfcTaX
         +51A==
X-Forwarded-Encrypted: i=1; AJvYcCXBp5Y6PVddn8xIsc32KA1/Bqnov0Z1t4CPxnmHbdc5k465dv+FUwnR+1vHDfwktVQwAH/ashR6lbtOmrs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGbwuoNn06B8GAv+WR2hgbcHTXuCgOoe22LFUwfKFTpJt6SS6V
	81MR+Tkr9dBxSJ6hjRgZ4Ysn1krh6gqMNq0wh+pGrf4iv9RRqcpprBDrz958rg==
X-Gm-Gg: ASbGncsKPaI+onnTVpU26+JCmDRfS4B9C3tSnrDHIOovDlqC8aF6ZCUd+4jVT+MZmL8
	LUrxRLEFjJqf0/54YNDJtKeEv8k4EeLtGwV8eHt0sQDGRuRTG8yL0u/2u+2hoCyFjWohC+ovCvy
	pGFhLeOMLek3KWcJVzrPmz6p/0r00Tgl0mstcujQcZHzLya/Zk3f2Y4576PoWVqyvUJv8PiUQWO
	N6hDyZXbYXSR2GpvayYiCkWdwLZJc9nJXywr3TlKklJK4FxiWJ0OpyFs+lKJrVH/0D5UP7cuB7i
	KlcXtAwmABglwbKzm85+K87igggF8EqGybKFIWkVClr29potCWbekbIdhlU=
X-Google-Smtp-Source: AGHT+IHRb1TUeUC4eX4OBKdkwz3OlzDchQGfNMxwnYR0yofVxixYxMjC/RCpY9rv5Oen0VtQF6OBhQ==
X-Received: by 2002:a17:90b:2c8c:b0:2ee:8e75:4aeb with SMTP id 98e67ed59e1d1-309f7de6abdmr2641119a91.17.1745569561318;
        Fri, 25 Apr 2025 01:26:01 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:4b10:d9aa:98d0:5bb5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f77417d6sm1019179a91.4.2025.04.25.01.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 01:26:00 -0700 (PDT)
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
Subject: [PATCH 2/3] ASoC: mediatek: mt8183-afe-pcm: Shorten irq_data table using macros
Date: Fri, 25 Apr 2025 16:25:49 +0800
Message-ID: <20250425082551.1467042-3-wenst@chromium.org>
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

The irq_data table describes all the supported interrupts for the audio
frontend. The parameters are either the same or can be derived from the
interrupt number. This results in a very long table (in source code)
that can be shortened with macros.

Do just that.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 176 ++++-----------------
 1 file changed, 33 insertions(+), 143 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index 3e2334e9324b..5e340e77b9d5 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -492,150 +492,40 @@ static const struct mtk_base_memif_data memif_data[MT8183_MEMIF_NUM] = {
 	MT8183_MEMIF_BASE(HDMI, -1, -1, -1),
 };
 
+#define MT8183_AFE_IRQ_BASE(_id, _fs_reg, _fs_shift, _fs_maskbit)	\
+	[MT8183_IRQ_##_id] = {	\
+		.id = MT8183_IRQ_##_id,			\
+		.irq_cnt_reg = AFE_IRQ_MCU_CNT##_id,	\
+		.irq_cnt_shift = 0,			\
+		.irq_cnt_maskbit = 0x3ffff,		\
+		.irq_fs_reg = _fs_reg,			\
+		.irq_fs_shift = _fs_shift,		\
+		.irq_fs_maskbit = _fs_maskbit,		\
+		.irq_en_reg = AFE_IRQ_MCU_CON0,		\
+		.irq_en_shift = IRQ##_id##_MCU_ON_SFT,	\
+		.irq_clr_reg = AFE_IRQ_MCU_CLR,		\
+		.irq_clr_shift = IRQ##_id##_MCU_CLR_SFT,	\
+	}
+
+#define MT8183_AFE_IRQ(_id) \
+	MT8183_AFE_IRQ_BASE(_id, AFE_IRQ_MCU_CON1 + _id / 8 * 4,	\
+			    IRQ##_id##_MCU_MODE_SFT,	\
+			    IRQ##_id##_MCU_MODE_MASK)
+
+#define MT8183_AFE_IRQ_NOFS(_id) MT8183_AFE_IRQ_BASE(_id, -1, -1, -1)
+
 static const struct mtk_base_irq_data irq_data[MT8183_IRQ_NUM] = {
-	[MT8183_IRQ_0] = {
-		.id = MT8183_IRQ_0,
-		.irq_cnt_reg = AFE_IRQ_MCU_CNT0,
-		.irq_cnt_shift = 0,
-		.irq_cnt_maskbit = 0x3ffff,
-		.irq_fs_reg = AFE_IRQ_MCU_CON1,
-		.irq_fs_shift = IRQ0_MCU_MODE_SFT,
-		.irq_fs_maskbit = IRQ0_MCU_MODE_MASK,
-		.irq_en_reg = AFE_IRQ_MCU_CON0,
-		.irq_en_shift = IRQ0_MCU_ON_SFT,
-		.irq_clr_reg = AFE_IRQ_MCU_CLR,
-		.irq_clr_shift = IRQ0_MCU_CLR_SFT,
-	},
-	[MT8183_IRQ_1] = {
-		.id = MT8183_IRQ_1,
-		.irq_cnt_reg = AFE_IRQ_MCU_CNT1,
-		.irq_cnt_shift = 0,
-		.irq_cnt_maskbit = 0x3ffff,
-		.irq_fs_reg = AFE_IRQ_MCU_CON1,
-		.irq_fs_shift = IRQ1_MCU_MODE_SFT,
-		.irq_fs_maskbit = IRQ1_MCU_MODE_MASK,
-		.irq_en_reg = AFE_IRQ_MCU_CON0,
-		.irq_en_shift = IRQ1_MCU_ON_SFT,
-		.irq_clr_reg = AFE_IRQ_MCU_CLR,
-		.irq_clr_shift = IRQ1_MCU_CLR_SFT,
-	},
-	[MT8183_IRQ_2] = {
-		.id = MT8183_IRQ_2,
-		.irq_cnt_reg = AFE_IRQ_MCU_CNT2,
-		.irq_cnt_shift = 0,
-		.irq_cnt_maskbit = 0x3ffff,
-		.irq_fs_reg = AFE_IRQ_MCU_CON1,
-		.irq_fs_shift = IRQ2_MCU_MODE_SFT,
-		.irq_fs_maskbit = IRQ2_MCU_MODE_MASK,
-		.irq_en_reg = AFE_IRQ_MCU_CON0,
-		.irq_en_shift = IRQ2_MCU_ON_SFT,
-		.irq_clr_reg = AFE_IRQ_MCU_CLR,
-		.irq_clr_shift = IRQ2_MCU_CLR_SFT,
-	},
-	[MT8183_IRQ_3] = {
-		.id = MT8183_IRQ_3,
-		.irq_cnt_reg = AFE_IRQ_MCU_CNT3,
-		.irq_cnt_shift = 0,
-		.irq_cnt_maskbit = 0x3ffff,
-		.irq_fs_reg = AFE_IRQ_MCU_CON1,
-		.irq_fs_shift = IRQ3_MCU_MODE_SFT,
-		.irq_fs_maskbit = IRQ3_MCU_MODE_MASK,
-		.irq_en_reg = AFE_IRQ_MCU_CON0,
-		.irq_en_shift = IRQ3_MCU_ON_SFT,
-		.irq_clr_reg = AFE_IRQ_MCU_CLR,
-		.irq_clr_shift = IRQ3_MCU_CLR_SFT,
-	},
-	[MT8183_IRQ_4] = {
-		.id = MT8183_IRQ_4,
-		.irq_cnt_reg = AFE_IRQ_MCU_CNT4,
-		.irq_cnt_shift = 0,
-		.irq_cnt_maskbit = 0x3ffff,
-		.irq_fs_reg = AFE_IRQ_MCU_CON1,
-		.irq_fs_shift = IRQ4_MCU_MODE_SFT,
-		.irq_fs_maskbit = IRQ4_MCU_MODE_MASK,
-		.irq_en_reg = AFE_IRQ_MCU_CON0,
-		.irq_en_shift = IRQ4_MCU_ON_SFT,
-		.irq_clr_reg = AFE_IRQ_MCU_CLR,
-		.irq_clr_shift = IRQ4_MCU_CLR_SFT,
-	},
-	[MT8183_IRQ_5] = {
-		.id = MT8183_IRQ_5,
-		.irq_cnt_reg = AFE_IRQ_MCU_CNT5,
-		.irq_cnt_shift = 0,
-		.irq_cnt_maskbit = 0x3ffff,
-		.irq_fs_reg = AFE_IRQ_MCU_CON1,
-		.irq_fs_shift = IRQ5_MCU_MODE_SFT,
-		.irq_fs_maskbit = IRQ5_MCU_MODE_MASK,
-		.irq_en_reg = AFE_IRQ_MCU_CON0,
-		.irq_en_shift = IRQ5_MCU_ON_SFT,
-		.irq_clr_reg = AFE_IRQ_MCU_CLR,
-		.irq_clr_shift = IRQ5_MCU_CLR_SFT,
-	},
-	[MT8183_IRQ_6] = {
-		.id = MT8183_IRQ_6,
-		.irq_cnt_reg = AFE_IRQ_MCU_CNT6,
-		.irq_cnt_shift = 0,
-		.irq_cnt_maskbit = 0x3ffff,
-		.irq_fs_reg = AFE_IRQ_MCU_CON1,
-		.irq_fs_shift = IRQ6_MCU_MODE_SFT,
-		.irq_fs_maskbit = IRQ6_MCU_MODE_MASK,
-		.irq_en_reg = AFE_IRQ_MCU_CON0,
-		.irq_en_shift = IRQ6_MCU_ON_SFT,
-		.irq_clr_reg = AFE_IRQ_MCU_CLR,
-		.irq_clr_shift = IRQ6_MCU_CLR_SFT,
-	},
-	[MT8183_IRQ_7] = {
-		.id = MT8183_IRQ_7,
-		.irq_cnt_reg = AFE_IRQ_MCU_CNT7,
-		.irq_cnt_shift = 0,
-		.irq_cnt_maskbit = 0x3ffff,
-		.irq_fs_reg = AFE_IRQ_MCU_CON1,
-		.irq_fs_shift = IRQ7_MCU_MODE_SFT,
-		.irq_fs_maskbit = IRQ7_MCU_MODE_MASK,
-		.irq_en_reg = AFE_IRQ_MCU_CON0,
-		.irq_en_shift = IRQ7_MCU_ON_SFT,
-		.irq_clr_reg = AFE_IRQ_MCU_CLR,
-		.irq_clr_shift = IRQ7_MCU_CLR_SFT,
-	},
-	[MT8183_IRQ_8] = {
-		.id = MT8183_IRQ_8,
-		.irq_cnt_reg = AFE_IRQ_MCU_CNT8,
-		.irq_cnt_shift = 0,
-		.irq_cnt_maskbit = 0x3ffff,
-		.irq_fs_reg = -1,
-		.irq_fs_shift = -1,
-		.irq_fs_maskbit = -1,
-		.irq_en_reg = AFE_IRQ_MCU_CON0,
-		.irq_en_shift = IRQ8_MCU_ON_SFT,
-		.irq_clr_reg = AFE_IRQ_MCU_CLR,
-		.irq_clr_shift = IRQ8_MCU_CLR_SFT,
-	},
-	[MT8183_IRQ_11] = {
-		.id = MT8183_IRQ_11,
-		.irq_cnt_reg = AFE_IRQ_MCU_CNT11,
-		.irq_cnt_shift = 0,
-		.irq_cnt_maskbit = 0x3ffff,
-		.irq_fs_reg = AFE_IRQ_MCU_CON2,
-		.irq_fs_shift = IRQ11_MCU_MODE_SFT,
-		.irq_fs_maskbit = IRQ11_MCU_MODE_MASK,
-		.irq_en_reg = AFE_IRQ_MCU_CON0,
-		.irq_en_shift = IRQ11_MCU_ON_SFT,
-		.irq_clr_reg = AFE_IRQ_MCU_CLR,
-		.irq_clr_shift = IRQ11_MCU_CLR_SFT,
-	},
-	[MT8183_IRQ_12] = {
-		.id = MT8183_IRQ_12,
-		.irq_cnt_reg = AFE_IRQ_MCU_CNT12,
-		.irq_cnt_shift = 0,
-		.irq_cnt_maskbit = 0x3ffff,
-		.irq_fs_reg = AFE_IRQ_MCU_CON2,
-		.irq_fs_shift = IRQ12_MCU_MODE_SFT,
-		.irq_fs_maskbit = IRQ12_MCU_MODE_MASK,
-		.irq_en_reg = AFE_IRQ_MCU_CON0,
-		.irq_en_shift = IRQ12_MCU_ON_SFT,
-		.irq_clr_reg = AFE_IRQ_MCU_CLR,
-		.irq_clr_shift = IRQ12_MCU_CLR_SFT,
-	},
+	MT8183_AFE_IRQ(0),
+	MT8183_AFE_IRQ(1),
+	MT8183_AFE_IRQ(2),
+	MT8183_AFE_IRQ(3),
+	MT8183_AFE_IRQ(4),
+	MT8183_AFE_IRQ(5),
+	MT8183_AFE_IRQ(6),
+	MT8183_AFE_IRQ(7),
+	MT8183_AFE_IRQ_NOFS(8),
+	MT8183_AFE_IRQ(11),
+	MT8183_AFE_IRQ(12),
 };
 
 static bool mt8183_is_volatile_reg(struct device *dev, unsigned int reg)
-- 
2.49.0.850.g28803427d3-goog

