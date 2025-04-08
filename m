Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D507263C7D
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 07:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744097518; cv=none; b=sGmlWT4u4m+Qx9gmr/y3Zl3OtJIwque++OpvI4CRUSwtiwjgjXen/tjzunBUz5QxcQ6ay4wury66f3xGoW3v0Gt/7rNwgunU8a0GeAr0dZyU4kHV/EEkrQEvSqpQt4xzSA98qxuYb3y9XWnwcQ5pxixju5vejlErSygAQALQmxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744097518; c=relaxed/simple;
	bh=FUbTRighwa5eieYU38YRchMwR46Y0TXpyhzds2/dP/I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gwoSF4pEzqCCUDEaJKJoRuHB2uTpvPWz5roT+hBUChWGV736AVtcs4jFMzH8CUjPRz9U70KkAPxpTBgTHe2KKfUKhmJXBY/bPE43gL1KoiDsEySNMn92dugutVsOR2to4bYsacbnxi372codC21AqGGR1gK703b9xRXFwx22GU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=WHuEO0vi; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="WHuEO0vi"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so26533275e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 00:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744097513; x=1744702313; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6BtbHqsMhUos67G6Oxw8ZXZLpL8UlKP9+lIMwAqXx4A=;
        b=WHuEO0vi43eHm/RWEOpLb35RowTgAKYK3Tp96gi+aLgsPb4fbfwqwyTZHk5oucC5yf
         jdNWsShbw4eX75qhK6pK6vG6Sc7J9/Dmsg2Law+jFt0tZGpLACmKWzXcLdQD4x745q9Y
         gefZOiJE196ljyJQoyk8fJUl+NDkQFApYHl7rpVwjZHcfw9+KJehe3YYW1xFk1PM8n0z
         1LQM3gHDZX0E4Rjo06D7pLQ5mLTwhUrBMQXfI5MQR/WIYtt9SIEkjRBUoBxjE5+tzQjR
         Oj5b3eJEG7tu/+VF79zN4Qhm7C3UauwJxNqoN4WIi7EFtCpAwKx95EqcH2gg3TmO859A
         zUlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744097513; x=1744702313;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6BtbHqsMhUos67G6Oxw8ZXZLpL8UlKP9+lIMwAqXx4A=;
        b=lz+OrPwatLwM7FG28+oNzhf/m4s+San6Revm3j5vplhC/j/VZ0UAMEtJ00/je+cMGO
         psoVC83Tfg5LGna2YgVL45s9XKqTU+YeefFoju4tzs6BXJgboTi46JJ2A6SJTWYjuJUx
         Fyc0kUdesME0XoXQ/+Mpq/kig19XDRHt156td/ev2sjwlsxHANv4+aVozKS1fxFm3bI2
         GSNZGRU3XLGj8ESZN6Kpp7dnQJdUTTsauyty+fJepBP0ZWT01hG8oK6nPqbZBnXzisjz
         lSVV9IR6OJCKCCcFtx4HEtE1KksosB+oKRCo/V/7a6lkAjpa8yQIwXh55UWcARdsegun
         PpYA==
X-Forwarded-Encrypted: i=1; AJvYcCUBDoJ8Eia4bAUQbhL20sRfgKzMr61aOPNdQANT2MCR3EbIBP88Ob+FrAQ7N2qbjjiS3atQWe/uWl0Nsuk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHy1phrZ5jh+9kKdmROKaaaShcQQYRdRsnpC1ypxi/kUHV6B8Z
	M1cSpKOhK3bv09CJ/igoJXWbypT7j5vlSJNCGBdVI9MWT6I1mfsKeA9VnpXIyGVTgozs2Xkb9Tu
	8GE0=
X-Gm-Gg: ASbGncsNecCAM7MKkn9U9lcegXHazD+XratAkSuR0DRODyXhVekiHSMnGS/zLiAfgAP
	cioSt6R18js6L6bne/7GkDWE+KJcoeDuOsOwmiybW1Jc4ACQdHV731RTiFnMA1/HY8cDpm17Kml
	Pc18s5xFshgtq1QfWxt+OEYr2I2S8bHhdnft/ed597+3lVJn3aWnHxv2Hq4IrQuz4JD4eQ4dHfO
	nq3trCT/bmsS5uAWdGEKaNddht9Q2OD6ijNQmLWGpH2cleQDwrO9Vh4po5A2T6Bd7cuAurmiruc
	07cXbNIvl6oGBFuAoOQB2Q4Xwb6PKxncVANNdA==
X-Google-Smtp-Source: AGHT+IE+Xxom6NOhosQq0m8djhtf9SwUOVEwposQh1srQRR6dan0KmkkmgYrxGpxn0xF2WRjmrUqSw==
X-Received: by 2002:a05:600c:b8c:b0:43d:4e9:27ff with SMTP id 5b1f17b1804b1-43f09261197mr36027095e9.7.1744097512693;
        Tue, 08 Apr 2025 00:31:52 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30226be7sm13846370f8f.89.2025.04.08.00.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:31:51 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:31:46 +0200
Subject: [PATCH] pwm: pca9685: use new GPIO line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpiochip-set-rv-pwm-v1-1-61e5c3358a74@linaro.org>
X-B4-Tracking: v=1; b=H4sIAOHQ9GcC/x3MQQ5AMBBA0avIrE1SRaWuIha005oFmlaQiLtrL
 N/i/wcSRaYEffFApJMT71tGVRZglmnzhGyzQQrZiloq9IF3s3DARAfGE8O1ItWzbrTtpFYOchk
 iOb7/6zC+7wei4oJAZQAAAA==
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1992;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=1U8Gmj+3lvIlR8YGdhnk51HbgumUU7NfSqTqb+zvZ/o=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9NDjW+d7FBwyeFzKIyJR2a6Z8Gc6Y60t0jDGZ
 /WgrTFfIxuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TQ4wAKCRARpy6gFHHX
 ckkPD/9y497qWEAtRXgBzMVqqT3uDVMKf3CMYude1aFE44ClsHYEYEWcRLXgzvOOOM4KyzStQFy
 HanKEHM+uSdXPs82ipC0Kiz+f4HXP1KuMdpNNIvYufMU2RzE7U2w/wCAQ+b/x4QCFfHo0rvYroI
 XwrbdJAmIx2+DmAvS0JRrejn4yaOAE2zUsW47/tNotpwAJhhh/vJ5md4D+AbAaJ0fPiQLMqmFVq
 rtDJf5sE4/BffloxGLmOpMHNqfv97a89Cy6cy1TMlEfo67QAK2Qx/cqmD/LwFSGXgBSLvPh9T+T
 KN1ZnVup0UTT46XsOAdaGvbqA8pg4ddFedXOmLNt2q1UmspB8G2rt4IQ3cyuUugiOGWkAHYYWgc
 4zvfeso1bKKV2HpXd1NIgf0wMyir7k26qXJuKicJiKWY88hSP7uFLeBSvuTA+nrmraemlDVgGzx
 X/1Izx0qBxGZT5HzW9zKz0SpwXic2BQQ5nvaICnOG2Gpzd7Rcw4e2fJIrvFqXuCkz70GZ1G5LRS
 8zes4tYb2/Jx7HwbBRq0DW4nA1IYd7ywvXx0rUgl9ZOkSPjSqyNnKP6/g5TPDFjPE22MOpNGlrL
 9C15eNYBk8V8e0ToggORnHjL3a1tXnMlYir//YSSuvdcPBBec5iYZfWvlRvmtdIoTNCs77b73Zk
 JCb6zElp8Q2puhQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
values") added new line setter callbacks to struct gpio_chip. They allow
to indicate failures to callers. We're in the process of converting all
GPIO controllers to using them before removing the old ones.
---
 drivers/pwm/pwm-pca9685.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-pca9685.c b/drivers/pwm/pwm-pca9685.c
index 5162f3991644..eb03ccd5b688 100644
--- a/drivers/pwm/pwm-pca9685.c
+++ b/drivers/pwm/pwm-pca9685.c
@@ -263,12 +263,14 @@ static int pca9685_pwm_gpio_get(struct gpio_chip *gpio, unsigned int offset)
 	return pca9685_pwm_get_duty(chip, offset) != 0;
 }
 
-static void pca9685_pwm_gpio_set(struct gpio_chip *gpio, unsigned int offset,
-				 int value)
+static int pca9685_pwm_gpio_set(struct gpio_chip *gpio, unsigned int offset,
+				int value)
 {
 	struct pwm_chip *chip = gpiochip_get_data(gpio);
 
 	pca9685_pwm_set_duty(chip, offset, value ? PCA9685_COUNTER_RANGE : 0);
+
+	return 0;
 }
 
 static void pca9685_pwm_gpio_free(struct gpio_chip *gpio, unsigned int offset)
@@ -321,7 +323,7 @@ static int pca9685_pwm_gpio_probe(struct pwm_chip *chip)
 	pca->gpio.direction_input = pca9685_pwm_gpio_direction_input;
 	pca->gpio.direction_output = pca9685_pwm_gpio_direction_output;
 	pca->gpio.get = pca9685_pwm_gpio_get;
-	pca->gpio.set = pca9685_pwm_gpio_set;
+	pca->gpio.set_rv = pca9685_pwm_gpio_set;
 	pca->gpio.base = -1;
 	pca->gpio.ngpio = PCA9685_MAXCHAN;
 	pca->gpio.can_sleep = true;

---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250326-gpiochip-set-rv-pwm-e3b949d7296f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

