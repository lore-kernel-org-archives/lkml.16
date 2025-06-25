Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6EB2C08C1
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 10:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750847631; cv=none; b=LbDUauiLceRBThPSDuesGYM6HmS2VgppXXcamIDlM6Na0lCtIELv0OTkCdmYNjSRJ+LpK7Us5jE40CGqYsHy16un3hiAy+QofUbqDGL7Kvsk/ED7z16v3HvWhBweHTvy72B55mE61eJ7EMKMnlzYd90TseeKQn7tPwllzhW1UPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750847631; c=relaxed/simple;
	bh=KSrlQBLEsetS9C5DJs+mcQtBGebi+kqWmGzjgbA6Eds=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FCpSiwGNl1DwhAN5OOGgAwQcpR/e4MzMsauEtAKM3H0nj17jhOxX9OWKBqxjZlLO5NSomc2M4iEv3yfzMyNWsjIQsLnBBMfAc1p7ZmR6jgMWnmkywmQTjstWk0ezt5dfm0skzHYUAnb67eqIv9K5X7SDgmNTRVFAEk7aoTpHkRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=dN1XXnWX; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="dN1XXnWX"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a575a988f9so857140f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 03:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750847628; x=1751452428; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UhpR0LfXWV5JvZ7GhUzYmJjVTr5dLe2TK5VmVVpd0/A=;
        b=dN1XXnWXrnQdtL4Adu66ZWiWc2E8+qryxn9eUzL5TS5A8C+r8Eyik1JzRubxSO8Pa/
         yTnRj7mbtZKxeZSKddWzE4SlhkuBW2qq9zuaXnzXrl/6HmpVpvRhCVleRnr5R5JCWNhS
         2gsNmWwKWcx0eqOU73FUcF3hmEV+eMEVUQeKtB9iKh9tg9tF8u6NNqFOuKoTkE2dharf
         3OtBUPtzB0nb1jw8a29yOUrxcqwz95hxYqcA1EYeBfpO20zVbl+tnihApxTwJsa4wO0R
         LOuPUXGHH6TKJ0e9ytzA3tF4AVxq1otxVhnwH2DjZvozOxOq2iR3iWYS73rCoi46NFME
         hxjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750847628; x=1751452428;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UhpR0LfXWV5JvZ7GhUzYmJjVTr5dLe2TK5VmVVpd0/A=;
        b=H61vgO4n0OtATV7c/FpGQjLmP92pq1eUw/8GzZmrCKqmNlblhrsE/IVd4rGGy+huwt
         J+L7PL6DPDC8Pujtc8xprD2UIDejEjySdFJMjtMKANyLZCBhQuqMNe+OddtP7A0wXIUk
         X9acr+wgTQAQmxrzFnruBr/7saPTxfXqM4KTSA7m3mJF38oTfGyn6uG8coBS/EFNcBE/
         9d16qVvd1MWs31r2AAJ1/BzBVG8J1H0YIqDlZ0GEw93yIyL+1aQuftG2jblvQ/pFIXyC
         CX1fbhAk0i/63R7Dbncd1XJQayQe6mmC/4v9t0Jza+1PqML2LC9X7lMfgIrq36bKNNr7
         zCxg==
X-Forwarded-Encrypted: i=1; AJvYcCVye3vgqScVPhyOxoEx1vfMTCWeZS4hzd0vMZ22EkpATXMwMp37IcA8BVm7SaOptOiNxTHtzlb+X+XSiM4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJbQ7RehADruBqdenQI7mSvhAG0CdCwP/1A7l7ovMhSuJ7ed1s
	VglCwd/7Mwz/L/W/SvIaCSeQ8khVdymIC9JaQF8mS8fSd5qq4eewQEN2noBu7sKtf+c=
X-Gm-Gg: ASbGncuXg2/JMvkM+FNPenj0ncNLq6kj7g+2YMHyEg8BUVuLJePBMbEIYdIxhbbjZt0
	SVjnmxBU6aOQs9rvjuUlJxj9xIUJ9t3UnW+wwP59oK2op8BjI8KGHJOLUTkZRuk7llwUSXEjnbB
	mg54M1bzr9DppGMlMtI3hL92UH2UZVWm2y6XTvjBWeg13p/SRLR4dlsB59gwwDZ6jCwIv8FvQ5t
	K30duwpWrCgbG1uBN6NDLN/OyNnTgAUB7wfwQJTnHw1VuaMz11TQe8hcQ2e8UF6ehqMSCPkFgKi
	iHPbHhkrS9vvVJCu5DpyE2sGIgaLXL2nBILLUBAb1A077v47Fus0WdXa6bS9WLbR90o=
X-Google-Smtp-Source: AGHT+IF/hKIUSdhayitVn6hZpq9OzhaA692AFTDhpZlmYLAfLk9tzRqaFx2BldzhhLO5wdMy1ojcOw==
X-Received: by 2002:a05:6000:2d12:b0:3a5:2848:2e78 with SMTP id ffacd0b85a97d-3a6ed665f25mr1345927f8f.28.1750847628468;
        Wed, 25 Jun 2025 03:33:48 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d216:42f3:1e7e:472e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45382373c86sm16133195e9.33.2025.06.25.03.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 03:33:48 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 25 Jun 2025 12:33:31 +0200
Subject: [PATCH 08/12] gpio: stmpe: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-gpiochip-set-rv-gpio-round2-v1-8-bc110a3b52ff@linaro.org>
References: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
In-Reply-To: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
To: Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Thorsten Scherer <t.scherer@eckelmann.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2196;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=nrAVZPTBoQ229SHfDIh9dyXdsDhiN887rJ9P45Rfdwg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoW9B/iPuKORTRq0vxAyvSJlHeJa6L3vnSTVwpw
 VF0iwgRHxKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFvQfwAKCRARpy6gFHHX
 cmVDEACllLptf5+JN/M7ZjTKKdMSR2YDCttpmE92QMRcSl0mgSLtkXsSSOgucgH/9St3t5k8Tcv
 vashbOf6BSEiLN4QzPlBMbKV7kVSZ/WngXgf7EOqpYrIHhX3XBFw76oD/K2m4q/DJjlbgk1oWPV
 Ul2cfoZGdcMqv/wCxuoyf/x8xC/VVOOaPeq4kKA527sfJYtUxhpYZk6tWuh6sNuSGouWv8obOtn
 T+AykiwimcNihL4N9Zpv/kwCn3PQcDYNP07bGGyiYLHtd+6jg3jLa7l2XM0F60Os42gKe1tsjYg
 XGWLB8SwYdirUeIjzwtnH+Jb9vE2NHTPe/ATBzfbeRBMdlU75eDFdIUIIqo5NSybT1ZJ9rGS2kD
 THJr5zG9aVWsxJr+G89JfMthFE4WvgTo6CrnkmL9Kgn5JLDBM0kDUnC3ucXxrUUH3h5YeI7XzIT
 7SWkiwDjszDnRlceeSC6n84B8jl7R3b1TEgMy7/XhYi49D880xFWllNeTmDhbFx1yXLrcIozuWg
 xSTBeC4GmEV6X9ir+3FUxM7q1gjpFDUSSjMvrrb0UiWN1vy5KDkPCDfzNvp/7TphP33HMvXH/30
 1WGb3nh6uiL2c7jlf92sSoyAOF/D45madegStRtVXUntyWtIR9nOiQRestzsC+ofFVePlgrAjkQ
 vVc730AR8Zq3ZOw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-stmpe.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index dce8ff322e4722f6f97a9850772c7fe7defd9989..0a270156e0bea2f2a6914da6743df6d15b0870f5 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -54,7 +54,7 @@ static int stmpe_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return !!(ret & mask);
 }
 
-static void stmpe_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
+static int stmpe_gpio_set(struct gpio_chip *chip, unsigned int offset, int val)
 {
 	struct stmpe_gpio *stmpe_gpio = gpiochip_get_data(chip);
 	struct stmpe *stmpe = stmpe_gpio->stmpe;
@@ -67,9 +67,9 @@ static void stmpe_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
 	 * For them we need to write 0 to clear and 1 to set.
 	 */
 	if (stmpe->regs[STMPE_IDX_GPSR_LSB] == stmpe->regs[STMPE_IDX_GPCR_LSB])
-		stmpe_set_bits(stmpe, reg, mask, val ? mask : 0);
-	else
-		stmpe_reg_write(stmpe, reg, mask);
+		return stmpe_set_bits(stmpe, reg, mask, val ? mask : 0);
+
+	return stmpe_reg_write(stmpe, reg, mask);
 }
 
 static int stmpe_gpio_get_direction(struct gpio_chip *chip,
@@ -98,8 +98,11 @@ static int stmpe_gpio_direction_output(struct gpio_chip *chip,
 	struct stmpe *stmpe = stmpe_gpio->stmpe;
 	u8 reg = stmpe->regs[STMPE_IDX_GPDR_LSB + (offset / 8)];
 	u8 mask = BIT(offset % 8);
+	int ret;
 
-	stmpe_gpio_set(chip, offset, val);
+	ret = stmpe_gpio_set(chip, offset, val);
+	if (ret)
+		return ret;
 
 	return stmpe_set_bits(stmpe, reg, mask, mask);
 }
@@ -133,7 +136,7 @@ static const struct gpio_chip template_chip = {
 	.direction_input	= stmpe_gpio_direction_input,
 	.get			= stmpe_gpio_get,
 	.direction_output	= stmpe_gpio_direction_output,
-	.set			= stmpe_gpio_set,
+	.set_rv			= stmpe_gpio_set,
 	.request		= stmpe_gpio_request,
 	.can_sleep		= true,
 };

-- 
2.48.1

