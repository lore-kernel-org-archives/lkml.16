Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3D31FBCB6
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 12:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739275736; cv=none; b=d2gjtTOMtx70cpiEkibWK3i8QSGHvKDGGsYfybaWlGJjiyPEj8Llol7Vpdf0csl41CCNT+0G4zdBBbWrF0YuPzYOxSsWokhiDHUfyZhprOFHBszIxhAkrzSVLwc6D9THIAtFKLuj7mxkUouRPL+j0jz9sz5Ah6vNuN7IdIDzCRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739275736; c=relaxed/simple;
	bh=UHUYIddf+n4H5dMnEJICjm1zFmW3Cc7Ddp9PK9+vm8k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eTd/ve2ZCHozjf7feEY428i1r3PUqgQ2Rup9kNZbgdQ3WRSfryU5paZZBH+qAx2EKrb9L2PCE5LMiTOseYBcrDZ0cTWxB2IlHaFv0M5cEEEFvtVvGyGGuARUOhN7qcJPXorOg/uQ8xoEbFVe2D95eTylCqNWk4xEHceUfhq137E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=tVZ2+aqB; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="tVZ2+aqB"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-439566c991dso1456105e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 04:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739275732; x=1739880532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/LXQ6cLbViDtV5N9eGseg4G8vDo8CWaGoGPlt8jHaoQ=;
        b=tVZ2+aqB5Z3QaMqHt07of/aKKe+ybG/ysHStS/kD/dl0tYmWfS2HvrLDoYMGddyEid
         sJTuCYXMP4TjoIhdflvT45RjQrdvUMoik5aJjiH2XkSSB7gUhibhiq4E8HOgyjbA/Xfv
         RYQNIRI5GTMAHogBOSFVqSNP3orl5EQlw/X6fDGe33pwdaZwWtqOOMMCxiG0xQOOA/p9
         dj5fRhBEE1Wg9+QTgo4uHav6HGjTCbz2pIYOLCi2+3G8mDh609FtWJop6oE8HqWShcD1
         p7N6m0ueykNr+rJYgptFmoTWvyKFbLoqnqZYFOujrTDcIooVzPfbEVdxac/AhujY2JDd
         vpiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739275732; x=1739880532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/LXQ6cLbViDtV5N9eGseg4G8vDo8CWaGoGPlt8jHaoQ=;
        b=HMLaqlQEc1wjGvL6dft36gpKAmQCfISaCRipxEf+LAr6L2lbHiCuPgOnkXRz6LuomX
         Iddg95P0JF9iqPByvObXMEt8HrXZpeploGIlTPSg7cvrF3wiIH+RDeohlpMu6KixJmCu
         RWUZNpFxVwoY4Awyvc2TH/0++FN4y1AHDdKFvvotDduyc59akRth+xlPBAX/3tkjr3m2
         BDDESZrQelIkmXEFLUe63akvA2ceQSUhVcIwZdda4/rGSiG77U+b75InxEFJ8PpaTyBo
         dUpo+2I1LhEwcBaeIbVVUD0iQpCCSFzk13+ulKyREopOiJL0Di/dOASvETpxaRGH1QSL
         OHbw==
X-Forwarded-Encrypted: i=1; AJvYcCW6z6+8/WNOQZPRxgwyt011pi8GzfxPuIpBV4xlIg58rYkKgQDijV5VXOVeA8WDGvtcXOyWHqqxKKo3UPk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxV5utkhvytQIYopGdysBsWKJ4aXu4em6HNljm3aZLryJBrnVY5
	QAW6iEl6VdDiBLLMQBrISuVKioQ6ZYHf5SX9eLNOyxUYY/DfVKuFlYJPIaAXMp8=
X-Gm-Gg: ASbGnctftRBaIA9k3P37IN6zStahAxYcJimKOt374mxbLyyWQD5/zsVARzB4EIVTHa8
	/yep62m7esr8ZIFyc2ev3BQc09B+N8jAuA48t5VPdZSNT2iGaDNPJSf/ryIb4zWcJr6E0mDtuDx
	wtLBdLoVaOI1A3R0hBNQCtqeHXedqFR4lyGBKWxm6bPQbO5/1NJUNqFyXgFgD9ABXTBWAvHMpWm
	FzwBIMP/dD0Fp+DV9mLPqDGkJCug4hPit7oqQozBBzd1pARe4nlk+2V7C6uCuGr67fGbwU4lttk
	fetOMHL4iYUlEA==
X-Google-Smtp-Source: AGHT+IEUjN3gs/vgcSyV3xa8eYF+tOlngAqw3C6M762kb/hbi1cU/0PcGo2jLZC7dcyMer/PguHNxg==
X-Received: by 2002:a05:600c:5811:b0:436:488f:4f3 with SMTP id 5b1f17b1804b1-43924991efamr149129625e9.17.1739275732441;
        Tue, 11 Feb 2025 04:08:52 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:561:8978:1d41:636a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4393b66f3e3sm86966375e9.19.2025.02.11.04.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 04:08:52 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 2/2] gpio: latch: store the address of pdev->dev in a helper variable
Date: Tue, 11 Feb 2025 13:08:47 +0100
Message-ID: <20250211120847.42437-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250211120847.42437-1-brgl@bgdev.pl>
References: <20250211120847.42437-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Make the code a bit more readable by using a helper variable to store
the address of pdev->dev in probe().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-latch.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-latch.c b/drivers/gpio/gpio-latch.c
index 722eb5b045f5..46cdfb08747a 100644
--- a/drivers/gpio/gpio-latch.c
+++ b/drivers/gpio/gpio-latch.c
@@ -143,22 +143,22 @@ static int gpio_latch_probe(struct platform_device *pdev)
 	struct gpio_latch_priv *priv;
 	unsigned int n_latches;
 
-	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
-	priv->clk_gpios = devm_gpiod_get_array(&pdev->dev, "clk", GPIOD_OUT_LOW);
+	priv->clk_gpios = devm_gpiod_get_array(dev, "clk", GPIOD_OUT_LOW);
 	if (IS_ERR(priv->clk_gpios))
 		return PTR_ERR(priv->clk_gpios);
 
-	priv->latched_gpios = devm_gpiod_get_array(&pdev->dev, "latched", GPIOD_OUT_LOW);
+	priv->latched_gpios = devm_gpiod_get_array(dev, "latched", GPIOD_OUT_LOW);
 	if (IS_ERR(priv->latched_gpios))
 		return PTR_ERR(priv->latched_gpios);
 
 	n_latches = priv->clk_gpios->ndescs;
 	priv->n_latched_gpios = priv->latched_gpios->ndescs;
 
-	priv->shadow = devm_bitmap_zalloc(&pdev->dev, n_latches * priv->n_latched_gpios,
+	priv->shadow = devm_bitmap_zalloc(dev, n_latches * priv->n_latched_gpios,
 					  GFP_KERNEL);
 	if (!priv->shadow)
 		return -ENOMEM;
@@ -176,7 +176,7 @@ static int gpio_latch_probe(struct platform_device *pdev)
 	device_property_read_u32(dev, "setup-duration-ns",
 				 &priv->setup_duration_ns);
 	if (priv->setup_duration_ns > DURATION_NS_MAX) {
-		dev_warn(&pdev->dev, "setup-duration-ns too high, limit to %d\n",
+		dev_warn(dev, "setup-duration-ns too high, limit to %d\n",
 			 DURATION_NS_MAX);
 		priv->setup_duration_ns = DURATION_NS_MAX;
 	}
@@ -184,7 +184,7 @@ static int gpio_latch_probe(struct platform_device *pdev)
 	device_property_read_u32(dev, "clock-duration-ns",
 				 &priv->clock_duration_ns);
 	if (priv->clock_duration_ns > DURATION_NS_MAX) {
-		dev_warn(&pdev->dev, "clock-duration-ns too high, limit to %d\n",
+		dev_warn(dev, "clock-duration-ns too high, limit to %d\n",
 			 DURATION_NS_MAX);
 		priv->clock_duration_ns = DURATION_NS_MAX;
 	}
@@ -193,11 +193,11 @@ static int gpio_latch_probe(struct platform_device *pdev)
 	priv->gc.ngpio = n_latches * priv->n_latched_gpios;
 	priv->gc.owner = THIS_MODULE;
 	priv->gc.base = -1;
-	priv->gc.parent = &pdev->dev;
+	priv->gc.parent = dev;
 
 	platform_set_drvdata(pdev, priv);
 
-	return devm_gpiochip_add_data(&pdev->dev, &priv->gc, priv);
+	return devm_gpiochip_add_data(dev, &priv->gc, priv);
 }
 
 static const struct of_device_id gpio_latch_ids[] = {
-- 
2.45.2

