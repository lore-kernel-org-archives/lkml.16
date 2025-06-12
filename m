Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160E622156B
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 07:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749714565; cv=none; b=o+1CUEZRYXqkbRjylzvCLR4h12WGFHRaLSRkA1gKGA4NgBLwEK+yk9pM5afENo3BrrRm+NL+Zr27oHU/PRp7fA7EZKLgquMeDzyXAjpFmnI41wAnKXIlGmDW6qEdqCrxu9nVqi5v51M/q+QnRwbx8loMqH1XNqJzsD0Y1is0x5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749714565; c=relaxed/simple;
	bh=lybc9W6Ru2g35FCl7tbh/0HER58S9785YR+C4VsyJks=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g+3uNkpcBHalVxYWPCR47zNA/v1BMjv23D7ZwrCfXFbPCNtLNVRaqkTs7Y1EMGyke3PfsA5fECBu+hcxbom330kip+9+DJMeKeGTszW06hZK2fPh1wiqvMPiiz3XRwBX12PddVi3ggz+2c5Ch2Bb3UsCEbHxnTjHjYFB8HDKjfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GqUHbFbl; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GqUHbFbl"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-235f9ea8d08so6472015ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 00:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749714563; x=1750319363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8rmXxgdE5Y76+Q2Sd3HDIMfBzQR9l3cd66jsguV0wzs=;
        b=GqUHbFblYGohkfQRjGfR1legR6wNquH5dFtmetAN1T8hhsJixH543l0elRO7f6XddV
         y35p95+H34d1gEabntLOoLL6w8U2ML6xVRgzeFglzCscq14KVLm6/JIfeYpWprji7NKO
         QI/QmhLmdzI4IHUC2gelYhP1rRxIk02b4yNUM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749714563; x=1750319363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8rmXxgdE5Y76+Q2Sd3HDIMfBzQR9l3cd66jsguV0wzs=;
        b=t+N3nkCvkaIXl3KHxabq5SuVti2QLczXMrDZkEq5Zc+vGc1dueRqTAJLg44N6rYVfT
         VcASqqv4bxLez3mbadvv2Knqp/uJLE/ud1nEkzgGakHj3zytV7A8jw3/0fmwmjMf4LY7
         SHA6UPn93AqdxPyUSEQYsBtI9SF3JYsh+0wNUaRmAuvHxOAkH3eCPB7nC7b5SBSz76vO
         j6G6BXJ1NXF6q6WH62paAJICYcdZEPP7UwpaUUMxeTUJ6j+0EhfBkpu7Ahpp5VMJOgsa
         oGBQ323XrVsZDdaqCMTA4msWRfbAZqO8nnoo/VGjuuiqgoV8H/g8M6McR+4iNXvPCKoq
         sOAA==
X-Forwarded-Encrypted: i=1; AJvYcCX5+wAz7GzEvX5+zJ3mUdc3YpzvH+RKB3EewW34mFgg2flLPjbIzzvJ+eFieS8o4kwYH4qVIXAprcwfOpQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0Lh1fHCCqpsDqrrWmJwtp0sL28SWFhWwLLYYo0Zs+x49nHsA7
	OswMxCHKClG1NDcYQ2aumEKT7MXaTRe4gEwRg3xel8PFGh7q12zEUulPlwqd8JcvxA==
X-Gm-Gg: ASbGncsBCkpngKbKf+z7EXuIgHkSoe/YlZx2SCXzMcPuMGsB5A68Aalyd6exsR/MGm9
	WKL3BBQtm+ckv/3ML/VA68lxt6Rd2LsgtuFoab+p7D4ocDTG1eeYEcEi72ypUz+mZ0hLyQ7hmS2
	BaPkIYM6laM7YgGINpmAwVWGe/zfwNYv2lqaNfv5cTbfKiqgQPz8nZFVgPVoLtI7U6a3bLW2H7l
	NSKi8/B4Oi9P6OyYRBs5GLp5hqkcY0EPtMtgsAhbFhO4AaRACGq4Z71kFRgDHpx4hklMKx1rMF5
	spaGOvvENLrTbkibWOeR3u0k6eFAiPuJZF/aqbPaxHuTWeH9Oy7b3A+aaGwyMN+02x3rDq70RxZ
	+GfU=
X-Google-Smtp-Source: AGHT+IETZGBfj/YzdDSsonxEfwWc/CcthND9zSTKGdklyqrJnMUaY4T2coeXgqpNXh9qqeHQt9lwGA==
X-Received: by 2002:a17:902:d2c6:b0:234:c65f:6c0f with SMTP id d9443c01a7336-23641aa245dmr76936875ad.8.1749714563347;
        Thu, 12 Jun 2025 00:49:23 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:5b9:e73a:2e58:5a47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2364e63d42esm7893295ad.74.2025.06.12.00.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 00:49:22 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/9] ASoC: dt-bindings: mt8173-afe-pcm: Allow specifying reserved memory region
Date: Thu, 12 Jun 2025 15:48:54 +0800
Message-ID: <20250612074901.4023253-4-wenst@chromium.org>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
In-Reply-To: <20250612074901.4023253-1-wenst@chromium.org>
References: <20250612074901.4023253-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is desirable to reserve memory for the audio frontend.

Allow the "memory-region" property, to be used to point to a reserved
memory region.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml   | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml
index 666408d32f5c..d8993b5d457a 100644
--- a/Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml
@@ -48,6 +48,10 @@ properties:
   power-domains:
     maxItems: 1
 
+  memory-region:
+    description: memory region for audio DMA buffers
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -90,4 +94,5 @@ examples:
                        "i2s2_m",
                        "i2s3_m",
                        "i2s3_b";
+          memory-region = <&afe_dma_mem>;
     };
-- 
2.50.0.rc1.591.g9c95f17f64-goog

