Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A869E25BF03
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 13:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734148; cv=none; b=TTJBwAtl0O8Gz47ThQlFy10LjucAK7n2QUXgIfXFG/d8sKA+piQ5UDglJl7/ejvPmk7h96frLkbzf4uTF2pSOlKhTi+KemNguLmnuCdPQ/3a1RlY+R4MdVrA2vVwvhCqHb3aM2wGnM+U7FD3iYTeSrV9aXfZJCzrXN509sQYe+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734148; c=relaxed/simple;
	bh=5pAhRcgO1+EuPNUIzj/fNOn0kIQ0uu1BHYpfqb2hKXU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qRkS3/5eL3U8gp2zqVZlkrimErX9wPCZ/Gk66Nowj1UBoHJ2kqz4E8Ph/NjNXsxpd+D3ZkE+J7GIPwj84RrzASHOXn6n6UKBMF1WH4bXh2Rs8+mUK9+OcilzrqCivIUB3LGTIBHkPZe2lQtZFHs0rMlHYgtlReylqdxqRYYW9Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=A7ibo2MN; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="A7ibo2MN"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a4f72cba73so1510045f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 06:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749734144; x=1750338944; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qXOeSoBKwd4+haJ3JvgSLXQF+sIOgqi9Fow9Bw5pk0w=;
        b=A7ibo2MNMC4mdQzPUxLJ38BUt6sOocs1SmvIrjFQX02eFgUqL96WGSikFuneY5HoFY
         IeEOkK69k+TEL1lNhP7FCu0u/93B06QREGxdgVf718tvD6e3FfHJr/REZ+ug0y3fddMk
         Q6Ss5NwNQKDouQHGKk51AZNSYJrey5+1yMu2hkqAZtN9Yh/PpNkhsFat8n0at+qzqfK5
         WFFJFh19oVo26HFXiaz2qrZF71r8mW/L8jgDQ8wTfZjuZp9AfSq/hFsQAsKQ7dvaGntL
         l2h478T1XP+/2R6bdnX1JS5EAs5Zm48oOQm/AlldJSqDWW9YnvcZNo0z89UZgGa80H00
         MoQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734144; x=1750338944;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qXOeSoBKwd4+haJ3JvgSLXQF+sIOgqi9Fow9Bw5pk0w=;
        b=DVc+ykBP68vfcJXxN3vhfpY5TSvpl3CnaNNJUv8d111pDUuqw+V492VXJ/FDvtP0mI
         TJPVacSHOtYwrN3tcOp9XiqU4bg4LgdbXurSNnVCGyz9xP0KAsj3VEh+OuSLshg+GfXI
         X+GZQ3uNpim0yAmR3sTT1exuQ3FvAIH5c/yf81i8oQ7kR4uSabyBqdeSDp4sU5VtMJqF
         hn4VnhRbQY1CAT+Z5+dXr+s6+D30b4+2TYbDVoM/4gGd6ontd20HDfDhwkK7ATuS5WA7
         rl+ZXT0d/r5iwieuJ2MiR8MjpevynPFewLv4KcxLXFolhhGbevMEc4Un8vbBF6Yujc79
         tLlg==
X-Forwarded-Encrypted: i=1; AJvYcCUO1Vd2WJdEA7uhYECOK0BY3Z+GV1x4RYuO+SHPkcHos5RtAxM9P0d8tU58T6VAI9kQ5c2/KfjK9xMYltY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5CVwsu7/iWF2/XROvqaTdX69AL3ivXXR1rzRki5PvEGTjI+Te
	Iuixyjc0XafHaROHXiJkeAEwY2IMANEXhBZ9E3cGwJ03XPimMKjnvfD78gLUJ4oRKbjod2QBHaY
	icWVzbtI=
X-Gm-Gg: ASbGncsKJshUwUvOqhsQA+Csavhv14OoR17iLiGsPs8LDqkP9yYW2e6TxK221yK9HS3
	mFHbdU7fguu0Mdt8Jyp/xTsWNdshY2+APbqzYoE5J2VpgoJEeUfyo8bR1dH/561FHHGzX7HlQV/
	8hAM9UiTASwe6agva6sByiMVojW2pAfuOzFS+g5HapB5esqjJPd+cw/vsnaFghXZqanX7iNXHCB
	DUmGOmcwsDr5SIU71OrksGS8Z70PRO9Um3Z4Sz+bGrKYULX+pTGLbBhlklQ1yqFGTQGdeJo8+cL
	QafDwOMtpT7CxA8eyYewsV0wX5ow4Yb2b+qP/U6PaeRk7acNU3IKJP4=
X-Google-Smtp-Source: AGHT+IEnpJ6Q4AZ8oPyYmaUzcDZGuReMq7lbniJezZBAPId2TYPV/p2NnMGPvdWDp/pysd3sY6Avhg==
X-Received: by 2002:a05:6000:1acc:b0:3a4:eb7a:2ccb with SMTP id ffacd0b85a97d-3a5607fa6a9mr2707038f8f.16.1749734143769;
        Thu, 12 Jun 2025 06:15:43 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8b99:9926:3892:5310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea17d7sm20619795e9.10.2025.06.12.06.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:15:43 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 12 Jun 2025 15:15:25 +0200
Subject: [PATCH 16/16] pinctrl: amdisp: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-16-556b0a530cd4@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1643;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ME7t3PhskqpuTEodGS0joNb0JvX701e6DVecRBqhzik=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoStLn8MZgPfXtIzTahad3jneTgIaic/QOkZGyI
 SGVy3H/f3GJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaErS5wAKCRARpy6gFHHX
 cmoRD/0a+ixlOlllZnxdQ3IwiZjofhYGTNWzylVmVuilwkjx74Ac0WhwgNOgk5uCmmF2NGn47Lz
 E435pD4buRkFabuolt2o9TL8wMz/0RDBg32C9bjwz9fezuo6zTgzSwOjEh5cRd647C84rRl0KWc
 YHu+TOoz2o4uLlV75o3nQTqLM3l1jFVZ3+VSt31kn1Zavk6/31+PgUYiSjgTIsxlT/Gdps4VRtH
 wa/aiQgsQsiFHtCM7iv1U583mqmt1fyy3DcZukPCRuIyWOIBMDvi/gqk9leFU29A9h0srxVog+b
 2atd0fQ4ad1OubxK41SjP79dMWtYCixfFespdF2IrwaZrVN03CtyobPyUeIkzlYqy+j+XcVocDO
 NjjWKIYMEYJkruZsAOCp6RnA720dgwIaPMSHCb9EL/t1FuLODewQSnenP5FeWSZaiw/y0s0HNWE
 u5xsj/scBHbfLBGmsXxgSr7mOO9hzjyNxYki8z8+PdJQHiEWRq0F1D+FoXcIHUqQ4YrQK5Dawhw
 aQuOGjzWqV36vIoUCA26atb3hiQS/pIePKqxAtnWOg9w2ghzZB8deMzBPTGDg632LEnQYGzr5eV
 2jZt4jkSxcUYLzAs2RNnPoiDh546HzSIvkw36qrNT2LHX7VrBQPLJOJDSZX0Wb2L7MnN8xnEan/
 UkQWDDMnqWN8GnA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-amdisp.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amdisp.c b/drivers/pinctrl/pinctrl-amdisp.c
index 9256ed67bb20e9eefef6c6574f1b60d71814cdc0..2e706bf8bcde0536b9e09614665d46130e12c406 100644
--- a/drivers/pinctrl/pinctrl-amdisp.c
+++ b/drivers/pinctrl/pinctrl-amdisp.c
@@ -117,7 +117,7 @@ static int amdisp_gpio_get(struct gpio_chip *gc, unsigned int gpio)
 	return !!(pin_reg & BIT(GPIO_CONTROL_PIN));
 }
 
-static void amdisp_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
+static int amdisp_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
 {
 	unsigned long flags;
 	u32 pin_reg;
@@ -131,6 +131,8 @@ static void amdisp_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
 		pin_reg &= ~BIT(GPIO_CONTROL_PIN);
 	writel(pin_reg, pctrl->gpiobase + gpio_offset[gpio]);
 	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
+
+	return 0;
 }
 
 static int amdisp_gpiochip_add(struct platform_device *pdev,
@@ -149,7 +151,7 @@ static int amdisp_gpiochip_add(struct platform_device *pdev,
 	gc->direction_input	= amdisp_gpio_direction_input;
 	gc->direction_output	= amdisp_gpio_direction_output;
 	gc->get			= amdisp_gpio_get;
-	gc->set			= amdisp_gpio_set;
+	gc->set_rv		= amdisp_gpio_set;
 	gc->base		= -1;
 	gc->ngpio		= ARRAY_SIZE(amdisp_range_pins);
 

-- 
2.48.1

