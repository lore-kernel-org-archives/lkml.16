Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EA6229B02
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010364; cv=none; b=PWbG+z8bMOD0I5JfI3r+c5Gj9rBvmogjAUoOs3SauCCTl8hICC7SrJ3f+0jKH00KSiG9Vuf1zsHXs8pwfM227Q0URSWI5wqZnGbFvvwuqn1cUCfbrW8M5DFD9TPLzI3WBz28DNrcZGg4ENP2gkkGN0Wn89szJg2KiQ/Q3jCpz9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010364; c=relaxed/simple;
	bh=+deuLPSQkEJHMd1oN95jU1WrKRZsQUmYNkgMgUdiHfQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PB3Jm/1zmXsUuGBuIA+195r8ooE0lOmsNKDFbMDfa/gSe4T5I+DlTGDAzpuyT4oJOkjNby+LPkzkUi/wqDT33xdLv+FVdnXiFwMEU0flJdlsZNyUyjj9BXjsBszfY4efplQdwXaISfNL8DO3IG/TMLU0GFjyJz1LozdkprNAndQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=jIUPdJvK; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="jIUPdJvK"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cfb6e9031so37173845e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 00:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744010360; x=1744615160; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ChXOA9p44Ws7ALTa8sIdL/yKUHK+mgWVc1wgenfZZQc=;
        b=jIUPdJvKW0zUaPcv6jYIZw9bUSZquBFCMgkXHCx/MOgbnwdqQXYqyQrvhSGV4Ny7ok
         e7qn0XOQzKLGR1Y2S/6ndt86fL9U1lL2Ur40pRuviqyLY5KxDkoFy0wt3pPPWOsqPWIp
         arVdaRnskhRO+VMxRTmVj9yqmWDG7EBmgsxEGCAJGkXeJXrVOH6D1JY+YRhGfveb2tTv
         3aq3M0rSucHP98Fn2QJEHoodNU/eyuoXmm8EAyAaabILY9meQtHJk2lNLubbWQsmINHd
         Ky54dUmKDMiFkErbacL3gPvkhw61eshYf0WDU3p4/9B6KTka+UQ8UMeaxwLqkEHHMfBR
         2efA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010360; x=1744615160;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ChXOA9p44Ws7ALTa8sIdL/yKUHK+mgWVc1wgenfZZQc=;
        b=TSIRhEIXnmuhm5qCxbkktMufrdY1SzI5Zm/wQYEFMAa2R5+2aPPb/Mgunb8TTsnVRd
         5pR1rKDbDSvM6+/x8mJS+CXW4o6w9McuzEUbrpZrHyjw1w56pCQSLyNSFITA1VqWgPzK
         IJsJgn3bvyzA5W2nbPuk6oT/A+MFXVMHdehBGu0PM70ZF+IIlHkhBPbWxjGO5ZZJmFcG
         vQ5eK4RfdKbGoQ9oqOEebHSuraU8v9Anf+ubEwD4yFWjcOmudNY6wnjGFLKcArOltvpQ
         WJ891scwX6vBEocNmfDjcJBOjvGnZwl4KVVaUyUC6/JQZF9DFoFse838yfhMZBtknIX0
         Q93A==
X-Forwarded-Encrypted: i=1; AJvYcCWfddZzou7qLE75O1pJY+HSLt68nAc6hlAz91W+wxSDiAaJl0XrHJzZ1vOh/b7uQKXYeOx2+eMKCII0h4c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9iKBL178kBaztu+4T7gKoVJuBIMA4YsHy2pGkcNsBba7+XAxb
	H2wU3Jtz54jGpaZ4vcef0afx0aRuQdGj9kSMP72mNsdo4PY1NHTOKzfpqe67a18=
X-Gm-Gg: ASbGncs4XLlhdiUVRqMd/tYzC/KNt2v1Rz5wDOawV0cZLpZt2V/G+Y8BZhZY71acF0k
	kNFwDWB2COg/txxLFxZeHOu/oP0Ap20DiUofSUtmdrz974PK4wlUTLYFdtXKO5yyXPqodYYBKfC
	gQ3o+TLksTE4L3JiGECVRPuP5n5tBB5HBBYDgoM8coBIqZQ0YKmcH2gdUqa0rZ3SqTW7gb7e6Xz
	lWXAAvUVEXYWV5/7h6ZG9bdvtvF0I7Q1vOctxez2NKwPgVkmUAZppEMSc+nVy98FU4+S/h3FtnI
	4cpB/xTfIfQZJd1HFmhqhWoVMluj4VnG8AGfcA==
X-Google-Smtp-Source: AGHT+IFV4P8oQ3nG1OU2BDLNtmclbNouSwMD4cLpZlwSZElcCaMEGPNksjQsv2nIGYL2m479ZPgS9g==
X-Received: by 2002:a05:600c:1389:b0:43c:fa52:7d2d with SMTP id 5b1f17b1804b1-43ecf9c77c7mr84576565e9.20.1744010360289;
        Mon, 07 Apr 2025 00:19:20 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec364c959sm120215145e9.25.2025.04.07.00.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:19:19 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:19:11 +0200
Subject: [PATCH 2/3] Input: adp5588 - use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiochip-set-rv-input-v1-2-a8b45b18e79c@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1794;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=o8UJdITbenIEBWagS9tbUTRGEbSz2Bo2wwxkVvQkfuo=;
 b=owEBbAKT/ZANAwAKARGnLqAUcddyAcsmYgBn83xvqP9Ph+Wa7aamh/W98Tk8+U6/kt9q1kKzL
 05h47rIvU2JAjIEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N8bwAKCRARpy6gFHHX
 cotzD/UbHDgftNnyNJ8HCygByrRKaQFZ3aVycjBz4aWVoHfft7cLF9QRClurpPH5B6EURB0jL1V
 a0RXvV3COSo5AGBpew/77WVrjil5NBTUiZTan6AT2WF8JuKA4U+mkC/lAP88ylLZ8dtt19wDdAm
 5oqlO5wxa2+Idky0zIakj8SU8Zcy9VG6Kc1f3nBGFKgKmVDc5yYI54dwJu2RUK9j2TI0Dw4E4rF
 QJOQ1sRCE9Ecqa2rcFyi50PZXKrx7Z87Wyqjyo4NWrkkpNCphgyGNXdwhr2hRn7VMB+VDzj95w4
 MIuG+wuPGvjtRbdLG8XnM6SSSHpkTkIzDLqGFWJVWlbk7t3Yuk1RlPTEzoax3PzeicvlYK8MZii
 fB8DzqERSRcDBy+ii/ZNgPEQwMfPaSs/XVKVMrQumqss35lI/D+bQ4Iw+dCpEVW5DT0xNMdfN0U
 ermT0MKJknP5URBrPtN0+ua3StIuqDXebEqp50PvrHdHctcN1zie4uTrCoquTp8VMxEaGpaVykr
 ++LB0/0XSElxUmX3LTa2b0EOyhDvgMijDA1xK10XqtQ48lr9rpJy8z84X/9xXbTn1+cFod47Qbm
 ExQc9D9s/iia3aqiKqZxw914ArOYaV0BQRyOY3YnP7rDuXZ6aw6CSaRr735fSLigKVzdRy3QBIY
 eOQws7vTqgCa3
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/input/keyboard/adp5588-keys.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/input/keyboard/adp5588-keys.c b/drivers/input/keyboard/adp5588-keys.c
index dc734974ce06..2b2aca08423a 100644
--- a/drivers/input/keyboard/adp5588-keys.c
+++ b/drivers/input/keyboard/adp5588-keys.c
@@ -232,8 +232,8 @@ static int adp5588_gpio_get_value(struct gpio_chip *chip, unsigned int off)
 	return !!(val & bit);
 }
 
-static void adp5588_gpio_set_value(struct gpio_chip *chip,
-				   unsigned int off, int val)
+static int adp5588_gpio_set_value(struct gpio_chip *chip, unsigned int off,
+				  int val)
 {
 	struct adp5588_kpad *kpad = gpiochip_get_data(chip);
 	unsigned int bank = ADP5588_BANK(kpad->gpiomap[off]);
@@ -246,7 +246,8 @@ static void adp5588_gpio_set_value(struct gpio_chip *chip,
 	else
 		kpad->dat_out[bank] &= ~bit;
 
-	adp5588_write(kpad->client, GPIO_DAT_OUT1 + bank, kpad->dat_out[bank]);
+	return adp5588_write(kpad->client, GPIO_DAT_OUT1 + bank,
+			     kpad->dat_out[bank]);
 }
 
 static int adp5588_gpio_set_config(struct gpio_chip *chip,  unsigned int off,
@@ -424,7 +425,7 @@ static int adp5588_gpio_add(struct adp5588_kpad *kpad)
 	kpad->gc.direction_input = adp5588_gpio_direction_input;
 	kpad->gc.direction_output = adp5588_gpio_direction_output;
 	kpad->gc.get = adp5588_gpio_get_value;
-	kpad->gc.set = adp5588_gpio_set_value;
+	kpad->gc.set_rv = adp5588_gpio_set_value;
 	kpad->gc.set_config = adp5588_gpio_set_config;
 	kpad->gc.can_sleep = 1;
 

-- 
2.45.2

