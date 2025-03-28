Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D30121C18C
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168680; cv=none; b=Z4NgqxwVD55EHw8UQL0qsA4ZIajfHrg2Dx/g4Pg4FtQHGbKH68nrchZrEfM7SY2UlVkx+rxTV530aJ29YRcOoaBtYnWw0HQhR8GDd5BWQnlUASAtQ0GB0sBESfgtF8EHsCMJMw3m5rtxnf0VyIOrDERaQM/NUOO/eeqty7R+PFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168680; c=relaxed/simple;
	bh=3HQSCKKi1fwFRVm95IbU9t5Hr7ITyiskN+9xAwmrKhQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uRJtW3rbnb/SkLXadrK+7jaw8w6Tm+smwDRvBwj+Vea+lKByHbCMgrcqgL1MLHz427Sio+XDZA0CS1DSNDszdOpPMWTD3QFgV/JH9BkDiMb1I2pW/Cp4BcaqRH88UleRLLrBbtvu06dDCrh3m+Lr+zgVK4n7j61XtgQ0R5uVNOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QRqSUpIF; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QRqSUpIF"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5eb5ecf3217so3960571a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 06:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168664; x=1743773464; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c021jwV5dbsG8JoPrCRgjZmmvCnTfk3Xe/yBggRzooI=;
        b=QRqSUpIFu1zTWw6+9awS0D5ocSQe16gTsUSBPfCpqSBLIl/my2TT5lcTYfnhI360Bb
         tcz7fC7RRzhCYwM3psqfg4LLbdfeM9mGi+dDKA/N2defEO+EDN8G3t0fJNvM83oaC8fY
         e3EQgoXKSLhQYA+7oeUtHx46xhdJiG3n5pWnxP/yBGruvT2i5aa3bD4r+9h1KwECoOMd
         CzzHvPF/C0FxCHrns1S0TtV7azk1pBVuMWo3TYbiIeTgRNg9N/RAzwd1yZqAQX1djeNe
         uW53SMkIKUrLgPNB82Kj8x75szdHYOlNmfhUUCXZUF4lkrND0KTvd+Q/e1c7WGo0vHZH
         J19g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168664; x=1743773464;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c021jwV5dbsG8JoPrCRgjZmmvCnTfk3Xe/yBggRzooI=;
        b=fVxeoZJIfwx2Oz8uvZWlAwJDfZSeA1AZ4rmYIpTZ58kAkQBPGVfmrJsCcqmD/3X7NC
         RJ9dJHwZVs8Tw9d78323TUz2BlTe7p2xUcOWC3qvf/kGm+vSdZ3mDzAKjXV8SZnkpoUQ
         RzGHmA/4Agq6iE1Y1j3UMRVqypzInjKpphxRBOWW9BiWdRxRevyGXN1+XnLHhFOa290K
         vzTkpl4JbfsAeWl91yIhRKTAc6KgYEtRGKucUckQ2fOUzVKlLj8oWgn4Qrmh/XmsXijv
         bcgi8p5G1HFKcP2Aw8875hnxIyf8+azsM9l/i0x0IJLbsRu2Q19d9mxmCPl9Axgiax8r
         +VNA==
X-Forwarded-Encrypted: i=1; AJvYcCU0ClJwkPV/KS4wrqd8KpfcHU0xh990uACcQCnY3nbCRnZmwdxBFrCRrYlcioKFFL3SWiJ5cRLM2y1R/vg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqjAjMqIY0vcWn+3HjpNzo5qIaNZRzPaTX2WSwb5EjTUHN87Qb
	T54yhWaQW0WuQHQ6Yhak346H7OF/SDuZ1nw7sbbVAcQ4bwokpAZ7dYuRZHmg/Ls=
X-Gm-Gg: ASbGncsrOP/LHcW7C+jvmjRF3RWnqSBjWGm/xbJfNEppwG2t8TF9HIem71AONrs0J31
	0/b0lMcFj2IpUpWJV+fg/xQH5iESZSD1weF1e9Tnmue7KaGPtFBFSkQ7cFrxnQIebhhaPpSrbtf
	8t+dwwTrzUzz5nZpwsEuXaS/T8zG7CicP+C6knqkJFeV38/EFwTFCxGqG9/2IVIGkK43qM8cXvl
	vc9wat+b1guD9MIaa2AwYY78qMq+q82sDW+yPQZ+Xmj4C7MDurrB8SobGMrFJf4MsLsKZqff7sT
	LSFZVkPQe+DJikCPiQywekiMk4WqKwl/90eRgs79zDiqi+2cL3hAkZwyspBtnUGf4Adqz8tjOnm
	exnXEZ2r7qxOIt6VRZAma+88XfFRQ
X-Google-Smtp-Source: AGHT+IH7/8CmVUYmY+VoEFkvACO8hVh6RcnR9A51bOSMoMHldWSTPOqvDoAP3eGhyaAbNPpxpMZqQg==
X-Received: by 2002:a05:6402:5109:b0:5e6:e842:f9eb with SMTP id 4fb4d7f45d1cf-5ed8ec1e7f5mr6687208a12.21.1743168663711;
        Fri, 28 Mar 2025 06:31:03 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:31:03 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:29:05 +0000
Subject: [PATCH v2 19/32] mfd: sec: don't compare against NULL / 0 for
 errors, use !
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-19-b54dee33fb6b@linaro.org>
References: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
In-Reply-To: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
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

