Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86CF22578F
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010003; cv=none; b=bChySF7hF0uzgckAJcCcKVqawXtUsAXOslgRPgGivWPdKf5XMVkfitlP44yt9f6YCAH8DE/BaCiAXDDnTje4DUn0r42Q9e40XPqTR6TVNRbndEuJaEwlNGr3o0Q84jOvXzAIoE5jzXHoDoQxjDx0WrEnPtl3F1kxaD/9HvO4ZW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010003; c=relaxed/simple;
	bh=RkgKWhSsIhzUGPNoN0mdX6+aMhttLmif45hukjZbTak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fGV6alj6igkoL35MfokhxmP4NeltAcBVG4ZOHKwke4eOmpRWNR4usQEf5okUR2ovfOsVhwMCeZRipFDUfaIHClun7itifrWpxlIRjnxB6da4GE7p9v9tzqfYW8g5PTaTvKUIwEh+YxHke6eHJ0skp6E40jdLCT8k+P+Ac4YR7K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Y0eV9Ely; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Y0eV9Ely"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso36746745e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 00:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744009999; x=1744614799; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Wepzn0bSrTUctNYJZv2tNgjnTLDxfYJ7sTLL6ztZhk=;
        b=Y0eV9ElyEWsNC26ae+aWsk+VQJUCR6i86K83WsCONwlnsgv7DIsfam+//8fTcmI5xm
         kayKIr4Z448ikiJViaCUQ9OhJG9ckTJmXPvK6oymZfBtIrVVrJQETybdmQ8rkKk1P4o/
         d9MEy4E4j3MBvjsOCmr4FNDASS+WdYfdZWEa+nW6oIRswgHARbfY1t+1b7SkHU9xO3Vk
         9x2Q8Nr5XUqUOJoU5fYK9tkdfGV/K1gPeiG5hKCRZiV6e2A3bJ9vMs4USVjYu0gLVdz9
         lbF9bu2/PheH747IeMkWmSeIiUocxDJ/itcn49n0jTHtIcwtucImmQViNdhJTV9LZQ72
         cqVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744009999; x=1744614799;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Wepzn0bSrTUctNYJZv2tNgjnTLDxfYJ7sTLL6ztZhk=;
        b=l2u6x59E+c0UjebZ7hi44nFSgOsXXaGYFwLEiUs8FUFyUTIxpU0fIYgWDSRHhrr2xQ
         tasP5l439asPg7LK3uGtAZu2sLa1erhD3YlY9h3a3xRCAgGYw7fUleCh2nLcHV6Gzdlq
         ZnfV7CNUR9c1zXfEfZgUyJbJojDc9DkVyAv/GU1VZgpyZTRzs3rgHLK4wKLHcaMwenLg
         UoXE2X79FIpzetkewRx519wqYZ+JIRCz82PrNpVGof3kNGfv6qVcGffii0o2Na5rKlu5
         x3NFzyQp4mSAJM1SHOojG01hQD5SanGw+AALssAiJJhhSrg4BR3bxtFbbFCJJP37Gdig
         MAmA==
X-Forwarded-Encrypted: i=1; AJvYcCUXCF5qDfILUbpi0Fx6fffG2L6Y6BI7VPuEQKcAefSGdmshRKNuaPiSj1X2Tp9zuXQ437wYzg/8Wclbvd8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgESzRYJ7/Z85uITzn2AXSb2flihip8ymCTDwiIIR1VuG/bvg4
	wkvR2ZFm/4SPjwu7Hm7mxWqoDR0VmdvDDJYQyCN21AUlqOUIiTLd7zFDDzZcK5g=
X-Gm-Gg: ASbGnctdvdSltG4gOeSqwb7IeLsCirfEkiqIYyhkwoAzYDa8nWJ5Siv3xiKLneQaOw0
	9ngpCailVEGihWckv+16RnJunxhJf8vHQ1tvD8T7n+kAODRSkTRPE04XGB1P/LRjtrC/QVdBUOL
	kK/pX93OJIr2y9UGUS9EQ35zQoDwlMmjUrnFrutrZQMK1atXpoEo3DNZhpyd204SvoeKF7cYLHo
	fD4d2WdwL8OZkzek8j5ZAzjmqmZqzQUACdj60OymD3ThneWUa2H91LJGXjlPDJAFNCQ34zilbOy
	qqUZmtpi4EPO+IT5s/mA3pv4JKY9Jwb7ebmGKw==
X-Google-Smtp-Source: AGHT+IGyhcE/IuZZs8QulBbS6kDGMJgDPUGZRwi3YwBtd/IiuYNtNzwObPJBI62CcG4AJbpP58tp4w==
X-Received: by 2002:a05:600c:45cc:b0:43d:fa59:be39 with SMTP id 5b1f17b1804b1-43ecfa19d6bmr74493645e9.33.1744009999121;
        Mon, 07 Apr 2025 00:13:19 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ea97895e1sm145267115e9.1.2025.04.07.00.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:13:18 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:13:13 +0200
Subject: [PATCH 04/12] gpio: exar: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiochip-set-rv-gpio-part1-v1-4-78399683ca38@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2554;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=VBaLRwvXCHSMDlXyQDnnPc+JoISPQ5RIJj1Yyuoo2Rs=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83sIsJh5mSBLL9JNqgm94zsMHoeoOktkEKaU7
 V2KAnuiH7+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N7CAAKCRARpy6gFHHX
 cvaXD/4ub9soMp+EVeLGnbmKaoZNeP/e4NlLxD38WiXqNsu67ARWHZfjRxY2BrkgMXVjQc73eMA
 0oie2U/HcF3/c12LooTmi5brOGQ+fCEyeJQ6VrhV1iPTeUIngkxnqEFSwhjaR3uOZXuBTagR9FE
 sWH2G2b2tA2dSDIRvZFAq8oagJNspszfKhWNs2a5Y0IUWweZ44MEWAr+vOs+Bglee4oSqzhF4gw
 L+dzjx1n0A9OV6yCTGJKkT+KE3pMTDPO5iA23NEtZJVkSt6Y8KFr+si/0Xef/BklhQactoHIOIl
 poLVGDC8YF/35IwvA8WO4TMKQYfIsf5a+yDotBKUHM+cNhf1CvFwFwW0RxBXnawszz/c2nGNTfW
 ObCZVfJqTLx3OqhlodGwV0RH7nMxqiQddS6k409LOqWQn0NvQ/n2tjISXlVffHCtiKNemayf6aQ
 aO0x7xQ4PKifW/1pqzo2Qz1c4IrjV0TeZfb6InVjbuDE/r8mJ1QA3F56CGcRkioDtuJwlWMm59K
 wrw7CeV2oxut2HnUIKiw7T1P8EBT/ZgvZOKNtvgZn1EBxdO4bhEmqY8O7kISkmlxTUET+x+nR66
 Z5Erx5zbPnm6l0wBxcpkSjm635yxE+x8qQWpANIRNYqE6xIA0SSfJ+TdfOpqZqiCibCnpkcqXqD
 LGUtduA/iEYlDSw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-exar.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-exar.c b/drivers/gpio/gpio-exar.c
index d5909a4f0433..beb98286d13e 100644
--- a/drivers/gpio/gpio-exar.c
+++ b/drivers/gpio/gpio-exar.c
@@ -93,8 +93,8 @@ static int exar_get_value(struct gpio_chip *chip, unsigned int offset)
 	return !!(regmap_test_bits(exar_gpio->regmap, addr, BIT(bit)));
 }
 
-static void exar_set_value(struct gpio_chip *chip, unsigned int offset,
-			   int value)
+static int exar_set_value(struct gpio_chip *chip, unsigned int offset,
+			  int value)
 {
 	struct exar_gpio_chip *exar_gpio = gpiochip_get_data(chip);
 	unsigned int addr = exar_offset_to_lvl_addr(exar_gpio, offset);
@@ -105,7 +105,7 @@ static void exar_set_value(struct gpio_chip *chip, unsigned int offset,
 	 * regmap_write_bits() forces value to be written when an external
 	 * pull up/down might otherwise indicate value was already set.
 	 */
-	regmap_write_bits(exar_gpio->regmap, addr, BIT(bit), bit_value);
+	return regmap_write_bits(exar_gpio->regmap, addr, BIT(bit), bit_value);
 }
 
 static int exar_direction_output(struct gpio_chip *chip, unsigned int offset,
@@ -114,11 +114,13 @@ static int exar_direction_output(struct gpio_chip *chip, unsigned int offset,
 	struct exar_gpio_chip *exar_gpio = gpiochip_get_data(chip);
 	unsigned int addr = exar_offset_to_sel_addr(exar_gpio, offset);
 	unsigned int bit = exar_offset_to_bit(exar_gpio, offset);
+	int ret;
 
-	exar_set_value(chip, offset, value);
-	regmap_clear_bits(exar_gpio->regmap, addr, BIT(bit));
+	ret = exar_set_value(chip, offset, value);
+	if (ret)
+		return ret;
 
-	return 0;
+	return regmap_clear_bits(exar_gpio->regmap, addr, BIT(bit));
 }
 
 static int exar_direction_input(struct gpio_chip *chip, unsigned int offset)
@@ -209,7 +211,7 @@ static int gpio_exar_probe(struct platform_device *pdev)
 	exar_gpio->gpio_chip.direction_input = exar_direction_input;
 	exar_gpio->gpio_chip.get_direction = exar_get_direction;
 	exar_gpio->gpio_chip.get = exar_get_value;
-	exar_gpio->gpio_chip.set = exar_set_value;
+	exar_gpio->gpio_chip.set_rv = exar_set_value;
 	exar_gpio->gpio_chip.base = -1;
 	exar_gpio->gpio_chip.ngpio = ngpios;
 	exar_gpio->index = index;

-- 
2.45.2

