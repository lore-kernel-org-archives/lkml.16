Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111831FCFE5
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 12:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739275813; cv=none; b=Y8Uwmolt+QgAGoPH0y0yom74fG0nttyGzT/rOmvby8cT0BR9C1bhRDWQE08pBbJk7Uo/lMB3DHfafdPqp6NMf594R8VnSgDAox5ztp9eikyEeht4FjxmnKlXKTmOB5d2CNsP+WD4WeEBKcP17GQ8lsALbOJB4bppifvUCBKrXhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739275813; c=relaxed/simple;
	bh=W0ekafsbrVCouZpHE4eG0kXHeAxOvTBzf5r2BK5vEgI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ElkZKBwUw/kqwiygIHPc7BLkTaBOEXkv2gMchcj9CPMhO2uGzHfpLVUTNA/MgUGzp1Xq5b7GWw5/33vEhwDNbGa0EPlHFXSyHRxjvukEyCcb+nzc9JbeDUN/aVE1yYzUcRZjHjNxJf5Cfll7Uk8QVDwDsbtKb2tnnvQQb6t3zaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LQ1N6gAF; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LQ1N6gAF"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-38dc962f1b9so2434544f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 04:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739275809; x=1739880609; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XtZyccNtwz7GO7SMXFqCDx0hPJnftyCPvzbSn44YoNE=;
        b=LQ1N6gAF44G3i0RoMT2LSXypHBoyDWDAQSr5AbUGO2h0l+T1kFnpQKouEdFNKTznjl
         zVhOi/9/cSkRmcJKx7IBZU3Cg2SeCEPNjt1K4l2ThRhh1Sz7db2OFOfIaBgXlIihlZ8m
         DRFgwRXlRSfFd4QbDIEaj6qARbpxNk7ctPGIkknz8LakRMVtgXR+kExSop75zy2xdeFu
         MSYtDVO3UmelVfJPLk9BolpB6XF+G4BA9TdEN3LTFAgF8g/JyCqFXzu3luIaDOWEjhVY
         nbs2RDKw4S5niTvfpZNDSx3Ll4LlJPflTO0qHT9dql9tGgAt0sSG1G67CKE/gl3TNvbF
         ZRYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739275809; x=1739880609;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XtZyccNtwz7GO7SMXFqCDx0hPJnftyCPvzbSn44YoNE=;
        b=QM2fmdW3ciXgylzCbAjNvTFZQhPY3+Sxfi4diN6UdN+YBO3+qbkq0biEvCJOexv/I3
         QQLchAY1C/LYEyIkSa5n6DM07mjITzybs80k+IAZGtNnc7cz7IRok8wNJvNDIcfBlhef
         JtYUUnyagF1jo+JBK7PJqwni8RlbFZBsszV0WzaiYFWPDmmdvEA1QuPNsaQuBB2A0XaC
         KCXKzwKZlLvC0nGGaxILqQVDyv6duxa9MdMoUu5xhFccKvIKgKbZDzpHC9Xze45zsHru
         sU6p9VltLOv64qW+Kl0VoT56rXWqpEZPG9mulk0jJ8pRNpc6K814x1TnVDP7DHZj5X94
         pR3A==
X-Forwarded-Encrypted: i=1; AJvYcCVT6NgxTqLjMFgY7dB4LjWM/SJtPU5TvYrEqkA+yOExXLAhbxhHNMGkfRM0Ct9JS2X8k3pjnSkdPYNl1OU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLTQ44rlcFLmClvyBfAQdX/Mi2cUXD5OXRwHb6VGmU/z0Q/LLh
	n7T6sojsBrp3F+R32rXu1l1AJU4Tg6Wol2qsVxu2DvZ4xL0vma8Utf/WUxjAb3k=
X-Gm-Gg: ASbGncuoBSHB7TnrXqTAOs0aNDy/YvEO2uM6UXVR8c5VZ8zNy4AEIpxC/S5LL5wTPJ/
	hVP1kHYSPWZYXve+VPzpifDZWGALVi0PJUFODHZZ2yQT7W5GHrma90ew3ac/YcSqQUpKnu2AHN8
	UZt0HeSZEERrSY8eegyKWmclI8uoejgCBWhDTU/I4bLHhWVX6wBCS+5U1n4lKbqxI4Q150w3IGB
	D6qpJJ3CsKx+rBPixfRbEpPSjL3SRUl/Ga/T0QkfaY2a3o69ZWGCftBa4Bn9IpwYTL1OG4G9xtL
	o9gfNRQ=
X-Google-Smtp-Source: AGHT+IEnMvyoo/QZ56r8MZxIXYEgI1p/EiVTUGp+SJgZOcRGb6rK51NPgCINgZNfS+tUEAg8bAFofQ==
X-Received: by 2002:a5d:6151:0:b0:388:da10:ff13 with SMTP id ffacd0b85a97d-38dc8dcbedamr12335513f8f.21.1739275809307;
        Tue, 11 Feb 2025 04:10:09 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:561:8978:1d41:636a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd4342502sm9152327f8f.26.2025.02.11.04.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 04:10:08 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 11 Feb 2025 13:09:42 +0100
Subject: [PATCH 08/14] gpio: mockup: use value returning setters
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-gpio-set-retval-v1-8-52d3d613d7d3@linaro.org>
References: <20250211-gpio-set-retval-v1-0-52d3d613d7d3@linaro.org>
In-Reply-To: <20250211-gpio-set-retval-v1-0-52d3d613d7d3@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Michael Walle <mwalle@kernel.org>, 
 Bamvor Jian Zhang <bamv2005@gmail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, Keerthy <j-keerthy@ti.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pwm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2141;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ZKO1P8iGSR8T/mvTR/tsiumsFS1ImUO8BGNiB+Z+36c=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnqz4Xx8lzJ1ICR2vtBS4GXgsgBRjKJMCyceywC
 7CgiRlNo46JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ6s+FwAKCRARpy6gFHHX
 cp1oEACzhDjjFDZacvqn5bV9RGmwJ9uZnfrey2XQS3uKQSrgo058tYNz+DeubiHU6KjXVtjzujb
 wOv5jfsozxQ44d/DdDyKsRfUo5Ya6a4iTpO/6jqs81QXhMzUxwu6Xjk9HoVe04CYx2cJrBQmBWs
 fTsbBYosqQQM58XIPEnfJpUiDDB8UNtdPdsuzhsc4vxST12HSsMQkUdKGGwW+8N0FU1utfBNFgr
 SUZlJO51yem9WmIpMbCrWvMi1DfJ+2H0nMxrSgjWHUaUPAG8pYxndyR1B85/xd/Htdpz/kf7a/6
 7IoctrQA6CETrtiKJ3y9YJTIoqzwwLm0j+ItcP9OSW90f+QBnk30JJmZ0/vfA48uUTDYQo1nmim
 PuxV4RmnmtPjm5lACx5TPSKJ4V6xhBDK7Jn7SXo0zXylkwDEqGGO7PKvTwpKHqOyv+/h5Q1liza
 yctgepn3XoT2ZIgQrnz6lus+p26+ar5/Occm58lizltZHsYkVnatwISuNPzaOCDaNLoCIbcMU+5
 IJfSwM4ZTK9r9NIpx86h5gJvWnAeTM3WimaIspzhNU0zkvg+4U07DD/2tHgpdMCCufllr4HbpsU
 Hxa/xECE+TXScoqq7UVOv++YwHX77gpiBYzpqAf4gwLfhfK3PflSSSpFGn1EvKaSY+9YdYgeqJQ
 uBqgEKb+uXW7YqQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has additional variants of the set(_multiple)
driver callbacks that return an integer to indicate success or failure.
Convert the driver to using them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-mockup.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index d39c6618bade..266c0953d914 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -122,7 +122,7 @@ static void __gpio_mockup_set(struct gpio_mockup_chip *chip,
 	chip->lines[offset].value = !!value;
 }
 
-static void gpio_mockup_set(struct gpio_chip *gc,
+static int gpio_mockup_set(struct gpio_chip *gc,
 			   unsigned int offset, int value)
 {
 	struct gpio_mockup_chip *chip = gpiochip_get_data(gc);
@@ -130,10 +130,12 @@ static void gpio_mockup_set(struct gpio_chip *gc,
 	guard(mutex)(&chip->lock);
 
 	__gpio_mockup_set(chip, offset, value);
+
+	return 0;
 }
 
-static void gpio_mockup_set_multiple(struct gpio_chip *gc,
-				     unsigned long *mask, unsigned long *bits)
+static int gpio_mockup_set_multiple(struct gpio_chip *gc,
+				    unsigned long *mask, unsigned long *bits)
 {
 	struct gpio_mockup_chip *chip = gpiochip_get_data(gc);
 	unsigned int bit;
@@ -142,6 +144,8 @@ static void gpio_mockup_set_multiple(struct gpio_chip *gc,
 
 	for_each_set_bit(bit, mask, gc->ngpio)
 		__gpio_mockup_set(chip, bit, test_bit(bit, bits));
+
+	return 0;
 }
 
 static int gpio_mockup_apply_pull(struct gpio_mockup_chip *chip,
@@ -445,9 +449,9 @@ static int gpio_mockup_probe(struct platform_device *pdev)
 	gc->owner = THIS_MODULE;
 	gc->parent = dev;
 	gc->get = gpio_mockup_get;
-	gc->set = gpio_mockup_set;
+	gc->set_rv = gpio_mockup_set;
 	gc->get_multiple = gpio_mockup_get_multiple;
-	gc->set_multiple = gpio_mockup_set_multiple;
+	gc->set_multiple_rv = gpio_mockup_set_multiple;
 	gc->direction_output = gpio_mockup_dirout;
 	gc->direction_input = gpio_mockup_dirin;
 	gc->get_direction = gpio_mockup_get_direction;

-- 
2.45.2

