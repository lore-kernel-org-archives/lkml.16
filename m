Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00974220F50
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 07:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749714562; cv=none; b=HbER1Ae83TDp2SvRB6GX1ie3eI3OwOHFPoR2cZgbvmSpYknSnz70zbsHn698zPNDJSE9x7XIyktNg1oKnoW40wCFBdUytDUNNekLae3JGA3yl1iZ16cwLiYWf996/xdqebqBcGF25MJduAZJGjWe4sShDDFBpUFTk1sH4IWDgmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749714562; c=relaxed/simple;
	bh=M6CossAzrTItIWAzn1A9+kxxQ8xCK/jJ8XqU64/5Zf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rCFrL+HZrlgdORo1G98khmQXIDJXWyPRobhjFBHfezDxuvQPSCaUk+wed0qRRx6Re2jAjU6S5crR5E0Szz3xSf7GMA27tCakc2I5Av2TABQXxJcGgo4kfxyTY2qWmFBGjfZkcdHeAQa0UeQjP7HQ4Nkds4MP2RsQn/3arv/LA4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QpMq05/2; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QpMq05/2"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-23602481460so6727475ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 00:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749714560; x=1750319360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hYQyoxfiAVqopjQvGW02GMsvVlG13E9Tz7Vl2Ymi3WE=;
        b=QpMq05/2z0Omoetd1k2lkYpR5mgNnSVKYnFD96tlVCx3UOsgllXd/gTeyw2iLXoGsg
         PQfj4eTdL0UiPNTFYIkujWcpQUV1SfJ9EdRsdSk9bKe9QeX8xqR0YTzTUJCiDiZ7mHqJ
         xUn9fp6+ytjSwG44KQ0/ve6hmOhsBzJw8UsoY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749714560; x=1750319360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hYQyoxfiAVqopjQvGW02GMsvVlG13E9Tz7Vl2Ymi3WE=;
        b=w8ntWw+Gf6fSfrTXwlM1xB7I5b+4+clOW0RnGGrfAqhTWV+q8SXBNnBYac9nBQUCN3
         ncx+fNyzlpH/u1CRRznPdfgdvTZq44cjE13hZJGBtPKqgUAv5cK3ubvb2eeixzxng3/m
         dSv4RBeNc/rRGxg94UGqC+npmOUOswrCPgQFQRkOscDVs5Bsy48Mwc6t0vA+xydVuAeN
         oBjEwz/80R2x/QotCtAhDqWlsrH7NVco8TSKKzZEVmynvUZQ9LZlbmnNi+eepl4J+onD
         6xqgGZvaSJ7zJsRvtblEs3c9J73ENx73Rfg79Xtgo9Vn/GYnSRi7k9DXTe1YX9zi7V5T
         r8Ww==
X-Forwarded-Encrypted: i=1; AJvYcCUcC2szhxK3UDrX9zObWll9FbYMZcKGGNnnoOfaCo8vhWvH9rJ0aAmJ2PnUIcIXWTwKLq126xgJRfyDTI4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvaw+RmoxTvTjdk0ifpa2i2082r9bZiOmX/ZRD+HA2Br3unGAp
	XPI1uNfG5HBg7bGNPqgFpJVwqEClHb2Gz0CUA7x/nn6xg/pPgYGQPlNMi4NUUwF3xg==
X-Gm-Gg: ASbGncu/ZjVOVV1Z3Ftn+0UivumTvJUTH1v0rzQGIyXUhE2qYYMFodG81OT6SSzoFC7
	ghyiELi7ytIvT7NE67dWa8X0nl6GwaILhS3n+FhOZ+JohOYK4aR9g+spiT7g0Gygd46/yFLD3eZ
	fC9ICblXoy2HtgGiqaaduIfKxRsnD4YkODaCcx/+GYdMphAChurkEWsszlRFxCHaj1seaTo4QJ+
	36H/gMSD1OFwerIxymbKOZ6ScRPr0fqhiTIZBoorIafpdYP2ZOgNX8GQEsTY9Zl9Rk8O1U8pVl0
	D7BV0qAeQ2D0KrPawfZnfH2Brotb0dSGASCiQu+fnbDd8WigDMBRrWcJEGAu/ucOIV1eMBKnl0M
	xLwg=
X-Google-Smtp-Source: AGHT+IFaK/aSeTPU1FVSUiJwy75RRBlflMYnV4oLKYPHyMqt0+SId2lcqzKkgBqwPYhNLtKoxyy+Ag==
X-Received: by 2002:a17:902:d60d:b0:223:4537:65b1 with SMTP id d9443c01a7336-23641b28de4mr102187465ad.36.1749714560273;
        Thu, 12 Jun 2025 00:49:20 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:5b9:e73a:2e58:5a47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2364e63d42esm7893295ad.74.2025.06.12.00.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 00:49:19 -0700 (PDT)
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
Subject: [PATCH v3 2/9] ASoC: dt-bindings: mt8173-afe-pcm: Add power domain
Date: Thu, 12 Jun 2025 15:48:53 +0800
Message-ID: <20250612074901.4023253-3-wenst@chromium.org>
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

The audio subsystem sits under a controllable power domain.

Add it to the binding.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml  | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml
index a95215ba6361..666408d32f5c 100644
--- a/Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml
@@ -45,12 +45,16 @@ properties:
       - const: i2s3_m
       - const: i2s3_b
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
   - interrupts
   - clocks
   - clock-names
+  - power-domains
 
 additionalProperties: false
 
@@ -59,11 +63,13 @@ examples:
     #include <dt-bindings/clock/mt8173-clk.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/mt8173-power.h>
 
     mt8173-afe-pcm@11220000 {
         compatible = "mediatek,mt8173-afe-pcm";
         reg = <0x11220000 0x1000>;
         interrupts = <GIC_SPI 134 IRQ_TYPE_EDGE_FALLING>;
+        power-domains = <&spm MT8173_POWER_DOMAIN_AUDIO>;
         clocks = <&infracfg CLK_INFRA_AUDIO>,
                  <&topckgen CLK_TOP_AUDIO_SEL>,
                  <&topckgen CLK_TOP_AUD_INTBUS_SEL>,
-- 
2.50.0.rc1.591.g9c95f17f64-goog

