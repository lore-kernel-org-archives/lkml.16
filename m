Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32036298981
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 10:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750847630; cv=none; b=PufWSOy2FMGuEWmpY/eLo8acTPUafy7SUJe5eClOLZl0+8EgNeuWNRb5b8Pku5S4H30OdBdhxD5k/ZrBOmfwgy6cj80tb2sFqdSI1bzQWCi+U3Jrq+1QdPVC/VmG99vd8JZOnKJl65fkofAAy3io+ACEJIsVPngTZE+4xnMxiOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750847630; c=relaxed/simple;
	bh=8I9dRWWDYhuA4l+vSi48OR8d0DBnwZ05W+pEhASmVFI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MEPBA31cO6Uoxft03HYgvJTR++ghyccJqGL1cK+P/expKAWo08wnHXxztvMKB5FTgCgxPbF0sdAQgQzjTwiHX/1VewaWp2IiZIW5gEGr8RHr55iOfKd9izvzCAunEb6KpZkWEy74LlUQv/9aSvLD47moZ6Bi2ztYDdX353VjQyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xSCu69R6; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xSCu69R6"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-442fda876a6so57515515e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 03:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750847627; x=1751452427; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7iDWjP9HRVIb7sR3VThhC45lPvgyQWTusyUiyxvyENs=;
        b=xSCu69R6CUZltjj79cvX7cYrsHaZmUSaey2KS/lq2D4RvQXaWMAPrw4gVlXBnRM3y0
         rzsHHCatALjyE9mYkyVqyI2KSTJEGZhDkkjcNlL0Pe02HjZReBYoVNbr3bfFS+Fm8cyn
         YOmWwMF1cy/aljus4s4KJyRZGdjKQ3zciTW1HZJ0uWp11fuHGf6M43iRBxu5Es/hTsfa
         QGwzQ7NHz4eYF3O4+zeoxU2s6vEXG1nAnkL8IZzS4xZc0tj7T0WzIhhSvDh2Bpuy2kf7
         dzKJN/A7GyEPzogxDVzPU7GokpnQa/NW+s0zSUHzWf60CMewf/QxjA2moDDKf0acsLUt
         gPyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750847627; x=1751452427;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7iDWjP9HRVIb7sR3VThhC45lPvgyQWTusyUiyxvyENs=;
        b=Bxs19t7MFbwjKvvY1x6dp9i8JyHB+iNOWaN4bhjrd5g0RX1B7vmfT6P1akyrZhIfef
         BGbcUEXELJs5bDQAHNfIQjhWqr86Fq1EDTb2oFko2kEOWILhg3qdQtD2A9/7zAeuiiZX
         qlCvzjVr1qFs/VfVS3YaMPnaLuMOLRXrzBdR9ZxTo2cTQSAHT4iyxy6VrC/QPWgZhnRY
         9Yy4ToUxf/NnbdK1HbBwSswOfyZtZb9OXH0ZgF05+4eRxhQV9Os+WnejSp1+Pogwv+Eu
         HbivJRPfoal87IFIhM48j0VgnLW4UqW9IYnH6OJlmQQZ8Z9S7dAaDKrk55uOPFyqDSn+
         Y3lw==
X-Forwarded-Encrypted: i=1; AJvYcCX4yu+MUpCy7cc+vF6ZzFje8KB00D6+GeIT9wiU+4Iqx6QIgWHHJy1xV5Fmhtt6JgFMVQ8R0QyTEH0vkCI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKh7af5hmd6pcJfak4uMSS9MgJiCGAzfdZZejINGTfKEpPFioe
	pQ4XwJtcBj8/fuxhpDETl5zPjTmX0xC/Yar7bAC2HpQtFhrH5bfkpDaif5NU4sq61mo=
X-Gm-Gg: ASbGncstdQHwxNRIz3mijkKDzjlgv05ZTYHe/74TPCImTt/IsNUvHZp1cOdxjJR2hn7
	6YfIEFj7ynuN0d/qYhiqOc0S6p9xG0sJ+Y3xpVz3Bre0+IqSLMeAMUkPQuASc+vYCwhIxkEewZ4
	dSgjyajsKngi0u/lcnc9nEpHtehUIzQmtinVszQscY+Hc8b+08FDeuiyESEXPzVw6+Orep+evTU
	vbUBqoGAF/yxmrkTMX5q1PmqkGdlsnMZlLZeNhVJn4xjIA7tV3nn3712wJzXc74hatoMeT+DOp3
	sIJ6Z55ce7jVfAg/3PoUORdqf+TnvTyo64FSLHmVk+5eEQbc25iy+41m
X-Google-Smtp-Source: AGHT+IELePDfCHlBYQA947q59vgnMIBS0qmkpmIXczdAGAGH53ivPNqjGgKeUUibjSMbaCpIrdAsng==
X-Received: by 2002:a05:600c:a302:b0:43c:fda5:41e9 with SMTP id 5b1f17b1804b1-453821b0a2amr16718975e9.31.1750847627484;
        Wed, 25 Jun 2025 03:33:47 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d216:42f3:1e7e:472e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45382373c86sm16133195e9.33.2025.06.25.03.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 03:33:46 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 25 Jun 2025 12:33:30 +0200
Subject: [PATCH 07/12] gpio: sprd: use new GPIO line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-gpiochip-set-rv-gpio-round2-v1-7-bc110a3b52ff@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1462;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=VMUhzabI6TJSSEFS1lhCE2pMbGfsNwLrSf77JeJz6/w=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoW9B/PT5QyhI466mXWQVK5eZlhAG2qptU0Jkjk
 YBlIjzP9muJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFvQfwAKCRARpy6gFHHX
 cmjfD/95UQq01tmrRM1DzYdnerQeB3FFvKTQyd2fjDFNLy9dtXqfSNiftQA7k79L0u6uDb4TdYS
 zi+7vE56uklzOxkqrdBlFLv1eviupQLOy0Lo1o8B97QDAW8bfdlWushg08bvClpa4i4S4RN3zrF
 HMSuPvKlhrGDXidpLumdsrLg5XGbkqyAgAF/q32+Bl/OfGwv6000fdWfoydiq7JXLHqObRe7lLt
 wE0GbE/H4Yg/tSKKRd8ddQgS5zbAvXCKNo7KwXlTqwRg2t1E0c8kOpTf/OdftZ9/3dCfQI0ptMb
 lxwLYLcofM4g3TqBdVzbd1SK4EAG8zl7gMfAMlgbb1XlD502kJ9t0eBGlf2mjBsHdXZLKx1w0w2
 4BS/nXvbFE8KEBYIXWVF8WeAs9XJuUkCDCAOTCu89w+x5npYmQRlHaAsS8PqW2NsCKu/9MGBnX0
 x+0WdyPAA8tIxz4FCcsis54cIhLEiNSaCvxWBgdSDMFCu0H6Zvtl9UH0fCdldLPheqqb7cU6PQL
 QEq13Ow1loF3vWheP8IdWLLxQCfq/+gufdsNv8wP4Azdw4wH7kaT7W4nbGUReg+D4nXT6H1Spt4
 QxwERElhaH1l0gwnAEQt7yxu1L25+NykUVwAdwaOCMXFGdE/ffigUG71qFAxkCLEtCL0aOiiugx
 BB64jdkmLzfuudg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-sprd.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-sprd.c b/drivers/gpio/gpio-sprd.c
index c117c11bfb29a84d814706e383faa19afe513e93..bbd5bf51c0882704a9ead35d9fbc7d4b9bceec50 100644
--- a/drivers/gpio/gpio-sprd.c
+++ b/drivers/gpio/gpio-sprd.c
@@ -108,10 +108,12 @@ static int sprd_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	return sprd_gpio_read(chip, offset, SPRD_GPIO_DATA);
 }
 
-static void sprd_gpio_set(struct gpio_chip *chip, unsigned int offset,
-			  int value)
+static int sprd_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			 int value)
 {
 	sprd_gpio_update(chip, offset, SPRD_GPIO_DATA, value);
+
+	return 0;
 }
 
 static void sprd_gpio_irq_mask(struct irq_data *data)
@@ -243,7 +245,7 @@ static int sprd_gpio_probe(struct platform_device *pdev)
 	sprd_gpio->chip.request = sprd_gpio_request;
 	sprd_gpio->chip.free = sprd_gpio_free;
 	sprd_gpio->chip.get = sprd_gpio_get;
-	sprd_gpio->chip.set = sprd_gpio_set;
+	sprd_gpio->chip.set_rv = sprd_gpio_set;
 	sprd_gpio->chip.direction_input = sprd_gpio_direction_input;
 	sprd_gpio->chip.direction_output = sprd_gpio_direction_output;
 

-- 
2.48.1

