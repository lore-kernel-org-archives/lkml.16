Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92F423ED6B
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 15:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739199713; cv=none; b=mgNj2TXeS8lkJDmdNInCXlzi5Lbc/6s5iofu7d/7DWsRuBQSFQk2KtuBbkHpp4Be7O89oJGB1kBy5b5eEZfcnscLRqEQ0Yao7DwL9vGpfSA38wtP1B5rUpRwEVYSPKtTBkAY0I2I73UvAddpcKnPKmIMjx1YMSue4sHHFB7NdC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739199713; c=relaxed/simple;
	bh=fRXm9P99TfVqw7/aWzdwF95S/kIUYPn5PkUQougaaW8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fNhqKboidlHpM3MyCkBU1hT162Uk+g7cxGEMra/CB3XuIq3gTsrsgWv3aaSAvVo3hHuAkOSnjoa+WQSchYPt5Lrx8EdSr17RZni+4m9cw9jwsSK2O7NXkr0nga2LuG5cCdiRvCuYvtIrsAexk8Mj3F0bB7R0iQcD4qFGvda3rO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=KpWp80lN; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="KpWp80lN"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30795988ebeso44860671fa.3
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 07:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739199710; x=1739804510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GWn8LoEHwMNZQ9TBj9gyzvn+gEM+LQNUFBCn0O8RbT0=;
        b=KpWp80lNEQDJq2ZktxgUIIQTTD3mHBjp+ovLSrUZduI6eHbXuqJy2pqfCBKl0JhR4i
         YrPtYhgIP26GHxD/kemZ6Z0xn8vz8Z6Z8AiNQ5EzS5EHJJgdEIdxl07U/Zndg8/uLHNA
         Qm1HCxmgXg7k6CiGOpPZe2xTQHzdiajQ9LOM7gGLlmbLRoVaOL4NgJzGIQVJmlrPkyLL
         iezdsoWBoyVFrOV8MOOOs1rQ5HzfVgV7jLlYBGFceLb1eBTseJfSjhc5nsmuFY42/jlH
         AQhqw4YiJuMyMP4Pw7VumCnshrU3kQbEK/utIdH9/3AWuyljYVsxLvwB8BxIJNsy/eDp
         uA/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739199710; x=1739804510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GWn8LoEHwMNZQ9TBj9gyzvn+gEM+LQNUFBCn0O8RbT0=;
        b=dkoj6X0viR/AlgiLw4qotnpEc9SbKxO91MUjq0IMldwcvkQ7XeM21mIvAfr7QrKIqt
         tEDXmANuyt+P5Q1kciF5XQjJ2objrmJw1ilcxtB3OYeItzJMwYTTctfuxs2qQUSf8lQm
         Z9WBwK4+6acIsS2nT/BGqTyX+vF3DLpv/tSDfXLYS4O/1Rf4Oc0yPxEZetLu3qMzIZqB
         eQsRreBVp8rLD7t2vOK0kjvxQHPeyrH2QpDsBylN6VabWAoCgn1DT258Z6bc549f0s5t
         i2y8Edsrno7GGO00i2xY+3A9Br0IHyBiV/yx2Ci6jOeTBgp1jgzuob2d1/iweoa9MEuU
         VpTQ==
X-Gm-Message-State: AOJu0Yx5Oif5fcLBvLuhOLwlB0Gw9xsXUG2nyuEStzCx6xO3pbb1FR8Q
	w2KCIhNERgBtD+IiN9eEs5jOg6DwACCPzhOuNXGK1nGj0oGj+cXEZV6u/nVdXoWnxR0uxyvSitY
	fR6JR1w==
X-Gm-Gg: ASbGnctER3y2csk11hRnY5a00AHvcxITv9ZDwZ0zLJ5iFwcTP2OyKEeBWczwRy4lxf+
	FfhFx9p4C7hc3IbpXAFq4UoeoLzXzOKOq++To28nz3kRA+/uoicg/XCG8glpAFpJZIkrTd7lUBI
	+5mPVXqwPQGLlREUX3wkOe5TPE23cCRmOzV4bUKK6+UcfdVWKYzLOKnxUVQzv17IPzo6dk6LH0P
	fWF108tNeoAY+gze6Krf++ZKrLeZ/qTqoB3vn5uPiTwM7fUyrdFaXyNX7tKj4mhwdjcyWi55mzW
	pXSEuX0Jdjvn7sOLyHyOY8zvO645
X-Google-Smtp-Source: AGHT+IEIeHQTJ8/QtRwBWcSl9TO92kHxG7avnOm8/eWBRmULID8JOaosNQ6nHBBvafmVZG0xlTQNtg==
X-Received: by 2002:a17:907:6eac:b0:aa6:5910:49af with SMTP id a640c23a62f3a-ab789b1f93cmr1478824566b.24.1739199698834;
        Mon, 10 Feb 2025 07:01:38 -0800 (PST)
Received: from localhost.localdomain ([151.41.218.186])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7bec717f7sm250400466b.81.2025.02.10.07.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 07:01:38 -0800 (PST)
From: Valerio Setti <vsetti@baylibre.com>
To: jbrunet@baylibre.com,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-amlogic@lists.infradead.org,
	linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Valerio Setti <vsetti@baylibre.com>
Subject: [PATCH RFC 4/6] ASoC: meson: add support for AUDIN in gx-card
Date: Mon, 10 Feb 2025 16:01:27 +0100
Message-Id: <20250210150129.40248-5-vsetti@baylibre.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250210150129.40248-1-vsetti@baylibre.com>
References: <20250210150129.40248-1-vsetti@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend the gx-card module in order to support the audio input capabilities
provided by AUDIN driver.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/gx-card.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/sound/soc/meson/gx-card.c b/sound/soc/meson/gx-card.c
index b408cc2bbc91..c59bb18b0951 100644
--- a/sound/soc/meson/gx-card.c
+++ b/sound/soc/meson/gx-card.c
@@ -67,7 +67,8 @@ static int gx_card_parse_i2s(struct snd_soc_card *card,
 static int gx_card_cpu_identify(struct snd_soc_dai_link_component *c,
 				char *match)
 {
-	if (of_device_is_compatible(c->of_node, DT_PREFIX "aiu")) {
+	if ((of_device_is_compatible(c->of_node, DT_PREFIX "aiu")) ||
+	    (of_device_is_compatible(c->of_node, DT_PREFIX "audin"))) {
 		if (strstr(c->dai_name, match))
 			return 1;
 	}
@@ -96,6 +97,8 @@ static int gx_card_add_link(struct snd_soc_card *card, struct device_node *np,
 
 	if (gx_card_cpu_identify(dai_link->cpus, "FIFO"))
 		return  meson_card_set_fe_link(card, dai_link, np, true);
+	else if (gx_card_cpu_identify(dai_link->cpus, "TODDR"))
+		return  meson_card_set_fe_link(card, dai_link, np, false);
 
 	ret = meson_card_set_be_link(card, dai_link, np);
 	if (ret)
@@ -107,8 +110,11 @@ static int gx_card_add_link(struct snd_soc_card *card, struct device_node *np,
 		dai_link->num_c2c_params = 1;
 	} else {
 		dai_link->no_pcm = 1;
-		/* Check if the cpu is the i2s encoder and parse i2s data */
-		if (gx_card_cpu_identify(dai_link->cpus, "I2S Encoder"))
+		/* Check if the cpu is the i2s encoder|decoder and parse
+		 * i2s data
+		 */
+		if (gx_card_cpu_identify(dai_link->cpus, "I2S Encoder") ||
+		    gx_card_cpu_identify(dai_link->cpus, "I2S Decoder"))
 			ret = gx_card_parse_i2s(card, np, index);
 	}
 
-- 
2.39.5

