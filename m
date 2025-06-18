Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A1013957E
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 13:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750251736; cv=none; b=bqR+bf3ca/4IA+hWZxp/jmqntPdJbY6gFRJSmdezClRBfoq4pgMCYPSfPSVodBtB5CtGW/TCCw9tG7rkNQOfbovMAhAZFm14HMr8wpucf869z5OpvbZCy7bokgwMgUnd20tWvOLHa6qnmmE2gPVbbnGknShW/esC2y3eH0hlmEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750251736; c=relaxed/simple;
	bh=Jk/M9Ui9Na7HQdPubi3ge6XRBpngPka54+GQv2eF2lI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=csJD3YLMw9OxHGwCnCVrNKB0FjTfyyR3ofYUFJqRWlelOIf7rcYqar0GrpXY5hW435YbvW5D684SkEB2pwFiPngB3UYMSoAdb1oQZKoy9MtSEcZ5u9b/hBoh8ZEvWIWaHHl74fUb/0NNROyd1lJnZXmP0n9jrZLS5IiLrfa1Dcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Xy1FqeVM; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Xy1FqeVM"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-450dd065828so56400345e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 06:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750251733; x=1750856533; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BC9XWgzAC/JlTRKNPdZO9jx2GxWoXU1rrNVMsqMkcWo=;
        b=Xy1FqeVMynbAj6lTD0V94632qF411dqCC+FcInIN5kwWrKbByf4i7YAR4gUlPb1C01
         xB884+nD1pQZpFknBo22QDJwQrYdLnsSTao/xq+zmvwDR/Qp6+ODXSDrJhTs9EiFcuEj
         YePETz3qOJfc4LCSxuelyVqGPuCxmrZJH279Eri0lwsZtsjy8qgJ+m7Hc1rc/meDJCli
         XK7uSPMfynH7Ew7LkVAgIAt+KUGIVmDRGGi1IGOD2Xv757EJepjGLMisY298Um2EnoYR
         fHRX1lzlfSaQG+UKLhOiZvxZSVoYGPKvfy8RIYGbycXEi82cp5fT3Ujq3OkhkxwmcXp6
         oeHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750251733; x=1750856533;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BC9XWgzAC/JlTRKNPdZO9jx2GxWoXU1rrNVMsqMkcWo=;
        b=P9UlFkxTfQBDw8LwIiDY5aEgUPDVDgDRaJJGR4Q8gjDyhBpYJ5PY2UoKgfqUL/gyiT
         +LCk3bwDFw2PrK4VyDBMgmMkEeG+l2BQil4A11P1NLRgqRsW2WpvR2ogCYj1swvguafs
         6YwY6vPQGY1l2YjzDF7ArVjBP7ojOIMWIBEDyXJNww9rDVBJBjQdr0OOjODw2K/oQEW8
         liGZgiJ2AqpIJqQUfFRxcunlTa/ypo7zlJW0uO1S8SRy13ApTt0MM1f3rRHUMl1LX1Sw
         AhZuOo+WodnVal3bgCdpt43UOm7HlDZT4uKYx6dP0tpd7KY77gQoq38dBnscmQfMcwvx
         3oqw==
X-Forwarded-Encrypted: i=1; AJvYcCXcPaP03HkzxBZAXo5xbIMCAsPrXO+Cfu7agzrfgTYbgGV+9u7MXSaNHi0WAwaxetlDfzd8aKAKagmU8po=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMCI/PKyaou52wbWgV1zLAVLJ4ZDnd1WTzxk8r+q3Q/seGNjSG
	n1FMCn+2tJ8Qb6WHfEz9pJDMUYfEvezgPoTcOC5kaKPI4NJLct3PIsKCNGnJcJKoHsA=
X-Gm-Gg: ASbGnctUuPYqees20PjeHejLbfnmTwJlrWGUBDm/baSMuM4YMslc8Zg1yl64toYu1rl
	10q3cK/sXA6w243bVR3qG0VvM0FyaXiWol+JNKqa7jezA07kfBoaEr8L3YB7B2dTlXeIINmE/Dl
	XHVM5fM/j8kucm7YFbxg8Dkso0QzekhOGePP/fq31rXs4KALjMNYmPM7dJWIDd7nM1Ww9O6ricB
	E6ArONhfH6Ecu/+5d54/OS0xmMK84Mz1q9Je6aQlCcOCDkrbzu6KojbnrdGQDB+dAe3siVpoCdS
	6eQ2+SN6hjD6p+HGXEYwpQKwOQh7qrZDrLqJnUwqgLMRMJ0BFYi99f4=
X-Google-Smtp-Source: AGHT+IFPB/K5zMDdgTuf11jgW7Xuj1ey8iMDW/GtnPNE3ho2jl8/wpkbPxKo18+NNwMCFsAycHFtzA==
X-Received: by 2002:a05:600c:82c3:b0:450:cd50:3c66 with SMTP id 5b1f17b1804b1-4533caf10cbmr156437325e9.29.1750251732641;
        Wed, 18 Jun 2025 06:02:12 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:ad8:9ec2:efc8:7797])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b08c99sm17043595f8f.63.2025.06.18.06.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 06:02:12 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 18 Jun 2025 15:02:06 +0200
Subject: [PATCH 1/2] gpio: npcm-sgpio: don't use legacy GPIO chip setters
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-gpio-mmio-fix-setter-v1-1-2578ffb77019@linaro.org>
References: <20250618-gpio-mmio-fix-setter-v1-0-2578ffb77019@linaro.org>
In-Reply-To: <20250618-gpio-mmio-fix-setter-v1-0-2578ffb77019@linaro.org>
To: Klara Modin <klarasmodin@gmail.com>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1140;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=XVDbA11npYNtBXGkYX9hOCC8ch1woMEIFMQDtO/pLz4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoUrjSWuqLhdeCPxybR2GyyQn3qsd1Xky54Sg3z
 b8E7NmrwBKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFK40gAKCRARpy6gFHHX
 cm/ZD/0cqhzi23U4gdbUZtBgvJ/CRlUwNoOc4V0ubJHdndzS/w89zQrncvgpk7mcGwGnCaTcwmd
 R2DXEkPD2sLvmdDzx4B/WpHgjXOryHh2E8F1N+C/e/nhkrowGI2vqj/OJe6bSnORTxifDPgvvJR
 6/jXZ4WK6Ni+zAOm/uSQSxXV9th62JDBrSNYbJbI/b9NzEzgc0rKZreIILL/sMovgEaOF+gkBwk
 Sdq9qaDbJh59X34cBgPbizJHzvUaJ8GZd+DeQB1zeC0fSvQDVfCh0tDRmK0a/6RWA8HAPaOoNEJ
 Vh+yDX/+Oir85g5+wsOcyGts8KN9nkZ6s7bm5IPkLhxfaKCpm07K8F9RQLobPQ2wIv9iW6xuOmW
 Qg+fi+2MKg2Ogyk2uEzFVe+8hhzkYw+paLUUQOFxQNewHTBFqyzPm/mjzA2kv3aSIZeWCZUjBhn
 BrLkIU4dt1mUfW1/47syKwqQWFfbZ3VekZtcD82JHQ+kcylf1I+5aWQCRLxQAh0WtJmDoDGD5h7
 jeltFvU0UqI7qqXQiMVSkPm3NBPBAYDq5Xbz96+NvVoyb+jooFmkDrpDgyz+JHJSkY/sj8fIXPQ
 RpWtJgyuJUTcxBnHc0oDwVDZ2UDd5Hur0AAP3PqDRKlvOMkzT6usmt67x+4iiNi/KCEWrYDom19
 iSzovEPne3nd3Nw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We've converted this driver to using the new GPIO line value setters but
missed the instance where the legacy callback is accessed directly using
the function pointer. This will lead to a NULL-pointer dereference as
this pointer is no longer populated. Fix it.

Fixes: 0e1a8930c941 ("gpio: npcm-sgpio: use new GPIO line value setter callbacks")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-npcm-sgpio.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-npcm-sgpio.c b/drivers/gpio/gpio-npcm-sgpio.c
index b3953d1ae8af45f4bce9b799434547cd8770d9df..25b203a89e380366e6a1dcd51775f6b1997a1d30 100644
--- a/drivers/gpio/gpio-npcm-sgpio.c
+++ b/drivers/gpio/gpio-npcm-sgpio.c
@@ -211,9 +211,7 @@ static int npcm_sgpio_dir_in(struct gpio_chip *gc, unsigned int offset)
 
 static int npcm_sgpio_dir_out(struct gpio_chip *gc, unsigned int offset, int val)
 {
-	gc->set(gc, offset, val);
-
-	return 0;
+	return gc->set_rv(gc, offset, val);
 }
 
 static int npcm_sgpio_get_direction(struct gpio_chip *gc, unsigned int offset)

-- 
2.48.1

