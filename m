Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACD022DF9E
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 10:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745490331; cv=none; b=Ps2Q9PTqPojvh/fEjM+LqvG/+5cQwHeg7n1Zpywj2x/bIxwUmflw8TJ27W04emQkyQQzVOajHMZDUOoaIYZ7e03AjJd07NTnXKZq5PYfD0AoIbus+kLuN6APbUFFYcbymcyD7XLX1I55e+B85nJqAS58I6s/6yPKJoTjT6gBfHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745490331; c=relaxed/simple;
	bh=ORoBOKClhRWUDm0wMhxb1yzCEXRsVXqohDtvhQ3sE0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qdz4LTSNQzM3MEjole9wavHR7dxHK/BzmejLZsKpl/5xr7hC+7cHPXfLIfkLCg9K+LS393gkN05PteYyH5fPucfXgAuuhKUx1iXj5it8PbVB6hWaFviLJMJHNYwhk69pbsezlf6tjac74QuoG242qSIubTdtK6hL5dlSvIhzw4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fwBH8mky; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fwBH8mky"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-227a8cdd241so10321095ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 03:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745490330; x=1746095130; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fhbo3dWwgEK3uRwRq4Xx2zA/jDMc12TYdmm1e2oYkOE=;
        b=fwBH8mkyo36SXhyXDeHEu68w6Nb+jckvzCx8/mCkFI7HFMNIM8KRXsM6ZVJm8sTE/a
         2JKa0QiJvCuIQuvfFm4guDbp3wmHLVJRxgJICIvh7+1BQ4bNKXVvdRhRGB5+dKoqofY7
         PpZJpKPxhShgQA/nHN0BoKzofSFLkTmcOWW5Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745490330; x=1746095130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fhbo3dWwgEK3uRwRq4Xx2zA/jDMc12TYdmm1e2oYkOE=;
        b=hQjVs8T+Thes9s+HMXpI+FF8vsf0b/7SOiToU8DJ3CVXj9bx2ASDMXQoNqDgN87Siq
         nyHNkPzDUTXukob9ccO+yXtZZZGuIiuflt+PtTk3HQMlh33OUHpxVN5yz4csG0tFf0Fn
         1vPb3atD4ujqEF30HjvtviZQZBHDWlwdM2VluPSE4CkATnFBYZbIwpAPBoYcwYKczvue
         al0WDbm8YteOuyDfzSbh1xKb7s6+lbungtpR9rrSWqU18uFI8Yp7NfBZfR9vDxcRuYMT
         K7a5znEfTXTIjyAJrPBg9JIopYqRFXn4zFmvYxiW9nzMmBUBrAQpGuXOUS0sAS8r8kw6
         Fjjg==
X-Forwarded-Encrypted: i=1; AJvYcCXV0KIv/LYGfqzq+dGG0m1dTgR+4roopHgV3rM9W0duvnh3FRalNWJgOn2pqdmo+LpY0ZoGMI8vi6rvsrU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yywe7FHqI8zNFmxICXJDe9QVBsENjFTpEWnRs3o22EeJbY6gKNl
	HSCoKOqIwsh/sEQZHlvKzjhgHoZ50CJRo5nfTzQOj2w013rY6GFj0DULan7ieA==
X-Gm-Gg: ASbGncvoo6BQEM5xflHg9JCjV3xBVBb2nT6Wrn02Vg7Yji0pGpCHrrkzsYxUm6IG8/o
	O6P07Znf5OcCz0xgMDbBaT7i6X/fi5sC5qzgXVrClOMlJfR1qlUHc+mDm72crysyJxpcQR/5neQ
	thyq0ClAfmEWoO+8jaYb4W5W2dN8NMfLAhtc1lyv8fELn87G0s9iilCVLmPQmRlt3rR5Rzf31w2
	O2mnY/REPXFbPNo0Z7CH4O4kxwT5ksO8Ax7mjSzpECC2Rto/VfDUskkv9WJI1PRVFWU8j86xqpz
	+hAN+GhXlZIP/Vgv6C9n1gnZpE0CbRwSx82CDltPkcTlu8Eyn6FAdyfqug==
X-Google-Smtp-Source: AGHT+IELSxxaIrlWkT9p38inClLfKF8hG21EugY89NAyG2v2PsTI+Qb1Qw/gECNiLb039w0VJotWQg==
X-Received: by 2002:a17:903:90e:b0:223:f408:c3dc with SMTP id d9443c01a7336-22db3bb22c0mr25973895ad.9.1745490329723;
        Thu, 24 Apr 2025 03:25:29 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:fa13:e633:684b:257])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dda40fsm9680305ad.104.2025.04.24.03.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:25:29 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/13] ASoC: dt-bindings: mt8173-afe-pcm: Allow specifying reserved memory region
Date: Thu, 24 Apr 2025 18:24:57 +0800
Message-ID: <20250424102509.1083185-4-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
In-Reply-To: <20250424102509.1083185-1-wenst@chromium.org>
References: <20250424102509.1083185-1-wenst@chromium.org>
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
2.49.0.805.g082f7c87e0-goog

