Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14102206B2;
	Tue, 15 Apr 2025 19:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744746099; cv=none; b=U9q5uNwprEKUzhcr1W9+6PJy6FwoblaqLkc24ZS6QVNH47F70JBkUyRk6BLyo5hdozAeACW2R2wHm6/YDfprBrUIKIykEnddbwGa9ZyQxhGuYOD72CpAgoXCpIp3QDwX//UjihzEV0CY1GkpiJy3bBmgX03wvyr4mo7X1mcGTuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744746099; c=relaxed/simple;
	bh=Tvdph049PXmUEqSf4JsikSR/EB0vrzfZdObuVKzmQbg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pc3WEiFV0IrGkhcHdrVRI2Hjt0dsYh53pcifNc/ZO3UY+cBg4c/rWI4x4SgQRxKjgSU+66ZHZRJqMYXIsH+Cy/E47ZXiDee8lW20V7uKXZd9Az0U68pxLuVY4/f5K1ebnqbf3l53hlndq9QpqqxsUQsTEtNsGVOM2m+rBnS/vPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BsvWVxGD; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BsvWVxGD"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6f0eb824f51so1502686d6.0;
        Tue, 15 Apr 2025 12:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744746096; x=1745350896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3++o+6t2Gl2qtiC6cKBxwikZk/Ec4je9Cjpik4ZhnYs=;
        b=BsvWVxGD+uE+4lEMU8YR49HUMNTwPpe0YDIypYVyGhjJIFzRkhXSuKz3eUeONpWFre
         r5cXQYMcf2psoUb0iGWjfdSpZ4ITJEJfu6e4jwUyAIk4z9b/ol6zs6qNqwz6mP8MO7A+
         vojG+U+jFwdyI1Zov688n8B4V98PTvDPHgi2VMDfAzVzLddpR2wLSNPAv3gHt+k99M85
         lTJOiCtaVmEylM8r/SYxVfBo8GeHAZOK+wRW/f6ojFc59CXU5bBdMlpgBVW6FRDpucFX
         X5NGBZgpMgy8ySROBpjHNdr0Ska4KfsEY2lJ4w2Hfcn2K2DEjLQGieew0qD0XtcR07aZ
         JSdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744746096; x=1745350896;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3++o+6t2Gl2qtiC6cKBxwikZk/Ec4je9Cjpik4ZhnYs=;
        b=Xmbu2AbB/uabQq/NhJLqRNSL03/cGO/1F1O1CpEI+ugFdroWyL929bgZRXH0fFBeSr
         2LtXwnJPdNxH6ZV3fUVYn4QECiSGcxHOQEUbYKjD9Fw2uHte54awidhmUutT2RU5Bjjl
         RKTCUDkkI8H6Xg9OUpmOQXWmHVsJ47Sm+gf3B/De6sJYakzVyNMdX4rcurgL4f/V9vET
         ecloogSGRB30IEizmpWC7U2rAd930UE7QY1PEApjYlxVbNRuleEQ5i+xe5+oaRsT7Hih
         FTkyelXVZPSFwPsNuP2cWSB+dICVsQmO0rx78m81MV+6fDFPzAgmDFhPBXGcXPrcKBkI
         LODg==
X-Forwarded-Encrypted: i=1; AJvYcCVEtrRkYltRE1EHThPf54AqZvTDtZdQ4wwlCnxn73jwOWq9vLL7of5fWHTmr5eb/hDozuFDVoeKa5MBU7Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz//CfhFpY20BTKkPRSjT6QzNuRepvw/nOf3eh/y/MSj9ninnh+
	K13btJKJnARXLfDX5wBW/vekviPf3AxBfI8wcqS4Dj/I7yceRJPWo5e4
X-Gm-Gg: ASbGncupmTTCY6A4c2MO0EC7cjKAl3/tBMa5wRyoPSP9IoU8RIioq38JeM5e1qT7aJ5
	2l7vyc7hP+KGAwJ7JhSrfTZNrUA1XTCWf5SzPdqEHkRVJoe9Xl3XyUivrbcO18tciyR7DrxM7s8
	Sz7A7yKau+4PL4kduvLIxj46nR3/zULMfockwTOVbrYXN6sOUGSTiMDWn37Z4Vo5Z8HWSSHJtKv
	QckTR3ZArCXBAvjc4Q3bB84ZnHTGbmaL9YmjOIos4jXzrUVJ1WpjUKz65lVKEBOitW+GW0fQ16t
	tuWckKW2CQ5KgBpt612R0z1PvJZynayiv3ujOA==
X-Google-Smtp-Source: AGHT+IF/I3+kIbzpeSJOenRWZ5IZHp1/fzcz3w/Klw37QjNipRJLvLrWcKYuzvQdmYEQ+tgGZ9fI8A==
X-Received: by 2002:ad4:5747:0:b0:6e8:9351:77f8 with SMTP id 6a1803df08f44-6f2adcf52a1mr3569696d6.7.1744746096517;
        Tue, 15 Apr 2025 12:41:36 -0700 (PDT)
Received: from ise-alpha.. ([2620:0:e00:550a:642:1aff:fee8:511b])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f0dea10659sm105066286d6.111.2025.04.15.12.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 12:41:36 -0700 (PDT)
From: Chenyuan Yang <chenyuan0y@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	Vijendar.Mukunda@amd.com,
	peter.ujfalusi@linux.intel.com,
	peterz@infradead.org,
	chao.song@linux.intel.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chenyuan Yang <chenyuan0y@gmail.com>
Subject: [PATCH] ASoC: Intel: sof_sdw: Add NULL check in asoc_sdw_rt_dmic_rtd_init()
Date: Tue, 15 Apr 2025 14:41:34 -0500
Message-Id: <20250415194134.292830-1-chenyuan0y@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mic_name returned by devm_kasprintf() could be NULL.
Add a check for it.

Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
Fixes: bee2fe44679f ("ASoC: Intel: sof_sdw: use generic rtd_init function for Realtek SDW DMICs")
---
 sound/soc/sdw_utils/soc_sdw_rt_dmic.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/sdw_utils/soc_sdw_rt_dmic.c b/sound/soc/sdw_utils/soc_sdw_rt_dmic.c
index 46d917a99c51..97be110a59b6 100644
--- a/sound/soc/sdw_utils/soc_sdw_rt_dmic.c
+++ b/sound/soc/sdw_utils/soc_sdw_rt_dmic.c
@@ -29,6 +29,8 @@ int asoc_sdw_rt_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_da
 		mic_name = devm_kasprintf(card->dev, GFP_KERNEL, "rt715-sdca");
 	else
 		mic_name = devm_kasprintf(card->dev, GFP_KERNEL, "%s", component->name_prefix);
+	if (!mic_name)
+		return -ENOMEM;
 
 	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
 					  "%s mic:%s", card->components,
-- 
2.34.1

