Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856E224A062
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 08:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670761; cv=none; b=VExkGIKoeqFdEwA+Ofo1tbmxi2b5xIE4c5VDu8QSD24TKKslmFXri8Gm+CJ9W05dd1tfkaxDgiRvUSzMuhmEB4wvIR/iPaHHdmM/6uRkDOvWkxJMavRQUV3HkpecX3PWBWVLxfTAHtkcA/YWFymb5j29G7P0S4OtKLYq41mfhSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670761; c=relaxed/simple;
	bh=3HQSCKKi1fwFRVm95IbU9t5Hr7ITyiskN+9xAwmrKhQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qyW1FDrUP0nzkY8YjPP+f9IGQf2IdRblxCIcNNh798g2mgN8Gok9W/Va43PDui3N4RNmzMtCbJxXrNi33t5j0cAs6sZZw3KRw8hcK7uwz7usJsip4q5xYLpY+Syi8wYCJ9g32D0NhWV4B0ZX8EK3Hn60Yvr1DZCkcGFtU6NbT1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=inbk4I+r; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="inbk4I+r"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5ed1ac116e3so1184173a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 01:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670752; x=1744275552; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c021jwV5dbsG8JoPrCRgjZmmvCnTfk3Xe/yBggRzooI=;
        b=inbk4I+r/k4ykJ/Nugo2yeQ4wXSJAhl8r0L/UHumax8beFQaeSG7wW4K6eYJdwPJwZ
         Op0as6SlDG2WVK8j7/uNNJJbIaJPNoo2yCKtf/Vfl9PbHDO2KR5MRn1lEqCbQciktX61
         VLwdEtLQjuWnmdTveoWv+1/5eY/w/E8A9MK8knRh7CK7gR7dTvRGlsifjdN1mhQ3Rc/v
         OL66GgE4HbECZJwJDdT48ZKXQcD0Mp21Mn0x+xsLlROFznQ1mT4WX82yuzac997GeFdV
         geLKIEl2t2qixDmGw3o4SSPEM4mZPXUfp24PUpgVGntda4dXhgJ/87dGlGS/vq/xYcFJ
         fc4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670752; x=1744275552;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c021jwV5dbsG8JoPrCRgjZmmvCnTfk3Xe/yBggRzooI=;
        b=i2pLRQETnPmkBGh7w0RpURBdz6rgTJj6TCigLXpGgZvWvHVXru0j+J8QGZY+QpE5UW
         y+IzUj/OQig5e4FY1Lup40fAjFBO1h03B0D//Q4LKxpmz7hRJsNVtgYxdSqHWgl5irW+
         FT8pBsxQfHrDAJz7g3+q/WuTiu3jUE9p6cGfttewOR/SwypvMHQn7a7RisZWe6zg2lKh
         UDd+d+jzGIXzp9ld1ZFAcol/HzZzJEaLAAfyPpmh539ufRedMWlv1L3wJsgEG/+Y1NwN
         NGRMGUamWyC0zuaB9SJ8Ttu33Zg8au1bl1Wr0waMYp9BGFcHNdG4ZXl8+Ii8y4Fi46Xc
         e9AQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4zOzAo7luQffYxm6lSLBCMeorZYfc54sSfAVKQrCrRzFK+t3ljsQ1XycTBw85Zwka2c+q1w73yD0teMA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnT/GbM1muUbmz2jJ5/MyJGrA1Eu6rK1UDlJn9IYZXPhuN15wJ
	10rPTttVWrG6CZwyIKpZqyT4On1ELwVDa78tERZZnCVsqGfT15r6BPEFofb3ItI=
X-Gm-Gg: ASbGncuyuFPFwZFIUGMMJrIGvJwzR9MTOgWJFb/H2hVs6H6tmEfhgJKABI46Zyccm9W
	1BIFRB8tTgWMdO4+1a1dhjsJBv+K+MD/FIVx+HTY8bg0p/x/RJEtxOlxYO/kgEWNCqKkPD2+dmt
	KGWOG1/GApNtc3HN3IbLDUas3fOEETfVrllkz2TKLNJ7F9RkmjA1jJfV3Xm1WUvJZovWsDkk67m
	e8xWhUn2qwHVCCG9YB/DPyiQ3pe3b+eOSkEmWEvEcqGthA8uvu9RkYk4nrI3exdK57WGv0sKndL
	r66upLPvda1I7dXNIoJSyd5N8iImMHfVc7Wc9lT42WaQFnY69dakVYYr8U1E8U4YkRvNNYnSgHy
	+sQBZhpCAHRs93pUcc9HGG9hVUygoz1WpSKSBVws=
X-Google-Smtp-Source: AGHT+IHCv1y/iOD6tATf8l6JbAVP7nosxikaub6pMGAtowLVbGuj8LVxbHPFWCZvGPjo74E5dX1Kfg==
X-Received: by 2002:a05:6402:90e:b0:5e8:c0a7:4244 with SMTP id 4fb4d7f45d1cf-5f08716b5edmr1415400a12.9.1743670751910;
        Thu, 03 Apr 2025 01:59:11 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:11 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:11 +0100
Subject: [PATCH v3 19/32] mfd: sec: don't compare against NULL / 0 for
 errors, use !
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-19-b542b3505e68@linaro.org>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
In-Reply-To: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Follow general style and use if (!arg) instead of comparing against
NULL.

While at it, drop a useless init in sec-irq.c.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c | 2 +-
 drivers/mfd/sec-irq.c    | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index 4871492548f5efde4248b5b3db74045ec8c9d676..55edeb0f73ff4643f23b9759b115658d3bf03e9a 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -164,7 +164,7 @@ int sec_pmic_probe(struct device *dev, int device_type, unsigned int irq,
 	int ret, num_sec_devs;
 
 	sec_pmic = devm_kzalloc(dev, sizeof(struct sec_pmic_dev), GFP_KERNEL);
-	if (sec_pmic == NULL)
+	if (!sec_pmic)
 		return -ENOMEM;
 
 	dev_set_drvdata(dev, sec_pmic);
diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index c4db58813059f07372679223ec570ed07f52cd73..5cd9667a21e9e8b052b2ef0b5d2991369bffe8bb 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -448,8 +448,8 @@ static const struct regmap_irq_chip s5m8767_irq_chip = {
 
 int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 {
-	int ret = 0;
 	const struct regmap_irq_chip *sec_irq_chip;
+	int ret;
 
 	switch (sec_pmic->device_type) {
 	case S5M8767X:
@@ -496,7 +496,7 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 	ret = devm_regmap_add_irq_chip(sec_pmic->dev, sec_pmic->regmap_pmic,
 				       sec_pmic->irq, IRQF_ONESHOT,
 				       0, sec_irq_chip, &sec_pmic->irq_data);
-	if (ret != 0)
+	if (ret)
 		return dev_err_probe(sec_pmic->dev, ret,
 				     "Failed to add %s IRQ chip\n",
 				     sec_irq_chip->name);

-- 
2.49.0.472.ge94155a9ec-goog

