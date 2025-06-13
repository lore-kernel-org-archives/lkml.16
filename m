Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9324222F766
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 18:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749840970; cv=none; b=n68ZC5iRAsfKy3SOAFicFaIjMy0XDQ8jmFshSBU5oCK45QJXY6Po4wvAHHjswcvJyg1PX9K+MMi/2trpxsy4oXf73IOb0P/LFRUcmgBbtZ3SBZ7DsTnjfP7fq+3sE5+xE+RQRuAz0E6IyeT99B3utrs9CS5LHi8p+FYlDA5Rm5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749840970; c=relaxed/simple;
	bh=SFpLyUrSkeov8lTDekLTl8UML1Z5oaveGJ3pRpViCz0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T5ZP7WdB4fTYRI3qtW11Vx2hEls0uw19BDDuLZbmBNObN9k/IUKyNAHLfZ0wgnH8eJydN4srdriu9oU2gZLwOQq4yPt7cap0fNS9j/rC4A6uEVkmNZZ8rKlhijrhOhdPMvn0H6xT9YNFhcxe8r8koLIfVdayVnpDCBcoG+EOYKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=XZy4Us3r; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="XZy4Us3r"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-60ef850d590so624189eaf.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 11:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749840967; x=1750445767; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dI+YClki4Q+OM8j5JXLpkAENpDyF7Cb60VCru1h+I9Y=;
        b=XZy4Us3rETpdOs8rSguyLgEueKNrF7UXsBDyQq63PQewHEzDg45E9sj5vF2AdZNVye
         wNn6sr44diTYkKGU9j3PupDfpj/vXWVFVIYmDZyrWuhr6h8GIn5d3EISdPHvLBF/YRUu
         6kMqj4FOv6TCkfBMG/0Y9t9BEf30vouDSm5eE6jCZYrAk0/BqxX5UUrTHwGRnwQeQS9O
         KiAJqjguwWEmVf8v5/DyEvkzGEZRQ5HerAuA81Ov6cxn8x1qSFAbwxAqIDkHcgyqjpPI
         fbC2VETmrowmW2HjsULKu+AEUL1Zi1T+RWFfnMJ/Egf5seRyl6gAiLpKIeZqZpUBtd+N
         e1/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749840967; x=1750445767;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dI+YClki4Q+OM8j5JXLpkAENpDyF7Cb60VCru1h+I9Y=;
        b=PRb6JUdMKkvwFNbEgdl6yy0BMmticuiLC9NuQVVbPrE8T4xLf/JOPf8pTfIGJEAgN7
         JXbfOLO1k1PnpXZU1Ux57APotee/qmVu+rwOjRuWfbM/WCKHG4Q+iR7zpXkCKgTUkdPL
         ZKhz9Kef6cccM9w/s84T4QCrXrF4mhXDpSFLccIIz7zdobsVV0N3Di+YGwJU3MLwB55E
         J3WmLKg0Pb1pBTfIBHNlHsbOKowFK+QHx4oidQWvdbhWgjnsg94JBvCjI1qEv5dyRH/f
         Owqj9m7PGknA3duF1v9AtT/Yubt7Ja4TJ8CdPrrxqFFrNiinrbz7m4u9CSliptCOt2fx
         FW+w==
X-Forwarded-Encrypted: i=1; AJvYcCXeKqAd+xqmgbgbGOfiYAM/opbS8F2Ib597ZMIK0SnoT57ie6YAZgO6hhs7fqcRgOFT1P9cVQsPYTdproo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbfzEOJnWtHMU1WdUWhx4i/LibWBSAuZ/drNmgseJWMQQgpp8v
	NXeJ4YLh+yqhn0wpB6i0bAStyMFyO8nO7c3hp+GstDsoGkPbsdxlo2FKr7Tk8JsKXOU=
X-Gm-Gg: ASbGncuei3FYiELRYkhsPAsUFOZb/EKBXrz11i900rRIaO+3SkjgbgArmVY5dZ3qEiC
	45jQL6MCW2KbdL6AmbkxXYjDVfJklM9KmnLxdGBmk6qv3wSuMT3iFC39DIj17sxbiU+M4FkY/g9
	Zp0ooqbfaY4pu1NGdMXWkyRprDNRDbwzy3y5oR9GEkXDni98XuC9Yw11BF49sHAUdtrLmD8Tzry
	ntW+VUb/gILJ98qdw0iWzFMRklmSUtGtN1xvtjSdX2CkaEwJr+sCEvLlAheutflikaoWCAj+fc7
	FH4bl1veB5Wb9lGzVzvi9AMbkCMwUi5Kyu++jYNrfm257/yU2cELZpRbPMMxSmEBC9I=
X-Google-Smtp-Source: AGHT+IHIDNuqhtDyrUFqLqhDihe2otHFXjR2z0Uj0/IxHd8WHsBb5KQ/hfkoGSBN5gTvsdjyeJ771A==
X-Received: by 2002:a05:6820:2220:b0:60b:d6f1:7c50 with SMTP id 006d021491bc7-61110dfc503mr554725eaf.0.1749840967556;
        Fri, 13 Jun 2025 11:56:07 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4647:c57:a73c:39d8])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-61108f07e08sm256244eaf.27.2025.06.13.11.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 11:56:06 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 13 Jun 2025 13:55:28 -0500
Subject: [PATCH v5 1/3] bus: ts-nbus: validate ts,data-gpios array size
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250613-gpio-set-array-helper-v5-1-273fab50cc8e@baylibre.com>
References: <20250613-gpio-set-array-helper-v5-0-273fab50cc8e@baylibre.com>
In-Reply-To: <20250613-gpio-set-array-helper-v5-0-273fab50cc8e@baylibre.com>
To: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1149; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=SFpLyUrSkeov8lTDekLTl8UML1Z5oaveGJ3pRpViCz0=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoTHQuTsVQSh+FA+OKrMbq7r95SDLAKurmzl6n4
 eF3OJTvep2JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEx0LgAKCRDCzCAB/wGP
 wLf/CACNf5sXMZSBwHrR52sDXKkT4pw+mfyzKQkTvQU/RNoOzSFHeNzl3etvgs8aItFSQTCaZDH
 +Kn1nNY/N/mbvJKdZpsMAD/LgP5aR3hLOcp+IfbZ1pzhZj3uMQ8XXf0VVGzRhEVhy/z/sIzJZpi
 bA2KUclSU5ndPJZS96FRk+LAbirsKK97ExHRQFZFC8xgl0II20W/hPiGtdgs5A/1YeGynRLaomM
 3s9oScLTVwynnmJT4qlp0I2iFLDFrL1qz65UzoUG3nUabTPNVmjHfYqNSOsYfzXW8bfZemySSAD
 ZfmCDJLVCIdbBRkoiY/FfEcScqIm2bvrZwi+vSvvOwjU54BE
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Add validation of ts,data-gpios array size during probe. The driver
later hard-codes 8 as the size of the array when using it, so we should
be validating that the array is actually that big to prevent possible
out of bounds accesses.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/bus/ts-nbus.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/bus/ts-nbus.c b/drivers/bus/ts-nbus.c
index 2328c48b9b1260e805c631f2aa7379d620084537..d3ee102a13893c83c50e41f7298821f4d7ae3487 100644
--- a/drivers/bus/ts-nbus.c
+++ b/drivers/bus/ts-nbus.c
@@ -48,6 +48,10 @@ static int ts_nbus_init_pdata(struct platform_device *pdev,
 		return dev_err_probe(&pdev->dev, PTR_ERR(ts_nbus->data),
 				     "failed to retrieve ts,data-gpio from dts\n");
 
+	if (ts_nbus->data->ndescs != 8)
+		return dev_err_probe(&pdev->dev, -EINVAL,
+				     "invalid number of ts,data-gpios\n");
+
 	ts_nbus->csn = devm_gpiod_get(&pdev->dev, "ts,csn", GPIOD_OUT_HIGH);
 	if (IS_ERR(ts_nbus->csn))
 		return dev_err_probe(&pdev->dev, PTR_ERR(ts_nbus->csn),

-- 
2.43.0

