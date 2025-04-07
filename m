Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4EF224AFB
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010000; cv=none; b=QsU/YZ5KCsuJ8Qv0EiT8dzXVRwcv1A8u2tN08gtsATDNwsQjHeGDq9oetrtspFnoZF4mDxUvGsVpV2qYmwNAoMllOmF9xGKdZABKqI1GAA4WuHnp7V2DJ4dWXLozfH1hD7wJ8k1zvQLEGlHZbYQxJzeisiy61k1j6W37EYJr9gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010000; c=relaxed/simple;
	bh=/5Sjz3aLnWW1HWrOcAYyweVPpFM7vC+vJtoK/pB1it0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yll97LcV7FV9P/+wwsLV3qDyrolC6rQ7VCNmuNcnys5mKB6E6+8D/LysyO2+CUFvNFkj0cL3uIY4C5KaBu8q0tFJSYUgM8NdTSzZr4fzBzFTHITaDcdUYth5sqDLpJs4Bf9VL5VnzluA2kPlN+qEWVoo9b0N2xo7SQ+N09n7GOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=NXaIbDDm; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="NXaIbDDm"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-391342fc1f6so3572803f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 00:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744009996; x=1744614796; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5irncOO7SE3DLhdbNeNA8jd9DPgwzCzzTwzb8eKHP+I=;
        b=NXaIbDDmSle1F0IPCwn+YbBmNvDZ43f3hyUwKSjrmnbH8Zlw2w6pJ7ViJbpq1Dc9sn
         psRkom2vRBgHZE3vpN0DmNxp4wPGvVi8sg9DGPitZJjver6a4RC4AEyLf8fy/EYtqw2J
         c97rp9rssqNLvETLkF4A0kxOvdGZME4m2jCJUcUgrlUUL9UP2rOF81tAanVds/HTu2u1
         xYL/Vt9+v3b80VDIQIBfOfaI1j5q+dZDiaom1kioA/cUFODrXfo5CAExPdmiTjjQrs8e
         PAoVIsLDGNnltFI9Znt7nfY2vP9dLz1an8wHINT3chS1do5bC51PmzM9C2XYGbjiKRvf
         pDtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744009996; x=1744614796;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5irncOO7SE3DLhdbNeNA8jd9DPgwzCzzTwzb8eKHP+I=;
        b=qI/Um3ykJpMyRqvTfs4jUUHOesahTqQURBZ8a0x32bVIfDIJGlZeZ+q05jI+e9K8ao
         ZDYMi7r5HuzEJJfP9aHDRyqBD2IJLzTgrxhIrz0c7LckAroPiESnY+QOFvT+Op2juilI
         WQfgJg/yBUqGw9MCNu8Lj72F2bvML/J6obZCWpb+sI4UQnY9GuD1bfAJIgy77uGazAw4
         bj8Cx7mr14vgDYM+b0z+8D+hRxREmLIlWovmg5Xgp+IRV8GhxF/hdZl69E7DwTHAW+gK
         MXydBl1HX8HGf3+6xLI61WXO2X5tUFy50UOvudkU20zMUFlwFFL5fjKKutgPI1S2xT4H
         TqLA==
X-Forwarded-Encrypted: i=1; AJvYcCXKLWmp3NDrL4SIWwLCqyuKN11Zyn4CsGw9LRyGn8OuwVvDQYL5Wi+LzoXqKcSM5TnFVgZHVNIZNEOgfSY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+X4cDZggDbUjVsNhqgFpRQsdAbdcoffvzXe5NRJIsdou+blSb
	aXz7acvNIbiQdh5kVfcvb2BsELiMSzC5xVFN1zbEgZ52nIXPfJ91e2m97lnjHOo=
X-Gm-Gg: ASbGncuikltLRgrAilV3XpzBuJhEiXDooaGs53OAKztroPEtTh/HVs77par2NnsYGtp
	i2fcDyY9mF9V7fEFH2NO0yIH2uMD9fojXCgoScI35vQR+UKbQoHl3LAj1B7yir+MvWA86tzfrUE
	xxhdnuhu+zAlOG/KCxN0Bpv2CxzztNF+vchIchDYGEBFJkoXWO+P/91aS3zk8P5PP3/O/7ftVKS
	IZnrkDp3ZlqqZ2X3308o7lw1wu8J/OcgwmXhMTcvh6nz3FU0DRfnaHQz6KCoDIeJktxPdPThr1V
	rROY9wlmfGt8OMSrn8LuTs1/X9YCYTzBe1S83w==
X-Google-Smtp-Source: AGHT+IFBHgqI/Cxfb0Fe7GnSQX0dBTR8Ei+wg1va5UMyVSuvAr5jqU2pls0VxHNJRirZpFzVr6R2gA==
X-Received: by 2002:a05:6000:4027:b0:38f:4acd:975c with SMTP id ffacd0b85a97d-39d0de28abfmr8610281f8f.27.1744009996357;
        Mon, 07 Apr 2025 00:13:16 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ea97895e1sm145267115e9.1.2025.04.07.00.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:13:15 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:13:10 +0200
Subject: [PATCH 01/12] gpio: dln2: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiochip-set-rv-gpio-part1-v1-1-78399683ca38@linaro.org>
References: <20250407-gpiochip-set-rv-gpio-part1-v1-0-78399683ca38@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-gpio-part1-v1-0-78399683ca38@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Andy Shevchenko <andy@kernel.org>, 
 Peter Tyser <ptyser@xes-inc.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1429;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=+n19bsYgJ9JYV2dFC3UJAuU3dlkEyRxjh8PBYfyEbIM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83sIgmH9ntPZ/6dk4gBE6hPGCGhE/lByx8cce
 k8UINLyU+iJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N7CAAKCRARpy6gFHHX
 chDqD/0Z9/1FeuoUlnMoAXDIXhzac/3fSTa6xFAnJgTyJfbhsEsUh5CIYenipRVpDmY5T81G7cH
 eWYEhbJKuQLRvi9UXr4HhimopV1bi7S0wAg2xoz27GPQAXkW/OxgQs7XfZrgFqaAmUhpf8xj9/l
 MQQlRFfK2w1olppK1HpMvCSXKQHxeh2r3+ma9sgdTYkWatE4PCI9gZaWjjJi1sGzZzX7FdcP8T8
 rYBvaVoMirOR4BmWbhp2vJq4+CKR5TTnTZ/8TZFj6Ibb/gFun89CaQdAH3QVe3myF6YSpeIgXDv
 U3uv6i4VgMFMuvFP0uvHOa6FN3kD4HDI/Nj1eMPlcdX7NbjC98UCysrNoJqlxngT7QsENrhFeeY
 vjs2Wik4oEkIiNWChZPE8Mbb54H32/VYDlXenzlw+Iy+UPa04d+5pn6z4zwrAEvWQ4z9Ojl303J
 Uj25cc2Nl8XKdn+YCb86uOarCsfvisuRAXbOTE4g87GG/5Ssa9S0hmP70yj2SHhYq4o9c9GTAS5
 DwDJ2Da246eeAE67fyWnaIrOkPc/YEYSLFhCquFBUdp/gZgTYlhwG/2z9pIxHN2Xl6lBQfF7xgo
 uoyy4gDFXFQyp18mUyQERyxZLF9nUN4/Do2SdLM47h6x63M8FYf0mVFoDzkhGXgWp+sFkLNunLs
 MJOQzIRGZ6Q8eLg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-dln2.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-dln2.c b/drivers/gpio/gpio-dln2.c
index 596da59d4b13..4bd3c47eaf93 100644
--- a/drivers/gpio/gpio-dln2.c
+++ b/drivers/gpio/gpio-dln2.c
@@ -220,11 +220,12 @@ static int dln2_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	return dln2_gpio_pin_get_out_val(dln2, offset);
 }
 
-static void dln2_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int dln2_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			 int value)
 {
 	struct dln2_gpio *dln2 = gpiochip_get_data(chip);
 
-	dln2_gpio_pin_set_out_val(dln2, offset, value);
+	return dln2_gpio_pin_set_out_val(dln2, offset, value);
 }
 
 static int dln2_gpio_set_direction(struct gpio_chip *chip, unsigned offset,
@@ -468,7 +469,7 @@ static int dln2_gpio_probe(struct platform_device *pdev)
 	dln2->gpio.base = -1;
 	dln2->gpio.ngpio = pins;
 	dln2->gpio.can_sleep = true;
-	dln2->gpio.set = dln2_gpio_set;
+	dln2->gpio.set_rv = dln2_gpio_set;
 	dln2->gpio.get = dln2_gpio_get;
 	dln2->gpio.request = dln2_gpio_request;
 	dln2->gpio.free = dln2_gpio_free;

-- 
2.45.2

