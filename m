Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A0224C686
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 12:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739275819; cv=none; b=FJJ6cu5svaB2OyO8OZBwE+KbBWmc3eIKcb8PLozASsVH/r8Y1jRrjocmzFgHcJNwOzUJi1QYKTswm8RSKTkrI9FB6Vr8SejGPJ5AsHUGM77samCCfir3nhqHBVqlI8m3L4yJBwkWF25pizSsuizanFQT5e/b1OYes3x8TIV3pf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739275819; c=relaxed/simple;
	bh=OvyGL2YeY7Q8iznU+X9mmrIKaFtAa6AYlttV774XVbg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Je1qIZKul7PtVr8q2VsFm6yabTldk6LnY09BbC+4FjUlwUXhmptaevw2QrS8rL5s/bbkxnJC8pTvEguIINMQ7puuJA3+p2BNchsvXU5piplVXAedZGLCZis1kRoJEX71BrX2dRlzbUoWTW9SszTwxJOYcBuY/3zqBkKd8RHO7JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=e1wVmPp3; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="e1wVmPp3"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-38dcae0d6dcso2355028f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 04:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739275815; x=1739880615; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oRq/T6GE9bSeX1D1Gt9SuyzuOUWanfcEXtTNwUHWu90=;
        b=e1wVmPp3Siv4FDFOFsvxliqAgDCA0u/iBke5kPGLo6o3Ee6WeBy8K8/YyNz3jeR587
         O0vbZKdrjezlbEq2CL+n4pkM1XMfsqhap/OMuP2rmXQ2CrjG+yaNVSHY2dSZna65hrJZ
         MQbr02Mhj271uj4fzx4Mz4JA2164cJVsgT5NoNa9VktR0NqWlVESPjn8EAzh/QnZK/+r
         CU6ZA7OvBbmn+rg3ZKAvi1G89BcTb+G+XyQXw1Glz5PDJdtZ9bb66iVrzsicEdTBaLeF
         2F7mNIcmYsnQMbk5eXoMm32lEK8dj7pDY5QKb5whPhoaIs2993bY64jvh+iUGzuo47ot
         2zjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739275815; x=1739880615;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oRq/T6GE9bSeX1D1Gt9SuyzuOUWanfcEXtTNwUHWu90=;
        b=agDq0v9WhpwbDTzQPSBhcUmJh/8RbaevQ7dLxZwXQdvVkKjm4mwdqXqQayvN47xtrA
         T4P4OCEQjil29dULxcW0uJlPzd9Q6SnlkMXmluvPBtP+RgLYscK8Ioa81t8dtsMQYPHa
         CXo2CMe9gm7d5q7wGDRulJlgmm8Ih4AICusvC2bLY1AVG/pBgpYdJSkq28/T7ovHXe9Y
         /3BGmMKl4iLvSN2wp95WvEwHEBHVoNLNoXkSY4j/dfH1IznuK2svpKS1tKRs5AYscj6H
         A0QnPfit52iOPY3evgNJ3bjHXY8O9BPrVW6N0fN6KKKrXkD6SO5ibKSJ2VCVWQA7G1jY
         Rl4A==
X-Forwarded-Encrypted: i=1; AJvYcCVS55DFtXPUu4HL0GtLPIbugPB9DtHylbSZEICXiI07u0AlY+Q1CbnOLyyZEF0E2SPmWeyI+LNNO5XPvsk=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe4k74ICTwcVzRSk+HadHrxv9DW1D0jq00tmZ62ZTzClXoV1nX
	B+K52YncauMao2mlRm2TqCs/UzC21NAZ0eH80OQVPjGtOLsAtJgSzm6q8reVFkM=
X-Gm-Gg: ASbGnctz3W6gB275rmyLCDf4m3iIaYMq7S1jAChWLPkjAwf0otSh8maO+zHxfDJUtF1
	DxkbW89VnSXdYtS9RpcDBMN4faQ5G3HQjmM7ezdAnMLPCVelOLvu6tkNDATrVyfpJg03P0rBAil
	TFImD0MtfKBgjcI/X6fWO0Mw+DNffgCuPi0BYPbKzVJVPplpdQtXa3bpMjgDeJM4/DSwFWIEoaf
	bWZc5zx2iUqRENoq+gyHI1VwHNdXzhMQ1yrnpH6S3huXk5bZRY/upFyQgY0dMi/HGPIyVdEO4EV
	wgSYJBg=
X-Google-Smtp-Source: AGHT+IHpk+5B6aVQLxsLSPqsY19+wTs9O8NCp4xKz9/p1TCNTCXaDWyHFV1DSI5SZkQBCHMGhHyv1g==
X-Received: by 2002:a05:6000:1448:b0:38b:da31:3e3e with SMTP id ffacd0b85a97d-38dc90ee504mr14083350f8f.28.1739275815512;
        Tue, 11 Feb 2025 04:10:15 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:561:8978:1d41:636a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd4342502sm9152327f8f.26.2025.02.11.04.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 04:10:15 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 11 Feb 2025 13:09:48 +0100
Subject: [PATCH 14/14] gpio: mvebu: use value returning setters
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-gpio-set-retval-v1-14-52d3d613d7d3@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1667;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=CxAelnjMdbcRuwV9O+C01TbuJn6vA1w0ry/4z1+OR0s=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnqz4Yj6qJLPO+UIt+NymYEMJOR8YxigCMSlVHs
 czl/relyCuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ6s+GAAKCRARpy6gFHHX
 csWaD/9mbJ5eKSLEyErL6bqsXcw8l4WAJV6ugzeHQolcyWwGuFbMEcsOmsgbW0weQReaWnpgHtC
 cKaWmRGoYTvghOaPshMV3QLhWJu6CHvTVNE/mYu+NOXoscZQ368Eeaal9X+7MkrD1rtnSs3Q4Y8
 9055WiVqsC+Ws98hWBUs3ydr5dDYMJ0U7JkwI3ky+QLfJlOs/OM44yTRDLU9cXIcujbu65DwiOK
 97wz8+lL3ie4/3bUF2f4Jb4x2SQN1KhCVjEbufOxg9GvfA94Wb+nkni7BDf+UMGqH5uSHcJeD4z
 qJa/Vhhr/jWV/RdgNptcufaav6wK3yZYhPlnZNghO7Bo7mHQSv/PvObxEEPgBoX+QFLn7mzf9V/
 u+TIUwYAcAYmuvaQ5VyY6i1GtmgA/xw1pXnz4El933Jh3WPi+thZmNNKE1zzUaNwUn/6wtsPb+G
 Ebv84adCqb1tx9BsdBwfeUHELnt/KYeFGyba86EGdtsP1AnamQ74ZhHQWaA9EMyYXh0diVzGMfx
 H8T7ymolklssV+IrhKSvWqhruc03x0KUlU4rrGlUWm1SncP7i/qEs2EKQJS7SHC298CV2HfAqZz
 qh5cWxccz8FiDS3Qfn0TbjyD42EXMtJNoaGauxiWM5QQfKz0DJe53sDxCDrl392pYcyGV6LtRMj
 iSI93SL42UVXOTg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has additional variants of the set(_multiple)
driver callbacks that return an integer to indicate success or failure.
Convert the driver to using them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-mvebu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index 363bad286c32..3604abcb6fec 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -298,12 +298,12 @@ static unsigned int mvebu_pwmreg_blink_off_duration(struct mvebu_pwm *mvpwm)
 /*
  * Functions implementing the gpio_chip methods
  */
-static void mvebu_gpio_set(struct gpio_chip *chip, unsigned int pin, int value)
+static int mvebu_gpio_set(struct gpio_chip *chip, unsigned int pin, int value)
 {
 	struct mvebu_gpio_chip *mvchip = gpiochip_get_data(chip);
 
-	regmap_update_bits(mvchip->regs, GPIO_OUT_OFF + mvchip->offset,
-			   BIT(pin), value ? BIT(pin) : 0);
+	return regmap_update_bits(mvchip->regs, GPIO_OUT_OFF + mvchip->offset,
+				  BIT(pin), value ? BIT(pin) : 0);
 }
 
 static int mvebu_gpio_get(struct gpio_chip *chip, unsigned int pin)
@@ -1173,7 +1173,7 @@ static int mvebu_gpio_probe(struct platform_device *pdev)
 	mvchip->chip.direction_input = mvebu_gpio_direction_input;
 	mvchip->chip.get = mvebu_gpio_get;
 	mvchip->chip.direction_output = mvebu_gpio_direction_output;
-	mvchip->chip.set = mvebu_gpio_set;
+	mvchip->chip.set_rv = mvebu_gpio_set;
 	if (have_irqs)
 		mvchip->chip.to_irq = mvebu_gpio_to_irq;
 	mvchip->chip.base = id * MVEBU_MAX_GPIO_PER_BANK;

-- 
2.45.2

