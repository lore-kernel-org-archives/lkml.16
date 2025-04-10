Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43BA725E823
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 09:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744277708; cv=none; b=R3N1Kv327RLUElgjPJvmUNYlMvYluxmSKktebmtmd3mcmuv5iRH1cx+CbLVAqfIeulLq2wNJr+dPzLJoF6iADpwEn+Gx2jvHgljESczXI5JtbGQJ12pQxiXc2ti5jhhoFVi5R1QcMbd6TpFm82JXOTDKVaIhwX5eWCWqC+c5WOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744277708; c=relaxed/simple;
	bh=pZm8XfpBohQqucxLsOo63q2iDqswy0IMvoIBqy7sFfI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ERRYT2KNKuNQqWs5iS6oxvKBLQdK3FgfhWzz5qcwvX59QsKC5MX216fhM3nO07A4jXK5BlJScsKWLUCHuAT75jwg1mS09GEX34bp284kdIV92F6f6AKsxeqEZLM1KoC/LCdn2C/6tjbOUSKtcunuz8z9x7F3vrcEcnS9/1ElUj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ZGzcC0pG; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ZGzcC0pG"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so3869585e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 02:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744277704; x=1744882504; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x6/qCzJfkhK1AyRDQMfBlEcsjj/vCOHFZrU5RVmRNZI=;
        b=ZGzcC0pGXCcGhpX2vXncRB8NjGaJgRmkzLDxTzvWJgXufanucu9XypftVAc4WhOXdT
         TDKy92KWYwItDIrLlxFmYoT+PL7+vUwgsHYpvSgoZa4m1CgB+7L5uABS/C033kPOwbJK
         /itgQke6BK46kMkEE5v7OGrXpchEjsDjSOj62d1jZW4sJ2teLpNm4EPkQStran5maB8g
         3o4ri/c8D1DuHpJKrxdV4D1o/5HkASnyrSaVrZBo9mtGd5wptN8Cp3FO/zHhLM3Wqq28
         sjxOWaE1aVQZwja/Codpwx5MPh7jx2jMd6x2gKNEChJLm472eYvkdlFN4si/RmSR+qVw
         R29w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744277704; x=1744882504;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x6/qCzJfkhK1AyRDQMfBlEcsjj/vCOHFZrU5RVmRNZI=;
        b=iWMfK9tQD7NFgxAVr9HzW4LFIhyArZsjpDj4wAzKVIOUSYUZdl3sFnaHzJ3ZePZcGL
         FgUvElCuwpFpIiBZ3EJwUbV32S0qnDgFWdtFmXs5j+SaHuiSczmYpsv3AKp6CEGZ9gOP
         jPJWfQMpr0LfE8KyI2so9J6ULVbYl681wSv92eqOoz3CAgTR0Fh/+F4RdWYnCaSVP0vt
         crgADxFtkcG67/wTJ/3EL+fOGQV1mgiBfldryLKP7hJkMXL9tT265oK/lRl1z/ojivhZ
         crWtYwO9K8p/OD79LvBfW1aRePV6CJ7uUnNbDa4HpJuH7LQRG3S+huniyXoz1JGUs5ib
         TNyw==
X-Forwarded-Encrypted: i=1; AJvYcCWHzCWwpBf63q92OZvPllknUWd5fC0W3vC8xzpE7hp1OeS69iM1nkeWTKayUCNnDXypUiBZo7dUMlEY1Sg=@vger.kernel.org
X-Gm-Message-State: AOJu0YziqBBSeHfnCICMRYVc+CU76zRZn6xVA7d5/GH6IzeiuogMWQOz
	+pQ6ruHTMiWbuEKieBuqTIjfwI71V/QKMcs+N/XF4nWd8HIHVbtuFWcFkQjGCS0=
X-Gm-Gg: ASbGncuuzUK33vha7wNCR2vGZjhyZ/rIOu0HMtpjgBYqErEvl2ShaCmYkPmrw5sYpHn
	6w7ZoO8JLfOZog/hKNY55a0mDcdpYMGxXsy+1kc+kjYwEORbnmxQCrc2ysguOujuyTKE+qEGDbb
	LvhILBksmXWHzC+GO9YI8ppW95dAaC6tG7+HIXNkgNuAq6SUnwvJuka9fIeP4+CglP73Y43Mi/h
	Iwckp5VAIRV+bheoSRU3pC+6ZhsWOgcOTfMX8wOY1dsEO6cOK0Z69HLcC0sjQCeN8DudrrST3qt
	iTHRN2U4Yrv96c9DOSx6yxetI5WnyS98Og==
X-Google-Smtp-Source: AGHT+IEKy+AKjEgaOW59U2J7LBEe92Qmbz4NdALMApP6IVJjySswECPtBU9vc6YfLAn5Hd8BsecWmA==
X-Received: by 2002:a05:600c:1c02:b0:439:8878:5029 with SMTP id 5b1f17b1804b1-43f2efe1e29mr13000485e9.2.1744277704324;
        Thu, 10 Apr 2025 02:35:04 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:7c4f:f9d1:94e0:53f8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f206264a1sm49698435e9.9.2025.04.10.02.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 02:35:03 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 10 Apr 2025 11:34:45 +0200
Subject: [PATCH 3/6] pinctrl: qcom: spmi-gpio: use new GPIO line value
 setter callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-gpiochip-set-rv-pinctrl-qcom-v1-3-6a6891338aae@linaro.org>
References: <20250410-gpiochip-set-rv-pinctrl-qcom-v1-0-6a6891338aae@linaro.org>
In-Reply-To: <20250410-gpiochip-set-rv-pinctrl-qcom-v1-0-6a6891338aae@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1576;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=U1FUBgmKuTLMmd16tW+SzFaBbmdCVgvjNRZj2H52KGA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn95DEmkUSYXcqzH9VWXANzroVJ/djI8M0ETQLm
 XX64LWyZmKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/eQxAAKCRARpy6gFHHX
 ch2dEACtKGJIwqQln8m3ZPUdXTkvHFJSITR1itgfYhv/wPO644hYyQIU7bV+rEhoHlUJ/G8DAMT
 Qn8bJs5TEDZhn3RcTuf+ELMsUFjGOqQnHwwnTjxSV4jxi0AG3SILi/LS96YpuuNB1spcJTlfQi6
 l9lswrXXpQY0dSUecHvIEkHBEp54UcI+mHVEZywO9Fa9NaM1fpEaIuVkYjef0dk9LfkZxrAzRgk
 Xyx3GAFy02eCRHjYxOlLik9L5V2KG4k1zSAhuhR817CJCYV/uHhqkydL2irzg41/ag4rJjSAb3D
 aiJtwnjGv9xWzB9RqeIT2vRa2F2R6LPNePeRz01n/EXQ6dxES1JtLE3KGYo2lOEXtD5UZt0lk+V
 LTjxZl48C+3Ie40sxXTZo5CbMY1doMcXxWBYtOnoeQuP85RSvP34TNfc+rbUKLqdfMP3JN+Snyh
 OeM8Bdb8biR9GmSKpaJ2GGiLJognEUoaSH0Qjm1Q5YtuCSX0Pd8Mz1ip2wtDrPL2XRnOFjYtll7
 VxGPrPMrVklbQLhPNPIp5kWFm9smuIrkW0KfP8BFFKkW88HQ8ShBHdruPnAo/I/jgi+pEo9qmIK
 ABnJtYQSTBP7MX/ITIDQ6IfYy3VQBdNSwPGYLFwD5mwT7kjTusmA2Z0XPuEdeOxlWBUDvPieYju
 dOcNHL3diHVBwUQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index c8ce61066070..bc082bfb52ef 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -764,14 +764,14 @@ static int pmic_gpio_get(struct gpio_chip *chip, unsigned pin)
 	return !!pad->out_value;
 }
 
-static void pmic_gpio_set(struct gpio_chip *chip, unsigned pin, int value)
+static int pmic_gpio_set(struct gpio_chip *chip, unsigned int pin, int value)
 {
 	struct pmic_gpio_state *state = gpiochip_get_data(chip);
 	unsigned long config;
 
 	config = pinconf_to_config_packed(PIN_CONFIG_OUTPUT, value);
 
-	pmic_gpio_config_set(state->ctrl, pin, &config, 1);
+	return pmic_gpio_config_set(state->ctrl, pin, &config, 1);
 }
 
 static int pmic_gpio_of_xlate(struct gpio_chip *chip,
@@ -802,7 +802,7 @@ static const struct gpio_chip pmic_gpio_gpio_template = {
 	.direction_input	= pmic_gpio_direction_input,
 	.direction_output	= pmic_gpio_direction_output,
 	.get			= pmic_gpio_get,
-	.set			= pmic_gpio_set,
+	.set_rv			= pmic_gpio_set,
 	.request		= gpiochip_generic_request,
 	.free			= gpiochip_generic_free,
 	.of_xlate		= pmic_gpio_of_xlate,

-- 
2.45.2

