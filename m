Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC851DE4D2
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 10:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739184732; cv=none; b=nvVd2DXUBN+uSDE97z+lZNzGwi1kwUn1dAI9aiqh1ln/ane6l3FZPCROtv/j4QV9XzoSXaBkuLg2mCn01uy+i6Gs2E9/uXtL4tS3Gdr4FwcRSanhbbK2vAOrg8rfT5qFTT06fGSZoAoGk8lnYuxxTk40rPpwULNXyTyS/6m6s+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739184732; c=relaxed/simple;
	bh=VEYyCI/WQWt7FUs1FcU8Tp3ZXokrKORavVAubjuZUu8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nUZu9c9MEsqb+QusgGjSTfwGaeC47AUgLk763CZ9Fqx3iICfaKPfC4PhjJQq6AAt/KKi8EJAz+HpKPKJtg7Rc6ol9ATD1aHt8DboR1lizVRWFmR75ADOuSxSLiAWwnAaag6Ch9mXIcNljP7K+gdzzq0GBBhVM2KGemMcl41ovS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=hlEyuhNk; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="hlEyuhNk"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4393f6a2c1bso5679995e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 02:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739184728; x=1739789528; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sO4RL0P3MsiqhqZaJGlhjjTXZ+rOkejLGclJdeKjOgk=;
        b=hlEyuhNkkSn+szlvX30e26u4pl5dtDJsgFq79gdyeP8LiSN8Mwy3EdQEL5FtYe5w2M
         kIfS9Xd5hgnIJ8Odax6F4J7LJ3CpZThBwTed0Jwx7z3/bRGORCEQDeACVuJsDzV6N6Rt
         Ro1PrBPv/6JYi71hi+XpZVwpDgXoT1CTmFSa6rjHX0ffR105u11wGJ0LuDkRSdDx9fCr
         OPjWhyxOhu86sGKd5TBpQntsZRoWLnUHdcx8Nj1alf8nPgzUYyXmyyqJLEKu75KvdhsF
         smCqW9OC6wJ8P8nEx6Kt3ZiXJw5WEpubNKV8fqEm2TX5yyAYC6nF7sM8Nc9TEh9EIwBm
         n5ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739184728; x=1739789528;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sO4RL0P3MsiqhqZaJGlhjjTXZ+rOkejLGclJdeKjOgk=;
        b=X7hfCks8Z841RZ+ZUR08wYpWqHhaDZrjjRf2i60jRp0ViGjlYf51aJSNINHyDN68jr
         jrELlDszLnvt2kzpxXvS5H9A8jWfm8zzIZuxs+PE9ZEA4dCxKKvR0OiTs4kVwyT2GMIZ
         FkdtRzqYDDgxfnsSa0G6omiR6D6qzH5pKY4W7GbbREJHKMQwa1WKvjRzclQCl029j5j0
         k4gIjKk8JX3qND9GQd8BRCg50prnUfQ6xGGcFS4S5v7EFO9L4XWJBYMSneyoBWMqLUpV
         Yygs5w+Nc4t9iWOUqPpro2VZGHJWocKWA244C66pcSeHMoBKwLaawhFATAiXTgnpE3cq
         HI+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXBP+l25pvNOTaLNHRokc1l60siLhwXKV9o5u3isE1uY6mWi1G3Cniv8oMomi+OwAjDddlWdUZsahTt3wk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGeK7CO0Ib7PiM42JAJrjq+RxBAVkOCNLuJJ7U2SNmd6dQI5U0
	SCNsGWStdNqXa4UXkSJw1tfKmoYA4M+tfJtjgKp6QTRSX3+AlJyLBM6/ikaR2d2spy3jzxr/Z+a
	muOQ=
X-Gm-Gg: ASbGncuixKOrnspRbtK0JClWv0gGJDE6iziEpWdyMZKh6edFgFuj2/VqnQuktDKielF
	TcSiXBT+pwBW9RvUFXnGzvo3jnx1E7l7PG1G9zmgtS6lZCitMcVI87JQBySBX/299sk8DWrT8WA
	6wXQm0ViJoUlVxospBlLhZcTn9xCzZkSltVLEt7FQEFLtivq7p4SyPsZsU7vChZ0nHgN3pZhc9U
	lOAvms8525dMJ+09JKzUXbChqozV++yXp6khPU1eu5Z7ebpPmf4tcRi45SS51FWB5XG5ewT7/UN
	be4AH40W
X-Google-Smtp-Source: AGHT+IG9w8+Y2BmWt3Wy2zCugo1yyVPEoCM54U4nHTtttPaMyB9ZvLuV+Rm+5tQM3AD5nQFQQRIc0w==
X-Received: by 2002:a05:600c:1e1c:b0:434:f1bd:1e40 with SMTP id 5b1f17b1804b1-439255514c0mr84862755e9.6.1739184727605;
        Mon, 10 Feb 2025 02:52:07 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:f3e9:47d0:94c6:777f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc53ae9c0sm10557919f8f.101.2025.02.10.02.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 02:52:06 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 10 Feb 2025 11:51:56 +0100
Subject: [PATCH 2/8] gpiolib: sanitize the return value of
 gpio_chip::request()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-gpio-sanitize-retvals-v1-2-12ea88506cb2@linaro.org>
References: <20250210-gpio-sanitize-retvals-v1-0-12ea88506cb2@linaro.org>
In-Reply-To: <20250210-gpio-sanitize-retvals-v1-0-12ea88506cb2@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1657;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=xkoYB7QevhvR3b+N2NNvGIdS2HFsaFzerPPF2/0s9uc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnqdpSeBElLfXXQ84Z9WEjnwnVZFBwpXL6a3buq
 qxEtPp/EGGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ6naUgAKCRARpy6gFHHX
 cttFD/9KMeATzvVcS8fkNWtmLZqCca0VOv3FIImFijcRAY1VSscZnpcKmcSFogZrPYFVPS3AwaT
 UmELIhw2EbSWGCN4YgmeuEcf++8V6C5MKxwU7qGmq+vPKUeySCdoc30XQuV1212EJCK2XEwDHu9
 SDU5bB56HMMj0rZA43rwIUxps7o861ZL+8LPTAYakQEYQE/YhztjoYlncE7+iXlBLkfS+16eIh1
 NBttreNhs0cRQS+/TfSXEBjlnMC1II6mYNCs4716Oh9jfylxLrPvdPQuwrjclzQvb9V5dHfQAtx
 rutAgVd/esaXieQjwPHHSGIwS8qAPQa9ZLHRE1Vsg2VfuCd9jhmjpiugDzpsZ7/LJOy1dYOuIB8
 ga9X9D8Ft2x2LeBMQlTo7GYROzRXKLUjvMCrPHIsDfGXhgLOzqLCVtYHCqzMXjlWLIm7wEppYDf
 1wXJg2IP4MnoCBnppWRe6wuN4UJaHMdkPJJvXLut2xzQ8Ql+uuCaIRabQdpBm0/1hYl2LTvMr5l
 JcOM7Z7KYcXYAI8Q/m9lDZINgILVtMZjZ00q6acCGrrGBreJ/yQofrY20Ag+MrgGQHlUhu9IX8D
 FN2SaOCoE4xPafKxDBKjJklp2p7UB7/YlyC87I0uLbLe81cP8LuZVRIyPxsN/t7OCY+SM8cibmv
 i+jiWfu5itVunew==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The return value of the request() callback may be propagated to
user-space. If a bad driver returns a positive number, it may confuse
user programs. Tighten the API contract and check for positive numbers
returned by GPIO controllers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c      | 2 ++
 include/linux/gpio/driver.h | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 5d3774dc748b..42625da7e797 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2331,6 +2331,8 @@ static int gpiod_request_commit(struct gpio_desc *desc, const char *label)
 			ret = guard.gc->request(guard.gc, offset);
 		else
 			ret = -EINVAL;
+		if (ret > 0)
+			ret = -EBADE;
 		if (ret)
 			goto out_clear_bit;
 	}
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 2dd7cb9cc270..26fcddcb74b8 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -328,7 +328,8 @@ struct gpio_irq_chip {
  * @fwnode: optional fwnode providing this controller's properties
  * @owner: helps prevent removal of modules exporting active GPIOs
  * @request: optional hook for chip-specific activation, such as
- *	enabling module power and clock; may sleep
+ *	enabling module power and clock; may sleep; must return 0 on success
+ *	or negative error number on failure
  * @free: optional hook for chip-specific deactivation, such as
  *	disabling module power and clock; may sleep
  * @get_direction: returns direction for signal "offset", 0=out, 1=in,

-- 
2.45.2

