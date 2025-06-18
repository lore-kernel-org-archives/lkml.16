Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A364433CB
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 07:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750232820; cv=none; b=ilOfoDGrcwvx5OLjaJ738XjsnqEa2FnN4bHm6WYiSikb/ScrJ9f9cysLtGfcrVFsbnXsvuVU7mZa13ydNSNfDJv6q1pPrFJfXpGqa7I7zLNaFh8inzq6tlrHa4ihgqq3GKsj6uXMLEGEg2ol4ncEzeNBc5vHstozlZvJDvK8aM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750232820; c=relaxed/simple;
	bh=+3BcBUZOspt4x5dN8ZzJDpBr6nC0Moim+JtvaxFS3PA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MZYRs0FdXkNHub81wOO5yStflxvfyQTOTNUnLo/FjotUGGwILOYuKfqA1P4ycNNkvHeHRBfk880TI4SNv1qHfS9daMWj5UWyho84uOJP72UAVcKMhBqGPGNmJ/8E+De9CcvGXIWOUsM1hmFTlGn/qt49KwYn10kRUN8bKzC769s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=yrlygj5U; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="yrlygj5U"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-450cfb6a794so39342305e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 00:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750232816; x=1750837616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lJg4yyZdyy+SHk6YiTmAb2wt9Uti4xL3zx29Dsfyr+8=;
        b=yrlygj5UJ/nDQUl9TNzVG+dMa2+p1u3jYDC8zlSAQU1K2/l3On75WGOYNurAKNkvm4
         pPXSf82g0H09sgJvoCGmOeqetJ9K8+GtMxvMIz1gd4MxWrVyVMUBIQr++sqxduD5Zi6i
         eZ6qACv9v00MLmvSfd23MixTa/dGKCKFOVYjMHL7sNUU+fs1RqIW+w6Ocnrf6FzUvs1a
         8PBwYVfIomzuErSZJqIAIpoEpxWH1FDfvnlEBrzRP+0DI+y68kQkJoyLdH+UHXKkzlwz
         Acf23bhsCjQ0n9dl/phBoiKNeijJFBoWTpbru+qimfRbXCyvyJ1FXfV6n7yG6T+jZhko
         kqMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750232816; x=1750837616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lJg4yyZdyy+SHk6YiTmAb2wt9Uti4xL3zx29Dsfyr+8=;
        b=Fbtt9Czrd7o1ioGDWJX1UQ1FCUuvN+sfgF/0STNvCHuebWkC6KgcMxJ8LfCdOmEsvM
         mnCw3C3LoJlYAWFNjS+3oFCwSGC7eTQXXN5MGNvUH3+Igc+QzLqgZSqWSWIu+TfQdbGm
         EAiwsCp5MU/+6qPjiOs1wVl+M9Go6tC/QK4NFq4vALnLFWSDeU6lKNnm8e8d+53e0U7P
         K1vwd8bCrejFWWG8Gw5eSJmtDqqYQL/JUal5CNa0lR4w8nyJrUq8b+k3uBE9ghULV3d5
         sYO8BSqrhrcLwZ5gf55tfXAHv7i+F24YPxY1fJaRaqh6dQhbbqQLkUW30x86KTxpfrUk
         l5qQ==
X-Forwarded-Encrypted: i=1; AJvYcCWf3Ti6sYkOISzY6A9k5xxgQyLYGaPUT4Si2gWi/InfSoH82J1Vodx5maH/SMWOY+dRybjKxpyxdHK5epM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXXitnzZCpAqZ7gmwQrNwqmR12Qv4t4gs+wIqwkzuf8UIqP0C6
	c/a7BIHqD7yMsBaPCWfLxJ3t/hdTnwHr8nKinlO3z4uheCbUXzLCln/dsJ+rNjxKQ86gfRXuVmV
	aQV8b9Eg=
X-Gm-Gg: ASbGncuLZ0E1HnTIY6HWP6RiFBUu6Goun3m7NKSRASCWSu8fw5T5pqibv7LaqB+y/3l
	WMUzlbO1nD9/w2EBo56EpQHIe/9/PzS4KLP5zoRBdmWUG5wdvGC4C30bKdjH+yTR/w9oUMl0U7z
	nKIg99H0DdP5ZJwVChIjepTfeLX8Svk55jxD7mpyzObngz3JzS4KCHNWzXj5Dc9qgQmlPEH+FCp
	U+p1MNSxlgzAOLRH9hEy5ujcgseTviEo6f1bqijCCffHwMWVhet6wvJTLT3ha8E1vjceTi3Zpyj
	4I9qFviSuC0dw4T9cHyNY5NrDj/2I/YtjI8oVI9oK2+Cws7Zxo3HCrMVtPoXqw==
X-Google-Smtp-Source: AGHT+IGou4xH8VoI7WSbyUGe76dGESPFnQa358ovfW1YS2dfNymDbQsR3TYihNOw7qmu6ciZsMC1EA==
X-Received: by 2002:a05:600c:3e0f:b0:442:d9f2:ded8 with SMTP id 5b1f17b1804b1-4533ca6e93fmr176950135e9.15.1750232815589;
        Wed, 18 Jun 2025 00:46:55 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:ad8:9ec2:efc8:7797])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4533fa7a9a8sm131384905e9.23.2025.06.18.00.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 00:46:55 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] gpio: clps711x: drop unneeded platform_set_drvdata()
Date: Wed, 18 Jun 2025 09:46:53 +0200
Message-ID: <20250618074653.25555-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

There's no corresponding platform_get_drvdata() used in this module or
the higher-level gpio-mmio. Let's remove the unneeded call to
platform_set_drvdata().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-clps711x.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/gpio-clps711x.c b/drivers/gpio/gpio-clps711x.c
index d69a24dd4828..c0c8d29d0dce 100644
--- a/drivers/gpio/gpio-clps711x.c
+++ b/drivers/gpio/gpio-clps711x.c
@@ -62,7 +62,6 @@ static int clps711x_gpio_probe(struct platform_device *pdev)
 
 	gc->base = -1;
 	gc->owner = THIS_MODULE;
-	platform_set_drvdata(pdev, gc);
 
 	return devm_gpiochip_add_data(&pdev->dev, gc, NULL);
 }
-- 
2.48.1

