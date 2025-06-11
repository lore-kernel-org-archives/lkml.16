Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C60210F53
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 18:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749667842; cv=none; b=IQDNd9gncjnyKweKFkAkZGurNqmG+q4Aff55zFZUSuqZiFzRsBiDP2mjy7pyc7Z83I+2f0vlJ8kscoRExctveCMus5hdhL/mua5e5mtPG6x8W1YvPND5mZKQQS7TbBtdQRbY1n3ZSvjg1CV2AM9HU7wUmz45PHsU7y8niKzn3Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749667842; c=relaxed/simple;
	bh=nSfjD6bMZBS4BmZBx5jpM03quxzAgEVRFOeFWsKppzc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JooRuTwh/BJeXQGzpW/I5bC1mGK20tJCR+hlQg6gZ0aIlSV6e/nl8ZBoZG446/TorGdk4Xk5f6dDlq4zv2U3xTZbBphRytp2Ic1d9Fp6SjgLzDXofiD3mnaAmxpMVtPcnl8QmDMFeXTzaZAJGltcGZaP1G/rGvJTOl0QoeQq4HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=gzLXoim6; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="gzLXoim6"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-2cc57330163so75138fac.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 11:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749667836; x=1750272636; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VfLSwwtWqu9qQ/BXRbsnm8G6Ja0ZcDCL6XYgy1oOSxM=;
        b=gzLXoim60yzOv/Ze+/4YLOkW4YRipBB4Tu4AuW6IlXMkyBuVfMw9Nmh7VNuPfF2zpo
         be1hDDl9UOKW3kB6EKdIN3mm/uzivw30+aAzLsCU/EeQGNEZXu+AqoTTjTNE4gqtqEs8
         NrraQ/5FjYOn9dO7ASjDyJqmpldRumkmwazkvFuYIV9EguRlNi78ckzSqh9ofrMbxKN+
         zrjKgFVSK6J0oilQKtZi58wf4DVuk+XqtdMVfrsp2GZ/HK48bAkmv1RomuiSKWQlKOVN
         CVvbbwSubP9fbI+I4eSkQ0DU5jfFULZEd6MhSMAJJ8lbIYF332Xe/CoGAs+q30AkNFvG
         okiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749667836; x=1750272636;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VfLSwwtWqu9qQ/BXRbsnm8G6Ja0ZcDCL6XYgy1oOSxM=;
        b=jxAH9GxPkr3StMyu8aHaMGjvmRur7jI2tnm+1ZS3kTsD5c4RxCDR3ZnTzDb6Iv68AT
         PyIJIiQPBIoQhAnxpKhDOlUZSv8F3I1yjFEHCc3LJYY08w57LxeSPVf7q1ox4R+y/Ekv
         KXJlfeUG4ZMNDS648DTdhSzcryFqPTJGb1yyLiHqJCrECb6YvbAzW7jveu5PeQ1C6bM+
         HfnsOdDNU98E2rQwXZg7o3suyKw4ZiR/A//FPyLvIVvt2hBPDAUfMSAvtVvknUHYk9kA
         uy0UKKtAffURfJEafENi3kQgvA6DplSF6DVekQpvcY/Pz8A1Pf59tcrkxA90gqP5dVTH
         GTnw==
X-Forwarded-Encrypted: i=1; AJvYcCWkdIkkWlJvia0ZWYmnC904NpMGH4KnyayWaQp6IAM6nwGsj8FHFEG8z43HwspcF8G7yBtjcTmomsl80zQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+gEcZuyy2MYMM0hzPT+JRzx9DE954D4/YYvrR/icbSR79Z7Tr
	S47s98LU7ZxWC69wGNXCX5OjaAgdplA/FRy9D/2v4XmgUBtKNBCuRc8UqwyO8I+u5+M=
X-Gm-Gg: ASbGncsnMY9ufNfA7AcPjVA1gKL9M9B38qkVQI0zknEvqOqEk2gqK6w3R4Uwx4+VHkB
	PL+7lmvM3vWo9UTAxM8Q64rXU0y21ZEHCyrU8s6ZLZ2XRCMbuJS/xZDwa4h62ItFPUmIR7lHBh2
	YrUDLX6tJf9CuETnaf4PoGjikA7cRTnQ7YWBKYHcyCju00sj85Yt7ZWMqs2M7f2/5C7LIlnWXue
	X0AGmsoXMRqEQYdqZX6YncNmiGOS0FnZMeAPX6hMbFeyv5PoGXcw7iJxAcD6o4IczKWM1l3gg9A
	7xU0rDbE2E38YfPDB/cYJQkoik/nLRxRFPmOaHt7uEQI9ofB2EG87sl4FdCdZuyFacZv
X-Google-Smtp-Source: AGHT+IHjYXz01Zl9sopL5Bo7WGyboaTC4cea8WBMM0dh6eeMLiHstHuEoKqxYD/qWOWCRh7nF1LZKA==
X-Received: by 2002:a05:6870:1255:b0:2ea:7574:e243 with SMTP id 586e51a60fabf-2ea96c1a31emr2126324fac.9.1749667836342;
        Wed, 11 Jun 2025 11:50:36 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ea06fe5784sm3009668fac.2.2025.06.11.11.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 11:50:35 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 13:50:26 -0500
Subject: [PATCH] gpio: virtuser: use gpiod_multi_set_value_cansleep()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-gpio-virtuser-use-gpiod_multi_set_value_cansleep-v1-1-43b4adf6c807@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAPHPSWgC/x2N2wrDIBBEfyXsc4U1vRj6KyWIxG26YI24KoWQf
 6/kZeAMnJkdhDKTwHPYIVNj4S120JcBlo+LKyn2nWHE8Y4PrdWaeFONc6ndVD3OxttvDYWtULH
 NhUp2cVECUVJXj7cJ0ZjJIPTZlOnNv/PyNR/HH3RbZWqCAAAA
X-Change-ID: 20250611-gpio-virtuser-use-gpiod_multi_set_value_cansleep-3d0480077870
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1159; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=nSfjD6bMZBS4BmZBx5jpM03quxzAgEVRFOeFWsKppzc=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSc/zhZOmMebGMUbepV8a3eTCjZkLkJqsDG+FW
 kXqUnj+2MeJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEnP8wAKCRDCzCAB/wGP
 wG+EB/0Q3zdJ06NySiiqCRQsp8x7sv6xy0yypu1OIPZ2sl36W8GmKXPriTkQLvwthDTA5x/xNcA
 jKOYBZkLcwESwA8rrIF363u7vs4eK1pajsjQkXmc/Wgweniel0rwLNzla+bN5XmIWtn/7/burXr
 a/9dBfjzBJN9K7gTT5V21T42cJLUQTQT7cUprzF5nyEG/0u1r/2d0I4gwNjPr6iCsXA8xKVQUNY
 mZIgpel6IqSlxxsqsNHZsdKAiAptY0NSaEoQ7Axbvs0whr32wve83G2XEHuYrugu7LEyLtU/sX8
 ttkXLSe9bJboRL43adockg7DJo05aHURPpT8iTVvIzJyra9W
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Reduce verbosity by using gpiod_multi_set_value_cansleep() instead of
gpiod_set_array_value_cansleep().

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/gpio/gpio-virtuser.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-virtuser.c b/drivers/gpio/gpio-virtuser.c
index eab6726953b4118dc0d72c2e37daeb9629040d11..a10eab7d2617e40cefb5f08e1211e9cb33035d0d 100644
--- a/drivers/gpio/gpio-virtuser.c
+++ b/drivers/gpio/gpio-virtuser.c
@@ -215,9 +215,7 @@ static int gpio_virtuser_set_array_value(struct gpio_descs *descs,
 	struct gpio_virtuser_irq_work_context ctx;
 
 	if (!atomic)
-		return gpiod_set_array_value_cansleep(descs->ndescs,
-						      descs->desc,
-						      descs->info, values);
+		return gpiod_multi_set_value_cansleep(descs, values);
 
 	gpio_virtuser_init_irq_work_context(&ctx);
 	ctx.work = IRQ_WORK_INIT_HARD(gpio_virtuser_set_value_array_atomic);

---
base-commit: 19a60293b9925080d97f22f122aca3fc46dadaf9
change-id: 20250611-gpio-virtuser-use-gpiod_multi_set_value_cansleep-3d0480077870

Best regards,
-- 
David Lechner <dlechner@baylibre.com>

