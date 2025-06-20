Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D7C28B4FA
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 12:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750424293; cv=none; b=TemyU3cSYgq6p2L/WlZosgqp8tsTGOI9q7F+zHGispjDtYWmK1/eHy04lE2vsRUbM9a+VpR9IEMpSw6ZGo88zIhYIz/UjwPe+bOUJi1NqYwbaTXInFs85452STvZPVEMUUumgMFygyD0mW1OftXJNaq1aTAGF+bvqSauJino+PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750424293; c=relaxed/simple;
	bh=6RRXZ9NAblpUYRu/VW+XQm+2TcYtFhybPosOtENnoGE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kpT4G1cKk+6VF0tsvtNG5Qag0eJIJphBN0D6RCcC4Bf5rqpBfUuSQDeNcq1ry88s1jncc9JBRZdc7HHgfAAdNvSkOWTFuLrzTdqtWbIJSlh59fDDiCrwoHMKwwto2KLdiV9fQ9pmpiU0Utj0Mm+DhxJtm2gVo8HWx71ee3fregg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=yztXB/a1; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="yztXB/a1"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-453643020bdso7211555e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 05:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750424289; x=1751029089; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S/UUEbhV8ajjp746akkPruIBfbnU99PXnYMQ4IdmFPM=;
        b=yztXB/a1o6gfKKx7N7PZiYeSOqQ0ooVT9eMgFqiHYflEiC5GwP6HP/fUflJD7iPr3G
         fSoiPpoKribvGgXvCZIc7BpgRZX4AIaTWu2HKGlmvQ3WQy2o5yOGexK86Jmjh9UHuM78
         ynRykpnsQSzVwtbhUclYlhqrd63npz/6uZPKEPymUeMQze7EeL0/soHgyA8UxHlZPvtf
         bU3gl7+fUg4gIhulzry9Zxa+72KT5Yy+lNz8KA38XOTwe49vVsa/43jvRddI3pyWRM2j
         S5I9WFE7RS/rT32CE5evZdISGfYm6ab2u+sbvz/zN+F2h7Wc04c8v54WAcjOFf6wqaGn
         T+UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750424289; x=1751029089;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S/UUEbhV8ajjp746akkPruIBfbnU99PXnYMQ4IdmFPM=;
        b=PEiC0hn9brmCApP8Bjr/DKJXLhhEk6O+ryNYkP1OwfuNFptCQGnUrVqRI2NN9zTUFY
         nztBF4pZF3L/jIti8bDy+WKi/+I6Kl5NG4OlzR2Vicstg2Y9gVnP7K5Peyd/0h51LEWW
         JC98YbxaAjBGp/G+d29/w++N8KV77zveINAhvD/wQhqIsibVSoPeN8fd4vBcqK2iCwkl
         b4nQsOaoaZhlwrorRWJrARdayEGOZ+rnG1Kz/F5TDG8TKzovoWXEUPD02z+hRjJZM8Bh
         bmJoTHWJGimlcp7EjaQySuvpmC9s9Wtn4IncNzCQvaAvacHaHsFX1nU3lwhH3t6Bl2gK
         HFyA==
X-Forwarded-Encrypted: i=1; AJvYcCUIWZMzcRSTadgsn4e0429rj9rEL60ixlY61QD/z/cHoWDbUkurm/MLaqEWBpSoRqbdYlgfU8v9kY+P10A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy0sEwwS99WbiNEBBJE6JSaEj82NoK3ZoLgD3G6kxYRpter5N6
	YcdCaC+hlNdBB9KMVxLEaqeZMoAA09v1DZ8GGZkhRJ298aNqcFRJpblJ7Do/tmPv/Kw=
X-Gm-Gg: ASbGnctO98z3m11bsgGkSxUmzzEUWIPkns10Gw6DuHYtJPaENTbsp26NCSx3/3/E9/t
	MjeevH/3A9Chi0D/6ryCZYnNBnCr54PZ6nTqBCUns/Bfmut4EyWcz7usIIS0aebGVXHP7vSfS29
	KOS3Lkh1nsSDF8h/lZRP+TntVxioO1evj4OqSANDqORlbYjKZjPBc7Jxl1SswikBtT3vOTrd2Qf
	f2A54+zgVDhDuDKkwk2x/wjiypEQAB4/H25hiSz7CnYRS6TC/XMUvgNwZ35HTwg9DZJYju+OPAk
	x5VNdG2Ygb2Q+Du77AH1sGkm/3bP51LI10D98qQBiTEp47O3l6vbw9g4
X-Google-Smtp-Source: AGHT+IHl6y9iDOY49BAwFOs7hG/RVLZtEdamyODfITzZyzn1WTV0Rp2hfZc46KqzKtqhWHW1oYFryg==
X-Received: by 2002:a05:600c:1546:b0:441:d4e8:76c6 with SMTP id 5b1f17b1804b1-453659f7a4emr26830995e9.30.1750424288649;
        Fri, 20 Jun 2025 05:58:08 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:69fe:2655:53a6:f735])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535fdf82f9sm50522975e9.29.2025.06.20.05.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 05:58:08 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 20 Jun 2025 14:58:01 +0200
Subject: [PATCH 1/2] gpio: constify arguments of gpiod_is_equal()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-gpiod-is-equal-improv-v1-1-a75060505d2c@linaro.org>
References: <20250620-gpiod-is-equal-improv-v1-0-a75060505d2c@linaro.org>
In-Reply-To: <20250620-gpiod-is-equal-improv-v1-0-a75060505d2c@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1817;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=FpJCLQ1y/BknIVva7DOCHXJ1+kmF6FqDtTgwQexrEh0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoVVre5Sc32Twv5BcYpPMVGPHChYJ8/JoOAye48
 5AVCXdnGB+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFVa3gAKCRARpy6gFHHX
 cj5AD/9piOt7IVjVp9FjH/cQcPahXk6fvo4mPXvdun0rAOJIODDyTdAnB65002dDppCqJkfKrOq
 dhuvhHtlyZKd6esT7wldixMFMs7WjmhNCcWU0jDoGmtYkp4lzZZiusvmYmxkim1Cccv2gWZUNzx
 1v7TTP/sNc6qUZar6whwmNju/c3ZYWtXASORXHgS3qhNXEO5LbyzPJldDHId6UlBRn5nQ2UIUKw
 5nHSJAcO5YatepPrJU7HVtd+DYzkfLc7QmuZxfV4V4hivC8lqMPUc7rLQOGTvHiJ4Azum2+0oAA
 BSn5W20Ad38t9AI8rez+M8INjYqh9nSHiNs8NdZOgkW3S7tG8O+tKXTMtEY/Ju8gGTTWIhkJMFu
 hM5KFGu4nN2cZna8ekTFJ5Pd4W/+p830PakpKlcV01aQj5vRMX97NkJ1oah+jKKGoZVhXM46/07
 XE8rneK46zH+GQDN0blrEFn4Qo+xPrQw6zdhHn0Is9pwJ6LBi4N5QkL88Wsrm7u0kiaavIqBbhr
 ePZ1Gs2uR/mmXu1yWd8emSI1bSGe1W370AN+0U89IvtqprSBfYf8aStfdMwrSkpTMMAtiLYBdzJ
 6pNt+2LyrGEJYNhyS7Q7DleE8wzHuVA7upuqg4+vipmvPDWMtuhMk9vm+hgD9sEmDWU46j6/Y0V
 rFaMVptt7zGsdnA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This function is not meant to modify the GPIO descriptors in any way so
we can safely constify both arguments.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c        | 2 +-
 include/linux/gpio/consumer.h | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 5b0b4fc975435290a03410f1e33fea28dd6fea08..6b4f94c3887fcbe1d90a0ff5800100e9ae7ad5b9 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -286,7 +286,7 @@ EXPORT_SYMBOL_GPL(gpiod_to_gpio_device);
  * Returns:
  * True if the descriptors refer to the same physical pin. False otherwise.
  */
-bool gpiod_is_equal(struct gpio_desc *desc, struct gpio_desc *other)
+bool gpiod_is_equal(const struct gpio_desc *desc, const struct gpio_desc *other)
 {
 	return desc == other;
 }
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index f0b1982da0cc78b85af8bd61474cc2fe0dd73c98..00df68c514051434e6fa67dc2307c6a8ce4ce3df 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -181,7 +181,8 @@ struct gpio_desc *devm_fwnode_gpiod_get_index(struct device *dev,
 					      enum gpiod_flags flags,
 					      const char *label);
 
-bool gpiod_is_equal(struct gpio_desc *desc, struct gpio_desc *other);
+bool gpiod_is_equal(const struct gpio_desc *desc,
+		    const struct gpio_desc *other);
 
 #else /* CONFIG_GPIOLIB */
 
@@ -551,7 +552,7 @@ struct gpio_desc *devm_fwnode_gpiod_get_index(struct device *dev,
 }
 
 static inline bool
-gpiod_is_equal(struct gpio_desc *desc, struct gpio_desc *other)
+gpiod_is_equal(const struct gpio_desc *desc, const struct gpio_desc *other)
 {
 	WARN_ON(desc || other);
 	return false;

-- 
2.48.1

