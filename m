Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1A822DFAD
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 07:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750405807; cv=none; b=BatPSkA3cp1OyvZcfupqbsdD5nL3j59Zk0MU0i66UbhJscFWcMyeh1mXShpBZEtfnUObWp0p4k88bJwsAbLcpeH0mYVJPAlMiNdufpg+w+f+XCnL5OjF1fbnFX5Sq8I1qjyfk+dYi/Uuz0u1fQRLKb9FiqOq7S8Wx0KrGUQ5Rho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750405807; c=relaxed/simple;
	bh=qQKAs1X/idcDaCqNkY8izTWAI7iaNfyNo5OvgxUiWXk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Mygt6eU0TgUPRjL/a2M4y6pQ11biSEtSAIaH3VU/z8dhEx5BKgRHGh2/NyRCg5HpeRuTa3ipS3gVL8PrTELEMfdkpaP9tZ+7k8cSj1JzCd2hStg7LB56ilPEBeUgejRqSad6709kIrbz48cf8umfTj5W4uf41DS8GdkCTZlpYDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ujuVLiDw; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ujuVLiDw"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a4f71831abso1294726f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 00:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750405804; x=1751010604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hgs/aXUaS0FHvreTt0i+GqI5HPA2Yq2mywly9pWL0cQ=;
        b=ujuVLiDwZcq6NjQIccwbRtdpYSlVxClOaQ/3K3Pp2BM/CT9MUfNEoU+keKcpPo2kAk
         30y5XPZrDwEAA0ScEO/ZwUHsF8Rz97hkq0i4u9sAeHAp2Q7kWL6VdLaKTv1mbS8VH1Fc
         TatzX1pFjDG+1nXev1GydFUH4owkDkrzR/HZ50FTrRGZoy0zlNSgesfCRLbGyzX8UQa+
         z7KI5k9tzH/AVGEais7S6ZzhAuuYzwUKHIh1peU/FAx8AzDyuovCmUx7aArl/sl6+ju0
         L8FPC8nXDI8VCchmMIUPnylCCjVvnb4ZGtMWmdrNxhNXAZtvRSskGBDV3hgUxYVyc/b+
         QyGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750405804; x=1751010604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hgs/aXUaS0FHvreTt0i+GqI5HPA2Yq2mywly9pWL0cQ=;
        b=eFipuRrQG6CMjVMjucjJm/6GnoUhiN8p6OKUMloZa82GFonSPQAONpjf0VF+ZFidbP
         6RTvIr1TOOtGrL58ClsdYsk2Nk/JmzSaroOYvZgKG9PCHduG/B1D+t7qHUwOOjOXWdEL
         B9UzNrCUAeXwbfiq89GKYZE7v/3KXCX+SwqaiU51pGBsuZ2KBLb4+EfANAe7/43rJC9v
         M/vTy0GlVLVqw4moxFI/f7pwnkHIWfX0uiPd9Yq/JH3ryjEfgzG7KHaSbgx0ntYJagGF
         VvcqGpRO5zy2YeazSBZNNxFXHaz4dX+nwrRDh2A7TOFpvnxx5pZHseS6aCj9Wq55pvji
         KwAw==
X-Forwarded-Encrypted: i=1; AJvYcCV7J7QFVFdgXaMOuMmj6RVchE2zDkq4ahPYAWo4fP/B2eL7NAOHrWY9CIy5qHrGFWh7qek4NeI07BsC4gk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGf1f1EG0z8ZveYRBD9yC6VgN+YdH2wtkQuzYfXo+uGaS14e4l
	WLdcJGeyhnLSL2n7lBpJNKv9iCQIRRKePtSTJPoTeiaJq1lUYer0MY06xFDIx4YAdUE=
X-Gm-Gg: ASbGnct7yYrk2Q2mgKH7Zuh0QoCNumkLdiLZhcC1BfNJDNm8yvpH22YPIpK1T4sr19P
	c9GkX86WWQLz/EzpUTPozJPptBD3uwljFOlrYG4Op5wzKo6kLW0Xka51qgWaXpwSUy+W9UPqBHb
	ZQsz/23DaV0IqYXASp3Rxr+p7XHB8cTckUfAHhWlEexR1sttzJlsWbZc7Z9Hyz0C8RNHxBDUKo8
	sV49sWHVeHT8+KJivtqtFdsrWxsJW2TEIbtbNaZ9HRHTG0JQ+0SySsH8LY5ujbk/PYsB9WOFtcc
	e0/ViH6KPmlGAqRBQ/YZ3hzQC3LELe64Thib6bAzFDLA7pvthICokFhEbkRhp3U=
X-Google-Smtp-Source: AGHT+IFs8zGZQM01COG50yX2bVTZqY67pJjZf0ROPMbZcGOX6kAoBqID9nQ+RnfeZgYlSiBCPOybvA==
X-Received: by 2002:a05:6000:2b11:b0:3a4:f6ed:767a with SMTP id ffacd0b85a97d-3a6d1308facmr914488f8f.38.1750405803871;
        Fri, 20 Jun 2025 00:50:03 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:69fe:2655:53a6:f735])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535eac8e0asm50143715e9.23.2025.06.20.00.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 00:50:03 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Douglas Anderson <dianders@chromium.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] drm/bridge: ti-sn65dsi86: remove unnecessary GPIO line direction check
Date: Fri, 20 Jun 2025 09:49:51 +0200
Message-ID: <20250620074951.32758-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

As of commit 92ac7de3175e3 ("gpiolib: don't allow setting values on input
lines"), the GPIO core makes sure values cannot be set on input lines.
Remove the unnecessary check.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 78a50b947a08..3d0b4bc5129d 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -1677,11 +1677,6 @@ static int ti_sn_bridge_gpio_set(struct gpio_chip *chip, unsigned int offset,
 {
 	struct ti_sn65dsi86 *pdata = gpiochip_get_data(chip);
 
-	if (!test_bit(offset, pdata->gchip_output)) {
-		dev_err(pdata->dev, "Ignoring GPIO set while input\n");
-		return -EPERM;
-	}
-
 	val &= 1;
 	return regmap_update_bits(pdata->regmap, SN_GPIO_IO_REG,
 				  BIT(SN_GPIO_OUTPUT_SHIFT + offset),
-- 
2.48.1

