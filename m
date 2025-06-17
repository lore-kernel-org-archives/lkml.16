Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785B12E7F34
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 12:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750163093; cv=none; b=ZQs3KbjbSGfW5vWLP+1fn12zeDsxxpRLbn683s09lX8g01pY7f1efsvzwHQR/E9Rat2sP3cTcbTWF2d0laFhCAANYR4ohpZA0+OMliTY9e/oAAKvgzCEfruZMEP0p+ZbmPAMteWvICEM3Gv79DgIfeTdiwsancgrDGZmLjILXDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750163093; c=relaxed/simple;
	bh=KyzGRm5PzFaaCx6vaqmEFT/UHLNaTRS0BfqoZ2z4ZkM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aV7eclk3VJtZ2BHHEWyhvU6nKIA6Qn6YPQTg3mraFq0tL3/XO6q8kE239E1Ev5DZD7XxNZcxHr5UBerOrkdgfPgqvHnILKhwEYRjiupJCUNnTbAwUfUu8TqwWuWXYgyMByIHJOE0jdKW96whEC+13ppcfFZ9pN0nDdoojzkGyfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=EvFofddP; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="EvFofddP"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-442fda876a6so49883445e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 05:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750163089; x=1750767889; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8+GlKxeWL5Yw829/r0IFKSs2jp0Xuv75Z5VhmG/MTnU=;
        b=EvFofddP+TuyO7zOiDYJ0gcD0EHhGtiXlOJl4r0rd/mq9NMfn7Oj5SHqiX/H06LkBu
         7u/FgByU3AR0q+sa5qMoN6FcWjF1ZDSzdZvljGaUlfgcRHfJsHg56vi2Hy9zzZ4oZ4NB
         YOuRDbMQuD542sdB3Bw4PRjCP+sURcNlWGJPa8XKwBxjGe6sdNtmx45eAEcFt7hr2FJa
         yPg7BFCUtwCiMaHw1YLauo5s/OnJOhYrMle7IcxoiUqcuM5GaRhuNxWJFy0pLrowpfqc
         UUSCNhY38o8ZDOzYS/pzVvvPHjxRQU8Tm7ny1vEfkxmdKqgYjrj0TbpBstPYpIuV8HEt
         DVqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750163089; x=1750767889;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8+GlKxeWL5Yw829/r0IFKSs2jp0Xuv75Z5VhmG/MTnU=;
        b=XqE6MB4+5rT6LsBp3fQlw2MXRMGyWt6kDIyUawgTPdIRGsAwub4iIJc9kbLuUU+UrE
         78eA1w0LLQgD969SYK/JfgEXH8D+VJnO8uZuQen1gE5D8U2Wi1Qp8yTldkNAOHfk+xSs
         BszazahYnorivRZo86ukN7n7g4om0JTMaHJPSUNyFNIdz/vLQ0opT+0H8ya9+RHlCxvO
         1SAh0Wi6LjJlm4jqZPBjtBzFH2KljLXh+wvqbVeuyIxEKPm2eZGufTOsfxDek0SSce4b
         qAy3m+OwQ0LmzHLS5VsrRdxlP3fnKbv4k/eIGbcyFDKuBfPeTcj6rpLXvJQUNOxti4SW
         vbIw==
X-Forwarded-Encrypted: i=1; AJvYcCX7+IyOfKNu/MUt2+EQY87G21gWmHhU39BN6GA9foFosbsYXlKPC169///m62IPbj+MqH08Nt35KTHDroo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgCziv4emza3chdiO82hNh6uUbsFZXwoUgrkrK2Y6JOOuwI+XQ
	EjtZSWXllpNXfB9F6PR6zMrpqMEaBgibN6yoTAseMGgHKcfvHgxWPRnGspUKfqoQ+U1ErwzLwSd
	3Y+fPZ34=
X-Gm-Gg: ASbGncsciD4YhFDjgu1zrXXjGrU3Xam5Nl/f22TB2ho6etXHuVGnWscy0bgyAO+FlnE
	c5bFH/s77VmGJZJ2LW/KIzYruLlB1uOT659yTnEwhFl2EAvTxp8KJe2VIlfiFRxiY2hJGDMk3Uc
	sTSFtn6zu4yJQWdjoQ9H9imsV1gAmKtEYQudIEJCOQLdsuV0igCQpeE2gLGd/dcRhlTCE5uF4/f
	/IRKlPaQsPO+uP55ZMaiGbDkCh7vFqbQ6YN6wtROjPnbJyS0/IUfHJ071VIRpz9//F1DDWT9Jys
	mp3D2ok9euwNqOGO+cpRWniJsEA1Rns1IfWbH+9EOGqphwSMDIRFXhSs
X-Google-Smtp-Source: AGHT+IFwpjSz/VHM1KyhKvNfDih6/s2ZuW+4Piw/6pIGHipA31KSBXaVEaKGZPgbplZCT6m1zd4LdA==
X-Received: by 2002:a05:600c:5287:b0:453:81a:2f3f with SMTP id 5b1f17b1804b1-4533cad0f12mr125521595e9.30.1750163089462;
        Tue, 17 Jun 2025 05:24:49 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:90df:ded7:9cbf:4074])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45320562afbsm173816135e9.1.2025.06.17.05.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 05:24:48 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 17 Jun 2025 14:24:29 +0200
Subject: [PATCH 07/12] gpio: rc5t583: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-gpiochip-set-rv-gpio-v1-7-903703881fa2@linaro.org>
References: <20250617-gpiochip-set-rv-gpio-v1-0-903703881fa2@linaro.org>
In-Reply-To: <20250617-gpiochip-set-rv-gpio-v1-0-903703881fa2@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2356;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=aSlqvGnhuSY1VlIGZB65GCCYVPKtjnadnIRxz6DCqho=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoUV6HstBkB2gby7ddB5ZLVgfxa78tJTCxq4I8J
 JXEAxgt+RmJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFFehwAKCRARpy6gFHHX
 cnWHEADXLgTBO1s9GscEdPh3i4ocjK3Fa/8SahQJlDGg7IYd/EOFZsQB9lPfRFp1AmdlmS7Hyfv
 wGE5ENDEW385rm628aDZa1kkpglOzfjnYMKvsWysH/pBILnzwVxnNE4SF12vwSHkFjg0FN9MGLq
 Iibrg3tGBwjti1unsrky3likoeNWePQQCY/bjxBqIi4iaLMzHJFHZxNSRAAsmDiAbQqnrFVtDjY
 WH5QxkOAK/XBl/gNy+G8iBDGPIDqg1SRVQ26Lubw2pr7hxNP5e0dKF5xK4U9RM2yITwhJEDDCsZ
 D26jI2LV1B3QH6PdxJole1tENQRwDtL7XBgKx8cge9PwP+chO0J8WORAj6Mq07foZAnpLhgum63
 8fP39So4JYKqREjjgCgLJhdI/miZC+oTjHD+FRg+5puOVly96N3THIJ1Qg99d9Tdeb229ub7p7l
 xdFj2tti/aRhg5u6l/KFUttQMuS/QG/t5EPcIVfTYloM/GkfcitgFwLSxjLdT2e6qwYTyvMN/YW
 vegXsOBOMbpvEbX2FHamQUKwfV4eV8gcsThCxpamwhjZvd4WaYQLJinQgTectos4gxBgHa2i5TT
 1FoQlOY6pdq8zj/npDGDSKcwWyDBywH0KXAx7UR+/D1+AIcFMM7uHzUMrvQM3C71524LbPY2HAd
 aQ6m6DlGZp2r1SA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-rc5t583.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-rc5t583.c b/drivers/gpio/gpio-rc5t583.c
index c34dcadaee36d5fb775d4aaa8c8f8b275f4e2382..cf3e91d235df2eefc7d0fc93a58824edd55e9aba 100644
--- a/drivers/gpio/gpio-rc5t583.c
+++ b/drivers/gpio/gpio-rc5t583.c
@@ -35,14 +35,20 @@ static int rc5t583_gpio_get(struct gpio_chip *gc, unsigned int offset)
 	return !!(val & BIT(offset));
 }
 
-static void rc5t583_gpio_set(struct gpio_chip *gc, unsigned int offset, int val)
+static int rc5t583_gpio_set(struct gpio_chip *gc, unsigned int offset, int val)
 {
 	struct rc5t583_gpio *rc5t583_gpio = gpiochip_get_data(gc);
 	struct device *parent = rc5t583_gpio->rc5t583->dev;
+	int ret;
+
 	if (val)
-		rc5t583_set_bits(parent, RC5T583_GPIO_IOOUT, BIT(offset));
+		ret = rc5t583_set_bits(parent, RC5T583_GPIO_IOOUT,
+				       BIT(offset));
 	else
-		rc5t583_clear_bits(parent, RC5T583_GPIO_IOOUT, BIT(offset));
+		ret = rc5t583_clear_bits(parent, RC5T583_GPIO_IOOUT,
+					 BIT(offset));
+
+	return ret;
 }
 
 static int rc5t583_gpio_dir_input(struct gpio_chip *gc, unsigned int offset)
@@ -66,7 +72,10 @@ static int rc5t583_gpio_dir_output(struct gpio_chip *gc, unsigned offset,
 	struct device *parent = rc5t583_gpio->rc5t583->dev;
 	int ret;
 
-	rc5t583_gpio_set(gc, offset, value);
+	ret = rc5t583_gpio_set(gc, offset, value);
+	if (ret)
+		return ret;
+
 	ret = rc5t583_set_bits(parent, RC5T583_GPIO_IOSEL, BIT(offset));
 	if (ret < 0)
 		return ret;
@@ -109,7 +118,7 @@ static int rc5t583_gpio_probe(struct platform_device *pdev)
 	rc5t583_gpio->gpio_chip.free = rc5t583_gpio_free,
 	rc5t583_gpio->gpio_chip.direction_input = rc5t583_gpio_dir_input,
 	rc5t583_gpio->gpio_chip.direction_output = rc5t583_gpio_dir_output,
-	rc5t583_gpio->gpio_chip.set = rc5t583_gpio_set,
+	rc5t583_gpio->gpio_chip.set_rv = rc5t583_gpio_set,
 	rc5t583_gpio->gpio_chip.get = rc5t583_gpio_get,
 	rc5t583_gpio->gpio_chip.to_irq = rc5t583_gpio_to_irq,
 	rc5t583_gpio->gpio_chip.ngpio = RC5T583_MAX_GPIO,

-- 
2.48.1

