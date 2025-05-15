Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FAFA28313E
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 07:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747294720; cv=none; b=uFetQhO1OJG3oJ5c4j1fqvi30YLY7CCQlqRHSEK7V5KGH83l0JQugUnA9YEzwKCGgQLIhYCCved/YTgyWSM1+n5HxQYAdnymyRk7nx3Q5vFE0fmwTA9TczQXkc1wBJQYuF4kvapFZpQ5A9aLlIRLolKOhJmbYQEPmE+snihDSjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747294720; c=relaxed/simple;
	bh=Aamm8tMZwvmn+zCf/R9rzd5Zoo8sxxgYpgtnjGEXVhM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cFVBlepVJcqMnazDq/vXhfmRRzff00PqzQD3mkvdbaUsM3PA95EUj2ldCw/1wF3Wc/NyifUbcZk9vNnTVWJOwcS1ClemOHEuLeWFI8SvT5zimNEhKUMU/bngJGUZ5UzLUuKGo1CGOvLzOrOt8D8blMKUeMUjuqzUNlapgfdJ5Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=crWfwblc; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="crWfwblc"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22e7eff58a0so6551985ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 00:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747294718; x=1747899518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cuw9i37af/1ORneMvev0+QG19FsjaSUWkPdlSl+CJ68=;
        b=crWfwblcKg/5SHeLmCmACv/za6xJ4iegdz1eUnsZLhOYnlyUrr5Pr/4oMb5Bp+iZKl
         Fxy5T7VKPQE4CI3kX4Q5g4qv2eR3qETY6PSk1pRH+eaOcfLZYp7kwdwFI4PPYhhnQR9+
         JBe2Mh3mMvWEPgBGfG/hiE+wWJgjP3vNKn8Bk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747294718; x=1747899518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cuw9i37af/1ORneMvev0+QG19FsjaSUWkPdlSl+CJ68=;
        b=PGwKtDQM4GBvnu8vRSJdoUGmwwGmRU4gdjRz5GGFykoWm0KBObC+jw0NBqd4IEL36J
         xCYdCfbvxJcQXnbvsMsu/y/7pKVcacY5JT/0FnPVrdfCbsFhsrpTib8h6LXcPIU2Zggh
         6UoJdHvDyz44N4CBkP5T6l7fEBWhZNbhXPxa0OB8bV/rKd1rYsNRg4xp7yNgtNwpQ0AZ
         YcbC5VmmH62L1IndQWIRz8TDZ3SCmz8pKPZvCQW2/Nm4hdFtkVfHtg1EZ2cUtPdhUoj+
         iShaMyaWPxHNKft3OCf2feqPdZBTFFTmOyTAQ5UCEUMzbEnu6mfRm3RY7gScs1J/QNFV
         xTwA==
X-Forwarded-Encrypted: i=1; AJvYcCUSht0GPoqJU2sr5Z70St7RWsn6njSUErdmtq3SRqPt/IXSbRXuMAF75tYEJjtaKfVSXrW/tRTW9rUbUfw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyO6PATQuYPdzHqHzvekL2hJA3JJSex+4bGd19pQ5QVdESjyI3j
	1InLMvGaCK+jzqXlxMDW6Fhh/Ec8qjuepNjDLBcCROWXnu6TELSAp60nVRyz6g==
X-Gm-Gg: ASbGncvUHW1W/6AWPjHVyLwV/thjVcvwOvqOJqZQ52UNBMIFz9Bj/VivtCWNUdWsUJ4
	iix4qOtB/uO65MP1SOI65DLjnG32mRjGImTzP5niL4/Fn2/dnfWAzX9SLr2F7rqBb2fbN8LVjyJ
	XMRpAELJ/tNA0EDlGa7ILqVi/F5OTNapnRM42wAJaboEEO1kUViaEpfl3w1gIbkXJWSe3aXvqZ5
	vXBdjoEzm8woQekIZPq1oi1W3Uygg+DT1P6LWT4UqC6ufODbOL3tLERF60CYtE3tyHj0dze8ISt
	tya5a8r1zvwupEpfCB2NB7qXJNmNQ3GFR0TgoyIcmkL+bFav0qpJYJy+4InUqEwKAe3hkw==
X-Google-Smtp-Source: AGHT+IHe6IzxFNkLauCy9bZU1Uvquc1KSUc5NpKfBLs8LJxHMC9d6kRf1QOHhUOkDzpc6Nk9gUSZew==
X-Received: by 2002:a17:903:3bc6:b0:224:18bb:44c2 with SMTP id d9443c01a7336-231b5e51feemr15907235ad.6.1747294717753;
        Thu, 15 May 2025 00:38:37 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:c43a:aaea:5f52:5763])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271f61sm109750825ad.142.2025.05.15.00.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 00:38:37 -0700 (PDT)
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
Subject: [PATCH v2 2/3] ASoC: mediatek: mt8183-afe-pcm: Shorten irq_data table using macros
Date: Thu, 15 May 2025 15:38:22 +0800
Message-ID: <20250515073825.4155297-3-wenst@chromium.org>
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

The irq_data table describes all the supported interrupts for the audio
frontend. The parameters are either the same or can be derived from the
interrupt number. This results in a very long table (in source code)
that can be shortened with macros.

Do just that.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 176 ++++-----------------
 1 file changed, 33 insertions(+), 143 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index a4bed8e335d8..fe315224a259 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -481,150 +481,40 @@ static const struct mtk_base_memif_data memif_data[MT8183_MEMIF_NUM] = {
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
2.49.0.1045.g170613ef41-goog

