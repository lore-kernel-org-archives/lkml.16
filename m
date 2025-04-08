Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CC92236FC
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 14:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744122999; cv=none; b=Zy5X2RztHlPA2azwmF93SCwAoiUTA844eqrp3uNHKrSIHm2PNQHLdBryZcxq9hC+JjZo8PS3ybwATlGdL+Nsa75G9XuSwK6NmDV6YUzi3BsFisl4u7FSL6yxcgNaP6IkMZD/7E/t6If65B9T+MiPfcqTL/Kk6zk32Hoj0OQe9hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744122999; c=relaxed/simple;
	bh=VMDuT2jhj89NF4sxHY78mrJyGiA92w/k0fyZukw4JbY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YBXil639MaPS6C7fBayfISfMOl2LNjMMTrMFkw3zfyibpbJAhfOBKXRGreB3Iw7+xRtGUUviV9QSttRFrsnrnQO8v+UvMeS4T4RlTiBo0od0K+1K8Oof5T0I4pb9ITnjXtwM4T/uZxJwap/eQwU5c4LFvjUl8gvkv+GOmIfQyzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=hd/+GhPh; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="hd/+GhPh"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39d83782ef6so531293f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 07:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744122996; x=1744727796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wPPvBfN+HGZfLFV1ZtWLMiIkwQz23m7w6sKuYGQlZ7w=;
        b=hd/+GhPhIt/aavoNYkuoppjGAAZabEhso/V46Aq1c+szqS9myvxDBVdcjeho24Pp41
         sRnWIoOJ6LhAJRhcSIeWAiOvRd5uqpP4aD4czEYOIVaIa550WEuNqLBHXPBVOaZviCoB
         RbJFOUjrUSnU0vZcz4wLxpnQS6qelD1ibjto0w1Gow8KtLQLFPjrniLS5C/VOIPFl+T6
         MuW1QhvUCGF4s/fLB/rOt6HsvVNLMhf+mXOsiUYzYlAlOMGFZ32bbxngQc+UDAh+3Z3b
         GrMj6NHXet7+u0E875xDB81GsBHvBHeEZbY1tdjSWxEdSip95NGxiKu+56KJ3OH6CUmr
         3Hlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744122996; x=1744727796;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wPPvBfN+HGZfLFV1ZtWLMiIkwQz23m7w6sKuYGQlZ7w=;
        b=QtX/Wc/Mmx0XpB10Lz2JXHDUDgrm7KDcS5QA+HzNuRHyVPzmZYkxaF00yIPkeG7o+A
         otk7/M5Zg/59MX5s/tnUNZXLpg3oYdm6tUcTVbgO8OEJ9wHLVA4rFb8aezhWpMAgPuiC
         Gei4AsEbv7q6dGHK9Qa34bhaw+hkJiiYzUiohUGV+HtMSQCvSodzcHV0MpyXl1hZB+jo
         u4wKuhMi0jfyU3F6du0WsObmAJ7PN7IZss9MkBm07zA6EaeaC47ydtb7Ogf657Bl4y62
         rVAYL7lZraHns3Xi6mcjmFXvUDELKBRud/Z4evMRPKJnCeXsJjx3r7kKJHF06zUywq2Z
         1rBw==
X-Forwarded-Encrypted: i=1; AJvYcCV2WqcEmlT1EmOVMvvQy3fh01DZ1HZzk1Ki2gEbDOq8pIlNHb+q8TjLdCZpi+KJWx6hTFbpO821VNgxqf8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwM1gwD/bvb4uZt57Fh+8Kx/0kbGHuBXA6fS6mewUkhyKPRbsFM
	aR9v2lFNjln1nq0kbm1Tgecnk8AwWIPNPzIH6B3NIoLMqN+pYwGAZxiwIT1uIj1bwde0jYu7AK9
	owfo=
X-Gm-Gg: ASbGncvbfnme7/3VwLe9LOvj097a+iY/kUzGSMs0CHf+78is+Vi3NhnrPZIarCF0o/y
	gBDB6LvTKe7BAqmN95iqpkFXag60YE3SZQ9bAMjb4cPKYGlUmjlkqC1qPQnRKWhjh/QT2Qg16ER
	Jo2NBsx1CAjIjK6Y/M6p8iso1F2cONzE66TOBpkt+P3L4h4rKUI2Ml1kcPuWMzcXyuk/azrN/ER
	SuuKqxu+p4B+Hn4L39ByNdVDlQ40U1WmfwSjEsZf/Vmmvm0UvxqshfPuaj5OKZapFe3ExQjkc2T
	uM05Gk+tLUcz5pJvOM/L9bMj7U2wYW9gRGA+v8SdVWdZ
X-Google-Smtp-Source: AGHT+IGs3Xppykht8aj5t+Cb6rFG+nfWJmqODTuMzwxw5i3C8PzwPs3DpgDnmHqpNVBS5pEI3mexfQ==
X-Received: by 2002:a05:6000:2289:b0:391:2a79:a110 with SMTP id ffacd0b85a97d-39d820ec28bmr3149920f8f.29.1744122995327;
        Tue, 08 Apr 2025 07:36:35 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a727bsm15003151f8f.27.2025.04.08.07.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 07:36:35 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: James Cowgill <james.cowgill@blaize.com>,
	Matt Redfearn <matt.redfearn@blaize.com>,
	Neil Jones <neil.jones@blaize.com>,
	Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] gpio: blzp1600: drop dependency on OF headers
Date: Tue,  8 Apr 2025 16:36:29 +0200
Message-ID: <20250408143629.125576-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Use the generic boolean device property getter instead of the
OF-specific variant. This allows us to stop pulling in linux/of.h. While
at it: drop the of_irq.h inclusion as none of its symbols are used in
this driver.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-blzp1600.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-blzp1600.c b/drivers/gpio/gpio-blzp1600.c
index 77ad0e596f3e..2760a13c0801 100644
--- a/drivers/gpio/gpio-blzp1600.c
+++ b/drivers/gpio/gpio-blzp1600.c
@@ -10,9 +10,8 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/module.h>
-#include <linux/of.h>
-#include <linux/of_irq.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 
@@ -217,7 +216,6 @@ static int blzp1600_gpio_set_config(struct gpio_chip *gc, unsigned int offset, u
 
 static int blzp1600_gpio_probe(struct platform_device *pdev)
 {
-	struct device_node *node = pdev->dev.of_node;
 	struct blzp1600_gpio *chip;
 	struct gpio_chip *gc;
 	int ret;
@@ -240,7 +238,7 @@ static int blzp1600_gpio_probe(struct platform_device *pdev)
 	gc = &chip->gc;
 	gc->set_config = blzp1600_gpio_set_config;
 
-	if (of_property_read_bool(node, "interrupt-controller")) {
+	if (device_property_present(&pdev->dev, "interrupt-controller")) {
 		struct gpio_irq_chip *girq;
 
 		chip->irq = platform_get_irq(pdev, 0);
-- 
2.45.2

