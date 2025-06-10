Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07FE2BD03A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 12:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749560340; cv=none; b=FYJGfSMTb1NK3mqObZLpXRDRdVIvgW2RwJV3uKyws6zJRyuNSyweYcGGprrEXBO/kaVsHFmifniiXhVZE1Bt+DyYyQTpIne/m+Mysbwa8KYvkXTuyj7y1QK0xS/IjT2bi5CvksXP7d9QJLdIIHSzK5bh0PjAXf3GYDe79DbL95E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749560340; c=relaxed/simple;
	bh=oTpSgC31PAVO+aE1pNh07rDeXdPKl1jobKVG3g/UHhs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gmiyftdKFrGBdWIMMy6lpkE2DFUqIns7a9WBIM0U/+EtFodGWYEw5WRSwRhXk4UY46aK/kHDMpIsh6ldu6FFzAyJz9pWPC0sPjuKR1ginivC7rE7F6TTEEf9nvVq6nTQRak1lmrIK/cHk9R5zwAW782/bnGKNqSTjTQ0TgdQsds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=En33Eu96; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="En33Eu96"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-451d6ade159so45864815e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 05:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749560337; x=1750165137; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zrVIKmBA62tYbIrJangPWC0arTIQiP6CcWv/1Ljn/5A=;
        b=En33Eu96zcymiNC2h35W1Xal+iA+QRvuk35z/U0AcTO9tvb/MryxRirrfoQL2EcIr9
         11LvL0KfZdQYgqMs+029SghHUo5a+klA9s7JAYEP9oKPam8SoIfximmuJ8R/4/MT3nmf
         0Nm3esTDr4x6tC5xmAHKdF3CbCbVPx3V1jCSskYl//rpZtsq4+B8Iza5OmHM2nn+lw7B
         0Z8BTSro/QQkwKP3EXvTEfh3kld3tlnDQ4yhRPVBZ7B4H4t/Dss2oSkB34LhKk72L1Lp
         eMHS02MDIt+2oKSgx2ZVIr06f9iho82KffdFpZjzvPkhvcrQiVat3d0YSLjSmxxgYc1i
         VVJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749560337; x=1750165137;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zrVIKmBA62tYbIrJangPWC0arTIQiP6CcWv/1Ljn/5A=;
        b=Y+01eRWu3LsoaNrx8Dcnf++7fkisQDNix0OZgSy3JM2owbKPpA8KYhdNd5hEo2ulbr
         pUjBZCj96EbSR7BE+lVLgKElrmFtURRbGgau0rjF8BME8fn/N2f3PbT9Zmb4oul+VqKP
         0DEtwEluw48gyrdInPqpJSvJcG9JkYTAk5KGxRK8ZJXCljck7nB1UT7n5AEQF5QwOkWR
         G19KKDs+MJnicGwyUt5sk8gu+G+vEy++WLUlzFxU0NipAOM2lv4MpNzOAFgZFKfarIaT
         SSy4dTbxWZsx2gEFSy29/It4thMaAZcIjNWtGexxs3FM+bjNB5m5xNRc7gCSp6HTQCqN
         x8ZA==
X-Forwarded-Encrypted: i=1; AJvYcCUwX2zQHUCJ40azDXpDzyCZSPkNDBUG9ENkvxTny7FR+mmvX7YhfHnqBeE8UzA2ZtTrGcAp5k+HIPUHCR4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzU/gRIpuSaVWjU8QPOjId8TLQ54nu1nBYn2bMHn6eeZe5LJ96R
	m/B6pg17AcqMMjj3pgD1q4ir8pIwCvbfvw1hbYIJKBM1kTUv6hQvWZxntHuISGL0Vbw=
X-Gm-Gg: ASbGncuecsm6eHAOosnSX55qJGYtcqTjzQHlEh80fukY0L7aNcFhkcPi63C98dymAjM
	SPapOWrHxJRmw5yLShsz0jdIKmTKE4mZyRH4S7iBfkVARwW25yI8huhRhbXpLzb9WnWqwiUpyRq
	P+S1e+aDX7u5BCFVpkES/OxfERrFIgnIKQHd6SO9OVY20xgWtXPzSwnM9uJd5POzatr9OyKCMp1
	YxijIAU8v8g8oNnRagZtACYw8gYx7LtNvDW4HwMOatRGt8KbGWdpzFFikj5PDHsdsaq8DlsoPZy
	UYCGFYVFFenEEcWvZ4vIZA9Kd+IplOy3h9RAP4BXpCEjjOUu5PY9rQ==
X-Google-Smtp-Source: AGHT+IFdJ91jmVZS5b+CzAH2GS7Lj2zbRrdX46WwyeQXZY1GxVzkN/B3QcrAI/8YtMDq52owlFoArg==
X-Received: by 2002:a05:600c:1907:b0:43d:db5:7af8 with SMTP id 5b1f17b1804b1-45201414a65mr127985455e9.21.1749560336865;
        Tue, 10 Jun 2025 05:58:56 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45209ce17f9sm143671135e9.11.2025.06.10.05.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:58:56 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:58:50 +0200
Subject: [PATCH 4/4] pinctrl: lynxpoint: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpiochip-set-rv-pinctrl-intel-v1-4-d7a773ff864e@linaro.org>
References: <20250610-gpiochip-set-rv-pinctrl-intel-v1-0-d7a773ff864e@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-pinctrl-intel-v1-0-d7a773ff864e@linaro.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1747;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=pi3gOCuYMaPz/JFg+eWCQsR8jJCkFM1RNWFtAInCAqk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCwMTeUKdwG9/vVWjkQR0UDigBpG37Jv++1xL
 lBW+SFGjR6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgsDAAKCRARpy6gFHHX
 cih7D/0WJnBIQjNu7CfhOsitHfBqojk2Xrt7W0ojZT/JR/BoihIxylpdRHVhjnAICLkRF+TFS7R
 N8cNsWHs0YvmW8RXDA6hraMDhrtPxMrK5SCIStK0Al8WwaY+tNXfapYfx/A9c2ZAIQ88hW5JB3X
 ZO2TLU4+dDdYorYL0pVizwXYHpmATBxLJ5BJShkJs89VRAOOGtznAfRheKiNt+47uNa8hHB2HOZ
 V6gpfLVhrNQV3qQvpO2AyMehduOtEF3UFI0ilJoW6pdRWl/ed425LwS3fpae3pq0EsoRDlZUSOd
 1xqlmO+Lz6bHQROaHJTL7fFtVOcMFHLQx8fkcFzVY66smtmxqP7BSa5Q780wvwKlzV4wwHa5XeS
 gxs/t5VcqgQBQ7vdUlG4sbznvIVvt7LdcRaipOH1QYvGLUR3UOq0XumfUTTif90pbnrJLuXT1yb
 MhLkCRPFewQPf47JaIm6TyATI8YdTEcdve0nBboGY4riH80PaQnBJOLgPgyaLWlxavjpZP4j+RU
 hlUVhglebjCFkQwIbdeDEwYkIMHuZGEwzEU0/zYuROSletrrSh98wPa0ceUNnMNdBt0A1CcJeqz
 aipK/5PNcKz6WfgVwao5uBRPxFy5mtKi/s8Bh+jEsMNk1/yg6GEAyw5veWppvTaigiX1rzXOyp4
 OZDe7EFboNR7XZA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/intel/pinctrl-lynxpoint.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-lynxpoint.c b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
index ac5459a4c63e054ae4dd975f0a19112e4382aa99..5d4a5dd493d1bfbbc6051163758fd8a9341b43a8 100644
--- a/drivers/pinctrl/intel/pinctrl-lynxpoint.c
+++ b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
@@ -503,7 +503,7 @@ static int lp_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	return !!(ioread32(reg) & IN_LVL_BIT);
 }
 
-static void lp_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
+static int lp_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct intel_pinctrl *lg = gpiochip_get_data(chip);
 	void __iomem *reg = lp_gpio_reg(chip, offset, LP_CONFIG1);
@@ -514,6 +514,8 @@ static void lp_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 		iowrite32(ioread32(reg) | OUT_LVL_BIT, reg);
 	else
 		iowrite32(ioread32(reg) & ~OUT_LVL_BIT, reg);
+
+	return 0;
 }
 
 static int lp_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
@@ -775,7 +777,7 @@ static int lp_gpio_probe(struct platform_device *pdev)
 	gc->direction_input = lp_gpio_direction_input;
 	gc->direction_output = lp_gpio_direction_output;
 	gc->get = lp_gpio_get;
-	gc->set = lp_gpio_set;
+	gc->set_rv = lp_gpio_set;
 	gc->set_config = gpiochip_generic_config;
 	gc->get_direction = lp_gpio_get_direction;
 	gc->base = -1;

-- 
2.48.1

