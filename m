Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403F01DDA2D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 15:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749050759; cv=none; b=O01bBpwEfgCVIRcGVkcFxO7CYnwmjD+X69W6DNMea6ocnQ+ALVHdU6hLjb57u/PwgZEQUlUfU5cU3eFS15VxdF4TBKRxl1UiASXfd93/BYIfHNGlFFuka9Cv7bsbU0YUzJgsMKPV2Yg/YIedxhi4a991MhL+D2kseJt307x43Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749050759; c=relaxed/simple;
	bh=xiw3+9QQT1R6rACHzAcfRAzeIULsoWcavNAe3lOvbNo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LqSUnT4ToM9KBtBvsaIP2aPCtSVcT7b4zcRY2FMt913bieFEOQHwRIWik+xUzLP8KRDuzuRp4wsB7k1dP44wokWoGIheASxQQ+AQIcbKUCk7N34mIqtX+e84y0yL3qPB9o9KSdH4Mc8NWw6e/bLmfEOWwTgGBhf8wBrWQEKgOWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WMK8MFW/; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WMK8MFW/"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-60462e180e2so3104266a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 08:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749050753; x=1749655553; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bqcmeBNmmkfD7/7jkYs7xVbtGf9PYopW68JKLRAxWfQ=;
        b=WMK8MFW/jB1UTk5SjsLI8Pnx5mlvvop51NaNR4erhtjqe/Jln5vG1fHsZPybL3arIi
         8nMVbNBbJobJebxhxDzshVLVxLW7FxPsP/q4Ju/JJ9LEyTOgvzeN+nRxWLpm6O5BrWiB
         a786fS7jh6DHr4RE38zKFzVSlcDbnIY5hsMUhNvGJ+DOuGaJmcMuFnVekAHfKjKVvgRu
         v++2ywKlQWUlmgRb1CAlPLQptYaO7ct+3cQGviIMcyWkAvM2UxWwZ2UxjgEV53Nr5NKT
         L73Am5YQ27wD7PunsyxnnZCQ1wKprAX4XOc5xykIjA52XeiTtgkDGnYs9lKikTlrIhBu
         MDcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749050753; x=1749655553;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bqcmeBNmmkfD7/7jkYs7xVbtGf9PYopW68JKLRAxWfQ=;
        b=f16ESy1D/myug+X745ttoons91XT32jjp90EazyP9BRmJzAXmevKtOP74zTAr/rCEb
         c20odx83mi4OSt0fAysDYdJNQcRswIjOKazqUxM6dz7RSmMqpSQiO8Lnpdns02H2GFkS
         poC+59M2UWIK9wsYVDxFRLlerYvhO2lKiAwLG4qLlJ8q8nSSxYHtlfEIY4zj0fZj6II0
         +G6vNL1tTP9lUTMlj5/wnBMN2DoIfUdFPgDTMIChuvjfmWWwKGH5oV6XKGOAbY2KtjLH
         5Pn7UxuGPM0gbt0s59V7mpaX8eilpiSRmlmt3eijQAzPnBOoaz56AQ4hwGo/tGCAX7x4
         EILA==
X-Forwarded-Encrypted: i=1; AJvYcCWPrvgLQmy59hfdhP+K9h96+73EkxdthcfTZdZ3KYw4XGXojEqS7VkE83BNSQxNpCXTxu2xRhF6qC9WNnk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeJNO39Rq0Y3XUgNLKQqOgaqSq6JbHdWh1JNtNakv/b5XdDegC
	JiKwTQJeVOtQmDG5vUVC2TR/wjxudZxKSjimN4vio0rQ54hIVrMcQy0XPvLenTl4TRc=
X-Gm-Gg: ASbGncs6QX3KXQ15RmWWIKRTn9xRH7EwMOWKHa/jJJZm+53UPfTUgRf9htfHUi4+saE
	8TPsF/DJ8UhOmi5ZhUuYdTlUMGHqizj9y88KzvHam/qpyfIsxvHOEfz1FLnct/ZS1n/9qM7X3oK
	EmKphHv2VmGN0ooYzvRaN7Hxhyv9sfsBuIhE5HaZsYJ1yxzT2tbEYCnRVqUKDlJT3Kgrh55h4EM
	Q1rLuFoS+Wn0bZPp702vY0Zo3iOR2DdMUbED6LSaoA+XE9JVWePgA6mLh2aiM1jIfmS7+f/rkQ0
	qE4rJ4EBDoy5PFSezqK9C6E/WQDORErnTwOvkLmxkXg79GDuH79ueRrufJAMb15tGoz1jQBOu3V
	usbi6Z8dxZN5iGNfD9H3zvOG/pBKwlXPhkOs=
X-Google-Smtp-Source: AGHT+IGtfaNvbOgLxL63zDuI4O0A+DETos0BCLMRQDwmpSXX87hd3C1qMtwAXr3zW2EH0X8wSGXcrg==
X-Received: by 2002:a05:6402:2547:b0:604:c4fc:70c with SMTP id 4fb4d7f45d1cf-606ea5bd9c5mr3000623a12.31.1749050753425;
        Wed, 04 Jun 2025 08:25:53 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-606ed984f63sm1051640a12.58.2025.06.04.08.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 08:25:52 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 04 Jun 2025 16:25:53 +0100
Subject: [PATCH 14/17] regulator: s2mps11: refactor S2MPG10
 ::set_voltage_time() for S2MPG11 reuse
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250604-s2mpg1x-regulators-v1-14-6038740f49ae@linaro.org>
References: <20250604-s2mpg1x-regulators-v1-0-6038740f49ae@linaro.org>
In-Reply-To: <20250604-s2mpg1x-regulators-v1-0-6038740f49ae@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

The upcoming S2MPG11 support needs a similar, but different version of
::set_voltage_time(). For S2MPG10, the downwards and upwards ramps for
a rail are at different offsets at the same bit positions, while for
S2MPG11 the ramps are at the same offset at different bit positions.

Refactor the existing version slightly to allow reuse.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/regulator/s2mps11.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index 6fe6787044c40216f7a0355119981b74a8f56e58..f427895637a32f26e2960ce7c7879632f0bc2dcb 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -562,26 +562,23 @@ static int s2mpg10_regulator_buck_enable_time(struct regulator_dev *rdev)
 		+ DIV_ROUND_UP(curr_uV, s2mpg10_desc->enable_ramp_rate));
 }
 
-static int s2mpg10_regulator_buck_set_voltage_time(struct regulator_dev *rdev,
-						   int old_uV, int new_uV)
+static int s2mpg1x_regulator_buck_set_voltage_time(struct regulator_dev *rdev,
+						   int old_uV, int new_uV,
+						   unsigned int ramp_reg,
+						   unsigned int ramp_mask)
 {
-	unsigned int ramp_reg, ramp_sel, ramp_rate;
+	unsigned int ramp_sel, ramp_rate;
 	int ret;
 
 	if (old_uV == new_uV)
 		return 0;
 
-	ramp_reg = rdev->desc->ramp_reg;
-	if (old_uV > new_uV)
-		/* The downwards ramp is at a different offset. */
-		ramp_reg += S2MPG10_PMIC_DVS_RAMP4 - S2MPG10_PMIC_DVS_RAMP1;
-
 	ret = regmap_read(rdev->regmap, ramp_reg, &ramp_sel);
 	if (ret)
 		return ret;
 
-	ramp_sel &= rdev->desc->ramp_mask;
-	ramp_sel >>= ffs(rdev->desc->ramp_mask) - 1;
+	ramp_sel &= ramp_mask;
+	ramp_sel >>= ffs(ramp_mask) - 1;
 	if (ramp_sel >= rdev->desc->n_ramp_values ||
 	    !rdev->desc->ramp_delay_table)
 		return -EINVAL;
@@ -591,6 +588,21 @@ static int s2mpg10_regulator_buck_set_voltage_time(struct regulator_dev *rdev,
 	return DIV_ROUND_UP(abs(new_uV - old_uV), ramp_rate);
 }
 
+static int s2mpg10_regulator_buck_set_voltage_time(struct regulator_dev *rdev,
+						   int old_uV, int new_uV)
+{
+	unsigned int ramp_reg;
+
+	ramp_reg = rdev->desc->ramp_reg;
+	if (old_uV > new_uV)
+		/* The downwards ramp is at a different offset. */
+		ramp_reg += S2MPG10_PMIC_DVS_RAMP4 - S2MPG10_PMIC_DVS_RAMP1;
+
+	return s2mpg1x_regulator_buck_set_voltage_time(rdev, old_uV, new_uV,
+						       ramp_reg,
+						       rdev->desc->ramp_mask);
+}
+
 /*
  * We assign both, ::set_voltage_time() and ::set_voltage_time_sel(), because
  * only if the latter is != NULL, the regulator core will call neither during

-- 
2.49.0.1204.g71687c7c1d-goog

