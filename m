Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67F624A049
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 13:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734131; cv=none; b=tgwQHWoB/DShhAHw1jFz3MTyvXa4oG62wsUQ12Mav03z4NYuoweGrO4UVbJTjNZactkNWzWS4mB5MwkJyEMtAJ7N3dXV+hdCjjfIXkdvqHMzR87H8WHwz/10mtgRf4+5yBT/bT67CBlbWqglVggYL9hqTLblIA/8hozm1pcIoz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734131; c=relaxed/simple;
	bh=kcI0bfI5H/Hmf5yZdyf0QMbThFtI4nWGLfbZ3WK0FlY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oRNn/UOUXUmTgt23LDs29VTcrZlHG1B7qFazDoc9wMjyzA4LfmvvFxMe8+T3UsL5S5jRHKE/ArmW0xpkqllPKAqbJGVj3zCoG+Fh9cAKj6a4MG3k5VIDAT48yWP+Wx9VqlhZoORuP6SCwHSyegkhyVRvB6S2u5chv7CTDXXRBZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=kf0hl+oF; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="kf0hl+oF"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a361b8a664so849777f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 06:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749734127; x=1750338927; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tPh64evwrzs2XEZo26akT0hL+LXbpDIaNfa8zeCvhbI=;
        b=kf0hl+oF1YH8z2XK9SBxt88+4+55wGdV4bnjPQkPBgQb3QXeZIUvm0m9pP2PhD7dLg
         RhIDNpLUOSXaTMOmjXx35qqKA1fiWSkFTUC0AVlgDYYtiUlyspoy4sDVf6eIBqXBjFNA
         F6Xlt8beduzdKIf6CLjtdJRFHCq6G+xvgZAkUl/TCayN+pJafPyVPxyC+QHoXm2WnR9K
         slSRtzHCS/Q5kKY+ZUYI9yRtMVIDa8vYDf4YC23QZeSvdv/Dyshtg9FYsym42t26dI0D
         c1fTbZlVrQ7ayLcX89D8RwmQmyDZW+w/jKCwnFYKIgubbBhp45dQR2NyqSjErjeqRjJx
         w1bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734127; x=1750338927;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tPh64evwrzs2XEZo26akT0hL+LXbpDIaNfa8zeCvhbI=;
        b=l7Rt+jBJfwOrv2PDFUCth4PIomwxCn689+8uc4tlnE0l2d5OXz4VtddbnLvJvc8jc1
         BOCMQUcIB2PFX2NT5btSYoz5uP7GTaDrSpAKnt1/u1Lom484xIpsMDx4jNvLPrt5AdrA
         yGimuJp4HpOFijK8rIgYkDuzvGpV9vgHkR2frKmlhpw271Iz7dLjVaogR9UnE3GY6CKh
         sJh2czXrv/9htF37oKFiwQiJigbSJMyML/eGnzlh3jY0wm0cehijb1o1irEkkG+OLfPc
         QQ6WYpTJoZQsFJ5WvZlfoKhwm0GAroRK8fcSo1OGUd9a25RPPIjcUvHZHptC04RIPrpz
         3bfw==
X-Forwarded-Encrypted: i=1; AJvYcCVrrJBgaB378BOWgaKQJfhnmqlSP8wZehxHjdwzSEO2mf5bJxDE9vaULuXPT61cTr9Yp5F6G6ByqS7gc4c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCLX5PBvPScO6dUA3WutaXVvpktryVf/cM1qAV1qyIBi22r8CE
	9JrfomtTdUZaKklwY7HNpW5mkbrs8a68A/b/znoyDsKe25pIYzOH7+3VD41hzfinrdg=
X-Gm-Gg: ASbGncvv1YUPwkAaUImivAjdVOp71A5xgzWpf5hjFNwhVSFnBnZZAPH8DtdDTTkvGzQ
	ORhjtKanjvEPlvT5W6tJiUM0SZohqM/p6xSgEv4nBsP5hhF1Daf6ztYwz17zeWlkkrA9FouYz1E
	yzHPF/7KKgXqYth9vD4TH/3gbXcw0zCT0VgAMyS6NhdkeO9oM0nRZzibxAvUyL4vEOpiPiTRodu
	gxNajhsAMFZ7GBrhSL6qkuUzRWT3ScBUG19Sxg5fUp0TV3VGyDtxPKSMYTUyP9f9/ZwYpqZM8H1
	DBpU+cok9xpSJbF4K33IfQ/iM6zFrpZx4OLUkYx4Qo3qI03pu8x50fkNqHQVubc++A==
X-Google-Smtp-Source: AGHT+IF8dQFZu3267rnqS9T+MlnDpsGMNr4UhOIVEWZlRhW8ilrSLXmT3/L/LQod0dJlLDDEHru6ig==
X-Received: by 2002:a05:6000:2505:b0:3a4:f7e6:2b29 with SMTP id ffacd0b85a97d-3a5586dcc29mr6204277f8f.5.1749734127149;
        Thu, 12 Jun 2025 06:15:27 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8b99:9926:3892:5310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea17d7sm20619795e9.10.2025.06.12.06.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:15:26 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 12 Jun 2025 15:15:14 +0200
Subject: [PATCH 05/16] pinctrl: wmt: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-5-556b0a530cd4@linaro.org>
References: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
In-Reply-To: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
To: Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Baruch Siach <baruch@tkos.co.il>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Viresh Kumar <vireshk@kernel.org>, 
 Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, soc@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2065;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=zZBlMtHKzzXioPhlG1XBi+lA5WvGdR2KtCyPxbjRVIk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoStLll7sZrjDKxB+yIfzZvsGDAzsgGsNSphici
 P1S3FHTYBuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaErS5QAKCRARpy6gFHHX
 clh4D/0eejaFFeaR28Vf6ymty4cRxtkyHHnZyl0oNIAQK4k2LKxfyvv1Uvm5rcDeJyn5YwvFLUM
 63wQ/V8f3n0FvrZ0akyzb4OoY/gTGr9TqBrRvfmdw3r88RstUyCq+LAePz4qg737URegvsmvcqD
 d0sTmTdeWFE8SJUqM1Rthnrc32nwNGmdogrzN3Y3ZySLnrLIrGYKfwRv1uaBnPxjdZ92ZZp7S3u
 EkfpWxLbbosC+cqD7juqS5+lazxS8yOH2tC8dPPUxwYFwlA/yuIElg3a5eB1sSMrR4EGmkb2RuG
 omLdr7y0eoOfBmNyoHulUJeZERWMiUDyTpZuVWgKEfCYdzgb/Ti1935juLv1SrhpTfvkpL369DG
 saMpzPev+8uD4fKF3iWymk7Rpdk2zZ+93Ey4bGlSG2YDdgz5qd31nsBMFhvQPWVdVKNty0XtRyX
 mt0+a9PFIVXl1mjGeDhyldfzWKuR1cd3kDzod6bLGisrs3zMUq+/Ru0yBalUAzuB40k9boYhvhv
 jfa8sc/Rp5eAZ3YSb7LDTNEf9m5zWmWu2wMBGWlQIS0JyYZqtY+6j37fbI16nOHQgPZcd9zGGG/
 cvIur8XbL1wPUk8bK7ZObQF8wT/Nu0GAH+UK2fj/hAJAIHmRY6Vy2gaw9fAM0vxRT/AEE2HSZfC
 45zRTemNQslYrtA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/vt8500/pinctrl-wmt.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/vt8500/pinctrl-wmt.c b/drivers/pinctrl/vt8500/pinctrl-wmt.c
index fce92111a32e4976bd31c7e9845e4fd08a7affa3..767c6808a463ede61aee61b63f28ee38185b7633 100644
--- a/drivers/pinctrl/vt8500/pinctrl-wmt.c
+++ b/drivers/pinctrl/vt8500/pinctrl-wmt.c
@@ -507,8 +507,8 @@ static int wmt_gpio_get_value(struct gpio_chip *chip, unsigned offset)
 	return !!(readl_relaxed(data->base + reg_data_in) & BIT(bit));
 }
 
-static void wmt_gpio_set_value(struct gpio_chip *chip, unsigned offset,
-			       int val)
+static int wmt_gpio_set_value(struct gpio_chip *chip, unsigned int offset,
+			      int val)
 {
 	struct wmt_pinctrl_data *data = gpiochip_get_data(chip);
 	u32 bank = WMT_BANK_FROM_PIN(offset);
@@ -517,19 +517,26 @@ static void wmt_gpio_set_value(struct gpio_chip *chip, unsigned offset,
 
 	if (reg_data_out == NO_REG) {
 		dev_err(data->dev, "no data out register defined\n");
-		return;
+		return -EINVAL;
 	}
 
 	if (val)
 		wmt_setbits(data, reg_data_out, BIT(bit));
 	else
 		wmt_clearbits(data, reg_data_out, BIT(bit));
+
+	return 0;
 }
 
 static int wmt_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
 				     int value)
 {
-	wmt_gpio_set_value(chip, offset, value);
+	int ret;
+
+	ret = wmt_gpio_set_value(chip, offset, value);
+	if (ret)
+		return ret;
+
 	return pinctrl_gpio_direction_output(chip, offset);
 }
 
@@ -542,7 +549,7 @@ static const struct gpio_chip wmt_gpio_chip = {
 	.direction_input = pinctrl_gpio_direction_input,
 	.direction_output = wmt_gpio_direction_output,
 	.get = wmt_gpio_get_value,
-	.set = wmt_gpio_set_value,
+	.set_rv = wmt_gpio_set_value,
 	.can_sleep = false,
 };
 

-- 
2.48.1

