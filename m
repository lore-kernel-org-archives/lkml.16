Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED0C22618F
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010663; cv=none; b=UJmABdUd3fOVl2ZXlkh6D1Dpsw84de5uENkt6Z3sMg2a2Q5Kx+rt4O4MVpUKLvWReO0wlugPPepOc7cRmf7CqDQCHxGMSFsDOZDNa7Szi3cp2Fv0C69gjhCXZXA9cgKrvgGVLcg2FmO/XGKUmssl6x+t4SRg63Nb7Hc39bJT3lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010663; c=relaxed/simple;
	bh=J7f2eUTApbiWEcedhWmYKxUPKehC9pqeBkajVKzZWqM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mIVmvdaBpcVlRpqoxTf6ctHr4RSSw3fJ8DeYitH7przrlUr8a9v+V/DrqMWpBgCTSMOU4LWfKRELdl7KdiElQb+201dsklSBgO4X+/ZfS1mrq1egUlNBExR2tdgLmTiQIqgmPdFFaEagZ0p0QoRNKI/S4FZFtoJ4WXF8lh1M1To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ri7GuhxH; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ri7GuhxH"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39ac8e7688aso2940493f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 00:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744010660; x=1744615460; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H8ZsxLGWS4jokMHzGTeIU5UFzwoJYJnzajiKuQ0WlY0=;
        b=ri7GuhxHg+7WwsXH7x/LwveYcx+j65PrEIOiMQXr2tR84zuz99VWTqy6pcb/p8trOt
         mK7XElHddFWs7IatO0gbxwHvLIyd5X7+q9vmXmmsvSKYdsHNoVA6SmT/zfnR2bOyc4GD
         mj8X2imr/lKyZWwQTAxgWAt27WGvGS03/U2KNeKEkl2NGF526LTSTIqMlVy/RjOzYzVy
         TAW1Pj9uahac8aucFohjoHcHBRvYtcVkf0IXNZj54ySG2VRtH7xmRe8x2/rfVuhZu5rS
         JBIJ0yfsqZ9b3BDC4+H3XvfGq7xc4PkLnhpfiQ3/g/iP9bj6GLhyJMRxh1EUcUZ6ilCQ
         TiVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010660; x=1744615460;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H8ZsxLGWS4jokMHzGTeIU5UFzwoJYJnzajiKuQ0WlY0=;
        b=dAkAnyHMJqSNtn+JPfYS0P9WGbSSdTJcIrNnYqXqoyfuJqdL6/Pk5Xv/GpXn/QRXrn
         qMPwjwCKcklmWL/Lwc4ZeDvHkSONHhXGPj2vnm+1xfy0eayto0wbrHSYC0V3OO6nRlHb
         RJCAVYM0UHUH45WTpEc0KwAbgirDoj0LgpVcwuLGGfeM/t3ohctxsmS66vojUo52POFj
         kkTJWiN34CkwQMX5Yhw7yzEyHCEMbgZUCOrj5ZlTMTBkd/drs/ivO2DNu6QI2hhs8NLM
         VxGu9Ain5MbjEqlTNeUxe7YQQsCfJgWPI6paScVoHaPqoBoy0hRWKg/ipNJvW9VVt7bw
         r5wQ==
X-Gm-Message-State: AOJu0YxdhA1eO4Rr6SnHcBAoThkrg+1hL1feJpFy6O1iTLhBB0RtSNG/
	+V6haxKU113x46E8sR8ZaGHeuncDJ1Uqy/y8e+QzcGKMHNwWM5nZHJqwynn1WzY=
X-Gm-Gg: ASbGnctFC7dsMBFSd5hmxRDuOjn2+gwROIi3JKiSti/mtg2KuGzrP5HOXodx2WR7cbq
	YuXq6CQWob3yGoQIKKI3IT9AGnLZttZR5txKm3SQzGigOC08kvymR26VBTVoXLiOHrSv4aq2+DQ
	NZ5n70MS8wWfEIvfjf3vYv+8pkW3EWOAwZdfEVKis9Ja226NwqVU+6mhXtSvDrI3MAvSZ5um3b5
	c4sa9STikMeTg8Ef3snqVqbjM5s7jYHCPNYf+gtf6TiSReKnd4h7A5Tbm/AqfLMCjMzAmZ+gChL
	36z6BpNUEtO3o/k2/WmxYQW9repL8ldJvae0Ug==
X-Google-Smtp-Source: AGHT+IEHDmnu8o2tM9N5GgWCGN1d01t9y2nKlBwNOJafY9H4tnxyVKYzGqxLBk349w1BiP4YorcOCQ==
X-Received: by 2002:a5d:5f8a:0:b0:399:7f2b:8531 with SMTP id ffacd0b85a97d-39d6fce113emr5809650f8f.38.1744010659698;
        Mon, 07 Apr 2025 00:24:19 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34bf193sm119855255e9.24.2025.04.07.00.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:24:19 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:24:14 +0200
Subject: [PATCH 2/3] mfd: tps65010: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiochip-set-rv-mfd-v1-2-43f4d86d01d1@linaro.org>
References: <20250407-gpiochip-set-rv-mfd-v1-0-43f4d86d01d1@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-mfd-v1-0-43f4d86d01d1@linaro.org>
To: Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1365;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=dQlwl5PHLnR5U3eeEdKnSpeQk4aB5gzzRzjEGZ9SUOs=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn832gn8MmFWMAXd4hoFe2Z1lYY2mUhkyK72lTZ
 AD1zYT1cKaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N9oAAKCRARpy6gFHHX
 cvjfD/wPlFmkqP7wkuSptD71j/OYnTX51KWKxAYbW22mJ/257F6DjNpbwMoEudW0FozI0jjdi/I
 tXMK+YHhq3uyreCGTNP9a6DNtfLgRNVJvLvspntlrfliQrzcVXxnt0Hrzw/dFrU2mtd070IfJzb
 ABClbELM7fVdQHHMYSa1oc9lYbFOIdXv0uDNM0x+iC42FYyz1OEW4bt8uumtW5gbSAxUigUdckX
 LYYdIyG2dTC3865pgZ1GurJFf12gLO9cIBUDmp9hpNLgSku/EOP/YSiZ8mUO1VJutUeQPGZEZMX
 VkI9S77Kmd5la0ukUGae7tW4JPtlFdq9ELfNdvJeLj0TYyZt7SFheAzFvIr9sGEQu/tVKbgS/7B
 CsgQhZ9WIwx6peZASqJTBpkAgXaPZyGaz/vXeGp1IzYd1MrEP6Z4YGP1r6tZIK4pdvqcuEPM8Vv
 wA4hOIvBOA39HwaSvvUpw3kFjjlNrhJ8q10WQ3VMIFU7jld3qaAoY5jK8sw3xhWLyyhR4PolBKy
 bMLMYSLag86n6eM4T62fKU97pUWng+hk34IGp/lYmEKsyeQ5kPBQwAtgAT5e+mYx6x/DvVNRwW5
 80t5sR95joX1LhXOXRNNLuZK7l0y7qfCED6cTLZMuleOCl86VSNp89yulpL1ox2uIPREUrW4djN
 dhIRxwWKaY0TF9A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/mfd/tps65010.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/tps65010.c b/drivers/mfd/tps65010.c
index 00fb12c4f491..5f1d1e061192 100644
--- a/drivers/mfd/tps65010.c
+++ b/drivers/mfd/tps65010.c
@@ -446,7 +446,7 @@ static irqreturn_t tps65010_irq(int irq, void *_tps)
  * offsets 4..5 == LED1/nPG, LED2 (we set one of the non-BLINK modes)
  * offset 6 == vibrator motor driver
  */
-static void
+static int
 tps65010_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 {
 	if (offset < 4)
@@ -455,6 +455,8 @@ tps65010_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 		tps65010_set_led(offset - 3, value ? ON : OFF);
 	else
 		tps65010_set_vib(value);
+
+	return 0;
 }
 
 static int
@@ -619,7 +621,7 @@ static int tps65010_probe(struct i2c_client *client)
 		tps->chip.parent = &client->dev;
 		tps->chip.owner = THIS_MODULE;
 
-		tps->chip.set = tps65010_gpio_set;
+		tps->chip.set_rv = tps65010_gpio_set;
 		tps->chip.direction_output = tps65010_output;
 
 		/* NOTE:  only partial support for inputs; nyet IRQs */

-- 
2.45.2

