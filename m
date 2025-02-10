Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDF21DE3CA
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 10:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739184732; cv=none; b=mmJx/0WrmXd5VxoUukY8bCtJpOPc7yRzSIOBFDZyLFEwvk1XrJG5F9Da4pKproKBaUNv9Rilk/SXsW8JOc1KKWgjmpGjw7RHteddfmvNtwzGyT9ruxANAgwaPhdx9lptAA0ipD/ChJ4NM9uYlx/hgyQ5V8P7g+AYZKhOHilz1Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739184732; c=relaxed/simple;
	bh=q+8h6LGXedGssIbDpk6doFlGaWnQknR2RXXNfrg5t/8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OtaRvAruizf+RKd9g6GlU7m9stu9P7euJPe1MPNLkN2D907zDvcZD3oDntDBgF4WkwlYXGhioNaOLR9pCteFsw01WSeagvsax5apDCpQiFkRPBcMx9iyal+hQvcB5UznYKMPD1+MNdmayGUsl0Vo7FQKlZItpeKvHbDTrAYKsCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=2Lh0H0hF; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="2Lh0H0hF"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-38dd91c313bso713046f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 02:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739184728; x=1739789528; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m3TsbNFVHS/IC4iUVVEnnqOzTVBqUgDCo4J9C33YERY=;
        b=2Lh0H0hFqNsL+IsX4ev0uq8p3xK32oNhnIuqY0dHMMfo2xY3u0SgU9fa7W/Sgav9V+
         rMYlLpM9R4ijkezIu8uRv3Lf/vl6SF5k7yc/ZIqg6GwuR9V+R3YHFm4ysqERDtQ6gBe9
         y6hIfBc05kUfahH/cGv8ne42/6THsAjDEwPDAHKt4lb5p8QokzgiLrKz6MgJpQCxTqxg
         bn/RU7WaCqKoZoDhDwFps2P6dREovmuX+d344vx5+XsPABXmKFsz+ATRr6SBErGQklWE
         ogGAZD2Pqs4pbSq8u+MapS/j/Bkz1KQIIx7kHy/BQtZ7M8T8Ur4sH3mUlWsrK+cBbTN5
         ZUag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739184728; x=1739789528;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m3TsbNFVHS/IC4iUVVEnnqOzTVBqUgDCo4J9C33YERY=;
        b=jj58HdfPHtwvZFSE3zgEiCejqpGOdqAIN2pFY2PFub49lAEzSok994oAjHcxZTypJE
         l1uhHJtj/c6eg53BlnZCT7fI8HGBdqyeGlQm4iOQnqoSqEdIFKekn7c6ESa9KhvuCvRM
         s/ikbEkDat9156F7ll4+WNN6FHHLo4QRbB5ObjQhx+RhL4JIHkoP8IsXPr03vL0mmOQ5
         tHsBKyc1RVQavx/s7sdWzlhl73prpQxfNCpFviH8Hv5JMtME3beN4dkahnQEgCMBsCls
         ykEVVlpU4TvRHwz8x0ok5iQXrvj8lSTF/sflSTWRoZJLMwwEZw8vsQRpqCBQw32zh3kg
         6gLg==
X-Forwarded-Encrypted: i=1; AJvYcCWEOdrAc52iuozTeTXEDd+Ay2N87sG474PW583E61q8O/QB5RzErgw070ow+FIgRYFo5iqfrwpZqIXKQu4=@vger.kernel.org
X-Gm-Message-State: AOJu0YznuYoaz8PwNWjWFW1/y6Wh95/R8Se5keoCgq31F7LYGvtnrJMK
	bpfHbxLiDgIjae+9AcpgXlN6VeZC31v+mhTshfKqFHshWA6E5nTPYGirhTvEhiwu+gF4nihYFuV
	DPrw=
X-Gm-Gg: ASbGncsZnZ4eCuSAdGuA8N6srgtK2/l5vCfIzwE5kNL2ineZYFy2b2ZYyoaLVbIiPfD
	NPDeJSQ8oMGOIity/lfjj/ZpxH7wD8oBUnOGQTN23Y8Mw6PM1PkAJlcU/EzdI+kD6XQ18nQs7wY
	snV4m8N8WpOg64h6dfGs0lhLFHDHoUqvn7Bh+6UjUy9CikQ1XtV+9UXmV5u1OW9bwy7lIKuh61O
	vu2wA/fe5OrInW5pbZRPsojY4OeEvqWrntx+JCng3+pYJTStGlc9mumAzWrxcBRPQHcMviz1Zo/
	lRi0fHff
X-Google-Smtp-Source: AGHT+IFx774tEdrjGX+K2g7goOYqdE3lgbg6MjFHO4VWjKPEXooaMul9dyJFxepOkUugTJxkMdbmeQ==
X-Received: by 2002:a05:6000:1448:b0:385:fd24:3303 with SMTP id ffacd0b85a97d-38dc8920858mr10829010f8f.0.1739184728588;
        Mon, 10 Feb 2025 02:52:08 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:f3e9:47d0:94c6:777f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc53ae9c0sm10557919f8f.101.2025.02.10.02.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 02:52:07 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 10 Feb 2025 11:51:57 +0100
Subject: [PATCH 3/8] gpiolib: sanitize the return value of
 gpio_chip::set_config()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-gpio-sanitize-retvals-v1-3-12ea88506cb2@linaro.org>
References: <20250210-gpio-sanitize-retvals-v1-0-12ea88506cb2@linaro.org>
In-Reply-To: <20250210-gpio-sanitize-retvals-v1-0-12ea88506cb2@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1734;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=HDFuarshvnhtSITkzvfZTJ5ikvSyc/L6lYIYqosoVLU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnqdpSf217Wf1JeG6YPA/mU60jZhlxBYHM2RnXr
 T14M8fOvfyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ6naUgAKCRARpy6gFHHX
 cj2JD/9L0JUUmq+8J51P5JZ0Rt3kj/bnafEDEzgrQ/gMTholFSRkpee9phHqoxAIAt1OoznT/mk
 uoWoc/iTpuUDZm2havuWGOmgrkJIuBFWMSko4N5oFTiTTRkmO/0GCFLqFXdu1uFxo3kpSIReBuk
 SwyZwypfcl0gu6/CB9xiec1858rYV/6dlHqIkPaPZAJjpMc49g93UEWvK9wQJgeGDF4U1UwV0Er
 +Oo/jNVyyqIbFyYiRMUetm06idm4R+wcPlBbJuU5kJUwAE2XYOKVIdXfGiegVcpcRQUOvuXTk+v
 7rGsBk2RgVHWSQaJxWZJe/BLcIhZGKP8zb0HL+YN13Ph9YMtG1xzF1HICbHDJV+NNygAoCSjsxS
 cT7fCCmXo77ZyQnBpXTENmgzGzc8gn9WJWwsGd+GOoj70+nVxOCjv4QEjgnFo+3RfvvyXiYNEbR
 giG8wHb1JR2mhUxHuy4hD7LRgHLeQVQ7mOlPoiX8tg3oEk6M2UQ9btdzPgE3DMeBRqSnj9Am5+h
 FaASZH5TX81qcRHMwPNUSZiSuB3QTGL9kd1mlCH1fCD/K6ZtsveRso0PZaPkO7ikmNdC7sQeUnU
 RuS8Qbsvq26JW0rgI5bDBnTI4tlo3H16CgL/kuuOs3xlXD+deznNZxcFJjCa2JZFEtpAG42kahx
 cEzefhqzQ19HmmA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The return value of the set_config() callback may be propagated to
user-space. If a bad driver returns a positive number, it may confuse
user programs. Tighten the API contract and check for positive numbers
returned by GPIO controllers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c      | 3 +++
 include/linux/gpio/driver.h | 3 ++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 42625da7e797..95ea300da109 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2575,6 +2575,9 @@ int gpio_do_set_config(struct gpio_desc *desc, unsigned long config)
 		return -ENOTSUPP;
 
 	ret = guard.gc->set_config(guard.gc, gpio_chip_hwgpio(desc), config);
+	if (ret > 0)
+		ret = -EBADE;
+
 #ifdef CONFIG_GPIO_CDEV
 	/*
 	 * Special case - if we're setting debounce period, we need to store
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 26fcddcb74b8..81c06fc8dcda 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -348,7 +348,8 @@ struct gpio_irq_chip {
  * @set: assigns output value for signal "offset"
  * @set_multiple: assigns output values for multiple signals defined by "mask"
  * @set_config: optional hook for all kinds of settings. Uses the same
- *	packed config format as generic pinconf.
+ *	packed config format as generic pinconf. Must return 0 on success and
+ *	a negative error number on failure.
  * @to_irq: optional hook supporting non-static gpiod_to_irq() mappings;
  *	implementation may not sleep
  * @dbg_show: optional routine to show contents in debugfs; default code

-- 
2.45.2

