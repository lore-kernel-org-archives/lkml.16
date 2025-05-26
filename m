Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB377241679;
	Mon, 26 May 2025 19:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748287109; cv=none; b=pj3ewIxtSJC5l2vqfoPIzyGdPE7hv0eRfC9FRuALAxuaMK3vODXG/bvFo2Rj5a1P07wabfilinxx60PxRGHZTNPBTKVSFoLmF5BWEk8RnpVDXSXkRExSE+/RdDbeqA1+8BGCgbPSho58JCk4oXrOfv+IyYhpuartDLjCfdqDUik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748287109; c=relaxed/simple;
	bh=/XXt3U0JMu1raRhyrF9oJQA2clBB5QTdJ540lDkDHdg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=hR5xvhW0/Gsty6hKNGP6nWzecl3s2d0a6YIfPhHcSS7l+9SxsJyGmpln14oTmTOT52T6Idw56JhWAGozNHem8xijGMcySlX4oi8N64HlYoJJirpp/icYiUyC4SJ6uNIkB4m31Kg4kjJKSQP6on95rQJ+MuVKDHCsrF0BvE3kH/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hC7gO/eb; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hC7gO/eb"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac3eb3fdd2eso433471966b.0;
        Mon, 26 May 2025 12:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748287106; x=1748891906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ldNbYW3XI/Vm+PviMJj/fPRWUCWil11gviiTBdOEyR4=;
        b=hC7gO/eb/IGC5oGe93RsN7ohh/opgoK+SjQpBsDncwBOW/mSvOfVwmaBcEa8F4gitA
         npKwvK5K37RLIsUshl4TOR5PDdajyZU9ff64PH6TylE4fgO8SPjR8fWncgvOPabAEaf9
         iUEGtQJ7Liy7MVMcXJEGIHDW20/JcFHlNLXovnBdcXDXHvtSoVLapHj68svDArV8vpMR
         3u5BtJg6ccjnTfcqJXnRym2h3X4eDcAh5zL+zJ29f3AvDmHRwp4owhNb17fSKoagQiof
         LHE8HlE7gIE3gH6qm79mk4ZahtO1RNor+3xPcedfQPf0Kcl40lvyk/p0XoXpboOsa5SO
         zg9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748287106; x=1748891906;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ldNbYW3XI/Vm+PviMJj/fPRWUCWil11gviiTBdOEyR4=;
        b=Ztur+FcCxoaDFCg440XW74OiNRYrZaYIMSMuCK0UqqM4qFja8TBsLYO1VVYKqXv7Y8
         tBLOmrniGnKGfzeFtn1/ZKvXBgkkJrxTCltuzXOQuLQYMx8mQpiBFtREcVhLKJhw9mG3
         DjCpZMFHhMMjzGn+/2g2iHfm1cSD8WMs2I9U39RFJi7xBCNTR6fYQcm/mLOAPEpoxqdf
         AlYOW7gHhIDgkwgHG3QBReNiQB+h3OE6T6vFuYEc7GrmnFy+Ac/Lex7HcxAgLfmLiUS6
         Kk3JyyMJ8PnyZUWaDOXYawqKBCw3Rec1bLFbxPuuJhJQeyuWC9I/d9uA/YjQ3982mANZ
         181g==
X-Forwarded-Encrypted: i=1; AJvYcCV6DJY+REEXFR9aKe4iCDUQrKUjlGklKVu5VZEVcRq0ajVH/DwUMnSNHFVYjAvxRK+KgeCTnUikycZlqJo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf/GMgXfQ8E91sMAcrYFlOR2ULi9YgQoIHZ5C9ZU2bSUhdQAxA
	THQCW5iNCj+gj00AAZ+cAsPa9f/mzFMEyKpnxnoDekeEI3y0W4wRQR7M
X-Gm-Gg: ASbGnct3Drg2HOx7/BLFVeuf/c9RDMmbonVt4MnhKowWW9c1DqK0anX/417iemWIO4a
	cDZI5ZspBgzeVQHkRAEnaZoMRX4mpw4qPf0Er+JSPJwFENJSpeAlJ16HrOTz9zJbxlK1frcC1Vv
	QacrSLj0bblRmYdxh4xD1CgGVEC2ouzuX/v6k7scXa9IfN8Bj2RbGobbpzbAf4wbIw3A0uk7OJ7
	1HAkhJA26HpcETB8pArOSg02RSniCAP9jFrVkYt/M3HLAamjN1QwmMuAZVPI0pp0eWbun6b2cLh
	/Kte/adfsDOEbN7taO3pT2ZKm4p9p/AHQz0n4/rI36Iw+yAcmEKM
X-Google-Smtp-Source: AGHT+IHCJg5ZbArAQQ1B1ZAf6mmdeVbfxQzWWDOqn3djiY7YnQ4NyesnvHqfXqjpa/yDvJmfCA7dFQ==
X-Received: by 2002:a17:907:7f8a:b0:ad4:d069:324b with SMTP id a640c23a62f3a-ad85b0b28e7mr932702866b.10.1748287105815;
        Mon, 26 May 2025 12:18:25 -0700 (PDT)
Received: from qasdev.Home ([2a02:c7c:6696:8300:8814:6671:65ae:f9dd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad5572f6402sm1491097666b.178.2025.05.26.12.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 12:18:25 -0700 (PDT)
From: Qasim Ijaz <qasdev00@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	zhangyi@everest-semi.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: codecs: fix out-of-bounds access on invalid clock config
Date: Mon, 26 May 2025 20:18:20 +0100
Message-Id: <20250526191820.72577-1-qasdev00@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=n
Content-Transfer-Encoding: 8bit

get_coeff() returns –EINVAL when no table entry matches. 
The driver then uses that value as an index into coeff_div[],
causing an OOB access.

To fix lets abort the hw_params call instead.

Fixes: de2b3119f9f7 ("ASoC: codecs: add support for ES8375")
Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
---
 sound/soc/codecs/es8375.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/es8375.c b/sound/soc/codecs/es8375.c
index decc86c92427..009259632107 100644
--- a/sound/soc/codecs/es8375.c
+++ b/sound/soc/codecs/es8375.c
@@ -319,6 +319,7 @@ static int es8375_hw_params(struct snd_pcm_substream *substream,
 	coeff = get_coeff(es8375->vddd, dmic_enable, es8375->mclk_freq, params_rate(params));
 	if (coeff < 0) {
 		dev_warn(component->dev, "Clock coefficients do not match");
+		return coeff;
 	}
 	regmap_write(es8375->regmap, ES8375_CLK_MGR4,
 			coeff_div[coeff].Reg0x04);
-- 
2.39.5

