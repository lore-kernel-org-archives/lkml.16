Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DA229CB3E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 12:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749558971; cv=none; b=W21xAUdxyIGAkOGkY0N1cKPWZXK8LG/7Q926RVgEmaVmmMwVc06RpjjNY1+N2wmj1dCVKuT7cLsQ0sZ8NmXzUt+tTY4ecNV2j85HhUt/4qN4nOUMY/zxe34Dz6zXMk7QWZmR3gAWPoxgu6taOr/2Y3Ii65Yewl4V6+mTU23v3Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749558971; c=relaxed/simple;
	bh=kgpyXSnZmCFwqfmomq7FGHn3gBVV4OHMPubpvkjXFrI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A9e2lTz6qyKUX648XzHTIZBM78K9dZ+VEC0iIyTBaaYYALfEkM5RkcEmEPbfZdfBJC+9K4Ji/0KCB0oNJM9Qhz0Itv+01gdGO/kjthbf4UENnFaLYVRnsNUO8WCOYPxh8GzTCLKWQNBB6mPGbmDqqSX/wWGhsRkXRsFG40kBdnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=tEHi3Bh+; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="tEHi3Bh+"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-450cf214200so50131775e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 05:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749558968; x=1750163768; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EmUjxGb9YXlrFmgTBSGtVdHlWeBBc2YrESubaUeQXrg=;
        b=tEHi3Bh+XruBKEKnMg3YGLzi97cXmiX0nLxkjNZCLaNfsbDWwJ5B9Hux2QHaEaN1Jn
         VCusLoE91wgtXtyZitmTaC8QM+0Yqtd9ghIONGqjRZuwKimjEH3E/4VyqEB+NKy3969G
         rzz0MgnbHdz3oY/Z2tOKfXJzAGgC5ufI2gPURdFRKKLkZZdwoirCxfq0ddJsuEtU8d8a
         LledrMs5VrMEVN1zZe2G826s/+/+MH+7TcWiOI/4rOjYhjwr4hTbRhXcEj+WcSH0NnUC
         U2m41Qk0tfIOYzYAMa1/GGG/Fr8ZBpvlA0V5/0PbNKdDmaLWR8PccCtOZy3DaIJYR/Mm
         KC9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558968; x=1750163768;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EmUjxGb9YXlrFmgTBSGtVdHlWeBBc2YrESubaUeQXrg=;
        b=w1/1kdqYlVEJIwhchTXECRMK/FrWFec2KgDeqfU/292maFr+Ik9Tjgpb2L9RdWF35V
         vK8ovcm6mBSyPXenkihO85clSiFF6Yi26cqFI/Up85Xc8oZ/cTakRLtdZeS5HQn4oJDj
         mejiAhoBEUWC+9o6yuq97lDGP1RwBDgikAmuNWQdMot4xzg5BremmuVyOwSOUVFnx6cy
         IHlt9hRARujs2hjWrIVfvAxDpt/sfW7qgLwltjzgfx4T7uXFqUYTwB4tXQg6lANRzXRt
         N0U8Tyqlm1t1kYhzBH8ZxXSnfUOwvfAdDVTBszzXJYTIkDz9plwSzdF/X1r3DiIv5Mc7
         M/Xg==
X-Forwarded-Encrypted: i=1; AJvYcCUOgceWahgNzMYuvKhADOSakkRWKn7GJ1dzJ5lYNCCtErM2byGPMgTHgKaG4DZE9qY06f8ilAlNX2DcJkY=@vger.kernel.org
X-Gm-Message-State: AOJu0YykFa5bw3QShJf1NBlyh/qZz9C+4JI9btxiVxnP+5WNKPg9qqz6
	707srmn20o4xMfnlFekD4CW/F0a9uMLlPZoK+Apb3eyq7M9S+OBZtHx5EPccifJh3ak=
X-Gm-Gg: ASbGncsXN650bNvxW0fZ7uH6mU7nIqMpe3YyPgqvuwLbKBmYtj5z2xu4rf8I5AE4SoL
	L0QC49KGBqdTmCdxqanXT3kPyVDEyzD8rt2o0cben2Ycwaa5EnkOphrTcY8myU/7nFu4b7HnotC
	lVQlrWDmPUTKLzACIJb/Yb9820OM6LwCgeQ/M6kB8uWMP7sYp9cpMjQNKHNg6TQOUA5VGP6/SpD
	319xfBDyPamtneZcLv81y0Q7492AorHzX0jPSQ/yu0hsqExoFcFcU4LJ/EZgGD9AmUPNf3c+lcw
	F9LhvjWyXAp8cC9IVh6KL495hU3kGkz/747tsNt5ThEc81ejuos8Iw==
X-Google-Smtp-Source: AGHT+IHhf0yhbVAU53CCnx70BotxQgp+L6cndixtYZtb017L0GDbKhx9QFoSw4ecB4gLAszon3Fb8g==
X-Received: by 2002:a05:600c:458a:b0:450:cabd:b4a9 with SMTP id 5b1f17b1804b1-452014ea1ebmr148815685e9.29.1749558967893;
        Tue, 10 Jun 2025 05:36:07 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45307b4788fsm91008455e9.21.2025.06.10.05.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:36:01 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:35:39 +0200
Subject: [PATCH 5/7] media: i2c: ds90ub913: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpiochip-set-rv-media-v1-5-c088006a152c@linaro.org>
References: <20250610-gpiochip-set-rv-media-v1-0-c088006a152c@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-media-v1-0-c088006a152c@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Bluecherry Maintainers <maintainers@bluecherrydvr.com>, 
 Andrey Utkin <andrey_utkin@fastmail.com>, 
 Ismael Luceno <ismael@iodev.co.uk>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Julien Massot <julien.massot@collabora.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1383;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=uirTvdGFKLj1HJ829gQF9CK8Tn6xJqSzhqLKMW/nEqE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCad2woSfO3sebexW9Mt3ViNPTAVSqTNciWIU
 a1fvZKssH+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgmnQAKCRARpy6gFHHX
 cisHD/485qXHf0m8whtLOAatdU72Wh0xmX1LQCoEJ8lYqmSn1CNAuUbRDS5Xt++ChKIdlUgHAUp
 dha8+20jLZQG8Vt+PtimqLHAcQ0C1ysgeJAZ87FRyk8gZkZqQqtM22spmbSP5rEi3FKriglwT3k
 dd124M1zjStOeTz+SIKmrlTOvss4mJfsmwa5TU0LUB4HMfIwHhH5mhmK8EDC2Jr13o/WP/xsOxk
 v/yQPNoNaPRUA2UQRTFykbqozRLnsLlGznz4myOFJIZGXHUgg63M9vMYsi9WOlYQl+n16Kva3yS
 vaEu0TYIMPwAQzSKUvflz6sjYTY/oWEEigaDnvmBcSIs9jnplkLNiB9YajFBnSnbACEm9BKes4l
 6+wTXfBdD0VmbT6xIs8CTAXREwxDxSCbrv2PSVphbOMtF8LNH5AUCeZ86VaBIi0XFX+EozYEotG
 qCjcjoQkCKjX35KEy8LfeAspwkl+xHA5TmnLW/20UKv+QsWqiwIOa7ggoWaAQ7XxI9X0zZaFR4w
 9N6U1gejgLfC1a0E9M30P5uL7Vmc16fsnE5V1IFHUfO2218tUcbaAvfghe2jmmwNBlGTFivrVp4
 CDjsXHmTXpKm8zVrkf/ix3PYkogl3gAugAmVL9JKgI+IdlW9UmuLx6Fh/+yggvWpQ0A+ovEBeV5
 5FcU4DP9GWAOfpg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/media/i2c/ds90ub913.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
index 6d3f8617ef136c6f47871f5886193fe934c6f3b7..c34ffeae5f5080875463b6b6d45acbd9e107d461 100644
--- a/drivers/media/i2c/ds90ub913.c
+++ b/drivers/media/i2c/ds90ub913.c
@@ -203,9 +203,9 @@ static int ub913_gpio_direction_out(struct gpio_chip *gc, unsigned int offset,
 						   0));
 }
 
-static void ub913_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
+static int ub913_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
 {
-	ub913_gpio_direction_out(gc, offset, value);
+	return ub913_gpio_direction_out(gc, offset, value);
 }
 
 static int ub913_gpio_of_xlate(struct gpio_chip *gc,
@@ -235,7 +235,7 @@ static int ub913_gpiochip_probe(struct ub913_data *priv)
 	gc->ngpio = UB913_NUM_GPIOS;
 	gc->get_direction = ub913_gpio_get_direction;
 	gc->direction_output = ub913_gpio_direction_out;
-	gc->set = ub913_gpio_set;
+	gc->set_rv = ub913_gpio_set;
 	gc->of_xlate = ub913_gpio_of_xlate;
 	gc->of_gpio_n_cells = 2;
 

-- 
2.48.1

