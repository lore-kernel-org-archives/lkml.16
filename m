Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE2F226CE4
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010300; cv=none; b=V9W6Pq7GOB3nFuVCdTcMrGtxM+rZPCXMxH+qPlCkhqJzuMh+iUR4OdDVQuiuKlCSZflyhIMcK9rmwl3tfimRBqjVAFIBfiv7XkbhVAwhAL2PaXxx3ml5SZQKhOZMXkI6yUOyQ6EsKLNaWmE9LtnpI4H8FPSpHem8smvhhZH3WPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010300; c=relaxed/simple;
	bh=yKb2tGGtXxCNUOTqiL21FaJ7Q/pQ18+z3JJG5rRWGF4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u6q2/3BkMNYCMKWvyy1iB1FEA0atr4uVyIPJh6fmaXCcwo7OJqFAZU4SORsHOobRH0eM0NlmnNXSoBVdjKFVtn7J2+6pGWYhVrVjcZjnuOIfOCilri44On1v88YTC4A4H8u5xFcANt6JNa3wfNv8iep23Av5cQHNzRE/i0HeZh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=s1j3iBDL; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="s1j3iBDL"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso36784745e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 00:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744010296; x=1744615096; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0zr9dH4mVj2rqDEhAd/rOCSxsNFKMREWDyIjOpr8UMM=;
        b=s1j3iBDLJ5a+l0jI1YchpfZOUKYmv1qZHDecXgv2yFM/9wwtBegWvzckNhoPcMiHPP
         H54FWCc4eeXivo+p1Sl9wdbJyoSc4ego5LtAHa0CgsKbXXpYdBGBYjwolo6Sw/9bR5SG
         uaL66SCa/+EYvDQvVApuw4FgyRPO7K4C5y9pAKPHfgQ/xHsZ3y6gBNaBodnI661iepST
         dSfm9w45ZrsM0oMLcEvGIH5KGyPKtHnJPJkhdd+YiPofksF3XY2pUVOHMYzvZkVrA+ZA
         JMW/mZkTDPYb5BL7MXgnPa7wtk/Am6PV5wz+TP0TnTzTkZ8mM3IxumG3VbH09xBNKUaN
         pQZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010296; x=1744615096;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0zr9dH4mVj2rqDEhAd/rOCSxsNFKMREWDyIjOpr8UMM=;
        b=egVYb64w8g/24x3rZ1Z0BrVNlFx8ZULmAfhJmT0qkewtjy2G1Vd8cSJGnpKp6q/AQp
         lUYBebtFlc9VdXbtEBWYenPYw7dTsF/1k3AwaQBPX7p1DnQ63Eh51hA9CkjF3BKv1quJ
         DwulcD86IozJ+QEVDWd1zFn1VrJHMPVB4g4GaKiSph27II6RKkaQFGKYuIOtVEXD7pUv
         09jSNTEB23JtpSChXBWmHGC+TNAXf6e8YkC6bG9/rMpPPRwc+Z5vS6fQ7aoLsbzN4r/L
         5JWN0ejRfiZNeKy7sLVSXc3yGrqY2K+V2cnA2walLB9CcPThIy9/yQ3B30seXQqfizYU
         Gmtg==
X-Forwarded-Encrypted: i=1; AJvYcCW6GILJ12D2cvDw3ILcsdk/RxcpUgqfiH0dRCVTueZLoXhlhTmCxDPOBk6lhtMmRFZmlKDmi1D93qx28MA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmkgKUFv9w05/uHpQvFlxs8AbqYYyv6j12FWYJeuG/C1KdAWG9
	alhpDAMU0od5weUGopRvggvwQa5sjuY0hr6ZSJIZKvB7zjHTy8uyvc4WFml9Z2M=
X-Gm-Gg: ASbGncusOLeco+8mEzmGv/+sL0WUJKB/7HHPQc86XtmVSXtCMJf0CmfJ5q9+FUkQrGG
	Oa5SA9iGbzJ0MGrfmPFtu14h8I2ki4zT+J1tCcRT9GfvH9SmIwzPY0BbhUgvPnnq6bShnYwlulr
	SNKh7zcedFh7tiB9HVG1c7wdx5XpLRM8J8nwtIOys9k/DftI6OgepjJgq5CjzbiIuHalSzR2uSi
	geMILgCMlRYCWs4/4H+gseg4/eadn6A0FJ1Q8fdQszEObQOG3I4eTQUWyzuerBX8CfcAR7GOQ1K
	upSz2jM198B0pMRhzW+23rS88QCTvALWRylaCg==
X-Google-Smtp-Source: AGHT+IH/9uwnlRnmaoIBikMBaRB3L0kc3rHBg2XlSEvKBxasD0/FPM+b/UEUjfpSWzqebi/oRdsMRQ==
X-Received: by 2002:a05:600c:1d91:b0:439:9424:1b70 with SMTP id 5b1f17b1804b1-43ecfa18d8fmr136443605e9.30.1744010296161;
        Mon, 07 Apr 2025 00:18:16 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1630f21sm125224455e9.8.2025.04.07.00.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:18:15 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:18:11 +0200
Subject: [PATCH 3/7] iio: dac: ad5592r: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiochip-set-rv-iio-v1-3-8431b003a145@linaro.org>
References: <20250407-gpiochip-set-rv-iio-v1-0-8431b003a145@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-iio-v1-0-8431b003a145@linaro.org>
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1728;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=fvRt+EK60paf1O61oPqPBqlLRQ5+ti2f8yEUANnZO/o=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83wze9ad+rXzcETMNxt0XZzZFqaeVLzfPfel6
 h4IbhEu6pyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N8MwAKCRARpy6gFHHX
 csMuD/9+px1e8RHxtlxU8UJjN1DhM5X64s7PbCqXanGef6mcVLK/TXyjyM8wUQ9EaLRC9JO+o5U
 biY0C7MiIf+JGLHulKVJfwLs5UTVeciarYmOJTUIEueUJVkOpmbABbaEBifCNqJtBm5rPnf/+9h
 E+0UfBZCnyusN+wxVG/Bim0jIurBS88YT4rTd7m0hCjvWJcU45PPGM+xEYT46pxGrrSmgGoF/09
 4j1vhpjvw3D6NECJyv3D+LTqKXDlcCn3PvFjGThs7r8J/LkYdoSzN21b73UjQvYATT/HlYTOq9f
 Y1u/hmcx+KBqjBCoeHckFu7FO5vTVlSOcOgAIgXUsR6nJre6rr6/YAyDIAwzYsPfqwcb+XPZpG3
 efJjdVb5JTzFCV66OVMUDYdu6j7DVikSdl57dHId7zBso7wS2fp2PKD5w/h5eoM7RwogoRMzJLp
 tq2H9+YnttGOYtYf0O/Dm0d3XDlHarB97/kD4bmQnpEo98zmUjhlCVnutl/gkdrbAkaFdly3MSP
 zOnMKJ6mZG82/ezqINko1TiIvs5EWLGddTY1nqZf/6uyy4M6OQCbURa/oNGqAFXVfXUohuXOj7N
 Xo1sXJTxRuHA98KCv2/QWHw//o+5wKeKK/82LzgZAeTi7oJKdwU2tMt3gS7BBh7HKrrgEqCy1JM
 uLwC+SKNvaBpvCw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/iio/dac/ad5592r-base.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/dac/ad5592r-base.c b/drivers/iio/dac/ad5592r-base.c
index bbe3b52c6a12..ad650dcd73a0 100644
--- a/drivers/iio/dac/ad5592r-base.c
+++ b/drivers/iio/dac/ad5592r-base.c
@@ -40,7 +40,8 @@ static int ad5592r_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return !!(val & BIT(offset));
 }
 
-static void ad5592r_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int ad5592r_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			    int value)
 {
 	struct ad5592r_state *st = gpiochip_get_data(chip);
 
@@ -51,7 +52,7 @@ static void ad5592r_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 	else
 		st->gpio_val &= ~BIT(offset);
 
-	st->ops->reg_write(st, AD5592R_REG_GPIO_SET, st->gpio_val);
+	return st->ops->reg_write(st, AD5592R_REG_GPIO_SET, st->gpio_val);
 }
 
 static int ad5592r_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
@@ -128,7 +129,7 @@ static int ad5592r_gpio_init(struct ad5592r_state *st)
 	st->gpiochip.direction_input = ad5592r_gpio_direction_input;
 	st->gpiochip.direction_output = ad5592r_gpio_direction_output;
 	st->gpiochip.get = ad5592r_gpio_get;
-	st->gpiochip.set = ad5592r_gpio_set;
+	st->gpiochip.set_rv = ad5592r_gpio_set;
 	st->gpiochip.request = ad5592r_gpio_request;
 	st->gpiochip.owner = THIS_MODULE;
 	st->gpiochip.names = ad5592r_gpio_names;

-- 
2.45.2

