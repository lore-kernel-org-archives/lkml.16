Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBF828A407
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 07:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751874629; cv=none; b=fUzytVTDojaSBjmOlDIKaidq9j5APupCtlF0h8CkLoLnUj0GFuANh/aIssH3auHJM+gB5oert3g2cBq6ZCnpRrP8852chw0ZKRFFkiwk1HiN0Wn/IdE/UvCdr0SzQNK01t48TppRjLLccUJi70R+PvX3KKhBinlGzz2qj/7EhV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751874629; c=relaxed/simple;
	bh=qw91wZbbYo21BMmQdy4lJbuT8urm2Cy3wB4y42B3HP4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pRpH+GV+GKtVI5HBTGfaCGqqRryxnDTsjuP3Uf19G6jqK2pNRFO8ym47IQxSppX/pHoIvRMRD1aQibFHuYubp8pIr+yjdJ/l9+a80z2Vj6jjZJZHk/CKAjLbVkYbF4Y5QkRzJSNZ4mGYmi3xbHWb07OnYT/xTPvrQO+wB1oSydA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=CBKCCBak; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="CBKCCBak"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4538bc52a8dso20955155e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 00:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751874626; x=1752479426; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=owEraWtJk7venlb8RdKv9EQUsLOSykpZFSy3CByRBtY=;
        b=CBKCCBakRA0qu4XHPZTpj2HHUJsrg70Pao+7oO5Cf/i0BCfMEjWUqmK/f1H3AUDQZ4
         /VfqJ4aujkeZy1WVj4s6ZO72vvCqd7v3C739FUjj6rIbs/b0TVimJu7XT1Tlpm8j7UG+
         BvBWCtEFAx1SBUVmQpgK1YpOz9vlEfuxKNe9K2+Ni6xyEIlnYWpxrQK+kPJZAEkYNmpU
         R0aq42BuqnM8t/QTo0jTq5W8/1ZXK8gGEzDRvHWkViW3zyuAsI+g5D4hQlVStBAimbEO
         YBygeiysS/Uh4eZPtJeZhD/oIZ/JZ4A3pLGZye3PGHyuGYd59kl4IbWOm5HoVWpTnAMj
         11DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751874626; x=1752479426;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=owEraWtJk7venlb8RdKv9EQUsLOSykpZFSy3CByRBtY=;
        b=v1KgCMiDm5C1j7Nee1aJF7f+zH8frSgIzwqcCFS3THeVOuYxfDruwwtD7t6PRAh7yi
         dhDkNW9PzuRk1LAtUAQfIc9FvYUGt9wg34zXfWk8hhWoJMpXW1cHsOL0EYhO4Ml37wnt
         jC3L4g+N4S3apR0nKsjESTZIwXFQppeqSUCvbLXTCKXgUPpTmd4qFJou1dCwXBM1CgpV
         VRyMVEhusB0xn4QohfcKI7hmUpH9xNoAvTCrl8PjB05vsCWfMcE9kwpk82sfNUJaCb4/
         P1Lv+x1Liau3AyujKLxDBrRYKoxmSf1Pw+6ruMoMV1WvmMk7yBg3rG0EE8ItBOeDzhaD
         VHfg==
X-Forwarded-Encrypted: i=1; AJvYcCXyAh+nsA5M7VwuCir9ALANgup2zX/N1mfK5Ri+CRFf7tBAO1QQn2eD9qh2MXaom6VRmvMBzbVFLxlzZ7w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdEBdNOrzdCL5+uV9WR34cWQ03AI/ziErzVL/NApmtqrrsMT2b
	4PJCrtIDi8NmL2duleI+ZxFrGpa/6M+Xwk6IDsZAfaI1SSd4gydmYZ4PXhMa1u4bve1zsddl0DT
	x4mQ+LrM=
X-Gm-Gg: ASbGncsTCgCau+IekJ+ep1wgTNnU5WYSRrDWuLgOJLattXwekX7zFa3StdoErA9Bs4+
	iOWSqAbr1SZu1ARjWGkce6bQCExbr6EWs96ywsL69Usue3EgsNsY6NOJis9WOnlliJBhj4swo2p
	cVJOjiPT4Nw/wNFal12ev9rnV3tPQxrl6PmrhDQ7Yp2DA+scFl6xgb0wLCyrou1/PapnwnMq8DD
	tey7sratNFUCWxZtCSqWiGFgWsQcVVqsmR3xv03glnthosYkkSSkSPL3I+M2P7VNqkQL7PS6sEw
	QWuPu6EbEzW3cqBrYCp51AcVyhIxPn1Ntl/CK2hI9pLVS7Cu78yfIYd5
X-Google-Smtp-Source: AGHT+IHcLAdEzsYO6A/XPeJMQOyMyLhg3wuM/Yxmsuk4VJlAur6oeQiGzHyOLYpkD1eISNiDrgZeDw==
X-Received: by 2002:a05:6000:2910:b0:3a4:f63b:4bfc with SMTP id ffacd0b85a97d-3b49aa7748cmr4980896f8f.34.1751874625808;
        Mon, 07 Jul 2025 00:50:25 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3cf3:a61f:85ed:69db])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b1893479sm104215455e9.39.2025.07.07.00.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 00:50:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Jul 2025 09:50:17 +0200
Subject: [PATCH 04/12] gpio: tps68470: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-gpiochip-set-rv-gpio-round4-v1-4-35668aaaf6d2@linaro.org>
References: <20250707-gpiochip-set-rv-gpio-round4-v1-0-35668aaaf6d2@linaro.org>
In-Reply-To: <20250707-gpiochip-set-rv-gpio-round4-v1-0-35668aaaf6d2@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Viresh Kumar <vireshk@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux@ew.tq-group.com, linux-arm-kernel@lists.infradead.org, 
 virtualization@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2364;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=kbZlw0Gflv8gFE21sTPxvu5J+D1q02/GNnK0E//zR6Q=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoa3w6Qiuf9YTwbK1bK+qsw0alzUiL3Ps+RmwD5
 en/aypaFgaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGt8OgAKCRARpy6gFHHX
 ctgGEACWZF3GkmtOU1lcrcGxOt+PD7o21FLW6YY0zxGTvt1wqNCGZp9poRkY/LZfSCp3ZCSylD2
 6NKfGD3rh/jwb1Da79u8yrz8yLle2lcp+RxNaRQx7QEyX9vNYYoW4NbnBZcBIcY+AU/6/5pN/an
 gL/stbN7EZ7eonR/d+ivYWJ1WAS2/lmEhgy+KpM7dF42vlbYblVYg+PO2LwzC87po7HEPYb2LTy
 scELTrQDhw/7137Hep4J1Uqrh+JfpIeg34Lgxgj4GPa+ouTB3myVdotFWUxAVdIhjHr38Dh4TNb
 8SfcQkHOiPRFbmsK/b97SRINPRwJiN3zQp5WaMYDU1bV58SHT+PAcPzth6sCtUnP7eZA9JKiLWU
 tyEj4I8fd0uFuFcgLzpD1xDJ5nnWVQGM4ALC6keR6Yb6gtpJ5wCGZmYO0UNQdwFswIg++q4IhNq
 8SNM2YNBHfSXVbxQBzjhpQdecYJqrGm2+s7rHp4OabVl5rho0u8UM4bJSmAPrfzSneMZeZNuBvk
 JuP9ioG+07Sb0/BAZeMlqsOPCCNVmSg+KgW5DcC8KauzF4bKlHiFMvNt8kGrRTYbjTGdbjHeFhN
 09WNxjJXGw58AijtZ/+lKP8Q+hVbd8lS9H/Ki/Bkh4qANo4/UuKEvPsjoc22ipEeCISokG2Eb9X
 0EnpgzbKrQ88bOA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-tps68470.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-tps68470.c b/drivers/gpio/gpio-tps68470.c
index 532deaddfd4e2e2f306f3872e746ad4d85925893..3b8805c854f7dbf4ae96fc06afaeb775bbdcacb1 100644
--- a/drivers/gpio/gpio-tps68470.c
+++ b/drivers/gpio/gpio-tps68470.c
@@ -70,8 +70,8 @@ static int tps68470_gpio_get_direction(struct gpio_chip *gc,
 						    GPIO_LINE_DIRECTION_IN;
 }
 
-static void tps68470_gpio_set(struct gpio_chip *gc, unsigned int offset,
-				int value)
+static int tps68470_gpio_set(struct gpio_chip *gc, unsigned int offset,
+			     int value)
 {
 	struct tps68470_gpio_data *tps68470_gpio = gpiochip_get_data(gc);
 	struct regmap *regmap = tps68470_gpio->tps68470_regmap;
@@ -82,7 +82,8 @@ static void tps68470_gpio_set(struct gpio_chip *gc, unsigned int offset,
 		offset -= TPS68470_N_REGULAR_GPIO;
 	}
 
-	regmap_update_bits(regmap, reg, BIT(offset), value ? BIT(offset) : 0);
+	return regmap_update_bits(regmap, reg, BIT(offset),
+				  value ? BIT(offset) : 0);
 }
 
 static int tps68470_gpio_output(struct gpio_chip *gc, unsigned int offset,
@@ -90,9 +91,12 @@ static int tps68470_gpio_output(struct gpio_chip *gc, unsigned int offset,
 {
 	struct tps68470_gpio_data *tps68470_gpio = gpiochip_get_data(gc);
 	struct regmap *regmap = tps68470_gpio->tps68470_regmap;
+	int ret;
 
 	/* Set the initial value */
-	tps68470_gpio_set(gc, offset, value);
+	ret = tps68470_gpio_set(gc, offset, value);
+	if (ret)
+		return ret;
 
 	/* rest are always outputs */
 	if (offset >= TPS68470_N_REGULAR_GPIO)
@@ -138,7 +142,7 @@ static int tps68470_gpio_probe(struct platform_device *pdev)
 	tps68470_gpio->gc.direction_output = tps68470_gpio_output;
 	tps68470_gpio->gc.get = tps68470_gpio_get;
 	tps68470_gpio->gc.get_direction = tps68470_gpio_get_direction;
-	tps68470_gpio->gc.set = tps68470_gpio_set;
+	tps68470_gpio->gc.set_rv = tps68470_gpio_set;
 	tps68470_gpio->gc.can_sleep = true;
 	tps68470_gpio->gc.names = tps68470_names;
 	tps68470_gpio->gc.ngpio = TPS68470_N_GPIO;

-- 
2.48.1

