Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1572309B1
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010367; cv=none; b=CMhWaer7kzLpA8pVwS7xhoVVG62UDv5YvihQpSeY2g3g8QDIDrhUPShRM27QYP0T/WNq+6g0Text4AtId/wXEGfELkG/GuZjNrnMaO74O5aPRa4SG/BVI62hv3tvPJ0T80sqCVwgTkukUhvHvfYM4QRlu3PUYlBWyi3XssbxwLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010367; c=relaxed/simple;
	bh=XdR1F1d24wz4tnZ/+4ZmFiOQGGu2evq7oEPt90HJ6QA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VOjTDj1qzKPatUVN3bHWQZXL5gEXbxi+W8aCi2ZyXiDNP8Vm0Xs6p1v+i4Stsbxc4OnvYuFX4cpjz41UMf6sEkpuH3dCCGinhLLF4Cti0lgMP4K55CMCXNa9tpTZViW2Bwo3nJPl8HIwmYrp97iCmXFWYl82PTSnv5BimMaRb6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=UNWy/fhl; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="UNWy/fhl"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso25282135e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 00:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744010364; x=1744615164; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IHa5+3Xv2nYSlmM0R8jZrZyFIIPzDhCPSeCMfkmkG+w=;
        b=UNWy/fhlCv5bo7eiTSBX0479u8/p//dZWhcGOOuEMVTs11wmqmlzJIowy+TKtYdDCz
         FHT51IYo4PHLzfVPd9aXpAqaUEt695bKeOXuK5mtiYkqSMmYQUTU8a1ftZiIVeNwHs2w
         xZwf9p3I9jhVjcqcXH7mv+tULa5R1Iu9fSE6Tn2Cs5H/yysJ2DRZcrHTLJepvAitonaT
         zhCEXE9eZFA7mFtz8epLwgTzIe6+yZzi5wi1B+HPH3tHPOm9tWJN5BowXmRWnPC/MbMO
         6PyoOu8oZ1f/HMJjutkxt1gYtWF5oQ+2MsQgSb9qjN386Cb8YH86pg9ZfEjZEGhVU8+g
         Z1MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010364; x=1744615164;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IHa5+3Xv2nYSlmM0R8jZrZyFIIPzDhCPSeCMfkmkG+w=;
        b=ez44m3F7bnVPm6rF/SnOgBDlCOfadvc/LCToDMHDdw7og8EKkStfT8w/nYYO1EUGO5
         EhvqGFYjtC0chJkVAHy/LAz/1OWOYoH70ycuzSNUKmn/HLUCh39Z1uVNXcAGnWMmKdc1
         RgocIYetAoHwbW0pIInr8h4fHMGY/JoxoxM86T785pqA36grSrC/dUqwV5P3dsfBQr1X
         jr0GalDAOsQnjgnNiuHzVUFnLYjhWYhU3gLyW3uR4O2OqWEc26os/hT59BxH0h6qE4jv
         IzlYIdYNlLdhhdMqPDj2lB/+hLE4LkZMgsq8AsEp7Itk3nydcbl/mdIu+30+zm8wLW8j
         sTWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqbXOevmyCa0dAhRt/kc6070IEM4OBS3oUgebo7AE6v2+NcnIZ/ZbftDQVvncQdLhPsV9/7hfl2Vp3xiI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyW+719mktuC8RWOnvj9KYHQfPnZNrtkxWBJ9ZTdU9pH6izyHi
	kzjSd5y5+GOiK4nyFNgD3Hz7HifLE4ih7d9E/kD2fRPZokSAzis1sxY/BV4hwc8=
X-Gm-Gg: ASbGncuamOqUk7pPE0Q1Fwg8xW8YqJMVXeiwSnOEUOfaSXd8fc8/qk1yywag/hx47sO
	dvy2R96F8pnh3zpGUrnxC0VtEV0tJEY12aOfepeATqbmBNH6PqOHk7IJgfFicXOj7lHBSm4+JCd
	B1JOIyxRpWQA8qIT+0FwXispqQeZWofLzzMnY0cowjuCC2aB8Eav0IlxqvCo4kx4t3JoaejK4Pj
	MJSPmaqYne/LNQ2yLAiWHWFAKnhnnFSgmlw0CTOdjxqQeXkNh7vjZ2GqeB79Nnk9pGPF/MVK8/X
	l4BWCRCrkcWpxOOHaDa7GIEY56EH6Psd0tjelHZHXkAdUmpB
X-Google-Smtp-Source: AGHT+IEC4uRQ9XNMmKKpbID7+2W+G955oGmEj85gPslrlwXGh/J5f08lBKYmki24DDnHeD1PZLDfuw==
X-Received: by 2002:a05:600c:1e23:b0:43b:c95f:fd9 with SMTP id 5b1f17b1804b1-43ecf81c304mr101899695e9.5.1744010361163;
        Mon, 07 Apr 2025 00:19:21 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec364c959sm120215145e9.25.2025.04.07.00.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:19:20 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:19:12 +0200
Subject: [PATCH 3/3] Input: adp5589 - use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiochip-set-rv-input-v1-3-a8b45b18e79c@linaro.org>
References: <20250407-gpiochip-set-rv-input-v1-0-a8b45b18e79c@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-input-v1-0-a8b45b18e79c@linaro.org>
To: Michael Hennerich <michael.hennerich@analog.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1854;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=b1mbZ9+luKGaPZMmERJAiMQlHQJ363cz8LumGJPcpTM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83xvW12rx8RkPQUSxweYOqwmmE0p4xrJnqauq
 fSmi5ZJlsWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N8bwAKCRARpy6gFHHX
 csOwD/0TeLStBON5XGpuhq0sT+tGYEAXHhUsDfBm+6vTRWA8DAPj8UvyoWIJpVSXHhJ14d+LF9/
 MPaJf0IY5KUNyBNefLcPapsbPwWG4ThYyel073Xq/8IP/P5hzy8HdOzgYem0VzpGSgS22YGPsSY
 PNI3icdfVpBrtblUKN1kOpsW/DvAvjkrayb74UCZVoeQAftbNnswVMBDT80aOyEZx/VCcBAroae
 0JrqhW6RnTqY5eCZmkEzuLOeSpwHcd9Sh0PzKcR/r+9BMVBLesPLi50KL+yvJtk2CZDkH2A6DRR
 /EKjKEg7xJdPho9+PiPV2yfsyrb5DM6B0El7Mdn+tRm4C8VDd2by7PeXD2cdumvIELOGxwQ/9if
 MqC4/wLoXqsxumsw4FSiok/CNfk/XlVXp+mFazMOpHVobIWqRxd6gbU6QTuWsRuy4tlPq8KxPdO
 8A0318xTNB9W9mLoM1t7jRSh0rFsKuIyV8b/z/aOaHxYvXaVTklqSw941hlG7RwODDLWoArsuyj
 6DOlSS4wIAgFuzEKbO+R10JTBsNZcnQ61h1rbpxpA1gjpxN070eGsllW6ZgVxGcRtJeMoeesB/W
 fB4CUGLxl5ZUdXR457F1R/jgRWnleYoFvOLMcH/FZHOppGLoXtg/PCyHDYb2w1zI0STYpvzds81
 RaKAUPjWTuQTCiQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/input/keyboard/adp5589-keys.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/input/keyboard/adp5589-keys.c b/drivers/input/keyboard/adp5589-keys.c
index 81d0876ee358..986a789f1ec3 100644
--- a/drivers/input/keyboard/adp5589-keys.c
+++ b/drivers/input/keyboard/adp5589-keys.c
@@ -404,8 +404,8 @@ static int adp5589_gpio_get_value(struct gpio_chip *chip, unsigned off)
 	return !!(val & bit);
 }
 
-static void adp5589_gpio_set_value(struct gpio_chip *chip,
-				   unsigned off, int val)
+static int adp5589_gpio_set_value(struct gpio_chip *chip, unsigned int off,
+				  int val)
 {
 	struct adp5589_kpad *kpad = gpiochip_get_data(chip);
 	unsigned int bank = kpad->var->bank(kpad->gpiomap[off]);
@@ -418,8 +418,9 @@ static void adp5589_gpio_set_value(struct gpio_chip *chip,
 	else
 		kpad->dat_out[bank] &= ~bit;
 
-	adp5589_write(kpad->client, kpad->var->reg(ADP5589_GPO_DATA_OUT_A) +
-		      bank, kpad->dat_out[bank]);
+	return adp5589_write(kpad->client,
+			     kpad->var->reg(ADP5589_GPO_DATA_OUT_A) + bank,
+			     kpad->dat_out[bank]);
 }
 
 static int adp5589_gpio_direction_input(struct gpio_chip *chip, unsigned off)
@@ -520,7 +521,7 @@ static int adp5589_gpio_add(struct adp5589_kpad *kpad)
 	kpad->gc.direction_input = adp5589_gpio_direction_input;
 	kpad->gc.direction_output = adp5589_gpio_direction_output;
 	kpad->gc.get = adp5589_gpio_get_value;
-	kpad->gc.set = adp5589_gpio_set_value;
+	kpad->gc.set_rv = adp5589_gpio_set_value;
 	kpad->gc.can_sleep = 1;
 
 	kpad->gc.base = gpio_data->gpio_start;

-- 
2.45.2

