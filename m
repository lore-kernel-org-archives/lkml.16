Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F48221F1A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 07:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749714568; cv=none; b=dOyMNdZVzFj1RKkMV3zczumAWIxRUXaY8Q8CBMzioT6CHYAYJU2IGBtbAcQkM3Tp3pOz7UyBSSFwDj1c+Owddv9xnE08OPp8TmXQwRqMBcmPnquGBjuaQvN8C2ZfHp1tlxC29fI/ZBxxeRrwtIGaXtJsHzYZpjKWDvfQg9HFKuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749714568; c=relaxed/simple;
	bh=GB/p/LNUInAZmB/jmWxOOXaF6ppDZpt2N2fwtIwapzc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M7JIiJMWuWl1G2sn8KHiFoU+KNprEE39ZIRwYxSj7tbevPImf/8XTyJu+JKnr/DS8hgJSElmP/lxTtReJpNXgpE+E7POdNt1uDhuEbrEr8EcVN4D9UuFQ4dDlRustUHdOJNMgmzxGfnhIGnBO2YEV8C71/OVc84SJVNkznlWkc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gymkjwyh; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gymkjwyh"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-23602481460so6728195ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 00:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749714566; x=1750319366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qw5Lgt5fODmZWlZ1xq501GDoPtHJnRW5D55nCqbrfp4=;
        b=gymkjwyhy1Bb7Ebnb1EQ8Pm7FjBoDvQEMRQLvIB2zK0o6p7HSm42UPnPCdVXPlJ1eL
         72YeODFwANy+sGp2O3Nt4nirVDNSO82Xch1x50A3V6ID28R4RRm3DNrOmMuQLofpigIO
         QEGVaug2vVsAT0vyTkxbX3uwG96bgcOHjkITc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749714566; x=1750319366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qw5Lgt5fODmZWlZ1xq501GDoPtHJnRW5D55nCqbrfp4=;
        b=B9y/5fY1JnHo9tLj5JDNYtNkCeIn0K+EjoIKQpvjV6hJdwmo1up1xRa0flji9zXCki
         zLc7WVoU52TYct1mpKt7bsfDpKag2HLCFhDsRCCsiUUZ4t5I0jI06s6SokCx29sgiaLd
         o7ZHft5xNBgMnXi7bZ3EV8cobSh+bLVB2/h9RW0gHZ6HM6sCKhjFgnbPq/6GFvK3yAj3
         P5hyebISHGxxkqeshxKgLe2ONUTaNyTOhwG30w4v3orFfoBQrs5f/621sen/6oWbS0yu
         PMvGFpgHxZ69IWg/8Hyur1sq4Z/Y2s7/vhb0c2FqlCc2tzTuE9x+0JvfxnZnzSfWTQjt
         NhCA==
X-Forwarded-Encrypted: i=1; AJvYcCWc7EAom2hiuhsu222oSNeMJTnWlVlcG/+QsFgEKf+04vFx3zZgsrW/fhc6s3UhetayS/xsG0MmUsbxkow=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDMzd9iOPzb75+FYLWo9HG++nRRmvL45ie7IOTjDlu00Ani22i
	Qk9WTeAccYd++1yCxd7JHppKwwE3/Q9UDnp5MhiTI7KvpHmx5XjDRLDkqA8V3MpHMw==
X-Gm-Gg: ASbGncsK3PXdsaGwE4+FiGz7yNyWQD98vU7MJXWtPEmQs14iqeHexNJTvLl9nX5hnaH
	M6M2FpQjAJja7hTlkddtWP6M9aK7B0GVF0I19mvwSnGxov5yBKqZwUVTSgYWpFey4VvW0vH2k3e
	vEeOsW6AeiwLl/ZM3OVirGI7FGKUoK9KrN69wkxph81nPA0a0cBIaI6Ix4YGIy4jDy5LcIXcNV+
	nCBpThk39k/GCP5Ef26yEfkjWlXtl0RtiC3qZ9fWdffo1jt+xnv7gSR10A6AsQ6CF24mVug9GnZ
	kV2la6Xfr7OZz1DGrLROH0MzSY0PeiCm0r8UFx9iKB5RlDeWY43uMQTYkO9hbrs9XhlPA9ViOq/
	JOPM=
X-Google-Smtp-Source: AGHT+IGLmVy09OL49mJ9w79Slu0toVZtoekmlbumEh4gtf04pg2yxxSPvNOvb9XVQc/93dY7TLT9gg==
X-Received: by 2002:a17:902:db08:b0:235:f632:a4d5 with SMTP id d9443c01a7336-23641aa22e5mr78622785ad.9.1749714566433;
        Thu, 12 Jun 2025 00:49:26 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:5b9:e73a:2e58:5a47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2364e63d42esm7893295ad.74.2025.06.12.00.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 00:49:26 -0700 (PDT)
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
Subject: [PATCH v3 4/9] ASoC: dt-bindings: mt8186-afe-pcm: Allow specifying reserved memory region
Date: Thu, 12 Jun 2025 15:48:55 +0800
Message-ID: <20250612074901.4023253-5-wenst@chromium.org>
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
 Documentation/devicetree/bindings/sound/mt8186-afe-pcm.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mt8186-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mt8186-afe-pcm.yaml
index 7fe85b08f9df..f5af2cf18158 100644
--- a/Documentation/devicetree/bindings/sound/mt8186-afe-pcm.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8186-afe-pcm.yaml
@@ -25,6 +25,10 @@ properties:
   reset-names:
     const: audiosys
 
+  memory-region:
+    description: memory region for audio DMA buffers
+    maxItems: 1
+
   mediatek,apmixedsys:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: The phandle of the mediatek apmixedsys controller
@@ -170,6 +174,7 @@ examples:
                       "top_apll12_div_tdm",
                       "top_mux_audio_h",
                       "top_clk26m_clk";
+        memory-region = <&afe_dma_mem>;
     };
 
 ...
-- 
2.50.0.rc1.591.g9c95f17f64-goog

